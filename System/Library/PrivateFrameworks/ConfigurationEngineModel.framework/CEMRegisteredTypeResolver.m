@interface CEMRegisteredTypeResolver
+ (Class)registeredClassWithIdentifier:(id)a3;
@end

@implementation CEMRegisteredTypeResolver

+ (Class)registeredClassWithIdentifier:(id)a3
{
  id v3 = a3;
  if (registeredClassWithIdentifier__onceToken != -1) {
    dispatch_once(&registeredClassWithIdentifier__onceToken, &__block_literal_global_34);
  }
  v4 = [(id)registeredClassWithIdentifier__mappings objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    v4 = (NSString *)NSClassFromString(v4);
  }
  v6 = v4;

  return v6;
}

void __59__CEMRegisteredTypeResolver_registeredClassWithIdentifier___block_invoke()
{
  v0 = (void *)registeredClassWithIdentifier__mappings;
  registeredClassWithIdentifier__mappings = (uint64_t)&unk_26C8949B8;
}

@end