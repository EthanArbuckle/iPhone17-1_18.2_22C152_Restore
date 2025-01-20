@interface DBIconModel
- (BOOL)_showInternalApps;
- (BOOL)_showPrototypeApps;
- (BOOL)automaticallyAddsWebClips;
- (BOOL)current_isSet;
- (BOOL)current_showsOEMIcon;
- (BOOL)isIconVisible:(id)a3;
- (BOOL)metadata_showsOEMIcon;
- (BOOL)showsOEMIcon;
- (BOOL)supportsDock;
- (CGRect)current_screenBounds;
- (CGRect)metadata_screenBounds;
- (CGRect)screenBounds;
- (CGSize)iconImageSize;
- (DBEnvironment)environment;
- (DBIconModel)initWithStore:(id)a3 carApplicationDataSource:(id)a4;
- (DBIconModelApplicationDataSource)carApplicationDataSource;
- (NSArray)metadata_hiddenBundleIdentifiers;
- (NSString)OEMIconLabel;
- (NSString)current_OEMIconLabel;
- (NSString)metadata_OEMIconLabel;
- (id)analyticsIconRepresentation;
- (id)exportIconLayoutState;
- (id)exportStateForCarKit;
- (id)iconModelMetadata;
- (unint64_t)columnCount;
- (unint64_t)current_statusBarEdge;
- (unint64_t)interactionAffordances;
- (unint64_t)rowCount;
- (void)_importStateWithoutLayout:(id)a3;
- (void)didUnarchiveMetadata:(id)a3;
- (void)importState:(id)a3;
- (void)loadAllIcons;
- (void)resetCurrentIconState;
- (void)setCarApplicationDataSource:(id)a3;
- (void)setCurrent_OEMIconLabel:(id)a3;
- (void)setCurrent_isSet:(BOOL)a3;
- (void)setCurrent_screenBounds:(CGRect)a3;
- (void)setCurrent_showsOEMIcon:(BOOL)a3;
- (void)setCurrent_statusBarEdge:(unint64_t)a3;
- (void)setEnvironment:(id)a3;
- (void)setIconImageSize:(CGSize)a3;
- (void)setInteractionAffordances:(unint64_t)a3;
- (void)setMetadata_OEMIconLabel:(id)a3;
- (void)setMetadata_hiddenBundleIdentifiers:(id)a3;
- (void)setMetadata_screenBounds:(CGRect)a3;
- (void)setMetadata_showsOEMIcon:(BOOL)a3;
@end

@implementation DBIconModel

- (DBIconModel)initWithStore:(id)a3 carApplicationDataSource:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DBIconModel;
  v7 = [(SBHIconModel *)&v10 initWithStore:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_carApplicationDataSource, v6);
    v8->_metadata_showsOEMIcon = 0;
  }

  return v8;
}

