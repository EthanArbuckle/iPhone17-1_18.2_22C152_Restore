@interface CACSettingsController
- (BOOL)_languageMatchesSystem;
- (BOOL)_shouldShowSpinner;
- (CACLanguageAssetManager)assetManager;
- (CACSettingsController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_updatedDownloadString;
- (id)alwaysShowOverlaySummary:(id)a3;
- (id)attentionAwareActionIsSleepWake;
- (id)commandAndControlEnabled:(id)a3;
- (id)getCommandAndControlFooterText;
- (id)getCommandAndControlFooterTextLearnMore;
- (id)languageSummary:(id)a3;
- (id)playSoundEnabled:(id)a3;
- (id)showTextBannerEnabled:(id)a3;
- (id)specifiers;
- (id)userHintsEnabled:(id)a3;
- (unint64_t)languageModelStatus;
- (void)_fetchInstallationStatus;
- (void)_showOverviewWithStyle:(unint64_t)a3;
- (void)_tipLoaded:(id)a3;
- (void)clearUserHintsHistory:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)launchCommandAndControlOnboarding;
- (void)presentLanguageSelection;
- (void)setAssetManager:(id)a3;
- (void)setAttentionAwareActionIsSleepWakeEnabled:(id)a3 specifier:(id)a4;
- (void)setCommandAndControlEnabled:(id)a3 specifier:(id)a4;
- (void)setLanguageModelStatus:(unint64_t)a3;
- (void)setPlaySoundEnabled:(id)a3 specifier:(id)a4;
- (void)setShowTextBannerEnabled:(id)a3 specifier:(id)a4;
- (void)setUserHintsEnabled:(id)a3 specifier:(id)a4;
- (void)setUserHintsForCommandSuggestionsEnabled:(id)a3 specifier:(id)a4;
- (void)setUserHintsForNextStepSuggestionsEnabled:(id)a3 specifier:(id)a4;
- (void)setupCommandAndControl;
- (void)showAboutDonation;
- (void)showDonationModalView;
- (void)showOverview;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CACSettingsController

