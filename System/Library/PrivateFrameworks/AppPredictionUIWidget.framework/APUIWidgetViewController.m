@interface APUIWidgetViewController
+ (id)imageForIconSize:(CGSize)a3 scale:(double)a4;
+ (id)imageForIconSize:(CGSize)a3 scale:(double)a4 appearance:(int64_t)a5 tintColor:(id)a6;
+ (id)smartStackImageForIconSize:(CGSize)a3 scale:(double)a4;
+ (id)smartStackImageForIconSize:(CGSize)a3 scale:(double)a4 appearance:(int64_t)a5 tintColor:(id)a6;
- (APUIWidgetViewController)initWithIdentifier:(id)a3;
- (ATXHomeScreenSuggestionClient)suggestionClient;
- (ATXHomeScreenWidgetIdentifiable)widgetIdentifiable;
- (ATXSuggestionLayout)layout;
- (BOOL)effectiveViewVisibility;
- (BOOL)isCurrentlyVisible;
- (BOOL)isViewVisible;
- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4;
- (BOOL)stackVisible;
- (NSArray)suggestionIds;
- (NSString)identifier;
- (void)_topWidgetDidAppear:(id)a3;
- (void)_topWidgetDidDisappear:(id)a3;
- (void)_updateViewVisibility;
- (void)dealloc;
- (void)logChangeWithNewSuggestionIds:(id)a3 previousSuggestionIds:(id)a4 suggestionClient:(id)a5;
- (void)setEffectiveViewVisibility:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayout:(id)a3;
- (void)setStackVisible:(BOOL)a3;
- (void)setSuggestionClient:(id)a3;
- (void)setSuggestionIds:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)setWidgetIdentifiable:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation APUIWidgetViewController

- (APUIWidgetViewController)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APUIWidgetViewController;
  v5 = [(APUIWidgetViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v5 selector:sel__topWidgetDidAppear_ name:*MEMORY[0x263F25120] object:0];
    [v8 addObserver:v5 selector:sel__topWidgetDidDisappear_ name:*MEMORY[0x263F25128] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  [(APUIWidgetViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  [(APUIWidgetViewController *)&v4 viewDidAppear:a3];
  [(APUIWidgetViewController *)self setViewVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APUIWidgetViewController;
  [(APUIWidgetViewController *)&v4 viewDidDisappear:a3];
  [(APUIWidgetViewController *)self setViewVisible:0];
}

- (BOOL)matchesWidgetUniqueID:(id)a3 stackID:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(APUIWidgetViewController *)self identifier];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

- (void)_topWidgetDidAppear:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F25138]];

  char v7 = [v4 userInfo];

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F25130]];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__APUIWidgetViewController__topWidgetDidAppear___block_invoke;
  block[3] = &unk_2647648B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v8;
  id v9 = v8;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__APUIWidgetViewController__topWidgetDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) matchesWidgetUniqueID:*(void *)(a1 + 40) stackID:*(void *)(a1 + 48)];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 setStackVisible:1];
  }
  return result;
}

- (void)_topWidgetDidDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F25138]];

  char v7 = [v4 userInfo];

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F25130]];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__APUIWidgetViewController__topWidgetDidDisappear___block_invoke;
  block[3] = &unk_2647648B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v8;
  id v9 = v8;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__APUIWidgetViewController__topWidgetDidDisappear___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) matchesWidgetUniqueID:*(void *)(a1 + 40) stackID:*(void *)(a1 + 48)];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 setStackVisible:0];
  }
  return result;
}

- (void)logChangeWithNewSuggestionIds:(id)a3 previousSuggestionIds:(id)a4 suggestionClient:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(APUIWidgetViewController *)self effectiveViewVisibility])
  {
    if ([v18 count])
    {
      widgetIdentifiable = self->_widgetIdentifiable;
      v11 = [(APUIWidgetViewController *)self layout];
      id v12 = [v11 uuid];
      id v13 = [v12 UUIDString];
      [v9 logSuggestionsDidAppear:v18 widget:widgetIdentifiable blendingCacheId:v13];
    }
    if ([v8 count])
    {
      v14 = self->_widgetIdentifiable;
      v15 = [(APUIWidgetViewController *)self layout];
      v16 = [v15 uuid];
      v17 = [v16 UUIDString];
      [v9 logSuggestionsDidDisappear:v8 widget:v14 blendingCacheId:v17];
    }
  }
}

- (BOOL)isCurrentlyVisible
{
  BOOL v3 = [(APUIWidgetViewController *)self isViewVisible];
  if (v3)
  {
    LOBYTE(v3) = [(APUIWidgetViewController *)self stackVisible];
  }
  return v3;
}

- (void)setStackVisible:(BOOL)a3
{
  if (self->_stackVisible != a3)
  {
    self->_stackVisible = a3;
    [(APUIWidgetViewController *)self _updateViewVisibility];
  }
}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    [(APUIWidgetViewController *)self _updateViewVisibility];
  }
}

