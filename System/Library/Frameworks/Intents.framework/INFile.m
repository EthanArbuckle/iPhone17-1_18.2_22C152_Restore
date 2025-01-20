@interface INFile
+ (BOOL)supportsSecureCoding;
+ (INFile)fileWithData:(NSData *)data filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier;
+ (INFile)fileWithFileURL:(NSURL *)fileURL filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)_associatedAuditToken;
- (BOOL)_associatedAuditTokenIsEqualToAuditToken:(id *)a3;
- (BOOL)_hasAssociatedAuditToken;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)_isFileURLBased;
- (BOOL)_isMarkedForDeletionOnDeallocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)removedOnCompletion;
- (INFile)initWithCoder:(id)a3;
- (INItemProviderRequestMetadata)_itemProviderRequestMetadata;
- (NSData)_bookmarkData;
- (NSData)data;
- (NSItemProvider)_itemProvider;
- (NSNumber)_removedOnCompletionValue;
- (NSString)filename;
- (NSString)typeIdentifier;
- (NSURL)fileURL;
- (id)_dictionaryRepresentation;
- (id)_initWithBookmarkData:(id)a3 filename:(id)a4 typeIdentifier:(id)a5 removedOnCompletion:(id)a6;
- (id)_initWithData:(id)a3 filename:(id)a4 fileURL:(id)a5 typeIdentifier:(id)a6 removedOnCompletion:(id)a7;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)itemProvider;
- (unint64_t)hash;
- (void)_setAssociatedAuditToken:(id *)a3;
- (void)_setItemProviderRequestMetadata:(id)a3;
- (void)_setMarkedForDeletionOnDeallocation:(BOOL)a3;
- (void)_setRemovedOnCompletionValue:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadDataRepresentationWithType:(id)a3 completion:(id)a4;
- (void)loadFileRepresentationWithType:(id)a3 completion:(id)a4;
- (void)setFilename:(NSString *)filename;
- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion;
@end

@implementation INFile

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = [(INFile *)self fileURL];
  char v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if (v8)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)INFile;
    BOOL v9 = [&v11 _intents_enumerateObjectsOfClass:a3 withBlock:v6];
  }

  return v9;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(INFile *)self _isFileURLBased])
  {
    v7 = [(INFile *)self fileURL];
    char v8 = [v5 encodeObject:v7];
    BOOL v9 = @"fileURL";
  }
  else
  {
    v10 = [(INFile *)self _bookmarkData];

    if (v10)
    {
      v7 = [(INFile *)self _bookmarkData];
      char v8 = [v5 encodeObject:v7];
      BOOL v9 = @"_bookmarkData";
    }
    else
    {
      v7 = [(INFile *)self data];
      char v8 = [v5 encodeObject:v7];
      BOOL v9 = @"data";
    }
  }
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, v9);

  objc_super v11 = [(INFile *)self filename];
  v12 = [v5 encodeObject:v11];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, @"filename");

  v13 = [(INFile *)self typeIdentifier];
  v14 = [v5 encodeObject:v13];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, @"typeIdentifier");

  v15 = [(INFile *)self _removedOnCompletionValue];
  v16 = [v5 encodeObject:v15];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v16, @"removedOnCompletion");

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_opt_class();
      objc_super v11 = [v9 objectForKeyedSubscript:@"filename"];
      v12 = [v7 decodeObjectOfClass:v10 from:v11];

      uint64_t v13 = objc_opt_class();
      v14 = [v9 objectForKeyedSubscript:@"typeIdentifier"];
      v15 = [v7 decodeObjectOfClass:v13 from:v14];

      uint64_t v16 = objc_opt_class();
      v17 = [v9 objectForKeyedSubscript:@"removedOnCompletion"];
      v18 = [v7 decodeObjectOfClass:v16 from:v17];

      v19 = [v9 objectForKeyedSubscript:@"fileURL"];

      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        v21 = [v9 objectForKeyedSubscript:@"fileURL"];
        v22 = [v7 decodeObjectOfClass:v20 from:v21];

        v23 = [INFile alloc];
        v24 = 0;
        v25 = v12;
        v26 = v22;
      }
      else
      {
        uint64_t v30 = [v9 objectForKeyedSubscript:@"data"];
        if (!v30
          || (v31 = (void *)v30,
              [v9 objectForKeyedSubscript:@"filename"],
              v32 = objc_claimAutoreleasedReturnValue(),
              v32,
              v31,
              !v32))
        {
          v35 = [v9 objectForKeyedSubscript:@"_bookmarkData"];

          if (!v35)
          {
            v28 = 0;
            goto LABEL_7;
          }
          uint64_t v36 = objc_opt_class();
          v37 = [v9 objectForKeyedSubscript:@"_bookmarkData"];
          v22 = [v7 decodeObjectOfClass:v36 from:v37];

          id v27 = [[INFile alloc] _initWithBookmarkData:v22 filename:v12 typeIdentifier:v15 removedOnCompletion:v18];
LABEL_6:
          v28 = v27;

LABEL_7:
          goto LABEL_9;
        }
        uint64_t v33 = objc_opt_class();
        v34 = [v9 objectForKeyedSubscript:@"data"];
        v22 = [v7 decodeObjectOfClass:v33 from:v34];

        v23 = [INFile alloc];
        v24 = v22;
        v25 = v12;
        v26 = 0;
      }
      id v27 = [(INFile *)v23 _initWithData:v24 filename:v25 fileURL:v26 typeIdentifier:v15 removedOnCompletion:v18];
      goto LABEL_6;
    }
  }
  v28 = 0;
