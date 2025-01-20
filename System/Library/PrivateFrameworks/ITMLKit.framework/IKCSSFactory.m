@interface IKCSSFactory
+ (id)createDeclaration:(id)a3;
+ (id)createDeclarationForName:(id)a3 withObject:(id)a4;
+ (id)createSelectorList:(id)a3;
@end

@implementation IKCSSFactory

+ (id)createDeclaration:(id)a3
{
  id v3 = a3;
  v4 = +[IKViewElementStyle registeredAliases];
  v5 = [v3 name];
  v6 = [v4 objectForKey:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = v5;
    v5 = 0;
  }
  v9 = +[IKCSSTypeInfo getTypeInfoForPropertyName:v8];
  if (!v9
    || ([v3 cssValue],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11 < 1))
  {
    v22 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[IKCSSFactory createDeclaration:](v3, v22);
    }

    goto LABEL_14;
  }
  unint64_t v12 = [v9 type];
  if (v12 >= 0xA)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v13 = (void *)[objc_alloc(*off_1E6DE4E70[v12]) initWithParseDeclaration:v3 info:v9];
  v14 = v13;
  if (v13)
  {
    if (v5) {
      [v13 setAliasedName:v5];
    }
    uint64_t v15 = [v3 range];
    objc_msgSend(v14, "setRange:", v15, v16);
    uint64_t v17 = [v3 nameRange];
    objc_msgSend(v14, "setNameRange:", v17, v18);
    uint64_t v19 = [v3 valueRange];
    objc_msgSend(v14, "setValueRange:", v19, v20);
    v21 = [v9 name];
    [v14 setName:v21];

    objc_msgSend(v14, "setType:", objc_msgSend(v9, "type"));
    objc_msgSend(v14, "setImportant:", objc_msgSend(v3, "important"));
  }
LABEL_15:

  return v14;
}

+ (id)createDeclarationForName:(id)a3 withObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_3;
  v24[3] = &unk_1E6DE4E08;
  id v25 = &__block_literal_global_541;
  v7 = (void *)MEMORY[0x1E4E65800](v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_4;
  v22[3] = &unk_1E6DE4E08;
  id v8 = v7;
  id v23 = v8;
  v9 = (uint64_t (**)(void, void, void))MEMORY[0x1E4E65800](v22);
  v10 = +[IKCSSTypeInfo getTypeInfoForPropertyName:v5];
  uint64_t v11 = 0;
  switch([v10 type])
  {
    case 0:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v11 = objc_alloc_init(IKCSSDeclarationInteger);
      [(IKCSSDeclaration *)v11 setType:0];
      uint64_t v12 = [v6 integerValue];
      v13 = v11;
      goto LABEL_8;
    case 1:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v11 = objc_alloc_init(IKCSSDeclarationDouble);
      [(IKCSSDeclaration *)v11 setType:1];
      [v6 doubleValue];
      -[IKCSSDeclarationInteger setValue:](v11, "setValue:");
      break;
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v11 = objc_alloc_init(IKCSSDeclarationString);
      [(IKCSSDeclaration *)v11 setType:3];
      v13 = v11;
      uint64_t v12 = (uint64_t)v6;
LABEL_8:
      [(IKCSSDeclarationInteger *)v13 setValue:v12];
      break;
    case 4:
      id v21 = 0;
      int v14 = ((uint64_t (**)(void, id, id *))v9)[2](v9, v6, &v21);
      id v15 = v21;
      uint64_t v11 = 0;
      if (v14)
      {
        uint64_t v11 = objc_alloc_init(IKCSSDeclarationColor);
        [(IKCSSDeclaration *)v11 setType:4];
        [(IKCSSDeclarationInteger *)v11 setColor:v15];
      }

      break;
    case 7:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = objc_alloc_init(IKCSSDeclarationEdgeInsets);
        uint64_t v16 = [(IKCSSDeclaration *)v11 setType:7];
        long long v17 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
        long long v19 = *MEMORY[0x1E4F437F8];
        long long v20 = v17;
        [(IKCSSDeclarationInteger *)v11 setInsetsFound:__52__IKCSSFactory_createDeclarationForName_withObject___block_invoke(v16, v6, &v19)];
        -[IKCSSDeclarationInteger setInsets:](v11, "setInsets:", v19, v20);
      }
      else
      {
LABEL_14:
        uint64_t v11 = 0;
      }
      break;
    default:
      break;
  }
  [(IKCSSDeclaration *)v11 setName:v5];

  return v11;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = [a2 objectEnumerator];
  id v5 = [v4 nextObject];
  uint64_t v6 = [v4 nextObject];
  v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  uint64_t v10 = [v4 nextObject];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = v5;
  }
  id v13 = v12;

  uint64_t v14 = [v4 nextObject];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = v9;
  }
  id v17 = v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v5 doubleValue];
    uint64_t v19 = v18;
    [v17 doubleValue];
    uint64_t v21 = v20;
    [v13 doubleValue];
    uint64_t v23 = v22;
    [v9 doubleValue];
    *a3 = v19;
    a3[1] = v21;
    a3[2] = v23;
    a3[3] = v24;
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = (a2 - 48);
  if (v3 <= 9) {
    goto LABEL_4;
  }
  uint64_t v4 = (a2 - 97);
  if (v4 <= 5)
  {
    uint64_t v3 = v4 + 10;
LABEL_4:
    *a3 = v3;
    return 1;
  }
  return 0;
}

