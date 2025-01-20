@interface IMSharedMessageAppSummary
+ (Class)dataSourceClass;
+ (id)linkMetadataForPluginPayload:(id)a3;
+ (id)pluginPath;
+ (id)previewSummary;
+ (id)previewSummaryWithPluginPayload:(id)a3;
@end

@implementation IMSharedMessageAppSummary

+ (Class)dataSourceClass
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E94FF570 != -1) {
    dispatch_once(&qword_1E94FF570, &unk_1EF2BF500);
  }
  v3 = (void *)[a1 pluginPath];
  Class result = (Class)[v3 length];
  if (result)
  {
    [(id)qword_1E94FF558 lock];
    Class v5 = (Class)[(id)qword_1E94FF560 objectForKeyedSubscript:v3];
    v6 = v5;
    if (!v5)
    {
      if ([(id)qword_1E94FF568 containsObject:v3])
      {
        Class v5 = 0;
      }
      else
      {
        uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v7];
        if (([v8 load] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              int v11 = 138412290;
              v12 = v3;
              _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "IMSharedMessageAppSummary - Failed to load bundle at path %@", (uint8_t *)&v11, 0xCu);
            }
          }
        }
        Class v5 = NSClassFromString((NSString *)objc_msgSend((id)objc_msgSend(v8, "infoDictionary"), "objectForKey:", @"CKDatasourceClass"));
        v10 = v5;
        if (v5) {
          [(id)qword_1E94FF560 setObject:v5 forKey:v3];
        }
        else {
          [(id)qword_1E94FF568 addObject:v3];
        }
      }
    }
    [(id)qword_1E94FF558 unlock];
    return v5;
  }
  return result;
}

+ (id)pluginPath
{
  return 0;
}

+ (id)previewSummary
{
  uint64_t v2 = [(id)objc_opt_class() dataSourceClass];

  return (id)MEMORY[0x1F4181798](v2, sel_previewSummary);
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel_previewSummary);
}

+ (id)linkMetadataForPluginPayload:(id)a3
{
  return 0;
}

@end