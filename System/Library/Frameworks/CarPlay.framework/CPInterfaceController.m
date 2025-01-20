@interface CPInterfaceController
+ (id)_templateClientInterface;
+ (id)_templateProvidingInterface;
+ (void)_allowlistClassesForBaseTemplateProvider:(id)a3;
- (BOOL)isCarPlayCanvasActive;
- (BOOL)prefersDarkUserInterfaceStyle;
- (CPTemplate)lastPresentedTemplate;
- (CPTemplate)presentedTemplate;
- (CPTemplate)rootTemplate;
- (CPTemplate)topTemplate;
- (CPTemplateProviding)templateProvider;
- (CPWindow)carWindow;
- (CPWindowProviding)windowProvider;
- (NSArray)templates;
- (NSMapTable)templateMapTable;
- (NSXPCConnection)connection;
- (UITraitCollection)carTraitCollection;
- (id)_activeMapTemplate;
- (id)_init;
- (id)_listenerEndpointForSettings:(id)a3;
- (id)_synchronousTemplateProvider;
- (id)_templateWithIdentifier:(id)a3;
- (id)delegate;
- (void)_connectToListenerEndpoint:(id)a3;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_handleCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)_invalidate;
- (void)_presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentAlertTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_pushEntityTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushGridTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushInformationTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushListTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushMapTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushNowPlayingTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushSearchTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushTabBarTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_pushTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_pushVoiceControlTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_sceneConnect:(id)a3;
- (void)bannerDidAppearWithIdentifier:(id)a3;
- (void)bannerDidDisappearWithIdentifier:(id)a3;
- (void)bannerTappedWithIdentifier:(id)a3;
- (void)clientAssistantCellUnavailableWithError:(id)a3;
- (void)clientExceededAudioMetadataThrottleLimit;
- (void)clientExceededHierarchyDepthLimit;
- (void)clientExceededTabBarTabLimit;
- (void)clientPushNowPlayingTemplateAnimated:(BOOL)a3;
- (void)clientPushedIllegalTemplateOfClass:(id)a3;
- (void)dismissTemplateAnimated:(BOOL)animated;
- (void)dismissTemplateAnimated:(BOOL)animated completion:(void *)completion;
- (void)popTemplateAnimated:(BOOL)animated;
- (void)popTemplateAnimated:(BOOL)animated completion:(void *)completion;
- (void)popToRootTemplateAnimated:(BOOL)animated;
- (void)popToRootTemplateAnimated:(BOOL)animated completion:(void *)completion;
- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated;
- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated completion:(void *)completion;
- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated;
- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated completion:(void *)completion;
- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated;
- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated completion:(void *)completion;
- (void)selectTabBarTemplateIndex:(int64_t)a3;
- (void)setCarWindow:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setLastPresentedTemplate:(id)a3;
- (void)setPrefersDarkUserInterfaceStyle:(BOOL)prefersDarkUserInterfaceStyle;
- (void)setPresentedTemplate:(id)a3;
- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated;
- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated completion:(void *)completion;
- (void)setRootTemplate:(id)a3;
- (void)setTemplateMapTable:(id)a3;
- (void)setTemplateProvider:(id)a3;
- (void)setWindowProvider:(id)a3;
- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateIdentifierDidDismiss:(id)a3;
- (void)templateIdentifierDidPop:(id)a3;
- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)updateInterestingLayoutGuideWithInsets:(UIEdgeInsets)a3;
- (void)updateTabBarTemplate:(id)a3;
@end

@implementation CPInterfaceController

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)CPInterfaceController;
  v2 = [(CPInterfaceController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    templateMapTable = v2->_templateMapTable;
    v2->_templateMapTable = (NSMapTable *)v3;
  }
  return v2;
}

- (void)setPrefersDarkUserInterfaceStyle:(BOOL)prefersDarkUserInterfaceStyle
{
  if (self->_prefersDarkUserInterfaceStyle != prefersDarkUserInterfaceStyle)
  {
    self->_prefersDarkUserInterfaceStyle = prefersDarkUserInterfaceStyle;
    id v4 = [(CPInterfaceController *)self templateProvider];
    [v4 setHostPrefersDarkUserInterfaceStyle:self->_prefersDarkUserInterfaceStyle];
  }
}

- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated completion:(void *)completion
{
  BOOL v6 = animated;
  uint64_t v34 = *MEMORY[0x263EF8340];
  v10 = rootTemplate;
  v11 = completion;
  v12 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_2181A5000, v12, OS_LOG_TYPE_DEFAULT, "Setting root template %@ animated %@", buf, 0x16u);
  }
  if (CPRootTemplateClasses_onceToken != -1) {
    dispatch_once(&CPRootTemplateClasses_onceToken, &__block_literal_global_546);
  }
  id v14 = (id)CPRootTemplateClasses_classes;
  v15 = v10;
  char v16 = [v14 containsObject:object_getClass(v15)];
  v17 = (uint64_t *)MEMORY[0x263EFF4A0];
  if ((v16 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF4A0];
    NSStringFromSelector(a2);
    v20 = a2;
    v21 = self;
    v23 = BOOL v22 = v6;
    uint64_t v24 = v19;
    v17 = (uint64_t *)MEMORY[0x263EFF4A0];
    [v18 raise:v24, @"Unsupported object %@ passed to %@. Allowed classes: %@", v15, v23, v14, 0 format];

    BOOL v6 = v22;
    self = v21;
    a2 = v20;
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1) {
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_549);
  }
  id v25 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v26 = v15;
  if (([v25 containsObject:object_getClass(v26)] & 1) == 0)
  {
    v27 = (void *)MEMORY[0x263EFF940];
    uint64_t v28 = *v17;
    v29 = NSStringFromSelector(a2);
    [v27 raise:v28, @"Unsupported object %@ passed to %@. Allowed classes: %@", v26, v29, v25, 0 format];
  }
  if (![(CPTemplate *)self->_rootTemplate isEqual:v26])
  {
    objc_storeStrong((id *)&self->_rootTemplate, rootTemplate);
    [(CPInterfaceController *)self _pushTemplate:v26 presentationStyle:1 animated:v6 completion:v11];
  }
}

- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated completion:(void *)completion
{
  BOOL v6 = animated;
  v39[1] = *MEMORY[0x263EF8340];
  v9 = templateToPush;
  v10 = completion;
  if (CPPushableTemplateClasses_onceToken != -1) {
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_567);
  }
  id v11 = (id)CPPushableTemplateClasses_classes;
  v12 = v9;
  char v13 = [v11 containsObject:object_getClass(v12)];
  id v14 = (uint64_t *)MEMORY[0x263EFF4A0];
  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = *MEMORY[0x263EFF4A0];
    NSStringFromSelector(a2);
    v17 = v10;
    uint64_t v19 = v18 = v6;
    [v15 raise:v16, @"Unsupported object %@ passed to %@. Allowed classes: %@", v12, v19, v11, 0 format];

    BOOL v6 = v18;
    v10 = v17;
    id v14 = (uint64_t *)MEMORY[0x263EFF4A0];
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1) {
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_549);
  }
  id v20 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v21 = v12;
  if (([v20 containsObject:object_getClass(v21)] & 1) == 0)
  {
    BOOL v22 = (void *)MEMORY[0x263EFF940];
    uint64_t v23 = *v14;
    uint64_t v24 = NSStringFromSelector(a2);
    [v22 raise:v23, @"Unsupported object %@ passed to %@. Allowed classes: %@", v21, v24, v20, 0 format];
  }
  id v25 = [(CPInterfaceController *)self templateMapTable];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    v27 = [(CPInterfaceController *)self templateMapTable];
    uint64_t v28 = [(CPTemplate *)v21 identifier];
    v29 = [v27 objectForKey:v28];

    if (!v29)
    {
      [(CPInterfaceController *)self _pushTemplate:v21 presentationStyle:0 animated:v6 completion:v10];
      goto LABEL_15;
    }
    v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37 = @"Pushing the same template instance more than once is not supported.";
    v31 = NSDictionary;
    __int16 v32 = &v37;
    v33 = &v36;
  }
  else
  {
    v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = @"Attempting to push a template without a root template. Set a root template first with setRootTemplate.";
    v31 = NSDictionary;
    __int16 v32 = (__CFString **)v39;
    v33 = &v38;
  }
  uint64_t v34 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:1];
  v35 = [v30 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v34];

  [(CPInterfaceController *)self _handleCompletion:v10 withSuccess:0 error:v35];
LABEL_15:
}

- (void)_pushTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v12 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = CPSStringFromBOOL(v7);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = (uint64_t)v10;
    __int16 v21 = 2050;
    unint64_t v22 = a4;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    _os_log_impl(&dword_2181A5000, v12, OS_LOG_TYPE_DEFAULT, "Creating template: %{public}@; presentation style: %{public}lu; animated: %{public}@",
      buf,
      0x20u);
  }
  if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushMapTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushGridTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushListTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushSearchTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushNowPlayingTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushTabBarTemplate:v10 animated:v7 completion:v11];
  }
  else if ([v10 isMemberOfClass:objc_opt_class()])
  {
    [(CPInterfaceController *)self _pushInformationTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  else
  {
    if (![v10 conformsToProtocol:&unk_26C973FD0])
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Template %@ was requested to be pushed but is not a pushable template.", v10 format];
      goto LABEL_22;
    }
    [(CPInterfaceController *)self _pushEntityTemplate:v10 presentationStyle:a4 animated:v7 completion:v11];
  }
  [v10 setTemplateDelegate:self];
  id v14 = [(CPInterfaceController *)self templateMapTable];
  v15 = [v10 identifier];
  [v14 setObject:v10 forKey:v15];

  uint64_t v16 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(CPInterfaceController *)self templateMapTable];
    uint64_t v18 = [v17 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v18;
    _os_log_impl(&dword_2181A5000, v16, OS_LOG_TYPE_DEFAULT, "Template did push, stack count: %lu", buf, 0xCu);
  }
LABEL_22:
}

- (void)popToRootTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  BOOL v4 = animated;
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v6 = completion;
  BOOL v7 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Requesting pop to root template animated: %@", buf, 0xCu);
  }
  v9 = [(CPInterfaceController *)self templateProvider];
  id v10 = [NSNumber numberWithBool:v4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__CPInterfaceController_popToRootTemplateAnimated_completion___block_invoke;
  v12[3] = &unk_26430A068;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 popToRootTemplateAnimated:v10 reply:v12];
}

void __62__CPInterfaceController_popToRootTemplateAnimated_completion___block_invoke(uint64_t a1, int a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v4 _handleCompletion:v3 withSuccess:1 error:0];
  }
  else
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"No templates were available to be popped.";
    BOOL v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    BOOL v7 = [v5 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v6];
    [v2 _handleCompletion:v3 withSuccess:0 error:v7];
  }
}

- (void)popTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  BOOL v4 = animated;
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v6 = completion;
  BOOL v7 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Requesting template pop animated: %@", buf, 0xCu);
  }
  v9 = [(CPInterfaceController *)self templateProvider];
  id v10 = [NSNumber numberWithBool:v4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CPInterfaceController_popTemplateAnimated_completion___block_invoke;
  v12[3] = &unk_26430A068;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 popTemplateAnimated:v10 reply:v12];
}

void __56__CPInterfaceController_popTemplateAnimated_completion___block_invoke(uint64_t a1, int a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v4 _handleCompletion:v3 withSuccess:1 error:0];
  }
  else
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"No templates were available to be popped.";
    BOOL v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    BOOL v7 = [v5 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v6];
    [v2 _handleCompletion:v3 withSuccess:0 error:v7];
  }
}

- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated completion:(void *)completion
{
  BOOL v6 = (const char *)animated;
  uint64_t v37 = *MEMORY[0x263EF8340];
  v9 = targetTemplate;
  id v10 = completion;
  id v11 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v12;
    _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "Requesting pop to template %@ animated %@", buf, 0x16u);
  }
  if (CPPushableTemplateClasses_onceToken != -1) {
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_567);
  }
  id v13 = (id)CPPushableTemplateClasses_classes;
  id v14 = v9;
  char v15 = [v13 containsObject:object_getClass(v14)];
  uint64_t v16 = (uint64_t *)MEMORY[0x263EFF4A0];
  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x263EFF940];
    uint64_t v18 = *MEMORY[0x263EFF4A0];
    NSStringFromSelector(a2);
    char v19 = (char)v6;
    v20 = BOOL v6 = a2;
    [v17 raise:v18, @"Unsupported object %@ passed to %@. Allowed classes: %@", v14, v20, v13, 0 format];

    a2 = v6;
    LOBYTE(v6) = v19;
    uint64_t v16 = (uint64_t *)MEMORY[0x263EFF4A0];
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1) {
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_549);
  }
  id v21 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  unint64_t v22 = v14;
  if (([v21 containsObject:object_getClass(v22)] & 1) == 0)
  {
    __int16 v23 = (void *)MEMORY[0x263EFF940];
    uint64_t v24 = *v16;
    uint64_t v25 = NSStringFromSelector(a2);
    [v23 raise:v24, @"Unsupported object %@ passed to %@. Allowed classes: %@", v22, v25, v21, 0 format];
  }
  uint64_t v26 = [(CPInterfaceController *)self templateProvider];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke;
  v29[3] = &unk_26430A0B8;
  v29[4] = self;
  v30 = v22;
  char v32 = (char)v6;
  id v31 = v10;
  id v27 = v10;
  uint64_t v28 = v22;
  [v26 containsTemplate:v28 reply:v29];
}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_2;
  v4[3] = &unk_26430A090;
  char v7 = a2;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v8 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = [*(id *)(a1 + 32) templateProvider];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_3;
    v10[3] = &unk_26430A068;
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v3 popToTemplate:v4 animated:v5 reply:v10];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    char v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"The specified template does not exist in the current navigation hierarchy.";
    char v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v9 = [v7 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v8];
    [v2 _handleCompletion:v6 withSuccess:0 error:v9];
  }
}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_3(uint64_t a1, int a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _handleCompletion:v3 withSuccess:1 error:0];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = @"The specified template does not exist in the current navigation hierarchy.";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    char v7 = [v5 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v6];
    [v2 _handleCompletion:v3 withSuccess:0 error:v7];
  }
}

- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated completion:(void *)completion
{
  BOOL v6 = animated;
  uint64_t v38 = *MEMORY[0x263EF8340];
  v9 = templateToPresent;
  id v10 = completion;
  id v11 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 138412546;
    __int16 v35 = v9;
    __int16 v36 = 2112;
    uint64_t v37 = v12;
    _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "Requesting present template %@ animated %@", buf, 0x16u);
  }
  if (CPPresentableTemplateClasses_onceToken != -1) {
    dispatch_once(&CPPresentableTemplateClasses_onceToken, &__block_literal_global_569);
  }
  id v13 = (id)CPPresentableTemplateClasses_classes;
  id v14 = v9;
  char v15 = [v13 containsObject:object_getClass(v14)];
  uint64_t v16 = (uint64_t *)MEMORY[0x263EFF4A0];
  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x263EFF940];
    uint64_t v18 = *MEMORY[0x263EFF4A0];
    NSStringFromSelector(a2);
    char v19 = a2;
    uint64_t v20 = v10;
    unint64_t v22 = v21 = v6;
    [v17 raise:v18, @"Unsupported object %@ passed to %@. Allowed classes: %@", v14, v22, v13, 0 format];

    BOOL v6 = v21;
    id v10 = v20;
    a2 = v19;
    uint64_t v16 = (uint64_t *)MEMORY[0x263EFF4A0];
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1) {
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_549);
  }
  id v23 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  uint64_t v24 = v14;
  if (([v23 containsObject:object_getClass(v24)] & 1) == 0)
  {
    uint64_t v25 = (void *)MEMORY[0x263EFF940];
    uint64_t v26 = *v16;
    id v27 = NSStringFromSelector(a2);
    [v25 raise:v26, @"Unsupported object %@ passed to %@. Allowed classes: %@", v24, v27, v23, 0 format];
  }
  if (self->_presentedTemplate)
  {
    uint64_t v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v33 = @"Presenting a template while a template is already presented is not supported.";
    v29 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    presentedTemplate = [v28 errorWithDomain:@"CarPlayErrorDomain" code:-1 userInfo:v29];

    [(CPInterfaceController *)self _handleCompletion:v10 withSuccess:0 error:presentedTemplate];
  }
  else
  {
    if ([(CPTemplate *)v24 isMemberOfClass:objc_opt_class()])
    {
      [(CPInterfaceController *)self _presentActionSheetTemplate:v24 animated:v6 completion:v10];
    }
    else if ([(CPTemplate *)v24 isMemberOfClass:objc_opt_class()])
    {
      [(CPInterfaceController *)self _presentAlertTemplate:v24 animated:v6 completion:v10];
    }
    else if ([(CPTemplate *)v24 isMemberOfClass:objc_opt_class()])
    {
      [(CPInterfaceController *)self _pushVoiceControlTemplate:v24 animated:v6 completion:v10];
    }
    [(CPTemplate *)v24 setTemplateDelegate:self];
    id v31 = v24;
    presentedTemplate = self->_presentedTemplate;
    self->_presentedTemplate = v31;
  }
}

