@interface IKCSSDeclarationColor
+ (id)_stringForColor:(id)a3 sourceType:(int64_t)a4;
- (IKCSSDeclarationColor)initWithParseDeclaration:(id)a3 info:(id)a4;
- (IKColor)color;
- (id)_colorFromParseObject:(id)a3 sourceType:(int64_t *)a4;
- (id)_keywordKolorFromParseToken:(id)a3;
- (id)_kolorFromParseObject:(id)a3 sourceType:(int64_t *)a4;
- (id)_linearGradientKolorFromParseFunction:(id)a3;
- (id)description;
- (id)stringValue;
- (int64_t)sourceType;
- (void)setColor:(id)a3;
- (void)setSourceType:(int64_t)a3;
@end

@implementation IKCSSDeclarationColor

+ (id)_stringForColor:(id)a3 sourceType:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 <= 1)
  {
    double v28 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    uint64_t v34 = 0;
    v7 = [v5 color];
    [v7 getRed:&v28 green:&v36 blue:&v35 alpha:&v34];

    if (a4) {
      [NSString stringWithFormat:@"rgba(%i, %i, %i, %.2f)", (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0), v34];
    }
    else {
      [NSString stringWithFormat:@"rgb(%i, %i, %i)", (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0), v24];
    }
LABEL_14:
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v28 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    uint64_t v34 = 0;
    v8 = [v5 color];
    [v8 getHue:&v28 saturation:&v36 brightness:&v35 alpha:&v34];

    double v9 = v35 * 0.5 * (2.0 - v36);
    double v10 = v9 * 2.0 + -1.0;
    double v11 = -v10;
    if (v10 >= 0.0) {
      double v11 = v9 * 2.0 + -1.0;
    }
    double v12 = v35 * v36 / (1.0 - v11) * 100.0;
    double v13 = v9 * 100.0;
    if (a4 == 2) {
      [NSString stringWithFormat:@"hsl(%i, %.2f%%, %.2f%%)", (int)(v28 * 360.0), *(void *)&v12, *(void *)&v13, v24];
    }
    else {
      [NSString stringWithFormat:@"hsla(%i, %.2f%%, %.2f%%, %.2f)", (int)(v28 * 360.0), *(void *)&v12, *(void *)&v13, v34];
    }
    goto LABEL_14;
  }
  if (a4 == 6)
  {
    double v28 = 0.0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__12;
    v32 = __Block_byref_object_dispose__12;
    v33 = @"NAMED_COLOR_NOT_FOUND";
    v14 = [v5 color];

    if (v14)
    {
      v15 = +[IKColor colorMap];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52__IKCSSDeclarationColor__stringForColor_sourceType___block_invoke;
      v25[3] = &unk_1E6DE4D98;
      id v26 = v6;
      v27 = &v28;
      [v15 enumerateKeysAndObjectsUsingBlock:v25];

      v16 = v26;
    }
    else
    {
      if ([v6 colorType] == 2)
      {
        v22 = v29;
        v16 = (void *)*((void *)v29 + 5);
        v23 = @"blurred";
      }
      else if ([v6 colorType] == 1)
      {
        v22 = v29;
        v16 = (void *)*((void *)v29 + 5);
        v23 = @"tint-color";
      }
      else
      {
        if ([v6 colorType] != 4)
        {
LABEL_32:
          v17 = (__CFString *)*((id *)v29 + 5);
          _Block_object_dispose(&v28, 8);

          goto LABEL_15;
        }
        v22 = v29;
        v16 = (void *)*((void *)v29 + 5);
        v23 = @"none";
      }
      *((void *)v22 + 5) = v23;
    }

    goto LABEL_32;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    double v28 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    uint64_t v34 = 0;
    v19 = [v5 color];
    [v19 getRed:&v28 green:&v36 blue:&v35 alpha:&v34];

    objc_msgSend(NSString, "stringWithFormat:", @"#%X%X%X", (int)(v28 * 255.0), (int)(v36 * 255.0), (int)(v35 * 255.0));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (a4 == 5)
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"#%C%C%C", -[__CFString characterAtIndex:](v20, "characterAtIndex:", 1), -[__CFString characterAtIndex:](v20, "characterAtIndex:", 3), -[__CFString characterAtIndex:](v20, "characterAtIndex:", 5));

      v17 = (__CFString *)v21;
    }
  }
  else if (a4 == 7)
  {
    v17 = @"linear-gradient";
  }
  else
  {
    v17 = &stru_1F3E09950;
  }
