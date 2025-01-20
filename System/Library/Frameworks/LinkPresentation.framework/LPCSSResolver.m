@interface LPCSSResolver
- (LPCSSResolver)initWithTheme:(id)a3;
- (LPTheme)theme;
- (NSMutableDictionary)localVariables;
- (id)resolveCSSValue:(id)a3;
- (id)ruleDictionaryForStyle:(id)a3 forComponentClass:(Class)a4;
- (void)addStyle:(id)a3 toElement:(id)a4 inComponent:(id)a5;
- (void)enumerateResolvedRulesFromRuleDictionary:(id)a3 withBlock:(id)a4;
@end

@implementation LPCSSResolver

- (LPCSSResolver)initWithTheme:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPCSSResolver;
  v6 = [(LPCSSResolver *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_theme, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    localVariables = v7->_localVariables;
    v7->_localVariables = v8;

    v10 = v7;
  }

  return v7;
}

- (id)resolveCSSValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
    v6 = [(LPTheme *)self->_theme CSSTextForThemeProperty:v5];
    v7 = [v6 objectForKeyedSubscript:v5];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v11 = [(NSMutableDictionary *)self->_localVariables objectForKeyedSubscript:v5];
      if (v11)
      {
        id v9 = [(LPCSSResolver *)self resolveCSSValue:v11];
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
    }
    else
    {
      objc_msgSend(v4, "_lp_CSSText");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v10;
  }

  return v9;
}

- (void)enumerateResolvedRulesFromRuleDictionary:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__LPCSSResolver_enumerateResolvedRulesFromRuleDictionary_withBlock___block_invoke;
  v8[3] = &unk_1E5B04D78;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __68__LPCSSResolver_enumerateResolvedRulesFromRuleDictionary_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) resolveCSSValue:a3];
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)ruleDictionaryForStyle:(id)a3 forComponentClass:(Class)a4
{
  id v5 = a3;
  id v6 = [(objc_class *)a4 ruleDictionaryForStyle:v5];
  if (v6)
  {
    id v7 = [v5 stringByReplacingOccurrencesOfString:@"lp-rich-link-" withString:&stru_1EF6D6D90];
    v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__LPCSSResolver_ruleDictionaryForStyle_forComponentClass___block_invoke;
    v14[3] = &unk_1E5B04DA0;
    id v9 = v8;
    id v15 = v9;
    id v10 = v7;
    id v16 = v10;
    [v6 enumerateKeysAndObjectsUsingBlock:v14];
    v11 = v16;
    id v12 = v9;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __58__LPCSSResolver_ruleDictionaryForStyle_forComponentClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 variableByResolvingWithThemePath:*(void *)(a1 + 40)];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v9];
  }
}

- (void)addStyle:(id)a3 toElement:(id)a4 inComponent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LPWebLock();
  v11 = [(LPCSSResolver *)self ruleDictionaryForStyle:v8 forComponentClass:objc_opt_class()];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__LPCSSResolver_addStyle_toElement_inComponent___block_invoke;
  v14[3] = &unk_1E5B04DC8;
  id v13 = v12;
  id v15 = v13;
  [(LPCSSResolver *)self enumerateResolvedRulesFromRuleDictionary:v11 withBlock:v14];
  if ([v13 length]) {
    [v9 setAttribute:@"style" value:v13];
  }
  else {
    [v9 removeAttribute:@"style"];
  }
  [v9 setClassName:v8];
}

void __48__LPCSSResolver_addStyle_toElement_inComponent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) appendString:v6];
  [*(id *)(a1 + 32) appendString:@":"];
  [*(id *)(a1 + 32) appendString:v5];
  [*(id *)(a1 + 32) appendString:@";"];
}

- (NSMutableDictionary)localVariables
{
  return self->_localVariables;
}

- (LPTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);

  objc_storeStrong((id *)&self->_localVariables, 0);
}

@end