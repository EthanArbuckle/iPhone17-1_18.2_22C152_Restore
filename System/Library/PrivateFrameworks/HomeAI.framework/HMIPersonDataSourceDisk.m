@interface HMIPersonDataSourceDisk
+ (id)getStoragePath;
- (HMIPersonDataSourceDisk)initWithHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5;
- (NSURL)sourceURL;
- (NSUUID)homeUUID;
- (NSUUID)sourceUUID;
- (OS_dispatch_queue)workQueue;
- (void)addFaceprints:(id)a3 completion:(id)a4;
- (void)fetchAllFaceprintsWithCompletion:(id)a3;
- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3;
- (void)fetchAllPersonsWithCompletion:(id)a3;
- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4;
- (void)performCloudPullWithCompletion:(id)a3;
@end

@implementation HMIPersonDataSourceDisk

- (HMIPersonDataSourceDisk)initWithHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HMIPersonDataSourceDisk;
  v11 = [(HMIPersonDataSourceDisk *)&v35 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  HMIDispatchQueueNameString(v11, 0);
  id v13 = objc_claimAutoreleasedReturnValue();
  v14 = (const char *)[v13 UTF8String];
  uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v16 = dispatch_queue_create(v14, (dispatch_queue_attr_t)v15);
  workQueue = v12->_workQueue;
  v12->_workQueue = (OS_dispatch_queue *)v16;

  objc_storeStrong((id *)&v12->_homeUUID, a3);
  objc_storeStrong((id *)&v12->_sourceUUID, a4);
  v18 = NSURL;
  v19 = [(id)objc_opt_class() getStoragePath];
  v20 = [v18 fileURLWithPath:v19];

  v21 = [v9 UUIDString];
  v22 = [v20 URLByAppendingPathComponent:v21];
  v23 = [v10 UUIDString];
  uint64_t v24 = [v22 URLByAppendingPathComponent:v23];
  sourceURL = v12->_sourceURL;
  v12->_sourceURL = (NSURL *)v24;

  v26 = [MEMORY[0x263F08850] defaultManager];
  v27 = [(NSURL *)v12->_sourceURL path];
  id v34 = 0;
  LOBYTE(v15) = [v26 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v34];
  id v28 = v34;

  if (v15)
  {

LABEL_4:
    v29 = v12;
    goto LABEL_8;
  }
  v30 = [NSString stringWithFormat:@"Error initializing with home UUID: %@ source UUID:%@", v9, v10];
  v31 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v30 underlyingError:v28];
  v32 = v31;
  if (a5) {
    *a5 = v31;
  }
  HMIErrorLog(v12, v32);

  v29 = 0;
LABEL_8:

  return v29;
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMIPersonDataSourceDisk *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMIPersonDataSourceDisk_fetchAllPersonsWithCompletion___block_invoke;
  v7[3] = &unk_26477BD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMIPersonDataSourceDisk_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v28 = [MEMORY[0x263EFF9C0] set];
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [*(id *)(a1 + 32) sourceURL];
  id v34 = 0;
  id v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:&v34];
  id v5 = v34;

  if (v4)
  {
    uint64_t v25 = a1;
    v26 = v4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      while (2)
      {
        uint64_t v9 = 0;
        id v10 = v5;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          v11 = (void *)MEMORY[0x263EFF8F8];
          v12 = [*(id *)(*((void *)&v30 + 1) + 8 * v9) URLByAppendingPathComponent:@"person.json"];
          id v13 = [v11 dataWithContentsOfURL:v12];

          id v29 = v10;
          v14 = [MEMORY[0x263F08900] JSONObjectWithData:v13 options:0 error:&v29];
          id v5 = v29;

          if (!v14)
          {
            uint64_t v21 = *(void *)(v25 + 40);
            v22 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:@"Error loading person from JSON" underlyingError:v5];
            (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);

            goto LABEL_12;
          }
          uint64_t v15 = [HMIPerson alloc];
          id v16 = objc_alloc(MEMORY[0x263F08C38]);
          v17 = [v14 objectForKeyedSubscript:@"UUID"];
          v18 = (void *)[v16 initWithUUIDString:v17];
          v19 = [v14 objectForKeyedSubscript:@"displayName"];
          v20 = [(HMIPerson *)v15 initWithUUID:v18 name:v19];

          [v28 addObject:v20];
          ++v9;
          id v10 = v5;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(v25 + 40) + 16))();