LABEL_15:

  return v17;
}

void __52__IKCSSDeclarationColor__stringForColor_sourceType___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 color];

  if (v10 == v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (IKCSSDeclarationColor)initWithParseDeclaration:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKCSSDeclarationColor;
  v8 = [(IKCSSDeclarationColor *)&v20 init];
  if (v8)
  {
    uint64_t v19 = 8;
    id v9 = [v6 cssValue];
    unint64_t v10 = 0;
    if ([v9 count])
    {
      while (1)
      {
        id v11 = [v9 objectAtIndex:v10];
        if ([v11 type] != 1) {
          break;
        }
        double v12 = [v11 token];
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
    if (v10 >= [v9 count])
    {
      v15 = 0;
      uint64_t v16 = 8;
    }
    else
    {
      v14 = [v9 objectAtIndex:v10];
      v15 = [(IKCSSDeclarationColor *)v8 _colorFromParseObject:v14 sourceType:&v19];

      uint64_t v16 = v19;
    }
    [(IKCSSDeclarationColor *)v8 setSourceType:v16];
    [(IKCSSDeclarationColor *)v8 setColor:v15];
    v17 = [v7 name];
    [(IKCSSDeclaration *)v8 setName:v17];

    -[IKCSSDeclaration setType:](v8, "setType:", [v7 type]);
    -[IKCSSDeclaration setImportant:](v8, "setImportant:", [v6 important]);
  }
  return v8;
}

- (id)stringValue
{
  v3 = [(IKCSSDeclarationColor *)self color];
  v4 = +[IKCSSDeclarationColor _stringForColor:v3 sourceType:[(IKCSSDeclarationColor *)self sourceType]];

  return v4;
}

- (id)description
{
  v3 = [(IKCSSDeclarationColor *)self color];
  v4 = [v3 color];

  if (v4)
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    id v5 = [(IKCSSDeclarationColor *)self color];
    id v6 = [v5 color];
    [v6 getRed:&v28 green:&v27 blue:&v26 alpha:&v25];

    id v7 = [NSString stringWithFormat:@"{red:%.3f, green:%.3f, blue:%.3f, alpha:%.3f}", v28, v27, v26, v25];
  }
  else
  {
    v8 = [(IKCSSDeclarationColor *)self color];
    uint64_t v9 = [v8 colorType];

    if (v9 == 2)
    {
      id v7 = @"blurred";
    }
    else
    {
      unint64_t v10 = [(IKCSSDeclarationColor *)self color];
      uint64_t v11 = [v10 colorType];

      if (v11 == 1)
      {
        id v7 = @"tint-color";
      }
      else
      {
        double v12 = [(IKCSSDeclarationColor *)self color];
        uint64_t v13 = [v12 colorType];

        if (v13 == 4)
        {
          id v7 = @"none";
        }
        else
        {
          v14 = [(IKCSSDeclarationColor *)self color];
          uint64_t v15 = [v14 colorType];

          if (v15 == 3) {
            id v7 = @"linear-gradient";
          }
          else {
            id v7 = @"null";
          }
        }
      }
    }
  }
  uint64_t v16 = NSString;
  v17 = [(IKCSSDeclaration *)self name];
  v18 = +[IKCSSDeclaration typeString:[(IKCSSDeclaration *)self type]];
  uint64_t v19 = [(IKCSSDeclarationColor *)self color];
  objc_super v20 = +[IKCSSDeclarationColor _stringForColor:v19 sourceType:[(IKCSSDeclarationColor *)self sourceType]];
  BOOL v21 = [(IKCSSDeclaration *)self important];
  v22 = @"false";
  if (v21) {
    v22 = @"true";
  }
  v23 = [v16 stringWithFormat:@"{name: \"%@\", type: \"%@\", stringVal:\"%@\", color:%@, important: %@}", v17, v18, v20, v7, v22];

  return v23;
}

- (id)_colorFromParseObject:(id)a3 sourceType:(int64_t *)a4
{
  id v6 = a3;
  int64_t v14 = 8;
  if ([v6 type] == 1)
  {
    id v7 = [v6 token];
    if ([v7 type] == 18)
    {
      uint64_t v8 = [(IKCSSDeclarationColor *)self _keywordKolorFromParseToken:v6];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        int64_t v14 = 6;

        goto LABEL_11;
      }
    }
  }
  else if ([v6 type] == 7)
  {
    unint64_t v10 = [v6 name];
    int v11 = [v10 isEqualToString:@"linear-gradient"];

    if (v11)
    {
      uint64_t v12 = [(IKCSSDeclarationColor *)self _linearGradientKolorFromParseFunction:v6];
      if (v12)
      {
        uint64_t v9 = (void *)v12;
        int64_t v14 = 7;
        goto LABEL_11;
      }
    }
  }
  uint64_t v9 = [(IKCSSDeclarationColor *)self _kolorFromParseObject:v6 sourceType:&v14];
LABEL_11:
  if (a4) {
    *a4 = v14;
  }

  return v9;
}

