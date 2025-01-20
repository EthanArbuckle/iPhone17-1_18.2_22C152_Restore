@interface CKMediaObjectManager
+ (id)sharedInstance;
- (BOOL)_attachmentDataTooLargeToSend:(id)a3 utiType:(id)a4;
- (CKMediaObjectManager)init;
- (Class)classForFilename:(id)a3;
- (Class)classForUTIType:(id)a3;
- (Class)transferClass;
- (NSArray)classes;
- (NSDictionary)UTITypes;
- (NSDictionary)dynTypes;
- (NSMutableDictionary)transfers;
- (id)UTITypeForExtension:(id)a3;
- (id)UTITypeForFilename:(id)a3;
- (id)allUTITypes;
- (id)fileManager;
- (id)mediaObjectWithData:(id)a3 UTIType:(id)a4 filename:(id)a5 transcoderUserInfo:(id)a6;
- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 attributionInfo:(id)a7 adaptiveImageGlyphContentIdentifier:(id)a8 adaptiveImageGlyphContentDescription:(id)a9 hideAttachment:(BOOL)a10 isScreenshot:(BOOL)a11;
- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5;
- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 attributionInfo:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8 hideAttachment:(BOOL)a9;
- (id)mediaObjectWithSticker:(id)a3 stickerUserInfo:(id)a4;
- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4;
- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4 chatContext:(id)a5;
- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9;
- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6;
- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6 isScreenshot:(BOOL)a7 stickerEffectType:(unint64_t)a8;
- (id)transferWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8;
- (id)transferWithTransferGUID:(id)a3 imMessage:(id)a4;
- (void)_copyResolvedFileURL:(id)a3 toURL:(id)a4;
- (void)_previewGenerationFailedNotification:(id)a3;
- (void)_previewGenerationSucceededNotification:(id)a3;
- (void)dealloc;
- (void)setClasses:(id)a3;
- (void)setDynTypes:(id)a3;
- (void)setTransfers:(id)a3;
- (void)setUTITypes:(id)a3;
- (void)transferRemoved:(id)a3;
@end

@implementation CKMediaObjectManager

Class __28__CKMediaObjectManager_init__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1) {
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_82_1);
  }
  v2 = (void *)sharedInstance_sMediaObjectManager;

  return v2;
}

void __38__CKMediaObjectManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKMediaObjectManager);
  v1 = (void *)sharedInstance_sMediaObjectManager;
  sharedInstance_sMediaObjectManager = (uint64_t)v0;
}

