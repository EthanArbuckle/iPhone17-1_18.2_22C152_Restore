@interface CoreBTtriggerFLR
@end

@implementation CoreBTtriggerFLR

void __CoreBTtriggerFLR_block_invoke(id a1, NSDictionary *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  [(id)CoreBT::cbController invalidate];
  if (!v4 || v5)
  {
    v6 = log_get_logging_obg("com.apple.threadradiod", "default");
    if (v6)
    {
      if (syslog_is_the_mask_enabled(6))
      {
        v7 = v6;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = CUPrintNSError();
          int v12 = 138412546;
          v13 = v4;
          __int16 v14 = 2112;
          v15 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "### Core Dump inResponse: %@,  inError: %@\n", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      -[PowerEventHandler_Rcp init:]();
    }
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = log_get_logging_obg("com.apple.threadradiod", "default");
  if (v10)
  {
    if (syslog_is_the_mask_enabled(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = &stru_1004A31D0;
      if (v9) {
        CFStringRef v11 = v9;
      }
      int v12 = 138412290;
      v13 = (void *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CoreBTtriggerFLR is done with %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    -[PowerEventHandler_Rcp init:]();
  }
}

@end