@interface NSError(MTSError_Internal)
+ (id)mts_errorWithCode:()MTSError_Internal underlyingError:description:;
+ (id)mts_stubErrorForMethod:()MTSError_Internal;
+ (uint64_t)mts_errorWithCode:()MTSError_Internal;
+ (uint64_t)mts_errorWithCode:()MTSError_Internal description:;
+ (uint64_t)mts_errorWithCode:()MTSError_Internal underlyingError:;
@end

@implementation NSError(MTSError_Internal)

+ (id)mts_stubErrorForMethod:()MTSError_Internal
{
  v3 = (void *)MEMORY[0x263F087E8];
  v4 = [NSString stringWithFormat:@"Temporary Stub: %@", a3, 0];
  v5 = objc_msgSend(v3, "mts_errorWithCode:description:", 1, v4);

  return v5;
}

+ (id)mts_errorWithCode:()MTSError_Internal underlyingError:description:
{
  v23[1] = *MEMORY[0x263EF8340];
  unint64_t v7 = a4;
  unint64_t v8 = a5;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    v15 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v22 = *MEMORY[0x263F08608];
    v23[0] = v7;
    v11 = NSDictionary;
    v12 = v23;
    v13 = &v22;
LABEL_8:
    uint64_t v14 = 1;
    goto LABEL_9;
  }
  if (!v7)
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    unint64_t v21 = v8;
    v11 = NSDictionary;
    v12 = &v21;
    v13 = &v20;
    goto LABEL_8;
  }
  uint64_t v10 = *MEMORY[0x263F08320];
  v18[0] = *MEMORY[0x263F08608];
  v18[1] = v10;
  v19[0] = v7;
  v19[1] = v8;
  v11 = NSDictionary;
  v12 = v19;
  v13 = v18;
  uint64_t v14 = 2;
LABEL_9:
  v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];
LABEL_10:
  v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.MatterSupport" code:a3 userInfo:v15];

  return v16;
}

+ (uint64_t)mts_errorWithCode:()MTSError_Internal underlyingError:
{
  return objc_msgSend(MEMORY[0x263F087E8], "mts_errorWithCode:underlyingError:description:", a3, a4, 0);
}

+ (uint64_t)mts_errorWithCode:()MTSError_Internal description:
{
  return objc_msgSend(MEMORY[0x263F087E8], "mts_errorWithCode:underlyingError:description:", a3, 0, a4);
}

+ (uint64_t)mts_errorWithCode:()MTSError_Internal
{
  return objc_msgSend(MEMORY[0x263F087E8], "mts_errorWithCode:underlyingError:description:", a3, 0, 0);
}

@end