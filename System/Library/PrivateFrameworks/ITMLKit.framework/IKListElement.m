@interface IKListElement
- (BOOL)isLeftAligned;
- (IKViewElement)relatedContent;
@end

@implementation IKListElement

- (IKViewElement)relatedContent
{
  v2 = [(IKViewElement *)self childElementWithType:100];
  v3 = [v2 children];
  v4 = [v3 firstObject];

  return (IKViewElement *)v4;
}

- (BOOL)isLeftAligned
{
  v2 = [(IKViewElement *)self style];
  BOOL v3 = [v2 elementAlignment] == 1;

  return v3;
}

@end