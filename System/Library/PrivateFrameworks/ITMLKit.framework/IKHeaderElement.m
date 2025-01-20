@interface IKHeaderElement
- (IKImageElement)image;
- (IKTextElement)descriptionText;
- (IKTextElement)subtitle;
- (IKTextElement)title;
- (int64_t)separator;
@end

@implementation IKHeaderElement

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:2];
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:3];
}

- (IKImageElement)image
{
  return (IKImageElement *)[(IKViewElement *)self childImageElementWithType:0];
}

- (int64_t)separator
{
  v3 = objc_opt_class();
  v4 = [(IKViewElement *)self attributes];
  v5 = [v4 objectForKeyedSubscript:@"separator"];
  int64_t v6 = objc_msgSend(v3, "ik_valueForBooleanAttribute:", v5);

  return v6;
}

@end