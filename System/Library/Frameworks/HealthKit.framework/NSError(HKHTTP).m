@interface NSError(HKHTTP)
+ (id)hk_HTTPErrorRepresentingResponse:()HKHTTP request:;
@end

@implementation NSError(HKHTTP)

+ (id)hk_HTTPErrorRepresentingResponse:()HKHTTP request:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 statusCode] < 100 || objc_msgSend(v7, "statusCode") >= 400)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, a1, @"NSError+HKHTTP.m", 26, @"Invalid parameter not satisfying: %@", @"response == nil || [response isKindOfClass:[NSHTTPURLResponse class]]" object file lineNumber description];
      }
    }
    v10 = objc_msgSend(MEMORY[0x1E4F28D20], "localizedStringForStatusCode:", objc_msgSend(v7, "statusCode"));
    v11 = [v10 capitalizedString];

    if ([v7 statusCode] < 100 || objc_msgSend(v7, "statusCode") >= 600)
    {

      v11 = @"Invalid Status Code";
    }
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v12 = [NSString stringWithFormat:@"%ld %@", objc_msgSend(v7, "statusCode"), v11];
    v22[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v14 = (void *)[v13 mutableCopy];

    if (v8)
    {
      v15 = [v8 URL];
      v16 = (void *)[v15 copy];
      [v14 setObject:v16 forKeyedSubscript:@"HKHTTPErrorRequestURL"];
    }
    if (v7)
    {
      v17 = [v7 allHeaderFields];
      v18 = (void *)[v17 copy];
      [v14 setObject:v18 forKeyedSubscript:@"HKHTTPErrorResponseHeaderFields"];
    }
    v9 = objc_msgSend(a1, "errorWithDomain:code:userInfo:", @"HKHTTPErrorDomain", objc_msgSend(v7, "statusCode"), v14);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end