- (CACSettingsController)init
{
  v18.receiver = self;
  v18.super_class = (Class)CACSettingsController;
  v2 = [(CACSettingsController *)&v18 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_commandAndControlPreferenceDidChange:" name:kAXSCommandAndControlEnabledNotification object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_tipLoaded:" name:@"AXTipLoaded" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_D330, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_D330, @"NotificationVocabularyEntriesSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)sub_D330, @"CACNotificationOverlayFadingSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)sub_D330, @"CACNotificationGridOverlaySettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)sub_D330, @"CACNotificationAttentionBasedSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v2, (CFNotificationCallback)sub_D330, @"CACNotificationAssetDownloadProgressChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)sub_D330, @"CACNotificationAssetDownloadProgressErrorOccured", 0, (CFNotificationSuspensionBehavior)1028);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_D330, @"CACNotificationLanguageChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)sub_D330, @"CACNotificationAudioDonationSettingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
    v14 = +[CACLanguageAssetManager sharedManager];
    [v14 registerForCallback];

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.CommandAndControl.assetManagementQueue", 0);
    languageModelStatusQueue = v2->_languageModelStatusQueue;
    v2->_languageModelStatusQueue = (OS_dispatch_queue *)v15;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"NotificationVocabularyEntriesSettingsChanged", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"CACNotificationOverlayFadingSettingsChanged", 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"CACNotificationGridOverlaySettingsChanged", 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, @"CACNotificationAttentionBasedSettingsChanged", 0);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, @"CACNotificationAssetDownloadProgressChanged", 0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, @"CACNotificationAssetDownloadProgressErrorOccured", 0);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v10, self, @"CACNotificationLanguageChanged", 0);
  v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v11, self, @"CACNotificationAudioDonationSettingsChanged", 0);
  v12.receiver = self;
  v12.super_class = (Class)CACSettingsController;
  [(CACSettingsController *)&v12 dealloc];
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v64 = OBJC_IVAR___PSListController__specifiers;
    v4 = [(CACSettingsController *)v2 loadSpecifiersFromPlistName:@"CommandAndControlSettings" target:v2];
    v5 = +[CACPreferences sharedPreferences];
    BOOL v6 = ([v5 didShowOnboarding] & 1) != 0 || _AXSCommandAndControlEnabled() != 0;

    int v63 = _AXSAttentionAwarenessFeaturesEnabled();
    if ([v4 count])
    {
      unint64_t v7 = 0;
      uint64_t v66 = PSIDKey;
      uint64_t v61 = PSEnabledKey;
      uint64_t v68 = PSFooterTextGroupKey;
      uint64_t v62 = PSCellClassKey;
      uint64_t v72 = PSFooterHyperlinkViewTitleKey;
      uint64_t v73 = PSFooterCellClassGroupKey;
      uint64_t v70 = PSFooterHyperlinkViewTargetKey;
      uint64_t v71 = PSFooterHyperlinkViewLinkRangeKey;
      uint64_t v69 = PSFooterHyperlinkViewActionKey;
      v65 = v2;
      BOOL v74 = v6;
      v67 = v4;
      do
      {
        v8 = [v4 objectAtIndex:v7];
        v9 = [v8 identifier];
        if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_FOOTER"])
        {
          if (v6)
          {
            v10 = [(CACSettingsController *)v2 _updatedDownloadString];
            v11 = [(CACSettingsController *)v2 getCommandAndControlFooterTextLearnMore];
            objc_super v12 = settingsLocString(@"LEARN_MORE", @"CommandAndControlSettings");
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if ([v10 length])
            {
              dispatch_queue_t v15 = settingsLocString(@"DOWNLOAD_FORMAT", @"CommandAndControlSettings");
              v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13, v10);
            }
            v16 = (objc_class *)objc_opt_class();
            v17 = NSStringFromClass(v16);
            [v8 setProperty:v17 forKey:v73];

            [v8 setProperty:v14 forKey:v72];
            v81.location = (NSUInteger)[v14 rangeOfString:v12];
            objc_super v18 = NSStringFromRange(v81);
            [v8 setProperty:v18 forKey:v71];

            v19 = +[NSValue valueWithNonretainedObject:v65];
            [v8 setProperty:v19 forKey:v70];

            v20 = NSStringFromSelector("showOverview");
            [v8 setProperty:v20 forKey:v69];

            v2 = v65;
            v4 = v67;
            BOOL v6 = v74;
          }
          else
          {
            v10 = [(CACSettingsController *)v2 getCommandAndControlFooterText];
            [v8 setProperty:v10 forKey:v68];
          }
        }
        else
        {
          if ((([v9 isEqualToString:@"COMMAND_AND_CONTROL_FEATURE_SWITCH"] ^ 1 | v6) & 1) == 0)
          {
            v27 = settingsLocString(@"SETUP_COMMAND_AND_CONTROL", @"CommandAndControlSettings");
            v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:v2 set:0 get:0 detail:0 cell:13 edit:0];

            [v28 setProperty:@"SETUP_COMMAND_AND_CONTROL" forKey:v66];
            [v28 setButtonAction:"setupCommandAndControl"];
            [v4 setObject:v28 atIndexedSubscript:v7++];

            goto LABEL_32;
          }
          if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_DONATION_ON_FOOTER"])
          {
            if (_AXSAudioDonationSiriImprovementEnabled())
            {
              v21 = settingsLocString(@"COMMAND_AND_CONTROL_DONATION_ON_FOOTER_TEXT", @"CommandAndControlSettings");
              v22 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.improveastvoice"];
              v23 = v22;
              if (v22)
              {
                v24 = [v22 bundle];
                v25 = [v24 privacyFlow];
                v26 = [v25 localizedButtonTitle];
              }
              else
              {
                v26 = settingsLocString(@"COMMAND_AND_CONTROL_DONATION_ABOUT_LINK_TEXT", @"CommandAndControlSettings");
              }
              v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v26);
              v32 = (objc_class *)objc_opt_class();
              v33 = NSStringFromClass(v32);
              [v8 setProperty:v33 forKey:v73];

              [v8 setProperty:v31 forKey:v72];
              v82.location = (NSUInteger)[v31 rangeOfString:v26];
              v34 = NSStringFromRange(v82);
              [v8 setProperty:v34 forKey:v71];

              v35 = +[NSValue valueWithNonretainedObject:v2];
              [v8 setProperty:v35 forKey:v70];

              v36 = NSStringFromSelector("showAboutDonation");
              [v8 setProperty:v36 forKey:v69];

              ++v7;
              BOOL v6 = v74;
              goto LABEL_32;
            }
            goto LABEL_29;
          }
          if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_DONATION_OFF_FOOTER"]) {
            goto LABEL_29;
          }
          if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_DONATION_TipKitGroup"])
          {
            v29 = +[CACPreferences sharedPreferences];
            if ([v29 donationTipKitSeen]) {
              goto LABEL_28;
            }
            int v30 = _AXSAudioDonationSiriImprovementEnabled();

            if (v30) {
              goto LABEL_29;
            }
          }
          else
          {
            if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_DONATION_TipKit"])
            {
              v29 = +[CACPreferences sharedPreferences];
              if ([v29 donationTipKitSeen])
              {
LABEL_28:
              }
              else
              {
                int v37 = _AXSAudioDonationSiriImprovementEnabled();

                if (!v37)
                {
                  objc_initWeak(location, v2);
                  [v8 setProperty:objc_opt_class() forKey:v62];
                  v38 = settingsLocString(@"DONATION_TIP_TITLE", @"CommandAndControlSettings");
                  [v8 setProperty:v38 forKey:@"Title"];

                  v39 = settingsLocString(@"DONATION_TIP_DESCRIPTION", @"CommandAndControlSettings");
                  [v8 setProperty:v39 forKey:@"Description"];

                  v40 = settingsLocString(@"DONATION_TIP_URLTEXT", @"CommandAndControlSettings");
                  [v8 setProperty:v40 forKey:@"URLText"];

                  [v8 setProperty:&off_4FC88 forKey:@"tipType"];
                  v77[0] = _NSConcreteStackBlock;
                  v77[1] = 3221225472;
                  v77[2] = sub_DFCC;
                  v77[3] = &unk_4DBE0;
                  objc_copyWeak(&v78, location);
                  v41 = objc_retainBlock(v77);
                  [v8 setProperty:v41 forKey:@"ButtonCallback"];

                  v75[0] = _NSConcreteStackBlock;
                  v75[1] = 3221225472;
                  v75[2] = sub_E0A8;
                  v75[3] = &unk_4DBE0;
                  objc_copyWeak(&v76, location);
                  v42 = objc_retainBlock(v75);
                  [v8 setProperty:v42 forKey:@"CloseCallback"];

                  v43 = +[NSBundle bundleForClass:objc_opt_class()];
                  v44 = +[UIImage imageNamed:@"assistive-voice-icon" inBundle:v43];
                  [v8 setProperty:v44 forKey:@"Icon"];

                  [v8 setProperty:&__kCFBooleanTrue forKey:@"IconIgnoresInvertColors"];
                  ++v7;
                  objc_destroyWeak(&v76);
                  objc_destroyWeak(&v78);
                  objc_destroyWeak(location);
                  goto LABEL_32;
                }
              }
LABEL_29:
              [v4 removeObjectAtIndex:v7];
              goto LABEL_32;
            }
            if ([v9 isEqualToString:@"COMMAND_AND_CONTROL_LANGUAGE"])
            {
              [v8 setControllerLoadAction:"presentLanguageSelection"];
            }
            else if ([v9 isEqualToString:@"ATTENTION_AWARE_GROUP"])
            {
              v45 = +[UIDevice currentDevice];
              v46 = (char *)[v45 userInterfaceIdiom];
              CFStringRef v47 = @"ATTENTION_AWARE_FOOTER_TEXT_IPHONE";
              if (v46 == (unsigned char *)&def_14E30 + 1) {
                CFStringRef v47 = @"ATTENTION_AWARE_FOOTER_TEXT_IPAD";
              }
              CFStringRef v48 = @"ATTENTION_AWARE_DISABLED_FOOTER_TEXT_IPHONE";
              if (v46 == (unsigned char *)&def_14E30 + 1) {
                CFStringRef v48 = @"ATTENTION_AWARE_DISABLED_FOOTER_TEXT_IPAD";
              }
              if (v63) {
                v49 = (__CFString *)v47;
              }
              else {
                v49 = (__CFString *)v48;
              }
              v50 = settingsLocString(v49, @"CommandAndControlSettings");

              [v8 setProperty:v50 forKey:v68];
            }
            else if ([v9 isEqualToString:@"ATTENTION_AWARE_ACTION"] && !v63)
            {
              [v8 setProperty:&__kCFBooleanFalse forKey:v61];
            }
          }
        }
        ++v7;