- (void)_updateViewVisibility
{
  BOOL v3 = [(APUIWidgetViewController *)self effectiveViewVisibility];
  BOOL v4 = [(APUIWidgetViewController *)self isCurrentlyVisible];
  if (v3 != v4)
  {
    id v5 = [(APUIWidgetViewController *)self suggestionClient];
    if (v4)
    {
      uint64_t v6 = [(APUIWidgetViewController *)self widgetIdentifiable];
      char v7 = [(APUIWidgetViewController *)self layout];
      id v8 = [v7 uuid];
      id v9 = [v8 UUIDString];
      [v5 logWidgetDidAppear:v6 blendingCacheId:v9];

      id v10 = [(APUIWidgetViewController *)self suggestionClient];
      v11 = [(APUIWidgetViewController *)self suggestionIds];
      id v12 = [(APUIWidgetViewController *)self widgetIdentifiable];
      id v13 = [(APUIWidgetViewController *)self layout];
      v14 = [v13 uuid];
      v15 = [v14 UUIDString];
      [v10 logSuggestionsDidAppear:v11 widget:v12 blendingCacheId:v15];
    }
    else
    {
      v16 = [(APUIWidgetViewController *)self suggestionIds];
      v17 = [(APUIWidgetViewController *)self widgetIdentifiable];
      id v18 = [(APUIWidgetViewController *)self layout];
      v19 = [v18 uuid];
      v20 = [v19 UUIDString];
      [v5 logSuggestionsDidDisappear:v16 widget:v17 blendingCacheId:v20];

      id v10 = [(APUIWidgetViewController *)self suggestionClient];
      v11 = [(APUIWidgetViewController *)self widgetIdentifiable];
      id v12 = [(APUIWidgetViewController *)self layout];
      id v13 = [v12 uuid];
      v14 = [v13 UUIDString];
      [v10 logWidgetDidDisappear:v11 blendingCacheId:v14];
    }
  }
  [(APUIWidgetViewController *)self setEffectiveViewVisibility:v4];
}

+ (id)imageForIconSize:(CGSize)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "imageForIconSize:scale:appearance:tintColor:", 0, 0, a3.width, a3.height, a4);
}

+ (id)imageForIconSize:(CGSize)a3 scale:(double)a4 appearance:(int64_t)a5 tintColor:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a6;
  v11 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:@"com.apple.siri"];
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, a4);
  id v13 = v12;
  if (a5 == 2)
  {
    [v12 setAppearance:2];
    if (v10)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x263F4B520]), "initWithCGColor:", objc_msgSend(v10, "CGColor"));
      [v13 setTintColor:v15];
    }
  }
  else
  {
    if (a5 == 1)
    {
      uint64_t v14 = 1;
    }
    else
    {
      if (a5) {
        goto LABEL_9;
      }
      uint64_t v14 = 0;
    }
    [v12 setAppearance:v14];
  }
LABEL_9:
  v16 = [v11 imageForDescriptor:v13];
  if ([v16 placeholder])
  {
    uint64_t v17 = [v11 prepareImageForDescriptor:v13];

    v16 = (void *)v17;
  }
  id v18 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v19 = [v16 CGImage];
  [v16 scale];
  v20 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);

  return v20;
}

+ (id)smartStackImageForIconSize:(CGSize)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "smartStackImageForIconSize:scale:appearance:tintColor:", 0, 0, a3.width, a3.height, a4);
}

+ (id)smartStackImageForIconSize:(CGSize)a3 scale:(double)a4 appearance:(int64_t)a5 tintColor:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  v33[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  v11 = @"smart-stack";
  if (a5 == 1) {
    v11 = @"smart-stack-dark";
  }
  if (a5 == 2) {
    id v12 = @"smart-stack-tintable";
  }
  else {
    id v12 = v11;
  }
  id v13 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v13 imageNamed:v12 inBundle:v14];

  id v16 = objc_alloc(MEMORY[0x263F4B528]);
  id v17 = v15;
  uint64_t v18 = [v17 CGImage];
  [v17 scale];
  uint64_t v19 = objc_msgSend(v16, "initWithCGImage:scale:", v18);
  id v20 = objc_alloc(MEMORY[0x263F4B540]);
  v33[0] = v19;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  v22 = (void *)[v20 initWithImages:v21];

  v23 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, a4);
  v24 = v23;
  if (a5 == 2)
  {
    [v23 setAppearance:2];
    if (v10)
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x263F4B520]), "initWithCGColor:", objc_msgSend(v10, "CGColor"));
      [v24 setTintColor:v26];
    }
  }
  else
  {
    if (a5 == 1)
    {
      uint64_t v25 = 1;
    }
    else
    {
      if (a5) {
        goto LABEL_14;
      }
      uint64_t v25 = 0;
    }
    [v23 setAppearance:v25];
  }
LABEL_14:
  v27 = [v22 imageForDescriptor:v24];
  if ([v27 placeholder])
  {
    uint64_t v28 = [v22 prepareImageForDescriptor:v24];

    v27 = (void *)v28;
  }
  v29 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v30 = [v27 CGImage];
  [v27 scale];
  v31 = objc_msgSend(v29, "imageWithCGImage:scale:orientation:", v30, 0);

  return v31;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (BOOL)effectiveViewVisibility
{
  return self->_effectiveViewVisibility;
}

- (void)setEffectiveViewVisibility:(BOOL)a3
{
  self->_effectiveViewVisibility = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ATXSuggestionLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)stackVisible
{
  return self->_stackVisible;
}

- (ATXHomeScreenSuggestionClient)suggestionClient
{
  return self->_suggestionClient;
}

- (void)setSuggestionClient:(id)a3
{
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
}

- (ATXHomeScreenWidgetIdentifiable)widgetIdentifiable
{
  return self->_widgetIdentifiable;
}

- (void)setWidgetIdentifiable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifiable, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_suggestionClient, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end