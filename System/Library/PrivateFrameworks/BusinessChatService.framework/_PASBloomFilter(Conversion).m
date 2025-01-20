@interface _PASBloomFilter(Conversion)
- (NSObject)_bloomFilterStringWithJSONObj:()Conversion;
- (uint64_t)initWithJSONObj:()Conversion;
@end

@implementation _PASBloomFilter(Conversion)

- (NSObject)_bloomFilterStringWithJSONObj:()Conversion
{
  v3 = [a3 objectForKeyedSubscript:@"records"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 firstObject];
    v5 = [v4 objectForKeyedSubscript:@"fields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKeyedSubscript:@"filter"];
      v7 = [v6 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v7;
        v8 = v7;
LABEL_14:

        goto LABEL_15;
      }
      v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11[0] = 0;
        _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter bloomFilterString is not an NSString", (uint8_t *)v11, 2u);
      }
    }
    else
    {
      v7 = ABSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter fields parameter is not an NSDictioanry", buf, 2u);
      }
    }
    v8 = 0;
    goto LABEL_14;
  }
  v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_2154F4000, v4, OS_LOG_TYPE_ERROR, "BCSChatSuggestBloomFilter records parameter is not an NSArray", v13, 2u);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (uint64_t)initWithJSONObj:()Conversion
{
  v2 = objc_msgSend(a1, "_bloomFilterStringWithJSONObj:");
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v2 options:0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F61E00] bloomFilterWithData:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end