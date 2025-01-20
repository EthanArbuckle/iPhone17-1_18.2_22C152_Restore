@interface HRBrandImageManager
+ (double)defaultLogoDimension;
+ (id)_fetchOrCreateSalt;
+ (id)imageManagerWithHealthRecordsStore:(id)a3;
+ (void)_fetchOrCreateSalt;
- (HKClinicalProviderServiceStore)providerServiceStore;
- (HKHealthRecordsStore)healthRecordsStore;
- (HRBrandImageManager)initWithHealthRecordsStore:(id)a3;
- (NSCache)fetchedImages;
- (NSMutableDictionary)outstandingRequests;
- (NSOperationQueue)fileOperationQueue;
- (id)_hashedSaltedStringFromString:(id)a3;
- (id)_logoURLForBrand:(id)a3;
- (id)_scaleKeyForCurrentDevice;
- (id)loadStoredLogoForBrand:(id)a3;
- (void)_writeImageData:(id)a3 brand:(id)a4;
- (void)cacheFeaturedBrandLogosWithCompletion:(id)a3;
- (void)dispatchResponsesForBrand:(id)a3 image:(id)a4 error:(id)a5;
- (void)fetchLogoForBrand:(id)a3 completion:(id)a4;
- (void)onMainQueue:(id)a3;
- (void)processFetchResponseWithData:(id)a3 error:(id)a4 brand:(id)a5;
- (void)retrieveLogoForBrand:(id)a3 size:(double)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)setFetchedImages:(id)a3;
- (void)setFileOperationQueue:(id)a3;
- (void)setHealthRecordsStore:(id)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setProviderServiceStore:(id)a3;
@end

@implementation HRBrandImageManager

+ (double)defaultLogoDimension
{
  return 60.0;
}

+ (id)imageManagerWithHealthRecordsStore:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithHealthRecordsStore:v4];

  return v5;
}

- (HRBrandImageManager)initWithHealthRecordsStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HRBrandImageManager;
  v5 = [(HRBrandImageManager *)&v16 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(HRBrandImageManager *)v5 setFileOperationQueue:v6];

    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [(HRBrandImageManager *)v5 fileOperationQueue];
    [v9 setName:v8];

    v10 = [(HRBrandImageManager *)v5 fileOperationQueue];
    v11 = objc_opt_new();
    [v10 addOperation:v11];

    [(HRBrandImageManager *)v5 setHealthRecordsStore:v4];
    id v12 = objc_alloc(MEMORY[0x1E4F67760]);
    v13 = [v4 healthStore];
    v14 = (void *)[v12 initWithHealthStore:v13];
    [(HRBrandImageManager *)v5 setProviderServiceStore:v14];
  }
  return v5;
}

- (NSCache)fetchedImages
{
  fetchedImages = self->_fetchedImages;
  if (!fetchedImages)
  {
    id v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v5 = self->_fetchedImages;
    self->_fetchedImages = v4;

    fetchedImages = self->_fetchedImages;
  }
  return fetchedImages;
}

- (NSMutableDictionary)outstandingRequests
{
  outstandingRequests = self->_outstandingRequests;
  if (!outstandingRequests)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = self->_outstandingRequests;
    self->_outstandingRequests = v4;

    outstandingRequests = self->_outstandingRequests;
  }
  return outstandingRequests;
}

- (id)_scaleKeyForCurrentDevice
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = v3;

  v5 = @"3x";
  if (v4 == 2.0) {
    v5 = @"2x";
  }
  if (v4 == 1.0) {
    return @"1x";
  }
  else {
    return v5;
  }
}

- (void)cacheFeaturedBrandLogosWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HRBrandImageManager *)self providerServiceStore];
  id v6 = [(HRBrandImageManager *)self _scaleKeyForCurrentDevice];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke;
  v8[3] = &unk_1E644B378;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 fetchLogoDataForFeaturedBrandsAtScaleKey:v6 completion:v8];
}

void __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28F08] mainQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke_2;
  v12[3] = &unk_1E644A8E8;
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v8;
  id v10 = v6;
  id v11 = v5;
  [v7 addOperationWithBlock:v12];
}

uint64_t __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_INFO))
    {
      double v3 = NSNumber;
      id v4 = *(void **)(a1 + 32);
      id v5 = v2;
      id v6 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      id v7 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1C21A1000, v5, OS_LOG_TYPE_INFO, "Caching brand logo for %@ featured brands", buf, 0xCu);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = (void *)[objc_alloc(MEMORY[0x1E4F2ACE0]) initWithExternalID:v13 batchID:@"featured"];
          uint64_t v15 = *(void **)(a1 + 48);
          id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
          [v15 processFetchResponseWithData:v16 error:0 brand:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v18 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v18();
  }
}

- (void)onMainQueue:(id)a3
{
  id v6 = (void (**)(void))a3;
  double v3 = [MEMORY[0x1E4F28F08] currentQueue];
  id v4 = [MEMORY[0x1E4F28F08] mainQueue];

  if (v3 == v4)
  {
    v6[2]();
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28F08] mainQueue];
    [v5 addOperationWithBlock:v6];
  }
}

