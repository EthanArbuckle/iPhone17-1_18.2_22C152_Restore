@interface IKColumnElement
- (IKImageElement)headerImage;
- (NSString)columnType;
@end

@implementation IKColumnElement

- (NSString)columnType
{
  v3 = [(IKViewElement *)self attributes];
  v4 = [v3 objectForKeyedSubscript:@"type"];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[v4 copy];
  }
  else
  {
    v7 = [(IKViewElement *)self style];
    v8 = [v7 columnType];
    v6 = (void *)[v8 copy];
  }
  return (NSString *)v6;
}

- (IKImageElement)headerImage
{
  return (IKImageElement *)[(IKViewElement *)self childImageElementWithType:0];
}

@end