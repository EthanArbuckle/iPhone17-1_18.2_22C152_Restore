@interface IKCheckMarkElement
+ (BOOL)shouldParseChildDOMElements;
- (unint64_t)alignment;
@end

@implementation IKCheckMarkElement

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (unint64_t)alignment
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKey:@"alignment"];

  if ([v3 isEqualToString:@"left"]) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"right"];
  }

  return v4;
}

@end