@interface ENError
+ (id)connectionFailedError;
+ (id)errorFromException:(id)a3;
+ (id)localizedDescriptionForENErrorCode:(int64_t)a3;
+ (id)noteSizeLimitReachedError;
+ (int64_t)sanitizedErrorCodeFromEDAMErrorCode:(int)a3;
@end

@implementation ENError

+ (id)localizedDescriptionForENErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 8) {
    return @"Unknown error";
  }
  else {
    return off_264E55DE8[a3 - 2];
  }
}

+ (int64_t)sanitizedErrorCodeFromEDAMErrorCode:(int)a3
{
  if ((a3 - 2) > 0x11) {
    return 0;
  }
  else {
    return qword_23C71CF70[a3 - 2];
  }
}

+ (id)errorFromException:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v15 = 0;
    goto LABEL_25;
  }
  v5 = (void *)MEMORY[0x263EFF9A0];
  v6 = [v3 userInfo];
  v7 = [v5 dictionaryWithDictionary:v6];

  if (objc_opt_respondsToSelector())
  {
    v8 = [v4 errorCode];
    uint64_t v9 = [v8 intValue];

    uint64_t v10 = [(id)objc_opt_class() sanitizedErrorCodeFromEDAMErrorCode:v9];
    v11 = [NSNumber numberWithInt:v9];
    [v7 setObject:v11 forKeyedSubscript:@"EDAMErrorCode"];

    uint64_t v12 = *MEMORY[0x263F08320];
    v13 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08320]];

    if (v13) {
      goto LABEL_12;
    }
    v14 = [(id)objc_opt_class() localizedDescriptionForENErrorCode:v10];
    [v7 setObject:v14 forKeyedSubscript:v12];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [v4 description];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      v14 = [v4 description];
      [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08320]];
      uint64_t v10 = 1;
LABEL_9:

      goto LABEL_12;
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v4;
    v19 = [v18 rateLimitDuration];

    if (v19)
    {
      v20 = [v18 rateLimitDuration];
      [v7 setObject:v20 forKeyedSubscript:@"rateLimitDuration"];
    }
    v21 = [v18 message];

    if (v21)
    {
      v22 = [v18 message];
      [v7 setObject:v22 forKeyedSubscript:@"message"];
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v4 identifier];
    [v7 setObject:v18 forKeyedSubscript:@"parameter"];
    uint64_t v10 = 4;
LABEL_19:
  }
  if (objc_opt_respondsToSelector())
  {
    v23 = [v4 parameter];
    if (v23) {
      [v7 setObject:v23 forKeyedSubscript:@"parameter"];
    }
  }
  v15 = [MEMORY[0x263F087E8] errorWithDomain:@"ENErrorDomain" code:v10 userInfo:v7];

LABEL_25:
  return v15;
}

+ (id)noteSizeLimitReachedError
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"Note exceeded size limit to upload.";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"ENErrorDomain" code:6 userInfo:v3];

  return v4;
}

+ (id)connectionFailedError
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"Connection failed to Evernote Service.";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"ENErrorDomain" code:1 userInfo:v3];

  return v4;
}

@end