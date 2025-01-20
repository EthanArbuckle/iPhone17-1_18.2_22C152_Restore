@interface IMFileTransfer
- (BOOL)shouldFastSend;
@end

@implementation IMFileTransfer

- (BOOL)shouldFastSend
{
  v3 = +[IDSServerBag sharedInstanceForBagType:0];
  v4 = [v3 objectForKey:@"should-not-fast-send"];
  v5 = v4;
  if (v4 && [(__CFString *)v4 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [(IMFileTransfer *)self guid];
        int v13 = 138412546;
        v14 = v7;
        __int16 v15 = 2112;
        CFStringRef v16 = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Not fast sending transfer %@ due to server override %@", (uint8_t *)&v13, 0x16u);
      }
    }
    unsigned __int8 v8 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int v10 = [(IMFileTransfer *)self isSticker];
        CFStringRef v11 = @"NO";
        if (v10) {
          CFStringRef v11 = @"YES";
        }
        int v13 = 138412546;
        v14 = v5;
        __int16 v15 = 2112;
        CFStringRef v16 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "shouldFastSend serverbag %@,  isSticker %@", (uint8_t *)&v13, 0x16u);
      }
    }
    unsigned __int8 v8 = [(IMFileTransfer *)self isSticker];
  }

  return v8;
}

@end