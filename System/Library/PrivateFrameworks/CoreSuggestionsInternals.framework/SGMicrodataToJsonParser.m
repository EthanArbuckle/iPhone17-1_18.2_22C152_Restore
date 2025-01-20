@interface SGMicrodataToJsonParser
+ (id)parseMicrodataToJsonLd:(id)a3 error:(id *)a4;
@end

@implementation SGMicrodataToJsonParser

+ (id)parseMicrodataToJsonLd:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1CB79B230]();
  v7 = +[SGMicrodataParser parse:v5];
  v8 = [v7 asJsonLd];

  if ([v8 count])
  {
    uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:1 error:a4];
    if (v9)
    {
      v10 = v9;
      v11 = (__CFString *)[[NSString alloc] initWithData:v9 encoding:4];
    }
    else
    {
      v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "Error: Failed to serialize to JSON", v14, 2u);
      }

      v10 = 0;
      v11 = 0;
    }
  }
  else
  {
    v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "JSON Data is Empty. Nothing to return.", buf, 2u);
    }
    v11 = &stru_1F24EEF20;
  }

  return v11;
}

@end