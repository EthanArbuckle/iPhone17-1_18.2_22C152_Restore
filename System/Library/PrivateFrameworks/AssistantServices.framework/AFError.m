@interface AFError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingErrors:(id)a5;
+ (id)new;
- (AFError)init;
@end

@implementation AFError

+ (id)new
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"AFError.m" lineNumber:57 description:@"AFError is not designed to be instantiated."];

  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "+[AFError new]";
    __int16 v9 = 2080;
    v10 = "+[AFError new]";
    _os_log_fault_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_FAULT, "%s %s is not available, as AFError is not designed to be instantiated. Returning nil.", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 description:0];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[a1 errorWithCode:a3 description:a4 underlyingError:0];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingErrors:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v9 count] > 1)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v10 = v12;
    if (v8) {
      [v12 setObject:v8 forKey:*MEMORY[0x1E4F28568]];
    }
    if (v9)
    {
      v13 = (void *)[v9 copy];
      [v10 setObject:v13 forKey:@"SiriUnderlyingErrors"];
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:a3 userInfo:v10];
  }
  else
  {
    v10 = [v9 firstObject];
    uint64_t v11 = [a1 errorWithCode:a3 description:v8 underlyingError:v10];
  }
  v14 = (void *)v11;

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v8) {
    [v10 setObject:v8 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  if ([v10 count]) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  v13 = [v11 errorWithDomain:@"kAFAssistantErrorDomain" code:a3 userInfo:v12];

  return v13;
}

- (AFError)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"AFError.m" lineNumber:65 description:@"AFError is not designed to be instantiated."];

  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    id v8 = "-[AFError init]";
    __int16 v9 = 2080;
    v10 = "-[AFError init]";
    _os_log_fault_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_FAULT, "%s %s is not available, as AFError is not designed to be instantiated. Returning nil.", (uint8_t *)&v7, 0x16u);
  }

  return 0;
}

@end