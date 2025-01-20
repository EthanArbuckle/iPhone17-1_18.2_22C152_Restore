@interface IKMenuItemElement
- (IKTextElement)title;
@end

@implementation IKMenuItemElement

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

@end