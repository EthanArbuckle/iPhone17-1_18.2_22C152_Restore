@interface GEOFeaturesController
- (GEOFeaturesController)init;
- (GEOFeaturesControllerDelegate)delegate;
- (NSArray)features;
- (void)_initializeFeatures;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setFeatures:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation GEOFeaturesController

- (GEOFeaturesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOFeaturesController;
  v2 = [(GEOFeaturesController *)&v6 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F14428];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1E9114AD8, MEMORY[0x1E4F14428], v2);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, v3, v2);

    [(GEOFeaturesController *)v2 _initializeFeatures];
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  v3.receiver = self;
  v3.super_class = (Class)GEOFeaturesController;
  [(GEOFeaturesController *)&v3 dealloc];
}

- (void)_initializeFeatures
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  features = self->_features;
  self->_features = (NSArray *)MEMORY[0x1E4F1CBF0];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = _getValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1E9114AC8, 1, 0, 0, 0);
  objc_super v6 = [v5 objectForKey:@"clientFeatureFlags"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    p_super = GEOGetMapsFeatureFlagsAuthLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      __int16 v26 = 2112;
      v27 = @"clientFeatureFlags";
      _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "featuresInfo %@ retrieved from key %@ is not NSArray", buf, 0x16u);
    }
    goto LABEL_21;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  v17 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(NSObject **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = GEOGetMapsFeatureFlagsAuthLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "featureDetails %@ is not NSDictionary", buf, 0xCu);
        }
        goto LABEL_19;
      }
      v12 = [v11 objectForKey:@"name"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = GEOGetMapsFeatureFlagsAuthLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "featureName %@ is not NSString", buf, 0xCu);
        }

LABEL_19:
        v5 = v17;

        goto LABEL_20;
      }
      v13 = [[GEOFeatureInfo alloc] initWithName:v12];
      [v4 addObject:v13];
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    v5 = v17;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_20:

  v16 = (NSArray *)[v4 copy];
  p_super = &self->_features->super;
  self->_features = v16;
LABEL_21:
}

- (NSArray)features
{
  return self->_features;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  [(GEOFeaturesController *)self _initializeFeatures];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained featuresControllerDidReloadFeatureList:self];
}

- (void)setFeatures:(id)a3
{
}

- (GEOFeaturesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOFeaturesControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_features, 0);
}

@end