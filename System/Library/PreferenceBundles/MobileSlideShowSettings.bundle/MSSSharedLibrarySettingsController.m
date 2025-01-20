@interface MSSSharedLibrarySettingsController
- (MSSSharedLibrarySettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXSharedLibraryStatusProvider)statusProvider;
- (id)_subtitleForParticipantSpecifier:(id)a3;
- (id)deepLinkURL;
- (id)deletionNotificationEnabledSpecifier:(id)a3;
- (id)paneTitleLocalizedResource;
- (id)pathComponentsLocalizedResource;
- (id)specifiers;
- (id)valueForCameraSpecifier:(id)a3;
- (id)valueForSuggestionsSpecifier:(id)a3;
- (void)_beginObservingPhotosAppPrefs;
- (void)_didSelectAddParticipantSpecifier:(id)a3;
- (void)_didSelectExitLibrarySpecifier:(id)a3;
- (void)_didSelectParticipantSpecifier:(id)a3;
- (void)_didSelectSuggestionsSpecifier:(id)a3;
- (void)_handleDidAddParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)_preferencesDidChange;
- (void)_stopObservingPhotosAppPrefs;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4;
- (void)photoRecipientViewControllerDidCancel:(id)a3;
- (void)reloadSpecifiers;
- (void)setDeletionNotificationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setParentController:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSSSharedLibrarySettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_currentParticipantActionCoordinator, 0);
  objc_storeStrong((id *)&self->_addParticipantImage, 0);
  objc_storeStrong((id *)&self->_defaultParticipantImage, 0);
  objc_storeStrong((id *)&self->_participantImageCache, 0);

  objc_storeStrong((id *)&self->_participantSpecifiers, 0);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (id)pathComponentsLocalizedResource
{
  v3 = +[MSSSettingsUtilities photosMainPaneLocalizedResource];
  v7[0] = v3;
  v4 = [(MSSSharedLibrarySettingsController *)self paneTitleLocalizedResource];
  v7[1] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (id)deepLinkURL
{
  v2 = +[NSString stringWithFormat:@"%@/%@/%@", @"settings-navigation://com.apple.Settings.Apps", @"com.apple.mobileslideshow", @"SharedStreamsTitleGroup"];
  v3 = +[NSURL URLWithString:v2];

  return v3;
}

- (id)paneTitleLocalizedResource
{
  return +[MSSSettingsUtilities sharedLibraryPaneLocalizedResource];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSSSharedLibrarySettingsController;
  [(MSSSharedLibrarySettingsController *)&v7 viewDidAppear:a3];
  v4 = [(MSSSharedLibrarySettingsController *)self paneTitleLocalizedResource];
  v5 = [(MSSSharedLibrarySettingsController *)self pathComponentsLocalizedResource];
  v6 = [(MSSSharedLibrarySettingsController *)self deepLinkURL];
  [(MSSSharedLibrarySettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobileslideshow" title:v4 localizedNavigationComponents:v5 deepLink:v6];
}

- (void)_stopObservingPhotosAppPrefs
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow.PreferenceChanged", 0);
}

- (void)_beginObservingPhotosAppPrefs
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_17A8C, @"com.apple.mobileslideshow.PreferenceChanged", 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_preferencesDidChange
{
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
}

- (void)_handleDidAddParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(MSSSharedLibrarySettingsController *)self statusProvider];
  v14 = [v13 sharedLibrary];

  if (v14)
  {
    v15 = +[PXViewControllerPresenter defaultPresenterWithViewController:self];
    if ([v14 isInLocalMode])
    {
      PXSharedLibraryHandleInvitationForLocalMode();
    }
    else if (v7)
    {
      PXSharedLibrarySendInvitation();
    }
    else
    {
      v17 = [v14 sourceLibraryInfo];
      PXHandleErrorAddingParticipants();
    }
  }
  else
  {
    v16 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Preferences: No Shared Library available after adding participants", v18, 2u);
    }
  }
}

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v22 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        id v12 = [v11 contact];
        v13 = [v11 emailAddressString];
        v14 = [v11 phoneNumberString];
        if ([v13 length])
        {
          v15 = v5;
          v16 = v13;
LABEL_10:
          [v15 addObject:v16];
          goto LABEL_11;
        }
        if ([v14 length])
        {
          v15 = v22;
          v16 = v14;
          goto LABEL_10;
        }
        v17 = PLSharedLibraryGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v11;
          __int16 v32 = 2112;
          v33 = v12;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "No invite address string for recipient: %@ contact: %@", buf, 0x16u);
        }

