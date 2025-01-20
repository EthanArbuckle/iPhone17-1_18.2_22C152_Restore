@interface AccessoryDeveloperSettingsController
- (id)_carPlayLogsFolderURL;
- (id)_carplayLibraryURL;
- (id)_overrideAssetDestinationURLForAssetFolder:(id)a3;
- (id)airPlayCarPlayReceiverLogsForSpecifier:(id)a3;
- (id)alwaysAcceptHeadUnitPairingForSpecifier:(id)a3;
- (id)getAlwaysUpdateAssetForSpecifier:(id)a3;
- (id)getFerriteEnabledForSpecifier:(id)a3;
- (id)headUnitPairingPreviewEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (void)_didSelectLogArchiveSpecifier:(id)a3;
- (void)_enumerateCurrentAccessoryLogsUsingBlock:(id)a3;
- (void)_enumerateCurrentOverrideAssetsUsingBlock:(id)a3;
- (void)dealloc;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)initDefaultsKeys;
- (void)presentThemePickerFromSpecifier:(id)a3;
- (void)removeAllAssetsForSpecifier:(id)a3;
- (void)resetUserAppearancePrefs:(id)a3;
- (void)setAirPlayCarPlayReceiverLogs:(id)a3 specifier:(id)a4;
- (void)setAlwaysAcceptHeadUnitPairing:(id)a3 specifier:(id)a4;
- (void)setAlwaysUpdateAsset:(id)a3 specifier:(id)a4;
- (void)setDefaultKeyIfNotPresent:(__CFString *)a3 value:(__CFString *)a4 applicationID:(__CFString *)a5;
- (void)setFerriteEnabled:(id)a3 specifier:(id)a4;
- (void)setHeadUnitPairingPreviewEnabled:(id)a3 specifier:(id)a4;
@end

@implementation AccessoryDeveloperSettingsController

- (void)_didSelectLogArchiveSpecifier:(id)a3
{
  id v4 = [a3 userInfo];
  if (v4)
  {
    id v5 = v4;
    -[AccessoryDeveloperSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1), 0), 1, &stru_8488);
  }
}

- (void)_enumerateCurrentAccessoryLogsUsingBlock:(id)a3
{
  v19[0] = NSURLNameKey;
  v19[1] = NSURLIsDirectoryKey;
  id v4 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") enumeratorAtURL:[(AccessoryDeveloperSettingsController *)self _carPlayLogsFolderURL] includingPropertiesForKeys:+[NSArray arrayWithObjects:v19 count:2] options:4 errorHandler:&stru_8468];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v13 = 0;
        [v10 getResourceValue:&v13 forKey:NSURLIsDirectoryKey error:0];
        id v12 = 0;
        [v10 getResourceValue:&v12 forKey:NSURLNameKey error:0];
        if (v12)
        {
          if ([v13 BOOLValue])
          {
            id v7 = v12;
          }
          else if (v7)
          {
            unsigned int v11 = [v12 isEqualToString:@"VehicleLogs.tar.gz"];
            if (a3)
            {
              if (v11) {
                (*((void (**)(id, id, void *))a3 + 2))(a3, v7, v10);
              }
            }
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [(NSDirectoryEnumerator *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)_carPlayLogsFolderURL
{
  id v2 = [(NSArray *)[+[NSFileManager defaultManager] URLsForDirectory:5 inDomains:1] firstObject];

  return [v2 URLByAppendingPathComponent:@"Logs/com.apple.CarPlay" isDirectory:1];
}

- (void)_enumerateCurrentOverrideAssetsUsingBlock:(id)a3
{
  uint64_t v4 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2D60;
  v3[3] = &unk_8428;
  v3[4] = a3;
  [(NSArray *)[+[NSFileManager defaultManager] contentsOfDirectoryAtURL:[(AccessoryDeveloperSettingsController *)self _carplayLibraryURL] includingPropertiesForKeys:0 options:0 error:&v4] enumerateObjectsUsingBlock:v3];
}

- (id)_overrideAssetDestinationURLForAssetFolder:(id)a3
{
  id v4 = [(AccessoryDeveloperSettingsController *)self _carplayLibraryURL];
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [v4 path], 0))
  {
    uint64_t v9 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [v4 path], 1, 0, &v9))
    {
      id v8 = [v4 path];
      NSLog(@"failed to create %@: %@", v8, v9);
      return 0;
    }
  }
  id v5 = [a3 lastPathComponent];
  if (([v5 hasSuffix:@".zip"] & 1) == 0)
  {
    NSLog(@"invalid asset filename, not a zip file: %@", v5);
    return 0;
  }
  id v6 = objc_msgSend(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0), "URLByStandardizingPath");
  if ((objc_msgSend(objc_msgSend(v6, "path"), "hasPrefix:", objc_msgSend(v4, "path")) & 1) == 0)
  {
    NSLog(@"invalid asset filename %@", v5);
    return 0;
  }
  return v6;
}

