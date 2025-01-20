NSURL *UserInstalledFontFileDirectoryURL()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

NSURL *RegisteredFontAssetFileDirectoryURL()
{
  return +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
}

id UserInstalledFontFileDirectoryPath()
{
  if (qword_247E8 != -1) {
    dispatch_once(&qword_247E8, &stru_1C728);
  }
  v0 = (void *)qword_247E0;

  return v0;
}

void sub_3B34(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontFiles/"];
  v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  v3 = (void *)qword_247E0;
  qword_247E0 = v2;
}

id RegisteredFontAssetFileDirectoryPath()
{
  if (qword_247F8 != -1) {
    dispatch_once(&qword_247F8, &stru_1C748);
  }
  v0 = (void *)qword_247F0;

  return v0;
}

void sub_3C0C(id a1)
{
  id v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/UserFonts/FontAssets/"];
  v1 = [v4 path];
  uint64_t v2 = [v1 stringByAppendingString:@"/"];
  v3 = (void *)qword_247F0;
  qword_247F0 = v2;
}

CFStringRef FontAssetDirectoryPath()
{
  return @"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/";
}

id IsPathUserInstalledFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/UserFonts/FontFiles/"];
}

id IsPathRegisteredFontAssetFontFile(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"/private/"])
  {
    uint64_t v2 = [v1 substringFromIndex:8];

    id v1 = (id)v2;
  }
  id v3 = [v1 hasPrefix:@"/var/mobile/Library/UserFonts/FontAssets/"];

  return v3;
}

id IsPathConfigurationProfileFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/var/mobile/Library/Fonts/Managed/"];
}

id IsPathFontAssetFontFile(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"/private/var/MobileAsset/AssetsV2/com_apple_MobileAsset_Font7/"];
}

void StartAccessingFontAssets()
{
  v0 = (objc_class *)sub_3DE4();
  if (v0 && (byte_24800 & 1) == 0)
  {
    id v2 = [[v0 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v2 setDoNotBlockBeforeFirstUnlock:1];
    [v2 setDoNotBlockOnNetworkStatus:1];
    [v2 returnTypes:1];
    [v2 queryMetaDataSync];
    id v1 = [v2 results];
    [v1 enumerateObjectsUsingBlock:&stru_1C788];
  }
}

id sub_3DE4()
{
  if (qword_24808 != -1) {
    dispatch_once(&qword_24808, &stru_1C858);
  }
  v0 = (void *)qword_24810;

  return v0;
}

void sub_3E38(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  v6 = a2;
  if ([(MAAsset *)v6 state] == (char *)&dword_0 + 2)
  {
    v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_24800 = 1;
      *a4 = 1;
    }
  }
}

void StartAccessingFontAssetsWithHandler(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_3DE4();
  if (v2 && (byte_24801 & 1) == 0)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_3FB0;
    v5[3] = &unk_1C7D0;
    id v6 = v3;
    v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
  else
  {
    v1[2](v1);
  }
}

uint64_t sub_3FB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  [v2 enumerateObjectsUsingBlock:&stru_1C7A8];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void sub_400C(id a1, MAAsset *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  if ([(MAAsset *)v6 state] == (char *)&dword_0 + 2)
  {
    v5 = [(MAAsset *)v6 getLocalFileUrl];

    if (v5)
    {
      byte_24801 = 1;
      *a4 = 1;
    }
  }
}

void PurgeFontAssetsWithHandler(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)sub_3DE4();
  if (v2)
  {
    id v3 = [[v2 alloc] initWithType:@"com.apple.MobileAsset.Font7"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    [v3 setDoNotBlockOnNetworkStatus:1];
    [v3 returnTypes:2];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4164;
    v5[3] = &unk_1C7D0;
    id v6 = v3;
    id v7 = v1;
    id v4 = v3;
    [v4 queryMetaDataWithError:v5];
  }
}

void sub_4164(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) results];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4204;
  v3[3] = &unk_1C838;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_4204(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 state] == (char *)&dword_0 + 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [v5 attributes];
    LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    if (v3) {
      [v5 purge:&stru_1C810];
    }
  }
}

void sub_429C(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 1)) {
    qword_24810 = (uint64_t)NSClassFromString(@"MAAssetQuery");
  }
}

void sub_692C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3042000000;
  v17[3] = sub_7170;
  v17[4] = sub_717C;
  objc_initWeak(&v18, v3);
  id v5 = +[UIImage systemImageNamed:@"arrow.down.circle"];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_7184;
  v14 = &unk_1C8A8;
  v16 = v17;
  id v6 = v4;
  id v15 = v6;
  id v7 = +[UIAction actionWithTitle:&stru_1CDF0 image:v5 identifier:0 handler:&v11];

  v8 = +[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v7, v11, v12, v13, v14);
  v9 = +[UIShape circleShape];
  v10 = +[UIHoverStyle styleWithShape:v9];
  [v8 setHoverStyle:v10];

  if ([v6 installKind] == &dword_4)
  {
    [v8 setEnabled:0];
    [v3 setUserInteractionEnabled:0];
  }
  [v3 setAccessoryView:v8];
  [v8 sizeToFit];

  _Block_object_dispose(v17, 8);
  objc_destroyWeak(&v18);
}

