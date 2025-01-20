@interface IKButtonElement
- (IKImageElement)image;
- (IKTextElement)text;
- (NSString)confirmationText;
- (int64_t)buttonType;
@end

@implementation IKButtonElement

- (int64_t)buttonType
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"type"];
  int64_t v4 = IKButtonTypeForString(v3);

  return v4;
}

- (IKTextElement)text
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:0];
}

- (NSString)confirmationText
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"confirm-text"];

  return (NSString *)v3;
}

- (IKImageElement)image
{
  return (IKImageElement *)[(IKViewElement *)self childImageElementWithType:0];
}

@end