LABEL_9:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_itemProviderRequestMetadata, 0);
  objc_storeStrong((id *)&self->_removedOnCompletionValue, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_memoryMappedFileData, 0);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)_setItemProviderRequestMetadata:(id)a3
{
}

- (INItemProviderRequestMetadata)_itemProviderRequestMetadata
{
  return self->_itemProviderRequestMetadata;
}

- (void)_setRemovedOnCompletionValue:(id)a3
{
}

- (NSNumber)_removedOnCompletionValue
{
  return self->_removedOnCompletionValue;
}

- (NSData)_bookmarkData
{
  return self->_bookmarkData;
}

- (void)setFilename:(NSString *)filename
{
}

- (id)itemProvider
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v4 = [(INFile *)self _itemProviderRequestMetadata];
  uint64_t v20 = [v4 supportedContentTypes];

  objc_initWeak(&location, self);
  if ([v20 count])
  {
    id v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "-[INFile itemProvider]";
      __int16 v37 = 2112;
      v38 = v20;
      _os_log_debug_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_DEBUG, "%s Registering type identifiers: %@ for item provider with itemProviderRequestMetadata", buf, 0x16u);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v20;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __22__INFile_itemProvider__block_invoke_60;
          v23[3] = &unk_1E551F900;
          objc_copyWeak(&v24, &location);
          v23[4] = v10;
          [v3 registerFileRepresentationForTypeIdentifier:v10 fileOptions:1 visibility:0 loadHandler:v23];
          objc_destroyWeak(&v24);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v7);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __22__INFile_itemProvider__block_invoke_2_61;
    v21[3] = &unk_1E551F8D8;
    objc_copyWeak(&v22, &location);
    [v3 registerDataRepresentationForTypeIdentifier:@"com.apple.lplinkmetadata" visibility:0 loadHandler:v21];
    objc_destroyWeak(&v22);
  }
  else
  {
    objc_super v11 = [(INFile *)self typeIdentifier];
    BOOL v12 = v11 == 0;

    uint64_t v13 = INSiriLogContextIntents;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v36 = "-[INFile itemProvider]";
        _os_log_debug_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_DEBUG, "%s Did not find a typeIdentifier returning an empty item provider!", buf, 0xCu);
      }
    }
    else
    {
      v14 = (id)INSiriLogContextIntents;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v19 = [(INFile *)self typeIdentifier];
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "-[INFile itemProvider]";
        __int16 v37 = 2112;
        v38 = v19;
        _os_log_debug_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_DEBUG, "%s Using natural type: %@ because no item provider metadata was found", buf, 0x16u);
      }
      v15 = [(INFile *)self fileURL];

      uint64_t v16 = [(INFile *)self typeIdentifier];
      if (v15)
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __22__INFile_itemProvider__block_invoke;
        v31[3] = &unk_1E551F8B0;
        v17 = &v32;
        objc_copyWeak(&v32, &location);
        [v3 registerFileRepresentationForTypeIdentifier:v16 fileOptions:1 visibility:0 loadHandler:v31];
      }
      else
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __22__INFile_itemProvider__block_invoke_2;
        v29[3] = &unk_1E551F8D8;
        v17 = &v30;
        objc_copyWeak(&v30, &location);
        [v3 registerDataRepresentationForTypeIdentifier:v16 visibility:0 loadHandler:v29];
      }

      objc_destroyWeak(v17);
    }
  }
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __22__INFile_itemProvider__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained fileURL];
  v3[2](v3, v5, 1, 0);

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained data];
  v3[2](v3, v5, 0);

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained loadFileRepresentationWithType:*(void *)(a1 + 32) completion:v4];

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_2_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _itemProviderRequestMetadata];
  id v6 = [v5 metadata];
  uint64_t v7 = _INItemProviderMetadataFromData(v6);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __22__INFile_itemProvider__block_invoke_3;
  v10[3] = &unk_1E551F928;
  id v11 = v3;
  id v8 = v3;
  [v7 fetchLinkMetadataWithCompletion:v10];

  return 0;
}

