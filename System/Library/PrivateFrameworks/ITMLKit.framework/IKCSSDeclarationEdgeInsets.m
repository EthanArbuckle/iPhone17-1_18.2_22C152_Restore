@interface IKCSSDeclarationEdgeInsets
- (BOOL)insetsFound;
- (IKCSSDeclarationEdgeInsets)initWithParseDeclaration:(id)a3 info:(id)a4;
- (UIEdgeInsets)insets;
- (id)description;
- (id)stringValue;
- (unint64_t)edgeFlag;
- (void)setEdgeFlag:(unint64_t)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setInsetsFound:(BOOL)a3;
@end

@implementation IKCSSDeclarationEdgeInsets

- (IKCSSDeclarationEdgeInsets)initWithParseDeclaration:(id)a3 info:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IKCSSDeclarationEdgeInsets;
  v8 = [(IKCSSDeclarationEdgeInsets *)&v34 init];
  if (!v8) {
    goto LABEL_42;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  v9 = [v6 cssValue];
  if ([v9 count] < 1)
  {
LABEL_39:
    p_insetsFound = &v8->_insetsFound;
    v8->_insetsFound = 1;
LABEL_40:
    BOOL *p_insetsFound = 0;
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    goto LABEL_41;
  }
  id v32 = v7;
  id v33 = v6;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  while (1)
  {
    v12 = objc_msgSend(v9, "objectAtIndex:", v10, v32, v33);
    if ([v12 type] != 1) {
      break;
    }
    v13 = [v12 token];
    if ([v13 type] != 13)
    {
      if ([v13 type] != 11)
      {
        if ([v13 type] != 1) {
          goto LABEL_28;
        }
        ++v10;
        uint64_t v14 = v11;
        goto LABEL_23;
      }
      v19 = [v13 properties];
      v16 = [v19 objectForKey:@"unit"];

      if (!v16
        || [v16 caseInsensitiveCompare:@"pt"]
        && [v16 caseInsensitiveCompare:@"px"])
      {
        goto LABEL_27;
      }
      uint64_t v14 = v11 + 1;
      if (v11 == 4)
      {
        uint64_t v11 = 5;
LABEL_27:

LABEL_28:
        break;
      }
      [v13 doubleValue];
      *((void *)&v35 + v11) = v20;
      if ([v9 count] > ++v10)
      {
        v21 = [v9 objectAtIndex:v10];
        if ([v21 type] == 1)
        {
          v22 = [v21 token];
          uint64_t v23 = [v22 type];

          if (v23 != 1)
          {

LABEL_38:
            id v7 = v32;
            id v6 = v33;
            goto LABEL_39;
          }
        }
      }
      goto LABEL_20;
    }
    uint64_t v14 = v11 + 1;
    if (v11 == 4)
    {
      uint64_t v11 = 5;
      goto LABEL_28;
    }
    [v13 doubleValue];
    *((double *)&v35 + v11) = (double)(int)v15;
    if ([v9 count] > ++v10)
    {
      v16 = [v9 objectAtIndex:v10];
      if ([v16 type] == 1)
      {
        v17 = [v16 token];
        uint64_t v18 = [v17 type];

        if (v18 != 1) {
          goto LABEL_38;
        }
      }
LABEL_20:
    }
LABEL_23:

    uint64_t v11 = v14;
    if ([v9 count] <= v10) {
      goto LABEL_30;
    }
  }

  uint64_t v14 = v11;
LABEL_30:
  p_insetsFound = &v8->_insetsFound;
  v8->_insetsFound = 1;
  uint64_t v25 = v14 - 1;
  id v7 = v32;
  id v6 = v33;
  switch(v25)
  {
    case 0:
      double v26 = *(double *)&v35;
      double v27 = *(double *)&v35;
      double v28 = *(double *)&v35;
      double v29 = *(double *)&v35;
      break;
    case 1:
      double v27 = *((double *)&v35 + 1);
      double v26 = *(double *)&v35;
      double v28 = *(double *)&v35;
      goto LABEL_35;
    case 2:
      double v27 = *((double *)&v35 + 1);
      double v28 = *(double *)&v36;
      double v26 = *(double *)&v35;
LABEL_35:
      double v29 = v27;
      break;
    case 3:
      double v27 = *((double *)&v36 + 1);
      double v28 = *(double *)&v36;
      double v29 = *((double *)&v35 + 1);
      double v26 = *(double *)&v35;
      break;
    default:
      id v7 = v32;
      id v6 = v33;
      goto LABEL_40;
  }
LABEL_41:
  -[IKCSSDeclarationEdgeInsets setInsets:](v8, "setInsets:", v26, v27, v28, v29);
  [(IKCSSDeclarationEdgeInsets *)v8 setEdgeFlag:15];
  v30 = [v7 name];
  [(IKCSSDeclaration *)v8 setName:v30];

  -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
  -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);

LABEL_42:
  return v8;
}

- (id)stringValue
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.3f %.3f %.3f %.3f", *(void *)&self->_insets.top, *(void *)&self->_insets.right, *(void *)&self->_insets.bottom, *(void *)&self->_insets.left);
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"{top:%.3f, right:%.3f, bottom:%.3f, left:%.3f}", *(void *)&self->_insets.top, *(void *)&self->_insets.right, *(void *)&self->_insets.bottom, *(void *)&self->_insets.left];
  v4 = NSString;
  v5 = [(IKCSSDeclaration *)self name];
  id v6 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  v9 = [v4 stringWithFormat:@"{name: \"%@\", type: \"%@\", insets:%@, important: %@}", v5, v6, v3, v8];

  return v9;
}

- (UIEdgeInsets)insets
{
  objc_copyStruct(v6, &self->_insets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_insets, &v3, 32, 1, 0);
}

- (unint64_t)edgeFlag
{
  return self->_edgeFlag;
}

- (void)setEdgeFlag:(unint64_t)a3
{
  self->_edgeFlag = a3;
}

- (BOOL)insetsFound
{
  return self->_insetsFound;
}

- (void)setInsetsFound:(BOOL)a3
{
  self->_insetsFound = a3;
}

@end