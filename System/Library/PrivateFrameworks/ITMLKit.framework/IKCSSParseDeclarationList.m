@interface IKCSSParseDeclarationList
- (IKCSSParseDeclarationList)init;
- (_NSRange)range;
- (id)description;
- (void)setRange:(_NSRange)a3;
@end

@implementation IKCSSParseDeclarationList

- (IKCSSParseDeclarationList)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseDeclarationList;
  v2 = [(IKCSSParseBlock *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:9];
  }
  return v3;
}

- (void)setRange:(_NSRange)a3
{
  self->__range = a3;
}

- (_NSRange)range
{
  p_range = &self->__range;
  NSUInteger location = self->__range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  v3 = NSString;
  v11.NSUInteger location = [(IKCSSParseDeclarationList *)self range];
  v4 = NSStringFromRange(v11);
  objc_super v5 = [(IKCSSParseObject *)self cssValue];
  v6 = [v5 toNSArray];
  v7 = +[IKCSSParseObject stringifyList:v6];
  v8 = [v3 stringWithFormat:@"\"IKCSSParseDeclarationList(%@)\": {\"value\":%@}", v4, v7];

  return v8;
}

@end