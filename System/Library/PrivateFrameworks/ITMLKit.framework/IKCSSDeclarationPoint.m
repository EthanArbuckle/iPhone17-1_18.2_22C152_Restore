@interface IKCSSDeclarationPoint
- (IKCSSDeclarationPoint)initWithParseDeclaration:(id)a3 info:(id)a4;
- (double)value;
- (id)description;
- (id)number;
- (id)stringValue;
- (unint64_t)unit;
- (void)setUnit:(unint64_t)a3;
- (void)setValue:(double)a3;
@end

@implementation IKCSSDeclarationPoint

- (IKCSSDeclarationPoint)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 cssValue];
  unint64_t v9 = 0;
  if ([v8 count])
  {
    while (1)
    {
      v10 = [v8 objectAtIndex:v9];
      if ([v10 type] != 1) {
        break;
      }
      v11 = [v10 token];
      uint64_t v12 = [v11 type];

      if (v12 != 1) {
        break;
      }
      ++v9;

      if (v9 >= [v8 count]) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
  if (v9 >= [v8 count]) {
    goto LABEL_26;
  }
  v13 = [v8 objectAtIndex:v9];
  if ([v13 type] != 1)
  {
LABEL_21:

    goto LABEL_26;
  }
  v14 = [v13 token];
  if ([v14 type] != 11)
  {
    if ([v14 type] == 13)
    {
      uint64_t v21 = 0;
    }
    else
    {
      if ([v14 type] != 12) {
        goto LABEL_20;
      }
      uint64_t v21 = 2;
    }
    [v14 doubleValue];
    double v16 = v23;

LABEL_24:
    v27.receiver = self;
    v27.super_class = (Class)IKCSSDeclarationPoint;
    v24 = [(IKCSSDeclarationPoint *)&v27 init];
    self = v24;
    if (v24)
    {
      [(IKCSSDeclarationPoint *)v24 setValue:v16];
      [(IKCSSDeclarationPoint *)self setUnit:v21];
      v25 = [v7 name];
      [(IKCSSDeclaration *)self setName:v25];

      -[IKCSSDeclaration setType:](self, "setType:", [v7 type]);
      -[IKCSSDeclaration setImportant:](self, "setImportant:", [v6 important]);
    }
    goto LABEL_26;
  }
  [v14 doubleValue];
  double v16 = v15;
  v17 = [v14 properties];
  if (!v17)
  {
LABEL_20:

    goto LABEL_21;
  }
  v18 = v17;
  v19 = [v17 objectForKey:@"unit"];
  v20 = v19;
  if (!v19
    || [v19 caseInsensitiveCompare:@"pt"]
    && [v20 caseInsensitiveCompare:@"px"])
  {
    uint64_t v21 = 0;
    int v22 = 0;
  }
  else
  {
    uint64_t v21 = 1;
    int v22 = 1;
  }

  if (v22) {
    goto LABEL_24;
  }
LABEL_26:

  return self;
}

- (id)number
{
  v3 = NSNumber;
  [(IKCSSDeclarationPoint *)self value];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  objc_msgSend(v4, "ik_setUnit:", -[IKCSSDeclarationPoint unit](self, "unit"));
  return v4;
}

- (id)stringValue
{
  v2 = [(IKCSSDeclarationPoint *)self number];
  uint64_t v3 = objc_msgSend(v2, "ik_unit");
  v4 = NSString;
  [v2 doubleValue];
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(v2, "ik_unitStringValue");
  v8 = (void *)v7;
  if (v3 == 2) {
    unint64_t v9 = @"%.0f%@";
  }
  else {
    unint64_t v9 = @"%.3f%@";
  }
  v10 = objc_msgSend(v4, "stringWithFormat:", v9, v6, v7);

  return v10;
}

- (id)description
{
  uint64_t v3 = [(IKCSSDeclarationPoint *)self number];
  v4 = NSString;
  uint64_t v5 = [(IKCSSDeclaration *)self name];
  uint64_t v6 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  [v3 doubleValue];
  uint64_t v8 = v7;
  unint64_t v9 = objc_msgSend(v3, "ik_unitStringValue");
  BOOL v10 = [(IKCSSDeclaration *)self important];
  v11 = @"false";
  if (v10) {
    v11 = @"true";
  }
  uint64_t v12 = [v4 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%.3f\", unit: \"%@\", important: %@}", v5, v6, v8, v9, v11];

  return v12;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (unint64_t)unit
{
  return self->_unit;
}

- (void)setUnit:(unint64_t)a3
{
  self->_unit = a3;
}

@end