BOOL __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 lowercaseString];
    if ([v6 hasPrefix:@"#"])
    {
      if ([v6 length] == 4 || objc_msgSend(v6, "length") == 7)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        uint64_t v7 = [v6 length];
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v30 = 0;
          uint64_t v31 = 0;
          uint64_t v10 = v7 == 4 ? v9 : v8;
          if (!(*(unsigned int (**)(void, uint64_t, uint64_t *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), objc_msgSend(v6, "characterAtIndex:", v10 + 1, v30), &v31))break; {
          if (v7 == 4)
          }
          {
            uint64_t v11 = v31;
            uint64_t v12 = v31;
          }
          else
          {
            if (!(*(unsigned int (**)(void, uint64_t, uint64_t *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 characterAtIndex:v8 + 2], &v30))break; {
            uint64_t v11 = v30;
            }
            uint64_t v12 = v31;
          }
          *(&v32 + v9++) = v11 + 16 * v12;
          v8 += 2;
          if (v9 == 3)
          {
            *a3 = [MEMORY[0x1E4F428B8] colorWithRed:(double)v32 / 255.0 green:(double)v33 / 255.0 blue:(double)v34 / 255.0 alpha:1.0];
            BOOL v13 = 1;
            goto LABEL_23;
          }
        }
      }
      BOOL v13 = 0;
    }
    else
    {
      uint64_t v19 = +[IKColor colorMap];
      *a3 = [v19 objectForKey:v6];

      BOOL v13 = *a3 != 0;
    }
LABEL_23:

    BOOL v20 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v5;
      if ((unint64_t)[v14 count] < 3)
      {
        BOOL v20 = 0;
      }
      else
      {
        id v15 = [v14 objectAtIndexedSubscript:0];
        uint64_t v16 = [v14 objectAtIndexedSubscript:1];
        id v17 = [v14 objectAtIndexedSubscript:2];
        if ((unint64_t)[v14 count] < 4)
        {
          uint64_t v18 = &unk_1F3E3E100;
        }
        else
        {
          uint64_t v18 = [v14 objectAtIndexedSubscript:3];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v21 = (void *)MEMORY[0x1E4F428B8];
          [v15 doubleValue];
          double v23 = v22 / 255.0;
          [v16 doubleValue];
          double v25 = v24 / 255.0;
          [v17 doubleValue];
          double v27 = v26 / 255.0;
          [v18 doubleValue];
          *a3 = [v21 colorWithRed:v23 green:v25 blue:v27 alpha:v28];
          BOOL v20 = 1;
        }
        else
        {
          BOOL v20 = 0;
        }
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

uint64_t __52__IKCSSFactory_createDeclarationForName_withObject___block_invoke_4(uint64_t a1, void *a2, id *a3)
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v51[0] = @"type";
      v51[1] = @"color";
      v52[0] = @"plain";
      v52[1] = v5;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
      goto LABEL_7;
    }
    uint64_t v7 = 0;
  }
  id v8 = v7;
LABEL_7:
  uint64_t v9 = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 isEqualToString:@"plain"])
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v9 objectForKeyedSubscript:@"color"];
      id v48 = 0;
      uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, id *))(v11 + 16))(v11, v12, &v48);
      id v14 = v48;

      if (v13)
      {
        id v15 = (id)objc_opt_new();
        *a3 = v15;
        [v15 setColorType:0];
        [*a3 setColor:v14];
      }
