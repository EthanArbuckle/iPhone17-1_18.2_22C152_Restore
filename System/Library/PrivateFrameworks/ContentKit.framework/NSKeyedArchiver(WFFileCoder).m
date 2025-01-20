@interface NSKeyedArchiver(WFFileCoder)
+ (id)wf_securelyArchivedDataWithRootObject:()WFFileCoder fileCoder:;
@end

@implementation NSKeyedArchiver(WFFileCoder)

+ (id)wf_securelyArchivedDataWithRootObject:()WFFileCoder fileCoder:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F08910];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initRequiringSecureCoding:1];
  [v8 setWfFileCoder:v6];
  [v8 encodeObject:v7 forKey:*MEMORY[0x263F081D0]];

  [v8 encodeObject:v6 forKey:@"WFFileCoder"];
  v9 = [v8 encodedData];
  if (!v9)
  {
    v10 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v8 error];
      int v13 = 136315394;
      v14 = "+[NSKeyedArchiver(WFFileCoder) wf_securelyArchivedDataWithRootObject:fileCoder:]";
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_ERROR, "%s Failed to encode data: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v9;
}

@end