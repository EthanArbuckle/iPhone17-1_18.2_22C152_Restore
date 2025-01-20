@interface IKActivityIndicatorElement
- (IKTextElement)title;
@end

@implementation IKActivityIndicatorElement

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childElementWithType:138];
}

@end