- (void)dismissTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  BOOL v4 = animated;
  BOOL v6 = completion;
  char v7 = [(CPInterfaceController *)self templateProvider];
  uint64_t v8 = [NSNumber numberWithBool:v4];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __60__CPInterfaceController_dismissTemplateAnimated_completion___block_invoke;
  id v14 = &unk_26430A0E0;
  char v15 = self;
  id v16 = v6;
  id v9 = v6;
  [v7 dismissTemplateAnimated:v8 reply:&v11];

  objc_storeStrong((id *)&self->_lastPresentedTemplate, self->_presentedTemplate);
  [(CPTemplate *)self->_presentedTemplate invalidateTemplateProvider];
  presentedTemplate = self->_presentedTemplate;
  self->_presentedTemplate = 0;
}

uint64_t __60__CPInterfaceController_dismissTemplateAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCompletion:*(void *)(a1 + 40) withSuccess:1 error:0];
}

- (CPTemplate)presentedTemplate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(CPInterfaceController *)self _synchronousTemplateProvider];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CPInterfaceController_presentedTemplate__block_invoke;
  v6[3] = &unk_26430A108;
  v6[4] = self;
  v6[5] = &v7;
  [v3 getPresentedTemplateWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CPTemplate *)v4;
}

void __42__CPInterfaceController_presentedTemplate__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) identifier];
  int v4 = [v3 isEqual:v12];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v6 = (id *)(v5 + 24);
  }
  else
  {
    uint64_t v7 = [*(id *)(v5 + 56) identifier];
    int v8 = [v7 isEqual:v12];

    if (!v8) {
      goto LABEL_6;
    }
    BOOL v6 = (id *)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *v6;
  uint64_t v11 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v10;

LABEL_6:
}

- (CPTemplate)topTemplate
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(CPInterfaceController *)self _synchronousTemplateProvider];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__CPInterfaceController_topTemplate__block_invoke;
  v6[3] = &unk_26430A130;
  v6[4] = self;
  v6[5] = &v7;
  [v3 getTopTemplateWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CPTemplate *)v4;
}

void __36__CPInterfaceController_topTemplate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 templateMapTable];
  uint64_t v5 = [v8 objectForKey:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSArray)templates
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(CPInterfaceController *)self _synchronousTemplateProvider];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__CPInterfaceController_templates__block_invoke;
  v6[3] = &unk_26430A180;
  v6[4] = self;
  v6[5] = &v7;
  [v3 getTemplatesWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__CPInterfaceController_templates__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __34__CPInterfaceController_templates__block_invoke_2;
  v9[3] = &unk_26430A158;
  v9[4] = *(void *)(a1 + 32);
  id v5 = v4;
  id v10 = v5;
  [v3 enumerateObjectsUsingBlock:v9];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;
}

void __34__CPInterfaceController_templates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 templateMapTable];
  id v7 = [v5 objectForKey:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    uint64_t v6 = v7;
  }
}

- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated
{
}

- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated
{
}

- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated
{
}

- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated
{
}

- (void)dismissTemplateAnimated:(BOOL)animated
{
}

- (void)popTemplateAnimated:(BOOL)animated
{
}

- (void)popToRootTemplateAnimated:(BOOL)animated
{
}

- (void)_handleCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke_2;
    v11[3] = &unk_26430A1A8;
    id v10 = &v13;
    id v13 = v7;
    BOOL v14 = a4;
    id v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v11);

LABEL_3:
    goto LABEL_4;
  }
  if ((v8 || !a4) && dyld_program_sdk_at_least())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke;
    block[3] = &unk_264309D80;
    id v10 = &v16;
    id v16 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
    goto LABEL_3;
  }
LABEL_4:
}

uint64_t __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke(uint64_t a1)
{
  return [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"An error was encountered during a template operation, but no completion block was specified. Error: %@", *(void *)(a1 + 32) format];
}

uint64_t __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_pushVoiceControlTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CPInterfaceController *)self templateProvider];
  uint64_t v11 = [NSNumber numberWithBool:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__CPInterfaceController__pushVoiceControlTemplate_animated_completion___block_invoke;
  v14[3] = &unk_26430A1D0;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 presentVoiceTemplate:v13 withProxyDelegate:v13 animated:v11 reply:v14];
}

uint64_t __71__CPInterfaceController__pushVoiceControlTemplate_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushGridTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__CPInterfaceController__pushGridTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A1F8;
  id v17 = v10;
  uint64_t v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushGridTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __81__CPInterfaceController__pushGridTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushInformationTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__CPInterfaceController__pushInformationTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A220;
  id v17 = v10;
  uint64_t v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushInformationTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __88__CPInterfaceController__pushInformationTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushMapTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke;
  v26[3] = &unk_26430A248;
  id v14 = v10;
  id v27 = v14;
  [v12 pushMapTemplate:v14 withProxyDelegate:v14 animated:v13 presentationStyle:a4 reply:v26];

  id v15 = [(CPInterfaceController *)self templateProvider];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_2;
  v24[3] = &unk_26430A270;
  id v16 = v14;
  id v25 = v16;
  [v15 requestBannerProviderWithReply:v24];

  id v17 = [(CPInterfaceController *)self templateProvider];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_3;
  v20[3] = &unk_26430A298;
  id v21 = v16;
  unint64_t v22 = self;
  id v23 = v11;
  id v18 = v11;
  id v19 = v16;
  [v17 requestNavigationProviderForMapTemplate:v19 withReply:v20];
}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) connectTemplateProvider:a2];
}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBannerProvider:a2];
}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setNavigationSessionProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushListTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__CPInterfaceController__pushListTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A2C0;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushListTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __81__CPInterfaceController__pushListTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushSearchTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__CPInterfaceController__pushSearchTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A2E8;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushSearchTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __83__CPInterfaceController__pushSearchTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushNowPlayingTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__CPInterfaceController__pushNowPlayingTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A310;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushNowPlayingTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __87__CPInterfaceController__pushNowPlayingTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)_pushTabBarTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  [v7 setInterfaceController:self];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v7 templates];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        location[1] = (id)MEMORY[0x263EF8330];
        location[2] = (id)3221225472;
        location[3] = __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke;
        location[4] = &unk_26430A338;
        location[5] = v13;
        -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:");
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  objc_initWeak(location, self);
  id v14 = [(CPInterfaceController *)self templateProvider];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_54;
  v17[3] = &unk_26430A360;
  id v15 = v7;
  id v18 = v15;
  objc_copyWeak(&v20, location);
  id v16 = v8;
  id v19 = v16;
  [v14 setTabBarTemplate:v15 withProxyDelegate:v15 reply:v17 animated:MEMORY[0x263EFFA80]];

  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = CarPlayFrameworkGeneralLogging();
  id v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Prepared a tab for %@", (uint8_t *)&v9, 0xCu);
  }
}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_54(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleCompletion:*(void *)(a1 + 40) withSuccess:1 error:0];
}

