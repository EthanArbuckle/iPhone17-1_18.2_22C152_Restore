@interface NSAttributedString(UserNotifications)
+ (id)_un_attributedStringWithRTFDData:()UserNotifications;
- (id)_un_RTFDData;
- (id)_un_attributedStringByKeepingOnlyAttachmentAttributes;
- (id)_un_truncatedAttributedStringToMaxLength:()UserNotifications;
- (void)_un_RTFDData;
@end

@implementation NSAttributedString(UserNotifications)

+ (id)_un_attributedStringWithRTFDData:()UserNotifications
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = @"DocumentType";
    v13[1] = @"DefaultAttributes";
    v14[0] = @"NSRTFD";
    v14[1] = MEMORY[0x1E4F1CC08];
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v12 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithData:v4 options:v5 documentAttributes:0 error:&v12];

    id v7 = v12;
    if (v7)
    {
      v8 = UNLogUtilities;
      if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR)) {
        +[NSAttributedString(UserNotifications) _un_attributedStringWithRTFDData:](v8);
      }
    }
    uint64_t v9 = [v6 length];
    objc_msgSend(v6, "removeAttribute:range:", @"NSFont", 0, v9);
    objc_msgSend(v6, "removeAttribute:range:", @"NSParagraphStyle", 0, v9);
    v10 = (void *)[v6 copy];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_un_RTFDData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  uint64_t v9 = @"DocumentType";
  v10[0] = @"NSRTFD";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = 0;
  id v4 = objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v2, v3, &v8);
  id v5 = v8;
  if (v5)
  {
    v6 = UNLogUtilities;
    if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR)) {
      -[NSAttributedString(UserNotifications) _un_RTFDData](v6);
    }
  }

  return v4;
}

- (id)_un_truncatedAttributedStringToMaxLength:()UserNotifications
{
  if ([a1 length] <= a3)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "attributedSubstringFromRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_un_attributedStringByKeepingOnlyAttachmentAttributes
{
  uint64_t v2 = (void *)[a1 mutableCopy];
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__NSAttributedString_UserNotifications___un_attributedStringByKeepingOnlyAttachmentAttributes__block_invoke;
  v6[3] = &unk_1E5F06208;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v6);

  return v4;
}

+ (void)_un_attributedStringWithRTFDData:()UserNotifications .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE729000, log, OS_LOG_TYPE_ERROR, "Failed to create attributed string from RTFD data", v1, 2u);
}

- (void)_un_RTFDData
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE729000, log, OS_LOG_TYPE_ERROR, "Failed to create RTFD data from attributed string", v1, 2u);
}

@end