- (id)_carplayLibraryURL
{
  id v2 = [(NSArray *)[+[NSFileManager defaultManager] URLsForDirectory:5 inDomains:1] firstObject];

  return [v2 URLByAppendingPathComponent:@"CarPlay" isDirectory:1];
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = objc_msgSend(a4, "firstObject", a3);
  if (v5)
  {
    id v6 = v5;
    id v7 = [(AccessoryDeveloperSettingsController *)self _overrideAssetDestinationURLForAssetFolder:v5];
    if (v7)
    {
      id v8 = v7;
      global_queue = dispatch_get_global_queue(17, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_3160;
      block[3] = &unk_8400;
      block[4] = v6;
      block[5] = v8;
      block[6] = self;
      dispatch_async(global_queue, block);
    }
  }
}

- (void)removeAllAssetsForSpecifier:(id)a3
{
  uint64_t v4 = 0;
  if (![+[NSFileManager defaultManager] removeItemAtURL:[(AccessoryDeveloperSettingsController *)self _carplayLibraryURL] error:&v4])NSLog(@"failed to remove CarPlay library directory: %@", v4); {
  [(AccessoryDeveloperSettingsController *)self reloadSpecifiers];
  }
}

- (void)presentThemePickerFromSpecifier:(id)a3
{
  id v5 = UTTypeZIP;
  id v4 = objc_msgSend(objc_alloc((Class)UIDocumentPickerViewController), "initForOpeningContentTypes:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  [v4 setAllowsMultipleSelection:0];
  [v4 setDelegate:self];
  [(AccessoryDeveloperSettingsController *)self presentViewController:v4 animated:1 completion:&stru_8388];
}

- (id)getAlwaysUpdateAssetForSpecifier:(id)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"AlwaysUpdateAsset", @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return +[NSNumber numberWithBool:v6];
}

- (void)setAlwaysUpdateAsset:(id)a3 specifier:(id)a4
{
  unsigned int v6 = [a3 BOOLValue];
  id v7 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v6) {
    id v7 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"AlwaysUpdateAsset", *v7, @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  [(AccessoryDeveloperSettingsController *)self removeAllAssetsForSpecifier:a4];
}

- (id)getFerriteEnabledForSpecifier:(id)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableFerrite", @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return +[NSNumber numberWithBool:v6];
}

- (void)setFerriteEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"EnableFerrite", *v5, @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(@"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)setAlwaysAcceptHeadUnitPairing:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"AlwaysAcceptHeadUnitPairing", *v5, @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(@"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)alwaysAcceptHeadUnitPairingForSpecifier:(id)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"AlwaysAcceptHeadUnitPairing", @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return +[NSNumber numberWithBool:v6];
}

- (void)setHeadUnitPairingPreviewEnabled:(id)a3 specifier:(id)a4
{
  unsigned int v6 = [a3 BOOLValue];
  id v7 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v6) {
    id v7 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"EnableHeadUnitPairingPreview", *v7, @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v8 = [(AccessoryDeveloperSettingsController *)self specifierForID:@"ALWAYS_ACCEPT_HEAD_UNIT_PAIRING"];
  [v8 setProperty:a3 forKey:PSEnabledKey];

  [(AccessoryDeveloperSettingsController *)self reloadSpecifier:v8];
}

- (id)headUnitPairingPreviewEnabledForSpecifier:(id)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableHeadUnitPairingPreview", @"com.apple.carplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return +[NSNumber numberWithBool:v6];
}

