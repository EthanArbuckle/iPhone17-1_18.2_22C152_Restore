@interface BLTPBActionFactory
+ (id)bltVersionToFactories;
+ (id)sharedInstance;
- (id)actionWithBBAction:(id)a3;
@end

@implementation BLTPBActionFactory

+ (id)bltVersionToFactories
{
  if (bltVersionToFactories_onceToken != -1) {
    dispatch_once(&bltVersionToFactories_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)bltVersionToFactories___bltVersionToFeatureDictionary;
  return v2;
}

void __43__BLTPBActionFactory_bltVersionToFactories__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26D607DC8;
  v0 = objc_alloc_init(BLTPBActionFactoryVersion1);
  v4[1] = &unk_26D607DE0;
  v5[0] = v0;
  v1 = objc_alloc_init(BLTPBActionFactory);
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)bltVersionToFactories___bltVersionToFeatureDictionary;
  bltVersionToFactories___bltVersionToFeatureDictionary = v2;
}

+ (id)sharedInstance
{
  v3 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  unint64_t v4 = [v3 bltVersion];

  if (v4 >= 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5 != gCurrentVersion)
  {
    v6 = [a1 bltVersionToFactories];
    v7 = [NSNumber numberWithUnsignedInteger:v5];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];
    v9 = (void *)gCurrentFactory;
    gCurrentFactory = v8;

    gCurrentVersion = v5;
  }
  v10 = (void *)gCurrentFactory;
  return v10;
}

- (id)actionWithBBAction:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 appearance];
    v6 = objc_alloc_init(BLTPBImage);
    v7 = [v5 image];
    uint64_t v8 = [v7 data];
    [(BLTPBImage *)v6 setData:v8];

    BOOL v9 = [v5 style] == 1;
    v10 = objc_alloc_init(BLTPBAppearance);
    v11 = [v5 title];
    [(BLTPBAppearance *)v10 setTitle:v11];

    [(BLTPBAppearance *)v10 setDestructive:v9];
    v12 = objc_alloc_init(BLTPBAction);
    v13 = [v4 identifier];
    [(BLTPBAction *)v12 setIdentifier:v13];

    -[BLTPBAction setActivationMode:](v12, "setActivationMode:", [v4 activationMode]);
    [(BLTPBAction *)v12 setAppearance:v10];
    v14 = [v4 launchURL];
    v15 = [v14 absoluteString];
    [(BLTPBAction *)v12 setLaunchURL:v15];

    -[BLTPBAction setBehavior:](v12, "setBehavior:", [v4 behavior]);
    v16 = [v4 behaviorParameters];
    int v17 = [MEMORY[0x263F57700] activePairedDeviceSupportsNSNullPListExtenion];
    int v18 = v17;
    if (v17) {
      v19 = &v26;
    }
    else {
      v19 = 0;
    }
    if (v17) {
      id v26 = 0;
    }
    id v25 = 0;
    v20 = +[BLTObjectSerializer serializeObject:v16 nulls:v19 error:&v25];
    id v21 = 0;
    if (v18) {
      id v21 = v26;
    }
    id v22 = v25;

    if (v22)
    {
      v23 = blt_ids_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v28 = v22;
        __int16 v29 = 2112;
        v30 = v20;
        __int16 v31 = 2112;
        v32 = v4;
        _os_log_error_impl(&dword_222F4C000, v23, OS_LOG_TYPE_ERROR, "Error serializing action behaviorParameters: %@, %@, %@", buf, 0x20u);
      }
    }
    else
    {
      [(BLTPBAction *)v12 setBehaviorParameters:v20];
      [(BLTPBAction *)v12 setBehaviorParametersNulls:v21];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end