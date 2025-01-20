@interface PHImportRecord
- (BOOL)canReference;
- (BOOL)needsDownload;
- (BOOL)referencedImport;
- (NSMutableArray)relatedRecords;
- (NSString)assetIdentifier;
- (NSString)downloadedPath;
- (NSString)rawAssetIdentifier;
- (PHImportAsset)importAsset;
- (PHImportRecord)initWithImportAsset:(id)a3;
- (PHImportTimerCollection)timers;
- (id)allAssetIdentifiers;
- (id)allImportAssets;
- (id)allImportRecords;
- (id)description;
- (id)descriptionWithPrefix:(id)a3;
- (id)recordForAsset:(id)a3;
- (unsigned)importType;
- (void)addRelatedRecord:(id)a3;
- (void)cleanupAfterFailure;
- (void)setAssetIdentifier:(id)a3;
- (void)setDownloadedPath:(id)a3;
- (void)setImportAsset:(id)a3;
- (void)setImportType:(unsigned __int8)a3;
- (void)setReferencedImport:(BOOL)a3;
- (void)setRelatedRecords:(id)a3;
- (void)setTimers:(id)a3;
@end

@implementation PHImportRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_downloadedPath, 0);
  objc_storeStrong((id *)&self->_relatedRecords, 0);
  objc_storeStrong((id *)&self->_importAsset, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);

  objc_storeStrong((id *)&self->_rawAssetIdentifier, 0);
}

- (void)setImportType:(unsigned __int8)a3
{
  self->_importType = a3;
}

- (unsigned)importType
{
  return self->_importType;
}

- (void)setTimers:(id)a3
{
}

- (PHImportTimerCollection)timers
{
  return self->_timers;
}

- (void)setDownloadedPath:(id)a3
{
}

- (NSString)downloadedPath
{
  return self->_downloadedPath;
}

- (void)setReferencedImport:(BOOL)a3
{
  self->_referencedImport = a3;
}

- (BOOL)referencedImport
{
  return self->_referencedImport;
}

- (void)setRelatedRecords:(id)a3
{
}

- (NSMutableArray)relatedRecords
{
  return self->_relatedRecords;
}

- (void)setImportAsset:(id)a3
{
}

- (PHImportAsset)importAsset
{
  return self->_importAsset;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (BOOL)canReference
{
  BOOL v3 = [(PHImportAsset *)self->_importAsset canReference];
  if (v3)
  {
    v4 = [(PHImportAsset *)self->_importAsset source];
    char v5 = [v4 canReference];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)needsDownload
{
  return self->_downloadedPath == 0;
}

- (id)allImportRecords
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(PHImportRecord *)self relatedRecords];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) allImportRecords];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allImportAssets
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = [(PHImportRecord *)self importAsset];
  [v3 addObject:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(PHImportRecord *)self relatedRecords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) allImportAssets];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)recordForAsset:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(PHImportRecord *)v5 importAsset];

  if (v6 != v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(PHImportRecord *)v5 relatedRecords];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;

      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) recordForAsset:v4];
          if (v12)
          {
            uint64_t v5 = (PHImportRecord *)v12;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      uint64_t v5 = 0;
    }
LABEL_12:
  }

  return v5;
}

- (void)addRelatedRecord:(id)a3
{
  id v4 = a3;
  relatedRecords = self->_relatedRecords;
  id v8 = v4;
  if (!relatedRecords)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_relatedRecords;
    self->_relatedRecords = v6;

    id v4 = v8;
    relatedRecords = self->_relatedRecords;
  }
  [(NSMutableArray *)relatedRecords addObject:v4];
  objc_msgSend(v8, "setImportType:", -[PHImportRecord importType](self, "importType"));
}

- (NSString)rawAssetIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  rawAssetIdentifier = self->_rawAssetIdentifier;
  if (!rawAssetIdentifier)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(PHImportRecord *)self relatedRecords];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (!v5) {
      goto LABEL_13;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 importAsset];
        if ([v10 isRAW])
        {
          long long v11 = [v9 assetIdentifier];

          if (!v11) {
            continue;
          }
          uint64_t v12 = [v9 assetIdentifier];
          uint64_t v10 = self->_rawAssetIdentifier;
          self->_rawAssetIdentifier = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v6)
      {
LABEL_13:

        rawAssetIdentifier = self->_rawAssetIdentifier;
        break;
      }
    }
  }

  return rawAssetIdentifier;
}