- (void)setAirPlayCarPlayReceiverLogs:(id)a3 specifier:(id)a4
{
  unsigned int v4 = [a3 BOOLValue];
  CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v4) {
    CFTypeID v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetValue(@"airPlayCarPlayReceiverLogs", *v5, @"com.apple.airplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(@"com.apple.airplay", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)airPlayCarPlayReceiverLogsForSpecifier:(id)a3
{
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"airPlayCarPlayReceiverLogs", @"com.apple.airplay", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)resetUserAppearancePrefs:(id)a3
{
  CFPreferencesSetValue(@"CarPlayUserInterfaceStyle", 0, @"com.apple.UIKit", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.UIKit", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSetValue(@"CarCapabilities", 0, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v4 = objc_msgSend(-[AccessoryDeveloperSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", @"AccessoryDeveloperSettings", self), "mutableCopy");
    self->_airPlayCarPlayReceiverLogsSpecifiers = (NSMutableArray *)+[NSMutableArray array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(objc_msgSend(v8, "identifier"), "hasPrefix:", @"DPCarPlayReceiverLog") & 1) != 0
            || objc_msgSend(objc_msgSend(v8, "identifier"), "hasPrefix:", @"OEMCarPlayReceiverLog"))
          {
            [(NSMutableArray *)self->_airPlayCarPlayReceiverLogsSpecifiers addObject:v8];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v5);
    }
    objc_msgSend(v4, "addObject:", +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", @"CCC Head Unit Pairing Preview"));
    objc_msgSend(v4, "addObject:", +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Enable Preview", self, "setHeadUnitPairingPreviewEnabled:specifier:", "headUnitPairingPreviewEnabledForSpecifier:", 0, 6, 0));
    id v9 = +[PSSpecifier preferenceSpecifierNamed:@"Always Accept Pairing" target:self set:"setAlwaysAcceptHeadUnitPairing:specifier:" get:"alwaysAcceptHeadUnitPairingForSpecifier:" detail:0 cell:6 edit:0];
    [v9 setIdentifier:@"ALWAYS_ACCEPT_HEAD_UNIT_PAIRING"];
    id v10 = [(AccessoryDeveloperSettingsController *)self headUnitPairingPreviewEnabledForSpecifier:0];
    uint64_t v11 = PSEnabledKey;
    [v9 setProperty:v10 forKey:PSEnabledKey];
    [v4 addObject:v9];
    objc_msgSend(v4, "addObject:", +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", @"FERRITE_GROUP"));
    objc_msgSend(v4, "addObject:", +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Next generation of CarPlay", self, "setFerriteEnabled:specifier:", "getFerriteEnabledForSpecifier:", 0, 6, 0));
    id v12 = +[PSSpecifier groupSpecifierWithName:@"Display Assets"];
    uint64_t v13 = PSFooterTextGroupKey;
    [v12 setProperty:@"When enabled only a single display asset may be selected. The display asset version will increment on every connection." forKey:PSFooterTextGroupKey];
    [v4 addObject:v12];
    objc_msgSend(v4, "addObject:", +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", @"Always Update Display Asset", self, "setAlwaysUpdateAsset:specifier:", "getAlwaysUpdateAssetForSpecifier:", 0, 6, 0));
    id v14 = +[PSSpecifier groupSpecifierWithName:&stru_8788];
    [v14 setProperty:@"Remove all CarPlay pairings after making any changes to display assets." forKey:v13];
    [v4 addObject:v14];
    id v15 = +[PSSpecifier preferenceSpecifierNamed:@"Remove All Display Assets" target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v15 setButtonAction:"removeAllAssetsForSpecifier:"];
    [v4 addObject:v15];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_4C9C;
    v20[3] = &unk_8320;
    v20[5] = v4;
    v20[6] = &v21;
    v20[4] = self;
    [(AccessoryDeveloperSettingsController *)self _enumerateCurrentOverrideAssetsUsingBlock:v20];
    id v16 = +[PSSpecifier preferenceSpecifierNamed:@"Add Display Asset…" target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v16 setButtonAction:"presentThemePickerFromSpecifier:"];
    if (*((unsigned char *)v22 + 24)) {
      unsigned int v17 = objc_msgSend(-[AccessoryDeveloperSettingsController getAlwaysUpdateAssetForSpecifier:](self, "getAlwaysUpdateAssetForSpecifier:", 0), "BOOLValue");
    }
    else {
      unsigned int v17 = 0;
    }
    objc_msgSend(v16, "setProperty:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17 ^ 1), v11);
    [v4 addObject:v16];
    objc_msgSend(v4, "addObject:", +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", @"Accessory Logs"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_4DC0;
    v19[3] = &unk_8348;
    v19[4] = self;
    v19[5] = v4;
    [(AccessoryDeveloperSettingsController *)self _enumerateCurrentAccessoryLogsUsingBlock:v19];
    *(void *)&self->PSListController_opaque[v3] = v4;
    _Block_object_dispose(&v21, 8);
  }
  [(AccessoryDeveloperSettingsController *)self initDefaultsKeys];
  return *(id *)&self->PSListController_opaque[v3];
}

- (void)initDefaultsKeys
{
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"jarvisVoiceModelLanguage" value:@"en-US" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"airPlayCarPlayReceiverLogLevel" value:@"info" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"airPlayCarPlayReceiverLogCategory" value:@"All" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"dpCarPlayReceiverLogLevel" value:@"info" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"dpCarPlayReceiverLogCategory" value:@"All" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"OEMCarPlayReceiverLogLevel" value:@"info" applicationID:@"com.apple.airplay"];
  [(AccessoryDeveloperSettingsController *)self setDefaultKeyIfNotPresent:@"OEMCarPlayReceiverLogCategory" value:@"All" applicationID:@"com.apple.airplay"];

  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)setDefaultKeyIfNotPresent:(__CFString *)a3 value:(__CFString *)a4 applicationID:(__CFString *)a5
{
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(a3, a5);
  if (v8)
  {
    CFRelease(v8);
  }
  else
  {
    CFPreferencesSetValue(a3, a4, a5, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AccessoryDeveloperSettingsController;
  [(AccessoryDeveloperSettingsController *)&v3 dealloc];
}

@end