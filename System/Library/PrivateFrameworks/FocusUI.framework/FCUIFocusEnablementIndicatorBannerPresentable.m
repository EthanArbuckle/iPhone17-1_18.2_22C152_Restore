@interface FCUIFocusEnablementIndicatorBannerPresentable
+ (id)accessibilityIdentifierForActivityDescription:(id)a3;
- (BNTemplateItemProviding)primaryTemplateItemProvider;
- (BNTemplateItemProviding)secondaryTemplateItemProvider;
- (BNTemplateViewProviding)leadingTemplateViewProvider;
- (BNTemplateViewProviding)trailingTemplateViewProvider;
- (BOOL)isActivityEnabled;
- (BOOL)isForPreviewing;
- (BOOL)providesTemplateContent;
- (BOOL)shouldAcquireWindowLevelAssertion;
- (FCActivityDescribing)activityDescription;
- (FCUIFocusEnablementIndicatorBannerPresentable)initWithActivityDescription:(id)a3 requesterIdentifier:(id)a4 enabled:(BOOL)a5 forPreviewing:(BOOL)a6;
- (NSString)presentableAccessibilityIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (id)presentableDescription;
- (int64_t)presentableBehavior;
- (int64_t)userInterfaceStyleOverride;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)addPresentableObserver:(id)a3;
- (void)handleTemplateContentEvent:(int64_t)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)removePresentableObserver:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
@end

@implementation FCUIFocusEnablementIndicatorBannerPresentable

- (FCUIFocusEnablementIndicatorBannerPresentable)initWithActivityDescription:(id)a3 requesterIdentifier:(id)a4 enabled:(BOOL)a5 forPreviewing:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCUIFocusEnablementIndicatorBannerPresentable;
  v12 = [(FCUIFocusEnablementIndicatorBannerPresentable *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copyWithZone:0];
    activityDescription = v12->_activityDescription;
    v12->_activityDescription = (FCActivityDescribing *)v13;

    uint64_t v15 = [v11 copy];
    requesterIdentifier = v12->_requesterIdentifier;
    v12->_requesterIdentifier = (NSString *)v15;

    v12->_activityEnabled = a5;
    v12->_forPreviewing = a6;
  }

  return v12;
}

- (NSString)requestIdentifier
{
  requestIdentifier = self->_requestIdentifier;
  if (!requestIdentifier)
  {
    v4 = [MEMORY[0x263F08C38] UUID];
    v5 = [v4 UUIDString];
    v6 = self->_requestIdentifier;
    self->_requestIdentifier = v5;

    requestIdentifier = self->_requestIdentifier;
  }
  return requestIdentifier;
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"activityEnabled";
  v2 = [NSNumber numberWithBool:self->_activityEnabled];
  v7[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = BNPresentableDescription();

  return v4;
}

- (BOOL)providesTemplateContent
{
  return 1;
}

- (BNTemplateViewProviding)leadingTemplateViewProvider
{
  v3 = [MEMORY[0x263F82818] configurationWithPointSize:21.0];
  if (self->_activityEnabled) {
    objc_msgSend(MEMORY[0x263F825C8], "fcui_colorForActivity:", self->_activityDescription);
  }
  else {
  v4 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  v5 = (void *)MEMORY[0x263F82818];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v4, 0);
  v7 = [v5 configurationWithPaletteColors:v6];
  v8 = [v3 configurationByApplyingConfiguration:v7];

  v9 = (void *)MEMORY[0x263F827E8];
  id v10 = [(FCActivityDescribing *)self->_activityDescription activitySymbolImageName];
  id v11 = [v9 _systemImageNamed:v10 withConfiguration:v8];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F29B58]);
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F29B48]) initWithImage:v11];
    v14 = (void *)[v12 initWithItem:v13];
  }
  else
  {
    v14 = 0;
  }

  return (BNTemplateViewProviding *)v14;
}

