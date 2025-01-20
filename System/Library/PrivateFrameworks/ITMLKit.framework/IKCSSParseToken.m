@interface IKCSSParseToken
- (IKCSSParseToken)init;
- (IKCSSToken)token;
- (id)description;
- (void)setToken:(id)a3;
@end

@implementation IKCSSParseToken

- (IKCSSParseToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseToken;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:1];
  }
  return v3;
}

- (id)description
{
  v3 = [(IKCSSParseToken *)self token];

  if (v3)
  {
    v4 = [(IKCSSParseToken *)self token];
    objc_super v5 = [v4 description];
  }
  else
  {
    objc_super v5 = @"nil";
  }
  v6 = NSString;
  v11.location = [(IKCSSParseObject *)self range];
  v7 = NSStringFromRange(v11);
  v8 = [v6 stringWithFormat:@"(%@) %@", v7, v5];

  return v8;
}

- (IKCSSToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end