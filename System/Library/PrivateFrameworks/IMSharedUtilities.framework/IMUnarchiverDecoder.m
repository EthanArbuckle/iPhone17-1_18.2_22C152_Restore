@interface IMUnarchiverDecoder
+ (id)_decodeEncodedData:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5;
+ (id)decodeEncodedDataSecurely:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5;
@end

@implementation IMUnarchiverDecoder

+ (id)_decodeEncodedData:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Decoding data of length %@", buf, 0xCu);
    }
  }
  id v22 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v22];
  id v11 = v22;
  if (objc_opt_respondsToSelector())
  {
    [v10 _enableStrictSecureDecodingMode];
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "strict-decoding 009 _enableStrictSecureDecodingMode called with error:[%@]", buf, 0xCu);
      }
    }
  }
  [v10 setDecodingFailurePolicy:0];
  v13 = [v10 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F284E8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Successfully decoded data!", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = (id)objc_opt_class();
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v24 = v17;
        __int16 v25 = 2112;
        v26 = v18;
        id v19 = v18;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Could not decode data because decoded object was of class %@ instead of expected class %@", buf, 0x16u);
      }
    }
    id v14 = 0;
  }
  id v20 = v14;

  return v20;
}

+ (id)decodeEncodedDataSecurely:(id)a3 ofClass:(Class)a4 includesAllowlistedClasses:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[IMUnarchiverDecoder _decodeEncodedData:v7 ofClass:a4 includesAllowlistedClasses:v8];

  return v9;
}

@end