@interface IKCSSSimpleParseBlock
- (IKCSSSimpleParseBlock)init;
- (id)description;
- (int64_t)associatedToken;
- (void)setAssociatedToken:(int64_t)a3;
@end

@implementation IKCSSSimpleParseBlock

- (IKCSSSimpleParseBlock)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSSimpleParseBlock;
  v2 = [(IKCSSParseBlock *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:6];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v11.location = [(IKCSSParseBlock *)self range];
  v4 = NSStringFromRange(v11);
  objc_super v5 = [(IKCSSParseObject *)self cssValue];
  v6 = [v5 toNSArray];
  v7 = +[IKCSSParseObject stringifyList:v6];
  v8 = [v3 stringWithFormat:@"\"IKCSSSimpleParseBlock(%@)\": {\"value\":%@}", v4, v7];

  return v8;
}

- (int64_t)associatedToken
{
  return self->_associatedToken;
}

- (void)setAssociatedToken:(int64_t)a3
{
  self->_associatedToken = a3;
}

@end