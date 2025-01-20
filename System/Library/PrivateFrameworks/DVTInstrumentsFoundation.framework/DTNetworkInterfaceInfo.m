@interface DTNetworkInterfaceInfo
+ (id)interfaceNameMappings;
+ (void)addInterface:(__SCNetworkInterface *)a3 toNameMapping:(id)a4;
@end

@implementation DTNetworkInterfaceInfo

+ (void)addInterface:(__SCNetworkInterface *)a3 toNameMapping:(id)a4
{
  id v7 = a4;
  v5 = SCNetworkInterfaceGetBSDName(a3);
  v6 = SCNetworkInterfaceGetLocalizedDisplayName(a3);
  if ([v5 length] && [v6 length]) {
    [v7 setObject:v6 forKey:v5];
  }
}

+ (id)interfaceNameMappings
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  CFArrayRef v4 = SCNetworkInterfaceCopyAll();
  uint64_t v5 = [(__CFArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 addInterface:*(void *)(*((void *)&v12 + 1) + 8 * i) toNameMapping:v3];
      }
      uint64_t v6 = [(__CFArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = *MEMORY[0x263F1BC90];
  v10 = [v3 objectForKey:SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)*MEMORY[0x263F1BC90])];

  if (!v10) {
    [a1 addInterface:v9 toNameMapping:v3];
  }

  return v3;
}

@end