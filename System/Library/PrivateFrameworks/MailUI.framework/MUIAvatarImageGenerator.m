@interface MUIAvatarImageGenerator
+ (id)log;
+ (id)stringForStyle:(int64_t)a3;
+ (void)roundAvatarView:(id)a3 withBorder:(BOOL)a4 size:(double)a5;
- (BOOL)_shouldShowCircleForSubtype:(unint64_t)a3;
- (CNAvatarImageRenderer)renderer;
- (EFLocked)senderStyleCache;
- (EFPromise)allowsGeneratePromise;
- (EFScheduler)avatarImageScheduler;
- (EFScheduler)businessAvatarScheduler;
- (MCCSecretAgentController)mccController;
- (MUIAvatarImageGenerator)init;
- (MUISenderHeaderColors)roundedRectPlaceholderImageColors;
- (NSCache)avatarCache;
- (NSCache)fallbackImageColorsCache;
- (UIImage)roundedRectPlaceholderImage;
- (id)_avatarCacheKeyForContext:(id)a3;
- (id)_businessAvatarImageForContext:(id)a3 handler:(id)a4;
- (id)_cachedStyleIfAvailableForContext:(id)a3;
- (id)_categoryForHighLevelDomain:(id)a3;
- (id)_contactForEmailAddress:(id)a3;
- (id)_emailAddressDomainOrStringValueForAddress:(id)a3;
- (id)_generateAvatarImageForContext:(id)a3 handler:(id)a4;
- (id)_placeholderCacheEntryForStyle:(int64_t)a3;
- (id)avatarImageForContext:(id)a3 handler:(id)a4;
- (int64_t)_avatarStyleForContext:(id)a3;
- (int64_t)_avatarStyleIfAvailableForContext:(id)a3;
- (int64_t)_merchantCategoryForIABCategory:(int64_t)a3;
- (void)_bimiAvatarImageForFuture:(id)a3 handler:(id)a4;
- (void)_businessLogoForID:(id)a3 handler:(id)a4;
- (void)_configureBusinessQueryService;
- (void)_fallbackAvatarImageForContext:(id)a3 handler:(id)a4;
- (void)_generateContactsForContext:(id)a3 handler:(id)a4;
- (void)_invalidateAvatarCache;
- (void)allowGeneratingAvatarImages;
- (void)setAvatarCache:(id)a3;
- (void)setFallbackImageColorsCache:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setSenderStyleCache:(id)a3;
@end

@implementation MUIAvatarImageGenerator

- (id)_categoryForHighLevelDomain:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v5 = [(MUIAvatarImageGenerator *)self mccController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__MUIAvatarImageGenerator__categoryForHighLevelDomain___block_invoke;
  v10[3] = &unk_1E6D12A30;
  id v6 = v4;
  id v11 = v6;
  v12 = &v18;
  v13 = &v14;
  [v5 getIABCategoryID:v6 completion:v10];

  if (!*((unsigned char *)v19 + 24))
  {
    v7 = +[MUIAvatarImageGenerator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[MUIAvatarImageGenerator _categoryForHighLevelDomain:](v7);
    }
  }
  if (v15[3] < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[MUIAvatarImageGenerator _merchantCategoryForIABCategory:](self, "_merchantCategoryForIABCategory:"));
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (int64_t)_merchantCategoryForIABCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 0x3C)
  {
    if (a3 == 12) {
      return 1;
    }
    else {
      return 5;
    }
  }
  if ((unint64_t)(a3 - 63) < 0x16) {
    return 7;
  }
  if ((unint64_t)(a3 - 85) < 0x14) {
    return 4;
  }
  if ((unint64_t)(a3 - 105) < 7) {
    return 2;
  }
  if ((unint64_t)(a3 - 112) < 0x36) {
    return 0;
  }
  if ((unint64_t)(a3 - 166) < 0x24) {
    return 4;
  }
  if ((unint64_t)(a3 - 202) <= 0x12)
  {
    BOOL v4 = a3 == 216;
    int64_t v5 = 6;
    goto LABEL_16;
  }
  if ((unint64_t)(a3 - 221) < 0x16) {
    return 1;
  }
  if ((unint64_t)(a3 - 243) < 0x1E) {
    return 5;
  }
  if ((unint64_t)(a3 - 273) < 0x33) {
    return 6;
  }
  if ((unint64_t)(a3 - 324) < 0x12) {
    return 5;
  }
  if ((unint64_t)(a3 - 342) < 0x24) {
    return 4;
  }
  if ((unint64_t)(a3 - 378) < 0x2B) {
    return 0;
  }
  if ((unint64_t)(a3 - 421) < 0x2E) {
    return 5;
  }
  if ((unint64_t)(a3 - 467) < 0x16) {
    return 4;
  }
  if ((unint64_t)(a3 - 489) < 0x26) {
    return 0;
  }
  if ((unint64_t)(a3 - 527) < 0x26) {
    return 2;
  }
  if ((unint64_t)(a3 - 565) < 0x29) {
    return 5;
  }
  if ((unint64_t)(a3 - 606) > 0xE)
  {
    BOOL v4 = a3 == 623;
    int64_t v5 = 3;
LABEL_16:
    if (v4) {
      return v5;
    }
    else {
      return 0;
    }
  }
  if (a3 == 610) {
    return 7;
  }
  else {
    return 3;
  }
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MUIAvatarImageGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  v2 = (void *)log_log_5;
  return v2;
}

