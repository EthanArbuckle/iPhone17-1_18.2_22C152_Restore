@interface IKCSSDeclarationInteger
- (IKCSSDeclarationInteger)initWithParseDeclaration:(id)a3 info:(id)a4;
- (id)description;
- (id)stringValue;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation IKCSSDeclarationInteger

- (IKCSSDeclarationInteger)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKCSSDeclarationInteger;
  v8 = [(IKCSSDeclarationInteger *)&v14 init];
  if (v8)
  {
    v9 = [[IKCSSDeclarationDouble alloc] initWithParseDeclaration:v6 info:v7];
    v10 = v9;
    if (v9)
    {
      [(IKCSSDeclarationDouble *)v9 value];
      [(IKCSSDeclarationInteger *)v8 setValue:(int)v11];
    }
    v12 = [v7 name];
    [(IKCSSDeclaration *)v8 setName:v12];

    -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);
  }
  return v8;
}

- (id)stringValue
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%li", -[IKCSSDeclarationInteger value](self, "value"));
}

- (id)description
{
  v3 = NSString;
  v4 = [(IKCSSDeclaration *)self name];
  v5 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  id v6 = [(IKCSSDeclarationInteger *)self stringValue];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  v9 = [v3 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}", v4, v5, v6, v8];

  return v9;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end