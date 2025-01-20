@interface IKCSSParseFunction
- (IKCSSParseFunction)init;
- (NSString)name;
- (id)description;
- (void)setName:(id)a3;
@end

@implementation IKCSSParseFunction

- (IKCSSParseFunction)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseFunction;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:7];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v12.location = [(IKCSSParseObject *)self range];
  v4 = NSStringFromRange(v12);
  objc_super v5 = [(IKCSSParseFunction *)self name];
  v6 = [(IKCSSParseObject *)self cssValue];
  v7 = [v6 toNSArray];
  v8 = +[IKCSSParseObject stringifyList:v7];
  v9 = [v3 stringWithFormat:@"\"IKCSSParseFunction(%@)\": {\"name\":\"%@\", \"value\":%@}", v4, v5, v8];

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end