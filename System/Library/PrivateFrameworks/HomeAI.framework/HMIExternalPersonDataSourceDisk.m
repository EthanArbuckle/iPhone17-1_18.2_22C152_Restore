@interface HMIExternalPersonDataSourceDisk
- (void)addPerson:(id)a3 completion:(id)a4;
- (void)addPersonFaceCrops:(id)a3 completion:(id)a4;
- (void)fetchSettingsWithCompletion:(id)a3;
@end

@implementation HMIExternalPersonDataSourceDisk

- (void)addPerson:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMIPersonDataSourceDisk *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMIExternalPersonDataSourceDisk_addPerson_completion___block_invoke;
  block[3] = &unk_26477B630;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__HMIExternalPersonDataSourceDisk_addPerson_completion___block_invoke(uint64_t a1)
{
  v23[3] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sourceURL];
  v3 = [*(id *)(a1 + 40) UUID];
  v4 = [v3 UUIDString];
  v5 = [v2 URLByAppendingPathComponent:v4];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  id v21 = 0;
  char v8 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v9 = v21;

  if (v8)
  {
    v23[0] = @"0.1";
    v22[0] = @"version";
    v22[1] = @"UUID";
    id v10 = [*(id *)(a1 + 40) UUID];
    v11 = [v10 UUIDString];
    v23[1] = v11;
    v22[2] = @"displayName";
    uint64_t v12 = [*(id *)(a1 + 40) name];
    v23[2] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    v14 = [v5 URLByAppendingPathComponent:@"person.json"];
    id v20 = v9;
    LOBYTE(v12) = +[HMIFaceUtilities serializeJSONObject:v13 url:v14 error:&v20];
    id v15 = v20;

    if (v12)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      v17 = [NSString stringWithFormat:@"Error saving metadata to disk for person:%@", *(void *)(a1 + 40)];
      uint64_t v18 = *(void *)(a1 + 48);
      v19 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v17 underlyingError:v15];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
    }
    id v9 = v15;
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Error creating directory for person:%@", *(void *)(a1 + 40)];
    uint64_t v16 = *(void *)(a1 + 48);
    v14 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v13 underlyingError:v9];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);
  }
}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HMIPersonDataSourceDisk *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMIExternalPersonDataSourceDisk_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_26477B630;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__HMIExternalPersonDataSourceDisk_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v38;
LABEL_3:
    uint64_t v1 = 0;
    while (1)
    {
      if (*(void *)v38 != v32) {
        objc_enumerationMutation(obj);
      }
      v2 = *(void **)(*((void *)&v37 + 1) + 8 * v1);
      v3 = [*(id *)(a1 + 40) sourceURL];
      v4 = [v2 personUUID];
      v5 = [v4 UUIDString];
      id v6 = [v3 URLByAppendingPathComponent:v5];

      id v7 = [v2 UUID];
      char v8 = [v7 UUIDString];
      id v9 = [v6 URLByAppendingPathComponent:v8];

      id v10 = [MEMORY[0x263F08850] defaultManager];
      v11 = [v9 path];
      id v36 = 0;
      char v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v36];
      id v13 = v36;

      if ((v12 & 1) == 0) {
        break;
      }
      v34 = v6;
      v42[0] = @"0.1";
      v41[0] = @"version";
      v41[1] = @"UUID";
      id v14 = [v2 UUID];
      id v15 = [v14 UUIDString];
      v42[1] = v15;
      v41[2] = @"faceBoundingBox";
      [v2 faceBoundingBox];
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v45);
      v42[2] = DictionaryRepresentation;
      v41[3] = @"dateCreated";
      v17 = [v2 dateCreated];
      uint64_t v18 = HMIJSONFormattedStringForDate(v17);
      v42[3] = v18;
      v19 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];

      id v20 = [v9 URLByAppendingPathComponent:@"facecrop.json"];
      id v35 = v13;
      LOBYTE(DictionaryRepresentation) = +[HMIFaceUtilities serializeJSONObject:v19 url:v20 error:&v35];
      id v21 = v35;

      if ((DictionaryRepresentation & 1) == 0)
      {
        v26 = [NSString stringWithFormat:@"Error saving metadata to disk for person face crop:%@", v2];
        uint64_t v27 = *(void *)(a1 + 48);
        uint64_t v28 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v26 underlyingError:v21];
        goto LABEL_15;
      }
      v22 = [v2 dataRepresentation];
      v23 = [v9 URLByAppendingPathComponent:@"facecrop.jpeg"];
      char v24 = [v22 writeToURL:v23 atomically:0];

      if ((v24 & 1) == 0)
      {
        v26 = [NSString stringWithFormat:@"Error saving face crop image to disk for person face crop:%@", v2];
        uint64_t v27 = *(void *)(a1 + 48);
        uint64_t v28 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v26];
LABEL_15:
        v29 = (void *)v28;
        (*(void (**)(uint64_t, uint64_t))(v27 + 16))(v27, v28);

        id v6 = v34;
LABEL_16:

        return;
      }

      if (v31 == ++v1)
      {
        uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v31) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    v19 = [NSString stringWithFormat:@"Error creating directory for person face crop:%@", v2];
    uint64_t v25 = *(void *)(a1 + 48);
    id v20 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1031 description:v19 underlyingError:v13];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v20);
    id v21 = v13;
    goto LABEL_16;
  }
LABEL_11:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 hmfErrorWithCode:5];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

@end