@interface _FEFocusEnvironmentPreferenceCache
- (NSMapTable)environmentsMap;
- (_FEFocusEnvironmentPreferenceCache)init;
- (id)deepestPrimaryPreferredEnvironmentForEnvironment:(id)a3;
- (id)preferredEnvironmentsForEnvironment:(id)a3 isFinal:(BOOL *)a4;
- (void)setPreferredEnvironments:(id)a3 forEnvironment:(id)a4;
- (void)setResolvedPreference:(id)a3 forEnvironment:(id)a4;
@end

@implementation _FEFocusEnvironmentPreferenceCache

- (_FEFocusEnvironmentPreferenceCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_FEFocusEnvironmentPreferenceCache;
  v2 = [(_FEFocusEnvironmentPreferenceCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] mapTableWithKeyOptions:514 valueOptions:512];
    environmentsMap = v2->_environmentsMap;
    v2->_environmentsMap = (NSMapTable *)v3;
  }
  return v2;
}

- (id)preferredEnvironmentsForEnvironment:(id)a3 isFinal:(BOOL *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(_FEFocusEnvironmentPreferenceCache *)self environmentsMap];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    if ([v8 isResolved])
    {
      if (a4) {
        *a4 = 1;
      }
      v9 = [v8 resolvedEnvironment];
      if (v9)
      {
        v10 = [v8 resolvedEnvironment];
        v13[0] = v10;
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      }
      else
      {
        v11 = (void *)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      if (a4) {
        *a4 = 0;
      }
      v9 = [v8 childNodes];
      v11 = objc_msgSend(v9, "bs_map:", &__block_literal_global_9);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setResolvedPreference:(id)a3 forEnvironment:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  v8 = [(_FEFocusEnvironmentPreferenceCache *)self environmentsMap];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceCache.m", 57, @"Invalid parameter not satisfying: %@", @"node != nil" object file lineNumber description];
  }
  [v9 resolve:v11];
}

- (void)setPreferredEnvironments:(id)a3 forEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_FEFocusEnvironmentPreferenceCache *)self environmentsMap];
  v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    v10 = [[_FEFocusEnvironmentPreferenceCacheNode alloc] initWithEnvironment:v8];
    id v11 = [(_FEFocusEnvironmentPreferenceCache *)self environmentsMap];
    [v11 setObject:v10 forKey:v8];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78___FEFocusEnvironmentPreferenceCache_setPreferredEnvironments_forEnvironment___block_invoke;
  v25[3] = &unk_265328828;
  id v12 = v8;
  id v26 = v12;
  v27 = self;
  v13 = objc_msgSend(v7, "bs_compactMap:", v25);
  uint64_t v14 = [(_FEFocusEnvironmentPreferenceCacheNode *)v10 childNodes];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_FEFocusEnvironmentPreferenceCacheNode *)v10 childNodes];
    char v17 = [v16 isEqualToArray:v13];

    if ((v17 & 1) == 0)
    {
      v18 = [MEMORY[0x263F08690] currentHandler];
      v19 = [(_FEFocusEnvironmentPreferenceCacheNode *)v10 environment];
      if (v19)
      {
        v20 = NSString;
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];
      }
      else
      {
        v23 = @"(nil)";
      }
      v24 = [(_FEFocusEnvironmentPreferenceCacheNode *)v10 childNodes];
      [v18 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceCache.m", 80, @"Modifying preferred environments for an environment. This indicates an unstable PFE chain. Results might be unreliable. Environment %@ had these childs before:\n%@\nnow has:\n%@", v23, v24, v13 object file lineNumber description];
    }
  }
  [(_FEFocusEnvironmentPreferenceCacheNode *)v10 setChildNodes:v13];
}

- (id)deepestPrimaryPreferredEnvironmentForEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [(_FEFocusEnvironmentPreferenceCache *)self environmentsMap];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 childNodes];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    do
    {
      v9 = [v6 childNodes];
      v10 = [v9 firstObject];

      id v11 = [v10 childNodes];
      uint64_t v12 = [v11 count];

      id v6 = v10;
    }
    while (v12);
  }
  else
  {
    v10 = v6;
  }
  v13 = [v10 environment];

  return v13;
}

- (NSMapTable)environmentsMap
{
  return self->_environmentsMap;
}

- (void).cxx_destruct
{
}

@end