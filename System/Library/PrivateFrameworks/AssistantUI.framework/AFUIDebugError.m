@interface AFUIDebugError
+ (id)debugErrorWithCode:(int64_t)a3 userInfo:(id)a4;
- (AFUIDebugError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation AFUIDebugError

+ (id)debugErrorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 userInfo:v6];

  return v7;
}

- (AFUIDebugError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AFUIDebugError;
  return [(AFUIDebugError *)&v5 initWithDomain:@"com.apple.siri.DebugErrorDomain" code:a3 userInfo:a4];
}

@end