void __22__INFile_itemProvider__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (NSItemProvider)_itemProvider
{
  itemProvider = self->_itemProvider;
  if (!itemProvider)
  {
    id v4 = [(INFile *)self itemProvider];
    id v5 = self->_itemProvider;
    self->_itemProvider = v4;

    itemProvider = self->_itemProvider;
  }

  return itemProvider;
}

- (void)loadDataRepresentationWithType:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _INVCVoiceShortcutClient();
  if (v8)
  {
    id v9 = [(INFile *)self _itemProviderRequestMetadata];
    uint64_t v10 = [v9 metadata];
    id v11 = _INItemProviderMetadataFromData(v10);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__INFile_loadDataRepresentationWithType_completion___block_invoke;
    v13[3] = &unk_1E551F888;
    id v14 = v7;
    [v8 loadDataWithItemProviderRequestMetadata:v11 type:v6 completion:v13];
  }
  else
  {
    BOOL v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[INFile loadDataRepresentationWithType:completion:]";
      _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
  }
}

void __52__INFile_loadDataRepresentationWithType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v7;
    int v9 = 136315650;
    uint64_t v10 = "-[INFile loadDataRepresentationWithType:completion:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = [v5 length];
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_DEBUG, "%s Loaded data: %lu with error: %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadFileRepresentationWithType:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _INVCVoiceShortcutClient();
  if (v8)
  {
    int v9 = [(INFile *)self _itemProviderRequestMetadata];
    uint64_t v10 = [v9 metadata];
    __int16 v11 = _INItemProviderMetadataFromData(v10);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__INFile_loadFileRepresentationWithType_completion___block_invoke;
    v13[3] = &unk_1E551F860;
    id v14 = v7;
    [v8 loadFileURLWithItemProviderRequestMetadata:v11 type:v6 openInPlace:1 completion:v13];
  }
  else
  {
    uint64_t v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[INFile loadFileRepresentationWithType:completion:]";
      _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
  }
}

