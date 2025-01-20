@interface TDAssetPackDistiller
- (BOOL)assetStoreWriteToDisk;
- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5;
- (NSSet)assetPackMap;
- (TDAssetPackDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5 usingAssetPackMapping:(id)a6 attemptIncremental:(BOOL)a7;
- (id)assetPackForTags:(id)a3;
- (void)dealloc;
- (void)removeRenditionsFromAssetStoreWithKey:(id)a3;
- (void)setAssetColorSpaceID:(unsigned int)a3;
- (void)setAssetPackMap:(id)a3;
- (void)setAssetSchemaVersion:(unsigned int)a3;
- (void)setAssetStorageVersion:(unsigned int)a3;
- (void)setAssetStorageVersionString:(const char *)a3;
- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3;
- (void)setAssetStoreKeyFormatData:(id)a3;
- (void)setAssetStoreKeySemantics:(int)a3;
- (void)setAssetStoreRenditionCount:(unsigned int)a3;
- (void)setAssetStoreUuid:(id)a3;
- (void)setAuthoringTool:(id)a3;
- (void)setDeploymentPlatform:(id)a3;
- (void)setDeploymentPlatformVersion:(id)a3;
@end

@implementation TDAssetPackDistiller

- (TDAssetPackDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5 usingAssetPackMapping:(id)a6 attemptIncremental:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v31 = 0;
  v29.receiver = self;
  v29.super_class = (Class)TDAssetPackDistiller;
  uint64_t v30 = 0;
  v11 = [(TDDistiller *)&v29 initWithDocument:a3 outputPath:a4 attemptIncremental:a7 versionString:a5];
  v12 = v11;
  if (v11)
  {
    [(TDAssetPackDistiller *)v11 setAssetPackMap:a6];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = [a6 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v24 = v12;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(a6);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v18 = (void *)[v17 outputPath];
          uint64_t v19 = [v18 stringByDeletingLastPathComponent];
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", v19, &v31) & 1) == 0)
          {
            uint64_t v30 = 0;
            if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v30) & 1) == 0)
            {
              v22 = NSStringFromSelector(a2);
              NSLog(&cfstr_Tdassetpackdis.isa, v22, v30);

              return 0;
            }
          }
          v20 = (Class *)off_264C44260;
          if (!v7) {
            v20 = (Class *)0x263F38390;
          }
          v21 = (void *)[objc_alloc(*v20) initWithPath:v18];
          objc_msgSend(v21, "setUuid:", objc_msgSend(a3, "uuid"));
          [v17 setAssetStore:v21];
          objc_msgSend((id)objc_msgSend(v17, "assetStore"), "setExternalTags:", objc_msgSend(v17, "tags"));
        }
        uint64_t v14 = [a6 countByEnumeratingWithState:&v25 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      return v24;
    }
  }
  return v12;
}

- (void)dealloc
{
  [(TDAssetPackDistiller *)self setAssetPackMap:0];
  v3.receiver = self;
  v3.super_class = (Class)TDAssetPackDistiller;
  [(TDDistiller *)&v3 dealloc];
}

- (id)assetPackForTags:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "tags"), "isEqualToSet:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x237DD6000](self, a2);
  id v9 = -[TDDistiller _keyDataFromKey:](self, "_keyDataFromKey:", objc_msgSend((id)objc_msgSend(a5, "keySpec"), "key"));
  v10 = objc_msgSend((id)objc_msgSend(a5, "production"), "tags");
  if ([v10 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__TDAssetPackDistiller_setAsset_withKey_fromRenditionSpec___block_invoke;
    v20[3] = &unk_264C448C0;
    v20[4] = v11;
    [v10 enumerateObjectsUsingBlock:v20];
    id v12 = [(TDAssetPackDistiller *)self assetPackForTags:v11];
    long long v13 = (void *)[v12 assetStore];
    if (v13)
    {
      int v14 = [v13 setAsset:a3 forKey:v9];
      [v12 setWasModified:1];
      if (!v14)
      {
        BOOL v16 = 0;
        goto LABEL_11;
      }
      if (a3)
      {
        uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithExternalReference:tags:", objc_msgSend(v12, "assetPackIdentifier"), v11);
        [v15 setScaleFactor:CUIRenditionKeyValueForAttribute()];
        [v15 setName:@"External"];
        BOOL v16 = -[CUIMutableCommonAssetStorage setAsset:forKey:](self->super._assetStore, "setAsset:forKey:", [v15 CSIRepresentationWithCompression:1], v9);

LABEL_11:
        goto LABEL_12;
      }
      assetStore = self->super._assetStore;
      id v18 = 0;
    }
    else
    {
      assetStore = self->super._assetStore;
      id v18 = a3;
    }
    BOOL v16 = [(CUIMutableCommonAssetStorage *)assetStore setAsset:v18 forKey:v9];
    goto LABEL_11;
  }
  BOOL v16 = [(CUIMutableCommonAssetStorage *)self->super._assetStore setAsset:a3 forKey:v9];
LABEL_12:
  return v16;
}

uint64_t __59__TDAssetPackDistiller_setAsset_withKey_fromRenditionSpec___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];

  return [v2 addObject:v3];
}

- (void)removeRenditionsFromAssetStoreWithKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller removeRenditionsFromAssetStoreWithKey:](&v14, sel_removeRenditionsFromAssetStoreWithKey_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "removeAssetForKey:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStoreRenditionCount:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreRenditionCount:](&v14, sel_setAssetStoreRenditionCount_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setRenditionCount:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStoreUuid:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreUuid:](&v14, sel_setAssetStoreUuid_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setUuid:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreAssociatedChecksum:](&v14, sel_setAssetStoreAssociatedChecksum_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setAssociatedChecksum:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStoreKeyFormatData:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreKeyFormatData:](&v14, sel_setAssetStoreKeyFormatData_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setKeyFormatData:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStoreKeySemantics:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreKeySemantics:](&v14, sel_setAssetStoreKeySemantics_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setKeySemantics:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStorageVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStorageVersion:](&v14, sel_setAssetStorageVersion_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setStorageVersion:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetStorageVersionString:(const char *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStorageVersionString:](&v14, sel_setAssetStorageVersionString_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setVersionString:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetSchemaVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetSchemaVersion:](&v14, sel_setAssetSchemaVersion_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setSchemaVersion:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAssetColorSpaceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetColorSpaceID:](&v14, sel_setAssetColorSpaceID_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setColorSpaceID:", v3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setDeploymentPlatform:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setDeploymentPlatform:](&v14, sel_setDeploymentPlatform_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setDeploymentPlatform:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setDeploymentPlatformVersion:](&v14, sel_setDeploymentPlatformVersion_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setDeploymentPlatformVersion:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)setAuthoringTool:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAuthoringTool:](&v14, sel_setAuthoringTool_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(TDAssetPackDistiller *)self assetPackMap];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetStore"), "setAuthoringTool:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)assetStoreWriteToDisk
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  unsigned int v3 = [(TDDistiller *)&v14 assetStoreWriteToDisk];
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(TDAssetPackDistiller *)self assetPackMap];
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v3 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "assetStore"), "writeToDiskAndCompact:", 1);
        if (!v3) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
          LOBYTE(v3) = 1;
          if (v6) {
            goto LABEL_4;
          }
          return v3;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (NSSet)assetPackMap
{
  return self->assetPackMap;
}

- (void)setAssetPackMap:(id)a3
{
}

@end