LABEL_11:
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v18 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
      id v8 = v18;
    }
    while (v18);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_17F40;
  v23[3] = &unk_28FB8;
  v23[4] = self;
  id v24 = v5;
  id v25 = v22;
  id v19 = v22;
  id v20 = v5;
  [(MSSSharedLibrarySettingsController *)self dismissViewControllerAnimated:1 completion:v23];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if (off_2F548 != a5)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MSSSharedLibrarySettingsController.m" lineNumber:303 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x30) != 0)
  {
    id v13 = v9;
    id v10 = [(MSSSharedLibrarySettingsController *)self statusProvider];
    int ShouldDisplaySettings = PXSharedLibraryShouldDisplaySettings();

    id v9 = v13;
    if (ShouldDisplaySettings)
    {
      [(MSSSharedLibrarySettingsController *)self reloadSpecifiers];
      id v9 = v13;
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSSSharedLibrarySettingsController;
  [(MSSSharedLibrarySettingsController *)&v5 viewWillAppear:a3];
  id v4 = [(MSSSharedLibrarySettingsController *)self navigationItem];
  [v4 setBackButtonDisplayMode:0];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [v8 specifier];
  if (v9)
  {
    PXSizeMakeSquare();
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v6, "px_screenScale");
    double v15 = v14;
    BOOL v16 = [v6 effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1;
    v17 = [v9 objectForKeyedSubscript:@"SharedLibraryParticipant"];
    id v18 = [v17 imageProvider];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_183E8;
    v19[3] = &unk_28F68;
    id v20 = v9;
    id v21 = v8;
    id v22 = v7;
    objc_msgSend(v18, "requestImageWithTargetSize:displayScale:isRTL:completionHandler:", v16, v19, v11, v13, v15);
  }
}

- (void)reloadSpecifiers
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  participantImageCache = self->_participantImageCache;
  self->_participantImageCache = v3;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v5 = self;
  id obj = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = PSIconImageKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v12 = [v11 objectForKeyedSubscript:@"SharedLibraryParticipant"];
        if (v12)
        {
          double v13 = [v11 objectForKeyedSubscript:v9];
          double v14 = v5->_participantImageCache;
          double v15 = [v12 localIdentifier];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v18.receiver = v5;
  v18.super_class = (Class)MSSSharedLibrarySettingsController;
  [(MSSSharedLibrarySettingsController *)&v18 reloadSpecifiers];
  BOOL v16 = v5->_participantImageCache;
  v5->_participantImageCache = 0;
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v47 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [(MSSSharedLibrarySettingsController *)v2 statusProvider];
    objc_super v5 = objc_opt_new();
    v58 = v4;
    id v6 = [v4 sharedLibrary];
    v46 = PXLocalizedSharedLibraryString();
    id v7 = +[PSSpecifier groupSpecifierWithID:name:](PSSpecifier, "groupSpecifierWithID:name:", @"SharedLibraryParticipantsGroup");
    v48 = v5;
    [v5 addObject:v7];

    v59 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v49 = v6;
    id obj = [v6 participants];
    id v8 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    v60 = v2;
    if (v8)
    {
      id v9 = v8;
      uint64_t v56 = *(void *)v62;
      uint64_t v54 = PSAllowMultilineTitleKey;
      uint64_t v52 = PSCellClassKey;
      uint64_t v10 = PSIconImageKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v62 != v56) {
            objc_enumerationMutation(obj);
          }
          double v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          double v13 = PXSharedLibraryAnnotatedDisplayNameForParticipant();
          double v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:v2 set:0 get:"_subtitleForParticipantSpecifier:" detail:0 cell:2 edit:0];
          [v14 setControllerLoadAction:"_didSelectParticipantSpecifier:"];
          [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:v54];
          [v14 setObject:objc_opt_class() forKeyedSubscript:v52];
          participantImageCache = v2->_participantImageCache;
          BOOL v16 = [v12 localIdentifier];
          v17 = [(NSMutableDictionary *)participantImageCache objectForKeyedSubscript:v16];
          defaultParticipantImage = v17;
          if (!v17) {
            defaultParticipantImage = v60->_defaultParticipantImage;
          }
          [v14 setObject:defaultParticipantImage forKeyedSubscript:v10];

          [v14 setObject:v12 forKeyedSubscript:@"SharedLibraryParticipant"];
          [v59 addObject:v14];

          v2 = v60;
        }
        id v9 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v9);
    }

    [v48 addObjectsFromArray:v59];
    if ([v49 canEditParticipants])
    {
      long long v19 = PXLocalizedSharedLibraryString();
      long long v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
      [v20 setButtonAction:"_didSelectAddParticipantSpecifier:"];
      uint64_t v21 = PSAllowMultilineTitleKey;
      [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
      [v20 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
      [v20 setObject:v2->_addParticipantImage forKeyedSubscript:PSIconImageKey];
      long long v22 = [v49 participants];
      id v23 = [v22 count];
      id v24 = +[NSNumber numberWithInt:(unint64_t)v23 <= PXSharedLibraryParticipantsMaxCount];
      [v20 setObject:v24 forKeyedSubscript:PSEnabledKey];

      [v48 addObject:v20];
    }
    else
    {
      uint64_t v21 = PSAllowMultilineTitleKey;
    }
    v57 = +[PSSpecifier groupSpecifierWithID:@"SharedLibraryOptionsGroup"];
    objc_msgSend(v48, "addObject:");
    v55 = PXLocalizedSharedLibraryString();
    id v25 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v25 setControllerLoadAction:"_didSelectSuggestionsSpecifier:"];
    [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:v21];
    [v48 addObject:v25];
    v53 = PXLocalizedSharedLibraryString();
    long long v26 = +[PSSpecifier preferenceSpecifierNamed:v53 target:v2 set:0 get:"valueForCameraSpecifier:" detail:objc_opt_class() cell:2 edit:0];
    [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:v21];
    [v48 addObject:v26];
    id obja = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.mobileslideshow"];
    v45 = [obja notificationSettings];
    long long v27 = (char *)[v45 authorizationStatus];
    +[PSSpecifier groupSpecifierWithID:@"SharedLibraryDeletionNotificationGroup"];
    v29 = long long v28 = v2;
    PXLocalizedSharedLibraryString();
    if (v27 == (unsigned char *)&dword_0 + 1) {
      v30 = {;
    }
      uint64_t v31 = PSFooterTextGroupKey;
      [v29 setObject:v30 forKeyedSubscript:PSFooterTextGroupKey];

      [v48 addObject:v29];
      __int16 v32 = PXLocalizedSharedLibraryString();
      v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:v28 set:0 get:0 detail:0 cell:6 edit:0];
      [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:v21];
      uint64_t v34 = PSEnabledKey;
      v35 = &__kCFBooleanFalse;
      v36 = v33;
    }
    else {
      v37 = {;
    }
      uint64_t v31 = PSFooterTextGroupKey;
      [v29 setObject:v37 forKeyedSubscript:PSFooterTextGroupKey];

      [v48 addObject:v29];
      __int16 v32 = PXLocalizedSharedLibraryString();
      v36 = +[PSSpecifier preferenceSpecifierNamed:v32 target:v28 set:"setDeletionNotificationEnabled:forSpecifier:" get:"deletionNotificationEnabledSpecifier:" detail:0 cell:6 edit:0];
      v33 = v36;
      v35 = &__kCFBooleanTrue;
      uint64_t v34 = v21;
    }
    [v36 setObject:v35 forKeyedSubscript:v34];
    [v48 addObject:v33];

    v38 = +[PSSpecifier groupSpecifierWithID:@"SharedLibraryExitGroup"];
    if (PLHasInternalUI() && [v49 isInLocalMode])
    {
      if (_os_feature_enabled_impl()) {
        CFStringRef v39 = @"INTERNAL: This Shared Library was created with LocalMode and does not actually sync or publish any changes to the server. Please delete this Shared Library, enable Goldilocks FF and start over with a new one if you'd like to use the real feature";
      }
      else {
        CFStringRef v39 = @"INTERNAL: This Shared Library was created with LocalMode and does not actually sync or publish any changes to the server. Please delete this Shared Library and start over with a new one if you'd like to use the real feature";
      }
      [v38 setObject:v39 forKeyedSubscript:v31];
    }
    [v48 addObject:v38];
    v40 = PXSharedLibraryExitButtonTitle();
    v41 = +[PSSpecifier deleteButtonSpecifierWithName:v40 target:v60 action:"_didSelectExitLibrarySpecifier:"];

    [v41 setObject:&off_2B738 forKeyedSubscript:PSAlignmentKey];
    [v48 addObject:v41];
    id v42 = [v48 copy];
    v43 = *(void **)&v60->PSListController_opaque[v47];
    *(void *)&v60->PSListController_opaque[v47] = v42;

    v3 = *(void **)&v60->PSListController_opaque[v47];
  }

  return v3;
}

