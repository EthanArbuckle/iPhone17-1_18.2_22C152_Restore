@interface _SFActivityViewController
+ (id)activeWebPageExtensionItemForURL:(id)a3 withPreviewImageHandler:(id)a4;
- (BOOL)_containsProviderForDownloadActivityAndGetMIMEType:(id *)a3 uti:(id *)a4;
- (NSArray)activityItemProviders;
- (NSString)currentExtensionIdentifier;
- (NSURL)sharingURL;
- (_SFActivityItemCustomizationController)customizationController;
- (_SFActivityViewController)initWithActivityItemProviderCollection:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6;
- (_SFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6;
- (_SFActivityViewControllerDelegate)delegate;
- (_SFPrintController)printController;
- (_SFSafariSharingExtensionController)sharingExtensionController;
- (id)_extensionItemForExtensionActivity:(id)a3;
- (id)_javaScriptProcessingFileURLInExtension:(id)a3;
- (id)excludedActivityTypes;
- (int64_t)provenance;
- (void)_executeActivity;
- (void)_performActivity:(id)a3;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)_preparePrint:(id)a3 completion:(id)a4;
- (void)_processJavaScriptFinalizeReturnedItems:(id)a3 forExtension:(id)a4;
- (void)_updateActivityItems:(id)a3;
- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_updatePrintControllerWithActivityItems:(id)a3;
- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5;
- (void)customizationControllerCustomizationsDidChange:(id)a3;
- (void)dealloc;
- (void)prepareJavaScriptExtensionItemForActivity:(id)a3;
- (void)setCurrentExtensionIdentifier:(id)a3;
- (void)setCustomizationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrintController:(id)a3;
- (void)setProvenance:(int64_t)a3;
- (void)setSharingExtensionController:(id)a3;
- (void)setSharingURL:(id)a3;
@end

@implementation _SFActivityViewController

+ (id)activeWebPageExtensionItemForURL:(id)a3 withPreviewImageHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F28C80];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setUserInfo:&unk_1EFBDFC40];
  id v9 = objc_alloc(MEMORY[0x1E4F28D78]);
  v10 = (void *)[v9 initWithItem:v7 typeIdentifier:*MEMORY[0x1E4F226F8]];

  [v10 setPreviewImageHandler:v6];
  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 setAttachments:v11];

  return v8;
}

- (_SFActivityViewController)initWithActivityItemProviderCollection:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_alloc_init(_SFActivityItemCustomizationController);
  v16 = [v11 activityItemProvidersWithCustomizationController:v15];
  v17 = [(_SFActivityViewController *)self initWithActivityItems:v16 applicationActivities:v12 sharingURL:v13 sourceURL:v14];
  v18 = v17;
  if (v17)
  {
    v35 = v15;
    id v37 = v14;
    id v38 = v13;
    id v39 = v11;
    v36 = v17;
    objc_storeStrong((id *)&v17->_itemProviderCollection, a3);
    uint64_t v19 = *MEMORY[0x1E4F43588];
    uint64_t v45 = *MEMORY[0x1E4F43618];
    uint64_t v46 = v19;
    v47 = @"SFToggleReaderActivity";
    v48 = @"SFReloadActivity";
    uint64_t v49 = *MEMORY[0x1E4F435A0];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:5];
    v21 = (void *)[v20 mutableCopy];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v12;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = [v27 activityType];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v30 = [v27 activityType];
              [v21 addObject:v30];
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }

    uint64_t v31 = *MEMORY[0x1E4F435B8];
    uint64_t v45 = *MEMORY[0x1E4F43610];
    uint64_t v46 = v31;
    v47 = (__CFString *)*MEMORY[0x1E4F43600];
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:3];
    [v21 addObjectsFromArray:v32];

    v18 = v36;
    [(_SFActivityViewController *)v36 setActivityTypeOrder:v21];
    v33 = v36;

    id v11 = v39;
    id v14 = v37;
    id v13 = v38;
    v15 = v35;
  }

  return v18;
}

