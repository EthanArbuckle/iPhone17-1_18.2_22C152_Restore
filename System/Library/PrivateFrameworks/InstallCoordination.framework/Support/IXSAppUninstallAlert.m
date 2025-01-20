@interface IXSAppUninstallAlert
+ (id)_loadHBMCloudSyncUtilityClass;
- (BOOL)appHasInstalledFonts;
- (BOOL)appManagedByManagedSettings;
- (BOOL)deviceHasOneHomeEnabled;
- (BOOL)needsShowFontsButton;
- (IXSAppUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 isManagedByManagedSettings:(BOOL)a6 deletionIsRestricted:(BOOL)a7;
- (NSArray)fontFamilies;
- (NSString)appStringsTableName;
- (__CFBundle)appStringsBundle;
- (id)_customDeleteStringForMessagesApp;
- (id)appInstalledFonts;
- (id)cancelButtonLabel;
- (id)customizedLocalizedStringForKey:(id)a3;
- (id)defaultButtonLabel;
- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4;
- (id)message;
- (id)optionalButtonForNotRemovableAppActionURL;
- (id)optionalButtonForNotRemovableAppLabel;
- (id)otherButtonLabel;
- (id)title;
- (int64_t)installedFontCount;
- (void)dealloc;
- (void)otherButtonActionWithCompletion:(id)a3;
@end

@implementation IXSAppUninstallAlert

- (IXSAppUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 isManagedByManagedSettings:(BOOL)a6 deletionIsRestricted:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IXSAppUninstallAlert;
  v13 = [(IXSUninstallAlert *)&v31 initWithAppRecord:v12 bundleIdentifier:a4 removability:a5 deletionIsRestricted:v7];
  v14 = v13;
  if (v13)
  {
    [(IXSUninstallAlert *)v13 setTypeDescription:@"App"];
    v15 = [(IXSUninstallAlert *)v14 bundleIdentifier];
    uint64_t v16 = +[FSUserFontManager registeredFamiliesForIdentifier:v15 enabled:1];
    fontFamilies = v14->_fontFamilies;
    v14->_fontFamilies = (NSArray *)v16;

    v14->_appManagedByManagedSettings = a6;
    v14->_appStringsBundle = 0;
    appStringsTableName = v14->_appStringsTableName;
    v14->_appStringsTableName = 0;

    v19 = [(IXSUninstallAlert *)v14 appRecord];
    unsigned int v20 = [v19 isDeletableSystemApplication];

    if (v20)
    {
      v21 = [v12 infoDictionary];
      v22 = [v21 objectForKey:@"SBUninstallIconOverrideStringsFile" ofClass:objc_opt_class()];

      if (v22)
      {
        v23 = [v12 URL];
        v14->_appStringsBundle = (__CFBundle *)_CFBundleCreateUnique();

        if (![(IXSAppUninstallAlert *)v14 appStringsBundle])
        {
          v24 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v12 URL];
            v26 = [v25 path];
            *(_DWORD *)buf = 136315394;
            v33 = "-[IXSAppUninstallAlert initWithAppRecord:bundleIdentifier:removability:isManagedByManagedSettings:dele"
                  "tionIsRestricted:]";
            __int16 v34 = 2112;
            v35 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Failed to create app-specific strings bundle from path %@", buf, 0x16u);
          }
        }
        v27 = [v22 lastPathComponent];
        uint64_t v28 = [v27 stringByDeletingPathExtension];
        v29 = v14->_appStringsTableName;
        v14->_appStringsTableName = (NSString *)v28;
      }
    }
  }

  return v14;
}

+ (id)_loadHBMCloudSyncUtilityClass
{
  if (qword_100109E70 != -1) {
    dispatch_once(&qword_100109E70, &stru_1000E9D58);
  }
  v2 = (void *)qword_100109E78;

  return v2;
}

- (BOOL)deviceHasOneHomeEnabled
{
  return 0;
}

- (BOOL)appHasInstalledFonts
{
  fontFamilies = self->_fontFamilies;
  if (fontFamilies) {
    LOBYTE(fontFamilies) = [(NSArray *)fontFamilies count] != 0;
  }
  return (char)fontFamilies;
}