- (CGRect)screenBounds
{
  if ([(DBIconModel *)self current_isSet]) {
    [(DBIconModel *)self current_screenBounds];
  }
  else {
    [(DBIconModel *)self metadata_screenBounds];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)rowCount
{
  [(DBIconModel *)self screenBounds];
  double Height = CGRectGetHeight(v12);
  [(DBIconModel *)self iconImageSize];
  double v5 = v4;
  double v7 = v6;
  unint64_t v8 = [(DBIconModel *)self current_statusBarEdge];
  unint64_t v9 = [(DBIconModel *)self interactionAffordances];
  return +[DBIconListView iconRowsForScreenHeight:iconImageSize:statusBarEdge:interactionAffordances:](DBIconListView, "iconRowsForScreenHeight:iconImageSize:statusBarEdge:interactionAffordances:", v8, v9, Height, v5, v7);
}

- (unint64_t)columnCount
{
  [(DBIconModel *)self screenBounds];
  double Width = CGRectGetWidth(v11);
  [(DBIconModel *)self iconImageSize];
  double v5 = v4;
  double v7 = v6;
  unint64_t v8 = [(DBIconModel *)self current_statusBarEdge];
  return +[DBIconListView iconColumnsForScreenWidth:iconImageSize:statusBarEdge:](DBIconListView, "iconColumnsForScreenWidth:iconImageSize:statusBarEdge:", v8, Width, v5, v7);
}

- (BOOL)showsOEMIcon
{
  if ([(DBIconModel *)self current_isSet])
  {
    return [(DBIconModel *)self current_showsOEMIcon];
  }
  else
  {
    return [(DBIconModel *)self metadata_showsOEMIcon];
  }
}

- (NSString)OEMIconLabel
{
  if ([(DBIconModel *)self current_isSet]) {
    [(DBIconModel *)self current_OEMIconLabel];
  }
  else {
  double v3 = [(DBIconModel *)self metadata_OEMIconLabel];
  }
  return (NSString *)v3;
}

- (void)setEnvironment:(id)a3
{
  p_environment = &self->_environment;
  id v5 = a3;
  objc_storeWeak((id *)p_environment, v5);
  id v8 = [v5 environmentConfiguration];

  if (v8)
  {
    [(DBIconModel *)self setCurrent_isSet:1];
    [v8 currentSafeViewAreaFrame];
    -[DBIconModel setCurrent_screenBounds:](self, "setCurrent_screenBounds:");
    -[DBIconModel setCurrent_showsOEMIcon:](self, "setCurrent_showsOEMIcon:", [v8 isOEMIconVisible]);
    double v6 = [v8 OEMIconLabel];
    double v7 = (void *)[v6 copy];
    [(DBIconModel *)self setCurrent_OEMIconLabel:v7];

    -[DBIconModel setInteractionAffordances:](self, "setInteractionAffordances:", [v8 interactionAffordances]);
    -[DBIconModel setCurrent_statusBarEdge:](self, "setCurrent_statusBarEdge:", [v8 currentStatusBarEdge]);
  }
}

- (id)exportStateForCarKit
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263F79228];
  double v4 = [(DBIconModel *)self iconModelMetadata];
  id v5 = [v3 archiveRootFolderInModel:self metadata:v4];

  double v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    objc_super v10 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "Exported state %@", (uint8_t *)&v9, 0xCu);
  }

  double v7 = [MEMORY[0x263F79228] carKitRepresentationFromRootArchive:v5 iconModel:self];

  return v7;
}

- (id)exportIconLayoutState
{
  double v3 = [(DBIconModel *)self exportStateForCarKit];
  double v4 = [v3 objectForKey:*MEMORY[0x263F31310]];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__DBIconModel_exportIconLayoutState__block_invoke;
  v13[3] = &unk_2649B68C8;
  id v14 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v13];
  double v7 = [v3 objectForKey:*MEMORY[0x263F31308]];
  id v8 = objc_msgSend(v7, "bs_map:", &__block_literal_global_98);
  int v9 = (void *)[objc_alloc(MEMORY[0x263F312E0]) initWithPages:v6 hiddenIcons:v8];
  objc_super v10 = [v3 objectForKey:*MEMORY[0x263F31300]];
  objc_msgSend(v9, "setDisplaysOEMIcon:", objc_msgSend(v10, "BOOLValue"));

  uint64_t v11 = [v3 objectForKey:*MEMORY[0x263F31318]];
  [v9 setOemIconLabel:v11];

  objc_msgSend(v9, "setRows:", -[DBIconModel rowCount](self, "rowCount"));
  objc_msgSend(v9, "setColumns:", -[DBIconModel columnCount](self, "columnCount"));

  return v9;
}

void __36__DBIconModel_exportIconLayoutState__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bs_map:", &__block_literal_global_40);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = (void *)[objc_alloc(MEMORY[0x263F312D0]) initWithIcons:v4];
  [*(id *)(a1 + 32) addObject:v3];
}

id __36__DBIconModel_exportIconLayoutState__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F312C0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithBundleIdentifier:v3];

  return v4;
}

id __36__DBIconModel_exportIconLayoutState__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F312C0];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithBundleIdentifier:v3];

  return v4;
}

