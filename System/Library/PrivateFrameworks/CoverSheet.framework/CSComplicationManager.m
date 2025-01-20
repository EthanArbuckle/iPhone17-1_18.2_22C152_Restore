@interface CSComplicationManager
- (BOOL)_bundleHasOpenURLEntitlement:(id)a3;
- (BOOL)_widgetHasMatchingSystemDescriptor:(id)a3;
- (CSComplicationManager)initWithApplicationInformer:(id)a3 urlHandler:(id)a4;
- (id)_widgetMetricsForBounds:(CGRect)a3 fromMetrics:(id)a4;
- (id)onInlineComplicationUpdate;
- (id)onSidebarWidgetUpdate;
- (id)onTintColorUpdate;
- (id)onWidgetUpdate;
- (void)_complicationDescriptorsForWidgets:(id)a3 completion:(id)a4;
- (void)_createComplicationDescriptorForWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5;
- (void)_openApplicationWithBundleIdentifier:(id)a3 action:(id)a4;
- (void)_updateComplicationsForActivePosterConfiguration;
- (void)_updateWidgetHostConfiguration;
- (void)applicationInformer:(id)a3 updatedApplications:(id)a4;
- (void)dealloc;
- (void)descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)handleLaunchRequestForWidget:(id)a3 withAction:(id)a4;
- (void)setOnInlineComplicationUpdate:(id)a3;
- (void)setOnSidebarWidgetUpdate:(id)a3;
- (void)setOnTintColorUpdate:(id)a3;
- (void)setOnWidgetUpdate:(id)a3;
@end

@implementation CSComplicationManager

- (CSComplicationManager)initWithApplicationInformer:(id)a3 urlHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CSComplicationManager;
  v9 = [(CSComplicationManager *)&v28 init];
  if (v9)
  {
    v10 = (PRWidgetMetricsProvider *)objc_alloc_init(MEMORY[0x1E4F92730]);
    widgetMetricsProvider = v9->_widgetMetricsProvider;
    v9->_widgetMetricsProvider = v10;

    graphicComplicationDescriptors = v9->_graphicComplicationDescriptors;
    v13 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v9->_graphicComplicationDescriptors = (NSArray *)MEMORY[0x1E4F1CBF0];

    sidebarComplicationDescriptors = v9->_sidebarComplicationDescriptors;
    v9->_sidebarComplicationDescriptors = v13;

    objc_storeStrong((id *)&v9->_applicationInformer, a3);
    objc_storeStrong((id *)&v9->_urlHandler, a4);
    v15 = (CHSWidgetDescriptorProvider *)objc_alloc_init(MEMORY[0x1E4F58E00]);
    widgetDescriptorProvider = v9->_widgetDescriptorProvider;
    v9->_widgetDescriptorProvider = v15;

    [(CHSWidgetDescriptorProvider *)v9->_widgetDescriptorProvider addObserver:v9];
    if ((CSFeatureEnabled(0) & 1) != 0 || CSFeatureEnabled(4))
    {
      [(CSApplicationInforming *)v9->_applicationInformer addApplicationInformationObserver:v9];
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F92390]) initWithExplanation:@"CoverSheet"];
      wallpaperObserver = v9->_wallpaperObserver;
      v9->_wallpaperObserver = (PRSWallpaperObserver *)v17;

      objc_initWeak(&location, v9);
      v19 = (void *)MEMORY[0x1E4F92398];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke;
      v25 = &unk_1E6AD9550;
      objc_copyWeak(&v26, &location);
      v20 = [v19 configurationWithHandler:&v22];
      -[PRSWallpaperObserver activateWithConfiguration:](v9->_wallpaperObserver, "activateWithConfiguration:", v20, v22, v23, v24, v25);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v9;
}

