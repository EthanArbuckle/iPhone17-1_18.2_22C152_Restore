@interface IKCSSParseStylesheet
- (IKArray)cssValue;
- (id)description;
- (void)setCssValue:(id)a3;
@end

@implementation IKCSSParseStylesheet

- (id)description
{
  v2 = NSString;
  v3 = [(IKCSSParseStylesheet *)self cssValue];
  v4 = [v3 toNSArray];
  v5 = +[IKCSSParseObject stringifyList:v4];
  v6 = [v2 stringWithFormat:@"\"IKCascasingStyleSheet\": {\"value\":%@}", v5];

  return v6;
}

- (IKArray)cssValue
{
  return self->_cssValue;
}

- (void)setCssValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end