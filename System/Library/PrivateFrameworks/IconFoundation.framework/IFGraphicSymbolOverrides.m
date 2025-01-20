@interface IFGraphicSymbolOverrides
+ (id)overrides;
+ (id)overridesFileURL;
+ (void)overrides;
- (NSDictionary)items;
- (id)overrideForSymbol:(id)a3 shape:(int64_t)a4 size:(CGSize)a5;
- (void)setItems:(id)a3;
@end

@implementation IFGraphicSymbolOverrides

- (void).cxx_destruct
{
}

+ (id)overridesFileURL
{
  if (overridesFileURL_onceToken != -1) {
    dispatch_once(&overridesFileURL_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)overridesFileURL_overridesURL;

  return v2;
}

void __44__IFGraphicSymbolOverrides_overridesFileURL__block_invoke()
{
  v0 = +[IFBundle coreGlyphsPrivateBundle];
  id v4 = [v0 bundleURL];

  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v4];
  uint64_t v2 = [v1 URLForResource:@"container_recipes" withExtension:@"plist"];
  v3 = (void *)overridesFileURL_overridesURL;
  overridesFileURL_overridesURL = v2;
}

+ (id)overrides
{
  if (overrides_onceToken != -1) {
    dispatch_once(&overrides_onceToken, &__block_literal_global_167);
  }
  uint64_t v2 = [(id)overrides_cache objectForKey:@"overrides"];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    id v4 = objc_alloc_init(IFGraphicSymbolOverrides);
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = +[IFGraphicSymbolOverrides overridesFileURL];
    id v14 = 0;
    v7 = [v5 dictionaryWithContentsOfURL:v6 error:&v14];
    id v8 = v14;

    if (!v7)
    {
      v9 = IFDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[IFGraphicSymbolOverrides overrides];
      }
    }
    v10 = [[IFGraphicSymbolOverridesParser alloc] initWithRawOverrides:v7];
    v11 = [(IFGraphicSymbolOverridesParser *)v10 parse];
    [(IFGraphicSymbolOverrides *)v4 setItems:v11];

    if (v4)
    {
      v12 = [(IFGraphicSymbolOverrides *)v4 items];

      if (v12) {
        [(id)overrides_cache setObject:v4 forKey:@"overrides"];
      }
    }
    v3 = v4;
  }

  return v3;
}

uint64_t __37__IFGraphicSymbolOverrides_overrides__block_invoke()
{
  overrides_cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

- (id)overrideForSymbol:(id)a3 shape:(int64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[IFGraphicSymbolOverrides overrides];
  v9 = [v8 items];
  v10 = objc_msgSend(v9, "_IF_arrayForKey:", v7);

  if (v10 && [v10 count])
  {
    LODWORD(v11) = llround(height);
    v12 = [NSNumber numberWithInt:v11];
    v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.shape == %d && SELF.enclosureDimension == %@", a4, v12];
    id v14 = [v10 filteredArrayUsingPredicate:v13];
    if ([v14 count] == 1)
    {
      v15 = [v14 objectAtIndexedSubscript:0];
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF.shape == %d && SELF.isDefault == YES", a4);
      v17 = [v10 filteredArrayUsingPredicate:v16];
      if ([v17 count] == 1)
      {
        v15 = [v17 objectAtIndexedSubscript:0];
      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF.shape == %d", a4);
        v19 = [v10 filteredArrayUsingPredicate:v18];
        v20 = v19;
        if (v19 && [v19 count])
        {
          if ([v20 count] == 1)
          {
            v15 = [v20 objectAtIndexedSubscript:0];
          }
          else
          {
            v25 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"enclosureDimension" ascending:1];
            v30 = v25;
            v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
            v26 = [v20 sortedArrayUsingDescriptors:v28];

            [v26 valueForKey:@"enclosureDimension"];
            v22 = v29 = v18;
            uint64_t v23 = objc_msgSend(v22, "indexOfObject:inSortedRange:options:usingComparator:", v12, 0, objc_msgSend(v22, "count"), 1536, &__block_literal_global_193);
            v15 = objc_msgSend(v26, "objectAtIndexedSubscript:", v23 - (v23 == objc_msgSend(v22, "count")));

            v18 = v29;
          }
        }
        else
        {
          v27 = v18;
          v21 = IFDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v32 = v7;
            __int16 v33 = 2048;
            int64_t v34 = a4;
            _os_log_impl(&dword_1DC6CA000, v21, OS_LOG_TYPE_INFO, "Failed to find override for %@ matching shape %lu", buf, 0x16u);
          }

          v15 = 0;
          v18 = v27;
        }
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __57__IFGraphicSymbolOverrides_overrideForSymbol_shape_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 integerValue];

  v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (NSDictionary)items
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItems:(id)a3
{
}

+ (void)overrides
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC6CA000, a2, OS_LOG_TYPE_ERROR, "Failed to collect graphic variant overrides from plist. Error: %@", v4, 0xCu);
}

@end