void __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke_2;
  v5[3] = &unk_1E6AD9390;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64__CSComplicationManager_initWithApplicationInformer_urlHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    [v3 _updateComplicationsForActivePosterConfiguration];
    WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(PRSWallpaperObserver *)self->_wallpaperObserver invalidate];
  [(CHSWidgetHost *)self->_widgetHost invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSComplicationManager;
  [(CSComplicationManager *)&v3 dealloc];
}

- (id)_widgetMetricsForBounds:(CGRect)a3 fromMetrics:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = (objc_class *)MEMORY[0x1E4F5E4D0];
  id v9 = a4;
  id v10 = [v8 alloc];
  v11 = [MEMORY[0x1E4F42D90] mainScreen];
  v12 = (void *)[v10 initWithTraitEnvironment:v11];

  objc_msgSend(v12, "frameForElements:withBoundingRect:", 4, x, y, width, height);
  double v14 = v13;
  [v9 size];
  double v16 = v15;

  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F58E80]), "initWithSize:cornerRadius:", v14, v16, 0.0);

  return v17;
}

- (void)_updateComplicationsForActivePosterConfiguration
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D839D000, a2, a3, "Failed to load complication layout from %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWidgetHostConfiguration];
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 120);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_2_20(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73__CSComplicationManager__updateComplicationsForActivePosterConfiguration__block_invoke_3_21(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v2 = [*(id *)(a1 + 40) complicationIconLayout];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) sidebarComplicationIconLayout];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v5;

  [*(id *)(a1 + 32) _updateWidgetHostConfiguration];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[16];
  if (v9)
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, v8[7], v8[9]);
    id v8 = *(void **)(a1 + 32);
  }
  uint64_t result = v8[17];
  if (result)
  {
    v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (void)_complicationDescriptorsForWidgets:(id)a3 completion:(id)a4
{
  id v23 = a4;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke;
  v33[3] = &unk_1E6AD95F0;
  v33[4] = self;
  uint64_t v6 = objc_msgSend(a3, "bs_filter:", v33);
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = dispatch_group_create();
  if ([v6 count])
  {
    unint64_t v9 = 0;
    v24 = v8;
    v25 = v6;
    do
    {
      id v10 = [MEMORY[0x1E4F1CA98] null];
      [v7 addObject:v10];

      dispatch_group_enter(v8);
      v11 = [v6 objectAtIndexedSubscript:v9];
      id v12 = objc_alloc(MEMORY[0x1E4F58DD8]);
      double v13 = [v11 extensionBundleIdentifier];
      double v14 = [v11 containerBundleIdentifier];
      double v15 = [v11 kind];
      uint64_t v16 = [v11 family];
      [v11 intent];
      v18 = uint64_t v17 = v7;
      v19 = (void *)[v12 initWithExtensionBundleIdentifier:v13 containerBundleIdentifier:v14 kind:v15 family:v16 intent:v18];

      id v7 = v17;
      id v8 = v24;

      v20 = [(PRWidgetMetricsProvider *)self->_widgetMetricsProvider systemMetricsForWidget:v19];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_2;
      v29[3] = &unk_1E6AD9618;
      id v30 = v7;
      unint64_t v32 = v9;
      v31 = v24;
      [(CSComplicationManager *)self _createComplicationDescriptorForWidget:v11 withMetrics:v20 completion:v29];

      uint64_t v6 = v25;
      ++v9;
    }
    while (v9 < [v25 count]);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_3;
  block[3] = &unk_1E6AD9028;
  id v27 = v7;
  id v28 = v23;
  id v21 = v7;
  id v22 = v23;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
}

uint64_t __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _widgetHasMatchingSystemDescriptor:a2];
}