- (id)_keywordKolorFromParseToken:(id)a3
{
  v3 = [a3 token];
  v4 = [v3 stringValue];

  if ([v4 isEqualToString:@"blurred"])
  {
    id v5 = objc_alloc_init(IKColor);
    id v6 = v5;
    uint64_t v7 = 2;
LABEL_7:
    [(IKColor *)v5 setColorType:v7];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"tint-color"])
  {
    id v5 = objc_alloc_init(IKColor);
    id v6 = v5;
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"none"])
  {
    id v5 = objc_alloc_init(IKColor);
    id v6 = v5;
    uint64_t v7 = 4;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)_linearGradientKolorFromParseFunction:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v4 cssValue];
  uint64_t v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 nextObject];
  if (!v9) {
    goto LABEL_62;
  }
  while (1)
  {
    if ([v9 type] == 1)
    {
      unint64_t v10 = [v9 token];
      uint64_t v11 = [v10 type];

      if (v11 == 18) {
        break;
      }
    }
    uint64_t v12 = [v8 nextObject];

    uint64_t v9 = v12;
    if (!v12) {
      goto LABEL_63;
    }
  }
  uint64_t v13 = [v9 token];
  int64_t v14 = [v13 stringValue];

  if ([@"top" isEqualToString:v14])
  {
    uint64_t v15 = 1;
  }
  else
  {
    if (([@"left" isEqualToString:v14] & 1) == 0)
    {

      goto LABEL_62;
    }
    uint64_t v15 = 2;
  }
  uint64_t v63 = v15;

  uint64_t v16 = [v8 nextObject];

  v17 = 0;
  if (v16)
  {
    double v18 = 0.0;
    do
    {
      uint64_t v19 = (void *)v16;
      while ([v19 type] == 1)
      {
        objc_super v20 = [v19 token];
        uint64_t v21 = [v20 type];

        if (v21 != 13) {
          break;
        }
        v22 = [v19 token];
        [v22 doubleValue];
        double v24 = v23;

        if (v24 >= v18 && v24 <= 1.0)
        {
          uint64_t v25 = [NSNumber numberWithDouble:v24];

          v17 = (void *)v25;
        }
        uint64_t v26 = [v8 nextObject];

        uint64_t v19 = (void *)v26;
        if (!v26) {
          goto LABEL_33;
        }
      }
      if ([v19 type] == 1)
      {
        uint64_t v27 = [v19 token];
        if ([v27 type] == 18)
        {

LABEL_26:
          v29 = [(IKCSSDeclarationColor *)self _kolorFromParseObject:v19 sourceType:0];
          uint64_t v30 = [v29 color];
          if (v30)
          {
            [v6 addObject:v30];
            if (v17)
            {
              [v17 floatValue];
              double v18 = v31;
            }
            else
            {
              v17 = [MEMORY[0x1E4F1CA98] null];
            }
            [v5 addObject:v17];
          }

          v17 = 0;
          goto LABEL_32;
        }
        uint64_t v28 = [v19 type];

        if (v28 == 7) {
          goto LABEL_26;
        }
      }
      else if ([v19 type] == 7)
      {
        goto LABEL_26;
      }
LABEL_32:
      uint64_t v16 = [v8 nextObject];
    }
    while (v16);
  }