- (id)valueForCameraSpecifier:(id)a3
{
  int IsCameraSharingEnabled = PXPreferencesIsCameraSharingEnabled();

  return SettingsBaseStringForSwitchValue(IsCameraSharingEnabled);
}

- (id)deletionNotificationEnabledSpecifier:(id)a3
{
  uint64_t IsSharedLibraryDeletionNotificationEnabled = PXPreferencesIsSharedLibraryDeletionNotificationEnabled();

  return +[NSNumber numberWithBool:IsSharedLibraryDeletionNotificationEnabled];
}

- (void)setDeletionNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _PXPreferencesSetSharedLibraryDeletionNotificationEnabled(v4);
}

- (id)valueForSuggestionsSpecifier:(id)a3
{
  int IsSharedLibrarySuggestionsEnabled = PXPreferencesIsSharedLibrarySuggestionsEnabled();

  return SettingsBaseStringForSwitchValue(IsSharedLibrarySuggestionsEnabled);
}

- (void)_didSelectExitLibrarySpecifier:(id)a3
{
  id v5 = +[PXViewControllerPresenter defaultPresenterWithViewController:self];
  id v4 = [(MSSSharedLibrarySettingsController *)self statusProvider];
  PXSharedLibraryExitSharedLibraryOrPreview();
}