void __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 atIndexedSubscript:*(void *)(a1 + 48)];
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __71__CSComplicationManager__complicationDescriptorsForWidgets_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)_widgetHasMatchingSystemDescriptor:(id)a3
{
  widgetDescriptorProvider = self->_widgetDescriptorProvider;
  id v4 = a3;
  uint64_t v5 = [(CHSWidgetDescriptorProvider *)widgetDescriptorProvider descriptorForPersonality:v4];
  [v4 family];

  uint64_t v6 = CHSWidgetFamilyMaskFromWidgetFamily();
  if (v5) {
    BOOL v7 = (v6 & ~[v5 supportedFamilies]) == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_updateWidgetHostConfiguration
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v4 = [v3 arrayByAddingObjectsFromArray:self->_graphicComplicationDescriptors];

  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v7 = [v4 arrayByAddingObjectsFromArray:self->_sidebarComplicationDescriptors];

    id v4 = (void *)v7;
  }
  if (self->_inlineComplicationDescriptor)
  {
    landscapeInlineComplicationDescriptor = self->_landscapeInlineComplicationDescriptor;
    if (landscapeInlineComplicationDescriptor)
    {
      v17[0] = self->_inlineComplicationDescriptor;
      v17[1] = landscapeInlineComplicationDescriptor;
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      uint64_t v10 = [v4 arrayByAddingObjectsFromArray:v9];

      id v4 = (void *)v10;
    }
  }
  v11 = objc_msgSend(v4, "bs_map:", &__block_literal_global_3);
  id v12 = [(PRWidgetMetricsProvider *)self->_widgetMetricsProvider lockScreenWidgetMetricsSpecifications];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F58DE0]) initWithContainerDescriptors:v11 metricsSpecification:v12];
  widgetHost = self->_widgetHost;
  if (widgetHost)
  {
    [(CHSWidgetHost *)widgetHost setConfiguration:v13];
  }
  else
  {
    double v15 = (CHSWidgetHost *)[objc_alloc(MEMORY[0x1E4F58E60]) initWithIdentifier:@"Complications" configuration:v13 active:1];
    uint64_t v16 = self->_widgetHost;
    self->_widgetHost = v15;

    [(CHSWidgetHost *)self->_widgetHost activate];
  }
}

id __55__CSComplicationManager__updateWidgetHostConfiguration__block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 uniqueIdentifier];
  id v4 = objc_alloc(MEMORY[0x1E4F58D10]);
  uint64_t v5 = [v2 widget];
  uint64_t v6 = [v2 metrics];
  uint64_t v7 = (void *)[v4 initWithUniqueIdentifier:v3 widget:v5 metrics:v6];

  [v7 setSuggestion:0];
  [v7 setSystemConfigured:0];
  [v7 setSupportedColorSchemes:2];
  [v7 setSupportsLowLuminance:1];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:1 backgroundViewPolicy:1];
  v17[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v7 setSupportedRenderSchemes:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F58C38]);
  v11 = [v2 widget];

  uint64_t v12 = [v11 family];
  uint64_t v16 = v7;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  double v14 = (void *)[v10 initWithUniqueIdentifier:v3 location:4 canAppearInSecureEnvironment:1 page:0 family:v12 widgets:v13 activeWidget:v3];

  return v14;
}

- (void)_createComplicationDescriptorForWidget:(id)a3 withMetrics:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  id v11 = objc_alloc(MEMORY[0x1E4F58DD8]);
  uint64_t v12 = [v8 extensionBundleIdentifier];
  double v13 = [v8 containerBundleIdentifier];
  double v14 = [v8 kind];
  uint64_t v15 = [v8 family];
  uint64_t v16 = [v8 intent];
  id v40 = (id)[v11 initWithExtensionBundleIdentifier:v12 containerBundleIdentifier:v13 kind:v14 family:v15 intent:v16];

  applicationInformer = self->_applicationInformer;
  v18 = [(id)v36[5] containerBundleIdentifier];
  LOBYTE(applicationInformer) = [(CSApplicationInforming *)applicationInformer isBundleIdentifierBlockedForScreenTimeExpiration:v18];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke;
  v29[3] = &unk_1E6AD9660;
  v33 = &v35;
  id v19 = v8;
  id v30 = v19;
  id v20 = v9;
  id v31 = v20;
  char v34 = (char)applicationInformer;
  id v21 = v10;
  id v32 = v21;
  id v22 = (void (**)(void, void))MEMORY[0x1D9487300](v29);
  id v23 = [(CHSWidgetDescriptorProvider *)self->_widgetDescriptorProvider descriptorForPersonality:v36[5]];
  v24 = [v23 intentType];
  if (v24
    && ([(id)v36[5] intent],
        v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        !v25))
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke_2;
    v27[3] = &unk_1E6AD9688;
    id v28 = v22;
    [v23 loadDefaultIntent:v27];
    id v26 = v28;
  }
  else
  {
    id v26 = [(id)v36[5] intent];
    ((void (**)(void, void *))v22)[2](v22, v26);
  }

  _Block_object_dispose(&v35, 8);
}

