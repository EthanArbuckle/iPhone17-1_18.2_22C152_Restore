@interface NSURLSessionTask(ACSURLSession_Impl)
- (id)descriptionWithAddress;
@end

@implementation NSURLSessionTask(ACSURLSession_Impl)

- (id)descriptionWithAddress
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"<%@: %p> { %@ }", v4, a1, a1];

  return v5;
}

@end