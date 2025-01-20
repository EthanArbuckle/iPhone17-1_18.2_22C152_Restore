@interface NSError(HFErrorAdditions)
+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:;
+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:arguments:;
+ (id)hf_errorWithCode:()HFErrorAdditions title:description:;
+ (id)hf_internalErrorWithDescription:()HFErrorAdditions;
+ (id)hf_mappedHMError:()HFErrorAdditions;
+ (uint64_t)hf_errorWithCode:()HFErrorAdditions;
+ (uint64_t)hf_errorWithCode:()HFErrorAdditions description:;
- (BOOL)hf_isHFErrorWithCode:()HFErrorAdditions;
@end

@implementation NSError(HFErrorAdditions)

+ (uint64_t)hf_errorWithCode:()HFErrorAdditions
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"HFErrorDomain" code:a3 userInfo:MEMORY[0x263EFFA78]];
}

+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:
{
  v9 = objc_msgSend(a1, "hf_errorWithCode:descriptionFormat:arguments:", a3, a4, &a9);
  return v9;
}

+ (uint64_t)hf_errorWithCode:()HFErrorAdditions description:
{
  return objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:title:description:", a3, 0, a4);
}

+ (id)hf_errorWithCode:()HFErrorAdditions title:description:
{
  v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 dictionary];
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  [v11 setObject:v9 forKeyedSubscript:@"HFErrorUserInfoOptionTitleKey"];

  [v11 setObject:v8 forKeyedSubscript:@"HFErrorUserInfoOptionDescriptionKey"];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];

  v12 = (void *)[v11 copy];
  [v10 setObject:v12 forKeyedSubscript:@"HFErrorUserInfoOptionsKey"];

  v13 = (void *)MEMORY[0x263F087E8];
  v14 = (void *)[v10 copy];
  v15 = [v13 errorWithDomain:@"HFErrorDomain" code:a3 userInfo:v14];

  return v15;
}

+ (id)hf_errorWithCode:()HFErrorAdditions descriptionFormat:arguments:
{
  v7 = (objc_class *)NSString;
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initWithFormat:v8 arguments:a5];

  v10 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:title:description:", a3, 0, v9);

  return v10;
}

+ (id)hf_internalErrorWithDescription:()HFErrorAdditions
{
  id v9 = objc_msgSend(a1, "hf_errorWithCode:descriptionFormat:arguments:", -1, a3, &a9);
  return v9;
}

+ (id)hf_mappedHMError:()HFErrorAdditions
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = *MEMORY[0x263F0C710];
  int v6 = [v4 isEqualToString:*MEMORY[0x263F0C710]];

  if (v6)
  {
    id v7 = v3;
LABEL_8:
    id v9 = v7;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "na_isCancelledError"))
  {
    uint64_t v8 = 2001;
LABEL_7:
    id v7 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v5 code:v8 userInfo:0];
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "na_isTimeoutError"))
  {
LABEL_6:
    uint64_t v8 = 8;
    goto LABEL_7;
  }
  v11 = [v3 domain];
  int v12 = [v11 isEqualToString:@"HFErrorDomain"];

  if (v12)
  {
    uint64_t v13 = [v3 code];
    id v9 = 0;
    if (v13 > 33)
    {
      uint64_t v8 = 2001;
      switch(v13)
      {
        case '""':
          uint64_t v8 = 54;
          goto LABEL_7;
        case '#':
          uint64_t v8 = 4;
          goto LABEL_7;
        case '$':
        case '&':
          goto LABEL_9;
        case '%':
          goto LABEL_7;
        case '\'':
          goto LABEL_6;
        default:
          if (v13 != 46) {
            goto LABEL_9;
          }
          uint64_t v8 = 96;
          break;
      }
      goto LABEL_7;
    }
    switch(v13)
    {
      case 6:
        goto LABEL_6;
      case 21:
        uint64_t v8 = 13;
        goto LABEL_7;
      case 22:
        uint64_t v8 = 2004;
        goto LABEL_7;
    }
  }
  else
  {
    id v9 = 0;
  }
LABEL_9:

  return v9;
}

- (BOOL)hf_isHFErrorWithCode:()HFErrorAdditions
{
  uint64_t v5 = [a1 domain];
  int v6 = [v5 isEqualToString:@"HFErrorDomain"];

  return v6 && [a1 code] == a3;
}

@end