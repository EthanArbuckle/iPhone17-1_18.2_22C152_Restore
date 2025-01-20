@interface CKMediaObjectExportManager
+ (id)_serialBackgroundQueue;
- (BOOL)ignoreSyndicationIdentifiers;
- (BOOL)queuedMediaObjectsArePhotosCompatible;
- (CKMediaObjectExportManager)initWithMediaObject:(id)a3;
- (CKMediaObjectExportManager)initWithMediaObjects:(id)a3;
- (NSArray)queuedMediaObjects;
- (NSString)metricsSource;
- (id)_phAssetCreationRequestForMediaObject:(id)a3 withSyndicationIdentifier:(id)a4;
- (void)dequeueMediaObject:(id)a3;
- (void)exportMediaObject:(id)a3 completion:(id)a4;
- (void)exportMediaObject:(id)a3 withFileName:(id)a4 completion:(id)a5;
- (void)exportMediaObjects:(id)a3 completion:(id)a4;
- (void)exportMediaObjects:(id)a3 withFileNames:(id)a4 completion:(id)a5;
- (void)exportQueuedMediaObjectsWithCompletion:(id)a3;
- (void)queueMediaObject:(id)a3;
- (void)setIgnoreSyndicationIdentifiers:(BOOL)a3;
- (void)setMetricsSource:(id)a3;
- (void)setQueuedMediaObjects:(id)a3;
- (void)setQueuedMediaObjectsArePhotosCompatible:(BOOL)a3;
@end

@implementation CKMediaObjectExportManager

+ (id)_serialBackgroundQueue
{
  if (_serialBackgroundQueue_onceToken != -1) {
    dispatch_once(&_serialBackgroundQueue_onceToken, &__block_literal_global_216);
  }
  v2 = (void *)_serialBackgroundQueue_queue;

  return v2;
}

void __52__CKMediaObjectExportManager__serialBackgroundQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.messages.CKMediaObjectExportManager", v2);
  v1 = (void *)_serialBackgroundQueue_queue;
  _serialBackgroundQueue_queue = (uint64_t)v0;
}

- (CKMediaObjectExportManager)initWithMediaObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v9 count:1];
  }
  else
  {
    v6 = 0;
  }
  v7 = -[CKMediaObjectExportManager initWithMediaObjects:](self, "initWithMediaObjects:", v6, v9, v10);

  return v7;
}

- (CKMediaObjectExportManager)initWithMediaObjects:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMediaObjectExportManager;
  v6 = [(CKMediaObjectExportManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queuedMediaObjects, a3);
  }

  return v7;
}

- (void)queueMediaObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(CKMediaObjectExportManager *)self queuedMediaObjects];
    id v5 = [v6 arrayByAddingObject:v4];

    [(CKMediaObjectExportManager *)self setQueuedMediaObjects:v5];
  }
}

- (void)dequeueMediaObject:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CKMediaObjectExportManager *)self queuedMediaObjects];
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

    v7 = [v5 arrayByExcludingObjectsInArray:v6];
    [(CKMediaObjectExportManager *)self setQueuedMediaObjects:v7];
  }
}

- (void)exportQueuedMediaObjectsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectExportManager *)self queuedMediaObjects];
  [(CKMediaObjectExportManager *)self exportMediaObjects:v5 completion:v4];
}

- (void)exportMediaObject:(id)a3 completion:(id)a4
{
}

- (void)exportMediaObject:(id)a3 withFileName:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    if (v9)
    {
      v17[0] = v9;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
    else
    {
      v12 = 0;
    }
    id v16 = v8;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [(CKMediaObjectExportManager *)self exportMediaObjects:v14 withFileNames:v12 completion:v11];
  }
  else if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Failed to export media object because the given media object was nil.", v15, 2u);
      }
    }
    v11[2](v11, 0, 0);
  }
}

- (void)exportMediaObjects:(id)a3 completion:(id)a4
{
}

