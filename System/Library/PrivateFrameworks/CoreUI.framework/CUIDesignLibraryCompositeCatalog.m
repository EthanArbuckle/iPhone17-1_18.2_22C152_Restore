@interface CUIDesignLibraryCompositeCatalog
+ (id)_catalogsForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7;
+ (id)compositeCatalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7;
- (CUIDesignLibraryCompositeCatalog)initWithCatalogs:(id)a3;
- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6;
- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7;
- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation CUIDesignLibraryCompositeCatalog

+ (id)compositeCatalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  v13 = +[NSString stringWithFormat:@"%d.%d.%d.%d", a3, a4, a5, a6];
  if (__compositeOnceToken != -1) {
    dispatch_once(&__compositeOnceToken, &__block_literal_global_249);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__compositeCatalogCacheLock);
  id v14 = [(id)__compositeCatalogCache objectForKey:v13];
  if (!v14)
  {
    id v15 = [a1 _catalogsForDesignSystem:a3 colorScheme:a4 contrast:a5 styling:a6 error:a7];
    if (v15)
    {
      id v14 = [objc_alloc((Class)a1) initWithCatalogs:v15];
      [(id)__compositeCatalogCache setObject:v14 forKey:v13];
      id v16 = v14;
    }
    else
    {
      id v14 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__compositeCatalogCacheLock);
  return v14;
}

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  catalogs = self->_catalogs;
  id v14 = [(NSArray *)catalogs countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(catalogs);
      }
      id result = [*(id *)(*((void *)&v27 + 1) + 8 * v17) colorWithName:a3 palette:a4 displayGamut:a5 hierarchyLevel:a6 error:a7];
      if (result) {
        break;
      }
      if (v15 == (id)++v17)
      {
        id v15 = [(NSArray *)catalogs countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!a4) {
      return 0;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v19 = self->_catalogs;
    id result = [(NSArray *)v19 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (!result) {
      return result;
    }
    id v20 = result;
    uint64_t v21 = *(void *)v24;
LABEL_12:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v24 != v21) {
        objc_enumerationMutation(v19);
      }
      id result = [*(id *)(*((void *)&v23 + 1) + 8 * v22) colorWithName:a3 palette:0 displayGamut:a5 hierarchyLevel:a6 error:a7];
      if (result) {
        break;
      }
      if (v20 == (id)++v22)
      {
        id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v23 objects:v31 count:16];
        id result = 0;
        if (v20) {
          goto LABEL_12;
        }
        return result;
      }
    }
  }
  if (a7) {
    *a7 = 0;
  }
  return result;
}

+ (id)_catalogsForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  uint64_t v11 = __resolvedDesignSystemForInputSystem(a3);
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = +[CUIDesignLibraryCatalog catalogForDesignSystem:v11 colorScheme:a4 contrast:a5 styling:a6 error:a7];
  if (v13) {
    [v12 addObject:v13];
  }
  id v14 = objc_alloc_init((Class)NSMutableArray);
  switch(v11)
  {
    case 1:
      goto LABEL_6;
    case 2:
    case 3:
    case 4:
    case 7:
      id v15 = +[CUIDesignLibraryCatalog catalogForDesignSystem:1 colorScheme:a4 contrast:a5 styling:a6 error:a7];
      if (v15) {
        [v14 addObject:v15];
      }
LABEL_6:
      if (a6 == 1)
      {
        id v16 = +[CUIDesignLibraryCatalog catalogForDesignSystem:1 colorScheme:a4 contrast:a5 styling:0 error:a7];
        if (v16) {
          [v14 addObject:v16];
        }
      }
      break;
    case 5:
      if (a6)
      {
        id v19 = +[CUIDesignLibraryCatalog catalogForDesignSystem:5 colorScheme:a4 contrast:a5 styling:0 error:a7];
        if (v19) {
          [v14 addObject:v19];
        }
        if (a6 == 1)
        {
          id v20 = +[CUIDesignLibraryCatalog catalogForDesignSystem:5 colorScheme:a4 contrast:a5 styling:2 error:a7];
          if (v20) {
            [v14 insertObject:v20 atIndex:0];
          }
        }
      }
      break;
    default:
      break;
  }
  if ([v14 count]) {
    [v12 addObjectsFromArray:v14];
  }
  uint64_t v17 = +[NSArray arrayWithArray:v12];

  return v17;
}

- (CUIDesignLibraryCompositeCatalog)initWithCatalogs:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIDesignLibraryCompositeCatalog;
  v4 = [(CUIDesignLibraryCompositeCatalog *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_catalogs = (NSArray *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

id __103__CUIDesignLibraryCompositeCatalog_compositeCatalogForDesignSystem_colorScheme_contrast_styling_error___block_invoke()
{
  id result = objc_alloc_init((Class)NSMutableDictionary);
  __compositeCatalogCache = (uint64_t)result;
  return result;
}

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6
{
  return [(CUIDesignLibraryCompositeCatalog *)self colorWithName:a3 palette:a4 displayGamut:a5 hierarchyLevel:0 error:a6];
}

- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  catalogs = self->_catalogs;
  id result = [(NSArray *)catalogs countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(catalogs);
        }
        id result = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) shapeEffectPresetWithName:a3 error:a4];
        if (result)
        {
          if (a4) {
            *a4 = 0;
          }
          return result;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id result = [(NSArray *)catalogs countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v8 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIDesignLibraryCompositeCatalog;
  [(CUIDesignLibraryCompositeCatalog *)&v3 dealloc];
}

@end