LABEL_32:
      }
      while (v7 < (unint64_t)[v4 count]);
    }
    id v51 = [v4 count];
    if ((uint64_t)v51 >= 1)
    {
      unint64_t v52 = (unint64_t)v51;
      while (1)
      {
        unint64_t v53 = v52 - 1;
        v54 = [v4 objectAtIndex:v52 - 1];
        if (![v54 cellType]) {
          break;
        }
LABEL_61:

        unint64_t v52 = v53;
        if (v53 + 1 <= 1) {
          goto LABEL_62;
        }
      }
      if (v52 >= (unint64_t)[v4 count])
      {
        v56 = 0;
      }
      else
      {
        v55 = [v4 objectAtIndex:v52];
        v56 = v55;
        if (v55 && [v55 cellType])
        {
LABEL_60:

          goto LABEL_61;
        }
      }
      v57 = [v54 identifier];
      unsigned __int8 v58 = [v57 isEqualToString:@"COMMAND_AND_CONTROL_DONATION_ON_FOOTER"];

      if ((v58 & 1) == 0) {
        [v4 removeObjectAtIndex:v53];
      }
      goto LABEL_60;
    }
LABEL_62:
    v59 = *(void **)&v2->AXUISettingsBaseListController_opaque[v64];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v64] = v4;

    v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v64];
  }

  return v3;
}

