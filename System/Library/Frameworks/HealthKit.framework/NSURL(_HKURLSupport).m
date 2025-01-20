@interface NSURL(_HKURLSupport)
+ (id)_hk_appendQueryParameterToURL:()_HKURLSupport forHKProfileIdentifier:;
+ (id)_hk_urlForAtrialFibrillationEventType;
+ (id)_hk_urlForBloodPressureType;
+ (id)_hk_urlForElectrocardiogramType;
+ (id)_hk_urlForHKProfileIdentifier:()_HKURLSupport;
+ (id)_hk_urlForHealthRecordsProviderSearch;
+ (id)_hk_urlForViewHealthRecords;
- (id)_hk_extractEncodedHKProfileIdentifier;
- (void)_hk_extractEncodedHKProfileIdentifier;
@end

@implementation NSURL(_HKURLSupport)

+ (id)_hk_urlForViewHealthRecords
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v0 setScheme:@"x-apple-health"];
  [v0 setHost:@"ViewHealthRecords"];
  v1 = [v0 URL];

  return v1;
}

+ (id)_hk_urlForHealthRecordsProviderSearch
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v0 setScheme:@"x-apple-health"];
  [v0 setHost:@"ViewHealthRecords"];
  [v0 setPath:@"/ProviderSearch"];
  v1 = [v0 URL];

  return v1;
}

+ (id)_hk_urlForElectrocardiogramType
{
  id v0 = +[HKObjectType electrocardiogramType];
  v1 = _HKCreateURLForSampleType(v0);

  return v1;
}

+ (id)_hk_urlForAtrialFibrillationEventType
{
  id v0 = +[HKObjectType atrialFibrillationEventType];
  v1 = _HKCreateURLForSampleType(v0);

  return v1;
}

+ (id)_hk_urlForBloodPressureType
{
  id v0 = +[HKObjectType bloodPressureType];
  v1 = _HKCreateURLForSampleType(v0);

  return v1;
}

+ (id)_hk_urlForHKProfileIdentifier:()_HKURLSupport
{
  v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"x-apple-health"];
  [v5 setHost:@"sharing"];
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v5 URL];
  v8 = objc_msgSend(v6, "_hk_appendQueryParameterToURL:forHKProfileIdentifier:", v7, v4);

  return v8;
}

+ (id)_hk_appendQueryParameterToURL:()_HKURLSupport forHKProfileIdentifier:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithURL:v7 resolvingAgainstBaseURL:0];

  v9 = [v8 queryItems];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v21 = 0;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v21];
  id v12 = v21;
  v13 = v12;
  if (v11)
  {
    v14 = [v11 base64EncodedStringWithOptions:0];
    v15 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v16 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v15];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pi" value:v16];
    [v10 addObject:v17];
    [v8 setQueryItems:v10];
    v18 = [v8 URL];
  }
  else
  {
    if (v12)
    {
      _HKInitializeLogging();
      v19 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        +[NSURL(_HKURLSupport) _hk_appendQueryParameterToURL:forHKProfileIdentifier:]((uint64_t)v13, v19);
      }
    }
    v18 = 0;
  }

  return v18;
}

- (id)_hk_extractEncodedHKProfileIdentifier
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v2 = [v1 queryItems];
  v3 = objc_msgSend(v2, "hk_firstObjectPassingTest:", &__block_literal_global_82);
  id v4 = [v3 value];
  id v5 = [v4 stringByRemovingPercentEncoding];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];
    if (v6)
    {
      id v13 = 0;
      id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v13];
      id v8 = v13;
      v9 = v8;
      if (v7)
      {
        id v10 = v7;
      }
      else if (v8)
      {
        _HKInitializeLogging();
        v11 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
          [(NSURL(_HKURLSupport) *)(uint64_t)v9 _hk_extractEncodedHKProfileIdentifier];
        }
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)_hk_appendQueryParameterToURL:()_HKURLSupport forHKProfileIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error decoding profile information from URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_hk_extractEncodedHKProfileIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Error decodeding profile information from URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end