- (CKMediaObjectManager)init
{
  v65[14] = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)CKMediaObjectManager;
  v2 = [(CKMediaObjectManager *)&v62 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMediaObjectManager *)v2 setTransfers:v3];
    v4 = (void *)MEMORY[0x1E4F1CA48];
    v65[0] = objc_opt_class();
    v65[1] = objc_opt_class();
    v65[2] = objc_opt_class();
    v65[3] = objc_opt_class();
    v65[4] = objc_opt_class();
    v65[5] = objc_opt_class();
    v65[6] = objc_opt_class();
    v65[7] = objc_opt_class();
    v65[8] = objc_opt_class();
    v65[9] = objc_opt_class();
    v65[10] = objc_opt_class();
    v65[11] = objc_opt_class();
    v65[12] = objc_opt_class();
    v65[13] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:14];
    v6 = [v4 arrayWithArray:v5];

    +[CKPassPreviewMediaObject isSupported];
    [v6 insertObject:objc_opt_class() atIndex:0];
    [v6 insertObject:objc_opt_class() atIndex:0];
    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v8 = [v7 objectForKey:@"kCKMediaObjectManagerDefaultsClasses"];
    v9 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_233);

    v10 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v11 = [v10 buildVersion];

    v12 = [v7 objectForKey:@"kCKMediaObjectManagerDefaultsOSVersion"];
    v49 = v9;
    v50 = v6;
    v47 = v12;
    v48 = (void *)v11;
    if [v9 isEqual:v6] && (objc_msgSend(v12, "isEqualToString:", v11))
    {
      [(CKMediaObjectManager *)v2 setClasses:v9];
      v13 = v7;
      v14 = [v7 objectForKey:@"kCKMediaObjectManagerDefaultsUTITypes"];
      id v15 = (id)[v14 mutableCopy];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v16 = [v15 allKeys];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            v22 = [v15 objectForKey:v21];
            Class v23 = NSClassFromString(v22);
            if (v23) {
              [v15 setObject:v23 forKey:v21];
            }
            else {
              [v15 removeObjectForKey:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v63 count:16];
        }
        while (v18);
      }

      v24 = v13;
      v25 = [v13 objectForKey:@"kCKMediaObjectManagerDefaultsDynTypes"];
      id v26 = (id)[v25 mutableCopy];

      [(CKMediaObjectManager *)v2 setUTITypes:v15];
      [(CKMediaObjectManager *)v2 setDynTypes:v26];
      v27 = v50;
      v28 = v48;
    }
    else
    {
      v45 = v7;
      id v46 = v3;
      [(CKMediaObjectManager *)v2 setClasses:v6, @"kCKMediaObjectManagerDefaultsOSVersion"];
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __28__CKMediaObjectManager_init__block_invoke_2;
      v59[3] = &unk_1E562BB48;
      id v15 = v29;
      id v60 = v15;
      id v26 = v30;
      id v61 = v26;
      [v6 enumerateObjectsUsingBlock:v59];
      [(CKMediaObjectManager *)v2 setUTITypes:v15];
      [(CKMediaObjectManager *)v2 setDynTypes:v26];
      v31 = (void *)[v15 mutableCopy];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v32 = [v31 allKeys];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v56 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            v38 = NSStringFromClass((Class)(id)[v31 objectForKey:v37]);
            [v31 setObject:v38 forKey:v37];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v55 objects:v64 count:16];
        }
        while (v34);
      }

      v27 = v50;
      v39 = objc_msgSend(v50, "__imArrayByApplyingBlock:", &__block_literal_global_73_0);
      v24 = v45;
      [v45 setObject:v31 forKey:@"kCKMediaObjectManagerDefaultsUTITypes"];
      [v45 setObject:v26 forKey:@"kCKMediaObjectManagerDefaultsDynTypes"];
      v28 = v48;
      [v45 setObject:v48 forKey:v44];
      [v45 setObject:v39 forKey:@"kCKMediaObjectManagerDefaultsClasses"];

      id v3 = v46;
    }

    v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v2 selector:sel_transferRemoved_ name:@"CKFileTransferRemovedNotification" object:0];

    v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:v2 selector:sel__previewGenerationSucceededNotification_ name:*MEMORY[0x1E4F6EBB8] object:0];

    v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 addObserver:v2 selector:sel__previewGenerationFailedNotification_ name:*MEMORY[0x1E4F6EBB0] object:0];
  }
  return v2;
}

- (void)setUTITypes:(id)a3
{
}

- (void)setTransfers:(id)a3
{
}

- (void)setDynTypes:(id)a3
{
}

- (void)setClasses:(id)a3
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKMediaObjectManager;
  [(CKMediaObjectManager *)&v4 dealloc];
}

void __28__CKMediaObjectManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v4 = [a2 UTITypes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CKMediaObjectManager_init__block_invoke_3;
  v5[3] = &unk_1E562BB20;
  id v6 = *(id *)(a1 + 32);
  v8 = a2;
  id v7 = *(id *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __28__CKMediaObjectManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = [*(id *)(a1 + 32) objectForKey:v13];
    NSLog(&cfstr_CanTRegisterUt.isa, v13, v4, v5);
  }
  else
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKey:v13];
  }
  int v6 = [v13 hasPrefix:@"dyn."];
  id v7 = v13;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v13];
    v9 = [v8 preferredFilenameExtension];
    v10 = [v9 lowercaseString];

    uint64_t v11 = [*(id *)(a1 + 40) objectForKey:v10];

    if (v11)
    {
      v12 = [*(id *)(a1 + 40) objectForKey:v10];
      NSLog(&cfstr_CanTRegisterEx.isa, v10, v13, v12);
    }
    if (v10) {
      [*(id *)(a1 + 40) setObject:v13 forKey:v10];
    }
    else {
      NSLog(&cfstr_CanTRegisterNi.isa, v13);
    }

    id v7 = v13;
  }
}

NSString *__28__CKMediaObjectManager_init__block_invoke_4(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (id)UTITypeForExtension:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [v4 lowercaseString];
    int v6 = [(CKMediaObjectManager *)self dynTypes];
    id PreferredIdentifierForTag = [v6 objectForKey:v5];

    if (!PreferredIdentifierForTag)
    {
      IMLookUpExtensionInCache();
      id PreferredIdentifierForTag = (id)objc_claimAutoreleasedReturnValue();
      if (!PreferredIdentifierForTag) {
        id PreferredIdentifierForTag = (id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v5, 0);
      }
    }
  }
  else
  {
    id PreferredIdentifierForTag = (id)*MEMORY[0x1E4F22588];
  }

  return PreferredIdentifierForTag;
}

