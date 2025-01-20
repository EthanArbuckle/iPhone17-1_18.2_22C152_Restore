@interface HMKTCommand
+ (NSString)name;
- (int)main:(id)a3;
@end

@implementation HMKTCommand

+ (NSString)name
{
  v2 = NSStringFromClass((Class)a1);
  if ([v2 hasPrefix:@"HMKT"])
  {
    uint64_t v3 = [v2 substringFromIndex:objc_msgSend(@"HMKT", "length")];

    v2 = (void *)v3;
  }
  v4 = [v2 lowercaseString];

  return (NSString *)v4;
}

- (int)main:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end