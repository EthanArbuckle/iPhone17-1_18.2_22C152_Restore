@interface NSAssertionHandler
+ (NSAssertionHandler)currentHandler;
- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format;
- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format;
@end

@implementation NSAssertionHandler

+ (NSAssertionHandler)currentHandler
{
  v2 = [+[NSThread currentThread] threadDictionary];
  uint64_t v3 = [(NSMutableDictionary *)v2 objectForKey:@"NSAssertionHandler"];
  v4 = (NSAssertionHandler *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v4 = (NSAssertionHandler *)[objc_allocWithZone((Class)NSAssertionHandler) init];
    [(NSMutableDictionary *)v2 setObject:v4 forKey:@"NSAssertionHandler"];
  }
  return v4;
}

- (void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  va_start(va, format);
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12 = _NSOSLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v18 = _NSFullMethodName((objc_class *)object, selector);
    __int16 v19 = 2112;
    v20 = fileName;
    __int16 v21 = 2048;
    NSInteger v22 = line;
    _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@, %@:%ld", buf, 0x20u);
  }
  v13 = [NSString alloc];
  if (format) {
    v14 = format;
  }
  else {
    v14 = (NSString *)@" ";
  }
  v15 = [(NSString *)v13 initWithFormat:v14 locale:0 arguments:va];
  v16 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], v15, _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v16);
}

- (void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format
{
  va_start(va, format);
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v10 = _NSOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v16 = functionName;
    __int16 v17 = 2112;
    v18 = fileName;
    __int16 v19 = 2048;
    NSInteger v20 = line;
    _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %@(), %@:%ld", buf, 0x20u);
  }
  v11 = [NSString alloc];
  if (format) {
    v12 = format;
  }
  else {
    v12 = (NSString *)@" ";
  }
  v13 = [(NSString *)v11 initWithFormat:v12 locale:0 arguments:va];
  v14 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], v13, _userInfoForFileAndLine((uint64_t)fileName, line));
  objc_exception_throw(v14);
}

@end