- (_SFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_SFActivityViewController;
  v15 = [(_SFActivityViewController *)&v26 initWithActivityItems:v11 applicationActivities:v12];
  if (v15)
  {
    objc_initWeak(&location, v15);
    v16 = [MEMORY[0x1E4F74230] sharedConnection];
    -[_SFActivityViewController setSourceIsManaged:](v15, "setSourceIsManaged:", [v16 isURLManaged:v14]);

    objc_storeStrong((id *)&v15->_sharingURL, a5);
    [(_SFActivityViewController *)v15 _updatePrintControllerWithActivityItems:v11];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __94___SFActivityViewController_initWithActivityItems_applicationActivities_sharingURL_sourceURL___block_invoke;
    uint64_t v23 = &unk_1E5C737A8;
    objc_copyWeak(&v24, &location);
    [(_SFActivityViewController *)v15 setCompletionWithItemsHandler:&v20];
    objc_storeStrong((id *)&v15->_activityItemProviders, a3);
    v17 = objc_alloc_init(_SFActivityItemCustomizationController);
    -[_SFActivityViewController setCustomizationController:](v15, "setCustomizationController:", v17, v20, v21, v22, v23);

    objc_storeStrong((id *)&v15->_initialApplicationActivities, a4);
    v18 = v15;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)dealloc
{
  [(_SFPrintController *)self->_printController printInteractionControllerDidFinish];
  v3.receiver = self;
  v3.super_class = (Class)_SFActivityViewController;
  [(_SFActivityViewController *)&v3 dealloc];
}

- (void)_updatePrintControllerWithActivityItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v10, "printController", (void)v13);
          id v11 = (_SFPrintController *)objc_claimAutoreleasedReturnValue();
          p_printController = &self->_printController;
          if (*p_printController != v11)
          {
            [(_SFPrintController *)*p_printController printInteractionControllerDidFinish];
            objc_storeStrong((id *)p_printController, v11);
          }

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(_SFActivityViewController *)self currentExtensionIdentifier];
  [(_SFActivityViewController *)self _processJavaScriptFinalizeReturnedItems:v9 forExtension:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained activityViewController:self didCompleteActivity:v8 success:v5];
  }
  if (v5 && [v8 isEqualToString:*MEMORY[0x1E4F43610]])
  {
    id v17 = 0;
    id v18 = 0;
    BOOL v12 = [(_SFActivityViewController *)self _containsProviderForDownloadActivityAndGetMIMEType:&v18 uti:&v17];
    id v13 = v18;
    id v14 = v17;
    if (v12)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = [WeakRetained browserPersonaForActivityViewController:self];
      }
      else {
        uint64_t v15 = 0;
      }
      long long v16 = [MEMORY[0x1E4F98948] sharedLogger];
      objc_msgSend(v16, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v13, v14, 2, 0, v15);
    }
  }
}

- (BOOL)_containsProviderForDownloadActivityAndGetMIMEType:(id *)a3 uti:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(_SFActivityViewController *)self activityItemProviders];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
    BOOL v12 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v11 quickLookDocument];
        *a3 = [v13 mimeType];
        *a4 = [v13 uti];

LABEL_17:
        BOOL v12 = 1;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v11 webView];
        *a3 = [v14 _MIMEType];

        CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F22500];
        long long v16 = (__CFString *)*a3;
LABEL_16:
        *a4 = (id)(id)UTTypeCreatePreferredIdentifierForTag(v15, v16, 0);
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = (__CFString *) (id) *MEMORY[0x1E4F789E8];
        *a3 = v16;
        CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F22500];
        goto LABEL_16;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    BOOL v12 = 0;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_18:

  return v12;
}

- (void)_executeActivity
{
  objc_super v3 = [(_SFActivityViewController *)self activity];
  id v4 = [v3 activityType];
  if ([v3 _isExecutedInProcess]) {
    [(_SFActivityViewController *)self prepareJavaScriptExtensionItemForActivity:v3];
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F435B8]])
  {
    printController = self->_printController;
    if (printController)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45___SFActivityViewController__executeActivity__block_invoke;
      v7[3] = &unk_1E5C73530;
      id v8 = v3;
      uint64_t v9 = self;
      [(_SFPrintController *)printController preparePrintInteractionControllerForUsage:2 completion:v7];
    }
    else
    {
      [v3 activityDidFinish:0];
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFActivityViewController;
    [(_SFActivityViewController *)&v6 _executeActivity];
  }
}

- (void)_performActivity:(id)a3
{
  id v4 = (SFSaveToFilesActivity *)a3;
  BOOL v5 = [(SFSaveToFilesActivity *)v4 activityType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F43610]];

  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_INFO, "Performing SFSaveToFilesActivity", buf, 2u);
    }
    id v8 = [[SFSaveToFilesActivity alloc] initWithActivityItemProviderCollection:self->_itemProviderCollection customizationController:self->_customizationController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      -[SFSaveToFilesActivity setSupportsDownloads:](v8, "setSupportsDownloads:", [WeakRetained activityViewControllerSupportsDownloads:self]);
    }
  }
  else
  {
    id v8 = v4;
  }
  v10.receiver = self;
  v10.super_class = (Class)_SFActivityViewController;
  [(_SFActivityViewController *)&v10 _performActivity:v8];
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v9 = a3;
  int v6 = (void (**)(void))a4;
  uint64_t v7 = [v9 activityType];
  if (([v7 isEqualToString:*MEMORY[0x1E4F43600]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F435C8]])
  {
    [(_SFActivityViewController *)self _preparePrint:v9 completion:v6];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained activityViewController:self prepareActivity:v9 completion:v6];
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
}

