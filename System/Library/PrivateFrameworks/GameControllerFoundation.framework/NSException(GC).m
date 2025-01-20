@interface NSException(GC)
+ (id)gc_exceptionWithName:()GC error:;
+ (uint64_t)gc_exceptionWithError:()GC;
- (id)gc_error;
@end

@implementation NSException(GC)

+ (id)gc_exceptionWithName:()GC error:
{
  v7 = [a4 userInfo];
  v8 = (void *)[v7 mutableCopy];

  id v9 = (id)[v8 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v10 = (id)[v8 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v12 = +[NSString stringWithFormat:@"%@ %@", v9, v10];
LABEL_8:
    v13 = v12;
    goto LABEL_9;
  }
  if (v9)
  {
    id v12 = v9;
    goto LABEL_8;
  }
  if (v10)
  {
    id v12 = v10;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:
  id v14 = (id)[a4 domain];
  if (v14) {
    [v8 setObject:v14 forKey:@"GC_NSExceptionErrorDomain"];
  }
  v15 = +[NSNumber numberWithInteger:](&off_26BEEDE78, "numberWithInteger:", [a4 code]);
  [v8 setObject:v15 forKey:@"GC_NSExceptionErrorCode"];

  v16 = [a1 exceptionWithName:a3 reason:v13 userInfo:v8];

  return v16;
}

+ (uint64_t)gc_exceptionWithError:()GC
{
  return objc_msgSend(a1, "gc_exceptionWithName:error:", @"NSUnhandledErrorException", a3);
}

- (id)gc_error
{
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"GC_NSExceptionErrorDomain"];

  v4 = [a1 userInfo];
  v5 = objc_msgSend(v4, "gc_objectForKey:ofClass:error:", @"GC_NSExceptionErrorCode", objc_opt_class(), 0);
  uint64_t v6 = [v5 integerValue];

  v7 = [a1 userInfo];
  v8 = (void *)[v7 mutableCopy];

  [v8 removeObjectForKey:@"GC_NSExceptionErrorDomain"];
  [v8 removeObjectForKey:@"GC_NSExceptionErrorCode"];
  id v9 = [v8 objectForKey:NSLocalizedDescriptionKey];

  if (!v9)
  {
    uint64_t v10 = [a1 name];
    BOOL v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = @"Exception";
    }
    [v8 setObject:v12 forKey:NSLocalizedDescriptionKey];
  }
  v13 = [v8 objectForKey:NSLocalizedFailureReasonErrorKey];
  if (!v13)
  {
    id v14 = [a1 reason];

    if (!v14) {
      goto LABEL_10;
    }
    v13 = [a1 reason];
    [v8 setObject:v13 forKey:NSLocalizedFailureReasonErrorKey];
  }

LABEL_10:
  if (v3) {
    v15 = v3;
  }
  else {
    v15 = @"NSExceptionErrorDomain";
  }
  v16 = +[NSError errorWithDomain:v15 code:v6 userInfo:v8];

  return v16;
}

@end