@interface CNObservedFailureResult
- (BOOL)isResultEvent;
- (id)description;
@end

@implementation CNObservedFailureResult

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CNObservedResult *)self formattedTimeString];
  v7 = [(CNObservedResult *)self logValue];
  v8 = [v3 stringWithFormat:@"<%@ %p: %@ Failed with error: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isResultEvent
{
  return 0;
}

@end