- (BNTemplateViewProviding)trailingTemplateViewProvider
{
  v3 = [MEMORY[0x263F824F0] filledButtonConfiguration];
  [v3 setCornerStyle:4];
  v4 = [MEMORY[0x263F82818] configurationWithPointSize:12.0];
  v5 = (void *)MEMORY[0x263F82818];
  v6 = [MEMORY[0x263F825C8] systemBlueColor];
  v7 = [v5 configurationWithHierarchicalColor:v6];
  v8 = [v4 configurationByApplyingConfiguration:v7];

  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark" withConfiguration:v8];
  [v3 setImage:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F29B58]) initWithItem:v3];
  [v10 setVisualStyleCategory:2];
  [v10 setVisualStyle:1];
  [v10 setHidden:!self->_activityEnabled];
  [v10 setAccessibilityIdentifier:@"disable-focus-mode"];

  return (BNTemplateViewProviding *)v10;
}

- (BNTemplateItemProviding)primaryTemplateItemProvider
{
  id v3 = objc_alloc(MEMORY[0x263F29B58]);
  v4 = [(FCActivityDescribing *)self->_activityDescription activityDisplayName];
  v5 = (void *)[v3 initWithItem:v4];

  return (BNTemplateItemProviding *)v5;
}

- (BNTemplateItemProviding)secondaryTemplateItemProvider
{
  BOOL activityEnabled = self->_activityEnabled;
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = v3;
  if (activityEnabled) {
    v5 = @"FLANKING_BANNER_ON";
  }
  else {
    v5 = @"FLANKING_BANNER_OFF";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_26D1B4698 table:0];

  v7 = (void *)[objc_alloc(MEMORY[0x263F29B58]) initWithItem:v6];
  return (BNTemplateItemProviding *)v7;
}

- (int64_t)userInterfaceStyleOverride
{
  return 2 * self->_forPreviewing;
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  return self->_forPreviewing;
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  if (a3 == 2 && self->_activityEnabled)
  {
    id v4 = [MEMORY[0x263F3F3A0] sharedActivityManager];
    [v4 setActivity:self->_activityDescription active:0 withLifetime:0 reason:@"banner deactivation button tapped"];
  }
}

- (NSString)presentableAccessibilityIdentifier
{
  return (NSString *)+[FCUIFocusEnablementIndicatorBannerPresentable accessibilityIdentifierForActivityDescription:self->_activityDescription];
}

+ (id)accessibilityIdentifierForActivityDescription:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 activityDisplayName];
  v5 = [v3 stringWithFormat:@"focus-mode-notice-%@", v4];

  return v5;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillAppearAsBanner___block_invoke;
  v6[3] = &unk_264542CF0;
  id v7 = v4;
  id v5 = v4;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_presentableWillAppearAsBanner_ usingBlock:v6];
}

uint64_t __79__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidAppearAsBanner___block_invoke;
  v6[3] = &unk_264542CF0;
  id v7 = v4;
  id v5 = v4;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_presentableDidAppearAsBanner_ usingBlock:v6];
}

uint64_t __78__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_264542D18;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_presentableWillDisappearAsBanner_withReason_ usingBlock:v10];
}

uint64_t __93__FCUIFocusEnablementIndicatorBannerPresentable_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidDisappearAsBanner_withReason___block_invoke;
  v10[3] = &unk_264542D18;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_presentableDidDisappearAsBanner_withReason_ usingBlock:v10];
}

uint64_t __92__FCUIFocusEnablementIndicatorBannerPresentable_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __97__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_264542CF0;
  id v7 = v4;
  id v5 = v4;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_userInteractionWillBeginForBannerForPresentable_ usingBlock:v6];
}

uint64_t __97__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionWillBeginForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __94__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_264542CF0;
  id v7 = v4;
  id v5 = v4;
  [(FCUIFocusEnablementIndicatorBannerPresentable *)self _enumerateObserversRespondingToSelector:sel_userInteractionDidEndForBannerForPresentable_ usingBlock:v6];
}

uint64_t __94__FCUIFocusEnablementIndicatorBannerPresentable_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionDidEndForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)addPresentableObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      id v6 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
      id v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
  }
  MEMORY[0x270F9A758]();
}

- (void)removePresentableObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (BOOL)isActivityEnabled
{
  return self->_activityEnabled;
}

- (BOOL)isForPreviewing
{
  return self->_forPreviewing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end