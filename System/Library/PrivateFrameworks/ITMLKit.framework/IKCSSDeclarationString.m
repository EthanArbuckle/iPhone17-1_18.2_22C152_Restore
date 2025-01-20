@interface IKCSSDeclarationString
- (IKCSSDeclarationString)initWithParseDeclaration:(id)a3 info:(id)a4;
- (NSString)value;
- (id)description;
- (void)setValue:(id)a3;
@end

@implementation IKCSSDeclarationString

- (IKCSSDeclarationString)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)IKCSSDeclarationString;
  v8 = [(IKCSSDeclarationString *)&v32 init];
  if (!v8) {
    goto LABEL_27;
  }
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
    if ([v14 type] != 1)
    {
LABEL_23:

      goto LABEL_24;
    }
    v15 = [v14 token];
    if ([v15 type] == 3 || objc_msgSend(v15, "type") == 18)
    {
      v16 = [v15 stringValue];
      [(IKCSSDeclarationString *)v8 setValue:v16];
    }
    else
    {
      if ([v15 type] == 11)
      {
        v17 = [v15 properties];
        v16 = [v17 objectForKey:@"value"];

        v18 = [v15 properties];
        uint64_t v31 = [v18 objectForKey:@"unit"];

        v19 = [v15 properties];
        v20 = [v19 objectForKey:@"typeFlag"];
        LODWORD(v17) = [v20 isEqualToString:@"integer"];

        v21 = NSString;
        if (v17)
        {
          v22 = (void *)v31;
          [NSString stringWithFormat:@"%ld%@", objc_msgSend(v16, "integerValue"), v31];
        }
        else
        {
          [v16 doubleValue];
          v22 = (void *)v31;
          [v21 stringWithFormat:@"%.3f%@", v26, v31];
        v27 = };
        [(IKCSSDeclarationString *)v8 setValue:v27];
      }
      else
      {
        if ([v15 type] != 12)
        {
LABEL_22:

          goto LABEL_23;
        }
        v23 = [v15 properties];
        v16 = [v23 objectForKey:@"value"];

        v24 = NSString;
        [v16 doubleValue];
        v22 = objc_msgSend(v24, "stringWithFormat:", @"%.3f%%", v25);
        [(IKCSSDeclarationString *)v8 setValue:v22];
      }
    }
    goto LABEL_22;
  }
LABEL_24:
  v28 = [(IKCSSDeclarationString *)v8 value];

  if (!v28) {
    [(IKCSSDeclarationString *)v8 setValue:&stru_1F3E09950];
  }
  v29 = [v7 name];
  [(IKCSSDeclaration *)v8 setName:v29];

  -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
  -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);

LABEL_27:
  return v8;
}

- (void)setValue:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v4;
  MEMORY[0x1F41817F8](v4, value);
}

- (id)description
{
  v3 = NSString;
  v4 = [(IKCSSDeclaration *)self name];
  v5 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  id v6 = [(IKCSSDeclarationString *)self value];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  v9 = [v3 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}", v4, v5, v6, v8];

  return v9;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end