- (EFLocked)senderStyleCache
{
  return self->_senderStyleCache;
}

+ (id)stringForStyle:(int64_t)a3
{
  if (a3) {
    return @"rounded rect";
  }
  else {
    return @"circle";
  }
}

- (EFScheduler)avatarImageScheduler
{
  return self->_avatarImageScheduler;
}

- (EFScheduler)businessAvatarScheduler
{
  return self->_businessAvatarScheduler;
}

- (NSCache)fallbackImageColorsCache
{
  return self->_fallbackImageColorsCache;
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (MUIAvatarImageGenerator)init
{
  v25.receiver = self;
  v25.super_class = (Class)MUIAvatarImageGenerator;
  v2 = [(MUIAvatarImageGenerator *)&v25 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mailui.avatarImage" qualityOfService:25];
    avatarImageScheduler = v2->_avatarImageScheduler;
    v2->_avatarImageScheduler = (EFScheduler *)v3;

    uint64_t v5 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mailui.businessavatar" qualityOfService:25];
    businessAvatarScheduler = v2->_businessAvatarScheduler;
    v2->_businessAvatarScheduler = (EFScheduler *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = [v7 initWithObject:v8];
    senderStyleCache = v2->_senderStyleCache;
    v2->_senderStyleCache = (EFLocked *)v9;

    id v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    avatarCache = v2->_avatarCache;
    v2->_avatarCache = v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    fallbackImageColorsCache = v2->_fallbackImageColorsCache;
    v2->_fallbackImageColorsCache = v13;

    uint64_t v15 = [MEMORY[0x1E4F60E18] promise];
    allowsGeneratePromise = v2->_allowsGeneratePromise;
    v2->_allowsGeneratePromise = (EFPromise *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F1BB20]);
    uint64_t v18 = [MEMORY[0x1E4F1BB28] defaultSettings];
    uint64_t v19 = [v17 initWithSettings:v18];
    renderer = v2->_renderer;
    v2->_renderer = (CNAvatarImageRenderer *)v19;

    char v21 = (MCCSecretAgentController *)objc_alloc_init(getMCCSecretAgentControllerClass());
    mccController = v2->_mccController;
    v2->_mccController = v21;

    [(MUIAvatarImageGenerator *)v2 _configureBusinessQueryService];
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v2 selector:sel__invalidateAvatarCache name:*MEMORY[0x1E4F1AF80] object:0];
  }
  return v2;
}

void __30__MUIAvatarImageGenerator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

+ (void)roundAvatarView:(id)a3 withBorder:(BOOL)a4 size:(double)a5
{
  BOOL v6 = a4;
  id v20 = a3;
  objc_msgSend(v20, "mui_currentScreenScale");
  double v8 = fmax(v7, 1.0);
  uint64_t v9 = [v20 layer];
  [v9 setCornerRadius:round(a5 * 0.2 * v8) / v8];

  uint64_t v10 = *MEMORY[0x1E4F39EA8];
  id v11 = [v20 layer];
  [v11 setCornerCurve:v10];

  v12 = [v20 layer];
  [v12 setMasksToBounds:1];

  if (v6)
  {
    id v13 = [MEMORY[0x1E4FB1618] mailBrandAvatarBorderColor];
    uint64_t v14 = [v13 CGColor];
    uint64_t v15 = [v20 layer];
    [v15 setBorderColor:v14];

    uint64_t v16 = [v20 layer];
    id v17 = v16;
    double v18 = 1.0 / v8;
  }
  else
  {
    uint64_t v19 = [v20 layer];
    [v19 setBorderColor:0];

    uint64_t v16 = [v20 layer];
    id v17 = v16;
    double v18 = 0.0;
  }
  [v16 setBorderWidth:v18];
}