- (void)_pushEntityTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(CPInterfaceController *)self templateProvider];
  id v13 = [NSNumber numberWithBool:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__CPInterfaceController__pushEntityTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_26430A388;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  [v12 pushEntityTemplate:v15 withProxyDelegate:v15 animated:v13 presentationStyle:a4 reply:v16];
}

uint64_t __83__CPInterfaceController__pushEntityTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) connectTemplateProvider:a2];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 _handleCompletion:v4 withSuccess:1 error:0];
}

- (void)updateTabBarTemplate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 templates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(CPInterfaceController *)self templateProvider];
  [v10 updateTabBarTemplate:v4];
}

void __46__CPInterfaceController_updateTabBarTemplate___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = CarPlayFrameworkGeneralLogging();
  uint64_t v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "Prepared a tab for %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)selectTabBarTemplateIndex:(int64_t)a3
{
  id v4 = [(CPInterfaceController *)self templateProvider];
  [v4 selectTabBarTemplateAtIndex:a3];
}

- (void)_presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [v9 setTemplateDelegate:self];
  uint64_t v10 = [(CPInterfaceController *)self templateProvider];
  uint64_t v11 = [NSNumber numberWithBool:v5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __73__CPInterfaceController__presentActionSheetTemplate_animated_completion___block_invoke;
  v13[3] = &unk_26430A0E0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v10 presentActionSheetTemplate:v9 withProxyDelegate:v9 animated:v11 reply:v13];
}

uint64_t __73__CPInterfaceController__presentActionSheetTemplate_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCompletion:*(void *)(a1 + 40) withSuccess:1 error:0];
}

- (void)_presentAlertTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(CPInterfaceController *)self templateProvider];
  uint64_t v11 = [NSNumber numberWithBool:v5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __67__CPInterfaceController__presentAlertTemplate_animated_completion___block_invoke;
  v13[3] = &unk_26430A0E0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v10 presentAlertTemplate:v9 withProxyDelegate:v9 animated:v11 reply:v13];
}

uint64_t __67__CPInterfaceController__presentAlertTemplate_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCompletion:*(void *)(a1 + 40) withSuccess:1 error:0];
}

- (void)_sceneConnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 _FBSScene];
  if (CPCurrentProcessHasTemplateEntitlement()
    && ([v5 settings],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    id v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 _identifier];
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to listener endpoint for scene identifier: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = objc_alloc_init(MEMORY[0x263F08D98]);
    uint64_t v11 = [v5 settings];
    id v12 = [v11 endpoint];
    [v10 _setEndpoint:v12];

    [(CPInterfaceController *)self _connectToListenerEndpoint:v10];
  }
  else
  {
    uint64_t v10 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CPInterfaceController _sceneConnect:]();
    }
  }
}

- (void)_invalidate
{
  presentedTemplate = self->_presentedTemplate;
  if (presentedTemplate)
  {
    [(CPTemplate *)presentedTemplate invalidateTemplateProvider];
    id v4 = self->_presentedTemplate;
    self->_presentedTemplate = 0;
  }
  lastPresentedTemplate = self->_lastPresentedTemplate;
  if (lastPresentedTemplate)
  {
    [(CPTemplate *)lastPresentedTemplate invalidateTemplateProvider];
    uint64_t v6 = self->_lastPresentedTemplate;
    self->_lastPresentedTemplate = 0;
  }
  id v11 = [(NSMapTable *)self->_templateMapTable objectEnumerator];
  uint64_t v7 = [v11 nextObject];
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      [v8 invalidateTemplateProvider];
      uint64_t v9 = [v11 nextObject];

      id v8 = (void *)v9;
    }
    while (v9);
  }
  [(NSMapTable *)self->_templateMapTable removeAllObjects];
  uint64_t v10 = [(CPInterfaceController *)self connection];
  [v10 invalidate];

  [(CPInterfaceController *)self setConnection:0];
  [(CPInterfaceController *)self setTemplateProvider:0];
}

