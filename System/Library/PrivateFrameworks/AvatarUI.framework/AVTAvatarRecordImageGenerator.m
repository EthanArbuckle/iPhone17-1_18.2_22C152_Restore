@interface AVTAvatarRecordImageGenerator
+ (id)supportedScopesForScale:(double)a3;
- (AVTAvatarConfigurationImageRenderer)renderer;
- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 coreEnvironment:(id)a4;
- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 renderer:(id)a4 environment:(id)a5;
- (AVTCoreModel)coreModel;
- (AVTImageStore)imageStore;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)generateThumbnailForAvatarRecordItem:(id)a3 avatarConfiguration:(id)a4 scope:(id)a5 error:(id *)a6;
- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5;
- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4;
- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5;
- (NSArray)scopes;
- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4;
@end

@implementation AVTAvatarRecordImageGenerator

+ (id)supportedScopesForScale:(double)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  v3 = +[AVTRenderingScope gridThumbnailScope];
  v4 = +[AVTRenderingScope listControllerThumbnailScope];
  v8[1] = v4;
  v5 = +[AVTRenderingScope funCamCarouselThumbnailScope];
  v8[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v6;
}

- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 renderer:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTAvatarRecordImageGenerator;
  v12 = [(AVTAvatarRecordImageGenerator *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageStore, a3);
    objc_storeStrong((id *)&v13->_renderer, a4);
    v14 = objc_opt_class();
    [v11 mainScreenScale];
    v15 = objc_msgSend(v14, "supportedScopesForScale:");
    uint64_t v16 = [v15 copy];
    scopes = v13->_scopes;
    v13->_scopes = (NSArray *)v16;

    uint64_t v18 = [v11 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v18;

    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (AVTAvatarRecordImageGenerator)initWithImageStore:(id)a3 coreEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarRecordImageGenerator;
  id v9 = [(AVTAvatarRecordImageGenerator *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageStore, a3);
    uint64_t v11 = [v8 logger];
    logger = v10->_logger;
    v10->_logger = (AVTUILogger *)v11;
  }
  return v10;
}

- (AVTCoreModel)coreModel
{
  v2 = [(AVTAvatarRecordImageGenerator *)self environment];
  v3 = [v2 editorCoreModel];

  return (AVTCoreModel *)v3;
}

- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(AVTAvatarRecordImageGenerator *)self coreModel];
  uint64_t v11 = +[AVTAvatarConfiguration configurationFromAvatar:v9 coreModel:v10];

  v12 = [AVTAvatarRecordCacheableResource alloc];
  v13 = [(AVTAvatarRecordImageGenerator *)self environment];
  objc_super v14 = [(AVTAvatarRecordCacheableResource *)v12 initWithAvatarRecord:v8 includeAvatarData:0 environment:v13];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v15 = [(AVTAvatarRecordImageGenerator *)self scopes];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecord_avatar_error___block_invoke;
  v20[3] = &unk_263FF0190;
  v23 = &v31;
  v20[4] = self;
  uint64_t v16 = v14;
  objc_super v21 = v16;
  id v17 = v11;
  id v22 = v17;
  v24 = &v25;
  [v15 enumerateObjectsUsingBlock:v20];

  int v18 = *((unsigned __int8 *)v32 + 24);
  if (a5 && !*((unsigned char *)v32 + 24)) {
    *a5 = (id) v26[5];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18 != 0;
}