- (void)allowGeneratingAvatarImages
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[MUIAvatarImageGenerator log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DDCDB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v6 = [(MUIAvatarImageGenerator *)self allowsGeneratePromise];
  double v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 finishWithResult:v7];
}

- (id)avatarImageForContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  uint64_t v9 = [(MUIAvatarImageGenerator *)self _avatarCacheKeyForContext:v6];
  uint64_t v10 = [(MUIAvatarImageGenerator *)self avatarCache];
  id v11 = [v10 objectForKey:v9];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __57__MUIAvatarImageGenerator_avatarImageForContext_handler___block_invoke;
  v23 = &unk_1E6D12880;
  id v12 = v11;
  id v24 = v12;
  id v13 = v7;
  id v25 = v13;
  uint64_t v14 = (void (**)(void *, id, void *))_Block_copy(&v20);
  if (v12)
  {
    uint64_t v15 = -[MUIAvatarImageGenerator _cachedStyleIfAvailableForContext:](self, "_cachedStyleIfAvailableForContext:", v6, v20, v21, v22, v23, v24);
    v14[2](v14, v12, v15);
    id v16 = v8;
  }
  else
  {
    int64_t v17 = -[MUIAvatarImageGenerator _avatarStyleIfAvailableForContext:](self, "_avatarStyleIfAvailableForContext:", v6, v20, v21, v22, v23, v24);
    id v12 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:v17];
    double v18 = [NSNumber numberWithInteger:v17];
    v14[2](v14, v12, v18);

    id v16 = [(MUIAvatarImageGenerator *)self _generateAvatarImageForContext:v6 handler:v13];
  }

  return v16;
}

void __57__MUIAvatarImageGenerator_avatarImageForContext_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "setAvatarStyle:", objc_msgSend(a3, "integerValue"));
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MUIAvatarImageGenerator_avatarImageForContext_handler___block_invoke_2;
  v10[3] = &unk_1E6D12858;
  id v6 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  id v7 = (void *)MEMORY[0x1E4F60F28];
  id v8 = v5;
  uint64_t v9 = objc_msgSend(v7, "mainThreadScheduler", v10[0], 3221225472, __57__MUIAvatarImageGenerator_avatarImageForContext_handler___block_invoke_2, &unk_1E6D12858);
  [v9 performBlock:v10];
}

uint64_t __57__MUIAvatarImageGenerator_avatarImageForContext_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)_generateAvatarImageForContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  uint64_t v9 = [v6 category];
  uint64_t v10 = [v6 emailAddress];
  if (v10 && v9)
  {
    id v11 = [(MUIAvatarImageGenerator *)self allowsGeneratePromise];
    id v12 = [v11 future];
    id v13 = [(MUIAvatarImageGenerator *)self avatarImageScheduler];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__MUIAvatarImageGenerator__generateAvatarImageForContext_handler___block_invoke;
    v22[3] = &unk_1E6D128A8;
    v22[4] = self;
    id v23 = v6;
    id v24 = v10;
    id v25 = v9;
    id v27 = v7;
    id v14 = v8;
    id v26 = v14;
    [v12 onScheduler:v13 addSuccessBlock:v22];

    id v15 = v14;
  }
  else
  {
    id v16 = +[MUIAvatarImageGenerator log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[MUIAvatarImageGenerator _generateAvatarImageForContext:handler:](v10, v9, v16);
    }

    if (v10) {
      int64_t v17 = @"Missing category";
    }
    else {
      int64_t v17 = @"Missing email address";
    }
    double v18 = objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", v17);
    uint64_t v19 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:0];
    (*((void (**)(id, void *, void *))v7 + 2))(v7, v19, v18);
    id v20 = v8;
  }
  return v8;
}

void __66__MUIAvatarImageGenerator__generateAvatarImageForContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(a1 + 32) _avatarStyleForContext:*(void *)(a1 + 40)];
  id v3 = +[MUIAvatarImageGenerator log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(id *)(a1 + 48);
    id v5 = [v4 emailAddressValue];
    id v6 = v5;
    if (v5)
    {
      id v7 = objc_msgSend(v5, "ef_publicDescription");
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F60E00];
      uint64_t v9 = [v4 stringValue];
      id v7 = [v8 fullyOrPartiallyRedactedStringForString:v9];

      id v4 = (id)v9;
    }

    uint64_t v10 = objc_msgSend(*(id *)(a1 + 56), "ef_publicDescription");
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "Generating avatar for address %{public}@ category %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (v2 == (void *)1)
  {
    v2 = [*(id *)(a1 + 32) _businessAvatarImageForContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 72)];
  }
  else if (v2)
  {
    v2 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) _generateContactsForContext:*(void *)(a1 + 40) handler:*(void *)(a1 + 72)];
  }
  [*(id *)(a1 + 64) addCancelable:v2];
}

