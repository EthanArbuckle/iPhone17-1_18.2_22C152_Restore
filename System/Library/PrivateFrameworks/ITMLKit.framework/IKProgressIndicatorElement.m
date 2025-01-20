@interface IKProgressIndicatorElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)type;
- (unint64_t)percentage;
@end

@implementation IKProgressIndicatorElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (NSString)type
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"type"];

  return (NSString *)v3;
}

- (unint64_t)percentage
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"percentage"];

  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 integerValue];
    if (v4 >= 0x64) {
      unint64_t v5 = 100;
    }
    else {
      unint64_t v5 = v4;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end