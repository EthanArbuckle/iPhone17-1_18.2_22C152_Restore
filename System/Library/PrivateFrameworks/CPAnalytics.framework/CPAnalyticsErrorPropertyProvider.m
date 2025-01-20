@interface CPAnalyticsErrorPropertyProvider
+ (id)_indepthErrorFromError:(id)a3;
- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (void)registerSystemProperties:(id)a3;
@end

@implementation CPAnalyticsErrorPropertyProvider

+ (id)_indepthErrorFromError:(id)a3
{
  v3 = [a3 userInfo];
  uint64_t v4 = *MEMORY[0x263F08608];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v5)
  {
    v6 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
    id v7 = v5;
    unint64_t v8 = 0;
    do
    {
      v9 = v7;
      v10 = [v7 domain];
      -[__CFString appendFormat:](v6, "appendFormat:", @"%@:%ld|", v10, [v9 code]);

      v11 = [v9 userInfo];
      id v7 = [v11 objectForKeyedSubscript:v4];

      if (v8 > 1) {
        break;
      }
      ++v8;
    }
    while (v7);
    -[__CFString deleteCharactersInRange:](v6, "deleteCharactersInRange:", [(__CFString *)v6 length] - 1, 1);
  }
  else
  {
    v6 = @"None";
  }

  return v6;
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v6 = a3;
  id v7 = [a5 objectForKeyedSubscript:@"cpa_error"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 isEqualToString:@"cpa_error_domain"])
    {
      uint64_t v8 = [v7 domain];
LABEL_12:
      v9 = (void *)v8;
      goto LABEL_14;
    }
    if ([v6 isEqualToString:@"cpa_error_code"])
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"cpa_error_codeAsString"])
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v7, "code"));
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"cpa_error_description"])
    {
      uint64_t v8 = [v7 description];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"cpa_error_indepthErrors"])
    {
      uint64_t v8 = [(id)objc_opt_class() _indepthErrorFromError:v7];
      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (void)registerSystemProperties:(id)a3
{
  id v4 = a3;
  [v4 addDynamicProperty:@"cpa_error_domain" withProvider:self];
  [v4 addDynamicProperty:@"cpa_error_code" withProvider:self];
  [v4 addDynamicProperty:@"cpa_error_codeAsString" withProvider:self];
  [v4 addDynamicProperty:@"cpa_error_description" withProvider:self];
  [v4 addDynamicProperty:@"cpa_error_indepthErrors" withProvider:self];
}

@end