- (id)analyticsIconRepresentation
{
  v90[12] = *MEMORY[0x263EF8340];
  id v3 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__8;
  v87 = __Block_byref_object_dispose__8;
  id v88 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__8;
  v73 = __Block_byref_object_dispose__8;
  id v74 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__DBIconModel_analyticsIconRepresentation__block_invoke;
  block[3] = &unk_2649B68F0;
  block[4] = self;
  block[5] = &v83;
  block[6] = &v79;
  block[7] = &v75;
  block[8] = &v69;
  dispatch_sync(v3, block);

  id v4 = [(DBIconModel *)self exportStateForCarKit];
  id v5 = [v4 objectForKey:@"iconOrder"];
  id v6 = [v5 firstObject];

  double v7 = +[DBIconLayoutVehicleDataProvider defaultIconState];
  id v8 = [v7 valueForKeyPath:@"iconLists"];
  int v9 = [v8 firstObject];

  BOOL v10 = [(DBIconModel *)self showsOEMIcon];
  if (!v10)
  {
    uint64_t v11 = objc_msgSend(v9, "bs_filter:", &__block_literal_global_110);

    int v9 = (void *)v11;
  }
  CGRect v12 = [MEMORY[0x263EFF980] arrayWithArray:v9];
  BOOL v31 = v10;
  uint64_t v13 = *MEMORY[0x263F31290];
  uint64_t v14 = [v12 indexOfObject:*MEMORY[0x263F31290]];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v12 removeObjectAtIndex:v14];
    [v12 addObject:v13];
  }
  v15 = &v64;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v16 = (void *)v84[5];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __42__DBIconModel_analyticsIconRepresentation__block_invoke_3;
  v37[3] = &unk_2649B6918;
  v37[4] = self;
  id v27 = v6;
  id v38 = v27;
  id v29 = v9;
  id v39 = v29;
  id v30 = v12;
  id v40 = v30;
  v41 = &v48;
  v42 = &v79;
  v43 = &v75;
  v44 = &v64;
  v45 = &v52;
  v46 = &v60;
  v47 = &v56;
  [v16 enumerateObjectsUsingBlock:v37];
  v89[0] = @"IconRows";
  v36 = [NSNumber numberWithUnsignedInteger:v80[3]];
  v90[0] = v36;
  v89[1] = @"IconColumns";
  v35 = [NSNumber numberWithUnsignedInteger:v76[3]];
  v90[1] = v35;
  v89[2] = @"IconCount";
  v34 = [NSNumber numberWithUnsignedInteger:v65[3] + v61[3]];
  v90[2] = v34;
  v89[3] = @"IconPageCount";
  v33 = [NSNumber numberWithDouble:ceil((double)(unint64_t)(v65[3] + v61[3]) / (double)(unint64_t)(v76[3] * v80[3]))];
  v90[3] = v33;
  v89[4] = @"IconThirdPartyCount";
  v17 = [NSNumber numberWithUnsignedInteger:v65[3]];
  v90[4] = v17;
  v89[5] = @"IconFirstPartyCount";
  v18 = [NSNumber numberWithUnsignedInteger:v61[3]];
  v90[5] = v18;
  v89[6] = @"IconFirstPartyCountFirstPage";
  v19 = [NSNumber numberWithUnsignedInteger:v57[3]];
  v90[6] = v19;
  v89[7] = @"IconThirdPartyCountFirstPage";
  v20 = [NSNumber numberWithUnsignedInteger:v53[3]];
  v90[7] = v20;
  v89[8] = @"IconFirstPageCustomized";
  v21 = [NSNumber numberWithBool:*((unsigned __int8 *)v49 + 24)];
  v90[8] = v21;
  v89[9] = @"ShowsOEMIcon";
  v22 = [NSNumber numberWithBool:v31];
  v90[9] = v22;
  v89[10] = @"HiddenAppsCount";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v70[5], "count"));
  v90[10] = v23;
  v89[11] = @"HiddenApps";
  uint64_t v24 = [(id)v70[5] count];
  if (v24)
  {
    objc_msgSend((id)v70[5], "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_, v27, v29);
    v15 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v25 = [v15 componentsJoinedByString:@", "];
  }
  else
  {
    v25 = @"None";
  }
  v90[11] = v25;
  objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 12, v27);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  return v32;
}

void __42__DBIconModel_analyticsIconRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) leafIcons];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) rowCount];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) columnCount];
  objc_msgSend(*(id *)(a1 + 32), "metadata_hiddenBundleIdentifiers");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v8 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __42__DBIconModel_analyticsIconRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x263F312A8]] ^ 1;
}