void __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) widgetByReplacingIntent:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [CSComplicationDescriptor alloc];
  uint64_t v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v8 = [(CSComplicationDescriptor *)v6 initWithUniqueIdentifier:v7 widget:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) metrics:*(void *)(a1 + 40) blockedForScreenTimeExpiration:*(unsigned __int8 *)(a1 + 64)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __87__CSComplicationManager__createComplicationDescriptorForWidget_withMetrics_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setOnInlineComplicationUpdate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1D9487300](a3, a2);
  id onInlineComplicationUpdate = self->_onInlineComplicationUpdate;
  self->_id onInlineComplicationUpdate = v4;

  id v6 = self->_onInlineComplicationUpdate;
  if (v6)
  {
    uint64_t v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (void)setOnWidgetUpdate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1D9487300](a3, a2);
  id onWidgetUpdate = self->_onWidgetUpdate;
  self->_id onWidgetUpdate = v4;

  id v6 = self->_onWidgetUpdate;
  if (v6)
  {
    uint64_t v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (void)setOnSidebarWidgetUpdate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1D9487300](a3, a2);
  id onSidebarWidgetUpdate = self->_onSidebarWidgetUpdate;
  self->_id onSidebarWidgetUpdate = v4;

  id v6 = self->_onSidebarWidgetUpdate;
  if (v6)
  {
    uint64_t v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (void)setOnTintColorUpdate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1D9487300](a3, a2);
  id onTintColorUpdate = self->_onTintColorUpdate;
  self->_id onTintColorUpdate = v4;

  id v6 = self->_onTintColorUpdate;
  if (v6)
  {
    uint64_t v7 = (void (*)(void))*((void *)v6 + 2);
    v7();
  }
}

- (void)handleLaunchRequestForWidget:(id)a3 withAction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 extensionBundleIdentifier];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v7 error:0];
  id v9 = [v8 containingBundleRecord];
  id v10 = [v9 bundleIdentifier];

  int v11 = [(CSApplicationInforming *)self->_applicationInformer isBundleIdentifierUserVisible:v10];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v13 = [(CSComplicationManager *)self _bundleHasOpenURLEntitlement:v7];
  if ((v11 & 1) == 0 && (isKindOfClass & 1) != 0 && v13)
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v6;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v18 = v16;

    id v19 = SBLogDashBoard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v18 url];
      int v23 = 138543618;
      v24 = v10;
      __int16 v25 = 2114;
      id v26 = v20;
      _os_log_impl(&dword_1D839D000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Opening URL from complication tap: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    urlHandler = self->_urlHandler;
    id v22 = [v18 url];
    [(CSWidgetURLHandling *)urlHandler openURL:v22];
  }
  else if (v11)
  {
    [(CSComplicationManager *)self _openApplicationWithBundleIdentifier:v10 action:v6];
  }
  else
  {
    uint64_t v17 = SBLogDashBoard();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_1D839D000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignored application launch from complication because application is not user visible", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)_openApplicationWithBundleIdentifier:(id)a3 action:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = [v6 dictionary];
  v16[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, *MEMORY[0x1E4F62388]);

  uint64_t v10 = MEMORY[0x1E4F1CC38];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F62398]);
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v10, *MEMORY[0x1E4F623A0]);
  int v11 = [MEMORY[0x1E4F62460] optionsWithDictionary:v8];
  uint64_t v12 = [MEMORY[0x1E4F62468] serviceWithDefaultShellEndpoint];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke;
  v14[3] = &unk_1E6AD96B0;
  id v15 = v5;
  id v13 = v5;
  [v12 openApplication:v13 withOptions:v11 completion:v14];
}

