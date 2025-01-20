@interface BPSLinkCell
+ (double)scale;
+ (id)_iconCache;
- (BPSLinkCell)init;
- (id)blankIcon;
- (id)getLazyIcon;
- (id)getLazyIconID;
- (void)setSpecifier:(id)a3;
@end

@implementation BPSLinkCell

- (id)blankIcon
{
  v3 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained propertyForKey:@"squareIconName"];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(BPSLinkCell *)self getLazyIconID];
  }
  v8 = v7;

  v9 = +[BPSLinkCell _iconCache];
  v10 = [v9 objectForKey:v8];
  if (!v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)BPSLinkCell;
    v10 = [(PSTableCell *)&v16 blankIcon];
  }
  id v11 = objc_loadWeakRetained(v3);
  v12 = [v11 propertyForKey:*MEMORY[0x263F60148]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    uint64_t v14 = [v10 imageFlippedForRightToLeftLayoutDirection];

    v10 = (void *)v14;
  }

  return v10;
}

- (id)getLazyIcon
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__0;
  v76 = __Block_byref_object_dispose__0;
  id v77 = 0;
  p_lazyIconPropertiesLock = &self->_lazyIconPropertiesLock;
  os_unfair_lock_lock(&self->_lazyIconPropertiesLock);
  v4 = [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties squareIconName];
  v5 = [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties lazyIconID];
  BOOL v6 = [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties flipsForRTL];
  id v7 = [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties identifier];
  v64 = [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties bundlePath];
  os_unfair_lock_unlock(p_lazyIconPropertiesLock);
  if (v4) {
    v8 = v4;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;
  +[BPSLinkCell scale];
  v10 = @"@2x";
  if (v11 > 2.0) {
    v10 = @"@3x";
  }
  v12 = v10;
  if (v9)
  {
    int v13 = +[BPSLinkCell _iconCache];
    uint64_t v14 = [v13 objectForKey:v9];
    v15 = (void *)v73[5];
    v73[5] = v14;

    objc_super v16 = (void *)v73[5];
    if (v16)
    {
LABEL_49:
      id v27 = v16;
      goto LABEL_50;
    }
    v17 = (void *)MEMORY[0x263F1C6B0];
    v18 = _CachePathForIcon(v9);
    v19 = [v17 imageWithContentsOfCPBitmapFile:v18 flags:0];

    if (v19)
    {
      if (v6)
      {
        uint64_t v20 = [v19 imageFlippedForRightToLeftLayoutDirection];

        v19 = (void *)v20;
      }
      objc_initWeak((id *)&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __26__BPSLinkCell_getLazyIcon__block_invoke;
      block[3] = &unk_264408DF0;
      objc_copyWeak(&v71, (id *)&location);
      id v69 = v9;
      id v63 = v19;
      id v70 = v63;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v71);
      objc_destroyWeak((id *)&location);
      if (v4)
      {
LABEL_12:
        v21 = (void *)MEMORY[0x263F1C6B0];
        v22 = [MEMORY[0x263F086E0] mainBundle];
        v23 = [v4 stringByAppendingString:v12];
        v24 = [v22 pathForResource:v23 ofType:@".png"];
        v25 = [v21 imageWithContentsOfFile:v24];

        if (v25)
        {
          if (!v6) {
            goto LABEL_23;
          }
        }
        else
        {
          v25 = [MEMORY[0x263F1C6B0] imageNamed:v4];
          if (!v6)
          {
LABEL_23:
            uint64_t v36 = BPSCreateRoundedGizmoAppIconForSquareImage(v25);
            v37 = v73[5];
            v73[5] = v36;
            goto LABEL_30;
          }
        }
        uint64_t v35 = [v25 imageFlippedForRightToLeftLayoutDirection];

        v25 = v35;
        goto LABEL_23;
      }
    }
    else
    {
      id v63 = 0;
      if (v4) {
        goto LABEL_12;
      }
    }
    if ([(id)*MEMORY[0x263F1D020] launchedToTest])
    {
      v89.width = 29.0;
      v89.height = 29.0;
      UIGraphicsBeginImageContextWithOptions(v89, 0, 0.0);
      v28 = (void *)MEMORY[0x263F1C550];
      int v29 = rand();
      int v30 = rand();
      v31 = [v28 colorWithRed:(double)(v29 % 255) / 255.0 green:(double)(v30 % 255) / 255.0 blue:(double)(rand() % 255) / 255.0 alpha:1.0];
      [v31 setFill];

      v90.origin.x = 0.0;
      v90.origin.y = 0.0;
      v90.size.width = 29.0;
      v90.size.height = 29.0;
      UIRectFill(v90);
      v32 = UIGraphicsGetImageFromCurrentImageContext();
      uint64_t v33 = BPSCreateRoundedGizmoAppIconForSquareImage(v32);
      v34 = (void *)v73[5];
      v73[5] = v33;

      UIGraphicsEndImageContext();
      goto LABEL_31;
    }
    dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    v39 = (void *)getNanoResourceGrabberClass_softClass;
    uint64_t v81 = getNanoResourceGrabberClass_softClass;
    if (!getNanoResourceGrabberClass_softClass)
    {
      *(void *)&long long location = MEMORY[0x263EF8330];
      *((void *)&location + 1) = 3221225472;
      v83 = __getNanoResourceGrabberClass_block_invoke;
      v84 = &unk_264408888;
      v85 = &v78;
      __getNanoResourceGrabberClass_block_invoke((uint64_t)&location);
      v39 = (void *)v79[3];
    }
    id v40 = v39;
    _Block_object_dispose(&v78, 8);
    v41 = [v40 sharedInstance];
    v42 = [MEMORY[0x263F1C920] mainScreen];
    v43 = [v42 traitCollection];
    [v43 displayScale];
    if (v44 <= 2.0) {
      uint64_t v45 = 47;
    }
    else {
      uint64_t v45 = 48;
    }
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __26__BPSLinkCell_getLazyIcon__block_invoke_2;
    v65[3] = &unk_264408E18;
    v67 = &v72;
    v25 = v38;
    v66 = v25;
    [v41 getIconForBundleID:v5 iconVariant:v45 block:v65 timeout:60.0];

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    v37 = v66;
LABEL_30:

LABEL_31:
    if (v73[5]) {
      goto LABEL_37;
    }
    if ([v7 isEqualToString:@"VICTORY_ROW_ID"])
    {
      v46 = [MEMORY[0x263F1C6B0] imageNamed:@"VictoryIcon"];
      uint64_t v47 = BPSCreateRoundedGizmoAppIconForSquareImage(v46);
    }
    else
    {
      if (![v7 isEqualToString:@"VICTORY_TRAINING_CLUB_ROW_ID"]) {
        goto LABEL_37;
      }
      v46 = [MEMORY[0x263F1C6B0] imageNamed:@"NTCIcon"];
      uint64_t v47 = BPSCreateRoundedGizmoAppIconForSquareImage(v46);
    }
    v48 = (void *)v73[5];
    v73[5] = v47;

LABEL_37:
    if (v73[5]) {
      goto LABEL_45;
    }
    v49 = [MEMORY[0x263F086E0] bundleWithPath:v64];
    if (v49)
    {
      v50 = [@"BridgeSettingsIcon" stringByAppendingString:v12];
      v51 = [v49 pathForResource:v50 ofType:@".png"];

      if (v51)
      {
        v52 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v51];
        v53 = v52;
        if (v52)
        {
          uint64_t v54 = BPSCreateRoundedGizmoAppIconForSquareImage(v52);
          v55 = (void *)v73[5];
          v73[5] = v54;
        }
      }
    }
    if (v73[5])
    {
LABEL_45:
      v56 = +[BPSLinkCell _iconCache];
      [v56 setObject:v73[5] forKey:v9];

      v57 = (uint64_t *)(id)v73[5];
      id v58 = v9;
      if (_WriteMMappedImage_onceToken != -1) {
        dispatch_once(&_WriteMMappedImage_onceToken, &__block_literal_global_130);
      }
      v59 = dispatch_get_global_queue(-2, 0);
      *(void *)&long long location = MEMORY[0x263EF8330];
      *((void *)&location + 1) = 3221225472;
      v83 = ___WriteMMappedImage_block_invoke_132;
      v84 = &unk_264408C08;
      v85 = v57;
      id v86 = v58;
      v60 = v57;
      id v61 = v58;
      dispatch_async(v59, &location);
    }
    objc_super v16 = (void *)v73[5];
    goto LABEL_49;
  }
  v26 = bps_utility_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location) = 138412290;
    *(void *)((char *)&location + 4) = 0;
    _os_log_impl(&dword_21C513000, v26, OS_LOG_TYPE_DEFAULT, "missing icon identifier. Skipping : %@", (uint8_t *)&location, 0xCu);
  }

  id v27 = 0;