void __42__DBIconModel_analyticsIconRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v13 application];
    id v4 = [v3 bundleIdentifier];

    if (!v4) {
      goto LABEL_21;
    }
  }
  else
  {
    id v4 = [v13 applicationBundleID];
    if (!v4) {
      goto LABEL_21;
    }
  }
  if ([*(id *)(a1 + 32) isIconVisible:v13])
  {
    uint64_t v5 = [*(id *)(a1 + 40) indexOfObject:v4];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      uint64_t v7 = [*(id *)(a1 + 48) indexOfObject:v4];
      uint64_t v8 = [*(id *)(a1 + 56) indexOfObject:v4];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      if (!*(unsigned char *)(v9 + 24)
        && v6 < *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
              * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
        && (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL || v7 != v6 && v8 != v6))
      {
        *(unsigned char *)(v9 + 24) = 1;
      }
      BOOL v10 = +[DBApplicationController sharedInstance];
      uint64_t v11 = [v10 applicationWithBundleIdentifier:v4];

      if (([v11 isFirstParty] & 1) != 0
        || ([v4 isEqualToString:*MEMORY[0x263F312A8]] & 1) != 0
        || ([v4 isEqualToString:*MEMORY[0x263F31298]] & 1) != 0)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
        if (v6 >= *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
                 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
LABEL_20:

          goto LABEL_21;
        }
        uint64_t v12 = *(void *)(a1 + 112);
      }
      else
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        if (v6 >= *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
                 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
          goto LABEL_20;
        uint64_t v12 = *(void *)(a1 + 96);
      }
      ++*(void *)(*(void *)(v12 + 8) + 24);
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)resetCurrentIconState
{
  id v10 = [(DBIconModel *)self iconModelMetadata];
  [(DBIconModel *)self setMetadata_hiddenBundleIdentifiers:0];
  [(SBHIconModel *)self deleteIconState];
  [(SBHIconModel *)self clearDesiredIconState];
  uint64_t v3 = *MEMORY[0x263F31300];
  id v4 = [v10 objectForKeyedSubscript:*MEMORY[0x263F31300]];

  if (v4)
  {
    uint64_t v5 = [v10 objectForKeyedSubscript:v3];
    -[DBIconModel setMetadata_showsOEMIcon:](self, "setMetadata_showsOEMIcon:", [v5 BOOLValue]);
  }
  uint64_t v6 = *MEMORY[0x263F31318];
  uint64_t v7 = [v10 objectForKeyedSubscript:*MEMORY[0x263F31318]];

  if (v7)
  {
    uint64_t v8 = [v10 objectForKeyedSubscript:v6];
    uint64_t v9 = (void *)[v8 copy];
    [(DBIconModel *)self setMetadata_OEMIconLabel:v9];
  }
  [(SBHIconModel *)self reloadIcons];
  [(SBHIconModel *)self layout];
}

- (void)importState:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "%@ importing icon state %@", (uint8_t *)&v6, 0x16u);
  }

  [(DBIconModel *)self _importStateWithoutLayout:v4];
  [(SBHIconModel *)self layout];
}

- (BOOL)supportsDock
{
  return 0;
}

- (void)loadAllIcons
{
  v6.receiver = self;
  v6.super_class = (Class)DBIconModel;
  [(SBHIconModel *)&v6 loadAllIcons];
  uint64_t v3 = [(DBIconModel *)self carApplicationDataSource];
  id v4 = [v3 allApplicationIcons];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__DBIconModel_loadAllIcons__block_invoke;
  v5[3] = &unk_2649B6940;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __27__DBIconModel_loadAllIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:")) {
    [*(id *)(a1 + 32) addIcon:v3];
  }
}