void sub_6B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_6CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = +[UIColor labelColor];
  objc_msgSend(v5, "addAttribute:value:range:", NSForegroundColorAttributeName, v6, a2, a3);
}

void sub_7170(uint64_t a1, uint64_t a2)
{
}

void sub_717C(uint64_t a1)
{
}

void sub_7184(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  if (WeakRetained)
  {
    id v3 = +[FontSettingsManager sharedManager];
    [v3 startDownloadForFont:*(void *)(a1 + 32)];

    id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    [v4 setActivityAccessoryView];
  }
}

id sub_76E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifier];
  id v3 = [v2 name];
  id v4 = [*(id *)(a1 + 32) navigationItem];
  [v4 setTitle:v3];

  id v5 = *(void **)(a1 + 32);

  return [v5 reloadSpecifiers];
}

void sub_7F74(id a1, UIAction *a2)
{
  id v3 = +[NSURL URLWithString:@"itms-apps://itunes.apple.com/"];
  id v2 = +[UIApplication sharedApplication];
  [v2 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

void sub_87A4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = [a2 userInfo];
    id v6 = [v4 objectForKey:@"family"];

    id v5 = v6;
    if (v6)
    {
      [*(id *)(*(void *)(a1 + 32) + 200) setObject:&__kCFBooleanFalse forKey:v6];
      id v5 = v6;
    }
  }
}

void sub_88B8(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = a3 - 1;
    id v5 = a2;
    id v11 = +[NSIndexPath indexPathForRow:v4 inSection:0];
    id v6 = [v5 userInfo];

    id v7 = [v6 objectForKey:@"family"];

    if (v7)
    {
      v8 = [*(id *)(*(void *)(a1 + 32) + 200) objectForKey:v7];
      unsigned int v9 = [v8 BOOLValue];

      v10 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__table);
      if (v9) {
        [v10 selectRowAtIndexPath:v11 animated:1 scrollPosition:0];
      }
      else {
        [v10 deselectRowAtIndexPath:v11 animated:1];
      }
    }
  }
}

void sub_8ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_8AD4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 BOOLValue];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_8E6C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + OBJC_IVAR___PSListController__specifiers), "objectAtIndex:", objc_msgSend(a2, "integerValue"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_A12C(id a1)
{
  id v1 = objc_alloc_init(FontSettingsManager);
  id v2 = (void *)qword_24828;
  qword_24828 = (uint64_t)v1;

  id v3 = +[FontServicesDaemonManager sharedManager];
  [v3 resumeAndShowAlertForSuspendedFontProviders];
}

id sub_A3E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSystem];
}

id sub_A3EC(uint64_t a1, void *a2)
{
  return [a2 reloadFonts];
}

void sub_AB50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((IsPathRegisteredFontAssetFontFile(v5) & 1) == 0)
  {
    id v7 = [v6 objectForKey:@"disabled"];
    if ([v7 BOOLValue])
    {
      v8 = [v6 objectForKey:@"suspend"];
      unsigned int v9 = [v8 BOOLValue];

      if (!v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v10 = [v6 objectForKey:@"familyName"];
    id v11 = *(void **)(a1 + 32);
    id v25 = 0;
    uint64_t v12 = [v11 providerIdentifierAndLocalizedName:&v25 fromFilePath:v5];
    id v13 = v25;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_AD34;
    v16[3] = &unk_1CA28;
    id v17 = *(id *)(a1 + 40);
    id v18 = v13;
    id v19 = *(id *)(a1 + 48);
    id v20 = v12;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    id v24 = v5;
    id v14 = v12;
    id v15 = v13;
    [v10 enumerateKeysAndObjectsUsingBlock:v16];
  }
LABEL_7:
}

void sub_AD34(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([v10 hasPrefix:@"."] & 1) == 0
    && ([v5 hasPrefix:@"."] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      [*(id *)(a1 + 48) setObject:v6 forKey:v5];
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      [*(id *)(a1 + 64) setObject:v7 forKey:v5];
    }
    v8 = [*(id *)(a1 + 72) objectForKey:v5];
    if (!v8)
    {
      v8 = +[NSMutableArray arrayWithCapacity:0];
      [*(id *)(a1 + 72) setObject:v8 forKey:v5];
    }
    if (([v8 containsObject:v10] & 1) == 0) {
      [v8 addObject:v10];
    }
    unsigned int v9 = [*(id *)(a1 + 80) objectForKey:v5];
    if (!v9)
    {
      unsigned int v9 = +[NSMutableArray arrayWithCapacity:0];
      [*(id *)(a1 + 80) setObject:v9 forKey:v5];
    }
    [v9 addObject:*(void *)(a1 + 88)];
  }
}