- (id)getCommandAndControlFooterText
{
  return settingsLocString(@"COMMAND_AND_CONTROL_FOOTER_TEXT", @"CommandAndControlSettings");
}

- (id)getCommandAndControlFooterTextLearnMore
{
  return settingsLocString(@"COMMAND_AND_CONTROL_FOOTER_TEXT_LEARN_MORE", @"CommandAndControlSettings");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACSettingsController;
  [(CACSettingsController *)&v4 viewWillAppear:a3];
  [(CACSettingsController *)self reloadSpecifiers];
}

- (void)setCommandAndControlEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSCommandAndControlSetEnabled(v4);
}

- (id)commandAndControlEnabled:(id)a3
{
  uint64_t v3 = _AXSCommandAndControlEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (BOOL)_languageMatchesSystem
{
  v2 = +[NSLocale currentLocale];
  uint64_t v3 = [v2 localeIdentifier];

  id v4 = +[CACPreferences sharedPreferences];
  v5 = [v4 bestLocaleIdentifier];

  LOBYTE(v4) = +[CACLocaleUtilities isSameLangaugeFromLocaleIdentifier:v3 secondLocaleIdentifier:v5];
  return (char)v4;
}

- (void)launchCommandAndControlOnboarding
{
  if ([(CACSettingsController *)self _languageMatchesSystem]
    && +[CACLanguageAssetManager isAssetsInstalledForBestLocale])
  {
    id v10 = +[AXSpringBoardServer server];
    [v10 launchOnboardingViewService:@"voicecontrol"];
  }
  else
  {
    if ([(CACSettingsController *)self _languageMatchesSystem])
    {
      uint64_t v3 = settingsLocString(@"ONBOARDING_NO_ASSETS_TITLE", @"CommandAndControlSettings");
      id v4 = settingsLocString(@"ONBOARDING_NO_ASSETS_MESSAGE", @"CommandAndControlSettings");
      id v10 = +[UIAlertController alertControllerWithTitle:v3 message:v4 preferredStyle:1];

      v5 = settingsLocString(@"ONBOARDING_ALERT_OK", @"CommandAndControlSettings");
      BOOL v6 = &stru_4DC20;
    }
    else
    {
      unint64_t v7 = settingsLocString(@"ONBOARDING_LANGUAGE_MISMATCH_TITLE", @"CommandAndControlSettings");
      v8 = settingsLocString(@"ONBOARDING_LANGUAGE_MISMATCH_MESSAGE", @"CommandAndControlSettings");
      id v10 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];

      v5 = settingsLocString(@"ONBOARDING_ALERT_OK", @"CommandAndControlSettings");
      BOOL v6 = &stru_4DC00;
    }
    v9 = +[UIAlertAction actionWithTitle:v5 style:0 handler:v6];

    [v10 addAction:v9];
    [(CACSettingsController *)self presentViewController:v10 animated:1 completion:0];
  }
}

