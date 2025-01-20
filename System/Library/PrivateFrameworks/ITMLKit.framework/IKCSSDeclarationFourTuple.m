@interface IKCSSDeclarationFourTuple
- (IKCSSDeclarationFourTuple)initWithParseDeclaration:(id)a3 info:(id)a4;
- (IKFourTuple)fourTuple;
- (id)description;
- (id)stringValue;
- (void)setFourTuple:(id)a3;
@end

@implementation IKCSSDeclarationFourTuple

- (IKCSSDeclarationFourTuple)initWithParseDeclaration:(id)a3 info:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IKCSSDeclarationFourTuple;
  v8 = [(IKCSSDeclarationFourTuple *)&v34 init];
  if (v8)
  {
    v9 = [[IKCSSDeclarationEdgeInsets alloc] initWithParseDeclaration:v6 info:v7];
    if ([(IKCSSDeclarationEdgeInsets *)v9 insetsFound])
    {
      [(IKCSSDeclarationEdgeInsets *)v9 insets];
      double v11 = v10;
      [(IKCSSDeclarationEdgeInsets *)v9 insets];
      double v13 = v12;
      [(IKCSSDeclarationEdgeInsets *)v9 insets];
      double v15 = v14;
      [(IKCSSDeclarationEdgeInsets *)v9 insets];
      v17 = -[IKFourTuple initWithCornerRadii:]([IKFourTuple alloc], "initWithCornerRadii:", v16, v15, v11, v13);
      [(IKCSSDeclarationFourTuple *)v8 setFourTuple:v17];
    }
    else
    {
      [v6 cssValue];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v17 = (IKFourTuple *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [(IKFourTuple *)v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v22, "type", (void)v30) == 1)
            {
              v23 = [v22 token];
              if ([v23 type] != 1 && objc_msgSend(v23, "type") == 18)
              {
                v24 = [v23 stringValue];
                v25 = [[IKFourTuple alloc] initWithStyleString:v24];
                [(IKCSSDeclarationFourTuple *)v8 setFourTuple:v25];

                goto LABEL_17;
              }
            }
          }
          uint64_t v19 = [(IKFourTuple *)v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    v26 = [(IKCSSDeclarationFourTuple *)v8 fourTuple];

    if (!v26)
    {
      v27 = -[IKFourTuple initWithCornerRadii:]([IKFourTuple alloc], "initWithCornerRadii:", 0.0, 0.0, 0.0, 0.0);
      [(IKCSSDeclarationFourTuple *)v8 setFourTuple:v27];
    }
    v28 = objc_msgSend(v7, "name", (void)v30);
    [(IKCSSDeclaration *)v8 setName:v28];

    -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);
  }
  return v8;
}

- (id)stringValue
{
  v3 = [(IKCSSDeclarationFourTuple *)self fourTuple];
  v4 = [v3 namedStyle];

  if (![v4 length])
  {
    v5 = [(IKCSSDeclarationFourTuple *)self fourTuple];
    [v5 cornerRadiiValue];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f %.3f %.3f %.3f", v11, v13, v9, v7);

    v4 = (void *)v14;
  }
  return v4;
}

- (id)description
{
  v3 = [(IKCSSDeclarationFourTuple *)self fourTuple];
  [v3 cornerRadiiValue];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  uint64_t v12 = [NSString stringWithFormat:@"{topLeft:%.3f, topRight:%.3f, bottomRight:%.3f, bottomLeft:%.3f}", v9, v11, v7, v5];
  uint64_t v13 = NSString;
  uint64_t v14 = [(IKCSSDeclaration *)self name];
  double v15 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  BOOL v16 = [(IKCSSDeclaration *)self important];
  v17 = @"false";
  if (v16) {
    v17 = @"true";
  }
  uint64_t v18 = [v13 stringWithFormat:@"{name: \"%@\", type: \"%@\", insets:%@, important: %@}", v14, v15, v12, v17];

  return v18;
}

- (IKFourTuple)fourTuple
{
  return self->_fourTuple;
}

- (void)setFourTuple:(id)a3
{
}

- (void).cxx_destruct
{
}

@end