- (id)_cachedStyleIfAvailableForContext:(id)a3
{
  id v4 = a3;
  id v5 = [(MUIAvatarImageGenerator *)self _avatarCacheKeyForContext:v4];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  int64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v6 = [(MUIAvatarImageGenerator *)self senderStyleCache];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__MUIAvatarImageGenerator__cachedStyleIfAvailableForContext___block_invoke;
  v10[3] = &unk_1E6D11AC0;
  id v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 performWhileLocked:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __61__MUIAvatarImageGenerator__cachedStyleIfAvailableForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (int64_t)_avatarStyleIfAvailableForContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MUIAvatarImageGenerator *)self _cachedStyleIfAvailableForContext:v4];
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 integerValue];
    id v8 = +[MUIAvatarImageGenerator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = +[MUIAvatarImageGenerator stringForStyle:v7];
      uint64_t v10 = objc_msgSend(v4, "ef_publicDescription");
      int v23 = 138412546;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_impl(&dword_1DDCDB000, v8, OS_LOG_TYPE_INFO, "Found cached style %@ for context: %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    id v11 = [v4 businessLogoID];

    id v12 = [v4 brandIndicatorFuture];
    if (v12)
    {
      uint64_t v13 = [v4 brandIndicatorFuture];
      id v14 = [v13 resultIfAvailable];
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      BOOL v16 = v14 != v15;
    }
    else
    {
      BOOL v16 = 0;
    }

    int64_t v17 = [v4 category];
    uint64_t v18 = [v17 subtype];

    BOOL v19 = [(MUIAvatarImageGenerator *)self _shouldShowCircleForSubtype:v18];
    if (v11) {
      int v20 = 1;
    }
    else {
      int v20 = v16;
    }
    if (v18) {
      char v21 = v19;
    }
    else {
      char v21 = 1;
    }
    if (v20 == 1 || (v21 & 1) == 0) {
      int64_t v7 = v20 | !v19;
    }
    else {
      int64_t v7 = 0;
    }
  }

  return v7;
}

- (int64_t)_avatarStyleForContext:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35 = self;
  int64_t v5 = [(MUIAvatarImageGenerator *)self _avatarStyleIfAvailableForContext:v4];
  unsigned int v6 = v5 == 1;
  int64_t v7 = [v4 category];
  id v8 = [v4 emailAddress];
  uint64_t v9 = [v4 contactStore];
  int v10 = [v9 contactExistsForEmailAddress:v8];

  int v34 = v10;
  if (v10)
  {
    int64_t v11 = 0;
  }
  else
  {
    if (v5 == 1)
    {
      unsigned int v6 = 1;
    }
    else
    {
      uint64_t v12 = [v7 subtype];
      uint64_t v13 = [v8 emailAddressValue];
      id v14 = [v13 highLevelDomain];
      uint64_t v15 = [(MUIAvatarImageGenerator *)v35 _categoryForHighLevelDomain:v14];

      LODWORD(v12) = [(MUIAvatarImageGenerator *)v35 _shouldShowCircleForSubtype:v12];
      unsigned int v6 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F60CE8] + 16))() & (v12 ^ 1);
    }
    int64_t v11 = v6;
  }
  if ([v7 isUncategorized]) {
    int v16 = 0;
  }
  else {
    int v16 = [v7 needsRecategorization] ^ 1;
  }
  int64_t v17 = +[MUIAvatarImageGenerator log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int64_t v32 = v11;
    v31 = +[MUIAvatarImageGenerator stringForStyle:v11];
    v33 = v8;
    id v18 = v8;
    BOOL v19 = [v18 emailAddressValue];
    int v20 = v19;
    if (v19)
    {
      char v21 = objc_msgSend(v19, "ef_publicDescription");
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F60E00];
      int v23 = [v18 stringValue];
      char v21 = [v22 fullyOrPartiallyRedactedStringForString:v23];
    }
    [v7 type];
    id v24 = EMStringFromCategoryType();
    [v7 subtype];
    __int16 v25 = EMStringFromSubtype();
    if (v5 == 1) {
      unsigned int v6 = 0;
    }
    id v26 = [v4 businessLogoID];
    *(_DWORD *)buf = 138414082;
    v40 = v31;
    __int16 v41 = 2114;
    v42 = v21;
    __int16 v43 = 2112;
    v44 = v24;
    __int16 v45 = 2112;
    v46 = v25;
    __int16 v47 = 1024;
    unsigned int v48 = v6;
    __int16 v49 = 1024;
    int v50 = v16;
    __int16 v51 = 1024;
    int v52 = v34;
    __int16 v53 = 2112;
    v54 = v26;
    _os_log_impl(&dword_1DDCDB000, v17, OS_LOG_TYPE_INFO, "Avatar style %@ for address %{public}@ category %@ subcategory %@ walletCategoryAvailable %d shouldCache %{BOOL}d contactExists %{BOOL}d businessLogoID %@", buf, 0x46u);

    int64_t v11 = v32;
    id v8 = v33;
  }

  if (v16)
  {
    uint64_t v27 = [(MUIAvatarImageGenerator *)v35 _avatarCacheKeyForContext:v4];
    v28 = [(MUIAvatarImageGenerator *)v35 senderStyleCache];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__MUIAvatarImageGenerator__avatarStyleForContext___block_invoke;
    v36[3] = &unk_1E6D128D0;
    id v37 = v27;
    int64_t v38 = v11;
    id v29 = v27;
    [v28 performWhileLocked:v36];
  }
  return v11;
}