- (id)UTITypeForFilename:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    IMAttachmentFileNameAndExtension();
    id v5 = 0;
    int v6 = [(CKMediaObjectManager *)self UTITypeForExtension:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)allUTITypes
{
  v11[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(CKMediaObjectManager *)self UTITypes];
  id v5 = [v4 allKeys];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = *MEMORY[0x1E4F22570];
  v11[0] = *MEMORY[0x1E4F22588];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F225E8];
  v11[2] = *MEMORY[0x1E4F226A8];
  v11[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F226F0];
  v11[4] = *MEMORY[0x1E4F226F8];
  v11[5] = v8;
  v11[6] = @"com.apple.messages.maputi";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];
  [v3 addObjectsFromArray:v9];

  return v3;
}

- (Class)classForUTIType:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObjectManager *)self UTITypes];
  id v6 = (id)[v5 objectForKey:v4];

  if (!v6) {
    id v6 = (id)objc_opt_class();
  }
  uint64_t v7 = (objc_class *)v6;

  return v7;
}

- (Class)classForFilename:(id)a3
{
  id v4 = [(CKMediaObjectManager *)self UTITypeForFilename:a3];
  id v5 = [(CKMediaObjectManager *)self classForUTIType:v4];

  return v5;
}

- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4
{
  return [(CKMediaObjectManager *)self mediaObjectWithTransferGUID:a3 imMessage:a4 chatContext:0];
}

- (id)mediaObjectWithTransferGUID:(id)a3 imMessage:(id)a4 chatContext:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  v10 = [(CKMediaObjectManager *)self transfers];
  uint64_t v11 = [v10 objectForKey:v8];

  if (!v11)
  {
    uint64_t v11 = [(CKMediaObjectManager *)self transferWithTransferGUID:v8 imMessage:v9];
    if (v11)
    {
      if ([v8 length])
      {
        uint64_t v17 = [(CKMediaObjectManager *)self transfers];
        [v17 setObject:v11 forKey:v8];
      }
    }
  }
  v12 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  id v13 = [v12 transferForGUID:v8];

  if (v13)
  {
    v14 = [v13 filename];
    int v15 = [v13 isSticker];
    v16 = v13;
  }
  else
  {
    v14 = [v11 filename];
    int v15 = [v11 isSticker];
    v16 = v11;
  }
  char v18 = [v16 isAdaptiveImageGlyph];
  uint64_t v19 = [(CKMediaObjectManager *)self classForFilename:v14];
  if ((v18 & 1) != 0
    || (v20 = v19, v15)
    && (([(objc_class *)v19 isEqual:objc_opt_class()] & 1) != 0
     || [v20 isEqual:objc_opt_class()]))
  {
    v20 = objc_opt_class();
  }
  if ([v20 isEqual:objc_opt_class()])
  {
    if (([v11 fileIsAnimated] & 1) == 0)
    {
      uint64_t v21 = [(CKMediaObjectManager *)self UTITypeForFilename:v14];
      v22 = [(id)*MEMORY[0x1E4F443E0] identifier];
      int v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "UTI type was possibly animated, but it wasn't actually multi-frame.", buf, 2u);
          }
        }
        v20 = objc_opt_class();
      }
    }
  }
  v25 = objc_msgSend(v9, "__ck_context");
  id v26 = (void *)[v25 mutableCopy];

  if (([v9 isFromMe] & 1) == 0) {
    objc_msgSend(v26, "setSpam:", objc_msgSend(v34, "isSpam"));
  }
  [v26 setChatContext:v34];
  v27 = objc_msgSend(v9, "__ck_service");
  v28 = [v27 name];
  [v26 setServiceName:v28];

  id v29 = (void *)[objc_alloc((Class)v20) initWithTransfer:v11 context:v26 forceInlinePreview:0];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = [v11 guid];
      *(_DWORD *)buf = 138412546;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = v31;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_DEBUG, "Create mediaObject %@ for transfer %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v33 = [v11 guid];
    _CKLog();
  }

  return v29;
}

