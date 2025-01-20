@interface MFFontMetricCache
+ (id)sharedFontMetricCache;
- (BOOL)ensureCacheIsValid;
- (MFFontMetricCache)init;
- (double)cachedFloat:(id)a3 forKey:(id)a4;
- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4;
- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5;
- (double)cachedScaledFloatWithValue:(double)a3 forKey:(id)a4;
- (id)cachedFont:(id)a3 forKey:(id)a4;
- (id)cachedImage:(id)a3 forKey:(id)a4;
- (id)cachedPreferredFontForStyle:(id)a3;
- (id)cachedPreferredFontForStyle:(id)a3 maximumContentSizeCategory:(id)a4;
- (id)metricCacheDictionary;
- (void)_didReceivePreferredFontChangedNotification:(id)a3;
- (void)_invalidateCache;
@end

@implementation MFFontMetricCache

void __42__MFFontMetricCache_sharedFontMetricCache__block_invoke()
{
  v0 = objc_alloc_init(MFFontMetricCache);
  v1 = (void *)sharedFontMetricCache_sharedFontMetricCache;
  sharedFontMetricCache_sharedFontMetricCache = (uint64_t)v0;
}

- (MFFontMetricCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)MFFontMetricCache;
  v2 = [(MFFontMetricCache *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v4 = [v3 preferredContentSizeCategory];
    preferredSizeValidationKey = v2->_preferredSizeValidationKey;
    v2->_preferredSizeValidationKey = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metricCacheDictionary = v2->_metricCacheDictionary;
    v2->_metricCacheDictionary = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bodyLeadingDictionary = v2->_bodyLeadingDictionary;
    v2->_bodyLeadingDictionary = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultBodyLeadingDictionary = v2->_defaultBodyLeadingDictionary;
    v2->_defaultBodyLeadingDictionary = v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel__didReceivePreferredFontChangedNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v2;
}

- (id)cachedPreferredFontForStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[MFFontMetricCache sharedFontMetricCache];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  id v8 = v5;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  v10 = objc_msgSend(v8, "stringByAppendingString:", v9, v13, 3221225472, __76__MFFontMetricCache_cachedPreferredFontForStyle_maximumContentSizeCategory___block_invoke, &unk_1E5F7AC68);
  v11 = [v7 cachedFont:&v13 forKey:v10];

  return v11;
}

+ (id)sharedFontMetricCache
{
  if (sharedFontMetricCache_onceToken != -1) {
    dispatch_once(&sharedFontMetricCache_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedFontMetricCache_sharedFontMetricCache;

  return v2;
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

uint64_t __76__MFFontMetricCache_cachedPreferredFontForStyle_maximumContentSizeCategory___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*(void *)(a1 + 32) maximumContentSizeCategory:*(void *)(a1 + 40)];
}

- (id)cachedPreferredFontForStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[MFFontMetricCache sharedFontMetricCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__MFFontMetricCache_cachedPreferredFontForStyle___block_invoke;
  v8[3] = &unk_1E5F7AC40;
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 cachedFont:v8 forKey:v5];

  return v6;
}

uint64_t __49__MFFontMetricCache_cachedPreferredFontForStyle___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*(void *)(a1 + 32)];
}

- (double)cachedScaledFloatWithValue:(double)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = +[MFFontMetricCache sharedFontMetricCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__MFFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke;
  v11[3] = &unk_1E5F7AC90;
  id v12 = v6;
  double v13 = a3;
  id v7 = v6;
  [v7 cachedFloat:v11 forKey:v5];
  double v9 = v8;

  return v9;
}

double __55__MFFontMetricCache_cachedScaledFloatWithValue_forKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cachedPreferredFontForStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:*(double *)(a1 + 40)];
  UIRoundToViewScale();
  double v4 = v3;

  return v4;
}

- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4
{
  id v5 = a4;
  id v6 = [(NSMutableDictionary *)self->_bodyLeadingDictionary objectForKey:v5];
  id v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
  }
  else
  {
    double v8 = [(MFFontMetricCache *)self cachedPreferredFontForStyle:v5];
    [v8 _bodyLeading];
    bodyLeadingDictionary = self->_bodyLeadingDictionary;
    v10 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)bodyLeadingDictionary setValue:v10 forKey:v5];
  }
  v11 = [(NSMutableDictionary *)self->_defaultBodyLeadingDictionary objectForKey:v5];

  if (v11)
  {
    [v11 doubleValue];
  }
  else
  {
    id v12 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:v5];
    [v12 _bodyLeading];
    defaultBodyLeadingDictionary = self->_defaultBodyLeadingDictionary;
    id v14 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)defaultBodyLeadingDictionary setValue:v14 forKey:v5];
  }
  UIRoundToViewScale();
  double v16 = v15;

  return v16;
}

- (double)cachedScaledFloatWithValue:(double)a3 fontStyle:(id)a4 maximumContentSizeCategory:(id)a5
{
  id v7 = a4;
  double v8 = [(MFFontMetricCache *)self cachedPreferredFontForStyle:v7 maximumContentSizeCategory:a5];
  [v8 _bodyLeading];
  double v9 = [(NSMutableDictionary *)self->_defaultBodyLeadingDictionary objectForKey:v7];
  v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
  }
  else
  {
    v11 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:v7];
    [v11 _bodyLeading];
    defaultBodyLeadingDictionary = self->_defaultBodyLeadingDictionary;
    double v13 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)defaultBodyLeadingDictionary setValue:v13 forKey:v7];
  }
  UIRoundToViewScale();
  double v15 = v14;

  return v15;
}

- (double)cachedFloat:(id)a3 forKey:(id)a4
{
  id v6 = (double (**)(void))a3;
  id v7 = a4;
  double v8 = [(NSMutableDictionary *)self->_metricCacheDictionary objectForKey:v7];
  if (!v8)
  {
    double v9 = NSNumber;
    double v10 = v6[2](v6);
    *(float *)&double v10 = v10;
    double v8 = [v9 numberWithFloat:v10];
    -[NSMutableDictionary setValue:forKey:](self->_metricCacheDictionary, "setValue:forKey:");
  }
  [v8 floatValue];
  double v12 = v11;

  return v12;
}

- (id)cachedImage:(id)a3 forKey:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  double v8 = [(NSMutableDictionary *)self->_metricCacheDictionary objectForKey:v7];
  if (!v8)
  {
    double v8 = v6[2](v6);
    [(NSMutableDictionary *)self->_metricCacheDictionary setObject:v8 forKey:v7];
  }

  return v8;
}

- (void)_invalidateCache
{
  [(NSMutableDictionary *)self->_metricCacheDictionary removeAllObjects];
  [(NSMutableDictionary *)self->_bodyLeadingDictionary removeAllObjects];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MFFontMetricCacheInvalidationNotification" object:self];
}

- (BOOL)ensureCacheIsValid
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];

  char v5 = [v4 isEqualToString:self->_preferredSizeValidationKey];
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredSizeValidationKey, v4);
    [(MFFontMetricCache *)self _invalidateCache];
  }

  return v5;
}

- (void)_didReceivePreferredFontChangedNotification:(id)a3
{
  id v7 = a3;
  double v4 = [v7 userInfo];
  char v5 = [v4 objectForKey:*MEMORY[0x1E4FB27E0]];
  preferredSizeValidationKey = self->_preferredSizeValidationKey;
  self->_preferredSizeValidationKey = v5;

  [(MFFontMetricCache *)self _invalidateCache];
}

- (id)metricCacheDictionary
{
  return self->_metricCacheDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBodyLeadingDictionary, 0);
  objc_storeStrong((id *)&self->_bodyLeadingDictionary, 0);
  objc_storeStrong((id *)&self->_metricCacheDictionary, 0);

  objc_storeStrong((id *)&self->_preferredSizeValidationKey, 0);
}

@end