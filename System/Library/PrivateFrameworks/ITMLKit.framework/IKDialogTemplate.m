@interface IKDialogTemplate
- (IKTextElement)descriptionText;
- (IKTextElement)title;
- (NSArray)buttons;
- (unint64_t)type;
@end

@implementation IKDialogTemplate

- (unint64_t)type
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"type"];
  unsigned int v4 = [v3 isEqualToString:@"error"];

  return v4;
}

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:3];
}

- (NSArray)buttons
{
  return (NSArray *)[(IKViewElement *)self childElementsWithType:12];
}

@end