void sub_BD44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_BD60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"FontDesignLanguages"];
  v8 = [kInvalidLanguageArray arrayByAddingObjectsFromArray:v7];
  unsigned int v9 = +[NSBundle preferredLocalizationsFromArray:v8 forPreferences:*(void *)(a1 + 32)];

  if (([v9 isEqualToArray:kInvalidLanguageArray] & 1) == 0)
  {
    id v10 = [v6 objectForKeyedSubscript:@"LocalizedFamilyNames"];
    if (v10)
    {
      uint64_t v53 = a1;
      v54 = v7;
      id v55 = v6;
      id v56 = v5;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v52 = v9;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v12)
      {
        id v13 = v12;
        CFStringRef v14 = @"zh";
        uint64_t v15 = *(void *)v60;
        CFAllocatorRef v16 = kCFAllocatorDefault;
        id v57 = v11;
LABEL_5:
        id v17 = 0;
        id v58 = v13;
        while (1)
        {
          if (*(void *)v60 != v15) {
            objc_enumerationMutation(v11);
          }
          id v18 = (__CFString *)*(id *)(*((void *)&v59 + 1) + 8 * (void)v17);
          if ([(__CFString *)v18 hasPrefix:v14]) {
            break;
          }
          id v22 = v10;
          CFStringRef v23 = v14;
          ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v16, v18);
          uint64_t v24 = [ComponentsFromLocaleIdentifier objectForKeyedSubscript:kCFLocaleLanguageCode];
          if (v24)
          {
            id v25 = (__CFString *)v24;
            v26 = [ComponentsFromLocaleIdentifier objectForKeyedSubscript:kCFLocaleScriptCode];
            if ([(__CFString *)v25 isEqualToString:@"yue"])
            {
              if ([v26 isEqualToString:@"Hans"])
              {

                id v21 = @"zh-Hans";
              }
              else
              {
                v28 = [ComponentsFromLocaleIdentifier objectForKeyedSubscript:kCFLocaleCountryCode];
                if (([v26 isEqualToString:@"Hant"] & 1) != 0
                  || (id v21 = @"zh-Hans", ([v28 isEqualToString:@"CN"] & 1) == 0))
                {
                  id v21 = @"zh-Hant";
                }

                id v11 = v57;
              }
            }
            else if ([(__CFString *)v25 isEqualToString:@"wuu"])
            {
              unsigned int v27 = [v26 isEqualToString:@"Hant"];

              if (v27) {
                id v21 = @"zh-Hant";
              }
              else {
                id v21 = @"zh-Hans";
              }
            }
            else
            {
              if ([(__CFString *)v25 isEqualToString:@"und"])
              {
                CFStringRef v29 = v18;
                v30 = malloc_type_malloc(0, 0x6EB84DF8uLL);
                v50 = (__CFString *)v29;
                if (!CFStringGetCStringPtr(v29, 0x600u))
                {
                  CFIndex Length = CFStringGetLength(v29);
                  CFIndex bufferSizea = CFStringGetMaximumSizeForEncoding(Length, 0x600u) + 1;
                  v30 = malloc_type_realloc(v30, bufferSizea, 0x6FAE689FuLL);
                  CFStringGetCString(v29, (char *)v30, bufferSizea, 0x600u);
                }
                LODWORD(v64[0]) = 0;
                int v32 = uloc_addLikelySubtags();
                free(v30);
                if (SLODWORD(v64[0]) < 1)
                {
                  CFAllocatorRef v34 = kCFAllocatorDefault;
                  bufferSize = (__CFString *)CFStringCreateWithBytes(kCFAllocatorDefault, bytes, v32, 0x600u, 0);
                  v33 = v50;
                }
                else
                {
                  v33 = v50;
                  bufferSize = v50;
                  CFAllocatorRef v34 = kCFAllocatorDefault;
                }

                CFDictionaryRef v35 = CFLocaleCreateComponentsFromLocaleIdentifier(v34, bufferSize);
                ComponentsFromLocaleIdentifier = v35;
                uint64_t v36 = [(__CFDictionary *)v35 objectForKeyedSubscript:kCFLocaleLanguageCode];

                if (v26)
                {
                  [ComponentsFromLocaleIdentifier objectForKeyedSubscript:kCFLocaleScriptCode];
                  uint64_t v38 = v37 = ComponentsFromLocaleIdentifier;

                  v26 = (void *)v38;
                  ComponentsFromLocaleIdentifier = v37;
                }

                id v25 = (__CFString *)v36;
                id v11 = v57;
              }
              if (v26)
              {
                v64[0] = kCFLocaleLanguageCode;
                v64[1] = kCFLocaleScriptCode;
                *(void *)bytes = v25;
                v66 = v26;
                CFDictionaryRef v39 = +[NSDictionary dictionaryWithObjects:bytes forKeys:v64 count:2];
                v51 = ComponentsFromLocaleIdentifier;
                LocaleIdentifierFromComponents = (__CFString *)CFLocaleCreateLocaleIdentifierFromComponents(kCFAllocatorDefault, v39);

                CanonicalLanguageIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString(kCFAllocatorDefault, LocaleIdentifierFromComponents);
                id v11 = v57;
                id v25 = CanonicalLanguageIdentifierFromString;

                ComponentsFromLocaleIdentifier = v51;
                id v21 = v25;
              }
              else
              {
                v42 = +[NSLocale systemLanguages];
                unsigned int v43 = [v42 containsObject:v18];

                if (v43)
                {
                  v44 = v18;
                }
                else
                {
                  v44 = v25;
                  id v25 = v44;
                }
                id v21 = v44;
              }
            }
          }
          else
          {
            id v21 = v18;
          }
          CFStringRef v14 = v23;
          id v10 = v22;
          id v13 = v58;
LABEL_44:

          v45 = [v10 objectForKeyedSubscript:v21];

          if (v45)
          {
            v46 = [v10 objectForKeyedSubscript:v21];
            a1 = v53;
            v47 = v11;
            id v5 = v56;
            [*(id *)(v53 + 40) setObject:v46 forKeyedSubscript:v56];

            uint64_t v7 = v54;
            id v6 = v55;
            unsigned int v9 = v52;
            if (v46) {
              goto LABEL_50;
            }
            goto LABEL_49;
          }

          id v17 = (char *)v17 + 1;
          CFAllocatorRef v16 = kCFAllocatorDefault;
          if (v13 == v17)
          {
            id v13 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
            if (v13) {
              goto LABEL_5;
            }
            goto LABEL_47;
          }
        }
        *(void *)bytes = v18;
        ComponentsFromLocaleIdentifier = +[NSArray arrayWithObjects:bytes count:1];
        CFArrayRef v20 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)&off_1DAB8, (CFArrayRef)ComponentsFromLocaleIdentifier);
        if ([(__CFArray *)v20 count])
        {
          id v21 = [(__CFArray *)v20 objectAtIndexedSubscript:0];
          if (![(__CFString *)v21 isEqualToString:@"zxxx"])
          {
LABEL_13:

            goto LABEL_44;
          }
        }
        id v21 = v18;
        goto LABEL_13;
      }