LABEL_12:
    id v4 = v26;
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:@"Error enumerating persons" underlyingError:v5];
    (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
  }
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMIPersonDataSourceDisk *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMIPersonDataSourceDisk_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__HMIPersonDataSourceDisk_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (!v4)
  {
    id v6 = 0;
    goto LABEL_24;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v67;
  v49 = v3;
  uint64_t v50 = *MEMORY[0x263EFF750];
  v55 = v2;
  uint64_t v56 = *MEMORY[0x263EFF6A8];
  uint64_t v48 = a1;
  uint64_t v45 = *(void *)v67;
LABEL_3:
  uint64_t v8 = 0;
  uint64_t v46 = v5;
  while (1)
  {
    if (*(void *)v67 != v7) {
      objc_enumerationMutation(v3);
    }
    uint64_t v47 = v8;
    id v9 = *(void **)(*((void *)&v66 + 1) + 8 * v8);
    id v10 = [*(id *)(a1 + 40) sourceURL];
    v52 = v9;
    v11 = [v9 UUIDString];
    id v12 = [v10 URLByAppendingPathComponent:v11];

    id v13 = [MEMORY[0x263F08850] defaultManager];
    v71[0] = v50;
    v71[1] = v56;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
    id v65 = v6;
    uint64_t v15 = [v13 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:v14 options:5 error:&v65];
    id v16 = v65;

    if (!v15) {
      break;
    }
    v51 = v12;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (!v18)
    {
      id v6 = v16;
      goto LABEL_20;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v62;
    id v6 = v16;
    unint64_t v21 = 0x263EFF000uLL;
    id v54 = v17;
    while (2)
    {
      uint64_t v22 = 0;
      uint64_t v53 = v19;
      do
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void **)(*((void *)&v61 + 1) + 8 * v22);
        id v60 = 0;
        [v23 getResourceValue:&v60 forKey:v56 error:0];
        id v24 = v60;
        if ([v24 BOOLValue])
        {
          uint64_t v25 = *(void **)(v21 + 2296);
          v26 = [v23 URLByAppendingPathComponent:@"facecrop.json"];
          v27 = [v25 dataWithContentsOfURL:v26];

          id v59 = v6;
          id v28 = [MEMORY[0x263F08900] JSONObjectWithData:v27 options:0 error:&v59];
          id v16 = v59;

          if (v28)
          {
            id v29 = objc_alloc(MEMORY[0x263F08C38]);
            long long v30 = [v28 objectForKeyedSubscript:@"UUID"];
            long long v31 = (void *)[v29 initWithUUIDString:v30];

            long long v32 = *(void **)(v21 + 2296);
            long long v33 = [v23 URLByAppendingPathComponent:@"facecrop.jpeg"];
            id v58 = v16;
            id v34 = [v32 dataWithContentsOfURL:v33 options:0 error:&v58];
            id v6 = v58;

            if (v34)
            {
              objc_super v35 = [v28 objectForKeyedSubscript:@"dateCreated"];
              memset(&rect, 0, sizeof(rect));
              CFDictionaryRef v36 = [v28 objectForKeyedSubscript:@"faceBoundingBox"];
              CGRectMakeWithDictionaryRepresentation(v36, &rect);

              v37 = [HMIPersonFaceCrop alloc];
              v38 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v37, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v31, v34, v35, v52, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
              [v55 addObject:v38];

              unint64_t v21 = 0x263EFF000;
              uint64_t v19 = v53;
              id v17 = v54;
              goto LABEL_16;
            }
            uint64_t v40 = *(void *)(v48 + 48);
            v41 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:@"Error loading face crop image" underlyingError:v6];
            (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);

            id v16 = v6;
          }
          else
          {
            uint64_t v39 = *(void *)(v48 + 48);
            id v28 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:@"Error loading face crop from JSON" underlyingError:v16];
            (*(void (**)(uint64_t, void, void *))(v39 + 16))(v39, 0, v28);
          }

          v42 = v54;
          v2 = v55;
          v43 = v54;
          id v3 = v49;
          id v12 = v51;
          goto LABEL_28;
        }
LABEL_16:

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v19) {
        continue;
      }
      break;
    }
LABEL_20:

    uint64_t v8 = v47 + 1;
    v2 = v55;
    a1 = v48;
    id v3 = v49;
    uint64_t v7 = v45;
    if (v47 + 1 == v46)
    {
      uint64_t v5 = [v49 countByEnumeratingWithState:&v66 objects:v72 count:16];
      if (!v5)
      {
LABEL_24:

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v16 = v6;
        goto LABEL_29;
      }
      goto LABEL_3;
    }
  }
  v43 = [NSString stringWithFormat:@"Error enumerating face crops for person UUID:%@", v52];
  uint64_t v44 = *(void *)(a1 + 48);
  v42 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v43 underlyingError:v16];
  (*(void (**)(uint64_t, void, void *))(v44 + 16))(v44, 0, v42);
LABEL_28:

LABEL_29:
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 hmfErrorWithCode:5];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 hmfErrorWithCode:5];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 hmfErrorWithCode:5];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 hmfErrorWithCode:5];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 hmfErrorWithCode:5];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 hmfErrorWithCode:5];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

+ (id)getStoragePath
{
  v2 = +[HMIPreference sharedInstance];
  id v3 = [v2 stringPreferenceForKey:@"personDataSourceDiskStoragePath" defaultValue:@"/tmp/com.apple.HomeAI/familiar-face-data"];

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)sourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end