@interface BPSStingSetupModel
+ (id)defaultBundleIDForActionType:(unint64_t)a3;
+ (id)fileNameForIdentifier:(id)a3;
+ (id)subtitleForActionType:(unint64_t)a3;
- (BOOL)_shouldShowItem:(id)a3 isTinker:(BOOL)a4 compassInstalled:(BOOL)a5;
- (BPSStingSetupModel)init;
- (id)_modelItemWithActionType:(unint64_t)a3;
- (id)defaultSetupActionItems;
@end

@implementation BPSStingSetupModel

+ (id)defaultBundleIDForActionType:(unint64_t)a3
{
  if (a3 - 1 > 0x27) {
    return 0;
  }
  else {
    return *(&off_C300 + a3 - 1);
  }
}

+ (id)fileNameForIdentifier:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  v5 = @"StartDive";
  if (v3) {
    v5 = v3;
  }
  v6 = v5;
  v7 = +[NRPairedDeviceRegistry sharedInstance];
  v8 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v9 = [v7 getAllDevicesWithArchivedAltAccountDevicesMatching:v8];
  v10 = [v9 firstObject];

  v11 = +[UIApplication sharedApplication];
  if ([v11 userInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    unsigned __int8 v12 = [(__CFString *)v4 isEqualToString:@"StartWorkout"];

    if (v12)
    {
      CFStringRef v13 = @"-RTL-N199";
      goto LABEL_11;
    }
  }
  else
  {
  }
  if ([(__CFString *)v4 isEqualToString:@"StartBacktrack"]
    && (id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"622B6312-95FA-4F09-9148-69E286A9C31F"], v15 = objc_msgSend(v10, "supportsCapability:", v14), v14, !v15))
  {
    CFStringRef v13 = @"-PreWorkoutBacktrack-N199";
  }
  else
  {
    CFStringRef v13 = @"-N199";
  }
LABEL_11:
  v16 = [(__CFString *)v6 stringByAppendingString:v13];

  v17 = bps_setup_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v16;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Using: %@ for action button animation", (uint8_t *)&v19, 0xCu);
  }

  return v16;
}

+ (id)subtitleForActionType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_FLASHLIGHT";
      break;
    case 4uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_STOPWATCH";
      break;
    case 5uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_WAYPOINT";
      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_WORKOUT";
      break;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_BACKTRACK";
      break;
    case 0x14uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_DIVE";
      break;
    case 0x19uLL:
    case 0x1AuLL:
    case 0x28uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_START_STOP";
      break;
    case 0x26uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_ACCESSIBILITY";
      break;
    default:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      v4 = v3;
      CFStringRef v5 = @"STING_SUBTITLE_DEFAULT";
      break;
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_C4E0 table:@"Localizable-N199"];

  return v6;
}

- (BPSStingSetupModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)BPSStingSetupModel;
  v2 = [(BPSStingSetupModel *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(BPSStingSetupModel *)v2 defaultQuickActionItems];
    defaultSetupActionItems = v3->_defaultSetupActionItems;
    v3->_defaultSetupActionItems = (NSArray *)v4;
  }
  return v3;
}

- (BOOL)_shouldShowItem:(id)a3 isTinker:(BOOL)a4 compassInstalled:(BOOL)a5
{
  id v7 = a3;
  v8 = [v7 actionType];
  v9 = (char *)[v8 integerValue];

  if (v9 == (unsigned char *)&dword_0 + 2)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [v7 actionType];
    if ([v11 integerValue] == &dword_C)
    {
    }
    else
    {
      unsigned __int8 v12 = [v7 actionType];
      CFStringRef v13 = (char *)[v12 integerValue];

      if (v13 != (unsigned char *)&dword_4 + 1)
      {
        BOOL v10 = 1;
        goto LABEL_8;
      }
    }
    BOOL v10 = a5 & ~a4;
  }
LABEL_8:

  return v10;
}

- (id)_modelItemWithActionType:(unint64_t)a3
{
  uint64_t v4 = +[CSLPRFStingSettingsModel actionNameForActionType:](CSLPRFStingSettingsModel, "actionNameForActionType:");
  CFStringRef v5 = +[CSLPRFStingSettingsModel sfSymbolAssetNameForActionType:a3];
  v6 = CSLPRFLinkActionTypeToIdentifier();
  id v7 = objc_alloc((Class)CSLPRFStingSettingsItem);
  v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = [v7 initWithIdentifier:v6 title:v4 actionType:v8 assetName:v5];

  return v9;
}

- (id)defaultSetupActionItems
{
  v24 = objc_opt_new();
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v4 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  CFStringRef v5 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v4];
  v6 = [v5 firstObject];

  v23 = v6;
  id v7 = [v6 valueForProperty:NRDevicePropertyIsAltAccount];
  id v8 = [v7 BOOLValue];

  id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.compass" allowPlaceholder:0 error:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v10 = self->_defaultSetupActionItems;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned int v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 actionType];
        v17 = (char *)[v16 integerValue];

        if (v17 == (unsigned char *)&dword_4 + 2)
        {
          v18 = +[NSNumber numberWithInteger:9];
          [v15 setActionType:v18];
        }
        if ([(BPSStingSetupModel *)self _shouldShowItem:v15 isTinker:v8 compassInstalled:v9 != 0])
        {
          [v24 addObject:v15];
        }
        else
        {
          int v19 = bps_setup_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = [v15 title];
            *(_DWORD *)buf = 136315394;
            v30 = "-[BPSStingSetupModel defaultSetupActionItems]";
            __int16 v31 = 2112;
            v32 = v20;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%s: Not adding %@ to sting tile list", buf, 0x16u);
          }
        }
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v12);
  }

  id v21 = [v24 copy];

  return v21;
}

- (void).cxx_destruct
{
}

@end