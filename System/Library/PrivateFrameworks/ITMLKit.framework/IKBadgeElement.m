@interface IKBadgeElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)textContent;
@end

@implementation IKBadgeElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (NSString)textContent
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"content"];

  return (NSString *)v3;
}

@end