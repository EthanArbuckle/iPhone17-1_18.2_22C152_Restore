@interface IKCSSDeclarationURL
- (IKCSSDeclarationURL)initWithParseDeclaration:(id)a3 info:(id)a4;
- (NSURL)value;
- (id)description;
- (id)stringValue;
- (void)setValue:(id)a3;
@end

@implementation IKCSSDeclarationURL

- (IKCSSDeclarationURL)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IKCSSDeclarationURL;
  v8 = [(IKCSSDeclarationURL *)&v21 init];
  if (v8)
  {
    v9 = [v6 cssValue];
    unint64_t v10 = 0;
    if ([v9 count])
    {
      while (1)
      {
        v11 = [v9 objectAtIndex:v10];
        if ([v11 type] != 1) {
          break;
        }
        v12 = [v11 token];
        uint64_t v13 = [v12 type];

        if (v13 != 1) {
          break;
        }
        ++v10;

        if (v10 >= [v9 count]) {
          goto LABEL_8;
        }
      }
    }
LABEL_8:
    if (v10 < [v9 count])
    {
      v14 = [v9 objectAtIndex:v10];
      if ([v14 type] == 1)
      {
        v15 = [v14 token];
        if ([v15 type] == 19)
        {
          v16 = (void *)MEMORY[0x1E4F1CB10];
          v17 = [v15 stringValue];
          v18 = [v16 URLWithString:v17];
          [(IKCSSDeclarationURL *)v8 setValue:v18];
        }
      }
    }
    v19 = [v7 name];
    [(IKCSSDeclaration *)v8 setName:v19];

    -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);
  }
  return v8;
}

- (id)stringValue
{
  v2 = [(IKCSSDeclarationURL *)self value];
  v3 = [v2 absoluteString];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IKCSSDeclaration *)self name];
  v5 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  id v6 = [(IKCSSDeclarationURL *)self value];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  v9 = [v3 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}", v4, v5, v6, v8];

  return v9;
}

- (NSURL)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end