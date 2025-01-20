@interface NSValue(CPLArchiver)
- (void)initWithCPLArchiver:()CPLArchiver;
- (void)plistArchiveWithCPLArchiver:()CPLArchiver;
@end

@implementation NSValue(CPLArchiver)

- (void)initWithCPLArchiver:()CPLArchiver
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, a1, v7, 1144, @"%@ %@ is not supported by %@", v8, v9, objc_opt_class() object file lineNumber description];

  abort();
}

- (void)plistArchiveWithCPLArchiver:()CPLArchiver
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, a1, v7, 1139, @"%@ %@ is not supported by %@", v8, v9, objc_opt_class() object file lineNumber description];

  abort();
}

@end