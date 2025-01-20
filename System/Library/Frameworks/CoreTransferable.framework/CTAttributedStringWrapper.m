@interface CTAttributedStringWrapper
+ (BOOL)containsAttachments:(id)a3;
+ (id)attributedStringFromData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
+ (id)dataFromAttributedString:(id)a3 range:(_NSRange)a4 documentAttributes:(id)a5 error:(id *)a6;
@end

@implementation CTAttributedStringWrapper

+ (id)attributedStringFromData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_initWithData_options_documentAttributes_error_])
  {
    id v11 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithData:v9 options:v10 documentAttributes:a5 error:a6];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"Conversion of binary data into attributed string is not supported on this platform";
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a6 = (id)[v12 initWithDomain:@"NSAttributedStringConversionErrorDomain" code:1 userInfo:v13];

    id v11 = objc_alloc_init(MEMORY[0x263F086A0]);
  }
  v14 = v11;

  return v14;
}

+ (id)dataFromAttributedString:(id)a3 range:(_NSRange)a4 documentAttributes:(id)a5 error:(id *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v18[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v10, "dataFromRange:documentAttributes:error:", location, length, v11, a6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Conversion of attributed string into binary data is not supported on this platform";
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a6 = (id)[v13 initWithDomain:@"NSAttributedStringConversionErrorDomain" code:1 userInfo:v14];

    id v12 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  }
  v15 = v12;

  return v15;
}

+ (BOOL)containsAttachments:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_containsAttachments]) {
    char v4 = [v3 containsAttachments];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end