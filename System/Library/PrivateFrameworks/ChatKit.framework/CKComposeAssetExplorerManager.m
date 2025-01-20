@interface CKComposeAssetExplorerManager
- (BOOL)allItemsShouldNotAppearInShelf;
- (CKChatInputController)inputController;
- (CKComposeAssetExplorerManager)initWithInputController:(id)a3;
- (NSMutableArray)packagesToStage;
- (NSMutableArray)savedData;
- (id)browser;
- (id)clearAndDisableShelfAndReturnPreviouslyShelvedData;
- (id)generatePackageFromAssetURL:(id)a3 appendedVideoURL:(id)a4 previewImage:(id)a5;
- (void)_stageAssetPackage:(id)a3 toBrowser:(id)a4;
- (void)saveFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 fullyRealizedPreview:(id)a6 rawPreview:(id)a7 appendedVideoURL:(id)a8;
- (void)setAllItemsShouldNotAppearInShelf:(BOOL)a3;
- (void)setInputController:(id)a3;
- (void)setPackagesToStage:(id)a3;
- (void)setSavedData:(id)a3;
- (void)stageAssetPackage:(id)a3;
- (void)tryToStagePendingPackages;
@end

@implementation CKComposeAssetExplorerManager

- (CKComposeAssetExplorerManager)initWithInputController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKComposeAssetExplorerManager;
  v5 = [(CKComposeAssetExplorerManager *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(CKComposeAssetExplorerManager *)v5 setPackagesToStage:v6];

    v7 = +[CKBalloonPluginManager sharedInstance];
    [v7 invalidatePhotosViewController];

    v8 = [MEMORY[0x1E4F1CA48] array];
    [(CKComposeAssetExplorerManager *)v5 setSavedData:v8];

    [(CKComposeAssetExplorerManager *)v5 setAllItemsShouldNotAppearInShelf:0];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v5 selector:sel__balloonPluginExtensionsLoaded_ name:*MEMORY[0x1E4F6B868] object:0];

    [(CKComposeAssetExplorerManager *)v5 setInputController:v4];
  }

  return v5;
}

- (void)setInputController:(id)a3
{
  id v5 = a3;
  if (![(CKComposeAssetExplorerManager *)self allItemsShouldNotAppearInShelf])
  {
    objc_storeStrong((id *)&self->_inputController, a3);
    [(CKComposeAssetExplorerManager *)self tryToStagePendingPackages];
  }
}

- (id)browser
{
  v2 = IMBalloonExtensionIDWithSuffix();
  v3 = +[CKBalloonPluginManager sharedInstance];
  id v4 = [v3 viewControllerForPluginIdentifier:v2];

  if (!v4)
  {
    id v5 = +[CKBalloonPluginManager sharedInstance];
    id v4 = [v5 photosBrowserViewControllerWithPluginPayloads:0];

    if (!v4)
    {
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Warning: Browser is nil!", v8, 2u);
        }
      }
      id v4 = 0;
    }
  }

  return v4;
}

- (void)tryToStagePendingPackages
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(CKComposeAssetExplorerManager *)self allItemsShouldNotAppearInShelf])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Staging: Items should not appear in shelf, not staging package", (uint8_t *)&v31, 2u);
    }
LABEL_35:

    return;
  }
  id v4 = [(CKComposeAssetExplorerManager *)self packagesToStage];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Staging: No packages to try to stage, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_35;
  }
  v6 = [(CKComposeAssetExplorerManager *)self inputController];

  if (!v6)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Staging: No packages to try to stage, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_35;
  }
  v7 = [(CKComposeAssetExplorerManager *)self browser];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 sendDelegate];
    v10 = [(CKComposeAssetExplorerManager *)self inputController];

    if (v9 != v10)
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = [(CKComposeAssetExplorerManager *)self inputController];
          int v31 = 138412290;
          uint64_t v32 = (uint64_t)v12;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Setting browser send delegate to %@", (uint8_t *)&v31, 0xCu);
        }
      }
      v13 = [(CKComposeAssetExplorerManager *)self inputController];
      [v8 setSendDelegate:v13];
    }
    v14 = [v8 sendDelegate];
    BOOL v15 = v14 == 0;

    int v16 = IMOSLoggingEnabled();
    if (!v15)
    {
      if (v16)
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = [(CKComposeAssetExplorerManager *)self packagesToStage];
          uint64_t v19 = [v18 count];
          int v31 = 134217984;
          uint64_t v32 = v19;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Staging %lu packages to browser", (uint8_t *)&v31, 0xCu);
        }
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v20 = [(CKComposeAssetExplorerManager *)self packagesToStage];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v20);
            }
            [(CKComposeAssetExplorerManager *)self _stageAssetPackage:*(void *)(*((void *)&v26 + 1) + 8 * i) toBrowser:v8];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v21);
      }

      v24 = [(CKComposeAssetExplorerManager *)self packagesToStage];
      [v24 removeAllObjects];

      goto LABEL_44;
    }
    if (v16)
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Browser send delegate is nil", (uint8_t *)&v31, 2u);
      }
