@interface CFXMediaItemAdjustmentsData
+ (BOOL)supportsSecureCoding;
+ (NSSet)secureCodingClassWhitelist;
- (CFXMediaItemAdjustmentsData)initWithCameraMode:(int64_t)a3 metadataURL:(id)a4 cameraPosition:(int64_t)a5 effectStack:(id)a6;
- (CFXMediaItemAdjustmentsData)initWithCoder:(id)a3;
- (NSArray)effectStack;
- (NSURL)metadataURL;
- (int64_t)cameraMode;
- (int64_t)cameraPosition;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CFXMediaItemAdjustmentsData

+ (NSSet)secureCodingClassWhitelist
{
  if (secureCodingClassWhitelist_onceToken != -1) {
    dispatch_once(&secureCodingClassWhitelist_onceToken, &__block_literal_global_34);
  }
  v2 = (void *)secureCodingClassWhitelist_secureCodingClassWhitelist;
  return (NSSet *)v2;
}

void __57__CFXMediaItemAdjustmentsData_secureCodingClassWhitelist__block_invoke()
{
  v4[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)secureCodingClassWhitelist_secureCodingClassWhitelist;
  secureCodingClassWhitelist_secureCodingClassWhitelist = v2;
}

- (CFXMediaItemAdjustmentsData)initWithCameraMode:(int64_t)a3 metadataURL:(id)a4 cameraPosition:(int64_t)a5 effectStack:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CFXMediaItemAdjustmentsData;
  v13 = [(CFXMediaItemAdjustmentsData *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_cameraMode = a3;
    objc_storeStrong((id *)&v13->_metadataURL, a4);
    objc_storeStrong((id *)&v14->_effectStack, a6);
    v14->_cameraPosition = a5;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CFXMediaItemAdjustmentsData cameraMode](self, "cameraMode"), @"cameraMode");
  v5 = [(CFXMediaItemAdjustmentsData *)self metadataURL];

  if (v5)
  {
    v6 = [(CFXMediaItemAdjustmentsData *)self metadataURL];
    [v4 encodeObject:v6 forKey:@"metadata"];
  }
  if ([(CFXMediaItemAdjustmentsData *)self cameraPosition]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[CFXMediaItemAdjustmentsData cameraPosition](self, "cameraPosition"), @"cameraPosition");
  }
  v7 = [(CFXMediaItemAdjustmentsData *)self effectStack];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    v10 = [(CFXMediaItemAdjustmentsData *)self effectStack];
    id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [(CFXMediaItemAdjustmentsData *)self effectStack];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        v18 = v15;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
          id v22 = v18;
          v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v19 requiringSecureCoding:0 error:&v22];
          id v15 = v22;

          if (v20)
          {
            [v11 addObject:v20];
          }
          else
          {
            v21 = JFXLog_core();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v28 = v15;
              _os_log_debug_impl(&dword_234C41000, v21, OS_LOG_TYPE_DEBUG, "Error encoding effect: %{public}@", buf, 0xCu);
            }
          }
          ++v17;
          v18 = v15;
        }
        while (v14 != v17);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v14);
    }
    [v4 encodeObject:v11 forKey:@"effectStack"];
  }
}

- (CFXMediaItemAdjustmentsData)initWithCoder:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"cameraMode"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"cameraPosition"];
  v7 = [v4 decodeObjectForKey:@"metadata"];
  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
  v10 = [v8 setWithArray:v9];
  id v43 = 0;
  id v11 = [v4 decodeTopLevelObjectOfClasses:v10 forKey:@"effectStack" error:&v43];
  id v12 = v43;

  uint64_t v13 = 0;
  if (v11 && !v12)
  {
    uint64_t v31 = v6;
    uint64_t v32 = v5;
    v33 = v7;
    v34 = self;
    id v35 = v4;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v30 = v11;
    id obj = v11;
    uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v40;
      uint64_t v17 = *MEMORY[0x263F081D0];
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * v18);
          id v20 = objc_alloc(MEMORY[0x263F08928]);
          id v38 = 0;
          v21 = (void *)[v20 initForReadingFromData:v19 error:&v38];
          id v22 = v38;
          long long v23 = +[CFXMediaItemAdjustmentsData secureCodingClassWhitelist];
          id v37 = v22;
          long long v24 = [v21 decodeTopLevelObjectOfClasses:v23 forKey:v17 error:&v37];
          id v25 = v37;

          [v21 finishDecoding];
          if (v24)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v26 = v24;
              [v26 setImageSequencePathToBundledAssets];
              [v26 setBuildInAnimation:1];
            }
            [v13 addObject:v24];
          }
          else
          {
            v27 = JFXLog_core();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v45 = v25;
              _os_log_debug_impl(&dword_234C41000, v27, OS_LOG_TYPE_DEBUG, "Error decoding effects: %{public}@", buf, 0xCu);
            }
          }
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v15);
    }

    self = v34;
    id v4 = v35;
    uint64_t v5 = v32;
    v7 = v33;
    id v11 = v30;
    uint64_t v6 = v31;
    id v12 = 0;
  }
  id v28 = [(CFXMediaItemAdjustmentsData *)self initWithCameraMode:v5 metadataURL:v7 cameraPosition:v6 effectStack:v13];

  return v28;
}

- (int64_t)cameraMode
{
  return self->_cameraMode;
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (NSArray)effectStack
{
  return self->_effectStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectStack, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
}

@end