+ (id)_templateProvidingInterface
{
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E540];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_getTemplatesWithReply_ argumentIndex:0 ofReply:1];

  uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v3 setClasses:v7 forSelector:sel_presentActionSheetTemplate_withProxyDelegate_animated_reply_ argumentIndex:0 ofReply:0];

  id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C95D0A0];
  [v3 setInterface:v8 forSelector:sel_presentActionSheetTemplate_withProxyDelegate_animated_reply_ argumentIndex:1 ofReply:0];

  [v3 setClass:objc_opt_class() forSelector:sel_presentAlertTemplate_withProxyDelegate_animated_reply_ argumentIndex:0 ofReply:0];
  uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C95D0A0];
  [v3 setInterface:v9 forSelector:sel_presentAlertTemplate_withProxyDelegate_animated_reply_ argumentIndex:1 ofReply:0];

  v74 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E5A0];
  [v3 setInterface:v74 forSelector:sel_requestBannerProviderWithReply_ argumentIndex:0 ofReply:1];
  uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C970D40];
  [v3 setInterface:v10 forSelector:sel_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];

  id v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E600];
  [a1 _allowlistClassesForBaseTemplateProvider:v11];
  v73 = v11;
  [v3 setInterface:v11 forSelector:sel_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v11 setClasses:v12 forSelector:sel_reloadTemplate_ argumentIndex:0 ofReply:0];

  int v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C95D020];
  [v3 setInterface:v13 forSelector:sel_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];

  v72 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E660];
  id v14 = a1;
  [a1 _allowlistClassesForBaseTemplateProvider:v72];
  [v3 setInterface:v72 forSelector:sel_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  uint64_t v15 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C971688];
  [v3 setInterface:v15 forSelector:sel_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];

  uint64_t v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E6C0];
  id v68 = a1;
  [a1 _allowlistClassesForBaseTemplateProvider:v16];
  id v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_reloadTemplate_ argumentIndex:0 ofReply:0];

  id v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  long long v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
  v71 = v16;
  [v16 setClasses:v22 forSelector:sel_reloadItems_ argumentIndex:0 ofReply:0];

  [v3 setInterface:v16 forSelector:sel_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  long long v23 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C972C18];
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v23);

  long long v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E720];
  [v14 _allowlistClassesForBaseTemplateProvider:v24];
  [v24 setClass:objc_opt_class() forSelector:sel_hostSetMapButton_imageSet_ argumentIndex:1 ofReply:0];
  long long v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  [v24 setClasses:v27 forSelector:sel_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex_ argumentIndex:0 ofReply:0];

  uint64_t v28 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v24 setClasses:v28 forSelector:sel_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex_ argumentIndex:1 ofReply:0];

  v29 = (void *)MEMORY[0x263EFFA08];
  uint64_t v30 = objc_opt_class();
  id v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  [v24 setClasses:v31 forSelector:sel_hostSetMapButtons_ argumentIndex:0 ofReply:0];

  uint64_t v32 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E780];
  v33 = (void *)MEMORY[0x263EFFA08];
  uint64_t v34 = objc_opt_class();
  __int16 v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v32 setClasses:v35 forSelector:sel_showManeuvers_usingDisplayStyles_ argumentIndex:0 ofReply:0];

  __int16 v36 = (void *)MEMORY[0x263EFFA08];
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v32 setClasses:v38 forSelector:sel_showManeuvers_usingDisplayStyles_ argumentIndex:1 ofReply:0];

  v39 = (void *)MEMORY[0x263EFFA08];
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  [v32 setClasses:v41 forSelector:sel_addManeuvers_ argumentIndex:0 ofReply:0];

  v42 = (void *)MEMORY[0x263EFFA08];
  uint64_t v43 = objc_opt_class();
  v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  [v32 setClasses:v44 forSelector:sel_addLaneGuidances_ argumentIndex:0 ofReply:0];

  v45 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v32 setClasses:v45 forSelector:sel_setCurrentLaneGuidance_ argumentIndex:0 ofReply:0];

  v46 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v70 = v32;
  [v32 setClasses:v46 forSelector:sel_routeChangedWithReason_routeInfo_ argumentIndex:1 ofReply:0];

  v69 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E7E0];
  [v69 setInterface:v32 forSelector:sel_hostStartNavigationSessionForTrip_reply_ argumentIndex:0 ofReply:1];
  [v3 setInterface:v69 forSelector:sel_requestNavigationProviderForMapTemplate_withReply_ argumentIndex:0 ofReply:1];
  [v24 setClass:objc_opt_class() forSelector:sel_showNavigationAlert_animated_ argumentIndex:0 ofReply:0];
  [v3 setInterface:v24 forSelector:sel_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  v47 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C964300];
  [v3 setInterface:v47 forSelector:sel_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];

  v48 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E840];
  [v68 _allowlistClassesForBaseTemplateProvider:v48];
  v49 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v48 setClasses:v49 forSelector:sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_ argumentIndex:0 ofReply:0];

  v50 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C964300];
  [v48 setInterface:v50 forSelector:sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_ argumentIndex:1 ofReply:0];

  v51 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v48 setClasses:v51 forSelector:sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_ argumentIndex:2 ofReply:0];

  [v3 setInterface:v48 forSelector:sel_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  v52 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C973F20];
  v53 = (void *)MEMORY[0x263EFFA08];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  [v52 setClasses:v55 forSelector:sel_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults_ argumentIndex:0 ofReply:1];

  [v3 setInterface:v52 forSelector:sel_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];
  v67 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E8A0];
  [v3 setInterface:v67 forSelector:sel_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];
  v56 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C96FF20];
  [v3 setInterface:v56 forSelector:sel_presentVoiceTemplate_withProxyDelegate_animated_reply_ argumentIndex:1 ofReply:0];

  v57 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E900];
  [v68 _allowlistClassesForBaseTemplateProvider:v57];
  [v3 setInterface:v57 forSelector:sel_presentVoiceTemplate_withProxyDelegate_animated_reply_ argumentIndex:0 ofReply:1];
  v58 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9702A0];
  [v3 setInterface:v58 forSelector:sel_setTabBarTemplate_withProxyDelegate_reply_animated_ argumentIndex:1 ofReply:0];

  v59 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C974080];
  [v3 setInterface:v59 forSelector:sel_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:1 ofReply:0];

  v60 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97E960];
  [v68 _allowlistClassesForBaseTemplateProvider:v60];
  v61 = (void *)MEMORY[0x263EFFA08];
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  v64 = objc_msgSend(v61, "setWithObjects:", v62, v63, objc_opt_class(), 0);
  [v60 setClasses:v64 forSelector:sel_updateEntityTemplate_withProxyDelegate_ argumentIndex:0 ofReply:0];

  v65 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C974080];
  [v60 setInterface:v65 forSelector:sel_updateEntityTemplate_withProxyDelegate_ argumentIndex:1 ofReply:0];

  [v3 setInterface:v60 forSelector:sel_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply_ argumentIndex:0 ofReply:1];

  return v3;
}