- (void)_preparePrint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [(_SFPrintController *)self->_printController printInteractionController];
    [v6 setPrintInteractionController:v9];

    uint64_t v8 = 0;
  }
  printController = self->_printController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __54___SFActivityViewController__preparePrint_completion___block_invoke;
  v13[3] = &unk_1E5C737D0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(_SFPrintController *)printController preparePrintInteractionControllerForUsage:v8 completion:v13];
}

- (void)_updateActivityItems:(id)a3
{
  id v4 = (NSArray *)a3;
  BOOL v5 = [(_SFActivityViewController *)self customizationController];
  uint64_t v6 = [v5 selectedContentType];

  if (v6) {
    initialApplicationActivities = 0;
  }
  else {
    initialApplicationActivities = self->_initialApplicationActivities;
  }
  uint64_t v8 = initialApplicationActivities;
  [(_SFActivityViewController *)self _updateActivityItems:v4 applicationActivities:v8];
  activityItemProviders = self->_activityItemProviders;
  self->_activityItemProviders = v4;
  objc_super v10 = v4;
}

- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SFActivityViewController;
  id v6 = a3;
  [(_SFActivityViewController *)&v7 _updateActivityItems:v6 applicationActivities:a4];
  -[_SFActivityViewController _updatePrintControllerWithActivityItems:](self, "_updatePrintControllerWithActivityItems:", v6, v7.receiver, v7.super_class);
}

- (id)excludedActivityTypes
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_SFActivityViewController;
  uint64_t v2 = [(_SFActivityViewController *)&v9 excludedActivityTypes];
  objc_super v3 = (void *)v2;
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  v10[0] = @"com.apple.UIKit.activity.AddToHomeScreen";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  objc_super v7 = objc_msgSend(v5, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v6);

  return v7;
}

- (void)prepareJavaScriptExtensionItemForActivity:(id)a3
{
  id v7 = a3;
  [(_SFActivityViewController *)self setCurrentExtensionIdentifier:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [(_SFActivityViewController *)self _extensionItemForExtensionActivity:v7];
    if (v4)
    {
      [v7 _injectedJavaScriptResult:v4];
      id v5 = [v7 applicationExtension];
      id v6 = [v5 identifier];

      [(_SFActivityViewController *)self setCurrentExtensionIdentifier:v6];
    }
  }
}