void __50__MUIAvatarImageGenerator__avatarStyleForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 numberWithInteger:v4];
  [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (BOOL)_shouldShowCircleForSubtype:(unint64_t)a3
{
  return a3 == 1 || a3 - 7 < 2;
}

- (void)_invalidateAvatarCache
{
  uint64_t v3 = +[MUIAvatarImageGenerator log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DDCDB000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating avatar cache", v6, 2u);
  }

  uint64_t v4 = [(MUIAvatarImageGenerator *)self avatarCache];
  [v4 removeAllObjects];

  id v5 = [(MUIAvatarImageGenerator *)self senderStyleCache];
  [v5 performWhileLocked:&__block_literal_global_13];
}

uint64_t __49__MUIAvatarImageGenerator__invalidateAvatarCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (id)_businessAvatarImageForContext:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  uint64_t v9 = [(MUIAvatarImageGenerator *)self _avatarCacheKeyForContext:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke;
  aBlock[3] = &unk_1E6D12940;
  aBlock[4] = self;
  id v10 = v9;
  id v37 = v10;
  id v11 = v7;
  id v38 = v11;
  uint64_t v12 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v13 = [(MUIAvatarImageGenerator *)self avatarCache];
  id v14 = [v13 objectForKey:v10];

  if (v14)
  {
    v12[2](v12, v14, 0);
    id v15 = v8;
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_3;
    v31[3] = &unk_1E6D12990;
    id v16 = v6;
    id v32 = v16;
    int64_t v17 = v12;
    id v35 = v17;
    id v18 = v8;
    id v33 = v18;
    int v34 = self;
    id v25 = v6;
    BOOL v19 = _Block_copy(v31);
    [(MUIAvatarImageGenerator *)self businessAvatarScheduler];
    int v20 = v24 = v11;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_5;
    v26[3] = &unk_1E6D129B8;
    id v27 = v16;
    v28 = self;
    id v29 = v19;
    v30 = v17;
    id v21 = v19;
    [v20 performBlock:v26];

    id v11 = v24;
    id v22 = v18;

    id v6 = v25;
  }

  return v8;
}

void __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [*(id *)(a1 + 32) avatarCache];
    [v8 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  [v5 setAvatarStyle:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_2;
  v15[3] = &unk_1E6D12918;
  id v9 = *(id *)(a1 + 48);
  id v17 = v7;
  id v18 = v9;
  id v16 = v5;
  id v10 = v15;
  id v11 = (void *)MEMORY[0x1E4F60F28];
  id v12 = v7;
  id v13 = v5;
  id v14 = [v11 mainThreadScheduler];
  [v14 performBlock:v10];
}

uint64_t __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MUIAvatarImageGeneratorResult alloc];
    id v5 = [a1[4] emailAddress];
    id v6 = [(MUIAvatarImageGeneratorResult *)v4 initWithAddress:v5 image:v3 style:1 type:3];

    id v7 = (void (**)(id, MUIAvatarImageGeneratorResult *, void *))a1[7];
    if ([a1[5] isCanceled])
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
      v7[2](v7, v6, v8);
    }
    else
    {
      v7[2](v7, v6, 0);
    }
  }
  else if ([a1[5] isCanceled])
  {
    id v9 = (void (**)(id, void *, void *))a1[7];
    id v10 = [a1[6] _placeholderCacheEntryForStyle:1];
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
    v9[2](v9, v10, v11);
  }
  else
  {
    id v12 = a1[4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_4;
    v14[3] = &unk_1E6D12968;
    id v13 = a1[6];
    id v15 = a1[7];
    [v13 _fallbackAvatarImageForContext:v12 handler:v14];
  }
}