void __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogDashBoard();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke_cold_1(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application launch from complication succeeded", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)_bundleHasOpenURLEntitlement:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:1 error:0];
  id v4 = [v3 entitlements];
  uint64_t v5 = *MEMORY[0x1E4F58F18];
  id v6 = self;
  uint64_t v7 = [v4 objectForKey:v5 ofClass:v6];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CSComplicationManager_descriptorsDidChangeForDescriptorProvider___block_invoke;
  block[3] = &unk_1E6AD87F8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__CSComplicationManager_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateComplicationsForActivePosterConfiguration];
}

- (void)applicationInformer:(id)a3 updatedApplications:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(CHSWidgetHost *)self->_widgetHost configuration];
  uint64_t v9 = [v8 containerDescriptors];
  uint64_t v10 = objc_msgSend(v9, "bs_map:", &__block_literal_global_44);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([v7 containsObject:v16])
        {
          char v17 = [v6 isBundleIdentifierBlockedForScreenTimeExpiration:v16];
          graphicComplicationDescriptors = self->_graphicComplicationDescriptors;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke_2;
          v22[3] = &unk_1E6AD96F8;
          v22[4] = v16;
          char v23 = v17;
          id v19 = [(NSArray *)graphicComplicationDescriptors bs_map:v22];
          id v20 = self->_graphicComplicationDescriptors;
          self->_graphicComplicationDescriptors = v19;

          id onWidgetUpdate = (void (**)(id, NSArray *, NSDictionary *))self->_onWidgetUpdate;
          if (onWidgetUpdate) {
            onWidgetUpdate[2](onWidgetUpdate, self->_graphicComplicationDescriptors, self->_iconLayout);
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

id __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 activeWidget];
  uint64_t v3 = [v2 widget];
  id v4 = [v3 containerBundleIdentifier];

  return v4;
}

id __65__CSComplicationManager_applicationInformer_updatedApplications___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 widget];
  uint64_t v5 = [v4 containerBundleIdentifier];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    id v7 = [v3 descriptorBlockedForScreenTimeExpiration:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    id v7 = v3;
  }
  char v8 = v7;

  return v8;
}

- (id)onInlineComplicationUpdate
{
  return self->_onInlineComplicationUpdate;
}

- (id)onWidgetUpdate
{
  return self->_onWidgetUpdate;
}

- (id)onSidebarWidgetUpdate
{
  return self->_onSidebarWidgetUpdate;
}

- (id)onTintColorUpdate
{
  return self->_onTintColorUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onTintColorUpdate, 0);
  objc_storeStrong(&self->_onSidebarWidgetUpdate, 0);
  objc_storeStrong(&self->_onWidgetUpdate, 0);
  objc_storeStrong(&self->_onInlineComplicationUpdate, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_widgetMetricsProvider, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_sidebarIconLayout, 0);
  objc_storeStrong((id *)&self->_iconLayout, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationDescriptors, 0);
  objc_storeStrong((id *)&self->_graphicComplicationDescriptors, 0);
  objc_storeStrong((id *)&self->_landscapeInlineComplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_inlineComplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
  objc_storeStrong((id *)&self->_wallpaperState, 0);

  objc_storeStrong((id *)&self->_wallpaperObserver, 0);
}

void __69__CSComplicationManager__openApplicationWithBundleIdentifier_action___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D839D000, a2, a3, "[%{public}@] Application launch from complication failed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end