- (void)_didSelectSuggestionsSpecifier:(id)a3
{
  id v4 = objc_alloc((Class)PXSharedLibrarySuggestionsSettingsViewController);
  id v5 = [(MSSSharedLibrarySettingsController *)self statusProvider];
  id v7 = [v4 initWithSharedLibraryStatusProvider:v5];

  id v6 = PXLocalizedSharedLibraryString();
  [v7 setTitle:v6];

  [(MSSSharedLibrarySettingsController *)self showController:v7];
}

- (void)_didSelectAddParticipantSpecifier:(id)a3
{
  id v4 = [(MSSSharedLibrarySettingsController *)self statusProvider];
  id v14 = [v4 sharedLibrary];

  id v5 = PXLocalizedSharedLibraryString();
  id v6 = PXLocalizedSharedLibraryString();
  id v7 = [v14 participants];
  id v8 = PXMap();

  uint64_t v9 = PXSharedLibraryParticipantsMaxCount;
  uint64_t v10 = [v14 participants];
  uint64_t v11 = v9 + ~(unint64_t)[v10 count];

  double v12 = +[NSSet setWithArray:v8];
  double v13 = +[PXPhotoRecipientViewController recipientPickerViewControllerWithTitle:v5 doneLabel:0 toLabel:v6 usedAddresses:v12 maxRecipients:v11 delegate:self];

  [(MSSSharedLibrarySettingsController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)_didSelectParticipantSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"SharedLibraryParticipant"];
  if (v5)
  {
    id v6 = objc_alloc((Class)PXSharedLibraryParticipantActionCoordinator);
    id v7 = [(MSSSharedLibrarySettingsController *)self statusProvider];
    id v8 = [v7 sharedLibrary];
    uint64_t v9 = (PXSharedLibraryParticipantActionCoordinator *)[v6 initWithParticipant:v5 sharedLibrary:v8];
    currentParticipantActionCoordinator = self->_currentParticipantActionCoordinator;
    self->_currentParticipantActionCoordinator = v9;

    uint64_t v11 = [(MSSSharedLibrarySettingsController *)self navigationItem];
    [v11 setBackButtonDisplayMode:1];

    double v12 = [(PXSharedLibraryParticipantActionCoordinator *)self->_currentParticipantActionCoordinator actionViewController];
    [(MSSSharedLibrarySettingsController *)self showController:v12];
  }
  else
  {
    double v13 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "No participant available in specifier %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)_subtitleForParticipantSpecifier:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"SharedLibraryParticipant"];
  if (v3)
  {
    id v4 = PXSharedLibrarySettingsSubtitleForParticipant();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setParentController:(id)a3
{
  id v5 = a3;
  id v6 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id WeakRetained = objc_loadWeakRetained(v6);

  if (WeakRetained != v5)
  {
    id v8 = objc_loadWeakRetained(v6);

    if (v8)
    {
      [(PXSharedLibraryStatusProvider *)self->_statusProvider unregisterChangeObserver:self context:off_2F548];
      statusProvider = self->_statusProvider;
      self->_statusProvider = 0;
    }
    v20.receiver = self;
    v20.super_class = (Class)MSSSharedLibrarySettingsController;
    [(MSSSharedLibrarySettingsController *)&v20 setParentController:v5];
    id v10 = objc_loadWeakRetained(v6);

    if (v10)
    {
      id v11 = v5;
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_7:
          double v12 = [v11 systemPhotoLibrary];
          double v13 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v12];
          int v14 = self->_statusProvider;
          self->_statusProvider = v13;

          [(PXSharedLibraryStatusProvider *)self->_statusProvider registerChangeObserver:self context:off_2F548];
          goto LABEL_8;
        }
        id v15 = +[NSAssertionHandler currentHandler];
        objc_super v18 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v18);
        long long v19 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
        [v15 handleFailureInMethod:a2, self, @"MSSSharedLibrarySettingsController.m", 101, @"%@ should be an instance inheriting from %@, but it is %@", @"parentController", v17, v19 object file lineNumber description];
      }
      else
      {
        id v15 = +[NSAssertionHandler currentHandler];
        BOOL v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        [v15 handleFailureInMethod:a2, self, @"MSSSharedLibrarySettingsController.m", 101, @"%@ should be an instance inheriting from %@, but it is nil", @"parentController", v17 object file lineNumber description];
      }

      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)dealloc
{
  [(MSSSharedLibrarySettingsController *)self _stopObservingPhotosAppPrefs];
  v3.receiver = self;
  v3.super_class = (Class)MSSSharedLibrarySettingsController;
  [(MSSSharedLibrarySettingsController *)&v3 dealloc];
}

- (MSSSharedLibrarySettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)MSSSharedLibrarySettingsController;
  id v4 = [(MSSSharedLibrarySettingsController *)&v22 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = PXLocalizedSharedLibraryString();
    [(MSSSharedLibrarySettingsController *)v4 setTitle:v5];

    id v6 = +[UIImageSymbolConfiguration configurationWithPointSize:38.0];
    id v7 = +[UIColor systemGrayColor];
    id v8 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v7];

    uint64_t v9 = [v6 configurationByApplyingConfiguration:v8];
    uint64_t v10 = +[UIImage systemImageNamed:@"person.circle.fill" withConfiguration:v9];
    defaultParticipantImage = v4->_defaultParticipantImage;
    v4->_defaultParticipantImage = (UIImage *)v10;

    double v12 = +[UIColor tintColor];
    v23[0] = v12;
    double v13 = +[UIColor systemFillColor];
    v23[1] = v13;
    int v14 = +[NSArray arrayWithObjects:v23 count:2];
    id v15 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v14];

    BOOL v16 = +[UIImageSymbolConfiguration configurationWithWeight:2];
    v17 = [v6 configurationByApplyingConfiguration:v15];
    objc_super v18 = [v17 configurationByApplyingConfiguration:v16];

    uint64_t v19 = +[UIImage systemImageNamed:@"plus.circle.fill" withConfiguration:v18];
    addParticipantImage = v4->_addParticipantImage;
    v4->_addParticipantImage = (UIImage *)v19;

    [(MSSSharedLibrarySettingsController *)v4 _beginObservingPhotosAppPrefs];
  }
  return v4;
}

@end