- (BOOL)_showInternalApps
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showInternalApps", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)_showPrototypeApps
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showPrototypeApps", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)isIconVisible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationBundleID];
  if (![v5 isEqualToString:*MEMORY[0x263F312A8]])
  {
    if ([v5 isEqualToString:*MEMORY[0x263F31298]])
    {
      char v6 = 1;
      goto LABEL_31;
    }
    uint64_t v7 = +[DBApplicationController sharedInstance];
    __int16 v8 = [v7 applicationWithBundleIdentifier:v5];

    if (([v8 isHidden] & 1) != 0
      || ([v8 isRestricted] & 1) != 0
      || ![v8 isInstalled]
      || ([v8 isPlaceholder] & 1) != 0
      || ([v8 isLockedOrHidden] & 1) != 0)
    {
      goto LABEL_29;
    }
    if (isIconVisible__onceToken != -1) {
      dispatch_once(&isIconVisible__onceToken, &__block_literal_global_173);
    }
    if ([(id)isIconVisible__alwaysHiddenBundleIDs containsObject:v5]) {
      goto LABEL_29;
    }
    if (![v5 isEqualToString:*MEMORY[0x263F31290]]
      || (keyExistsAndHasValidFormat[0] = 0,
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"news_carplay_is_enabled", @"com.apple.newscore", keyExistsAndHasValidFormat), keyExistsAndHasValidFormat[0])&& AppBooleanValue)
    {
      v17.receiver = self;
      v17.super_class = (Class)DBIconModel;
      if (![(SBHIconModel *)&v17 isIconVisible:v4]
        || ([(DBIconModel *)self metadata_hiddenBundleIdentifiers],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 containsObject:v5],
            v10,
            (v11 & 1) != 0)
        || (([v8 isCarInternal] & 1) == 0 ? (int v12 = objc_msgSend(v8, "isInternal") ^ 1) : (int v12 = 0),
            (int v14 = [v8 isCarPrototype], !-[DBIconModel _showInternalApps](self, "_showInternalApps"))
         && !v12
         || ![(DBIconModel *)self _showPrototypeApps] && v14 == 1))
      {
LABEL_29:
        char v6 = 0;
        goto LABEL_30;
      }
      id v13 = [v8 requiredVehicleAccessories];
      if ([v13 count])
      {
        v16 = +[DBIconView environmentConfiguration];
        char v6 = [v16 isVehicleDataSession];
      }
      else
      {
        char v6 = 1;
      }
    }
    else
    {
      id v13 = DBLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)Boolean keyExistsAndHasValidFormat = 0;
        _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Hiding News per News app policy.", keyExistsAndHasValidFormat, 2u);
      }
      char v6 = 0;
    }

LABEL_30:
    goto LABEL_31;
  }
  char v6 = [(DBIconModel *)self showsOEMIcon];
LABEL_31:

  return v6;
}

void __29__DBIconModel_isIconVisible___block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.MusicUIService";
  v2[1] = @"com.apple.springboard";
  v2[2] = @"com.apple.InCallService";
  v2[3] = @"com.apple.commandandcontrol";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)isIconVisible__alwaysHiddenBundleIDs;
  isIconVisible__alwaysHiddenBundleIDs = v0;
}

- (id)iconModelMetadata
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F31308];
  uint64_t v3 = [(DBIconModel *)self metadata_hiddenBundleIdentifiers];
  id v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x263EFFA68];
  if (v3) {
    uint64_t v5 = v3;
  }
  v13[0] = v5;
  v12[1] = *MEMORY[0x263F31300];
  char v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DBIconModel showsOEMIcon](self, "showsOEMIcon"));
  v13[1] = v6;
  v12[2] = *MEMORY[0x263F31318];
  uint64_t v7 = [(DBIconModel *)self OEMIconLabel];
  __int16 v8 = (void *)v7;
  id v9 = &stru_26E13A820;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  v13[2] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (void)didUnarchiveMetadata:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DBIconModel;
  [(SBHIconModel *)&v16 didUnarchiveMetadata:v4];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F31308]];
  char v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_191);

  uint64_t v7 = *MEMORY[0x263F31300];
  __int16 v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F31300]];

  if (v8)
  {
    id v9 = [v4 objectForKeyedSubscript:v7];
    -[DBIconModel setMetadata_showsOEMIcon:](self, "setMetadata_showsOEMIcon:", [v9 BOOLValue]);
  }
  uint64_t v10 = *MEMORY[0x263F31318];
  char v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F31318]];

  if (v11)
  {
    int v12 = [v4 objectForKeyedSubscript:v10];
    id v13 = (void *)[v12 copy];
    [(DBIconModel *)self setMetadata_OEMIconLabel:v13];
  }
  int v14 = [MEMORY[0x263EFFA08] setWithArray:v6];
  v15 = [v14 allObjects];
  [(DBIconModel *)self setMetadata_hiddenBundleIdentifiers:v15];
}