LABEL_42:

      goto LABEL_43;
    }
    if ([v10 isEqualToString:@"linear-gradient"])
    {
      v37 = a3;
      id v14 = [MEMORY[0x1E4F1CA48] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v38 = v9;
      uint64_t v16 = [v9 objectForKeyedSubscript:@"colors"];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v45 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(a1 + 32);
            uint64_t v43 = 0;
            char v22 = (*(uint64_t (**)(void))(v21 + 16))();
            id v23 = 0;
            if ((v22 & 1) == 0)
            {
              [v14 removeAllObjects];

              goto LABEL_23;
            }
            [v14 addObject:v23];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v50 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_23:

      double v24 = [MEMORY[0x1E4F1CA48] array];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      double v25 = [v38 objectForKeyedSubscript:@"points"];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v40;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v24 removeAllObjects];
              goto LABEL_33;
            }
            [v24 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
LABEL_33:

      uint64_t v9 = v38;
      uint64_t v31 = [v38 objectForKeyedSubscript:@"direction"];
      if ([v31 isEqualToString:@"top"])
      {
        uint64_t v32 = 1;
      }
      else
      {
        uint64_t v33 = [v38 objectForKeyedSubscript:@"direction"];
        if ([v33 isEqualToString:@"left"]) {
          uint64_t v32 = 2;
        }
        else {
          uint64_t v32 = 0;
        }
      }
      uint64_t v34 = [v14 count];
      uint64_t v13 = v34 != 0;
      if (v34)
      {
        id v35 = (id)objc_opt_new();
        id *v37 = v35;
        [v35 setColorType:3];
        [*v37 setGradientType:1];
        [*v37 setGradientDirectionType:v32];
        [*v37 setGradientColors:v14 andPoints:v24];
      }

      goto LABEL_42;
    }
  }
  uint64_t v13 = 0;
LABEL_43:

  return v13;
}

+ (id)createSelectorList:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(IKCSSSelectorList);
  if (!v3) {
    goto LABEL_39;
  }
  if ([v3 count])
  {
    unint64_t v5 = 0;
    uint64_t v27 = v4;
    do
    {
      uint64_t v6 = objc_msgSend(v3, "objectAtIndex:", v5, v27);
      if ([v6 type] == 1)
      {
        uint64_t v7 = [v6 token];
        if ([v7 type] == 1)
        {
          int v8 = 1;
        }
        else
        {
          if ([v7 type] == 5 && objc_msgSend(v7, "charValue") == 46)
          {
            NSUInteger v9 = [v7 range];
            NSUInteger v11 = v10;
            if (++v5 < [v3 count])
            {
              uint64_t v12 = [v3 objectAtIndex:v5];
              if ([v12 type] == 1)
              {
                uint64_t v13 = [v12 token];
                if ([v13 type] == 18)
                {
                  id v14 = [v13 stringValue];
                  v31.NSUInteger location = [v13 range];
                  v31.NSUInteger length = v15;
                  v30.NSUInteger location = v9;
                  v30.NSUInteger length = v11;
                  NSRange v16 = NSUnionRange(v30, v31);
                  NSUInteger location = v16.location;
                  NSUInteger length = v16.length;

                  uint64_t v18 = 0;
                  uint64_t v4 = v27;
                  goto LABEL_21;
                }
              }
            }

            double v25 = 0;
            uint64_t v4 = v27;
            goto LABEL_41;
          }
          if ([v7 type] == 5 && objc_msgSend(v7, "charValue") == 42)
          {
            NSUInteger location = [v7 range];
            NSUInteger length = v19;
            id v14 = @"*";
            uint64_t v18 = 3;
            goto LABEL_21;
          }
          if ([v7 type] == 6)
          {
            id v14 = [v7 stringValue];
            NSUInteger location = [v7 range];
            NSUInteger length = v20;
            uint64_t v18 = 1;
            goto LABEL_21;
          }
          if ([v7 type] == 18)
          {
            id v14 = [v7 stringValue];
            NSUInteger location = [v7 range];
            NSUInteger length = v21;
            uint64_t v18 = 2;
            while (1)
            {
LABEL_21:
              if (++v5 >= [v3 count]) {
                goto LABEL_29;
              }
              char v22 = [v3 objectAtIndex:v5];
              if ([(IKCSSSelector *)v22 type] != 1)
              {
                int v8 = 0;
                goto LABEL_30;
              }
              id v23 = [(IKCSSSelector *)v22 token];
              if ([v23 type] != 1) {
                break;
              }
            }
            uint64_t v24 = [v23 type];

            if (v24 == 14)
            {
              uint64_t v4 = v27;
LABEL_29:
              char v22 = objc_alloc_init(IKCSSSelector);
              -[IKCSSSelector setRange:](v22, "setRange:", location, length);
              [(IKCSSSelector *)v22 setName:v14];
              [(IKCSSSelector *)v22 setType:v18];
              [(IKCSSSelectorList *)v4 addSelector:v22];
              int v8 = 1;
LABEL_30:

              goto LABEL_31;
            }
            int v8 = 0;
            uint64_t v4 = v27;
LABEL_31:
          }
          else
          {
            int v8 = 0;
          }
        }
      }
      else
      {
        int v8 = 0;
      }

      ++v5;
    }
    while (v5 < [v3 count] && (v8 & 1) != 0);
    if (!v8) {
      goto LABEL_40;
    }
  }
  if (![(IKCSSSelectorList *)v4 count]) {
LABEL_40:
  }
    double v25 = 0;
  else {
LABEL_39:
  }
    double v25 = v4;
LABEL_41:

  return v25;
}

+ (void)createDeclaration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 name];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Failed to parse CSS declaration with name: %@", (uint8_t *)&v4, 0xCu);
}

@end