LABEL_43:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Staging: browser is nil, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_43;
  }
LABEL_44:
}

- (void)_stageAssetPackage:(id)a3 toBrowser:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    [v6 stageAssetToTransportAndNotifySendDelegate:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive to the photos browser", v8, 2u);
    }
  }
}

- (void)stageAssetPackage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CKComposeAssetExplorerManager *)self packagesToStage];
    [v5 addObject:v4];

    [(CKComposeAssetExplorerManager *)self tryToStagePendingPackages];
  }
  else if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Received nil package, returning", v7, 2u);
    }
  }
}

- (id)generatePackageFromAssetURL:(id)a3 appendedVideoURL:(id)a4 previewImage:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(CKComposeAssetExplorerManager *)self allItemsShouldNotAppearInShelf])
  {
    if (generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator)
    {
      if (v9)
      {
LABEL_9:
        v17[0] = v8;
        v17[1] = v9;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
LABEL_12:
        v14 = (void *)v13;
        v12 = [(id)generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator generateAssetFromFileURLs:v13 previewImage:v10 error:0];

        goto LABEL_13;
      }
    }
    else
    {
      generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator = MEMORY[0x192FBA860](@"AEFileAssetPackageGenerator", @"AssetExplorer");
      if (v9) {
        goto LABEL_9;
      }
    }
    v18[0] = v8;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "generatePackageFromAssetURL: Items should not appear in shelf, not generating a package", v16, 2u);
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)clearAndDisableShelfAndReturnPreviouslyShelvedData
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "clearAndDisableShelfAndReturnPreviouslyShelvedData called.", v9, 2u);
    }
  }
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [(CKComposeAssetExplorerManager *)self setPackagesToStage:v4];

  id v5 = [(CKComposeAssetExplorerManager *)self browser];
  [v5 clearAllStagedPluginPackages];
  [(CKComposeAssetExplorerManager *)self setAllItemsShouldNotAppearInShelf:1];
  id v6 = [(CKComposeAssetExplorerManager *)self savedData];
  v7 = (void *)[v6 copy];

  [(CKComposeAssetExplorerManager *)self setSavedData:0];

  return v7;
}

- (void)saveFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 fullyRealizedPreview:(id)a6 rawPreview:(id)a7 appendedVideoURL:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v21 = [[CKComposeAssetExplorerManagerSavedData alloc] initWithFileURL:v19 filename:v18 transcoderUserInfo:v17 fullyRealizedPreview:v16 rawPreview:v15 appendedVideoURL:v14];

  v20 = [(CKComposeAssetExplorerManager *)self savedData];
  [v20 addObject:v21];
}

- (CKChatInputController)inputController
{
  return self->_inputController;
}

- (NSMutableArray)packagesToStage
{
  return self->_packagesToStage;
}

- (void)setPackagesToStage:(id)a3
{
}

- (NSMutableArray)savedData
{
  return self->_savedData;
}

- (void)setSavedData:(id)a3
{
}

- (BOOL)allItemsShouldNotAppearInShelf
{
  return self->_allItemsShouldNotAppearInShelf;
}

- (void)setAllItemsShouldNotAppearInShelf:(BOOL)a3
{
  self->_allItemsShouldNotAppearInShelf = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedData, 0);
  objc_storeStrong((id *)&self->_packagesToStage, 0);

  objc_storeStrong((id *)&self->_inputController, 0);
}

@end