uint64_t __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_5(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isAuthenticated])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_7;
    v11[3] = &unk_1E6D12968;
    id v12 = *(id *)(a1 + 56);
    [v4 _fallbackAvatarImageForContext:v5 handler:v11];
    id v6 = v12;
    goto LABEL_5;
  }
  v2 = [*(id *)(a1 + 32) businessLogoID];

  if (!v2)
  {
    id v7 = [*(id *)(a1 + 32) brandIndicatorFuture];

    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    if (v7)
    {
      id v10 = [*(id *)(a1 + 32) brandIndicatorFuture];
      [v8 _bimiAvatarImageForFuture:v10 handler:*(void *)(a1 + 48)];
      goto LABEL_8;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_6;
    v13[3] = &unk_1E6D12968;
    id v14 = *(id *)(a1 + 56);
    [v8 _fallbackAvatarImageForContext:v9 handler:v13];
    id v6 = v14;
LABEL_5:

    return;
  }
  id v3 = *(void **)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) businessLogoID];
  [v3 _businessLogoForID:v10 handler:*(void *)(a1 + 48)];
LABEL_8:
}

uint64_t __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__MUIAvatarImageGenerator__businessAvatarImageForContext_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_bimiAvatarImageForFuture:(id)a3 handler:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke;
  v11[3] = &unk_1E6D129E0;
  id v6 = v5;
  id v12 = v6;
  id v7 = a3;
  [v7 addSuccessBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke_2;
  v9[3] = &unk_1E6D12A08;
  id v10 = v6;
  id v8 = v6;
  [v7 addFailureBlock:v9];
}

void __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && (isKindOfClass & 1) != 0)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] imageWithData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MUIAvatarImageGenerator log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke_2_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_avatarCacheKeyForContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = NSString;
  id v5 = [v3 emailAddress];
  id v6 = [v5 emailAddressValue];
  id v7 = [v6 displayName];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 stringValue];
  }
  id v10 = v9;

  id v11 = [v3 emailAddress];
  id v12 = [v11 emailAddressValue];
  id v13 = [v12 simpleAddress];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [v11 stringValue];
  }
  id v16 = v15;

  id v17 = [v4 stringWithFormat:@"dn:%@_sa:%@_%d", v10, v16, objc_msgSend(v3, "isAuthenticated")];

  id v18 = [v3 businessLogoID];

  if (v18)
  {
    BOOL v19 = NSString;
    int v20 = [v3 businessLogoID];
    uint64_t v21 = [v19 stringWithFormat:@"%@_b:%@", v17, v20];

    id v17 = (void *)v21;
  }

  return v17;
}

- (id)_emailAddressDomainOrStringValueForAddress:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 emailAddressValue];
  id v5 = [v4 highLevelDomain];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 stringValue];
  }
  id v8 = v7;

  return v8;
}

- (void)_fallbackAvatarImageForContext:(id)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [v6 emailAddress];
  id v9 = [v8 emailAddressValue];
  id v10 = [v9 highLevelDomain];
  id v11 = [(MUIAvatarImageGenerator *)self _categoryForHighLevelDomain:v10];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = [NSNumber numberWithInteger:0];
  }
  id v13 = v12;
  id v14 = [(NSCache *)self->_fallbackImageColorsCache objectForKey:v12];
  if (!v14)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CE8] + 16))())
    {
      uint64_t v15 = [v11 unsignedIntegerValue];
      id v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v16 scale];
      id v18 = softLinkPKIconForMerchantCategory(v15, 0, 0, 45.0, 45.0, v17);

      BOOL v19 = [MUIAvatarImageGeneratorResult alloc];
      int v20 = [v6 emailAddress];
      uint64_t v21 = [(MUIAvatarImageGeneratorResult *)v19 initWithAddress:v20 image:v18 style:1 type:2];

      if (!v13) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v21 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:1];
      if (!v13) {
        goto LABEL_12;
      }
    }
    if (v21)
    {
      id v22 = [(MUIAvatarImageGenerator *)self fallbackImageColorsCache];
      [v22 setObject:v21 forKey:v13];
LABEL_14:

      v7[2](v7, v21);
      goto LABEL_15;
    }
LABEL_12:
    id v22 = +[MUIAvatarImageGenerator log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = objc_msgSend(v6, "ef_publicDescription");
      int v24 = 138412802;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2114;
      id v29 = v23;
      _os_log_error_impl(&dword_1DDCDB000, v22, OS_LOG_TYPE_ERROR, "Attempted to add cacheKey %@ entry %@ for context %{public}@", (uint8_t *)&v24, 0x20u);
    }
    goto LABEL_14;
  }
  v7[2](v7, v14);