void __52__INFile_loadFileRepresentationWithType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  int v9 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = v9;
    uint64_t v13 = [v7 url];
    id v14 = (void *)v13;
    uint64_t v15 = @"NO";
    *(_DWORD *)uint64_t v16 = 136315906;
    *(void *)&v16[4] = "-[INFile loadFileRepresentationWithType:completion:]_block_invoke";
    if (a3) {
      uint64_t v15 = @"YES";
    }
    *(_WORD *)&v16[12] = 2112;
    *(void *)&v16[14] = v13;
    __int16 v17 = 2112;
    v18 = v15;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_debug_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_DEBUG, "%s Loaded file url: %@ with wasOpenedInPlace: %@ error: %@", v16, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = objc_msgSend(v7, "url", *(_OWORD *)v16);
  (*(void (**)(uint64_t, void *, uint64_t, id))(v10 + 16))(v10, v11, a3, v8);
}

- (void)_setAssociatedAuditToken:(id *)a3
{
  fileURL = self->_fileURL;
  long long v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  INFileURLSetAssociatedAuditToken(fileURL, v5);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_associatedAuditToken
{
  INFileURLGetAssociatedAuditToken(self->_fileURL, retstr);
  return result;
}

- (BOOL)_associatedAuditTokenIsEqualToAuditToken:(id *)a3
{
  fileURL = self->_fileURL;
  $115C4C562B26FF47E01F9F4EA65B5887 v8 = *a3;
  long long v9 = 0u;
  long long v10 = 0u;
  INFileURLGetAssociatedAuditToken(fileURL, &v9);
  return (void)v9 == *(void *)v8.var0
      && *((void *)&v9 + 1) == *(void *)&v8.var0[2]
      && (void)v10 == *(void *)&v8.var0[4]
      && *((void *)&v10 + 1) == *(void *)&v8.var0[6];
}

- (void)_setMarkedForDeletionOnDeallocation:(BOOL)a3
{
}

- (BOOL)_isMarkedForDeletionOnDeallocation
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(self) = objc_msgSend(v3, "if_BOOLForExtendedAttributeName:ofItemAtURL:", @"INFileURLIsMarkedForDeletionOnDeallocation", self->_fileURL);

  return (char)self;
}

- (BOOL)_hasAssociatedAuditToken
{
  return INFileURLHasAssociatedAuditToken(self->_fileURL);
}

- (id)_dictionaryRepresentation
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t data = (uint64_t)self->_data;
  uint64_t v19 = data;
  v20[0] = @"data";
  if (!data)
  {
    uint64_t data = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)data;
  v21[0] = data;
  v20[1] = @"bookmarkData";
  bookmarkData = self->_bookmarkData;
  uint64_t v6 = (uint64_t)bookmarkData;
  if (!bookmarkData)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = v6;
  v21[1] = v6;
  v20[2] = @"filename";
  filename = self->_filename;
  $115C4C562B26FF47E01F9F4EA65B5887 v8 = filename;
  if (!filename)
  {
    $115C4C562B26FF47E01F9F4EA65B5887 v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v6, v18);
  }
  v21[2] = v8;
  v20[3] = @"fileURL";
  fileURL = self->_fileURL;
  long long v10 = fileURL;
  if (!fileURL)
  {
    long long v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v10;
  v20[4] = @"typeIdentifier";
  typeIdentifier = self->_typeIdentifier;
  uint64_t v12 = typeIdentifier;
  if (!typeIdentifier)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  void v21[4] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v16);
  id v14 = [v3 dictionaryWithDictionary:v13];

  if (typeIdentifier)
  {
    if (fileURL) {
      goto LABEL_13;
    }
  }
  else
  {

    if (fileURL)
    {
LABEL_13:
      if (filename) {
        goto LABEL_14;
      }
LABEL_22:

      if (bookmarkData) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }

  if (!filename) {
    goto LABEL_22;
  }
LABEL_14:
  if (bookmarkData) {
    goto LABEL_15;
  }
LABEL_23:

LABEL_15:
  if (!v19) {

  }
  objc_msgSend(v14, "if_setObjectIfNonNil:forKey:", self->_removedOnCompletionValue, @"removedOnCompletion");

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeObject:self->_bookmarkData forKey:@"_bookmarkData"];
  [v5 encodeObject:self->_filename forKey:@"filename"];
  [v5 encodeObject:self->_fileURL forKey:@"fileURL"];
  [v5 encodeObject:self->_typeIdentifier forKey:@"typeIdentifier"];
  [v5 encodeObject:self->_removedOnCompletionValue forKey:@"removedOnCompletion"];
  [v5 encodeObject:self->_itemProviderRequestMetadata forKey:@"_itemProviderRequestMetadata"];
  if (self->_fileURL)
  {
    long long v4 = (void *)MEMORY[0x192F97DF0]();
    [v5 encodeObject:v4 forKey:@"securityScope"];
  }
}

