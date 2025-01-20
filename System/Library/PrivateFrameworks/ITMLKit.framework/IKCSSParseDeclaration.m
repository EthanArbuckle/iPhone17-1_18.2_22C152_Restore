@interface IKCSSParseDeclaration
- (BOOL)important;
- (IKCSSParseDeclaration)init;
- (NSString)name;
- (_NSRange)nameRange;
- (_NSRange)valueRange;
- (id)description;
- (void)setImportant:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNameRange:(_NSRange)a3;
- (void)setValueRange:(_NSRange)a3;
@end

@implementation IKCSSParseDeclaration

- (IKCSSParseDeclaration)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseDeclaration;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IKCSSParseObject *)v2 setType:8];
    [(IKCSSParseDeclaration *)v3 setImportant:0];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v14.location = [(IKCSSParseObject *)self range];
  v4 = NSStringFromRange(v14);
  objc_super v5 = [(IKCSSParseDeclaration *)self name];
  v6 = [(IKCSSParseObject *)self cssValue];
  v7 = [v6 toNSArray];
  v8 = +[IKCSSParseObject stringifyList:v7];
  BOOL v9 = [(IKCSSParseDeclaration *)self important];
  v10 = @"false";
  if (v9) {
    v10 = @"true";
  }
  v11 = [v3 stringWithFormat:@"\"IKCSSParseDeclaration(%@)\": {\"name\":\"%@\", \"value\":%@, \"important\":%@}", v4, v5, v8, v10];

  return v11;
}

- (_NSRange)nameRange
{
  p_nameRange = &self->_nameRange;
  NSUInteger location = self->_nameRange.location;
  NSUInteger length = p_nameRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setNameRange:(_NSRange)a3
{
  self->_nameRange = a3;
}

- (_NSRange)valueRange
{
  p_valueRange = &self->_valueRange;
  NSUInteger location = self->_valueRange.location;
  NSUInteger length = p_valueRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setValueRange:(_NSRange)a3
{
  self->_valueRange = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)important
{
  return self->_important;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (void).cxx_destruct
{
}

@end