LABEL_15:
}

void __55__MUIAvatarImageGenerator__categoryForHighLevelDomain___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[MUIAvatarImageGenerator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__MUIAvatarImageGenerator__categoryForHighLevelDomain___block_invoke_cold_1(a1, v5, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
}

- (id)_placeholderCacheEntryForStyle:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_10;
    }
    id v5 = [(MUIAvatarImageGenerator *)self avatarCache];
    id v6 = [v5 objectForKey:@"rounded rect"];

    if (!v6)
    {
      id v7 = (void *)MEMORY[0x1E4FB1818];
      id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = [v7 imageNamed:@"AvatarPlaceholderRect" inBundle:v8];

      id v10 = -[MUIAvatarImageGeneratorResult initWithAddress:image:style:type:]([MUIAvatarImageGeneratorResult alloc], "initWithAddress:image:style:type:", @"x-apple-rounded-rectangle-placeholder:;",
              v9,
              1,
              1);
      id v11 = [(MUIAvatarImageGenerator *)self avatarCache];
      [v11 setObject:v10 forKey:@"rounded rect"];
    }
    id v12 = [(MUIAvatarImageGenerator *)self avatarCache];
    id v13 = v12;
    id v14 = @"rounded rect";
  }
  else
  {
    uint64_t v15 = [(MUIAvatarImageGenerator *)self avatarCache];
    id v16 = [v15 objectForKey:@"circle"];

    if (!v16)
    {
      double v17 = [(MUIAvatarImageGenerator *)self renderer];
      id v18 = [v17 loadingPlaceholderImageProvider];
      BOOL v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v19 scale];
      uint64_t v21 = objc_msgSend(v18, "imageForSize:scale:style:", 0, 45.0, 45.0, v20);

      id v22 = -[MUIAvatarImageGeneratorResult initWithAddress:image:style:type:]([MUIAvatarImageGeneratorResult alloc], "initWithAddress:image:style:type:", @"x-apple-circle-placeholder:;",
              v21,
              0,
              1);
      int v23 = [(MUIAvatarImageGenerator *)self avatarCache];
      [v23 setObject:v22 forKey:@"circle"];
    }
    id v12 = [(MUIAvatarImageGenerator *)self avatarCache];
    id v13 = v12;
    id v14 = @"circle";
  }
  id v3 = [v12 objectForKey:v14];

LABEL_10:
  return v3;
}

- (UIImage)roundedRectPlaceholderImage
{
  v2 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:1];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (MUISenderHeaderColors)roundedRectPlaceholderImageColors
{
  v2 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:1];
  id v3 = [v2 headerColors];

  return (MUISenderHeaderColors *)v3;
}

- (id)_contactForEmailAddress:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1B8F8];
  id v4 = a3;
  id v5 = [v4 displayName];
  id v6 = objc_msgSend(v5, "ec_personNameComponents");
  id v7 = [v4 simpleAddress];

  id v8 = objc_msgSend(v3, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v6, v7, 0, 1);

  return v8;
}