- (BOOL)needsShowFontsButton
{
  BOOL v3 = [(IXSAppUninstallAlert *)self appHasInstalledFonts];
  if (v3) {
    LOBYTE(v3) = [(NSArray *)self->_fontFamilies count] > 0xA;
  }
  return v3;
}

- (int64_t)installedFontCount
{
  v2 = [(IXSAppUninstallAlert *)self fontFamilies];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)customizedLocalizedStringForKey:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(IXSAppUninstallAlert *)self appStringsBundle];
  CFStringRef v6 = [(IXSAppUninstallAlert *)self appStringsTableName];
  BOOL v7 = (__CFString *)v6;
  v8 = 0;
  if (v5)
  {
    if (v6)
    {
      v8 = (__CFString *)CFBundleCopyLocalizedString(v5, v4, 0, v6);
      if (v8 == v4)
      {

        v9 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [(IXSUninstallAlert *)self bundleIdentifier];
          int v12 = 136315906;
          v13 = "-[IXSAppUninstallAlert customizedLocalizedStringForKey:]";
          __int16 v14 = 2112;
          v15 = v4;
          __int16 v16 = 2112;
          v17 = v7;
          __int16 v18 = 2112;
          v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: A value for the custom uninstall message key %@ was not found in the strings file named %@ for the current language in app %@; using default value instead",
            (uint8_t *)&v12,
            0x2Au);
        }
        v8 = 0;
      }
    }
  }

  return v8;
}

- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IXSAppUninstallAlert *)self customizedLocalizedStringForKey:v6];
  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)IXSAppUninstallAlert;
    v8 = [(IXSUninstallAlert *)&v10 localizedStringForKey:v6 withFormatHint:v7];
  }

  return v8;
}

