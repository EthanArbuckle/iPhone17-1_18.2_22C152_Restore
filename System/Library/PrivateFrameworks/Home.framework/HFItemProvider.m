@interface HFItemProvider
+ (BOOL)prefersNonBlockingReloads;
- (HFItemProvider)init;
- (NSSet)clientInvalidationReasons;
- (NSSet)items;
- (id)asGeneric;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reloadItems;
- (id)reloadItemsWithHomeKitObjects:(id)a3 filter:(id)a4 itemMap:(id)a5;
- (id)reloadItemsWithObjects:(id)a3 keyAdaptor:(id)a4 itemAdaptor:(id)a5 filter:(id)a6 itemMap:(id)a7;
- (void)setClientInvalidationReasons:(id)a3;
@end

@implementation HFItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 0;
}

- (NSSet)clientInvalidationReasons
{
  return self->_clientInvalidationReasons;
}

- (id)reloadItemsWithObjects:(id)a3 keyAdaptor:(id)a4 itemAdaptor:(id)a5 filter:(id)a6 itemMap:(id)a7
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v13 = (void (**)(id, void))a4;
  v74 = (void (**)(id, id))a5;
  id v14 = a6;
  v73 = (void (**)(id, void *))a7;
  if (!v73)
  {
    v66 = [MEMORY[0x263F08690] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"HFItemProvider.m", 138, @"Invalid parameter not satisfying: %@", @"itemMap" object file lineNumber description];
  }
  v69 = (unsigned int (**)(void, void))v14;
  if (!v13)
  {
    v67 = [MEMORY[0x263F08690] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"HFItemProvider.m", 139, @"Invalid parameter not satisfying: %@", @"keyAdaptor" object file lineNumber description];
  }
  v76 = [MEMORY[0x263EFF9A0] dictionary];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v15 = [(HFItemProvider *)self items];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v97 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v96 + 1) + 8 * i);
        v21 = v74[2](v74, v20);
        if (v21) {
          [v76 setObject:v20 forKeyedSubscript:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v17);
  }

  v77 = [MEMORY[0x263EFF9A0] dictionary];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v12;
  uint64_t v22 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v93;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v93 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v92 + 1) + 8 * j);
        v27 = v13[2](v13, v26);
        if (v27)
        {
          v28 = [v77 objectForKeyedSubscript:v27];

          if (!v28 && (!v69 || v69[2](v69, v26))) {
            [v77 setObject:v26 forKeyedSubscript:v27];
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
    }
    while (v23);
  }
  v68 = v13;

  v29 = (void *)MEMORY[0x263EFFA08];
  v30 = [v76 allKeys];
  v31 = [v29 setWithArray:v30];
  v32 = (void *)MEMORY[0x263EFFA08];
  v33 = [v77 allKeys];
  v34 = [v32 setWithArray:v33];
  v35 = +[HFSetDiff diffFromSet:v31 toSet:v34];

  v75 = [MEMORY[0x263EFF9C0] set];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v70 = v35;
  v36 = [v35 deletions];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v88 objects:v108 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v89;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v89 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v88 + 1) + 8 * k);
        v42 = [v76 objectForKeyedSubscript:v41];
        v43 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v103 = self;
          __int16 v104 = 2112;
          uint64_t v105 = v41;
          __int16 v106 = 2112;
          v107 = v42;
          _os_log_impl(&dword_20B986000, v43, OS_LOG_TYPE_DEFAULT, "%@: Removing HomeKit item for identifier %@: %@", buf, 0x20u);
        }

        [v75 addObject:v42];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v88 objects:v108 count:16];
    }
    while (v38);
  }

  v44 = [MEMORY[0x263EFF9C0] set];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v45 = [v70 additions];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v84 objects:v101 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v85;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v85 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v84 + 1) + 8 * m);
        v51 = [v77 objectForKeyedSubscript:v50];
        v52 = v73[2](v73, v51);
        if (v52)
        {
          v53 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v103 = self;
            __int16 v104 = 2112;
            uint64_t v105 = v50;
            __int16 v106 = 2112;
            v107 = v51;
            _os_log_impl(&dword_20B986000, v53, OS_LOG_TYPE_DEFAULT, "%@: Adding item for identifier %@: %@", buf, 0x20u);
          }

          [v44 addObject:v52];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v84 objects:v101 count:16];
    }
    while (v47);
  }

  v54 = [v70 updates];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __100__HFItemProvider_HFForSubclassesOnly__reloadItemsWithObjects_keyAdaptor_itemAdaptor_filter_itemMap___block_invoke;
  v82[3] = &unk_264095500;
  id v55 = v76;
  id v83 = v55;
  v56 = objc_msgSend(v54, "na_map:", v82);

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v57 = [(HFItemProvider *)self items];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v78 objects:v100 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v79;
    do
    {
      for (uint64_t n = 0; n != v59; ++n)
      {
        if (*(void *)v79 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v78 + 1) + 8 * n);
        if (([v44 containsObject:v62] & 1) == 0
          && ([v56 containsObject:v62] & 1) == 0)
        {
          [v75 addObject:v62];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v78 objects:v100 count:16];
    }
    while (v59);
  }

  v63 = [[HFItemProviderReloadResults alloc] initWithAddedItems:v44 removedItems:v75 existingItems:v56];
  v64 = [MEMORY[0x263F58190] futureWithResult:v63];

  return v64;
}

uint64_t __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

id __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_26C0FBAD0] & 1) == 0)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HFItemProvider.m" lineNumber:212 description:@"-reloadItemsWithHomeKitObjects expects all existing items to conform to HFHomeKitItemProtocol"];
  }
  v4 = [v3 homeKitObject];
  v5 = [v4 uniqueIdentifier];

  return v5;
}

uint64_t __100__HFItemProvider_HFForSubclassesOnly__reloadItemsWithObjects_keyAdaptor_itemAdaptor_filter_itemMap___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

- (HFItemProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFItemProvider;
  v2 = [(HFItemProvider *)&v6 init];
  if (v2)
  {
    id v3 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    clientInvalidationReasons = v2->_clientInvalidationReasons;
    v2->_clientInvalidationReasons = v3;
  }
  return v2;
}

- (id)reloadItemsWithHomeKitObjects:(id)a3 filter:(id)a4 itemMap:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke_2;
  v7[3] = &unk_264095548;
  v7[4] = self;
  v7[5] = a2;
  v5 = [(HFItemProvider *)self reloadItemsWithObjects:a3 keyAdaptor:&__block_literal_global_108 itemAdaptor:v7 filter:a4 itemMap:a5];
  return v5;
}

- (id)asGeneric
{
  sub_20BA8E684();
  id v2 = HFItemProvider.asGeneric()();
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (id)reloadItems
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFItemProvider.m", 102, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemProvider reloadItems]", objc_opt_class() object file lineNumber description];

  v5 = (void *)MEMORY[0x263F58190];
  objc_super v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 36);
  v7 = [v5 futureWithError:v6];

  return v7;
}

- (NSSet)items
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFItemProvider.m", 108, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemProvider items]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)setClientInvalidationReasons:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (NSSet *)v4;
  }
  else {
    v5 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  clientInvalidationReasons = self->_clientInvalidationReasons;
  self->_clientInvalidationReasons = v5;
}

- (void).cxx_destruct
{
}

@end