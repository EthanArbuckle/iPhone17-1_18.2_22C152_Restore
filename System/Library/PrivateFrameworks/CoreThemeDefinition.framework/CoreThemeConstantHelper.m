@interface CoreThemeConstantHelper
+ (id)helperForStructAtIndex:(int64_t)a3 inAssociatedGlobalList:(void *)a4;
- (id)description;
- (id)displayName;
- (id)label;
- (int64_t)identifier;
- (void)dealloc;
@end

@implementation CoreThemeConstantHelper

- (int64_t)identifier
{
  return self->_identifier;
}

- (id)label
{
  return self->_label;
}

- (id)displayName
{
  return self->_displayName;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CoreThemeConstantHelper;
  [(CoreThemeConstantHelper *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CoreThemeConstantHelper;
  return (id)[NSString stringWithFormat:@"%@ - identifier: %ld, constantName: %@, displayName: %@", -[CoreThemeConstantHelper description](&v3, sel_description), self->_identifier, self->_label, self->_displayName];
}

+ (id)helperForStructAtIndex:(int64_t)a3 inAssociatedGlobalList:(void *)a4
{
  v6 = objc_alloc_init((Class)a1);
  v7 = v6;
  if (a4 == (void *)MEMORY[0x263F38488])
  {
    v10 = (int *)(MEMORY[0x263F38488] + 32 * a3);
    if (!*((void *)v10 + 1)) {
      goto LABEL_47;
    }
    goto LABEL_35;
  }
  uint64_t v8 = MEMORY[0x263F38468];
  if (a4 == (void *)MEMORY[0x263F38468]
    || (uint64_t v8 = MEMORY[0x263F384C0], a4 == (void *)MEMORY[0x263F384C0])
    || (uint64_t v8 = MEMORY[0x263F384A8], a4 == (void *)MEMORY[0x263F384A8])
    || (uint64_t v8 = MEMORY[0x263F384B8], a4 == (void *)MEMORY[0x263F384B8])
    || (uint64_t v8 = MEMORY[0x263F384F0], a4 == (void *)MEMORY[0x263F384F0])
    || (uint64_t v8 = MEMORY[0x263F38478], a4 == (void *)MEMORY[0x263F38478]))
  {
    if (!*(void *)(v8 + 24 * a3 + 8)) {
      goto LABEL_47;
    }
    v10 = (int *)(v8 + 24 * a3);
    goto LABEL_35;
  }
  if (a4 == (void *)MEMORY[0x263F384F8]
    || a4 == (void *)MEMORY[0x263F38508]
    || a4 == (void *)MEMORY[0x263F38500]
    || a4 == (void *)MEMORY[0x263F384D8]
    || a4 == (void *)MEMORY[0x263F384D0]
    || a4 == (void *)MEMORY[0x263F384E0]
    || a4 == (void *)MEMORY[0x263F38458]
    || a4 == (void *)MEMORY[0x263F38460]
    || a4 == (void *)MEMORY[0x263F38470]
    || a4 == (void *)MEMORY[0x263F38490]
    || a4 == (void *)MEMORY[0x263F384C8]
    || a4 == (void *)MEMORY[0x263F384E8]
    || a4 == (void *)MEMORY[0x263F38428]
    || a4 == (void *)MEMORY[0x263F38430]
    || a4 == (void *)MEMORY[0x263F384B0]
    || a4 == (void *)MEMORY[0x263F384A0]
    || a4 == (void *)MEMORY[0x263F38440]
    || a4 == (void *)MEMORY[0x263F38438]
    || a4 == (void *)MEMORY[0x263F38418]
    || a4 == (void *)MEMORY[0x263F38448])
  {
    if (!*((void *)a4 + 3 * a3 + 1)) {
      goto LABEL_47;
    }
    v10 = (int *)((char *)a4 + 24 * a3);
LABEL_35:
    uint64_t v11 = *(void *)v10;
    goto LABEL_36;
  }
  if (a4 != gThemeIterationTypes)
  {
    if (a4 == (void *)MEMORY[0x263F38450])
    {
      uint64_t v13 = *(void *)(MEMORY[0x263F38450] + 24 * a3 + 8);
      if (v13)
      {
        v14 = (void *)(MEMORY[0x263F38450] + 24 * a3);
        v6[1] = *v14;
        v6[2] = [[NSString alloc] initWithUTF8String:v13];
        v15 = (objc_class *)NSString;
LABEL_46:
        id v12 = (id)[[v15 alloc] initWithUTF8String:v14[2]];
        goto LABEL_37;
      }
    }
    else
    {
      if (a4 != &gSchemaCategories)
      {

        return 0;
      }
      v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", 0), "elementCategoryAtIndex:", a3);
      if (v16[1])
      {
        v14 = v16;
        v7[1] = *v16;
        v7[2] = [[NSString alloc] initWithUTF8String:v16[1]];
        v15 = (objc_class *)NSString;
        goto LABEL_46;
      }
    }
LABEL_47:

    v7 = 0;
    goto LABEL_48;
  }
  if (!*(void *)&gThemeIterationTypes[6 * a3 + 2]) {
    goto LABEL_47;
  }
  v10 = &gThemeIterationTypes[6 * a3];
  uint64_t v11 = *v10;
LABEL_36:
  v6[1] = v11;
  v6[2] = (id)objc_msgSend(NSString, "stringWithUTF8String:");
  id v12 = (id)[NSString stringWithUTF8String:*((void *)v10 + 2)];
LABEL_37:
  v7[3] = v12;
LABEL_48:

  return v7;
}

@end