- (void)retrieveLogoForBrand:(id)a3 size:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v7 = a5;
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [(HRBrandImageManager *)self loadStoredLogoForBrand:v9];
  if (v11)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke;
    v17[3] = &unk_1E644B3A0;
    id v19 = v10;
    id v18 = v11;
    [(HRBrandImageManager *)self onMainQueue:v17];

    id v12 = v19;
LABEL_8:

    goto LABEL_9;
  }
  if ([v9 isLocalDevelopmentSampleBrand])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_2;
    v15[3] = &unk_1E644B3C8;
    id v16 = v10;
    [(HRBrandImageManager *)self onMainQueue:v15];
    id v12 = v16;
    goto LABEL_8;
  }
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_3;
    v13[3] = &unk_1E644B3C8;
    id v14 = v10;
    [(HRBrandImageManager *)self onMainQueue:v13];
    id v12 = v14;
    goto LABEL_8;
  }
  [(HRBrandImageManager *)self fetchLogoForBrand:v9 completion:v10];
LABEL_9:
}

uint64_t __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 608, @"This is a develompent sample brand, not requesting logo.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 608, @"Fetching brand image at most once per launch.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)loadStoredLogoForBrand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 externalID];
  id v6 = [(HRBrandImageManager *)self fetchedImages];
  char v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(HRBrandImageManager *)self _logoURLForBrand:v4];
    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
      uint64_t v11 = [v9 path];
      id v8 = (id)[v10 initWithContentsOfFile:v11];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)fetchLogoForBrand:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 externalID];
  id v9 = [(HRBrandImageManager *)self outstandingRequests];
  id v10 = [v9 objectForKeyedSubscript:v8];

  uint64_t v11 = _Block_copy(v7);
  if (v10)
  {
    [v10 addObject:v11];
  }
  else
  {
    v19[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v13 = (void *)[v12 mutableCopy];
    id v14 = [(HRBrandImageManager *)self outstandingRequests];
    [v14 setObject:v13 forKeyedSubscript:v8];

    uint64_t v15 = [(HRBrandImageManager *)self providerServiceStore];
    id v16 = [(HRBrandImageManager *)self _scaleKeyForCurrentDevice];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__HRBrandImageManager_fetchLogoForBrand_completion___block_invoke;
    v17[3] = &unk_1E644B3F0;
    void v17[4] = self;
    id v18 = v6;
    [v15 fetchLogoDataForBrand:v18 scaleKey:v16 completion:v17];
  }
}

uint64_t __52__HRBrandImageManager_fetchLogoForBrand_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) processFetchResponseWithData:a2 error:a3 brand:*(void *)(a1 + 40)];
}

- (void)processFetchResponseWithData:(id)a3 error:(id)a4 brand:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [MEMORY[0x1E4FB1818] imageWithData:v8];
    if (v11)
    {
      [(HRBrandImageManager *)self _writeImageData:v8 brand:v10];
    }
    else
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Image decoding error for brand");

      id v9 = (id)v16;
    }
    [(HRBrandImageManager *)self dispatchResponsesForBrand:v10 image:v11 error:v9];
  }
  else
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[HRBrandImageManager processFetchResponseWithData:error:brand:](v12, v10);
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = HKSensitiveLogItem();
    uint64_t v15 = objc_msgSend(v13, "hk_error:format:", 100, @"Unable to fetch image for brand: %@", v14);
    [(HRBrandImageManager *)self dispatchResponsesForBrand:v10 image:0 error:v15];
  }
}

- (void)dispatchResponsesForBrand:(id)a3 image:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 externalID];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HRBrandImageManager_dispatchResponsesForBrand_image_error___block_invoke;
  v14[3] = &unk_1E644A710;
  v14[4] = self;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(HRBrandImageManager *)self onMainQueue:v14];
}