- (id)mediaObjectWithData:(id)a3 UTIType:(id)a4 filename:(id)a5 transcoderUserInfo:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    v14 = [v12 lastPathComponent];
    v16 = CKSafeFilename(v14, v15);
  }
  else
  {
    uint64_t v17 = [(CKMediaObjectManager *)self classForUTIType:v11];
    char v18 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, (CFStringRef)*MEMORY[0x1E4F224F8]);
    uint64_t v19 = [(objc_class *)v17 fallbackFilenamePrefix];
    v16 = CKAttachmentFallbackFilename(v19, v18);
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v16;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_DEBUG, "No filename. Generated filename: %@.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v32 = v16;
      _CKLog();
    }
  }
  if (-[CKMediaObjectManager _attachmentDataTooLargeToSend:utiType:](self, "_attachmentDataTooLargeToSend:utiType:", v10, v11, v32))
  {
    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 postNotificationName:@"CKTransferFileTooLargeNotification" object:0 userInfo:0];

LABEL_13:
    v22 = 0;
    goto LABEL_23;
  }
  if (![v10 length])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v16;
        __int16 v37 = 2112;
        v38 = v11;
        _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "No data for media %@ of type %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    goto LABEL_13;
  }
  int v23 = CKAttachmentTmpFileURL(v16);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v23;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_DEBUG, "Write media data to %@ for transfer.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v33 = v23;
    _CKLog();
  }
  v25 = [(CKMediaObjectManager *)self fileManager];
  id v26 = [v23 URLByDeletingLastPathComponent];
  [v25 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:0];

  CKFreeSpaceWriteDataToURL(v10, v23, 1);
  LOBYTE(v34) = IMIsImageURLAScreenshot();
  v27 = [(CKMediaObjectManager *)self transferWithFileURL:v23 transcoderUserInfo:v13 attributionInfo:0 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:0 isScreenshot:v34];
  v28 = [v27 guid];
  id v29 = [(CKMediaObjectManager *)self transfers];
  [v29 setObject:v27 forKey:v28];

  v22 = [(CKMediaObjectManager *)self mediaObjectWithTransferGUID:v28 imMessage:0];

LABEL_23:

  return v22;
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5
{
  LOBYTE(v6) = 0;
  return [(CKMediaObjectManager *)self mediaObjectWithFileURL:a3 filename:a4 transcoderUserInfo:a5 attributionInfo:0 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:v6];
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 attributionInfo:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8 hideAttachment:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[CKMediaObjectManager mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", a3, a4, 0, a5, a6, a7, a8, v10);
}

- (id)mediaObjectWithFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 attributionInfo:(id)a7 adaptiveImageGlyphContentIdentifier:(id)a8 adaptiveImageGlyphContentDescription:(id)a9 hideAttachment:(BOOL)a10 isScreenshot:(BOOL)a11
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v46 = a6;
  id v47 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v17)
  {
    uint64_t v21 = [(CKMediaObjectManager *)self fileManager];
    if (v18)
    {
      v22 = [v18 lastPathComponent];
      uint64_t v24 = CKSafeFilename(v22, v23);

      id v18 = (id)v24;
    }
    else
    {
      v27 = [v17 path];
      id v18 = [v27 lastPathComponent];

      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v18;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_DEBUG, "No filename given, extracting the filename %@ from fileURL.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        id v43 = v18;
        _CKLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        id v30 = [v17 URLByResolvingSymlinksInPath];
        *(_DWORD *)buf = 138412546;
        id v49 = v17;
        __int16 v50 = 2112;
        long long v51 = v30;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_DEBUG, "Resolving %@ to %@.", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      [v17 URLByResolvingSymlinksInPath];
      v45 = id v43 = v17;
      _CKLog();
    }
    if (!a5)
    {
      uint64_t v31 = [v17 URLByResolvingSymlinksInPath];

      id v17 = (id)v31;
    }
    v32 = objc_msgSend(v17, "path", v43, v45);
    int v33 = [v21 fileExistsAtPath:v32];

    if (v33)
    {
      uint64_t v34 = CKAttachmentTmpFileURL(v18);
      uint64_t v35 = [v34 path];
      char v36 = [v21 fileExistsAtPath:v35];

      if ((v36 & 1) == 0)
      {
        __int16 v37 = [v34 URLByDeletingLastPathComponent];
        [v21 createDirectoryAtURL:v37 withIntermediateDirectories:1 attributes:0 error:0];

        if (a5) {
          [(CKMediaObjectManager *)self _copyResolvedFileURL:v17 toURL:v34];
        }
        else {
          [v21 copyItemAtURL:v17 toURL:v34 error:0];
        }
      }
      LOBYTE(v44) = IMIsImageURLAScreenshot();
      uint64_t v39 = [(CKMediaObjectManager *)self transferWithFileURL:v34 transcoderUserInfo:v46 attributionInfo:v47 adaptiveImageGlyphContentIdentifier:v19 adaptiveImageGlyphContentDescription:v20 hideAttachment:a10 isScreenshot:v44];
      v40 = [v39 guid];
      v41 = [(CKMediaObjectManager *)self transfers];
      [v41 setObject:v39 forKey:v40];

      id v26 = [(CKMediaObjectManager *)self mediaObjectWithTransferGUID:v40 imMessage:0];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v17;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "No file for media at %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
      id v26 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_DEBUG, "fileURL is NIL can't create media object", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    id v26 = 0;
  }

  return v26;
}

