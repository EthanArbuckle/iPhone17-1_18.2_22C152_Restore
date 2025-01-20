@interface IKCSSDeclarationTransform
- (CGAffineTransform)transform;
- (IKCSSDeclarationTransform)initWithParseDeclaration:(id)a3 info:(id)a4;
- (id)stringValue;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation IKCSSDeclarationTransform

- (IKCSSDeclarationTransform)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)IKCSSDeclarationTransform;
  v6 = [(IKCSSDeclarationTransform *)&v42 init];
  v7 = v6;
  if (v6)
  {
    v37 = v6;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v41.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v41.c = v8;
    *(_OWORD *)&v41.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v38 = v5;
    v9 = [v5 cssValue];
    if (![v9 count]) {
      goto LABEL_36;
    }
    unint64_t v10 = 0;
    while (1)
    {
      v11 = [v9 objectAtIndex:v10];
      if ([v11 type] == 1)
      {
        v12 = [v11 token];
        uint64_t v13 = [v12 type];

        if (v13 == 1) {
          goto LABEL_35;
        }
      }
      if ([v11 type] != 7) {
        goto LABEL_35;
      }
      id v14 = v11;
      v15 = [v14 name];
      int v16 = [v15 isEqualToString:@"rotate"];

      if (v16)
      {
        v17 = [v14 cssValue];
        if ([v17 count])
        {
          unint64_t v18 = 0;
          do
          {
            v19 = [v17 objectAtIndex:v18];
            if ([v19 type] == 1)
            {
              v20 = [v19 token];
              if ([v20 type] == 13)
              {
                [v20 doubleValue];
                CGAffineTransform v40 = v41;
                CGAffineTransformRotate(&v41, &v40, v21 * 0.0174532925);
              }
            }
            ++v18;
          }
          while (v18 < [v17 count]);
        }
        goto LABEL_33;
      }
      v22 = [v14 name];
      if ([v22 isEqualToString:@"scale"])
      {
      }
      else
      {
        v23 = [v14 name];
        int v24 = [v23 isEqualToString:@"translate"];

        if (!v24) {
          goto LABEL_34;
        }
      }
      v25 = [v14 name];
      int v26 = [v25 isEqualToString:@"scale"];

      v17 = [v14 cssValue];
      if (![v17 count]) {
        goto LABEL_33;
      }
      uint64_t v27 = 0;
      char v28 = 0;
      CGFloat v29 = 0.0;
      CGFloat v30 = 0.0;
      while (1)
      {
        v31 = [v17 objectAtIndex:v27];
        if ([v31 type] == 1) {
          break;
        }
LABEL_26:

        if (++v27 >= (unint64_t)[v17 count])
        {
          if ((v28 & 1) == 0) {
            goto LABEL_33;
          }
          if (v26) {
            goto LABEL_29;
          }
          goto LABEL_31;
        }
      }
      v32 = [v31 token];
      if ([v32 type] != 13) {
        goto LABEL_25;
      }
      [v32 doubleValue];
      double v34 = v33;
      if ((v28 & 1) == 0) {
        break;
      }

      CGFloat v29 = v34;
      if (v26)
      {
LABEL_29:
        CGAffineTransform v39 = v41;
        CGAffineTransformScale(&v40, &v39, v30, v29);
        goto LABEL_32;
      }
LABEL_31:
      CGAffineTransform v39 = v41;
      CGAffineTransformTranslate(&v40, &v39, v30, v29);
LABEL_32:
      CGAffineTransform v41 = v40;
LABEL_33:

LABEL_34:
LABEL_35:
      ++v10;

      if (v10 >= [v9 count])
      {
LABEL_36:
        CGAffineTransform v40 = v41;
        v7 = v37;
        [(IKCSSDeclarationTransform *)v37 setTransform:&v40];

        id v5 = v38;
        goto LABEL_37;
      }
    }
    [v32 doubleValue];
    CGFloat v29 = v35;
    char v28 = 1;
    CGFloat v30 = v34;
LABEL_25:

    goto LABEL_26;
  }
LABEL_37:

  return v7;
}

- (id)stringValue
{
  [(IKCSSDeclarationTransform *)self transform];
  v2 = NSStringFromCGAffineTransform(&v4);
  return v2;
}

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
}

@end