LABEL_47:

      id v6 = v55;
      id v5 = v56;
      a1 = v53;
      uint64_t v7 = v54;
      unsigned int v9 = v52;
    }
LABEL_49:
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v5];
    v46 = 0;
LABEL_50:
  }
}

void sub_C3C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[UndownloadedCachedFamily alloc] init:v6 withLocalizedFamilyName:v5];

  [*(id *)(a1 + 32) addObject:v7];
}

void sub_C564(uint64_t a1, uint64_t a2)
{
}

void sub_C570(uint64_t a1)
{
}

void sub_C578(uint64_t a1)
{
  CFArrayRef MatchingFontDescriptors = 0;
  unsigned int v3 = 0;
  do
  {
    CFArrayRef v4 = MatchingFontDescriptors;
    CFStringRef v14 = kCTFontDownloadableAttribute;
    uint64_t v15 = &__kCFBooleanTrue;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v6 = CTFontDescriptorCreateWithAttributes(v5);

    CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v6, 0);
    id v7 = [*(id *)(a1 + 32) systemFontFamiliesWithDownloadableFaces:MatchingFontDescriptors andCachedDownloadFamilies:0];

    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v3 >= 9;
    }
    ++v3;
  }
  while (!v8);
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_C730;
    block[3] = &unk_1CAC8;
    uint64_t v13 = *(void *)(a1 + 48);
    CFArrayRef v10 = MatchingFontDescriptors;
    id v11 = v7;
    id v12 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_11044();
  }
}

void sub_C730(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    CFDictionaryRef v5 = WeakRetained;
    objc_storeStrong((id *)&_downloadableFaces, *(id *)(a1 + 32));
    objc_storeStrong(v5 + 2, *(id *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    CFArrayRef v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"FontSettingsManagerUpdated" object:0];

    id WeakRetained = v5;
  }
}