- (void)showDonationModalView
{
  id v3 = +[VCAudioDonationViewBridge makeViewController];
  [(CACSettingsController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)languageSummary:(id)a3
{
  id v3 = +[NSLocale currentLocale];
  id v4 = +[CACPreferences sharedPreferences];
  v5 = [v4 bestLocaleIdentifier];
  BOOL v6 = [v3 localizedStringForLocaleIdentifier:v5];
  unint64_t v7 = [v6 localizedCapitalizedString];

  return v7;
}

- (void)presentLanguageSelection
{
  id v4 = +[CACLanguageSelectionViewController defaultControllerWithStyle:1];
  id v3 = [(CACSettingsController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)_fetchInstallationStatus
{
  languageModelStatusQueue = self->_languageModelStatusQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E714;
  block[3] = &unk_4D980;
  block[4] = self;
  dispatch_async(languageModelStatusQueue, block);
}

- (unint64_t)languageModelStatus
{
  return self->_languageModelStatus;
}

- (id)_updatedDownloadString
{
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = [v3 bestLocaleIdentifier];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  BOOL v6 = +[CACLanguageAssetManager sharedManager];
  unint64_t v7 = (char *)[v6 errorStatusForLanguage:v5];

  v8 = +[CACLanguageAssetManager sharedManager];
  v9 = [v8 downloadProgressForLanguage:v5];

  int v10 = _AXSCommandAndControlEnabled();
  v11 = [v9 objectForKey:kCACDownloadProgressDictionaryKeyCompleted];
  unsigned __int8 v12 = [v11 BOOLValue];

  id v13 = [v9 objectForKey:kCACDownloadProgressDictionaryKeyTimeRemaining];
  [v13 floatValue];
  float v15 = ceilf(v14 / 60.0);

  *(float *)&double v16 = v15;
  v17 = +[NSNumber numberWithFloat:v16];
  objc_super v18 = +[NSNumberFormatter localizedStringFromNumber:v17 numberStyle:1];

  v19 = [v9 objectForKey:kCACDownloadProgressDictionaryKeyPercentage];
  [v19 floatValue];
  int v21 = v20;

  LODWORD(v22) = v21;
  v23 = +[NSNumber numberWithFloat:v22];
  v24 = +[NSNumberFormatter localizedStringFromNumber:v23 numberStyle:3];

  if (MGGetBoolAnswer()) {
    v25 = @"DOWNLOAD_INFO_WLAN";
  }
  else {
    v25 = @"DOWNLOAD_INFO_WIFI";
  }
  v26 = settingsLocString(v25, @"CommandAndControlSettings");
  v27 = CACLogGeneral();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = [(CACSettingsController *)self languageModelStatus];
    _os_log_impl(&def_14E30, v27, OS_LOG_TYPE_INFO, "Language model status: %lu", buf, 0xCu);
  }

  unint64_t v28 = [(CACSettingsController *)self languageModelStatus];
  if (!v28) {
    goto LABEL_23;
  }
  if (v28 != 1)
  {
    if (v28 == 2)
    {
      v29 = +[CACPreferences sharedPreferences];
      unsigned int v30 = [v29 didShowOnboarding];

      if (!v30) {
        goto LABEL_23;
      }
      goto LABEL_21;
    }
LABEL_22:
    _AXAssert();
    goto LABEL_23;
  }
  if (!v10)
  {
LABEL_21:
    v33 = v26;
    if (v33) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if (v7) {
    char v31 = v12;
  }
  else {
    char v31 = 1;
  }
  if ((v31 & 1) == 0)
  {
    if (v7 != (unsigned char *)&def_14E30 + 1 && v7 != (unsigned char *)&def_14E30 + 2) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ((v12 & 1) == 0)
  {
    if (v15 <= 1.0)
    {
      v32 = settingsLocString(@"DOWNLOADING_SHORT_TIME_LEFT", @"CommandAndControlSettings");
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v24, v35);
    }
    else
    {
      v32 = settingsLocString(@"DOWNLOADING_PROGRESS", @"CommandAndControlSettings");
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v24, v18);
    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v33) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_23:
  v33 = &stru_4EAE0;
LABEL_24:

  return v33;
}

- (BOOL)_shouldShowSpinner
{
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = [v3 bestLocaleIdentifier];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  BOOL v6 = +[CACLanguageAssetManager sharedManager];
  unint64_t v7 = [v6 downloadProgressForLanguage:v5];

  v8 = +[CACLanguageAssetManager sharedManager];
  id v9 = [v8 errorStatusForLanguage:v5];

  int v10 = [v7 objectForKey:kCACDownloadProgressDictionaryKeyCompleted];
  if ([v10 BOOLValue])
  {

    BOOL v11 = 0;
  }
  else
  {
    unint64_t v12 = [(CACSettingsController *)self languageModelStatus];

    BOOL v11 = 0;
    if (v12 && !v9) {
      BOOL v11 = _AXSCommandAndControlEnabled() != 0;
    }
  }

  return v11;
}

- (void)setShowTextBannerEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[CACPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setShowTextResponseUponRecognition:v5];
}

- (id)showTextBannerEnabled:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 showTextResponseUponRecognition]);

  return v4;
}

