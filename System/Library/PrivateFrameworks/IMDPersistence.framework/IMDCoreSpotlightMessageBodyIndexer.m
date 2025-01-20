@interface IMDCoreSpotlightMessageBodyIndexer
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageBodyIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v14 = [v10 objectForKey:@"balloonBundleID"];
  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Message is a balloon plugin type, deferring to later indexers", (uint8_t *)&v24, 2u);
      }
    }
  }
  else
  {
    v16 = [v10 objectForKey:@"attributedBody"];
    v17 = [v16 string];

    v18 = _IMDCoreSpotlightStrippedBody(v10, @"plainBody", v17);
    v19 = [MEMORY[0x1E4F6C360] sharedInstance];
    if ([v19 isInternalInstall])
    {
      int v20 = IMGetCachedDomainBoolForKeyWithDefaultValue();

      if (v20)
      {
        if ([v18 isEqualToString:@"poison_abort"])
        {
          if (IMOSLoggingEnabled())
          {
            v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              LOWORD(v24) = 0;
              _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "IMDCoreSpotlightMessageBodyIndexer - Poison pill abort detected, crashing!", (uint8_t *)&v24, 2u);
            }
          }
          abort();
        }
        if ([v18 isEqualToString:@"poison_spin"])
        {
          if (IMOSLoggingEnabled())
          {
            v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              LOWORD(v24) = 0;
              _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "(IMDCoreSpotlightMessageBodyIndexer - Poison pill spin detected, hanging!", (uint8_t *)&v24, 2u);
            }
          }
          while (1)
            ;
        }
      }
    }
    else
    {
    }
    [v12 setTextContent:v18];
    [v12 setMessageType:@"msg"];
    if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        v25 = v18;
        _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "setting text content %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

@end