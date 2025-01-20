@interface CRSUIClusterWindow
- (CARObserverHashTable)observers;
- (CRSUIInstrumentClusterSettingsDiffInspector)clusterSettingsDiffInspector;
- (id)_clusterSettings;
- (unint64_t)compassSetting;
- (unint64_t)etaSetting;
- (unint64_t)itemType;
- (unint64_t)layoutJustification;
- (unint64_t)speedLimitSetting;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)addClusterSettingsObserver:(id)a3;
- (void)commonInit;
- (void)handleZoomInDirection:(int64_t)a3;
- (void)removeClusterSettingsObserver:(id)a3;
- (void)setClusterSettingsDiffInspector:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CRSUIClusterWindow

- (void)commonInit
{
  v30[1] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)CRSUIClusterWindow;
  [(CRSUIWindow *)&v28 commonInit];
  v3 = (CARObserverHashTable *)[objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26C95C4D0];
  observers = self->_observers;
  self->_observers = v3;

  v5 = [(CRSUIClusterWindow *)self windowScene];
  v6 = [[CRSUIClusterZoomBSActionsHandler alloc] initWithDelegate:self];
  v30[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v5 _registerSceneActionsHandlerArray:v7 forKey:@"zoomActions"];

  v8 = objc_alloc_init(CRSUIInstrumentClusterSettingsDiffInspector);
  clusterSettingsDiffInspector = self->_clusterSettingsDiffInspector;
  self->_clusterSettingsDiffInspector = v8;

  objc_initWeak(&location, self);
  v10 = self->_clusterSettingsDiffInspector;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __32__CRSUIClusterWindow_commonInit__block_invoke;
  v25[3] = &unk_264307E00;
  objc_copyWeak(&v26, &location);
  [(CRSUIInstrumentClusterSettingsDiffInspector *)v10 observeShowETAWithBlock:v25];
  v11 = self->_clusterSettingsDiffInspector;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_2;
  v23[3] = &unk_264307E00;
  objc_copyWeak(&v24, &location);
  [(CRSUIInstrumentClusterSettingsDiffInspector *)v11 observeShowCompassWithBlock:v23];
  v12 = self->_clusterSettingsDiffInspector;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_3;
  v21[3] = &unk_264307E00;
  objc_copyWeak(&v22, &location);
  [(CRSUIInstrumentClusterSettingsDiffInspector *)v12 observeShowSpeedLimitWithBlock:v21];
  v13 = self->_clusterSettingsDiffInspector;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_4;
  v19[3] = &unk_264307E00;
  objc_copyWeak(&v20, &location);
  [(CRSUIInstrumentClusterSettingsDiffInspector *)v13 observeItemTypeWithBlock:v19];
  v14 = self->_clusterSettingsDiffInspector;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_5;
  v17[3] = &unk_264307E00;
  objc_copyWeak(&v18, &location);
  [(CRSUIInstrumentClusterSettingsDiffInspector *)v14 observeLayoutSpecificationWithBlock:v17];
  v15 = [(CRSUIClusterWindow *)self windowScene];
  v29 = self;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  [v15 _registerSettingsDiffActionArray:v16 forKey:@"clusterSettings"];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __32__CRSUIClusterWindow_commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observers];
  objc_msgSend(v1, "clusterWindow:didChangeETASetting:", WeakRetained, objc_msgSend(WeakRetained, "etaSetting"));
}

void __32__CRSUIClusterWindow_commonInit__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observers];
  objc_msgSend(v1, "clusterWindow:didChangeCompassSetting:", WeakRetained, objc_msgSend(WeakRetained, "compassSetting"));
}

void __32__CRSUIClusterWindow_commonInit__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observers];
  objc_msgSend(v1, "clusterWindow:didChangeSpeedLimitSetting:", WeakRetained, objc_msgSend(WeakRetained, "speedLimitSetting"));
}

void __32__CRSUIClusterWindow_commonInit__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observers];
  objc_msgSend(v1, "clusterWindow:didChangeItemType:", WeakRetained, objc_msgSend(WeakRetained, "itemType"));
}

void __32__CRSUIClusterWindow_commonInit__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained observers];
  objc_msgSend(v1, "clusterWindow:didChangeLayoutJustification:", WeakRetained, objc_msgSend(WeakRetained, "layoutJustification"));
}

- (void)addClusterSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIClusterWindow *)self observers];
  [v5 addObserver:v4];
}

- (void)removeClusterSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIClusterWindow *)self observers];
  [v5 removeObserver:v4];
}

- (unint64_t)etaSetting
{
  v2 = [(CRSUIClusterWindow *)self _clusterSettings];
  unint64_t v3 = [v2 showsETA];

  return v3;
}

- (unint64_t)compassSetting
{
  v2 = [(CRSUIClusterWindow *)self _clusterSettings];
  unint64_t v3 = [v2 showsCompass];

  return v3;
}

- (unint64_t)speedLimitSetting
{
  v2 = [(CRSUIClusterWindow *)self _clusterSettings];
  unint64_t v3 = [v2 showsSpeedLimit];

  return v3;
}

- (unint64_t)itemType
{
  v2 = [(CRSUIClusterWindow *)self _clusterSettings];
  unint64_t v3 = [v2 itemType];

  return v3;
}

- (unint64_t)layoutJustification
{
  v2 = [(CRSUIClusterWindow *)self _clusterSettings];
  unint64_t v3 = [v2 layoutJustification];

  return v3;
}

- (void)handleZoomInDirection:(int64_t)a3
{
  id v5 = [(CRSUIClusterWindow *)self observers];
  [v5 clusterWindow:self didZoomInDirection:a3];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  v16.receiver = self;
  v16.super_class = (Class)CRSUIClusterWindow;
  id v14 = a5;
  [(CRSUIWindow *)&v16 _performActionsForUIScene:a3 withUpdatedFBSScene:a4 settingsDiff:v14 fromSettings:a6 transitionContext:a7 lifecycleActionType:v8];
  v15 = [(CRSUIClusterWindow *)self clusterSettingsDiffInspector];
  [v15 inspectDiff:v14 withContext:0];
}

- (id)_clusterSettings
{
  objc_opt_class();
  unint64_t v3 = [(CRSUIClusterWindow *)self windowScene];
  id v4 = [v3 _FBSScene];
  id v5 = [v4 settings];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CRSUIInstrumentClusterSettingsDiffInspector)clusterSettingsDiffInspector
{
  return self->_clusterSettingsDiffInspector;
}

- (void)setClusterSettingsDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end