- (void)_copyResolvedFileURL:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  id v6 = [a3 path];
  uint64_t v7 = (const char *)[v6 fileSystemRepresentation];

  id v8 = [v5 path];

  id v9 = v8;
  uint64_t v10 = (const char *)[v9 fileSystemRepresentation];

  int v11 = open(v7, 0x20000000);
  if (v11 == -1)
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager _copyResolvedFileURL:toURL:]();
    }
  }
  else
  {
    int v12 = v11;
    int v13 = open(v10, 514, 384);
    if (v13 == -1)
    {
      id v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObjectManager _copyResolvedFileURL:toURL:]();
      }
    }
    else
    {
      int v14 = v13;
      int v15 = fcopyfile(v12, v13, 0, 0xC0008u);
      if (v15 < 0)
      {
        int v16 = v15;
        id v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[CKMediaObjectManager _copyResolvedFileURL:toURL:](v16, v17);
        }
      }
      close(v14);
    }
    close(v12);
  }
}

- (id)mediaObjectWithSticker:(id)a3 stickerUserInfo:(id)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:](v8);
    }
    goto LABEL_11;
  }
  if (([v6 prepareToSend] & 1) == 0)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]7(v6);
    }
LABEL_11:
    int v14 = 0;
    goto LABEL_64;
  }
  id v8 = [v6 stickerGUID];
  v107 = [v6 stickerPackGUID];
  id v9 = (const void *)*MEMORY[0x1E4F6E398];
  uint64_t v10 = [v7 objectForKey:*MEMORY[0x1E4F6E398]];
  int v11 = [v6 recipe];
  int v12 = objc_msgSend(v11, "__imHexString");

  value = [v6 ballonBundleID];
  if (!v8 || ![v8 length])
  {
    int v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:](v6);
    }
    int v14 = 0;
    int v16 = v12;
    id v17 = value;
    goto LABEL_63;
  }
  int v101 = [v107 isEqualToString:@"com.apple.private.watchEmoji"];
  if (v7) {
    int v13 = [v7 mutableCopy];
  }
  else {
    int v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  int v15 = v13;
  int v16 = v12;
  uint64_t v18 = [v6 stickerEffectType];
  id v19 = [NSNumber numberWithInteger:v18];
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E390], v19);
  }

  id v20 = v107;
  if (v20)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E3B8], v20);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]6();
  }

  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, v9, v10);
  }
  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E388], value);
  }
  v103 = v10;
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E3C8], v12);
  }
  uint64_t v21 = [v6 representations];
  if (v21)
  {
    v22 = (void *)v21;
    int v23 = [v6 fileURL];

    if (!v23)
    {
      uint64_t v44 = [v6 representations];
      v45 = [v44 firstObject];

      id v46 = [v45 data];
      uint64_t v47 = [v46 length];

      CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)v45;
      if (v47)
      {
        v48 = [v45 data];
        id v49 = IMSharedHelperMD5OfData();

        if (v49 && [v49 length])
        {
          if ([v8 length])
          {
            v97 = v49;
            CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E3A8], v49);
            __int16 v50 = (void *)MEMORY[0x1E4F442D8];
            long long v51 = [v45 type];
            uint64_t v52 = [v50 typeWithIdentifier:v51];

            long long v54 = CKSafeFilename(v8, v53);
            v94 = (void *)v52;
            long long v55 = [v54 stringByAppendingPathExtensionForType:v52];

            long long v56 = v55;
            long long v57 = CKAttachmentTmpFileURL(v56);
            v99 = v56;

            long long v58 = [v57 path];
            v59 = [v58 stringByDeletingLastPathComponent];

            IMSharedHelperEnsureDirectoryExistsAtPath();
            id v60 = [(__CFDictionary *)theDict data];
            id v109 = 0;
            v95 = v57;
            LODWORD(v57) = [v60 writeToURL:v57 options:0x40000000 error:&v109];
            id v61 = v109;

            if (!v57 || v61)
            {
              v73 = IMLogHandleForCategory();
              uint64_t v10 = v103;
              id v43 = v95;
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]5();
              }

              int v14 = 0;
              id v8 = v99;
              goto LABEL_116;
            }

            uint64_t v10 = v103;
            id v8 = v99;