void sub_C8C8(uint64_t a1)
{
  v28 = +[NSMutableDictionary dictionaryWithCapacity:0];
  int v32 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v1 = (id)_downloading;
  objc_sync_enter(v1);
  id v2 = [(id)_downloading allObjects];
  id v29 = [(id)_removing allObjects];
  objc_sync_exit(v1);

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v2;
  id v35 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v60;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v60 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v70[0] = kCTFontDownloadableAttribute;
        v70[1] = kCTFontFamilyNameAttribute;
        v71[0] = &__kCFBooleanTrue;
        v71[1] = v4;
        uint64_t v37 = v4;
        CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        descriptor = CTFontDescriptorCreateWithAttributes(v5);

        CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(descriptor, 0);
        if ([(__CFArray *)MatchingFontDescriptors count])
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          CFArrayRef v6 = MatchingFontDescriptors;
          id v7 = 0;
          id v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v55 objects:v69 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v56;
LABEL_9:
            CFArrayRef v10 = 0;
            id v11 = v7;
            while (1)
            {
              if (*(void *)v56 != v9) {
                objc_enumerationMutation(v6);
              }
              id v12 = *(const __CTFontDescriptor **)(*((void *)&v55 + 1) + 8 * (void)v10);
              uint64_t v13 = (void *)CTFontDescriptorCopyAttribute(v12, kCTFontDownloadedAttribute);
              id v7 = v12;

              LOBYTE(v12) = [v13 BOOLValue];
              if ((v12 & 1) == 0) {
                break;
              }
              CFArrayRef v10 = (char *)v10 + 1;
              id v11 = v7;
              if (v8 == v10)
              {
                id v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v55 objects:v69 count:16];
                if (v8) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
          }
          else
          {
LABEL_15:

            [v28 setObject:v7 forKey:v37];
            CFArrayRef v6 = (const __CFArray *)(id)_downloading;
            objc_sync_enter(v6);
            [(id)_downloading removeObject:v37];
            objc_sync_exit(v6);
          }
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v35);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v30 = v29;
  id v36 = [v30 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v52;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8 * (void)j);
        v66[0] = kCTFontDownloadableAttribute;
        v66[1] = kCTFontFamilyNameAttribute;
        v67[0] = &__kCFBooleanTrue;
        uint64_t v38 = v15;
        v67[1] = v15;
        CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
        descriptora = CTFontDescriptorCreateWithAttributes(v16);

        CFArrayRef v42 = CTFontDescriptorCreateMatchingFontDescriptors(descriptora, 0);
        if ([(__CFArray *)v42 count])
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          CFArrayRef v17 = v42;
          id v18 = 0;
          id v19 = [(__CFArray *)v17 countByEnumeratingWithState:&v47 objects:v65 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v48;
LABEL_27:
            id v21 = 0;
            id v22 = v18;
            while (1)
            {
              if (*(void *)v48 != v20) {
                objc_enumerationMutation(v17);
              }
              CFStringRef v23 = *(const __CTFontDescriptor **)(*((void *)&v47 + 1) + 8 * (void)v21);
              uint64_t v24 = (void *)CTFontDescriptorCopyAttribute(v23, kCTFontDownloadedAttribute);
              id v18 = v23;

              LOBYTE(v23) = [v24 BOOLValue];
              if (v23) {
                break;
              }
              id v21 = (char *)v21 + 1;
              id v22 = v18;
              if (v19 == v21)
              {
                id v19 = [(__CFArray *)v17 countByEnumeratingWithState:&v47 objects:v65 count:16];
                if (v19) {
                  goto LABEL_27;
                }
                goto LABEL_33;
              }
            }
          }
          else
          {
LABEL_33:

            [v32 setObject:v18 forKey:v38];
            CFArrayRef v17 = (const __CFArray *)(id)_downloading;
            objc_sync_enter(v17);
            [(id)_removing removeObject:v38];
            objc_sync_exit(v17);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_1108C(buf, v38, &v64);
          }
          [v32 setObject:descriptora forKey:v38];
          id v18 = (const __CTFontDescriptor *)(id)_downloading;
          objc_sync_enter(v18);
          [(id)_removing removeObject:v38];
          objc_sync_exit(v18);
        }
      }
      id v36 = [v30 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v36);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CF90;
  block[3] = &unk_1CB18;
  id v44 = v28;
  id v45 = v32;
  long long v46 = *(_OWORD *)(a1 + 32);
  id v25 = v32;
  id v26 = v28;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_CF50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CF90(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    uint64_t v15 = WeakRetained;
    if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      uint64_t v3 = (char *)[v15[2] count];
      if ((uint64_t)v3 >= 1)
      {
        uint64_t v4 = v3;
        for (i = 0; i != v4; ++i)
        {
          CFArrayRef v6 = [v15[2] objectAtIndexedSubscript:i];
          id v7 = [v6 familyName];

          id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

          if (v8)
          {
            uint64_t v9 = [*(id *)(a1 + 48) postscriptNamesForDownloadedFamily:v7];
            id v10 = [[FontAssetFontFamily alloc] init:v7 withPostScriptNames:v9 andFontFiles:&__NSArray0__struct];
            [v15[2] setObject:v10 atIndexedSubscript:i];
          }
          id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
          if (v11)
          {
            id v12 = [[UndownloadedFontFamily alloc] init:v7 withDescriptor:v11];
            [v15[2] setObject:v12 atIndexedSubscript:i];
          }
        }
      }
      uint64_t v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"FontSettingsManagerUpdated" object:0];
    }
    id v14 = (id)_downloading;
    objc_sync_enter(v14);
    if (![(id)_downloading count] && !objc_msgSend((id)_removing, "count"))
    {
      [(id)_backupTimer invalidate];
      [*(id *)(a1 + 48) updateSystemAsyncWithCompletion:0];
    }
    objc_sync_exit(v14);

    id WeakRetained = v15;
  }
}

