@interface BCSSMSTODataParser
+ (id)parseString:(id)a3;
@end

@implementation BCSSMSTODataParser

+ (id)parseString:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4) {
    +[BCSSMSTODataParser parseString:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ((unint64_t)[v3 length] > 5)
  {
    v21 = [v3 substringToIndex:6];
    v22 = [v21 lowercaseString];

    if ([v22 isEqualToString:@"smsto:"])
    {
      v23 = [v3 substringFromIndex:6];
      uint64_t v24 = [v23 rangeOfString:@":"];
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = 0;
      }
      else
      {
        uint64_t v34 = v24;
        v25 = [v23 substringFromIndex:v24 + 1];
        uint64_t v35 = [v23 substringToIndex:v34];

        v23 = (void *)v35;
      }
      v36 = objc_msgSend(v23, "_bcs_trimmedString");

      uint64_t v37 = [v25 length];
      v38 = NSString;
      if (v37)
      {
        v39 = objc_msgSend(v25, "_bcs_urlEncodedQueryValue");
        v40 = [v38 stringWithFormat:@"sms:%@&body=%@", v36, v39];
      }
      else
      {
        v40 = [NSString stringWithFormat:@"sms:%@", v36];
      }
      v41 = [BCSParsedURLData alloc];
      v42 = [NSURL URLWithString:v40];
      v20 = [(BCSParsedURLData *)v41 initWithURL:v42 type:5];
    }
    else
    {
      BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v26) {
        +[BCSSMSTODataParser parseString:](v26, v27, v28, v29, v30, v31, v32, v33);
      }
      v20 = 0;
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v12) {
      +[BCSSMSTODataParser parseString:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = 0;
  }

  return v20;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end