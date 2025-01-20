@interface IMInternalPayloadUtilities
+ (BOOL)writeData:(id)a3 toURL:(id)a4;
+ (BOOL)writeDataPayloadToDisk:(id)a3 fileName:(id)a4;
+ (BOOL)writeMessagePayloadToDisk:(id)a3 fileName:(id)a4;
+ (BOOL)writePayload:(id)a3 toURL:(id)a4;
+ (id)writeMessagePayloadToTemporaryDirectory:(id)a3 fileName:(id)a4;
@end

@implementation IMInternalPayloadUtilities

+ (BOOL)writePayload:(id)a3 toURL:(id)a4
{
  int v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall");
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:0];
    LOBYTE(v7) = [a1 writeData:v8 toURL:a4];
  }
  return v7;
}

+ (BOOL)writeData:(id)a3 toURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall"))
  {
    uint64_t v14 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(a4, "URLByDeletingLastPathComponent"), 1, 0, 0);
    int v6 = [a3 writeToURL:a4 options:1 error:&v14];
    int v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = a4;
          v9 = "Write successful to %@";
          v10 = v8;
          uint32_t v11 = 12;
LABEL_11:
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
        }
      }
    }
    else if (v7)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = a4;
        __int16 v17 = 2112;
        uint64_t v18 = v14;
        v9 = "Write failed to %@ (error: %@)";
        v10 = v13;
        uint32_t v11 = 22;
        goto LABEL_11;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)writeMessagePayloadToDisk:(id)a3 fileName:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall");
  if (v6)
  {
    int v7 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    LOBYTE(v6) = 0;
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = (uint64_t)a4;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Incoming message will be written to %@", buf, 0xCu);
        }
      }
      uint64_t v9 = [NSString stringWithFormat:@"/var/mobile/Library/SMS/%@", a4];
      int v6 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v6)
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v14 = v9;
            _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Will log message payload to path: %@", buf, 0xCu);
          }
        }
        LOBYTE(v6) = +[IMInternalPayloadUtilities writePayload:toURL:](IMInternalPayloadUtilities, "writePayload:toURL:", a3, [MEMORY[0x1E4F1CB10] fileURLWithPath:v9]);
      }
      else if (v6)
      {
        uint32_t v11 = OSLogHandleForIMFoundationCategory();
        int v6 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Unable to log message payload to disk: path is nil", buf, 2u);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

+ (BOOL)writeDataPayloadToDisk:(id)a3 fileName:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall");
  if (v6)
  {
    int v7 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    LOBYTE(v6) = 0;
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v14 = (uint64_t)a4;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Incoming data payload will be written to %@", buf, 0xCu);
        }
      }
      uint64_t v9 = [NSString stringWithFormat:@"/var/mobile/Library/SMS/%@", a4];
      int v6 = IMOSLoggingEnabled();
      if (v9)
      {
        if (v6)
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v14 = v9;
            _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Will log data payload to path: %@", buf, 0xCu);
          }
        }
        LOBYTE(v6) = +[IMInternalPayloadUtilities writeData:toURL:](IMInternalPayloadUtilities, "writeData:toURL:", a3, [MEMORY[0x1E4F1CB10] fileURLWithPath:v9]);
      }
      else if (v6)
      {
        uint32_t v11 = OSLogHandleForIMFoundationCategory();
        int v6 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v6)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Unable to log data payload to disk: path is nil", buf, 2u);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

+ (id)writeMessagePayloadToTemporaryDirectory:(id)a3 fileName:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall")) {
    return 0;
  }
  int v6 = (void *)[IMSafeTemporaryDirectory() path];
  if (![v6 length]) {
    return 0;
  }
  v12[0] = v6;
  v12[1] = @"MessagesBlastDoorFailedPayloads";
  v12[2] = a4;
  int v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 3));
  if (!+[IMInternalPayloadUtilities writePayload:a3 toURL:v7])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        uint32_t v11 = v7;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Failed to write error payload to path %@", (uint8_t *)&v10, 0xCu);
      }
    }
    return 0;
  }
  return v7;
}

@end