void __61__HRBrandImageManager_dispatchResponsesForBrand_image_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) outstandingRequests];
  double v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) outstandingRequests];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) fetchedImages];
    [v5 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_writeImageData:(id)a3 brand:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(HRBrandImageManager *)self _logoURLForBrand:a4];
  if (v7)
  {
    uint64_t v8 = [(HRBrandImageManager *)self fileOperationQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__HRBrandImageManager__writeImageData_brand___block_invoke;
    v17[3] = &unk_1E644ADD8;
    id v18 = v6;
    id v19 = v7;
    [v8 addOperationWithBlock:v17];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[HRBrandImageManager _writeImageData:brand:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __45__HRBrandImageManager__writeImageData_brand___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0;
  char v3 = [v2 writeToURL:v1 options:805306369 error:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __45__HRBrandImageManager__writeImageData_brand___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (id)_logoURLForBrand:(id)a3
{
  id v4 = [a3 externalID];
  id v5 = [(HRBrandImageManager *)self _hashedSaltedStringFromString:v4];

  if (v5)
  {
    id v6 = [v5 stringByAppendingPathExtension:@"png"];
    uint64_t v7 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    uint64_t v8 = [v7 firstObject];

    uint64_t v9 = [v8 stringByAppendingPathComponent:@"BrandLogos"];

    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v11 = [v10 fileExistsAtPath:v9];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v35 = 0;
      char v13 = [v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v35];
      id v14 = v35;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v15 = *MEMORY[0x1E4F29F38];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
          -[HRBrandImageManager _logoURLForBrand:]((uint64_t)v14, v15);
        }
      }
    }
    uint64_t v16 = [v9 stringByAppendingPathComponent:v6];

    if (v16)
    {
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v16 isDirectory:0];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v26 = *MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        -[HRBrandImageManager _logoURLForBrand:](v26, v27, v28, v29, v30, v31, v32, v33);
      }
      id v17 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v18 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[HRBrandImageManager _logoURLForBrand:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)_hashedSaltedStringFromString:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _fetchOrCreateSalt];
  if (v4)
  {
    id v5 = [v3 stringByAppendingString:v4];
    id v6 = [v5 dataUsingEncoding:4];
    uint64_t v7 = objc_msgSend(v6, "hk_MD5");
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = [v9 bytes];
      char v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v9, "length"));
      if ([v9 length])
      {
        unint64_t v12 = 0;
        do
          objc_msgSend(v11, "appendFormat:", @"%02.2hhX", *(char *)(v10 + v12++));
        while (v12 < [v9 length]);
      }
      char v13 = (void *)[v11 copy];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)_fetchOrCreateSalt
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (_fetchOrCreateSalt__salt)
  {
    id v3 = (id)_fetchOrCreateSalt__salt;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:*MEMORY[0x1E4F3B9A0] forKey:*MEMORY[0x1E4F3B978]];
    [v4 setObject:@"com.apple.HealthUI.BrandImageManager" forKey:*MEMORY[0x1E4F3B5D0]];
    [v4 setObject:*MEMORY[0x1E4F3B5B8] forKey:*MEMORY[0x1E4F3B558]];
    [v4 setObject:*MEMORY[0x1E4F1CFC8] forKey:*MEMORY[0x1E4F3B878]];
    uint64_t v5 = *MEMORY[0x1E4F1CFD0];
    [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3B6B0]];
    [v4 setObject:v5 forKey:*MEMORY[0x1E4F3BC70]];
    CFTypeRef result = 0;
    OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
    int v7 = v6;
    if (v6 != -25300 && v6)
    {
      _HKInitializeLogging();
      char v11 = *MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
        +[HRBrandImageManager _fetchOrCreateSalt];
      }
      id v3 = 0;
    }
    else
    {
      uint64_t v8 = (void *)result;
      if (result)
      {
        uint64_t v9 = [[NSString alloc] initWithData:result encoding:4];
        uint64_t v10 = (void *)_fetchOrCreateSalt__salt;
        _fetchOrCreateSalt__salt = v9;
      }
      else
      {
        unint64_t v12 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v13 = [v12 UUIDString];
        id v14 = (void *)_fetchOrCreateSalt__salt;
        _fetchOrCreateSalt__salt = v13;

        uint64_t v10 = (void *)[v4 mutableCopy];
        uint64_t v15 = [(id)_fetchOrCreateSalt__salt dataUsingEncoding:4];
        [v10 setObject:v15 forKey:*MEMORY[0x1E4F3BD38]];

        OSStatus v16 = SecItemAdd((CFDictionaryRef)v10, 0);
        if (v16)
        {
          _HKInitializeLogging();
          id v17 = *MEMORY[0x1E4F29F38];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
            +[HRBrandImageManager _fetchOrCreateSalt];
          }
        }
      }

      id v3 = (id)_fetchOrCreateSalt__salt;
    }
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setFetchedImages:(id)a3
{
}

- (void)setOutstandingRequests:(id)a3
{
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void)setHealthRecordsStore:(id)a3
{
}

- (NSOperationQueue)fileOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileOperationQueue:(id)a3
{
}

- (HKClinicalProviderServiceStore)providerServiceStore
{
  return self->_providerServiceStore;
}

- (void)setProviderServiceStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_fileOperationQueue, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_fetchedImages, 0);
}

- (void)processFetchResponseWithData:(void *)a1 error:(void *)a2 brand:.cold.1(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 externalID];
  uint64_t v5 = HKSensitiveLogItem();
  OSStatus v6 = HKSensitiveLogItem();
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1C21A1000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch image for brand %@. error: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_writeImageData:(uint64_t)a3 brand:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__HRBrandImageManager__writeImageData_brand___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Caching logo for brand failed. This isn't harmful but will degrade perceived UI performance. %@", (uint8_t *)&v2, 0xCu);
}

- (void)_logoURLForBrand:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_logoURLForBrand:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_logoURLForBrand:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Unable to create logo cache directory: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_fetchOrCreateSalt
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_ERROR, "Error inserting salt into keychain: %d", (uint8_t *)v2, 8u);
}

@end