- (id)appInstalledFonts
{
  if ([(IXSAppUninstallAlert *)self appHasInstalledFonts]
    && ![(IXSAppUninstallAlert *)self needsShowFontsButton])
  {
    id v3 = +[NSListFormatter localizedStringByJoiningStrings:self->_fontFamilies];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)title
{
  if ((id)[(IXSUninstallAlert *)self appRemovability] == (id)1)
  {
    id v3 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_TITLE_DELETE_WITH_NAME" withFormatHint:@"Delete “%@”?"];
    v4 = [(IXSUninstallAlert *)self appRecord];
    v5 = [v4 localizedName];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  }
  else
  {
    id v6 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_TITLE_NOT_ALLOWED" withFormatHint:@"Uninstall Not Allowed"];
  }

  return v6;
}

- (id)_customDeleteStringForMessagesApp
{
  id v3 = [(IXSUninstallAlert *)self appRecord];
  v4 = [v3 bundleIdentifier];
  id v29 = 0;
  BOOL v5 = sub_100038F14(v4, 17, &v29);
  id v6 = v29;

  if (v5 && v6)
  {
    id v7 = [v6 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_ICLOUD_ON_KEY"];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    __int16 v16 = [v6 objectForKeyedSubscript:@"TEST_MODE_APP_DELETION_UI_SAD_NUM_MEDIA_SHARED_KEY"];
    objc_opt_class();
    id v17 = v16;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if (!v9 || !v18)
    {

      unsigned int v20 = 0;
      goto LABEL_42;
    }
    unsigned __int8 v19 = [v9 BOOLValue];
    id v12 = [v18 unsignedIntegerValue];

    if ((v19 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_super v10 = +[IXSRemoteDeletionPromptManager sharedInstance];
    unsigned int v11 = [v10 iCloudIsEnabledForMessages];
    id v12 = [v10 sharedMediaInMessagesCount];

    if (!v11)
    {
LABEL_15:
      unsigned int v20 = 0;
      switch((unint64_t)v12)
      {
        case 0uLL:
          goto LABEL_42;
        case 1uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_ONE";
          CFStringRef v22 = @"Deleting this app will also delete one photo, video, or other item shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 2uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_TWO";
          CFStringRef v22 = @"Deleting this app will also delete two photos, videos, or other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 3uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_THREE";
          CFStringRef v22 = @"Deleting this app will also delete three photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 4uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_FOUR";
          CFStringRef v22 = @"Deleting this app will also delete four photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 5uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_FIVE";
          CFStringRef v22 = @"Deleting this app will also delete five photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 6uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_SIX";
          CFStringRef v22 = @"Deleting this app will also delete six photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 7uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_SEVEN";
          CFStringRef v22 = @"Deleting this app will also delete seven photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 8uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_EIGHT";
          CFStringRef v22 = @"Deleting this app will also delete eight photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
          goto LABEL_41;
        case 9uLL:
          CFStringRef v21 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD_NINE";
          CFStringRef v22 = @"Deleting this app will also delete nine photos, videos, and other items shared with you. This item will no longer appear in “Photos”.";
LABEL_41:
          unsigned int v20 = [(IXSAppUninstallAlert *)self localizedStringForKey:v21 withFormatHint:v22];
          break;
        default:
          v27 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_WITHOUT_ICLOUD" withFormatHint:@"Deleting this app will also delete %lu photos, videos, and other items shared with you. These items will no longer appear in “Photos”."];
          unsigned int v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v12);

          break;
      }
      goto LABEL_42;
    }
  }
  v13 = 0;
  switch((unint64_t)v12)
  {
    case 0uLL:
      break;
    case 1uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_ONE";
      CFStringRef v15 = @"One photo, video, or other item shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 2uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_TWO";
      CFStringRef v15 = @"Two photos, videos, or other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 3uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_THREE";
      CFStringRef v15 = @"Three photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 4uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_FOUR";
      CFStringRef v15 = @"Four photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 5uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_FIVE";
      CFStringRef v15 = @"Five photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 6uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_SIX";
      CFStringRef v15 = @"Six photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 7uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_SEVEN";
      CFStringRef v15 = @"Seven photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 8uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_EIGHT";
      CFStringRef v15 = @"Eight photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
      goto LABEL_27;
    case 9uLL:
      CFStringRef v14 = @"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND_NINE";
      CFStringRef v15 = @"Nine photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”.";
LABEL_27:
      v13 = [(IXSAppUninstallAlert *)self localizedStringForKey:v14 withFormatHint:v15];
      break;
    default:
      v23 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_SECOND" withFormatHint:@"%lu photos, videos, and other items shared with you will be deleted and no longer appear in “Photos”."];
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v12);

      break;
  }
  v24 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_MESSAGES_FIRST" withFormatHint:@"Deleting this app will not delete your messages stored in iCloud."];
  v25 = v24;
  if (v13)
  {
    id v26 = +[NSString stringWithFormat:@"%@\n\n%@", v24, v13];
  }
  else
  {
    id v26 = v24;
  }
  unsigned int v20 = v26;

LABEL_42:

  return v20;
}

- (id)message
{
  if (![(IXSUninstallAlert *)self appIsRemovable])
  {
    id v25 = 0;
    unsigned int v5 = [(IXSUninstallAlert *)self isMDMRestrictedWithOrganizationName:&v25];
    id v6 = v25;
    id v7 = v6;
    if (v5)
    {
      if (v6)
      {
        id v8 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_RESTRICTED_BY_ORGANIZATION" withFormatHint:@"This app cannot be deleted because it is required by %@."];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v7);
        id v9 = LABEL_7:;
LABEL_11:

LABEL_19:
        goto LABEL_20;
      }
      CFStringRef v11 = @"UNINSTALL_ICON_BODY_RESTRICTED_BY_UNKNOWN_ORGANIZATION";
      CFStringRef v12 = @"This app cannot be deleted because it is required.";
    }
    else
    {
      CFStringRef v11 = @"UNINSTALL_ICON_BODY_NOT_ALLOWED";
      CFStringRef v12 = @"It is not possible to uninstall this app at this time.";
    }
    id v9 = [(IXSAppUninstallAlert *)self localizedStringForKey:v11 withFormatHint:v12];
    goto LABEL_19;
  }
  if ([(IXSAppUninstallAlert *)self appManagedByManagedSettings])
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BODY_DELETE_APP_ENROLLED_IN_FAMILY_CONTROLS_WITH_NAME";
    CFStringRef v4 = @"“%@” is managing restrictions on this device, and deleting the app will require parent or guardian approval.";
LABEL_10:
    id v7 = [(IXSAppUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];
    id v8 = [(IXSUninstallAlert *)self appRecord];
    objc_super v10 = [v8 localizedName];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v10);

    goto LABEL_11;
  }
  if ([(IXSAppUninstallAlert *)self deviceHasOneHomeEnabled])
  {
    CFStringRef v3 = @"UNINSTALL_ONE_HOME_ICON_BODY_DELETE_WITH_NAME";
    CFStringRef v4 = @"When you delete the “%@” app, you’ll delete it from any other Apple TVs with this default user. You will also delete all of its data.";
    goto LABEL_10;
  }
  int64_t v13 = [(IXSAppUninstallAlert *)self installedFontCount];
  CFStringRef v14 = [(IXSUninstallAlert *)self appRecord];
  CFStringRef v15 = [v14 bundleIdentifier];
  if (([v15 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0)
  {

    goto LABEL_24;
  }
  __int16 v16 = +[IXGlobalConfiguration sharedInstance];
  unsigned int v17 = [v16 isiPad];

  if (!v17
    || ([(IXSAppUninstallAlert *)self _customDeleteStringForMessagesApp],
        (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_24:
    unsigned int v19 = [(IXSUninstallAlert *)self appHasiCloudDataOrDocuments];
    unsigned int v20 = [(IXSAppUninstallAlert *)self needsShowFontsButton];
    if (v19)
    {
      if (v20)
      {
        CFStringRef v21 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_AND_MANY_FONTS_LEAVES_DOCUMENTS_IN_CLOUD" withFormatHint:@"Deleting this app will also delete its data and %ld installed fonts, but any documents or data stored in iCloud will not be deleted."];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v13);
        id v9 = LABEL_33:;

        goto LABEL_20;
      }
      if (v13 == 1)
      {
        CFStringRef v22 = @"UNINSTALL_ICON_BODY_DELETE_DATA_AND_FONTS_LEAVES_DOCUMENTS_IN_CLOUD_SINGULAR";
        CFStringRef v23 = @"Deleting this app will also delete its data and the installed font %@, but any documents or data stored in iCloud will not be deleted.";
      }
      else
      {
        if (!v13)
        {
          CFStringRef v21 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_LEAVES_DOCUMENTS_IN_CLOUD" withFormatHint:@"Deleting this app will also delete its data, but any documents or data stored in iCloud will not be deleted."];
          goto LABEL_32;
        }
        CFStringRef v22 = @"UNINSTALL_ICON_BODY_DELETE_DATA_AND_FONTS_LEAVES_DOCUMENTS_IN_CLOUD_PLURAL";
        CFStringRef v23 = @"Deleting this app will also delete its data and the installed fonts %@, but any documents or data stored in iCloud will not be deleted.";
      }
      goto LABEL_41;
    }
    if (v20)
    {
      CFStringRef v21 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA_AND_MANY_FONTS" withFormatHint:@"Deleting this app will also delete its data and %ld installed fonts."];
      int64_t v24 = v13;
LABEL_32:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v24);
      goto LABEL_33;
    }
    if (v13 == 1)
    {
      CFStringRef v22 = @"UNINSTALL_ICON_BODY_DELETE_DATA_AND_FONTS_SINGULAR";
      CFStringRef v23 = @"Deleting this app will also delete its data and the following installed font: %@.";
    }
    else
    {
      if (!v13)
      {
        id v9 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BODY_DELETE_DATA" withFormatHint:@"Deleting this app will also delete its data."];
        goto LABEL_20;
      }
      CFStringRef v22 = @"UNINSTALL_ICON_BODY_DELETE_DATA_AND_FONTS_PLURAL";
      CFStringRef v23 = @"Deleting this app will also delete its data and the following installed fonts: %@.";
    }
LABEL_41:
    id v7 = [(IXSAppUninstallAlert *)self localizedStringForKey:v22 withFormatHint:v23];
    id v8 = [(IXSAppUninstallAlert *)self appInstalledFonts];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
    goto LABEL_7;
  }
LABEL_20:

  return v9;
}

- (id)defaultButtonLabel
{
  return [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_DELETE" withFormatHint:@"Delete"];
}

- (id)cancelButtonLabel
{
  return [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_BUTTON_CANCEL" withFormatHint:@"Cancel"];
}

- (id)otherButtonLabel
{
  if ([(IXSAppUninstallAlert *)self needsShowFontsButton])
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BUTTON_FONTS";
    CFStringRef v4 = @"Show Installed Fonts";
LABEL_5:
    unsigned int v5 = [(IXSAppUninstallAlert *)self localizedStringForKey:v3 withFormatHint:v4];
    goto LABEL_7;
  }
  if ([(IXSUninstallAlert *)self needsDemoteOptionButton])
  {
    CFStringRef v3 = @"UNINSTALL_ICON_BUTTON_OFFLOAD";
    CFStringRef v4 = @"Offload";
    goto LABEL_5;
  }
  unsigned int v5 = 0;
LABEL_7:

  return v5;
}

- (id)optionalButtonForNotRemovableAppLabel
{
  CFStringRef v3 = [(IXSUninstallAlert *)self appRecord];
  CFStringRef v4 = [v3 bundleIdentifier];
  id v10 = 0;
  BOOL v5 = sub_100038F14(v4, 14, &v10);
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:@"UNINSTALL_ICON_OPTION_BUTTON_NOT_ALLOWED"];
  }
  else
  {
    if ([(IXSUninstallAlert *)self appIsRemovable])
    {
      id v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(IXSAppUninstallAlert *)self localizedStringForKey:@"UNINSTALL_ICON_OPTION_BUTTON_NOT_ALLOWED" withFormatHint:0];
  }
  id v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)optionalButtonForNotRemovableAppActionURL
{
  CFStringRef v3 = [(IXSUninstallAlert *)self appRecord];
  CFStringRef v4 = [v3 bundleIdentifier];
  id v12 = 0;
  BOOL v5 = sub_100038F14(v4, 14, &v12);
  id v6 = v12;

  if (v5)
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:@"SBUninstallIconOverrideNotAllowedButtonURL"];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v8;
  }
  else
  {
    id v10 = [(IXSUninstallAlert *)self appRecord];
    id v8 = [v10 infoDictionary];
    id v9 = [v8 objectForKey:@"SBUninstallIconOverrideNotAllowedButtonURL" ofClass:objc_opt_class()];
  }

  return v9;
}

- (void)otherButtonActionWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(IXSAppUninstallAlert *)self needsShowFontsButton])
  {
    BOOL v5 = [(IXSUninstallAlert *)self bundleIdentifier];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000341DC;
    v7[3] = &unk_1000E9D80;
    id v8 = v4;
    +[FSUserFontManager deleteAppDialogWithIdentifier:v5 completionHandler:v7];
  }
  else if ([(IXSUninstallAlert *)self needsDemoteOptionButton])
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 5, 0);
  }
  else
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000901CC(self, v6);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)dealloc
{
  appStringsBundle = self->_appStringsBundle;
  if (appStringsBundle) {
    CFRelease(appStringsBundle);
  }
  self->_appStringsBundle = 0;
  v4.receiver = self;
  v4.super_class = (Class)IXSAppUninstallAlert;
  [(IXSUninstallAlert *)&v4 dealloc];
}

- (NSArray)fontFamilies
{
  return self->_fontFamilies;
}

- (BOOL)appManagedByManagedSettings
{
  return self->_appManagedByManagedSettings;
}

- (__CFBundle)appStringsBundle
{
  return self->_appStringsBundle;
}

- (NSString)appStringsTableName
{
  return self->_appStringsTableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStringsTableName, 0);

  objc_storeStrong((id *)&self->_fontFamilies, 0);
}

@end