LABEL_76:
            if (v101)
            {
              CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)[v7 mutableCopy];
LABEL_92:
              id v8 = v8;
              if (v8)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E3A0], v8);
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.7();
              }

              if (!theDict) {
                CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              }
              v74 = [v6 accessibilityLabel];
              if (v74) {
                CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6D3C0], v74);
              }

              uint64_t v75 = [v6 adaptiveImageGlyphContentIdentifier];
              uint64_t v76 = [v6 adaptiveImageGlyphContentDescription];
              v77 = [v6 animatedImageCacheURLFromExtension];
              v97 = v75;
              v102 = (void *)v76;
              v78 = [(CKMediaObjectManager *)self transferWithStickerFileURL:v95 transferUserInfo:v15 attributionInfo:theDict animatedImageCacheURL:v77 adaptiveImageGlyphContentIdentifier:v75 adaptiveImageGlyphContentDescription:v76];

              v104 = v78;
              if (v78)
              {
                uint64_t v79 = [v78 guid];
                v80 = [(CKMediaObjectManager *)self transfers];
                [v80 setObject:v78 forKey:v79];

                int v14 = [(CKMediaObjectManager *)self mediaObjectWithTransferGUID:v79 imMessage:0];
                if (v14)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v14 setSticker:v6];
                  }
                  else
                  {
                    v83 = IMLogHandleForCategory();
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.6(v6);
                    }
                  }
                  v82 = [v6 cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly];
                  [v14 setAdaptiveImageGlyph:v82];
                  v84 = IMLogHandleForCategory();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v111 = v6;
                    _os_log_impl(&dword_18EF18000, v84, OS_LOG_TYPE_INFO, "Create media object for sticker: %@ OK", buf, 0xCu);
                  }

                  id v85 = v14;
                  id v43 = v95;
                }
                else
                {
                  v82 = IMLogHandleForCategory();
                  id v43 = v95;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
                    -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.5();
                  }
                }

                v81 = v79;
              }
              else
              {
                v81 = IMLogHandleForCategory();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  [v6 description];
                  v90 = v89 = v81;
                  *(_DWORD *)buf = 138413058;
                  id v111 = v90;
                  __int16 v112 = 2112;
                  id v43 = v95;
                  v113 = v95;
                  __int16 v114 = 2112;
                  v115 = v15;
                  __int16 v116 = 2112;
                  CFMutableDictionaryRef v117 = theDict;
                  _os_log_error_impl(&dword_18EF18000, v89, OS_LOG_TYPE_ERROR, "Failed to create file transfer for sticker: %@, tempFileURL: %@, transfer user info: %@, attribution info: %@", buf, 0x2Au);

                  v81 = v89;
                  int v14 = 0;
                }
                else
                {
                  int v14 = 0;
                  id v43 = v95;
                }
              }

LABEL_116:
              id v17 = value;
              v42 = v97;
              goto LABEL_61;
            }
            v100 = v8;
            v66 = [MEMORY[0x1E4F6BC18] sharedInstance];
            v67 = [v66 balloonPluginForBundleID:v20];

            if (v67)
            {
              v68 = [v67 attributionInfo];
              v69 = (__CFDictionary *)[v68 mutableCopy];

              v70 = [v6 attributionInfo];
              v71 = v70;
              CFMutableDictionaryRef theDict = v69;
              if (v69)
              {

                if (v71)
                {
LABEL_91:

                  id v8 = v100;
                  goto LABEL_92;
                }
                v72 = [(__CFDictionary *)v69 copy];
                [v6 setAttributionInfo:v72];
LABEL_90:

                goto LABEL_91;
              }
              uint64_t v86 = [v70 mutableCopy];

              CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)v86;
              if (v86) {
                goto LABEL_91;
              }
              v72 = IMLogHandleForCategory();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.9();
              }
            }
            else
            {
              v72 = IMLogHandleForCategory();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.8();
              }
            }
            CFMutableDictionaryRef theDict = 0;
            goto LABEL_90;
          }
          objc_super v62 = v49;
          v63 = IMLogHandleForCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]4(v6);
          }
        }
        else
        {
          objc_super v62 = v49;
          v63 = IMLogHandleForCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]3();
          }
        }
        uint64_t v10 = v103;
        goto LABEL_56;
      }
      v42 = IMLogHandleForCategory();
      uint64_t v10 = v103;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]2(v6);
      }
      id v43 = 0;
      int v14 = 0;