- (id)allAssetIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(PHImportRecord *)self assetIdentifier];

  if (v4)
  {
    uint64_t v5 = [(PHImportRecord *)self assetIdentifier];
    [v3 addObject:v5];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(PHImportRecord *)self relatedRecords];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 assetIdentifier];

        if (v12)
        {
          long long v13 = [v11 assetIdentifier];
          [v3 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)cleanupAfterFailure
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHImportRecord *)self downloadedPath];

  if (v3)
  {
    id v4 = [(PHImportRecord *)self downloadedPath];
    id v5 = +[PHImporter removeItemAtPath:v4 type:0 recursive:0];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_relatedRecords;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cleanupAfterFailure", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)descriptionWithPrefix:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSString;
  uint64_t v6 = [(PHImportRecord *)self importAsset];
  uint64_t v7 = [v6 fileName];
  uint64_t v8 = [(PHImportRecord *)self assetIdentifier];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_1EEAC1950;
  }
  long long v11 = [v5 stringWithFormat:@"\n%@Asset: %@ <%@>", v4, v7, v10];

  long long v12 = [(PHImportRecord *)self importAsset];
  long long v13 = [v12 url];
  uint64_t v14 = [v13 path];
  long long v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  else {
    uint64_t v16 = &stru_1EEAC1950;
  }
  long long v17 = [v11 stringByAppendingFormat:@"\n%@Source Path: %@", v4, v16];

  uint64_t v18 = [(PHImportRecord *)self downloadedPath];
  uint64_t v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (__CFString *)v18;
  }
  else {
    uint64_t v20 = &stru_1EEAC1950;
  }
  v21 = [v17 stringByAppendingFormat:@"\n%@Destination Path: %@", v4, v20];

  v22 = [(PHImportRecord *)self importAsset];
  v23 = [v22 metadata];
  v24 = [v21 stringByAppendingFormat:@"\n%@Metadata: <%p>", v4, v23];

  v25 = [(PHImportRecord *)self relatedRecords];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    uint64_t v27 = [v24 stringByAppendingFormat:@"\n%@Additional Assets:\n", v4];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v28 = [(PHImportRecord *)self relatedRecords];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
      do
      {
        uint64_t v32 = 0;
        v33 = (void *)v27;
        do
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v28);
          }
          v34 = *(void **)(*((void *)&v38 + 1) + 8 * v32);
          v35 = [NSString stringWithFormat:@"%@\t", v4];
          v36 = [v34 descriptionWithPrefix:v35];
          uint64_t v27 = [v33 stringByAppendingString:v36];

          ++v32;
          v33 = (void *)v27;
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v30);
    }

    v24 = (void *)v27;
  }

  return v24;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHImportRecord *)self descriptionWithPrefix:&stru_1EEAC1950];
  id v4 = [(PHImportExceptionRecorder *)self exceptions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"\nExceptions:"];
    uint64_t v7 = [v3 stringByAppendingString:v6];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(PHImportExceptionRecorder *)self exceptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        long long v13 = (void *)v7;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v7 = [v13 stringByAppendingFormat:@"\n\t%@", *(void *)(*((void *)&v15 + 1) + 8 * v12)];

          ++v12;
          long long v13 = (void *)v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    id v3 = (void *)v7;
  }

  return v3;
}

- (PHImportRecord)initWithImportAsset:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHImportRecord;
  uint64_t v6 = [(PHImportExceptionRecorder *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_importAsset, a3);
    uint64_t v8 = [PHImportTimerCollection alloc];
    if ([v5 isImage])
    {
      unsigned __int8 v9 = 1;
    }
    else if ([v5 isMovie])
    {
      unsigned __int8 v9 = 3;
    }
    else
    {
      unsigned __int8 v9 = 2;
    }
    uint64_t v10 = -[PHImportTimerCollection initForMediaType:fileSize:](v8, "initForMediaType:fileSize:", v9, [v5 fileSize]);
    timers = v7->_timers;
    v7->_timers = (PHImportTimerCollection *)v10;
  }
  return v7;
}

@end