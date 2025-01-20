@interface IMDStickerRegistry
+ (id)sharedInstance;
- (BOOL)_isRecipeBasedSticker:(id)a3;
- (IMDStickerRegistry)init;
- (NSMutableDictionary)stickerPackGUIDToPackMap;
- (id)_cachedPathForStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4;
- (void)dealloc;
- (void)retrieveStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4 completionBlock:(id)a5;
- (void)setStickerPackGUIDToPackMap:(id)a3;
@end

@implementation IMDStickerRegistry

+ (id)sharedInstance
{
  if (qword_1EBE2B8E8 != -1) {
    dispatch_once(&qword_1EBE2B8E8, &unk_1F3392180);
  }
  return (id)qword_1EBE2BA28;
}

- (IMDStickerRegistry)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)IMDStickerRegistry;
  v2 = [(IMDStickerRegistry *)&v8 init];
  if (v2)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall"))
    {
      uint64_t v3 = [@"/var/mobile/Library/SMS/Stickers" stringByExpandingTildeInPath];
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3))
      {
        uint64_t v7 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v3, &v7);
        if (IMOSLoggingEnabled())
        {
          v4 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v10 = v3;
            __int16 v11 = 2112;
            uint64_t v12 = v7;
            _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Deleting legacy Sticker folder at path %@, error %@", buf, 0x16u);
          }
        }
      }
    }
    if (!v2->_stickerPackGUIDToPackMap) {
      v2->_stickerPackGUIDToPackMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Initialized IMDStickerStore", buf, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDStickerRegistry;
  [(IMDStickerRegistry *)&v3 dealloc];
}

- (id)_cachedPathForStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4
{
  return (id)IMSharedHelperCachePathForStickerWithProperties();
}

- (BOOL)_isRecipeBasedSticker:(id)a3
{
  if ([a3 count])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6E388]), "length");
    if (v4) {
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F6E3C8]), "length") != 0;
    }
  }
  else
  {
    LODWORD(v4) = IMOSLoggingEnabled();
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      LODWORD(v4) = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "_isRecipeBasedSticker invalid properties", v7, 2u);
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (void)retrieveStickerWithProperties:(id)a3 isAdaptiveImageGlyph:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = a3;
      __int16 v26 = 2112;
      id v27 = a5;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Retrieve sticker with properties %@, completionBlock %@", buf, 0x16u);
    }
  }
  if (a5)
  {
    if (a3 && [a3 count])
    {
      id v10 = [(IMDStickerRegistry *)self _cachedPathForStickerWithProperties:a3 isAdaptiveImageGlyph:v6];
      uint64_t v11 = [a3 objectForKey:*MEMORY[0x1E4F6E388]];
      if (v10)
      {
        uint64_t v12 = (void *)v11;
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v10))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v25 = v10;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "sticker found in cache %@", buf, 0xCu);
            }
          }
          (*((void (**)(id, id, void))a5 + 2))(a5, v10, 0);
        }
        else
        {
          BOOL v15 = [(IMDStickerRegistry *)self _isRecipeBasedSticker:a3];
          int v16 = IMOSLoggingEnabled();
          if (v15)
          {
            if (v16)
            {
              v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v25 = v12;
                _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Received ME-sticker from balloon %@", buf, 0xCu);
              }
            }
            v18 = (void *)[a3 objectForKey:*MEMORY[0x1E4F6E3C8]];
            v19 = (void *)[MEMORY[0x1E4F6EBE0] sharedInstance];
            uint64_t v20 = [v18 _FTDataFromHexString];
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = sub_1D984FC2C;
            v23[3] = &unk_1E6B78020;
            v23[5] = 0;
            v23[6] = a5;
            v23[4] = v12;
            [v19 transcodeLocalTransferPayloadData:v20 balloonBundleID:v12 completionBlock:v23];
          }
          else
          {
            if (v16)
            {
              v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Sticker not found in cache", buf, 2u);
              }
            }
            (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = a3;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Invalid sticker properties passed to retrieveStickerWithProperties %@", buf, 0xCu);
          }
        }
        (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.private.IMDaemonCore.IMDStickerRegistry" code:2 userInfo:0]);
      }
    }
    else
    {
      (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.private.IMDaemonCore.IMDStickerRegistry" code:1 userInfo:0]);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "IMDStickerRegistry. No completion block passed in.", buf, 2u);
    }
  }
}

- (NSMutableDictionary)stickerPackGUIDToPackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStickerPackGUIDToPackMap:(id)a3
{
}

@end