- (void)exportMediaObjects:(id)a3 withFileNames:(id)a4 completion:(id)a5
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v61 = a4;
  id v64 = a5;
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v104 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        if ([v13 isPhotosCompatible])
        {
          [v68 addObject:v13];
          if ([v13 mediaType] == 3)
          {
            ++v9;
          }
          else if ([v13 mediaType] == 2)
          {
            ++v8;
          }
        }
        else
        {
          [v70 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
    }
    while (v10);
  }

  group = dispatch_group_create();
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 1;
  uint64_t v93 = 0;
  v94 = (id *)&v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__60;
  v97 = __Block_byref_object_dispose__60;
  id v98 = 0;
  uint64_t v14 = [v68 count];
  v15 = &off_18F81A000;
  if (v14)
  {
    dispatch_group_enter(group);
    id v16 = [MEMORY[0x1E4F29128] UUID];
    v66 = [v16 UUIDString];

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v18 = v68;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v89 objects:v109 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v90 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v89 + 1) + 8 * j);
          id v23 = [v22 syndicationIdentifier];
          if (!v23)
          {
            v24 = IMLogHandleForCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v108 = v22;
              _os_log_error_impl(&dword_18EF18000, v24, OS_LOG_TYPE_ERROR, "Syndication identifier was nil for media object. mediaObject: %@", buf, 0xCu);
            }

            id v23 = v66;
          }
          [v17 addObject:v23];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v89 objects:v109 count:16];
      }
      while (v19);
    }

    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v108 = v17;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Saving media objects with syndication identifiers to photo library %@", buf, 0xCu);
      }
    }
    uint64_t v26 = [v18 count];
    v27 = [(id)objc_opt_class() _serialBackgroundQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke;
    block[3] = &unk_1E562AF90;
    id v79 = v18;
    id v80 = v17;
    id v81 = v66;
    v82 = self;
    uint64_t v86 = v26;
    uint64_t v87 = v9;
    uint64_t v88 = v8;
    v84 = &v99;
    v85 = &v93;
    v83 = group;
    id v28 = v66;
    id v29 = v17;
    dispatch_async(v27, block);

    v15 = &off_18F81A000;
  }
  unint64_t v30 = 0;
  uint64_t v31 = *((void *)v15 + 245);
  while (v30 < [v70 count])
  {
    v32 = [v70 objectAtIndex:v30];
    dispatch_group_enter(group);
    objc_opt_class();
    unint64_t v67 = v30;
    if (objc_opt_isKindOfClass())
    {
      v33 = [v32 fileURL];
      v34 = [v33 lastPathComponent];
      v35 = [v34 stringByDeletingPathExtension];

      id v36 = v32;
      if ([v36 isAudioMessage])
      {
        if ([v36 isFromMe])
        {
          v37 = CKFrameworkBundle();
          id v38 = [v37 localizedStringForKey:@"AUDIO_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
        }
        else
        {
          v37 = [v36 senderHandle];
          v48 = NSString;
          v49 = CKFrameworkBundle();
          v50 = [v49 localizedStringForKey:@"AUDIO_MESSAGE_FROM" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v51 = [v37 fullName];
          v63 = objc_msgSend(v48, "stringWithFormat:", v50, v51);

          v52 = [MEMORY[0x1E4F42738] sharedApplication];
          BOOL v53 = [v52 userInterfaceLayoutDirection] == 1;

          if (v53) {
            v54 = @"\u200F";
          }
          else {
            v54 = @"\u200E";
          }
          id v38 = [(__CFString *)v54 stringByAppendingString:v63];
        }
      }
      else
      {
        id v38 = v35;
      }
      v55 = (void *)MEMORY[0x1E4FB4248];
      v56 = [MEMORY[0x1E4F1C9C8] date];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = v31;
      v76[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_70;
      v76[3] = &unk_1E5626760;
      id v77 = v64;
      [v55 importRecordingWithSourceAudioURL:v33 name:v38 date:v56 completionHandler:v76];

      goto LABEL_55;
    }
    if (!CKIsRunningInMacCatalyst()) {
      goto LABEL_56;
    }
    v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    v39 = [v32 transfer];
    id v36 = [v39 filename];

    if ([v36 length])
    {
      v40 = [v32 transfer];
      v41 = [v40 fileURL];
      v42 = [v41 path];

      v43 = [v33 URLsForDirectory:15 inDomains:1];
      v44 = [v43 firstObject];

      v45 = [v44 URLByAppendingPathComponent:v36];
      v46 = [v45 path];

      if ([v33 fileExistsAtPath:v46])
      {
        id v47 = [v46 uniqueSavePath];
      }
      else
      {
        id v47 = v46;
      }
      v58 = v47;
      id v75 = 0;
      char v59 = [v33 copyItemAtPath:v42 toPath:v47 error:&v75];
      id v38 = v75;

      if (v59) {
        goto LABEL_54;
      }
    }
    else
    {
      v57 = IMLogHandleForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v108 = v32;
        _os_log_error_impl(&dword_18EF18000, v57, OS_LOG_TYPE_ERROR, "Transfer filename was empty for mediaObject: %@", buf, 0xCu);
      }

      id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CKFileTransferErrorDomain" code:0 userInfo:0];
    }
    *((unsigned char *)v100 + 24) = 0;
    objc_storeStrong(v94 + 5, v38);
LABEL_54:
    dispatch_group_leave(group);
LABEL_55:

LABEL_56:
    unint64_t v30 = v67 + 1;
  }
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = v31;
  v71[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_74;
  v71[3] = &unk_1E562AFB8;
  id v72 = v64;
  v73 = &v99;
  v74 = &v93;
  id v60 = v64;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], v71);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
}

