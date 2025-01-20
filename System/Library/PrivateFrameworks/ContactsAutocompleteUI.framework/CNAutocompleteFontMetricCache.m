@interface CNAutocompleteFontMetricCache
+ (id)sharedFontMetricCache;
- (BOOL)ensureCacheIsValid;
- (CNAutocompleteFontMetricCache)init;
- (double)cachedFloat:(id)a3 forKey:(id)a4;
- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4;
- (double)cachedScaledFloatWithValue:(double)a3 forKey:(id)a4;
- (id)cachedFont:(id)a3 forKey:(id)a4;
- (id)cachedPreferredFontForStyle:(id)a3;
- (id)metricCacheDictionary;
- (void)_didReceivePreferredFontChangedNotification:(id)a3;
- (void)invalidateCache;
@end

@implementation CNAutocompleteFontMetricCache

+ (id)sharedFontMetricCache
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedFontMetricCache_sharedFontMetricCache)
  {
    v3 = objc_alloc_init(CNAutocompleteFontMetricCache);
    v4 = (void *)sharedFontMetricCache_sharedFontMetricCache;
    sharedFontMetricCache_sharedFontMetricCache = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedFontMetricCache_sharedFontMetricCache;

  return v5;
}

- (CNAutocompleteFontMetricCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteFontMetricCache;
  id v2 = [(CNAutocompleteFontMetricCache *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v4 = [v3 preferredContentSizeCategory];
    preferredSizeValidationKey = v2->_preferredSizeValidationKey;
    v2->_preferredSizeValidationKey = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metricCacheDictionary = v2->_metricCacheDictionary;
    v2->_metricCacheDictionary = v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__didReceivePreferredFontChangedNotification_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v2;
}

- (id)cachedPreferredFontForStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v3;
  v5 = NSString;
  id v6 = v3;
  v7 = [v5 stringWithFormat:@"preferredFont.%@", v6, v10, 3221225472, __61__CNAutocompleteFontMetricCache_cachedPreferredFontForStyle___block_invoke, &unk_1E6128D88];
  v8 = [v4 cachedFont:&v10 forKey:v7];

  return v8;
}

uint64_t __61__CNAutocompleteFontMetricCache_cachedPreferredFontForStyle___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*(void *)(a1 + 32)];
}

- (double)cachedScaledFloatWithValue:(double)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke;
  v11[3] = &unk_1E6128DB0;
  id v12 = v6;
  double v13 = a3;
  id v7 = v6;
  [v7 cachedFloat:v11 forKey:v5];
  double v9 = v8;

  return v9;
}

double __67__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreferredFontForStyle:*MEMORY[0x1E4F43870]];
  [v2 _scaledValueForValue:*(double *)(a1 + 40)];
  UIRoundToViewScale();
  double v4 = v3;

  return v4;
}

- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4
{
  id v5 = a4;
  id v6 = [NSString stringWithFormat:@"preferredFont.%@.float.%.1f", v5, *(void *)&a3];
  id v7 = +[CNAutocompleteFontMetricCache sharedFontMetricCache];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_fontStyle___block_invoke;
  v13[3] = &unk_1E6128DD8;
  id v14 = v7;
  id v15 = v5;
  double v16 = a3;
  id v8 = v5;
  id v9 = v7;
  [v9 cachedFloat:v13 forKey:v6];
  double v11 = v10;

  return v11;
}

double __70__CNAutocompleteFontMetricCache_cachedScaledFloatWithValue_fontStyle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreferredFontForStyle:*(void *)(a1 + 40)];
  [v2 _scaledValueForValue:*(double *)(a1 + 48)];
  UIRoundToViewScale();
  double v4 = v3;

  return v4;
}

- (id)cachedFont:(id)a3 forKey:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_metricCacheDictionary objectForKey:v7];
  if (!v8)
  {
    id v8 = v6[2](v6);
    [(NSMutableDictionary *)self->_metricCacheDictionary setObject:v8 forKey:v7];
  }

  return v8;
}

- (double)cachedFloat:(id)a3 forKey:(id)a4
{
  id v6 = (double (**)(void))a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_metricCacheDictionary objectForKey:v7];
  if (!v8)
  {
    id v9 = NSNumber;
    double v10 = v6[2](v6);
    *(float *)&double v10 = v10;
    id v8 = [v9 numberWithFloat:v10];
    [(NSMutableDictionary *)self->_metricCacheDictionary setValue:v8 forKey:v7];
  }
  [v8 floatValue];
  double v12 = v11;

  return v12;
}

- (void)invalidateCache
{
  [(NSMutableDictionary *)self->_metricCacheDictionary removeAllObjects];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CNComposeFontMetricCacheInvalidationNotification" object:self];
}

- (BOOL)ensureCacheIsValid
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];

  char v5 = [v4 isEqualToString:self->_preferredSizeValidationKey];
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredSizeValidationKey, v4);
    [(CNAutocompleteFontMetricCache *)self invalidateCache];
  }

  return v5;
}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
  double v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:*MEMORY[0x1E4F437C0]];
  preferredSizeValidationKey = self->_preferredSizeValidationKey;
  self->_preferredSizeValidationKey = v5;

  [(CNAutocompleteFontMetricCache *)self invalidateCache];
}

- (id)metricCacheDictionary
{
  return self->_metricCacheDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricCacheDictionary, 0);

  objc_storeStrong((id *)&self->_preferredSizeValidationKey, 0);
}

@end