+ (void)_allowlistClassesForBaseTemplateProvider:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v11 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v11 setClasses:v6 forSelector:sel_setLeadingNavigationBarButtons_ argumentIndex:0 ofReply:0];

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  [v11 setClasses:v10 forSelector:sel_setTrailingNavigationBarButtons_ argumentIndex:0 ofReply:0];

  [v11 setClass:objc_opt_class() forSelector:sel_setBarButton_image_ argumentIndex:1 ofReply:0];
  [v11 setClass:objc_opt_class() forSelector:sel_setHostBackButton_ argumentIndex:0 ofReply:0];
}

+ (id)_templateClientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C963760];
}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v4];
  uint64_t v6 = [(id)objc_opt_class() _templateProvidingInterface];
  [v5 setRemoteObjectInterface:v6];
  uint64_t v7 = [(id)objc_opt_class() _templateClientInterface];
  [v5 setExportedInterface:v7];
  [v5 setExportedObject:self];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__CPInterfaceController__connectToListenerEndpoint___block_invoke;
  v11[3] = &unk_264309E98;
  objc_copyWeak(&v12, &location);
  [v5 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_393;
  v9[3] = &unk_264309E98;
  objc_copyWeak(&v10, &location);
  [v5 setInvalidationHandler:v9];
  [v5 resume];
  [(CPInterfaceController *)self setConnection:v5];
  uint64_t v8 = [v5 remoteObjectProxy];
  [(CPInterfaceController *)self setTemplateProvider:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_393(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_393_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_connectionInvalidated
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CPInterfaceController__connectionInvalidated__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__CPInterfaceController__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_connectionInterrupted
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CPInterfaceController__connectionInterrupted__block_invoke;
  block[3] = &unk_264309D80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__CPInterfaceController__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (id)_listenerEndpointForSettings:(id)a3
{
  if (a3)
  {
    id v3 = [a3 objectForSetting:1];
    id v4 = objc_alloc_init(MEMORY[0x263F08D98]);
    uint64_t v5 = [v3 endpoint];
    [v4 _setEndpoint:v5];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_synchronousTemplateProvider
{
  v2 = [(CPInterfaceController *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  return v3;
}

void __53__CPInterfaceController__synchronousTemplateProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Error accessing synchronous template provider", v3, 2u);
    }
  }
}

- (UITraitCollection)carTraitCollection
{
  v2 = [(CPInterfaceController *)self windowProvider];
  id v3 = [v2 carTraitCollection];

  return (UITraitCollection *)v3;
}

- (id)_templateWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPTemplate *)self->_presentedTemplate identifier];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    presentedTemplate = self->_presentedTemplate;
LABEL_5:
    id v10 = presentedTemplate;
    goto LABEL_6;
  }
  uint64_t v8 = [(CPTemplate *)self->_lastPresentedTemplate identifier];
  int v9 = [v8 isEqual:v4];

  if (v9)
  {
    presentedTemplate = self->_lastPresentedTemplate;
    goto LABEL_5;
  }
  id v12 = [(CPInterfaceController *)self templateMapTable];
  int v13 = [v12 objectForKey:v4];

  if (v13)
  {
    id v14 = [(CPInterfaceController *)self templateMapTable];
    id v10 = [v14 objectForKey:v4];
  }
  else
  {
    uint64_t v15 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CPInterfaceController _templateWithIdentifier:]((uint64_t)v4, v15);
    }

    id v10 = 0;
  }
LABEL_6:

  return v10;
}

- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CPInterfaceController *)self _templateWithIdentifier:a3];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [(CPInterfaceController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    int v6 = v10;
    if (v8)
    {
      int v9 = [(CPInterfaceController *)self delegate];
      [v9 templateWillAppear:v10 animated:v4];

      int v6 = v10;
    }
  }
}

- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CPInterfaceController *)self _templateWithIdentifier:a3];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [(CPInterfaceController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    int v6 = v10;
    if (v8)
    {
      int v9 = [(CPInterfaceController *)self delegate];
      [v9 templateDidAppear:v10 animated:v4];

      int v6 = v10;
    }
  }
}

- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CPInterfaceController *)self _templateWithIdentifier:a3];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [(CPInterfaceController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    int v6 = v10;
    if (v8)
    {
      int v9 = [(CPInterfaceController *)self delegate];
      [v9 templateWillDisappear:v10 animated:v4];

      int v6 = v10;
    }
  }
}

- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CPInterfaceController *)self _templateWithIdentifier:a3];
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [(CPInterfaceController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    int v6 = v10;
    if (v8)
    {
      int v9 = [(CPInterfaceController *)self delegate];
      [v9 templateDidDisappear:v10 animated:v4];

      int v6 = v10;
    }
  }
}

- (BOOL)isCarPlayCanvasActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowProvider);
  BOOL v3 = [WeakRetained activationState] == 0;

  return v3;
}

