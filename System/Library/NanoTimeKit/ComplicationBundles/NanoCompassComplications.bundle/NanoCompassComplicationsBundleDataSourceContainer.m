@interface NanoCompassComplicationsBundleDataSourceContainer
+ (id)complicationBundleDataSources;
@end

@implementation NanoCompassComplicationsBundleDataSourceContainer

+ (id)complicationBundleDataSources
{
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v11 = objc_msgSend_initWithObjects_(v2, v9, v3, v10, v4, v5, v6, v7, v8, 0);
  uint64_t v12 = objc_opt_class();
  objc_msgSend_addObject_(v11, v13, v12, v14);
  uint64_t v15 = objc_opt_class();
  objc_msgSend_addObject_(v11, v16, v15, v17);
  uint64_t v18 = objc_opt_class();
  objc_msgSend_addObject_(v11, v19, v18, v20);
  v23 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v21, (uint64_t)v11, v22);

  return v23;
}

@end