LABEL_33:
  if ((unint64_t)[v6 count] < 2)
  {

    id v5 = 0;
  }
  else
  {
    uint64_t v32 = [v5 firstObject];
    unint64_t v33 = 0x1E4F1C000uLL;
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];

    v59 = (void *)v32;
    if ((void *)v32 == v34) {
      [v5 replaceObjectAtIndex:0 withObject:&unk_1F3E3E0F0];
    }
    v60 = v8;
    id v61 = v6;
    id v62 = v4;
    uint64_t v35 = [v5 lastObject];
    double v36 = [MEMORY[0x1E4F1CA98] null];

    v58 = (void *)v35;
    BOOL v37 = v35 == (void)v36;
    unint64_t v38 = 0x1E4F1C000uLL;
    if (v37) {
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", objc_msgSend(v5, "count") - 1, &unk_1F3E3E100);
    }
    if ([v5 count] != 1)
    {
      unint64_t v39 = 0;
      double v40 = 0.0;
      do
      {
        v41 = [*(id *)(v38 + 2632) array];
        ++v39;
        unint64_t v42 = [v5 count] - 1;
        double v43 = 1.0;
        while (v39 < v42)
        {
          v44 = [v5 objectAtIndex:v39];
          v45 = [*(id *)(v33 + 2712) null];

          if (v44 != v45)
          {
            [v44 floatValue];
            double v43 = v47;

            break;
          }
          v46 = [NSNumber numberWithInteger:v39];
          [v41 addObject:v46];

          ++v39;
          unint64_t v42 = [v5 count] - 1;
        }
        if ([v41 count])
        {
          uint64_t v48 = [v41 count];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v49 = v41;
          uint64_t v50 = [v49 countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            double v52 = (v43 - v40) / (double)(unint64_t)(v48 + 1);
            uint64_t v53 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v51; ++i)
              {
                if (*(void *)v65 != v53) {
                  objc_enumerationMutation(v49);
                }
                double v40 = v52 + v40;
                uint64_t v55 = [*(id *)(*((void *)&v64 + 1) + 8 * i) integerValue];
                v56 = [NSNumber numberWithDouble:v40];
                [v5 replaceObjectAtIndex:v55 withObject:v56];
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v64 objects:v68 count:16];
            }
            while (v51);
          }

          unint64_t v38 = 0x1E4F1C000;
          unint64_t v33 = 0x1E4F1C000;
        }

        double v40 = v43;
      }
      while (v39 < [v5 count] - 1);
    }

    id v6 = v61;
    id v4 = v62;
    uint64_t v8 = v60;
  }

  if ([v6 count])
  {
    uint64_t v12 = objc_alloc_init(IKColor);
    [(IKColor *)v12 setColorType:3];
    [(IKColor *)v12 setGradientType:1];
    [(IKColor *)v12 setGradientDirectionType:v63];
    [(IKColor *)v12 setGradientColors:v6 andPoints:v5];
    uint64_t v9 = 0;
    goto LABEL_63;
  }
  uint64_t v9 = 0;
LABEL_62:
  uint64_t v12 = 0;
LABEL_63:

  return v12;
}