- (INFile)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bookmarkData"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
  $115C4C562B26FF47E01F9F4EA65B5887 v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityScope"];
  long long v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemProviderRequestMetadata"];
  if (v7 && v8) {
    MEMORY[0x192F97DE0](v7, v8);
  }
  long long v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeIdentifier"];
  __int16 v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"removedOnCompletion"];
  if (v5)
  {
    uint64_t v12 = [objc_alloc((Class)objc_opt_class()) _initWithBookmarkData:v5 filename:v6 typeIdentifier:v10 removedOnCompletion:v11];
  }
  else
  {
    if (!(v15 | v7))
    {
      uint64_t v13 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = [objc_alloc((Class)objc_opt_class()) _initWithData:v15 filename:v6 fileURL:v7 typeIdentifier:v10 removedOnCompletion:v11];
  }
  uint64_t v13 = (INFile *)v12;
LABEL_10:
  [(INFile *)v13 _setItemProviderRequestMetadata:v9];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t data = self->_data;
    BOOL v11 = 0;
    if (data == (NSData *)v5[2] || -[NSData isEqual:](data, "isEqual:"))
    {
      filename = self->_filename;
      if (filename == (NSString *)v5[3] || -[NSString isEqual:](filename, "isEqual:"))
      {
        fileURL = self->_fileURL;
        if (fileURL == (NSURL *)v5[4] || -[NSURL isEqual:](fileURL, "isEqual:"))
        {
          typeIdentifier = self->_typeIdentifier;
          if (typeIdentifier == (NSString *)v5[9] || -[NSString isEqual:](typeIdentifier, "isEqual:"))
          {
            bookmarkData = self->_bookmarkData;
            if (bookmarkData == (NSData *)v5[5] || -[NSData isEqual:](bookmarkData, "isEqual:")) {
              BOOL v11 = 1;
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  uint64_t v4 = [(NSData *)self->_bookmarkData hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_filename hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSURL *)self->_fileURL hash];
  return v6 ^ [(NSString *)self->_typeIdentifier hash];
}

- (BOOL)_isFileURLBased
{
  return self->_fileURL != 0;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_fileURL
    && [(INFile *)self _isMarkedForDeletionOnDeallocation]
    && [(INFile *)self _hasAssociatedAuditToken])
  {
    uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = v3;
    if (v3) {
      objc_msgSend(v3, "if_auditToken");
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    BOOL v5 = [(INFile *)self _associatedAuditTokenIsEqualToAuditToken:v17];

    if (v5)
    {
      uint64_t v6 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        fileURL = self->_fileURL;
        uint64_t v12 = v6;
        uint64_t v13 = [(NSURL *)fileURL absoluteString];
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[INFile dealloc]";
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        _os_log_debug_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_DEBUG, "%s Deleting file on deallocation: %@", buf, 0x16u);
      }
      uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      $115C4C562B26FF47E01F9F4EA65B5887 v8 = self->_fileURL;
      id v16 = 0;
      [v7 removeItemAtURL:v8 error:&v16];
      id v9 = v16;

      if (v9)
      {
        long long v10 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          id v14 = self->_fileURL;
          *(_DWORD *)buf = 136315650;
          uint64_t v19 = "-[INFile dealloc]";
          __int16 v20 = 2112;
          uint64_t v21 = v14;
          __int16 v22 = 2112;
          id v23 = v9;
          _os_log_error_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_ERROR, "%s Error deleting file at URL: %@. Error: %@", buf, 0x20u);
        }
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)INFile;
  [(INFile *)&v15 dealloc];
}

- (id)_initWithBookmarkData:(id)a3 filename:(id)a4 typeIdentifier:(id)a5 removedOnCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INFile;
  id v14 = [(INFile *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    bookmarkData = v14->_bookmarkData;
    v14->_bookmarkData = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    filename = v14->_filename;
    v14->_filename = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    typeIdentifier = v14->_typeIdentifier;
    v14->_typeIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_removedOnCompletionValue, a6);
  }

  return v14;
}

- (id)_initWithData:(id)a3 filename:(id)a4 fileURL:(id)a5 typeIdentifier:(id)a6 removedOnCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)INFile;
  uint64_t v17 = [(INFile *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    uint64_t data = v17->_data;
    v17->_uint64_t data = (NSData *)v18;

    uint64_t v20 = [v13 copy];
    filename = v17->_filename;
    v17->_filename = (NSString *)v20;

    objc_storeStrong((id *)&v17->_fileURL, a5);
    uint64_t v22 = [v15 copy];
    typeIdentifier = v17->_typeIdentifier;
    v17->_typeIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v17->_removedOnCompletionValue, a7);
  }

  return v17;
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  id v4 = [NSNumber numberWithBool:removedOnCompletion];
  [(INFile *)self _setRemovedOnCompletionValue:v4];
}

