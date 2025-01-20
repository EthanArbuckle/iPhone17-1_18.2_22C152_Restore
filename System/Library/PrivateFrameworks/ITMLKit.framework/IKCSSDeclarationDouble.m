@interface IKCSSDeclarationDouble
- (IKCSSDeclarationDouble)initWithParseDeclaration:(id)a3 info:(id)a4;
- (double)value;
- (id)description;
- (id)stringValue;
- (void)setValue:(double)a3;
@end

@implementation IKCSSDeclarationDouble

- (IKCSSDeclarationDouble)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IKCSSDeclarationDouble;
  v8 = [(IKCSSDeclarationDouble *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = 0.0;
    v10 = [v6 cssValue];
    unint64_t v11 = 0;
    if ([v10 count])
    {
      while (1)
      {
        v12 = [v10 objectAtIndex:v11];
        if ([v12 type] != 1) {
          break;
        }
        v13 = [v12 token];
        uint64_t v14 = [v13 type];

        if (v14 != 1) {
          break;
        }
        ++v11;

        if (v11 >= [v10 count]) {
          goto LABEL_8;
        }
      }
    }
LABEL_8:
    if (v11 < [v10 count])
    {
      v15 = [v10 objectAtIndex:v11];
      if ([v15 type] == 1)
      {
        v16 = [v15 token];
        if ([v16 type] == 13 || objc_msgSend(v16, "type") == 11)
        {
          [v16 doubleValue];
          -[IKCSSDeclarationDouble setValue:](v9, "setValue:");
        }
      }
    }
    v17 = [v7 name];
    [(IKCSSDeclaration *)v9 setName:v17];

    -[IKCSSDeclaration setType:](v9, "setType:", [v7 type]);
    -[IKCSSDeclaration setImportant:](v9, "setImportant:", [v6 important]);
  }
  return v9;
}

- (id)stringValue
{
  v2 = NSString;
  [(IKCSSDeclarationDouble *)self value];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"%f", v3);
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(IKCSSDeclaration *)self name];
  v5 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  id v6 = [(IKCSSDeclarationDouble *)self stringValue];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  v9 = [v3 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}", v4, v5, v6, v8];

  return v9;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

@end