- (id)_javaScriptProcessingFileURLInExtension:(id)a3
{
  id v3 = a3;
  id v4 = [v3 attributes];
  id v5 = objc_msgSend(v4, "safari_stringForKey:", @"NSExtensionJavaScriptPreprocessingFile");
  if (v5)
  {
    id v6 = [v3 _extensionBundle];
    id v7 = [v6 URLForResource:v5 withExtension:@"js"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_extensionItemForExtensionActivity:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 applicationExtension];
  id v5 = [(_SFActivityViewController *)self _javaScriptProcessingFileURLInExtension:v4];
  if (v5)
  {
    id v6 = [NSString stringWithContentsOfURL:v5 encoding:4 error:0];
    if ([v6 length])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      id v8 = objc_alloc_init(MEMORY[0x1E4F28D78]);
      v17[0] = v8;
      objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v7 setAttachments:v9];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_sharingExtensionController);
      id v11 = [v4 identifier];
      [WeakRetained prepareJavaScriptWorldForSharingExtension:v11 javaScript:v6];

      uint64_t v12 = *MEMORY[0x1E4F22698];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke;
      v14[3] = &unk_1E5C72D78;
      id v15 = v4;
      long long v16 = self;
      [v8 registerItemForTypeIdentifier:v12 loadHandler:v14];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_processJavaScriptFinalizeReturnedItems:(id)a3 forExtension:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (!v7 || !v8) {
    goto LABEL_23;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v6;
  uint64_t v22 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v22)
  {

LABEL_22:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sharingExtensionController);
    [WeakRetained finalizeJavaScriptForSharingExtension:v7 arguments:MEMORY[0x1E4F1CC08]];

    goto LABEL_23;
  }
  id v20 = v6;
  char v10 = 0;
  uint64_t v21 = *(void *)v31;
  uint64_t v11 = *MEMORY[0x1E4F22698];
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v31 != v21) {
        objc_enumerationMutation(v9);
      }
      uint64_t v23 = v12;
      id v13 = [*(id *)(*((void *)&v30 + 1) + 8 * v12) attachments];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v18 hasItemConformingToTypeIdentifier:v11])
            {
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __82___SFActivityViewController__processJavaScriptFinalizeReturnedItems_forExtension___block_invoke;
              v24[3] = &unk_1E5C73820;
              v24[4] = self;
              id v25 = v7;
              [v18 loadItemForTypeIdentifier:v11 options:0 completionHandler:v24];

              char v10 = 1;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v15);
      }

      uint64_t v12 = v23 + 1;
    }
    while (v23 + 1 != v22);
    uint64_t v22 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  }
  while (v22);

  id v6 = v20;
  if ((v10 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:
}

- (void)setCustomizationController:(id)a3
{
  objc_storeStrong((id *)&self->_customizationController, a3);
  id v5 = a3;
  [(_SFActivityViewController *)self setObjectManipulationDelegate:v5];
}

- (void)customizationControllerCustomizationsDidChange:(id)a3
{
  itemProviderCollection = self->_itemProviderCollection;
  id v5 = [(_SFActivityViewController *)self customizationController];
  id v25 = [(_SFActivityItemProviderCollection *)itemProviderCollection activityItemProvidersWithCustomizationController:v5];

  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = [(_SFActivityViewController *)self excludedActivityTypes];
  uint64_t v8 = [v6 setWithArray:v7];

  activityTypesExcludedDueToSelectedCustomization = self->_activityTypesExcludedDueToSelectedCustomization;
  if (activityTypesExcludedDueToSelectedCustomization)
  {
    char v10 = activityTypesExcludedDueToSelectedCustomization;
  }
  else
  {
    char v10 = [MEMORY[0x1E4F1CA80] set];
  }
  uint64_t v11 = self->_activityTypesExcludedDueToSelectedCustomization;
  self->_activityTypesExcludedDueToSelectedCustomization = v10;

  [v8 minusSet:self->_activityTypesExcludedDueToSelectedCustomization];
  uint64_t v12 = [v8 allObjects];
  [(_SFActivityViewController *)self setExcludedActivityTypes:v12];

  [(NSMutableSet *)self->_activityTypesExcludedDueToSelectedCustomization removeAllObjects];
  if ([v25 count] == 1)
  {
    id v13 = [v25 firstObject];
    uint64_t v14 = [(_SFActivityViewController *)self excludedActivityTypes];
    uint64_t v15 = (void *)v14;
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    id v17 = v16;

    long long v18 = [v13 excludedActivityTypes];
    long long v19 = (NSMutableSet *)[v18 mutableCopy];
    id v20 = self->_activityTypesExcludedDueToSelectedCustomization;
    self->_activityTypesExcludedDueToSelectedCustomization = v19;

    uint64_t v21 = self->_activityTypesExcludedDueToSelectedCustomization;
    uint64_t v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    [(NSMutableSet *)v21 minusSet:v22];

    uint64_t v23 = [(NSMutableSet *)self->_activityTypesExcludedDueToSelectedCustomization allObjects];
    id v24 = objc_msgSend(v17, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v23);

    [(_SFActivityViewController *)self setExcludedActivityTypes:v24];
  }
  [(_SFActivityViewController *)self _updateActivityItems:v25];
}

- (_SFSafariSharingExtensionController)sharingExtensionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharingExtensionController);

  return (_SFSafariSharingExtensionController *)WeakRetained;
}

- (void)setSharingExtensionController:(id)a3
{
}

- (_SFActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_SFActivityItemCustomizationController)customizationController
{
  return self->_customizationController;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (void)setSharingURL:(id)a3
{
}

- (NSArray)activityItemProviders
{
  return self->_activityItemProviders;
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (void)setPrintController:(id)a3
{
}

- (NSString)currentExtensionIdentifier
{
  return self->_currentExtensionIdentifier;
}

- (void)setCurrentExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_activityItemProviders, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_customizationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sharingExtensionController);
  objc_storeStrong((id *)&self->_activityTypesExcludedDueToSelectedCustomization, 0);
  objc_storeStrong((id *)&self->_initialApplicationActivities, 0);

  objc_storeStrong((id *)&self->_itemProviderCollection, 0);
}

@end