- (void)setPlaySoundEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[CACPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setPlaySoundUponRecognition:v5];
}

- (id)playSoundEnabled:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 playSoundUponRecognition]);

  return v4;
}

- (id)attentionAwareActionIsSleepWake
{
  v2 = +[CACPreferences sharedPreferences];
  id v3 = [v2 attentionAwareAction];

  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEqualToString:@"SleepAndWake"]);

  return v4;
}

- (void)setAttentionAwareActionIsSleepWakeEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  id v5 = @"None";
  if (v4) {
    id v5 = @"SleepAndWake";
  }
  id v6 = v5;
  id v7 = +[CACPreferences sharedPreferences];
  [v7 setAttentionAwareAction:v6];
}

- (id)alwaysShowOverlaySummary:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  unsigned int v4 = [v3 alwaysShowOverlayType];

  if ([v4 isEqualToString:@"NumberedElements"])
  {
    id v5 = @"OVERLAY_NUMBERS";
  }
  else if ([v4 isEqualToString:@"NamedElements"])
  {
    id v5 = @"OVERLAY_NAMES";
  }
  else if ([v4 isEqualToString:@"NumberedGrid"])
  {
    id v5 = @"OVERLAY_GRID";
  }
  else
  {
    id v5 = @"OVERLAY_NONE";
  }
  id v6 = settingsLocString(v5, @"CommandAndControlSettings");

  return v6;
}

