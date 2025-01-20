@interface _GEOConfigStorageRemote
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
@end

@implementation _GEOConfigStorageRemote

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = GEOConfig_stripEntitlement(v8);

  v11 = _getValue(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1E9114858, 1, 0, 0, 0);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v12 = [v11 objectForKeyedSubscript:@"ClientConfig"];
  id v32 = [v12 objectForKeyedSubscript:v10];

  v13 = v28;
  uint64_t v14 = v28[5];
  if (a6 && v14)
  {
    *a6 = 3;
    uint64_t v14 = v13[5];
  }
  if (!v14)
  {
    v15 = +[GEOExperimentConfiguration sharedConfiguration];
    uint64_t v16 = [v15 clientConfigurationValueForKey:v10];
    v17 = (void *)v28[5];
    v28[5] = v16;

    v18 = v28;
    uint64_t v19 = v28[5];
    if (a6 && v19)
    {
      *a6 = 3;
      uint64_t v19 = v18[5];
    }
    if (!v19)
    {
      v20 = +[GEONetworkDefaults sharedNetworkDefaults];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __75___GEOConfigStorageRemote_getConfigValueForKey_countryCode_options_source___block_invoke;
      v23[3] = &unk_1E53DB620;
      v26 = &v27;
      id v24 = v9;
      id v25 = v10;
      [v20 allKeysAndValues:v23];

      if (a6 && v28[5]) {
        *a6 = 4;
      }
    }
  }
  if (a6) {
    *a6 = 0;
  }
  id v21 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v21;
}

@end