LABEL_60:
      id v17 = value;
      goto LABEL_61;
    }
  }
  id v98 = v20;
  uint64_t v24 = [v6 fileURL];
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)v24;
  if (!v24)
  {
    v42 = IMLogHandleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:](v6);
    }
    id v43 = 0;
    int v14 = 0;
    uint64_t v10 = v103;
    goto LABEL_60;
  }
  v25 = (void *)v24;
  id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  v27 = [v25 path];
  char v28 = [v26 fileExistsAtPath:v27];

  if ((v28 & 1) == 0)
  {
    v42 = IMLogHandleForCategory();
    uint64_t v10 = v103;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]1();
    }
    id v43 = 0;
    int v14 = 0;
    int v16 = v12;
    goto LABEL_60;
  }
  id v29 = [v25 path];
  id v30 = IMSharedHelperMD5HashOfFileAtPath();

  uint64_t v10 = v103;
  if (v30 && [v30 length])
  {
    v96 = v30;
    uint64_t v31 = [(__CFDictionary *)theDict path];
    v32 = [v31 lastPathComponent];

    if (v32)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, (const void *)*MEMORY[0x1E4F6E3A8], v30);
      uint64_t v34 = CKSafeFilename(v32, v33);

      v93 = v34;
      uint64_t v35 = CKAttachmentTmpFileURL(v34);
      char v36 = [v35 path];
      uint64_t v37 = [v36 stringByDeletingLastPathComponent];

      v91 = (void *)v37;
      IMSharedHelperEnsureDirectoryExistsAtPath();
      v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v39 = [v6 fileURL];
      id v108 = 0;
      v95 = v35;
      LODWORD(v36) = [v38 copyItemAtURL:v39 toURL:v35 error:&v108];
      v40 = v108;

      v92 = v40;
      if (!v36 || v40)
      {
        v65 = IMLogHandleForCategory();
        uint64_t v10 = v103;
        int v16 = v12;
        id v20 = v98;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          [v6 fileURL];
          v88 = v87 = v65;
          *(_DWORD *)buf = 138412802;
          id v111 = v88;
          __int16 v112 = 2112;
          v113 = v95;
          __int16 v114 = 2112;
          v115 = v92;
          _os_log_error_impl(&dword_18EF18000, v87, OS_LOG_TYPE_ERROR, "Could not copy sticker from %@ to %@ error %@", buf, 0x20u);

          v65 = v87;
        }

        int v41 = 1;
      }
      else
      {
        int v41 = 0;
        uint64_t v10 = v103;
        int v16 = v12;
        id v20 = v98;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v93 = uint64_t v10 = v103;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:]0(v6);
      }
      v95 = 0;
      int v41 = 1;
      int v16 = v12;
      id v20 = v98;
    }

    if (v41)
    {
      int v14 = 0;
      id v17 = value;
      id v43 = v95;
      goto LABEL_62;
    }
    goto LABEL_76;
  }
  objc_super v62 = v30;
  v63 = IMLogHandleForCategory();
  int v16 = v12;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
    -[CKMediaObjectManager mediaObjectWithSticker:stickerUserInfo:].cold.4();
  }
LABEL_56:

  int v14 = 0;
  id v17 = value;
  v42 = v62;
  id v43 = 0;
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:

  return v14;
}

- (id)transferWithTransferGUID:(id)a3 imMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithTransferGUID:imMessage:", v7, v6);

  return v8;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:", v12, v11, v10, v6);

  return v13;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v22) = a9;
  id v20 = objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v19, v18, v17, v16, v15, v9, v22);

  return v20;
}