id __36__DBIconModel_didUnarchiveMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[DBApplicationController sharedInstance];
  id v4 = [v3 applicationWithBundleIdentifier:v2];

  if (v4)
  {
    uint64_t v5 = [v4 bundleIdentifier];
    char v6 = (void *)[v5 copy];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)automaticallyAddsWebClips
{
  return 0;
}

- (void)_importStateWithoutLayout:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F31308];
  id v5 = a3;
  char v6 = [v5 objectForKeyedSubscript:v4];
  [(DBIconModel *)self setMetadata_hiddenBundleIdentifiers:v6];

  uint64_t v7 = [MEMORY[0x263F79228] rootArchiveFromCarKitRepresentation:v5 iconModel:self];

  __int16 v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    objc_super v16 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "%@ importing icon state %@", buf, 0x16u);
  }

  [(SBHIconModel *)self clearDesiredIconState];
  id v9 = [(SBHIconModel *)self store];
  id v12 = 0;
  [v9 saveCurrentIconState:v7 error:&v12];
  id v10 = v12;

  if (v10)
  {
    char v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DBIconModel _importStateWithoutLayout:]((uint64_t)v10, v11);
    }
  }
  [(DBIconModel *)self loadAllIcons];
}

- (CGSize)iconImageSize
{
  double width = self->_iconImageSize.width;
  double height = self->_iconImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconImageSize:(CGSize)a3
{
  self->_iconImageSize = a3;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (DBIconModelApplicationDataSource)carApplicationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carApplicationDataSource);
  return (DBIconModelApplicationDataSource *)WeakRetained;
}

- (void)setCarApplicationDataSource:(id)a3
{
}

- (NSArray)metadata_hiddenBundleIdentifiers
{
  return self->_metadata_hiddenBundleIdentifiers;
}

- (void)setMetadata_hiddenBundleIdentifiers:(id)a3
{
}

- (CGRect)metadata_screenBounds
{
  double x = self->_metadata_screenBounds.origin.x;
  double y = self->_metadata_screenBounds.origin.y;
  double width = self->_metadata_screenBounds.size.width;
  double height = self->_metadata_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMetadata_screenBounds:(CGRect)a3
{
  self->_metadata_screenBounds = a3;
}

- (BOOL)metadata_showsOEMIcon
{
  return self->_metadata_showsOEMIcon;
}

- (void)setMetadata_showsOEMIcon:(BOOL)a3
{
  self->_metadata_showsOEMIcon = a3;
}

- (NSString)metadata_OEMIconLabel
{
  return self->_metadata_OEMIconLabel;
}

- (void)setMetadata_OEMIconLabel:(id)a3
{
}

- (BOOL)current_isSet
{
  return self->_current_isSet;
}

- (void)setCurrent_isSet:(BOOL)a3
{
  self->_current_isSet = a3;
}

- (CGRect)current_screenBounds
{
  double x = self->_current_screenBounds.origin.x;
  double y = self->_current_screenBounds.origin.y;
  double width = self->_current_screenBounds.size.width;
  double height = self->_current_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrent_screenBounds:(CGRect)a3
{
  self->_current_screenBounds = a3;
}

- (BOOL)current_showsOEMIcon
{
  return self->_current_showsOEMIcon;
}

- (void)setCurrent_showsOEMIcon:(BOOL)a3
{
  self->_current_showsOEMIcon = a3;
}

- (NSString)current_OEMIconLabel
{
  return self->_current_OEMIconLabel;
}

- (void)setCurrent_OEMIconLabel:(id)a3
{
}

- (unint64_t)current_statusBarEdge
{
  return self->_current_statusBarEdge;
}

- (void)setCurrent_statusBarEdge:(unint64_t)a3
{
  self->_current_statusBarEdge = a3;
}

- (unint64_t)interactionAffordances
{
  return self->_interactionAffordances;
}

- (void)setInteractionAffordances:(unint64_t)a3
{
  self->_interactionAffordances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current_OEMIconLabel, 0);
  objc_storeStrong((id *)&self->_metadata_OEMIconLabel, 0);
  objc_storeStrong((id *)&self->_metadata_hiddenBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_carApplicationDataSource);
  objc_destroyWeak((id *)&self->_environment);
}

- (void)_importStateWithoutLayout:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Failed saving current icon state: %@", (uint8_t *)&v2, 0xCu);
}

@end