- (void)_generateContactsForContext:(id)a3 handler:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 emailAddress];
  id v9 = [v8 emailAddressValue];

  id v10 = [(MUIAvatarImageGenerator *)self _avatarCacheKeyForContext:v6];
  id v11 = +[MUIAvatarImageGenerator log];
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v9;
      id v14 = [v13 emailAddressValue];
      uint64_t v15 = v14;
      if (v14)
      {
        id v16 = objc_msgSend(v14, "ef_publicDescription");
      }
      else
      {
        int v23 = (void *)MEMORY[0x1E4F60E00];
        int v24 = [v13 stringValue];
        id v16 = [v23 fullyOrPartiallyRedactedStringForString:v24];
      }
      *(_DWORD *)buf = 138543362;
      __int16 v47 = v16;
      _os_log_impl(&dword_1DDCDB000, v12, OS_LOG_TYPE_DEFAULT, "Generating contact for email address %{public}@", buf, 0xCu);
    }
    id v20 = [(MUIAvatarImageGenerator *)self _contactForEmailAddress:v9];
    BOOL v25 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
    __int16 v26 = (void *)MEMORY[0x1E4F1BB30];
    id v27 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v27 scale];
    objc_msgSend(v26, "scopeWithPointSize:scale:rightToLeft:style:", v25, 0, 45.0, 45.0, v28);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    id v29 = [(MUIAvatarImageGenerator *)self renderer];
    id v45 = v20;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    id v22 = [v29 avatarImageForContacts:v30 scope:v19];

    v31 = [MUIAvatarImageGeneratorResult alloc];
    id v32 = [v6 emailAddress];
    id v33 = [(MUIAvatarImageGeneratorResult *)v31 initWithAddress:v32 image:v22 style:0 type:3];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __63__MUIAvatarImageGenerator__generateContactsForContext_handler___block_invoke_212;
    v38[3] = &unk_1E6D12A58;
    v38[4] = self;
    v39 = v33;
    id v40 = v10;
    id v41 = v7;
    int v34 = (void *)MEMORY[0x1E4F60F28];
    id v35 = v33;
    id v36 = v7;
    id v37 = [v34 mainThreadScheduler];
    [v37 performSyncBlock:v38];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MUIAvatarImageGenerator _generateContactsForContext:handler:]();
    }

    double v17 = [(MUIAvatarImageGenerator *)self _placeholderCacheEntryForStyle:0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __63__MUIAvatarImageGenerator__generateContactsForContext_handler___block_invoke;
    v42[3] = &unk_1E6D12858;
    id v43 = v17;
    id v44 = v7;
    id v18 = (void *)MEMORY[0x1E4F60F28];
    id v19 = v17;
    id v20 = v7;
    uint64_t v21 = [v18 mainThreadScheduler];
    [v21 performSyncBlock:v42];

    id v22 = v44;
  }
}

void __63__MUIAvatarImageGenerator__generateContactsForContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
}

uint64_t __63__MUIAvatarImageGenerator__generateContactsForContext_handler___block_invoke_212(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) avatarCache];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (void)setRenderer:(id)a3
{
}

- (EFPromise)allowsGeneratePromise
{
  return self->_allowsGeneratePromise;
}

- (MCCSecretAgentController)mccController
{
  return self->_mccController;
}

- (void)setSenderStyleCache:(id)a3
{
}

- (NSCache)avatarCache
{
  return self->_avatarCache;
}

- (void)setAvatarCache:(id)a3
{
}

- (void)setFallbackImageColorsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackImageColorsCache, 0);
  objc_storeStrong((id *)&self->_avatarCache, 0);
  objc_storeStrong((id *)&self->_senderStyleCache, 0);
  objc_storeStrong((id *)&self->_mccController, 0);
  objc_storeStrong((id *)&self->_allowsGeneratePromise, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_businessAvatarScheduler, 0);
  objc_storeStrong((id *)&self->_avatarImageScheduler, 0);
}

- (void)_configureBusinessQueryService
{
  swift_getObjectType();
  id v3 = self;
  MUIAvatarImageGenerator.configureBusinessQueryService()();
}

- (void)_businessLogoForID:(id)a3 handler:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  id v9 = _Block_copy(a4);
  id v6 = self;
  uint64_t v10 = sub_1DDEEEB78();
  uint64_t v12 = v7;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  MUIAvatarImageGenerator.businessLogo(for:handler:)(v10, v12, (uint64_t)sub_1DDE32C10, v11);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)_generateAvatarImageForContext:(NSObject *)a3 handler:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [v5 emailAddressValue];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v10 = objc_msgSend(v6, "ef_publicDescription");
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F60E00];
    id v9 = [v5 stringValue];
    uint64_t v10 = [v8 fullyOrPartiallyRedactedStringForString:v9];
  }
  uint64_t v11 = objc_msgSend(a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_FAULT, "Unable to generate avatar image for missing emailAddress %{public}@ category %{public}@", v12, 0x16u);
}

void __61__MUIAvatarImageGenerator__bimiAvatarImageForFuture_handler___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ef_publicDescription");
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "Failed to BIMI logo: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_categoryForHighLevelDomain:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_FAULT, "getIABCategoryID:completion: is expected to be synchronous but was not executed synchronously", v1, 2u);
}

void __55__MUIAvatarImageGenerator__categoryForHighLevelDomain___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:*(void *)(a1 + 32)];
  uint64_t v6 = objc_msgSend(a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch category for domain %{public}@ %{public}@", v7, 0x16u);
}

- (void)_generateContactsForContext:handler:.cold.1()
{
  v0 = [0 emailAddressValue];
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v4 = objc_msgSend(v0, "ef_publicDescription");
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F60E00];
    uint64_t v3 = [0 stringValue];
    uint64_t v4 = [v2 fullyOrPartiallyRedactedStringForString:v3];
  }
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v5, v6, "Could not load avatar for email address: %{public}@", v7, v8, v9, v10, 2u);
}

@end