@interface IKCSSQualifiedParseRule
- (IKCSSQualifiedParseRule)init;
- (id)description;
@end

@implementation IKCSSQualifiedParseRule

- (IKCSSQualifiedParseRule)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSQualifiedParseRule;
  v2 = [(IKCSSParseRule *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:4];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v12.location = [(IKCSSParseRule *)self range];
  v4 = NSStringFromRange(v12);
  objc_super v5 = [(IKCSSParseRule *)self prelude];
  v6 = [v5 toNSArray];
  v7 = +[IKCSSParseObject stringifyList:v6];
  v8 = [(IKCSSParseRule *)self block];
  v9 = [v3 stringWithFormat:@"\"IKCSSQualifiedParseRule(%@)\": {\"prelude\":%@, \"block\":{%@}}", v4, v7, v8];

  return v9;
}

@end