void __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_2;
  v15[3] = &unk_1E5621088;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v18 = v3;
  uint64_t v19 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_3;
  v9[3] = &unk_1E562AF68;
  v9[4] = v4;
  long long v13 = *(_OWORD *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 104);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 80);
  id v10 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = (id)v8;
  long long v11 = v8;
  [v2 performChanges:v15 completionHandler:v9];
}

unint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_2(id *a1)
{
  unint64_t result = [a1[4] count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v4 = [a1[4] objectAtIndex:i];
      id v5 = [a1[5] objectAtIndex:i];
      if ([a1[6] isEqualToString:v5])
      {

        id v5 = 0;
      }
      id v6 = (id)[a1[7] _phAssetCreationRequestForMediaObject:v4 withSyndicationIdentifier:v5];

      unint64_t result = [a1[4] count];
    }
  }
  return result;
}

void __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = @"NO";
      if (a2) {
        id v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v25 = v7;
      __int16 v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "CKImageMediaObject PHAssetChangeRequest performed changes. success: %@, error %@", buf, 0x16u);
    }
  }
  int v8 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Successfully saved media objects to photo library.", buf, 2u);
      }
    }
    id v10 = [MEMORY[0x1E4F6E890] sharedInstance];
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "metricsSource", *MEMORY[0x1E4F6DB58]);
    uint64_t v12 = (void *)v11;
    uint64_t v13 = *MEMORY[0x1E4F6DB90];
    if (v11) {
      uint64_t v13 = v11;
    }
    v23[0] = v13;
    v22[1] = *MEMORY[0x1E4F6DB30];
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    v23[1] = v14;
    v22[2] = *MEMORY[0x1E4F6DB38];
    v15 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
    v23[2] = v15;
    v22[3] = *MEMORY[0x1E4F6DB98];
    id v16 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
    v23[3] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
    [v10 trackEvent:*MEMORY[0x1E4F6DB28] withDictionary:v17];

    id v18 = [MEMORY[0x1E4F6BD68] sharedInstance];
    [v18 cacheCompletedSaveForSyndicationIdentifiers:*(void *)(a1 + 40)];
  }
  else
  {
    if (v8)
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "CKMediaObjectExportManager Failed to save media objects to photo library. error: %@", buf, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
    v21 = v5;
    id v18 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

uint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_74(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (id)_phAssetCreationRequestForMediaObject:(id)a3 withSyndicationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isPhotosCompatible])
  {
    int v8 = [v6 fileURL];
    if (v7 && ![(CKMediaObjectExportManager *)self ignoreSyndicationIdentifiers])
    {
      uint64_t v9 = [MEMORY[0x1E4F38F28] creationRequestForAssetWithSyndicationIdentifier:v7];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
    }
    id v10 = (void *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 addResourceWithType:2 fileURL:v8 options:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 addResourceWithType:1 fileURL:v8 options:0];
        id v11 = v6;
        if ([v11 isIrisAsset])
        {
          uint64_t v12 = [v11 calculateIrisVideoPath];
          uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
          [v10 addResourceWithType:9 fileURL:v13 options:0];
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSArray)queuedMediaObjects
{
  return self->_queuedMediaObjects;
}

- (void)setQueuedMediaObjects:(id)a3
{
}

- (NSString)metricsSource
{
  return self->_metricsSource;
}

- (void)setMetricsSource:(id)a3
{
}

- (BOOL)ignoreSyndicationIdentifiers
{
  return self->_ignoreSyndicationIdentifiers;
}

- (void)setIgnoreSyndicationIdentifiers:(BOOL)a3
{
  self->_ignoreSyndicationIdentifiers = a3;
}

- (BOOL)queuedMediaObjectsArePhotosCompatible
{
  return self->_queuedMediaObjectsArePhotosCompatible;
}

- (void)setQueuedMediaObjectsArePhotosCompatible:(BOOL)a3
{
  self->_queuedMediaObjectsArePhotosCompatible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSource, 0);

  objc_storeStrong((id *)&self->_queuedMediaObjects, 0);
}

@end