- (BOOL)removedOnCompletion
{
  v2 = [(INFile *)self _removedOnCompletionValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSURL)fileURL
{
  fileURL = self->_fileURL;
  if (fileURL)
  {
    char v3 = fileURL;
  }
  else
  {
    p_bookmarkData = (id *)&self->_bookmarkData;
    if (self->_bookmarkData)
    {
      BOOL v5 = _INVCVoiceShortcutClient();
      id v6 = *p_bookmarkData;
      id v12 = 0;
      id v13 = 0;
      uint64_t v7 = [v5 resolveBookmarkData:v6 updatedData:&v13 error:&v12];
      id v8 = v13;
      id v9 = v13;
      id v10 = v12;
      char v3 = [v7 url];

      if (v9) {
        objc_storeStrong(p_bookmarkData, v8);
      }
    }
    else
    {
      char v3 = 0;
    }
  }

  return v3;
}

- (NSString)filename
{
  filename = self->_filename;
  if (filename)
  {
    char v3 = filename;
  }
  else
  {
    char v3 = [(NSURL *)self->_fileURL lastPathComponent];
  }

  return v3;
}

- (NSData)data
{
  uint64_t data = self->_data;
  if (!data)
  {
    uint64_t data = self->_memoryMappedFileData;
    if (!data)
    {
      fileURL = self->_fileURL;
      if (fileURL)
      {
        [(NSURL *)fileURL startAccessingSecurityScopedResource];
        BOOL v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:self->_fileURL options:8 error:0];
        memoryMappedFileData = self->_memoryMappedFileData;
        self->_memoryMappedFileData = v5;

        [(NSURL *)self->_fileURL stopAccessingSecurityScopedResource];
        uint64_t data = self->_memoryMappedFileData;
      }
      else
      {
        uint64_t data = 0;
      }
    }
  }
  uint64_t v7 = data;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INFile)fileWithFileURL:(NSURL *)fileURL filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier
{
  uint64_t v7 = typeIdentifier;
  id v8 = filename;
  id v9 = fileURL;
  id v10 = [[INFile alloc] _initWithData:0 filename:v8 fileURL:v9 typeIdentifier:v7 removedOnCompletion:0];

  return (INFile *)v10;
}

+ (INFile)fileWithData:(NSData *)data filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier
{
  uint64_t v7 = typeIdentifier;
  id v8 = filename;
  id v9 = data;
  id v10 = [[INFile alloc] _initWithData:v9 filename:v8 fileURL:0 typeIdentifier:v7 removedOnCompletion:0];

  return (INFile *)v10;
}

@end