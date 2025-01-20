@interface HKMedicationsResolutionEngine
+ (BOOL)isVisionAssetAvailable;
+ (__CFString)_homeMobileDirectoryPath;
+ (id)_databasePath;
+ (id)_visionDirectoryPath;
- (HKMedicationsResolutionEngine)init;
- (HKMedicationsResolutionEngine)initWithAssetUrl:(id)a3;
- (HKMedicationsResolver)resolver;
- (OS_dispatch_queue)queue;
- (id)hkctl_resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 error:(id *)a5;
- (void)filter:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 completionHandler:(id)a7;
- (void)resetResolverWithCompletionHandler:(id)a3;
- (void)resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 completionHandler:(id)a5;
- (void)setQueue:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation HKMedicationsResolutionEngine

+ (BOOL)isVisionAssetAvailable
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = +[HKMedicationsResolutionEngine _databasePath]();
  char v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

+ (id)_databasePath
{
  self;
  v0 = +[HKMedicationsResolutionEngine _visionDirectoryPath]();
  v1 = [v0 stringByAppendingPathComponent:@"pbs_assets.db"];

  return v1;
}

+ (__CFString)_homeMobileDirectoryPath
{
  self;
  v0 = [MEMORY[0x263F08AB0] processInfo];
  v1 = [v0 environment];
  v2 = [v1 objectForKeyedSubscript:@"SIMULATOR_SHARED_RESOURCES_DIRECTORY"];

  if (v2) {
    v3 = v2;
  }
  else {
    v3 = @"/private/var/mobile/";
  }

  return v3;
}

+ (id)_visionDirectoryPath
{
  self;
  v0 = +[HKMedicationsResolutionEngine _homeMobileDirectoryPath]();
  v1 = [v0 stringByAppendingPathComponent:@"Library/Health/vision"];

  return v1;
}

- (HKMedicationsResolutionEngine)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationsResolutionEngine;
  v2 = [(HKMedicationsResolutionEngine *)&v10 init];
  if (v2)
  {
    v3 = [HKMedicationsResolver alloc];
    char v4 = NSURL;
    v5 = +[HKMedicationsResolutionEngine _databasePath]();
    v6 = [v4 fileURLWithPath:v5];
    v7 = [(HKMedicationsResolver *)v3 initWithAssetUrl:v6];
    [(HKMedicationsResolutionEngine *)v2 setResolver:v7];

    v8 = HKCreateSerialDispatchQueue();
    [(HKMedicationsResolutionEngine *)v2 setQueue:v8];
  }
  return v2;
}

- (HKMedicationsResolutionEngine)initWithAssetUrl:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsResolutionEngine;
  v5 = [(HKMedicationsResolutionEngine *)&v9 init];
  if (v5)
  {
    v6 = [[HKMedicationsResolver alloc] initWithAssetUrl:v4];
    [(HKMedicationsResolutionEngine *)v5 setResolver:v6];

    v7 = HKCreateSerialDispatchQueue();
    [(HKMedicationsResolutionEngine *)v5 setQueue:v7];
  }
  return v5;
}

- (void)resetResolverWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HKMedicationsResolutionEngine *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationsResolutionEngine_resetResolverWithCompletionHandler___block_invoke;
  v7[3] = &unk_264BC3738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__HKMedicationsResolutionEngine_resetResolverWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resolver];
  id v4 = 0;
  [v2 resetResolverWithError:&v4];
  id v3 = v4;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_super v9 = [(HKMedicationsResolutionEngine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HKMedicationsResolutionEngine_resolveMedicationsUsing_resultLimit_completionHandler___block_invoke;
  block[3] = &unk_264BC3760;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __87__HKMedicationsResolutionEngine_resolveMedicationsUsing_resultLimit_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resolver];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 resolveText:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)hkctl_resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  objc_super v9 = [(HKMedicationsResolutionEngine *)self resolver];
  id v10 = [v9 resolveText:v8 error:a5];

  if (v10)
  {
    id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
    v31 = v10;
    id v11 = [v10 resolvedIds];
    id v32 = v8;
    if ([v11 count] > (unint64_t)a4)
    {
      uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 0, a4);

      id v11 = (void *)v12;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v11;
    uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v36)
    {
      uint64_t v34 = *(void *)v44;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v13;
          id v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
          id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "primaryHgId"));
          [v15 setObject:v16 forKeyedSubscript:@"primary_hg_id"];

          v17 = NSNumber;
          [v14 maxJaccardSimilarity];
          v18 = objc_msgSend(v17, "numberWithFloat:");
          v37 = v15;
          [v15 setObject:v18 forKeyedSubscript:@"max_jaccard_similarity"];

          id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v20 = [v14 subHgIds];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v47[0] = @"hg_id";
                v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v25, "hgId"));
                v47[1] = @"jaccard_similarity";
                v48[0] = v26;
                v27 = NSNumber;
                [v25 jaccardSimilarity];
                v28 = objc_msgSend(v27, "numberWithFloat:");
                v48[1] = v28;
                v29 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
                [v19 addObject:v29];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v49 count:16];
            }
            while (v22);
          }

          [v37 setObject:v19 forKeyedSubscript:@"sub_hg_ids"];
          [v35 addObject:v37];

          uint64_t v13 = v38 + 1;
        }
        while (v38 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v36);
    }

    id v10 = v31;
    id v8 = v32;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (void)filter:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [(HKMedicationsResolutionEngine *)self queue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__HKMedicationsResolutionEngine_filter_transcripts_criterion_limit_completionHandler___block_invoke;
  v19[3] = &unk_264BC3788;
  v19[4] = self;
  id v20 = v12;
  float v24 = a5;
  id v22 = v14;
  int64_t v23 = a6;
  id v21 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

void __86__HKMedicationsResolutionEngine_filter_transcripts_criterion_limit_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resolver];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  id v9 = 0;
  id v7 = [v2 filterAndAddGenerics:v3 transcripts:v4 criterion:v6 limit:&v9 error:v5];
  id v8 = v9;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (HKMedicationsResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end