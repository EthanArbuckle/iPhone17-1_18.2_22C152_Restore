@interface SOInternalProtocols
+ (id)interfaceWithInternalProtocol:(id)a3;
@end

@implementation SOInternalProtocols

+ (id)interfaceWithInternalProtocol:(id)a3
{
  id v3 = a3;
  if (interfaceWithInternalProtocol__onceToken != -1) {
    dispatch_once(&interfaceWithInternalProtocol__onceToken, &__block_literal_global);
  }
  v4 = [(id)interfaceWithInternalProtocol__protocolCache objectForKey:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v3];
    if (&unk_1F2EB2AD0 == v3)
    {
      v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
      [v4 setClasses:v12 forSelector:sel_profilesWithExtensionBundleIdentifier_completion_ argumentIndex:0 ofReply:1];
    }
    [(id)interfaceWithInternalProtocol__protocolCache setObject:v4 forKey:v3];
  }
  id v13 = v4;

  return v13;
}

uint64_t __53__SOInternalProtocols_interfaceWithInternalProtocol___block_invoke()
{
  interfaceWithInternalProtocol__protocolCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end