@interface IKCSSDeclarationShadow
- (IKCSSDeclarationShadow)initWithParseDeclaration:(id)a3 info:(id)a4;
- (NSShadow)value;
- (id)description;
- (id)stringValue;
- (void)setValue:(id)a3;
@end

@implementation IKCSSDeclarationShadow

- (IKCSSDeclarationShadow)initWithParseDeclaration:(id)a3 info:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  v41.receiver = self;
  v41.super_class = (Class)IKCSSDeclarationShadow;
  v26 = [(IKCSSDeclarationShadow *)&v41 init];
  if (!v26) {
    goto LABEL_25;
  }
  v6 = [v25 cssValue];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v9)
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  uint64_t v10 = *(void *)v38;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ([v13 type] == 1)
      {
        v14 = [v13 token];
        if ([(IKCSSDeclaration *)v14 type] == 1
          || [(IKCSSDeclaration *)v14 type] != 13 && [(IKCSSDeclaration *)v14 type] != 11)
        {
          goto LABEL_17;
        }
        v15 = NSNumber;
        [(IKCSSDeclarationColor *)v14 doubleValue];
        v16 = objc_msgSend(v15, "numberWithDouble:");
        [v7 addObject:v16];
      }
      else
      {
        if ([v13 type] != 7) {
          continue;
        }
        v14 = objc_alloc_init(IKCSSDeclarationColor);
        v16 = [(IKCSSDeclarationColor *)v14 _colorFromParseObject:v13 sourceType:0];
        v17 = [v16 color];
        if (v17)
        {
          [v7 addObject:v17];
          uint64_t v11 = [v7 count] - 1;
        }
      }
LABEL_17:
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v9);
LABEL_22:

  if ((unint64_t)[v7 count] >= 2)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F42680]);
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x3010000000;
    v35 = &unk_1E2B9EDE1;
    long long v36 = *MEMORY[0x1E4F1DB30];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __56__IKCSSDeclarationShadow_initWithParseDeclaration_info___block_invoke;
    v27[3] = &unk_1E6DE4DC0;
    v30 = &v32;
    uint64_t v31 = v11;
    v19 = (NSShadow *)v18;
    v28 = v19;
    id v29 = v7;
    [v29 enumerateObjectsUsingBlock:v27];
    -[NSShadow setShadowOffset:](v19, "setShadowOffset:", v33[4], v33[5]);
    value = v26->_value;
    v26->_value = v19;
    v21 = v19;

    _Block_object_dispose(&v32, 8);
  }
  v22 = [v24 name];
  [(IKCSSDeclaration *)v26 setName:v22];

  -[IKCSSDeclaration setType:](v26, "setType:", [v24 type]);
  -[IKCSSDeclaration setImportant:](v26, "setImportant:", [v25 important]);

LABEL_25:
  return v26;
}

void __56__IKCSSDeclarationShadow_initWithParseDeclaration_info___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  switch(a3)
  {
    case 2:
      if (*(void *)(a1 + 56) != 2)
      {
        v7 = *(void **)(a1 + 32);
        [v10 doubleValue];
        objc_msgSend(v7, "setShadowBlurRadius:");
      }
      break;
    case 1:
      [v10 doubleValue];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v6;
      break;
    case 0:
      [v10 doubleValue];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v5;
      break;
  }
  if (*(void *)(a1 + 56) == a3)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    [v8 setShadowColor:v9];
  }
}

- (id)stringValue
{
  v2 = NSString;
  v3 = [(NSShadow *)self->_value description];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IKCSSDeclaration *)self name];
  uint64_t v5 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  uint64_t v6 = [(IKCSSDeclarationShadow *)self value];
  BOOL v7 = [(IKCSSDeclaration *)self important];
  id v8 = @"false";
  if (v7) {
    id v8 = @"true";
  }
  uint64_t v9 = [v3 stringWithFormat:@"{name: \"%@\", type: \"%@\", value: \"%@\", important: %@}", v4, v5, v6, v8];

  return v9;
}

- (NSShadow)value
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