- (void)updateInterestingLayoutGuideWithInsets:(UIEdgeInsets)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CPInterfaceController_updateInterestingLayoutGuideWithInsets___block_invoke;
  block[3] = &unk_26430A3D0;
  void block[4] = self;
  UIEdgeInsets v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__CPInterfaceController_updateInterestingLayoutGuideWithInsets___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) windowProvider];
  objc_msgSend(v2, "updateLayoutGuideWithInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)clientPushNowPlayingTemplateAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke;
  v3[3] = &unk_26430A418;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke(uint64_t a1)
{
  id v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "Requesting Now Playing template from client.", v4, 2u);
  }

  BOOL v3 = +[CPNowPlayingTemplate sharedTemplate];
  [*(id *)(a1 + 32) pushTemplate:v3 animated:*(unsigned __int8 *)(a1 + 40) completion:&__block_literal_global_405];
}

void __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke_403(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Failed to request now playing template with %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)clientAssistantCellUnavailableWithError:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CPInterfaceController_clientAssistantCellUnavailableWithError___block_invoke;
  block[3] = &unk_264309D80;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CPInterfaceController_clientAssistantCellUnavailableWithError___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFF940];
  uint64_t v2 = *MEMORY[0x263EFF488];
  id v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  [v1 raise:v2, @"Error: %@", v4 format];

  exit(-1);
}

- (void)clientExceededHierarchyDepthLimit
{
}

void __58__CPInterfaceController_clientExceededHierarchyDepthLimit__block_invoke()
{
}

- (void)clientPushedIllegalTemplateOfClass:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPInterfaceController_clientPushedIllegalTemplateOfClass___block_invoke;
  block[3] = &unk_264309D80;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CPInterfaceController_clientPushedIllegalTemplateOfClass___block_invoke(uint64_t a1)
{
}

- (void)clientExceededTabBarTabLimit
{
}

void __53__CPInterfaceController_clientExceededTabBarTabLimit__block_invoke()
{
}

- (void)clientExceededAudioMetadataThrottleLimit
{
}

void __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke()
{
  v0 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke_cold_1();
  }
}

- (void)templateIdentifierDidPop:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CPInterfaceController_templateIdentifierDidPop___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __50__CPInterfaceController_templateIdentifierDidPop___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) templateMapTable];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 invalidateTemplateProvider];
    id v4 = [*(id *)(a1 + 32) templateMapTable];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    id v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) templateMapTable];
      int v7 = 134217984;
      uint64_t v8 = [v6 count];
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Template did pop, stack count: %lu", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)templateIdentifierDidDismiss:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) identifier];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) invalidateTemplateProvider];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  int v7 = [v6 isEqual:*(void *)(a1 + 40)];

  if (v7)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) invalidateTemplateProvider];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = 0;
  }
  id v10 = [*(id *)(a1 + 32) templateMapTable];
  [v10 removeObjectForKey:*(void *)(a1 + 40)];

  id v11 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 32) templateMapTable];
    int v13 = 134217984;
    uint64_t v14 = [v12 count];
    _os_log_impl(&dword_2181A5000, v11, OS_LOG_TYPE_DEFAULT, "Template did dismiss, stack count: %lu", (uint8_t *)&v13, 0xCu);
  }
}

- (id)_activeMapTemplate
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  uint64_t v2 = [(CPInterfaceController *)self templates];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__CPInterfaceController__activeMapTemplate__block_invoke;
  v5[3] = &unk_26430A440;
  v5[4] = &v6;
  [v2 enumerateObjectsWithOptions:2 usingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__CPInterfaceController__activeMapTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)bannerDidAppearWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CPInterfaceController_bannerDidAppearWithIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__CPInterfaceController_bannerDidAppearWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeMapTemplate];
  [v2 bannerDidAppearWithIdentifier:*(void *)(a1 + 40)];
}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CPInterfaceController_bannerDidDisappearWithIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__CPInterfaceController_bannerDidDisappearWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeMapTemplate];
  [v2 bannerDidDisappearWithIdentifier:*(void *)(a1 + 40)];
}

- (void)bannerTappedWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CPInterfaceController_bannerTappedWithIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __52__CPInterfaceController_bannerTappedWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeMapTemplate];
  [v2 bannerTappedWithIdentifier:*(void *)(a1 + 40)];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)prefersDarkUserInterfaceStyle
{
  return self->_prefersDarkUserInterfaceStyle;
}

- (void)setPresentedTemplate:(id)a3
{
}

- (CPTemplate)rootTemplate
{
  return self->_rootTemplate;
}

- (void)setRootTemplate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CPTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
}

- (CPTemplate)lastPresentedTemplate
{
  return self->_lastPresentedTemplate;
}

- (void)setLastPresentedTemplate:(id)a3
{
}

- (NSMapTable)templateMapTable
{
  return self->_templateMapTable;
}

- (void)setTemplateMapTable:(id)a3
{
}

- (CPWindow)carWindow
{
  return self->_carWindow;
}

- (void)setCarWindow:(id)a3
{
}

- (CPWindowProviding)windowProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowProvider);

  return (CPWindowProviding *)WeakRetained;
}

- (void)setWindowProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowProvider);
  objc_storeStrong((id *)&self->_carWindow, 0);
  objc_storeStrong((id *)&self->_templateMapTable, 0);
  objc_storeStrong((id *)&self->_lastPresentedTemplate, 0);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_rootTemplate, 0);
  objc_storeStrong((id *)&self->_presentedTemplate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_2181A5000, v0, v1, "Failed to create a tab for %@ with %@");
}

- (void)_sceneConnect:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2181A5000, v0, v1, "Not attempting endpoint connection.", v2, v3, v4, v5, v6);
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2181A5000, v0, v1, "Connection interrupted", v2, v3, v4, v5, v6);
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_393_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2181A5000, v0, v1, "Connection invalidated", v2, v3, v4, v5, v6);
}

- (void)_templateWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2181A5000, a2, OS_LOG_TYPE_ERROR, "Unable to identify a template with identifier %@", (uint8_t *)&v2, 0xCu);
}

void __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_2181A5000, v0, OS_LOG_TYPE_FAULT, "Application exceeded audio metadata throttle limit.", v1, 2u);
}

@end