LABEL_50:

  _Block_object_dispose(&v72, 8);
  return v27;
}

+ (id)_iconCache
{
  if (_iconCache_onceToken != -1) {
    dispatch_once(&_iconCache_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_iconCache___iconCache;
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BPSLinkCell;
  [(PSTableCell *)&v12 setSpecifier:v4];
  os_unfair_lock_lock(&self->_lazyIconPropertiesLock);
  if (v4)
  {
    v5 = objc_alloc_init(BPSLazyLoadingIconProperties);
    lazyIconLoadingProperties = self->_lazyIconLoadingProperties;
    self->_lazyIconLoadingProperties = v5;

    id v7 = [v4 identifier];
    [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties setIdentifier:v7];

    v8 = [v4 propertyForKey:@"squareIconName"];
    [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties setSquareIconName:v8];

    id v9 = [(BPSLinkCell *)self getLazyIconID];
    [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties setLazyIconID:v9];

    v10 = [v4 propertyForKey:*MEMORY[0x263F60148]];
    -[BPSLazyLoadingIconProperties setFlipsForRTL:](self->_lazyIconLoadingProperties, "setFlipsForRTL:", [v10 BOOLValue]);

    double v11 = [v4 propertyForKey:*MEMORY[0x263F60180]];
    [(BPSLazyLoadingIconProperties *)self->_lazyIconLoadingProperties setBundlePath:v11];
  }
  else
  {
    double v11 = self->_lazyIconLoadingProperties;
    self->_lazyIconLoadingProperties = 0;
  }

  os_unfair_lock_unlock(&self->_lazyIconPropertiesLock);
}

void __26__BPSLinkCell_getLazyIcon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained specifier];

  v3 = WeakRetained;
  if (v2)
  {
    id v4 = [WeakRetained specifier];
    v5 = [v4 propertyForKey:@"squareIconName"];

    uint64_t v6 = [WeakRetained getLazyIconID];
    id v7 = (void *)v6;
    if (v5) {
      v8 = v5;
    }
    else {
      v8 = (void *)v6;
    }
    if ([*(id *)(a1 + 32) isEqualToString:v8]) {
      [WeakRetained setIcon:*(void *)(a1 + 40)];
    }

    v3 = WeakRetained;
  }
}

- (id)getLazyIconID
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 propertyForKey:*MEMORY[0x263F60188]];

  return v3;
}

+ (double)scale
{
  if (scale_onceToken != -1) {
    dispatch_once(&scale_onceToken, &__block_literal_global_79);
  }
  return *(double *)&scale_scale;
}

uint64_t __25__BPSLinkCell__iconCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_iconCache___iconCache;
  _iconCache___iconCache = (uint64_t)v0;

  [(id)_iconCache___iconCache setEvictsObjectsWhenApplicationEntersBackground:0];
  v2 = (void *)_iconCache___iconCache;
  return [v2 setCountLimit:50];
}

void __20__BPSLinkCell_scale__block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  scale_scale = v0;
}

- (BPSLinkCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)BPSLinkCell;
  result = [(BPSLinkCell *)&v3 init];
  if (result) {
    result->_lazyIconPropertiesLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

void __26__BPSLinkCell_getLazyIcon__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end