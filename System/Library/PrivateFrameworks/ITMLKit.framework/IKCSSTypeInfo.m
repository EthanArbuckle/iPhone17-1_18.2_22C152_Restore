@interface IKCSSTypeInfo
+ (id)getTypeInfoForPropertyName:(id)a3;
+ (void)registerStyle:(id)a3 type:(unint64_t)a4;
+ (void)unregisterStyles;
@end

@implementation IKCSSTypeInfo

+ (id)getTypeInfoForPropertyName:(id)a3
{
  v3 = (void *)sCSSTypeInfoProperties;
  v4 = [a3 lowercaseString];
  v5 = [v3 objectForKey:v4];

  return v5;
}

+ (void)registerStyle:(id)a3 type:(unint64_t)a4
{
  uint64_t v5 = registerStyle_type__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&registerStyle_type__onceToken, &__block_literal_global_9);
  }
  v9 = [[IKCSSDeclarationTypeInfo alloc] initWithType:a4 name:v6];
  v7 = (void *)sCSSTypeInfoProperties;
  v8 = [v6 lowercaseString];

  [v7 setObject:v9 forKey:v8];
}

uint64_t __36__IKCSSTypeInfo_registerStyle_type___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = sCSSTypeInfoProperties;
  sCSSTypeInfoProperties = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)unregisterStyles
{
}

@end