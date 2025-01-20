@interface NSAttributedString(BulletinBoard)
+ (id)_bb_attributedStringWithRTFDData:()BulletinBoard;
- (id)_bb_RTFDData;
- (void)_bb_RTFDData;
@end

@implementation NSAttributedString(BulletinBoard)

+ (id)_bb_attributedStringWithRTFDData:()BulletinBoard
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v13[0] = @"DocumentType";
    v13[1] = @"DefaultAttributes";
    v14[0] = @"NSRTFD";
    v14[1] = MEMORY[0x263EFFA78];
    v3 = NSDictionary;
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v12 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithData:v4 options:v5 documentAttributes:0 error:&v12];

    id v7 = v12;
    if (v7)
    {
      v8 = BBLogGeneral;
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
        +[NSAttributedString(BulletinBoard) _bb_attributedStringWithRTFDData:](v8);
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

- (id)_bb_RTFDData
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  uint64_t v9 = @"DocumentType";
  v10[0] = @"NSRTFD";
  v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = 0;
  id v4 = objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v2, v3, &v8);
  id v5 = v8;
  if (v5)
  {
    v6 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[NSAttributedString(BulletinBoard) _bb_RTFDData](v6);
    }
  }

  return v4;
}

+ (void)_bb_attributedStringWithRTFDData:()BulletinBoard .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "Failed to create attributed string from RTFD data", v1, 2u);
}

- (void)_bb_RTFDData
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "Failed to create RTFD data from attributed string", v1, 2u);
}

@end