- (id)_kolorFromParseObject:(id)a3 sourceType:(int64_t *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 type] == 7)
  {
    id v6 = v5;
    uint64_t v7 = [v6 name];
    uint64_t v8 = [v7 lowercaseString];

    if (([v8 isEqualToString:@"rgb"] & 1) == 0
      && ([v8 isEqualToString:@"rgba"] & 1) == 0
      && ([v8 isEqualToString:@"hsl"] & 1) == 0
      && ![v8 isEqualToString:@"hsla"])
    {
      int64_t v14 = 0;
      int64_t v17 = 8;
      goto LABEL_51;
    }
    BOOL v9 = ([v8 isEqualToString:@"hsl"] & 1) == 0
      && ![v8 isEqualToString:@"hsla"];
    *(_OWORD *)__dst = xmmword_1E2B90A58;
    *(_OWORD *)id v49 = unk_1E2B90A68;
    double v23 = [v6 cssValue];
    uint64_t v24 = [v23 count];

    if (!v24)
    {
      if (v9) {
        int64_t v17 = 0;
      }
      else {
        int64_t v17 = 2;
      }
      if (v9) {
        goto LABEL_49;
      }
      goto LABEL_42;
    }
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    while (1)
    {
      uint64_t v27 = [v6 cssValue];
      uint64_t v28 = [v27 objectAtIndex:v26];

      if ([v28 type] == 1) {
        break;
      }
LABEL_30:

      ++v26;
      uint64_t v32 = [v6 cssValue];
      unint64_t v33 = [v32 count];

      if (v26 >= v33)
      {
        if (v9) {
          int64_t v17 = 0;
        }
        else {
          int64_t v17 = 2;
        }
        uint64_t v34 = 3;
        if (v9) {
          uint64_t v34 = 1;
        }
        if (v25 > 3) {
          int64_t v17 = v34;
        }
LABEL_48:
        if (v9)
        {
LABEL_49:
          uint64_t v38 = [MEMORY[0x1E4F428B8] colorWithRed:*(double *)__dst / 255.0 green:*(double *)&__dst[8] / 255.0 blue:v49[0] / 255.0 alpha:v49[1]];
          goto LABEL_50;
        }
LABEL_42:
        double v35 = v49[0] * 2.0 + -1.0;
        double v36 = -v35;
        if (v35 >= 0.0) {
          double v36 = v49[0] * 2.0 + -1.0;
        }
        double v37 = (*(double *)&__dst[8] * (1.0 - v36) + v49[0] * 2.0) * 0.5;
        uint64_t v38 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithHue:saturation:brightness:alpha:", *(double *)__dst / 360.0, (v37 - v49[0] + v37 - v49[0]) / v37);
LABEL_50:
        int64_t v14 = (void *)v38;
LABEL_51:

        id v16 = 0;
        if (a4) {
LABEL_52:
        }
          *a4 = v17;
        goto LABEL_53;
      }
    }
    v29 = [v28 token];
    if ([v29 type] == 13)
    {
      [v29 doubleValue];
    }
    else
    {
      if ([v29 type] != 12) {
        goto LABEL_29;
      }
      [v29 doubleValue];
      double v30 = v31 / 100.0;
    }
    *(double *)&__dst[8 * v25++] = v30;
LABEL_29:

    if (v25 == 4)
    {

      if (v9) {
        int64_t v17 = 1;
      }
      else {
        int64_t v17 = 3;
      }
      goto LABEL_48;
    }
    goto LABEL_30;
  }
  if ([v5 type] == 1)
  {
    unint64_t v10 = [v5 token];
    if ([v10 type] == 18)
    {
      uint64_t v11 = [v10 stringValue];
      uint64_t v12 = [v11 lowercaseString];

      uint64_t v13 = +[IKColor colorMap];
      int64_t v14 = [v13 objectForKey:v12];

      if (v14)
      {
        id v15 = v14;
        id v16 = v12;
      }
      else
      {
        id v16 = 0;
      }

      int64_t v17 = 6;
    }
    else if ([v10 type] == 6)
    {
      double v18 = [v10 stringValue];
      *(_DWORD *)&__dst[3] = 0;
      *(_DWORD *)__dst = 0;
      if ([v18 length] == 3)
      {
        uint64_t v19 = [v18 UTF8String];
        uint64_t v20 = 0;
        uint64_t v21 = &__dst[1];
        do
        {
          char v22 = *(unsigned char *)(v19 + v20);
          *(v21 - 1) = v22;
          *uint64_t v21 = v22;
          v21 += 2;
          ++v20;
        }
        while (v20 != 3);
        __dst[6] = 0;
        int64_t v17 = 5;
      }
      else if ([v18 length] == 6)
      {
        strncpy(__dst, (const char *)[v18 UTF8String], 6uLL);
        int64_t v17 = 4;
      }
      else
      {
        int64_t v17 = 8;
      }
      for (uint64_t i = 0; i != 6; ++i)
      {
        int v43 = __dst[i];
        unsigned int v44 = v43 - 48;
        unsigned int v45 = v43 - 97;
        if ((v43 - 65) >= 6) {
          char v46 = 0;
        }
        else {
          char v46 = v43 - 55;
        }
        char v47 = v43 - 87;
        if (v45 > 5) {
          char v47 = v46;
        }
        if (v44 < 0xA) {
          char v47 = v44;
        }
        __dst[i] = v47;
      }
      int64_t v14 = [MEMORY[0x1E4F428B8] colorWithRed:(double)(__dst[1] + 16 * __dst[0]) / 255.0 green:(double)(__dst[3] + 16 * __dst[2]) / 255.0 blue:(double)(__dst[5] + 16 * __dst[4]) / 255.0 alpha:1.0];

      id v16 = 0;
    }
    else
    {
      id v16 = 0;
      int64_t v14 = 0;
      int64_t v17 = 8;
    }

    if (a4) {
      goto LABEL_52;
    }
  }
  else
  {
    id v16 = 0;
    int64_t v14 = 0;
    int64_t v17 = 8;
    if (a4) {
      goto LABEL_52;
    }
  }
LABEL_53:
  if (v16)
  {
    unint64_t v39 = [[IKColor alloc] initWithColorMapKey:v16];
LABEL_57:
    double v40 = v39;
    goto LABEL_58;
  }
  if (v14)
  {
    unint64_t v39 = [[IKColor alloc] initWithColor:v14];
    goto LABEL_57;
  }
  double v40 = 0;
LABEL_58:
  [(IKColor *)v40 setColorType:0];

  return v40;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (IKColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end