void __80__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecord_avatar_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v6 generateThumbnailForAvatarRecordItem:v7 avatarConfiguration:v8 scope:a2 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v10;
  *a4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  objc_super v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke;
  v9[3] = &unk_263FF01B8;
  v9[5] = &v16;
  v9[6] = &v10;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  int v7 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((unsigned char *)v17 + 24)) {
    *a4 = (id) v11[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7 != 0;
}

void __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = (void *)MEMORY[0x263F29728];
  uint64_t v8 = [v6 avatarData];
  LOBYTE(v7) = [v7 canLoadAvatarWithData:v8];

  if (v7)
  {
    uint64_t v9 = [AVTAvatarRecordCacheableResource alloc];
    uint64_t v10 = [*(id *)(a1 + 32) environment];
    uint64_t v11 = [(AVTAvatarRecordCacheableResource *)v9 initWithAvatarRecord:v6 includeAvatarData:0 environment:v10];

    uint64_t v12 = [*(id *)(a1 + 32) coreModel];
    v13 = +[AVTAvatarConfiguration configurationForRecord:v6 coreModel:v12];

    objc_super v14 = [*(id *)(a1 + 32) scopes];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke_2;
    v20[3] = &unk_263FF0190;
    v20[4] = *(void *)(a1 + 32);
    objc_super v21 = v11;
    id v22 = v13;
    long long v23 = *(_OWORD *)(a1 + 40);
    id v15 = v13;
    uint64_t v16 = v11;
    [v14 enumerateObjectsUsingBlock:v20];

    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v17 = [MEMORY[0x263F29748] errorWithCode:702 userInfo:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    char v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *a4 = 1;
  }
}

void __74__AVTAvatarRecordImageGenerator_generateThumbnailsForAvatarRecords_error___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v6 generateThumbnailForAvatarRecordItem:v7 avatarConfiguration:v8 scope:a2 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v10;
  *a4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailForAvatarRecordItem:(id)a3 avatarConfiguration:(id)a4 scope:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = [(AVTAvatarRecordImageGenerator *)self logger];
  objc_super v14 = [v10 record];
  id v15 = [v14 identifier];
  uint64_t v16 = [v11 description];
  objc_msgSend(v13, "logGeneratingImageForRecord:scope:type:", v15, v16, objc_msgSend(v11, "renderingType"));

  uint64_t v17 = [(AVTAvatarRecordImageGenerator *)self renderer];

  if (!v17) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"I'm asked to render images but I did not get a renderer"];
  }
  uint64_t v18 = [(AVTAvatarRecordImageGenerator *)self renderer];
  char v19 = [v18 imageForAvatarConfiguration:v12 scope:v11];

  v20 = [(AVTAvatarRecordImageGenerator *)self imageStore];
  id v26 = 0;
  char v21 = [v20 saveImage:v19 forItem:v10 scope:v11 error:&v26];
  id v22 = v26;

  if ((v21 & 1) == 0)
  {
    if (a6) {
      *a6 = v22;
    }
    long long v23 = [(AVTAvatarRecordImageGenerator *)self logger];
    v24 = [v22 description];
    [v23 logGeneratingImageError:v24];
  }
  return v21;
}

- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  objc_super v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarRecordImageGenerator_deleteThumbnailsForAvatarRecordsWithIdentifiers_error___block_invoke;
  v9[3] = &unk_263FF01E0;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  int v7 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((unsigned char *)v17 + 24)) {
    *a4 = (id) v11[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7 != 0;
}

void __87__AVTAvatarRecordImageGenerator_deleteThumbnailsForAvatarRecordsWithIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:a2];
  int v7 = [*(id *)(a1 + 32) imageStore];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v7 deleteImagesForItemsWithPersistentIdentifierPrefix:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5
{
  id v8 = a3;
  char v9 = [a4 identifier];
  uint64_t v10 = +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:v9];

  id v11 = [v8 identifier];

  uint64_t v12 = +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:v11];

  v13 = [(AVTAvatarRecordImageGenerator *)self imageStore];
  LOBYTE(a5) = [v13 copyImagesForPersistentIdentifierPrefix:v10 toPersistentIdentifierPrefix:v12 error:a5];

  return (char)a5;
}

- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke;
  v22[3] = &unk_263FF0228;
  v22[4] = self;
  id v9 = v8;
  id v23 = v9;
  uint64_t v10 = (void *)MEMORY[0x210530210](v22);
  id v11 = [(AVTAvatarRecordImageGenerator *)self logger];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_3;
  v16[3] = &unk_263FF0250;
  id v17 = v6;
  uint64_t v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v10;
  id v15 = v6;
  [v11 updatingThumbnailsForRemoteChanges:v16];
}

uint64_t __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = objc_msgSend(v3, "avt_map:", &__block_literal_global);
  v5 = *(void **)(a1 + 32);
  id v23 = 0;
  uint64_t v6 = [v5 deleteThumbnailsForAvatarRecordsWithIdentifiers:v4 error:&v23];
  id v7 = v23;
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v18 = v7;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (![v13 changeType])
          {
            id v14 = *(void **)(a1 + 40);
            id v15 = [v13 recordIdentifier];
            [v14 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
      id v7 = v18;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) logger];
    uint64_t v16 = [v7 description];
    [v8 logErrorDeletingSomeThumbnail:v16];
  }
  return v6;
}

uint64_t __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recordIdentifier];
}

void __86__AVTAvatarRecordImageGenerator_updateThumbnailsForChangesWithTracker_recordProvider___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) imageStore];
  v4 = [v3 location];
  uint64_t v5 = *(void *)(a1 + 56);
  id v24 = 0;
  char v6 = [v2 processChangeTransactionsWithChangeTokenLocation:v4 handler:v5 error:&v24];
  id v7 = v24;

  if ((v6 & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) logger];
    uint64_t v9 = [v7 description];
    [v8 logErrorProcessingChangeTransactionsToUpdateThumbnails:v9];
  }
  uint64_t v10 = [*(id *)(a1 + 40) renderer];

  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
          id v17 = (void *)v16;
          if (v16)
          {
            id v18 = *(void **)(a1 + 40);
            uint64_t v25 = v16;
            long long v19 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v25, 1, (void)v20);
            [v18 generateThumbnailsForAvatarRecords:v19 error:0];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  return self->_renderer;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
}

@end