void sub_D1B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D33C(id a1)
{
  byte_24839 = 1;
}

void sub_D424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_D440(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained deltaUpdateSystemAsync];
  }
  else {
    [v5 invalidate];
  }
}

void sub_D930(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D94C(id a1, NSString *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  CFArrayRef v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [(NSSet *)v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        CFStringRef v19 = @"actualPath";
        uint64_t v20 = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (void)v15);
        [v7 addObject:v14];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSSet *)v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v10);
  }

  +[FSUserFontManager uninstallFonts:v7 forIdentifier:v5 appInfo:0 completionHandler:&stru_1CC08];
}

void sub_DAD4(id a1, NSArray *a2, NSDictionary *a3)
{
  uint64_t v3 = a2;
  if ([(NSArray *)v3 count]) {
    NSLog(@"uninstallFonts errors - %@", v3);
  }
}

id sub_DB28(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 familyName];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_DB70(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a2];
  [v2 setIsProcessing:1];
}

uint64_t sub_DBC0(uint64_t a1, void *a2)
{
  [a2 objectForKey:@"FontInfo4"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        id v10 = objc_msgSend(v8, "objectForKey:", @"FontFamilyName", (void)v15);
        if ([v9 containsObject:v10])
        {

LABEL_13:
          uint64_t v13 = 1;
          goto LABEL_14;
        }
        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = [v8 objectForKey:@"PreferredFamilyName"];
        LOBYTE(v11) = [v11 containsObject:v12];

        if (v11) {
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_14:

  return v13;
}

void sub_E040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_sync_exit(v25);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v24);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E098(uint64_t a1, int a2, void *a3)
{
  switch(a2)
  {
    case 1:
      id v6 = (id)_fontsDownloadProgress;
      objc_sync_enter(v6);
      [(id)_fontsDownloadProgress setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
      objc_sync_exit(v6);

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        id v7 = (id)_downloading;
        objc_sync_enter(v7);
        [(id)_downloading removeObject:*(void *)(a1 + 32)];
        objc_sync_exit(v7);

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_E320;
        v13[3] = &unk_1CB40;
        uint64_t v15 = *(void *)(a1 + 48);
        id v14 = *(id *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
      }
      break;
    case 8:
      id v8 = [a3 objectForKey:kCTFontDescriptorMatchingError];
      id v9 = v8;
      if (v8)
      {
        id v10 = [v8 description];
      }
      else
      {
        id v10 = @"ERROR MESSAGE IS NOT AVAILABLE!";
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        CFStringRef v19 = v10;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Download %@ error: %@", buf, 0x16u);
      }

      break;
    case 5:
      id v4 = [a3 objectForKey:kCTFontDescriptorMatchingPercentage];
      id v5 = (id)_fontsDownloadProgress;
      objc_sync_enter(v5);
      [(id)_fontsDownloadProgress setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
      objc_sync_exit(v5);

      break;
  }
  return 1;
}

void sub_E2FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E320(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 2);
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            uint64_t v11 = objc_msgSend(v10, "familyName", (void)v14);
            unsigned int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

            if (v12)
            {
              [v10 setIsProcessing:0];
              goto LABEL_13;
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
  uint64_t v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"SystemFontsDataChanged" object:0];
}

void sub_E528(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_F410(id a1, id a2, id a3)
{
  return _CTFontManagerCompareFontDescriptors(a2, a3, 0);
}

void sub_101D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_101F0(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_10278()
{
  if (!qword_24840) {
    qword_24840 = _sl_dlopen();
  }
  return qword_24840;
}

uint64_t sub_10348()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_24848;
  uint64_t v6 = qword_24848;
  if (!qword_24848)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10488;
    v2[3] = &unk_1CD70;
    v2[4] = &v3;
    sub_10488((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_103FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10414()
{
  uint64_t result = _sl_dlopen();
  qword_24840 = result;
  return result;
}

void *sub_10488(uint64_t a1)
{
  id v2 = (void *)sub_10278();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "CTFontDescriptorDownloadMatchingFontDescriptors");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_24848 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_11044()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CT download & removed descriptors state is not consistent. Giving up. Please file a RADAR.", v0, 2u);
}

void sub_1108C(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a2;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "CoreText returning nil; force-marking %{public}@ family removal complete",
    buf,
    0xCu);
}

void sub_110D8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unable to load system families", v0, 2u);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return _CFBundleCopyLocalizationsForPreferences(locArray, prefArray);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLanguageIdentifierFromString(allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return _CFLocaleCreateComponentsFromLocaleIdentifier(allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return _CFLocaleCreateLocaleIdentifierFromComponents(allocator, dictionary);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return _CFStringTokenizerGetCurrentSubTokens(tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return _CFStringTokenizerGoToTokenAtIndex(tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CFStringRef CTFontCopyLocalizedName(CTFontRef font, CFStringRef nameKey, CFStringRef *actualLanguage)
{
  return _CTFontCopyLocalizedName(font, nameKey, actualLanguage);
}

uint64_t CTFontCopySampleString()
{
  return _CTFontCopySampleString();
}

CFArrayRef CTFontCopySupportedLanguages(CTFontRef font)
{
  return _CTFontCopySupportedLanguages(font);
}

CFDictionaryRef CTFontCopyTraits(CTFontRef font)
{
  return _CTFontCopyTraits(font);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return _CTFontDescriptorCopyAttribute(descriptor, attribute);
}

CFTypeRef CTFontDescriptorCopyLocalizedAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute, CFStringRef *language)
{
  return _CTFontDescriptorCopyLocalizedAttribute(descriptor, attribute, language);
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return _CTFontDescriptorCreateMatchingFontDescriptors(descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateWithAttributes(attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return _CTFontDescriptorMatchFontDescriptorsWithProgressHandler(descriptors, mandatoryAttributes, progressBlock);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  return _CTFontGetAdvancesForGlyphs(font, orientation, glyphs, advances, count);
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  return _CTFontGetAscent(font);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  return _CTFontGetBoundingRectsForGlyphs(font, orientation, glyphs, boundingRects, count);
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  return _CTFontGetDescent(font);
}

CFIndex CTFontGetGlyphCount(CTFontRef font)
{
  return _CTFontGetGlyphCount(font);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  return _CTFontGetLeading(font);
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return _CTFontGetSymbolicTraits(font);
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromURL(CFURLRef fileURL)
{
  return _CTFontManagerCreateFontDescriptorsFromURL(fileURL);
}

uint64_t GSFontGetDownloadFamilyNames()
{
  return _GSFontGetDownloadFamilyNames();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t uloc_addLikelySubtags()
{
  return _uloc_addLikelySubtags();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__setNeedsUpdateContentUnavailableConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsUpdateContentUnavailableConfiguration];
}

id objc_msgSend__specifier(void *a1, const char *a2, ...)
{
  return [a1 _specifier];
}

id objc_msgSend__systemDestructiveTintColor(void *a1, const char *a2, ...)
{
  return [a1 _systemDestructiveTintColor];
}

id objc_msgSend__updateSpecifierControllerClass(void *a1, const char *a2, ...)
{
  return [a1 _updateSpecifierControllerClass];
}

id objc_msgSend__updateSpecifierFontInfo(void *a1, const char *a2, ...)
{
  return [a1 _updateSpecifierFontInfo];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_backBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 backBarButtonItem];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_buttonProperties(void *a1, const char *a2, ...)
{
  return [a1 buttonProperties];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_circleShape(void *a1, const char *a2, ...)
{
  return [a1 circleShape];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return [a1 commonInit];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 contentLayoutGuide];
}

id objc_msgSend_copyrightLabel(void *a1, const char *a2, ...)
{
  return [a1 copyrightLabel];
}

id objc_msgSend_copyrightString(void *a1, const char *a2, ...)
{
  return [a1 copyrightString];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentSearchStringMatcher(void *a1, const char *a2, ...)
{
  return [a1 currentSearchStringMatcher];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deltaUpdateSystemAsync(void *a1, const char *a2, ...)
{
  return [a1 deltaUpdateSystemAsync];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return [a1 editButtonItem];
}

id objc_msgSend_emptyProminentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 emptyProminentConfiguration];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_familyNameLabel(void *a1, const char *a2, ...)
{
  return [a1 familyNameLabel];
}

id objc_msgSend_familyNames(void *a1, const char *a2, ...)
{
  return [a1 familyNames];
}

id objc_msgSend_fetchFontInfo(void *a1, const char *a2, ...)
{
  return [a1 fetchFontInfo];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSizeLabel(void *a1, const char *a2, ...)
{
  return [a1 fileSizeLabel];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flowLayout(void *a1, const char *a2, ...)
{
  return [a1 flowLayout];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fontDescriptors(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptors];
}

id objc_msgSend_fontFilePaths(void *a1, const char *a2, ...)
{
  return [a1 fontFilePaths];
}

id objc_msgSend_fontPreferredLanguage(void *a1, const char *a2, ...)
{
  return [a1 fontPreferredLanguage];
}

id objc_msgSend_fonts(void *a1, const char *a2, ...)
{
  return [a1 fonts];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForSelectedRows];
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForVisibleItems];
}

id objc_msgSend_installKind(void *a1, const char *a2, ...)
{
  return [a1 installKind];
}

id objc_msgSend_installedFontFamilies(void *a1, const char *a2, ...)
{
  return [a1 installedFontFamilies];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isDownloadable(void *a1, const char *a2, ...)
{
  return [a1 isDownloadable];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isProcessing(void *a1, const char *a2, ...)
{
  return [a1 isProcessing];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return [a1 layoutManager];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedFamilyName(void *a1, const char *a2, ...)
{
  return [a1 localizedFamilyName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedStyleName(void *a1, const char *a2, ...)
{
  return [a1 localizedStyleName];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeAlphabetSampleView(void *a1, const char *a2, ...)
{
  return [a1 makeAlphabetSampleView];
}

id objc_msgSend_makeLoremIpsumSampleView(void *a1, const char *a2, ...)
{
  return [a1 makeLoremIpsumSampleView];
}

id objc_msgSend_makeRepertoireView(void *a1, const char *a2, ...)
{
  return [a1 makeRepertoireView];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_pageViewController(void *a1, const char *a2, ...)
{
  return [a1 pageViewController];
}

id objc_msgSend_pane(void *a1, const char *a2, ...)
{
  return [a1 pane];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_postScriptFontNames(void *a1, const char *a2, ...)
{
  return [a1 postScriptFontNames];
}

id objc_msgSend_postscriptName(void *a1, const char *a2, ...)
{
  return [a1 postscriptName];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizations];
}

id objc_msgSend_preserveFontFamilySelections(void *a1, const char *a2, ...)
{
  return [a1 preserveFontFamilySelections];
}

id objc_msgSend_providerIconImageView(void *a1, const char *a2, ...)
{
  return [a1 providerIconImageView];
}

id objc_msgSend_providerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 providerIdentifier];
}

id objc_msgSend_providerLocalizedName(void *a1, const char *a2, ...)
{
  return [a1 providerLocalizedName];
}

id objc_msgSend_providerNameLabel(void *a1, const char *a2, ...)
{
  return [a1 providerNameLabel];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_repertoireCollectionView(void *a1, const char *a2, ...)
{
  return [a1 repertoireCollectionView];
}

id objc_msgSend_restoreFontFamilySelections(void *a1, const char *a2, ...)
{
  return [a1 restoreFontFamilySelections];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resumeAndShowAlertForSuspendedFontProviders(void *a1, const char *a2, ...)
{
  return [a1 resumeAndShowAlertForSuspendedFontProviders];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return [a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_setActivityAccessoryView(void *a1, const char *a2, ...)
{
  return [a1 setActivityAccessoryView];
}

id objc_msgSend_setBackupTimer(void *a1, const char *a2, ...)
{
  return [a1 setBackupTimer];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldShowNoFontsMessage(void *a1, const char *a2, ...)
{
  return [a1 shouldShowNoFontsMessage];
}

id objc_msgSend_showInstalledFonts(void *a1, const char *a2, ...)
{
  return [a1 showInstalledFonts];
}

id objc_msgSend_showNoFontsMessageIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 showNoFontsMessageIfNeeded];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_synthesizeFonts(void *a1, const char *a2, ...)
{
  return [a1 synthesizeFonts];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemFontFamilies(void *a1, const char *a2, ...)
{
  return [a1 systemFontFamilies];
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return [a1 systemLanguages];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableCellGrayTextColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellGrayTextColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContainerInset(void *a1, const char *a2, ...)
{
  return [a1 textContainerInset];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateNavigationItem(void *a1, const char *a2, ...)
{
  return [a1 updateNavigationItem];
}

id objc_msgSend_userFontsInfo(void *a1, const char *a2, ...)
{
  return [a1 userFontsInfo];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_versionLabel(void *a1, const char *a2, ...)
{
  return [a1 versionLabel];
}

id objc_msgSend_versionString(void *a1, const char *a2, ...)
{
  return [a1 versionString];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}