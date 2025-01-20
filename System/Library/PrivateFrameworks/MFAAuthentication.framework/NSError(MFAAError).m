@interface NSError(MFAAError)
+ (id)MFAA_errorWithDomain:()MFAAError code:;
+ (id)MFAA_errorWithDomain:()MFAAError code:description:;
+ (id)MFAA_errorWithDomain:()MFAAError code:failureReason:;
@end

@implementation NSError(MFAAError)

+ (id)MFAA_errorWithDomain:()MFAAError code:
{
  v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a3;
  v7 = errorDescription(v6, a4);
  v8 = objc_msgSend(v5, "MFAA_errorWithDomain:code:description:", v6, a4, v7);

  return v8;
}

+ (id)MFAA_errorWithDomain:()MFAAError code:description:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v8;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    v10 = 0;
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a4 userInfo:v10];

  return v11;
}

+ (id)MFAA_errorWithDomain:()MFAAError code:failureReason:
{
  void v14[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    v13[0] = *MEMORY[0x263F08320];
    v9 = errorDescription(v7, a4);
    v13[1] = *MEMORY[0x263F08338];
    v14[0] = v9;
    v14[1] = v8;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    v10 = 0;
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:a4 userInfo:v10];

  return v11;
}

@end