- (id)transferWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6 isScreenshot:(BOOL)a7 stickerEffectType:(unint64_t)a8
{
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isStickersAppEnabled];

  if (v17)
  {
    LOBYTE(v20) = a7;
    id v18 = objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v13, v14, v15, 0, 0, v9, v20);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)transferWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = objc_msgSend(objc_alloc(-[CKMediaObjectManager transferClass](self, "transferClass")), "initWithStickerFileURL:transferUserInfo:attributionInfo:animatedImageCacheURL:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (id)fileManager
{
  return (id)[MEMORY[0x1E4F28CB8] defaultManager];
}

- (Class)transferClass
{
  return (Class)objc_opt_class();
}

- (void)transferRemoved:(id)a3
{
  id v6 = [a3 object];
  id v4 = [v6 guid];
  if (v4)
  {
    id v5 = [(CKMediaObjectManager *)self transfers];
    [v5 removeObjectForKey:v4];
  }
}

- (BOOL)_attachmentDataTooLargeToSend:(id)a3 utiType:(id)a4
{
  id v4 = a3;
  BOOL v5 = (IMUTITypeIsSupportedForTranscodeOnSend() & 1) == 0 && (unint64_t)[v4 length] > 0x6400000;

  return v5;
}

- (void)_previewGenerationSucceededNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 object];
  if ([MEMORY[0x1E4F6E700] ignorePreviewGenerationNotifications])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Preview generation succeeded for transfer %@, but ignoring due to override", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
  else
  {
    id v6 = [v3 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6EBC0]];
    id v8 = v7;
    *(_OWORD *)buf = 0uLL;
    if (v7)
    {
      [v7 getValue:buf size:16];
      double v9 = *(double *)&buf[8];
      double v10 = *(double *)buf;
    }
    else
    {
      double v9 = 0.0;
      double v10 = 0.0;
    }

    id v11 = [MEMORY[0x1E4F6BC98] sharedInstance];
    id v12 = [v11 remoteDaemon];
    objc_msgSend(v12, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v4, v10, v9);
  }
}

- (void)_previewGenerationFailedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 object];
  if ([MEMORY[0x1E4F6E700] ignorePreviewGenerationNotifications])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v9 = v4;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Preview generation failed for transfer %@, but ignoring due to override", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F6BC98] sharedInstance];
    id v7 = [v6 remoteDaemon];
    [v7 failTransferPreviewGeneration:v4];
  }
}

- (NSMutableDictionary)transfers
{
  return self->_transfers;
}

- (NSArray)classes
{
  return self->_classes;
}

- (NSDictionary)UTITypes
{
  return self->_UTITypes;
}

- (NSDictionary)dynTypes
{
  return self->_dynTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynTypes, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_classes, 0);

  objc_storeStrong((id *)&self->_transfers, 0);
}

- (void)_copyResolvedFileURL:toURL:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_7_2(&dword_18EF18000, v0, v1, "Failed to open dest attachment path, errno: %d", v2, v3, v4, v5, 0);
}

- (void)_copyResolvedFileURL:toURL:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_7_2(&dword_18EF18000, v0, v1, "Failed to open resolved attachment path, errno: %d", v2, v3, v4, v5, 0);
}

- (void)_copyResolvedFileURL:(int)a1 toURL:(NSObject *)a2 .cold.3(int a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Failed to copy resolved file attachment to local store. Result %d errno %d", (uint8_t *)v5, 0xEu);
}

- (void)mediaObjectWithSticker:(os_log_t)log stickerUserInfo:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "can't send a nil sticker!", v1, 2u);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "can't send a sticker with a nil stickerGUID: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.3(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "can't send a sticker with a nil fileURL: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t v2 = [v1 path];
  uint64_t v3 = [v0 description];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v4, v5, "generating hash of sticker file at path %@ failed for sticker: %@", v6, v7, v8, v9, v10);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.5()
{
  OUTLINED_FUNCTION_4_1();
  id v1 = [v0 description];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v2, v3, "Failed to create media object for sticker: %@, transfer guid: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.6(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Expected to get back a CKImageMediaObject subclass for sticker %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  id v1 = "transferUserInfo";
  _os_log_error_impl(&dword_18EF18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "unable to find plugin for %@", v1, 0xCu);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.9()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "unable to find attribution info for %@", v1, 0xCu);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.10(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "sticker has no fileName: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.11()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t v2 = [v1 path];
  uint64_t v3 = [v0 description];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v4, v5, "backing file does not exist on disk at path: %@ for sticker: %@", v6, v7, v8, v9, v10);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.12(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "sticker representation data is empty for sticker: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.13()
{
  OUTLINED_FUNCTION_4_1();
  uint64_t v2 = [v1 type];
  uint64_t v3 = [v0 description];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_1(&dword_18EF18000, v4, v5, "generating hash of sticker representation of type %@ failed for sticker: %@", v6, v7, v8, v9, v10);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.14(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Missing stickerGUID sticker: %@", v4, v5, v6, v7, v8);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.15()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "Could not write sticker representation to %@ error %@", v2, 0x16u);
}

- (void)mediaObjectWithSticker:stickerUserInfo:.cold.16()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  os_log_t v1 = "transferUserInfo";
  _os_log_error_impl(&dword_18EF18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v0, 0x16u);
}

- (void)mediaObjectWithSticker:(void *)a1 stickerUserInfo:.cold.17(void *a1)
{
  os_log_t v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Failed to prepare sticker to be sent: %@", v4, v5, v6, v7, v8);
}

@end