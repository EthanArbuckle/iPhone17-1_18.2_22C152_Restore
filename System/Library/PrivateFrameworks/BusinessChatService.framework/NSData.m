@interface NSData
+ (id)bcs_dataWithHexString:(uint64_t)a1;
@end

@implementation NSData

+ (id)bcs_dataWithHexString:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  if ([v2 length])
  {
    v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[NSData(BCSHexString) bcs_dataWithHexString:]";
      __int16 v15 = 2112;
      id v16 = v2;
      _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Hex strings should have an even number of digits (%@)", buf, 0x16u);
    }
  }
  else
  {
    char v12 = 0;
    v3 = malloc_type_malloc((unint64_t)[v2 length] >> 1, 0xF2716DC8uLL);
    if (![v2 length])
    {
LABEL_6:
      v6 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v3, (unint64_t)objc_msgSend(v2, "length") >> 1, 1);
      goto LABEL_14;
    }
    unint64_t v4 = 0;
    v5 = v3;
    while (1)
    {
      __str[0] = [v2 characterAtIndex:v4];
      __str[1] = [v2 characterAtIndex:v4 + 1];
      v10 = 0;
      unsigned char *v5 = strtol(__str, &v10, 16);
      if (v10 != &v12) {
        break;
      }
      ++v5;
      v4 += 2;
      if (v4 >= [v2 length]) {
        goto LABEL_6;
      }
    }
    free(v3);
    v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "+[NSData(BCSHexString) bcs_dataWithHexString:]";
      __int16 v15 = 2112;
      id v16 = v2;
      __int16 v17 = 2048;
      unint64_t v18 = v4;
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - String should be all hex digits: %@ (bad digit around %ld)", buf, 0x20u);
    }
  }
  v6 = 0;
LABEL_14:

  return v6;
}

@end