- (id)userHintsEnabled:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  unsigned int v4 = [v3 userHintsFeatures];

  id v5 = +[CACPreferences sharedPreferences];
  unint64_t v6 = ((unint64_t)[v5 userHintsFeatures] >> 1) & 1;

  return +[NSNumber numberWithBool:v4 & v6];
}

- (void)setUserHintsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CACSettingsController *)self setUserHintsForCommandSuggestionsEnabled:v7 specifier:v6];
  [(CACSettingsController *)self setUserHintsForNextStepSuggestionsEnabled:v7 specifier:v6];
}

- (void)setUserHintsForCommandSuggestionsEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  id v6 = +[CACPreferences sharedPreferences];
  id v5 = +[CACPreferences sharedPreferences];
  objc_msgSend(v6, "setUserHintsFeatures:", (unint64_t)objc_msgSend(v5, "userHintsFeatures") & 0xFFFFFFFFFFFFFFFELL | v4);
}

- (void)setUserHintsForNextStepSuggestionsEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  id v8 = +[CACPreferences sharedPreferences];
  id v5 = +[CACPreferences sharedPreferences];
  unint64_t v6 = (unint64_t)[v5 userHintsFeatures] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v7 = 2;
  if (!v4) {
    uint64_t v7 = 0;
  }
  [v8 setUserHintsFeatures:v6 | v7];
}

- (void)clearUserHintsHistory:(id)a3 specifier:(id)a4
{
  id v5 = settingsLocString(@"USER_HINTS_CLEAR_HISTORY_CONFIRM_TITLE", @"CommandAndControlSettings");
  unint64_t v6 = settingsLocString(@"USER_HINTS_CLEAR_HISTORY_CONFIRM_DESC", @"CommandAndControlSettings");
  id v11 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  uint64_t v7 = settingsLocString(@"CANCEL", @"CommandAndControlSettings");
  id v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:&stru_4DC68];

  [v11 addAction:v8];
  id v9 = settingsLocString(@"USER_HINTS_CLEAR_HISTORY_CONFIRM_BUTTON_TITLE", @"CommandAndControlSettings");
  int v10 = +[UIAlertAction actionWithTitle:v9 style:2 handler:&stru_4DC88];

  [v11 addAction:v10];
  [(CACSettingsController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)setupCommandAndControl
{
}

- (void)showOverview
{
}

- (void)_showOverviewWithStyle:(unint64_t)a3
{
  unsigned int v4 = +[CACOnboardingIntroViewController defaultControllerWithStyle:a3];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  unint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 navigationBar];
  [v7 setShadowImage:v6];

  id v8 = [v5 navigationBar];
  [v8 setBackgroundImage:v6 forBarMetrics:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_F8A8;
  v9[3] = &unk_4D980;
  v9[4] = self;
  [(CACSettingsController *)self presentViewController:v5 animated:1 completion:v9];
}

- (void)showAboutDonation
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveastvoice"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_tipLoaded:(id)a3
{
  if (!self->_tipLoaded) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CACSettingsController *)self specifierForIndexPath:v7];
  id v9 = [v8 propertyForKey:PSCellClassKey];
  unsigned int v10 = [v9 isEqual:objc_opt_class()];

  if (v10)
  {
    double tipHeight = self->_tipHeight;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CACSettingsController;
    [(CACSettingsController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double tipHeight = v12;
  }

  return tipHeight;
}

- (void)setLanguageModelStatus:(unint64_t)a3
{
  self->_languageModelStatus = a3;
}

- (CACLanguageAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_languageModelStatusQueue, 0);
}

@end