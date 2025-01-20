@interface LogForCategory
@end

@implementation LogForCategory

void __LogForCategory_block_invoke(id a1)
{
  v12[2] = a1;
  v12[1] = a1;
  id v1 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:];
  v2 = (void *)gLogsDict;
  gLogsDict = (uint64_t)v1;

  v14[0] = @"FontServices";
  v14[1] = @"UserFontManager";
  v14[2] = @"FSUserFontManager";
  v14[3] = @"FontProvider";
  v14[4] = @"FontProviderManager";
  v14[5] = @"FontProviderLoader";
  v14[6] = @"fontservicesd";
  v14[7] = @"ServicesDaemonManager";
  v14[8] = @"FontPickerSupport";
  v14[9] = @"FontInstallViewService";
  v12[0] = +[NSArray arrayWithObjects:v14 count:10];
  memset(__b, 0, sizeof(__b));
  id obj = v12[0];
  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      os_log_t v9 = os_log_create("com.apple.FontServices", (const char *)[v11 UTF8String]);
      [(id)gLogsDict setObject:v9 forKey:v11];
      objc_storeStrong((id *)&v9, 0);
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0;
        id v6 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v12, 0);
}

@end