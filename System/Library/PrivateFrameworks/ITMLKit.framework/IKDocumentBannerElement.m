@interface IKDocumentBannerElement
- (BOOL)fixed;
- (BOOL)isFixed;
- (IKBackgroundElement)background;
- (IKLockupElement)lockup;
- (IKTextElement)subtitle;
- (IKTextElement)title;
- (NSArray)buttons;
- (UIColor)backgroundColor;
@end

@implementation IKDocumentBannerElement

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:2];
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (UIColor)backgroundColor
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 ikBackgroundColor];
  v4 = [v3 color];

  return (UIColor *)v4;
}

- (BOOL)fixed
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"fixed"];
  char v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (NSArray)buttons
{
  return (NSArray *)[(IKViewElement *)self childElementsWithType:12];
}

- (IKLockupElement)lockup
{
  return (IKLockupElement *)[(IKViewElement *)self childElementWithType:66];
}

- (BOOL)isFixed
{
  return self->_fixed;
}

@end