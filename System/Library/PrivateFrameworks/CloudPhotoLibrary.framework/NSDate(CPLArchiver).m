@interface NSDate(CPLArchiver)
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
- (uint64_t)initWithCPLArchiver:()CPLArchiver;
@end

@implementation NSDate(CPLArchiver)

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        id v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        __int16 v16 = 2112;
        id v17 = v10;
        id v11 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Incorrect number for NSDate. Found %@: '%@'", buf, 0x16u);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v12 handleFailureInMethod:a2, a1, v13, 1083, @"Incorrect number for NSDate. Found %@: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  [v5[2] doubleValue];
  uint64_t v6 = objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");

  return v6;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  if ([a3 forDisplay])
  {
    [a1 description];
  }
  else
  {
    v5 = NSNumber;
    [a1 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "numberWithDouble:");
  v4 = };
  return v4;
}

@end