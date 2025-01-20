@interface DDDetectionController
+ (BOOL)_shouldConsiderResultForCoreRecents:(__DDResult *)a3;
+ (BOOL)largeScreenIdiom;
+ (id)barcodeContext:(id)a3 preview:(BOOL)a4 contact:(id)a5 ics:(id)a6;
+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6;
+ (id)lightUnderlineColorFromTextColor:(id)a3;
+ (id)messagesActionHandler;
+ (id)sharedController;
+ (id)tapAndHoldSchemes;
+ (id)updateContext:(id)a3 forResult:(__DDResult *)a4 atIndex:(unint64_t)a5 ofStorage:(id)a6;
+ (unint64_t)allPublicTypes;
+ (void)setMessagesActionHandler:(id)a3;
- (BCSBusinessQueryService)_bizService;
- (BOOL)_checkIfBusinessWithResult:(__DDResult *)a3 messageable:(BOOL *)a4;
- (BOOL)_checkIfBusinessWithURL:(id)a3 messageable:(BOOL *)a4;
- (BOOL)_phoneNumberIsABusinessNumber:(id)a3 messageable:(BOOL *)a4;
- (BOOL)_shouldImmediatelyLaunchDefaultActionForURL:(id)a3 result:(__DDResult *)a4;
- (BOOL)_shouldImmediatelyShowActionSheetForCoreResult:(__DDResult *)a3;
- (BOOL)_shouldImmediatelyShowActionSheetForURL:(id)a3;
- (BOOL)actionIsCancellable;
- (BOOL)isPerformingAction;
- (BOOL)shouldIgnoreMessageActionForURL:(id)a3;
- (BOOL)shouldImmediatelyLaunchDefaultActionForResult:(__DDResult *)a3;
- (BOOL)shouldImmediatelyLaunchDefaultActionForTapAndHoldAtIndex:(unint64_t)a3 ofStorage:(id)a4;
- (BOOL)shouldImmediatelyLaunchDefaultActionForURL:(id)a3;
- (BOOL)shouldImmediatelyShowActionSheetForTapAtIndex:(unint64_t)a3 ofStorage:(id)a4;
- (BOOL)shouldImmediatelyShowActionSheetForURL:(id)a3 forFrame:(id)a4;
- (BOOL)shouldUseLightStyleAtIndex:(unint64_t)a3 ofStorage:(id)a4 moreHighlight:(BOOL *)a5;
- (BOOL)tryDismissActionInView:(id)a3;
- (DDDetectionController)init;
- (DDDetectionControllerDelegate)delegate;
- (__DDResult)_resultForAnchor:(id)a3 forFrame:(id)a4 context:(id *)a5;
- (__DDResult)_resultForIdentifier:(id)a3 forContainer:(id)a4 context:(id *)a5;
- (__DDResult)_resultForIdentifier:(id)a3 withResults:(id)a4 context:(id *)a5;
- (__DDResult)_resultForURL:(id)a3 forContainer:(id)a4 context:(id *)a5;
- (__DDResult)_resultForURL:(id)a3 withResults:(id)a4 context:(id *)a5;
- (__DDResult)resultForDOMNode:(id)a3 forFrame:(id)a4;
- (__DDResult)resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4;
- (__DDResult)resultForNode:(id)a3 url:(id)a4 frame:(id)a5 contextRef:(id *)a6;
- (__DDResult)resultForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7 extendedContext:(id *)a8;
- (id)_URLForLinkAttributeValue:(id)a3;
- (id)_applyBlock:(id)a3 withResultsAtIndex:(unint64_t)a4 ofStorage:(id)a5 context:(id)a6;
- (id)_businessItemForNumber:(id)a3 messageable:(BOOL *)a4;
- (id)_ensureURLIsURL:(id)a3;
- (id)_newOperationForContainer:(id)a3;
- (id)_phoneNumberFromResult:(__DDResult *)a3;
- (id)_plainTextAugmentedContext:(id)a3 withFrame:(id)a4;
- (id)_resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4 subResult:(id *)a5 url:(id *)a6 effectiveRange:(_NSRange *)a7;
- (id)_subResultAtIndex:(unint64_t)a3 ofResult:(id)a4;
- (id)actionsAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5;
- (id)actionsForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5;
- (id)actionsForDOMNode:(id)a3 forFrame:(id)a4;
- (id)actionsForResult:(__DDResult *)a3 context:(id)a4;
- (id)actionsForURL:(id)a3;
- (id)actionsForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7;
- (id)attributedTitleForResult:(__DDResult *)a3 updaterBlock:(id)a4;
- (id)attributedTitleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 updaterBlock:(id)a5;
- (id)attributedTitleForURL:(id)a3 updaterBlock:(id)a4;
- (id)barcodeActionsForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7;
- (id)barcodeDefaultActionForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7;
- (id)barcodePreviewActionForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7;
- (id)copyContextForContainer:(id)a3;
- (id)defaultActionAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5;
- (id)defaultActionForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5;
- (id)defaultActionForDOMNode:(id)a3 forFrame:(id)a4;
- (id)defaultActionForURL:(id)a3 results:(id)a4 context:(id)a5;
- (id)linkAtIndex:(unint64_t)a3 inTextStorage:(id)a4;
- (id)preferredTextAttributesForLinkAtCharacterIndex:(unint64_t)a3 ofStorage:(id)a4;
- (id)titleForResult:(__DDResult *)a3 subResult:(__DDResult *)a4 withURL:(id)a5 context:(id)a6;
- (id)titleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5;
- (id)titleForURL:(id)a3 results:(id)a4 context:(id)a5;
- (void)_cacheBusinessPhoneNumber:(id)a3;
- (void)_commonResetResultsForContainer:(id)a3;
- (void)_doURLification:(id)a3;
- (void)_enqueueOperation:(id)a3;
- (void)_interactionDidStartForResult:(__DDResult *)a3;
- (void)_interactionDidStartForURL:(id)a3;
- (void)_resetStoredResultsForContainer:(id)a3;
- (void)_startCoalescedURLification:(id)a3;
- (void)_startCoalescedURLification:(id)a3 clearPreviousResults:(BOOL)a4;
- (void)cancelAction;
- (void)cancelURLificationForContainer:(id)a3;
- (void)containerWillBeRemoved:(id)a3;
- (void)dealloc;
- (void)interactionDidStartAtIndex:(unint64_t)a3 ofStorage:(id)a4;
- (void)performAction:(id)a3 fromAlertController:(id)a4 interactionDelegate:(id)a5;
- (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6;
- (void)performAction:(id)a3 inView:(id)a4 interactionDelegate:(id)a5;
- (void)resetResultsForContainer:(id)a3;
- (void)resetResultsForFrame:(id)a3;
- (void)resetResultsForTextView:(id)a3;
- (void)setContext:(id)a3 forContainer:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setResults:(__CFArray *)a3 forContainer:(id)a4;
- (void)set_bizService:(id)a3;
- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4;
- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4 options:(int)a5;
- (void)urlifyTextView:(id)a3 withExternalResults:(id)a4 context:(id)a5;
@end

@implementation DDDetectionController

id __51__DDDetectionController__newOperationForContainer___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
}

+ (id)sharedController
{
  if (sharedController_once != -1) {
    dispatch_once(&sharedController_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedController__sSharedController;
  return v2;
}

uint64_t __51__DDDetectionController__newOperationForContainer___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setContext:v2];

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 setObject:v3 forKey:v5];
}

- (id)_resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4 subResult:(id *)a5 url:(id *)a6 effectiveRange:(_NSRange *)a7
{
  id v12 = a4;
  v13 = [v12 attribute:*MEMORY[0x1E4F5F118] atIndex:a3 effectiveRange:a7];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 type];
    int v16 = [v15 isEqualToString:*MEMORY[0x1E4F5F0A0]];

    if (a5)
    {
      if (v16)
      {
        *a5 = [(DDDetectionController *)self _subResultAtIndex:a3 ofResult:v14];
      }
    }
  }
  if (a6)
  {
    v17 = [v12 attribute:*MEMORY[0x1E4F42530] atIndex:a3 effectiveRange:a7];
    v18 = [(DDDetectionController *)self _URLForLinkAttributeValue:v17];
    v19 = [v18 scheme];
    v20 = [v19 lowercaseString];
    char v21 = [v20 hasPrefix:@"x-apple-data-detectors"];

    if ((v21 & 1) == 0) {
      *a6 = v18;
    }
  }
  return v14;
}

- (id)preferredTextAttributesForLinkAtCharacterIndex:(unint64_t)a3 ofStorage:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v15 = 0;
  if ([(DDDetectionController *)self shouldUseLightStyleAtIndex:a3 ofStorage:v6 moreHighlight:&v15])
  {
    if (v15)
    {
      v7 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    }
    else
    {
      v9 = [v6 attribute:*MEMORY[0x1E4F42510] atIndex:a3 effectiveRange:0];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F428B8] labelColor];
      }
      id v12 = v11;

      v7 = [(id)objc_opt_class() lightUnderlineColorFromTextColor:v12];
    }
    uint64_t v13 = *MEMORY[0x1E4F425C0];
    v16[0] = *MEMORY[0x1E4F425C8];
    v16[1] = v13;
    v17[0] = &unk_1EF50FF60;
    v17[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldUseLightStyleAtIndex:(unint64_t)a3 ofStorage:(id)a4 moreHighlight:(BOOL *)a5
{
  id v8 = a4;
  id v19 = 0;
  v9 = [(DDDetectionController *)self _resultForLinkAtIndex:a3 inTextStorage:v8 subResult:&v19 url:0 effectiveRange:0];
  id v10 = v19;
  id v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v12 = v10;

      v9 = v12;
    }
    [v9 coreResult];
    int v13 = DDShouldUseLightLinksForResult();
    char v14 = v13;
    if (a5 && v13)
    {
      [v9 coreResult];
      *a5 = DDShouldUseDebugHighlightForResult();
      char v14 = 1;
    }
  }
  else
  {
    char v15 = [v8 attribute:*MEMORY[0x1E4F42530] atIndex:a3 effectiveRange:0];
    int v16 = dd_ensureUrlIsUrl(v15);

    v17 = [v16 scheme];
    char v14 = [v17 isEqualToString:@"x-apple-data-detectors-clientdefined"];

    v9 = 0;
  }

  return v14;
}

uint64_t __57__DDDetectionController__resetStoredResultsForContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __43__DDDetectionController__enqueueOperation___block_invoke_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doURLification:*(void *)(a1 + 40)];
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_52(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4
{
  if (a4 == 127) {
    a4 = 511;
  }
  [(DDDetectionController *)self startURLificationForContainer:a3 detectedTypes:a4 options:0];
}

- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4 options:(int)a5
{
  char v5 = a5;
  id v8 = a3;
  if (v8 && a4)
  {
    if (a4 - 0x80000000 <= 0xFFFFFFFF7FFFFFFELL)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDDetectionController startURLificationForContainer:detectedTypes:options:]();
      }
      goto LABEL_14;
    }
    [(DDDetectionController *)self cancelURLificationForContainer:v8];
    id v9 = [(DDDetectionController *)self _newOperationForContainer:v8];
    [v9 setDetectionTypes:a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      -[DDDetectionController startURLificationForContainer:detectedTypes:options:]((uint64_t)v8, (uint64_t)v9, a4);
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
    }
    else if ((v5 & 2) == 0)
    {
LABEL_10:
      [(DDDetectionController *)self _startCoalescedURLification:v9];
LABEL_13:

      goto LABEL_14;
    }
    [(DDDetectionController *)self performSelector:sel__startCoalescedURLification_ withObject:v9 afterDelay:2.0];
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DDDetectionController startURLificationForContainer:detectedTypes:options:]();
  }
LABEL_14:
}

- (void)cancelURLificationForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DDDetectionController_cancelURLificationForContainer___block_invoke;
  block[3] = &unk_1E5A85640;
  id v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(protectQueue, block);
  if (v14[5])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[DDDetectionController cancelURLificationForContainer:]();
    }
    [(id)v14[5] cancel];
    v7 = self->_protectQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__DDDetectionController_cancelURLificationForContainer___block_invoke_34;
    v8[3] = &unk_1E5A85428;
    v8[4] = self;
    id v9 = v6;
    dispatch_sync(v7, v8);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)_startCoalescedURLification:(id)a3 clearPreviousResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    id v8 = [v6 container];
    [(DDDetectionController *)self _resetStoredResultsForContainer:v8];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke;
  v10[3] = &unk_1E5A85428;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  _os_activity_initiate(&dword_1A1709000, "Data Detectors URLification", OS_ACTIVITY_FLAG_DEFAULT, v10);
}

- (void)_startCoalescedURLification:(id)a3
{
}

- (void)_resetStoredResultsForContainer:(id)a3
{
  id v4 = a3;
  protectQueue = self->_protectQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__DDDetectionController__resetStoredResultsForContainer___block_invoke;
  v7[3] = &unk_1E5A85428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(protectQueue, v7);
}

- (id)_newOperationForContainer:(id)a3
{
  id v5 = a3;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__DDDetectionController__newOperationForContainer___block_invoke;
  block[3] = &unk_1E5A85428;
  block[4] = self;
  id v7 = v5;
  id v22 = v7;
  dispatch_sync(protectQueue, block);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"DDDetectionController.m" lineNumber:189 description:@"Unknown container type"];
  }
  id v9 = objc_msgSend(v7, "dd_newOperation");
  if (!v9)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"DDDetectionController.m" lineNumber:194 description:@"DDOperation creation failed"];
  }
  id v10 = self->_protectQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__DDDetectionController__newOperationForContainer___block_invoke_2;
  void v17[3] = &unk_1E5A85618;
  id v11 = v9;
  id v18 = v11;
  id v19 = self;
  id v20 = v7;
  id v12 = v7;
  dispatch_sync(v10, v17);
  uint64_t v13 = v20;
  id v14 = v11;

  return v14;
}

uint64_t __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2(uint64_t a1, int a2)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2_cold_1(a1, a2);
    if (!a2) {
      return [*(id *)(a1 + 32) cleanup];
    }
  }
  else if (!a2)
  {
    return [*(id *)(a1 + 32) cleanup];
  }
  if ([*(id *)(a1 + 32) isDiscarded]) {
    return [*(id *)(a1 + 32) cleanup];
  }
  return [*(id *)(a1 + 40) _enqueueOperation:*(void *)(a1 + 32)];
}

- (void)_enqueueOperation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__DDDetectionController__enqueueOperation___block_invoke;
  v11[3] = &unk_1E5A85690;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v4 setCompletionBlock:v11];
  if ([v4 needsFullScanner])
  {
    fullScannerQueue = self->_fullScannerQueue;
    p_fullScannerQueue = (id *)&self->_fullScannerQueue;
    id v5 = fullScannerQueue;
    if (!fullScannerQueue) {
      goto LABEL_5;
    }
  }
  else
  {
    urlScannerQueue = self->_urlScannerQueue;
    p_fullScannerQueue = (id *)&self->_urlScannerQueue;
    id v5 = urlScannerQueue;
    if (!urlScannerQueue)
    {
LABEL_5:
      id v9 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      id v10 = *p_fullScannerQueue;
      id *p_fullScannerQueue = v9;

      [*p_fullScannerQueue setMaxConcurrentOperationCount:1];
      id v5 = *p_fullScannerQueue;
    }
  }
  [v5 addOperation:v4];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_doURLification:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDDetectionController _doURLification:].cold.7();
  }
  if (!v5)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"DDDetectionController.m" lineNumber:379 description:@"Operation should not be nil"];
  }
  id v6 = [v5 container];
  id v7 = [v5 results];
  int v8 = [v5 tryCount];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy_;
  v63 = __Block_byref_object_dispose_;
  id v64 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__DDDetectionController__doURLification___block_invoke;
  block[3] = &unk_1E5A85640;
  v58 = &v59;
  block[4] = self;
  id v10 = v6;
  id v57 = v10;
  dispatch_sync(protectQueue, block);
  if (id)v60[5] == v5 && ([v5 containerIsReady])
  {
    int v11 = [v5 isDiscarded];
    if (v7) {
      int v12 = v11;
    }
    else {
      int v12 = 1;
    }
    if (v12 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[DDDetectionController _doURLification:]();
      }
    }
    else
    {
      if (v8 != -1 && [v5 needsToStartOver])
      {
        uint64_t v15 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[DDDetectionController _doURLification:].cold.5((uint64_t)v5, buf, [v7 count]);
        }

        int v17 = 1;
        goto LABEL_33;
      }
      if ([v7 count])
      {
        id v18 = self->_protectQueue;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __41__DDDetectionController__doURLification___block_invoke_38;
        v53[3] = &unk_1E5A85618;
        v53[4] = self;
        id v38 = v10;
        id v54 = v38;
        id v19 = v7;
        id v55 = v19;
        dispatch_sync(v18, v53);
        unsigned int v39 = [v5 doURLificationOnDocument];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained)
        {
          id v21 = objc_loadWeakRetained((id *)&self->_delegate);
          char v22 = objc_opt_respondsToSelector();

          if (v22)
          {
            v23 = [v5 context];
            if ([v5 needContinuation]) {
              CFTypeRef v24 = 0;
            }
            else {
              CFTypeRef v24 = CFRetain((CFTypeRef)objc_msgSend(v5, "scanQuery", v38));
            }
            v26 = dispatch_get_global_queue(-2, 0);
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __41__DDDetectionController__doURLification___block_invoke_2;
            v47[3] = &unk_1E5A856B8;
            id v48 = v19;
            v49 = self;
            id v50 = v23;
            CFTypeRef v52 = v24;
            id v51 = v38;
            id v27 = v23;
            dispatch_async(v26, v47);
          }
        }

        uint64_t v25 = v39;
      }
      else
      {
        uint64_t v25 = 0;
      }
      v28 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v38);
      v65 = @"kDataDetectorsUIURLificationHadDOMModification";
      v29 = [MEMORY[0x1E4F28ED0] numberWithBool:v25];
      v66 = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      [v28 postNotificationName:@"DataDetectorsUIDidFinishURLificationNotification" object:v10 userInfo:v30];
    }
    int v17 = 0;
LABEL_33:
    v31 = self->_protectQueue;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __41__DDDetectionController__doURLification___block_invoke_52;
    v45[3] = &unk_1E5A85428;
    v45[4] = self;
    id v32 = v10;
    id v46 = v32;
    dispatch_sync(v31, v45);
    if (v17 && v8 >= 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDDetectionController _doURLification:]();
      }
    }
    else if ((v17 | [v5 needContinuation]) == 1)
    {
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          -[DDDetectionController _doURLification:]();
        }
        v33 = (void *)[v5 newOperationForStartingOver];
        v34 = self->_protectQueue;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __41__DDDetectionController__doURLification___block_invoke_53;
        v43[3] = &unk_1E5A85428;
        v43[4] = self;
        id v44 = v32;
        dispatch_sync(v34, v43);
      }
      else
      {
        v33 = (void *)[v5 newOperationForContinuation];
      }
      v35 = self->_protectQueue;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __41__DDDetectionController__doURLification___block_invoke_2_54;
      v40[3] = &unk_1E5A85618;
      v40[4] = self;
      id v36 = v33;
      id v41 = v36;
      id v42 = v32;
      dispatch_sync(v35, v40);
      [(DDDetectionController *)self _startCoalescedURLification:v36 clearPreviousResults:0];
    }
    [v5 cleanup];

    goto LABEL_16;
  }
  uint64_t v13 = MEMORY[0x1E4F14500];
  id v14 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[DDDetectionController _doURLification:].cold.6((uint64_t)v5, v60[5], buf, [v7 count]);
  }

  [v5 cleanup];
LABEL_16:

  _Block_object_dispose(&v59, 8);
}

uint64_t __41__DDDetectionController_sharedController__block_invoke()
{
  sharedController__sSharedController = objc_alloc_init(DDDetectionController);
  return MEMORY[0x1F41817F8]();
}

- (DDDetectionController)init
{
  v16.receiver = self;
  v16.super_class = (Class)DDDetectionController;
  v2 = [(DDDetectionController *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:4];
    containerToContextsTable = v2->_containerToContextsTable;
    v2->_containerToContextsTable = (NSMapTable *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:4];
    containerToResultsTable = v2->_containerToResultsTable;
    v2->_containerToResultsTable = (NSMapTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:4];
    containerToOperationsTable = v2->_containerToOperationsTable;
    v2->_containerToOperationsTable = (NSMapTable *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.DataDetectorsUI", 0);
    protectQueue = v2->_protectQueue;
    v2->_protectQueue = (OS_dispatch_queue *)v9;

    fullScannerQueue = v2->_fullScannerQueue;
    v2->_fullScannerQueue = 0;

    urlScannerQueue = v2->_urlScannerQueue;
    v2->_urlScannerQueue = 0;

    uint64_t v13 = objc_alloc_init(DDActionController);
    actionController = v2->_actionController;
    v2->_actionController = v13;
  }
  return v2;
}

void __41__DDDetectionController__doURLification___block_invoke_38(void *a1)
{
  v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  uint64_t v3 = *(void **)(a1[4] + 40);
  uint64_t v4 = a1[6];
  id v6 = v2;
  if (v2)
  {
    uint64_t v5 = [v2 arrayByAddingObjectsFromArray:v4];
    [v3 setObject:v5 forKey:a1[5]];
  }
  else
  {
    [v3 setObject:v4 forKey:a1[5]];
  }
}

uint64_t __56__DDDetectionController_cancelURLificationForContainer___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __41__DDDetectionController__doURLification___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

void __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2;
  v5[3] = &unk_1E5A85668;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v3 dispatchScanQueryCreationWithCompletionBlock:v5];
}

void __43__DDDetectionController__enqueueOperation___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __43__DDDetectionController__enqueueOperation___block_invoke_cold_1(v2);
  }
  id v4 = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__DDDetectionController__enqueueOperation___block_invoke_32;
  v6[3] = &unk_1E5A85428;
  v6[4] = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  id v5 = WeakRetained;
  [v4 dispatchContainerModificationBlock:v6];
}

+ (id)tapAndHoldSchemes
{
  v2 = DDURLTapAndHoldSchemes();
  id v3 = [v2 arrayByAddingObject:@"x-apple-data-detectors-clientdefined"];

  return v3;
}

+ (void)setMessagesActionHandler:(id)a3
{
  if ((id)_messagesActionHandler != a3)
  {
    _messagesActionHandler = MEMORY[0x1A6236DA0](a3, a2);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)messagesActionHandler
{
  v2 = (void *)MEMORY[0x1A6236DA0](_messagesActionHandler, a2);
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_fullScannerQueue cancelAllOperations];
  [(NSOperationQueue *)self->_urlScannerQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)DDDetectionController;
  [(DDDetectionController *)&v3 dealloc];
}

- (void)setResults:(__CFArray *)a3 forContainer:(id)a4
{
  id v6 = a4;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_setResults_forContainer___block_invoke;
  block[3] = &unk_1E5A855F0;
  id v10 = v6;
  int v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(protectQueue, block);
}

uint64_t __49__DDDetectionController_setResults_forContainer___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v1 = a1[6];
  objc_super v3 = *(void **)(a1[4] + 40);
  if (v1) {
    return [v3 setObject:v1 forKey:v2];
  }
  else {
    return [v3 removeObjectForKey:v2];
  }
}

- (void)setContext:(id)a3 forContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_setContext_forContainer___block_invoke;
  block[3] = &unk_1E5A85618;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(protectQueue, block);
}

uint64_t __49__DDDetectionController_setContext_forContainer___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  objc_super v3 = *(void **)(a1[5] + 48);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (id)copyContextForContainer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  objc_super v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_copyContextForContainer___block_invoke;
  block[3] = &unk_1E5A85640;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(protectQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__DDDetectionController_copyContextForContainer___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_commonResetResultsForContainer:(id)a3
{
  id v4 = a3;
  [(DDDetectionController *)self cancelURLificationForContainer:v4];
  [(DDDetectionController *)self _resetStoredResultsForContainer:v4];
}

- (void)resetResultsForContainer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(DDDetectionController *)self resetResultsForFrame:v4];
  }
  else {
    [(DDDetectionController *)self resetResultsForTextView:v4];
  }
}

uint64_t __56__DDDetectionController_cancelURLificationForContainer___block_invoke_34(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)containerWillBeRemoved:(id)a3
{
  id v4 = a3;
  [(DDDetectionController *)self cancelURLificationForContainer:v4];
  protectQueue = self->_protectQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__DDDetectionController_containerWillBeRemoved___block_invoke;
  v7[3] = &unk_1E5A85428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(protectQueue, v7);
}

uint64_t __48__DDDetectionController_containerWillBeRemoved___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  return [v3 removeObjectForKey:v2];
}

+ (BOOL)_shouldConsiderResultForCoreRecents:(__DDResult *)a3
{
  CFStringRef Type = (const __CFString *)DDResultGetType();
  if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F010], 0))
  {
    LOBYTE(SubresultWithType) = 0;
  }
  else
  {
    SubresultWithCFStringRef Type = DDResultGetSubresultWithType();
    if (SubresultWithType)
    {
      DDResultGetRange();
      uint64_t v6 = v5;
      if (v5 >= 1
        && (CFArrayRef SubResults = (const __CFArray *)DDResultGetSubResults()) != 0
        && (CFArrayRef v8 = SubResults, Count = CFArrayGetCount(SubResults), Count >= 1))
      {
        CFIndex v10 = Count;
        CFIndex v11 = 0;
        uint64_t v12 = 0;
        CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F5F078];
        do
        {
          CFArrayGetValueAtIndex(v8, v11);
          CFStringRef v14 = (const __CFString *)DDResultGetType();
          if (CFEqual(v14, v13))
          {
            DDResultGetRange();
            v12 += v15;
          }
          ++v11;
        }
        while (v10 != v11);
      }
      else
      {
        uint64_t v12 = 0;
      }
      LOBYTE(SubresultWithType) = v6 > 0 && v12 + 5 < v6;
    }
  }
  return SubresultWithType;
}

void __41__DDDetectionController__doURLification___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = 0;
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F5F0A0];
    id v4 = MEMORY[0x1E4F14500];
    do
    {
      SubresultWithCFStringRef Type = [*(id *)(a1 + 32) objectAtIndex:v2];
      CFStringRef Type = (const __CFString *)DDResultGetType();
      CFComparisonResult v7 = CFStringCompare(Type, v3, 0);
      if (v7)
      {
        uint64_t SubResults = 0;
        if (SubresultWithType) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t SubResults = DDResultGetSubResults();
        SubresultWithCFStringRef Type = DDResultGetSubresultWithType();
        if (SubresultWithType)
        {
LABEL_7:
          if ([(id)objc_opt_class() _shouldConsiderResultForCoreRecents:SubresultWithType])
          {
            if (!SubResults)
            {
              id v9 = *(void **)(a1 + 32);
              CFIndex v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ReferenceDate"];
              uint64_t SubResults = (uint64_t)findNearbyResultsInArray(v9, v2, 50, 200, v10);
            }
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
            uint64_t v12 = [WeakRetained detectionController:*(void *)(a1 + 40) coreRecentsWeightForResult:SubresultWithType fromScanQuery:*(void *)(a1 + 64) inContainer:*(void *)(a1 + 56) partOfSignature:v7 == kCFCompareEqualTo];

            BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
            if (v12)
            {
              if (v13)
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v19 = SubresultWithType;
                __int16 v20 = 2112;
                id v21 = v12;
                _os_log_debug_impl(&dword_1A1709000, v4, OS_LOG_TYPE_DEBUG, "Magically adding result %@ to recents with score %@", buf, 0x16u);
              }
              CFStringRef v14 = [MEMORY[0x1E4F5F150] resultFromCoreResult:SubresultWithType];
              +[DDCoreRecents addResultToRecents:v14 associatedResults:SubResults weight:v12 context:*(void *)(a1 + 48) userInitiated:0];
            }
            else if (v13)
            {
              __41__DDDetectionController__doURLification___block_invoke_2_cold_1(v16, SubresultWithType, &v17);
            }
          }
        }
      }
      ++v2;
    }
    while (v2 < [*(id *)(a1 + 32) count]);
  }
  uint64_t v15 = *(const void **)(a1 + 64);
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_53(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_2_54(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[5] forKey:a1[6]];
}

- (id)actionsForResult:(__DDResult *)a3 context:(id)a4
{
  if (a3)
  {
    uint64_t v5 = [(DDActionController *)self->_actionController actionsForURL:0 result:a3 context:a4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)performAction:(id)a3 inView:(id)a4 interactionDelegate:(id)a5
{
  actionController = self->_actionController;
  id v9 = a4;
  id v10 = a3;
  [(DDActionController *)actionController setInteractionDelegate:a5];
  [(DDActionController *)self->_actionController setBaseView:v9];

  [(DDActionController *)self->_actionController performAction:v10];
}

- (void)performAction:(id)a3 fromAlertController:(id)a4 interactionDelegate:(id)a5
{
  actionController = self->_actionController;
  id v9 = a4;
  id v10 = a3;
  [(DDActionController *)actionController setInteractionDelegate:a5];
  [(DDActionController *)self->_actionController setAlertController:v9];

  [(DDActionController *)self->_actionController performAction:v10];
}

- (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6
{
  actionController = self->_actionController;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(DDActionController *)actionController setInteractionDelegate:a6];
  [(DDActionController *)self->_actionController setBaseView:v12];

  [(DDActionController *)self->_actionController setAlertController:v11];
  [(DDActionController *)self->_actionController performAction:v13];
}

- (BOOL)isPerformingAction
{
  return [(DDActionController *)self->_actionController isPerformingAction];
}

- (BOOL)actionIsCancellable
{
  return [(DDActionController *)self->_actionController actionIsCancellable];
}

- (void)cancelAction
{
}

- (BOOL)tryDismissActionInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDActionController *)self->_actionController baseView];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = v5;
  if (v4)
  {
    id v7 = [(DDActionController *)self->_actionController baseView];

    if (v7 != v4) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (![(DDActionController *)self->_actionController actionIsCancellable])
  {
    BOOL v8 = 0;
    goto LABEL_10;
  }
  [(DDActionController *)self->_actionController cancelAction];
LABEL_8:
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_shouldImmediatelyLaunchDefaultActionForURL:(id)a3 result:(__DDResult *)a4
{
  id v6 = a3;
  if (+[DDDetectionController largeScreenIdiom])
  {
    char v7 = 0;
  }
  else
  {
    if (a4)
    {
      [(DDDetectionController *)self _interactionDidStartForResult:a4];
    }
    else if (v6)
    {
      [(DDDetectionController *)self _interactionDidStartForURL:v6];
    }
    char v7 = dd_callsRequireExternalPrompt();
  }

  return v7;
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForURL:(id)a3
{
  return [(DDDetectionController *)self _shouldImmediatelyLaunchDefaultActionForURL:a3 result:0];
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForResult:(__DDResult *)a3
{
  return [(DDDetectionController *)self _shouldImmediatelyLaunchDefaultActionForURL:0 result:a3];
}

- (BOOL)shouldIgnoreMessageActionForURL:(id)a3
{
  char v4 = 0;
  if (!a3) {
    return 1;
  }
  BOOL result = [(DDDetectionController *)self _checkIfBusinessWithURL:a3 messageable:&v4];
  if (v4) {
    return 0;
  }
  return result;
}

+ (BOOL)largeScreenIdiom
{
  unint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 == 6 || (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (__DDResult)_resultForIdentifier:(id)a3 forContainer:(id)a4 context:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  Main = CFRunLoopGetMain();
  if (Main != CFRunLoopGetCurrent())
  {
    id v27 = a5;
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"-[DDDetectionController _resultForIdentifier:forContainer:context:]"];
    [v28 handleFailureInFunction:v29 file:@"DDDetectionController.m" lineNumber:648 description:@"Main thread violation"];

    a5 = v27;
  }
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__DDDetectionController__resultForIdentifier_forContainer_context___block_invoke;
  block[3] = &unk_1E5A856E0;
  v37 = &v45;
  void block[4] = self;
  id v12 = v9;
  id v36 = v12;
  id v38 = &v39;
  dispatch_sync(protectQueue, block);
  id v13 = (void *)v46[5];
  if (v13)
  {
    v30 = a5;
    id v14 = v13;
    uint64_t v15 = [v8 componentsSeparatedByString:@"/"];
    if ([v15 count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v32;
        while (2)
        {
          uint64_t v19 = 0;
          __int16 v20 = v14;
          do
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = [*(id *)(*((void *)&v31 + 1) + 8 * v19) integerValue];
            if (v21 < 0 || v21 >= [v20 count])
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[DDDetectionController _resultForIdentifier:forContainer:context:]();
              }

              uint64_t v22 = 0;
              goto LABEL_30;
            }
            uint64_t v22 = (__DDResult *)[v20 objectAtIndex:v21];
            DDResultGetSubResults();
            id v14 = (id)objc_claimAutoreleasedReturnValue();

            ++v19;
            __int16 v20 = v14;
          }
          while (v17 != v19);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v51 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v22 = 0;
      }

      if (v30)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        CFTypeRef v24 = v23;
        if (v40[5]) {
          objc_msgSend(v23, "addEntriesFromDictionary:");
        }
        [v24 setObject:v46[5] forKey:@"AllResults"];
        id v25 = v24;
        id *v30 = v25;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDDetectionController _resultForIdentifier:forContainer:context:]();
      }
      uint64_t v22 = 0;
    }
    __int16 v20 = v14;
LABEL_30:
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController _resultForIdentifier:forContainer:context:]();
    }
    uint64_t v22 = 0;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

uint64_t __67__DDDetectionController__resultForIdentifier_forContainer_context___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (__DDResult)_resultForURL:(id)a3 forContainer:(id)a4 context:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 scheme];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F5F140]];

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController _resultForURL:forContainer:context:](v8);
    }
    goto LABEL_8;
  }
  id v12 = [v8 resourceSpecifier];
  char v13 = [v12 hasPrefix:@"//"];

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController _resultForURL:forContainer:context:](v8);
    }
LABEL_8:
    id v16 = 0;
    goto LABEL_9;
  }
  id v14 = [v8 resourceSpecifier];
  uint64_t v15 = [v14 substringFromIndex:2];

  id v16 = [(DDDetectionController *)self _resultForIdentifier:v15 forContainer:v9 context:a5];
LABEL_9:

  return v16;
}

- (BCSBusinessQueryService)_bizService
{
  bizService = self->_bizService;
  if (!bizService)
  {
    gotLoadHelper_x8__OBJC_CLASS___BCSBusinessQueryService(v2);
    id v6 = (BCSBusinessQueryService *)objc_alloc_init(*(Class *)(v5 + 3352));
    char v7 = self->_bizService;
    self->_bizService = v6;

    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_set_bizService_ object:0];
    [(DDDetectionController *)self performSelector:sel_set_bizService_ withObject:0 afterDelay:5.0];
    bizService = self->_bizService;
  }
  return bizService;
}

- (void)_interactionDidStartForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (_supportsBusinessService())
    {
      uint64_t v5 = objc_msgSend(v6, "dd_phoneNumberFromTelScheme");
      [(DDDetectionController *)self _cacheBusinessPhoneNumber:v5];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)_interactionDidStartForResult:(__DDResult *)a3
{
  if (a3 && DDResultGetCategory() == 2 && _supportsBusinessService())
  {
    id v5 = [(DDDetectionController *)self _phoneNumberFromResult:a3];
    [(DDDetectionController *)self _cacheBusinessPhoneNumber:v5];
  }
}

- (void)_cacheBusinessPhoneNumber:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 containsString:@"@"] & 1) == 0)
  {
    id v6 = [(DDDetectionController *)self _bizService];
    if (v6)
    {
      v8[0] = v5;
      char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v6 warmCacheIfNecessaryForPhoneNumbers:v7];
    }
  }
}

- (BOOL)_shouldImmediatelyShowActionSheetForCoreResult:(__DDResult *)a3
{
  int Category = DDResultGetCategory();
  int v6 = DDShouldImmediatelyShowActionSheetForResult();
  if (Category == 2)
  {
    if (dd_phoneNumberResultCanBeRdarLink((BOOL)a3)
      || v6 && +[DDCallAction isAvailable])
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      return ![(DDDetectionController *)self shouldImmediatelyLaunchDefaultActionForResult:a3];
    }
  }
  return v6;
}

- (id)_ensureURLIsURL:(id)a3
{
  id v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
LABEL_4:
    id v5 = v4;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (BOOL)_shouldImmediatelyShowActionSheetForURL:(id)a3
{
  id v3 = dd_ensureUrlIsUrl(a3);
  char v4 = DDShouldImmediatelyShowActionSheetForURL();

  return v4;
}

- (BOOL)_checkIfBusinessWithURL:(id)a3 messageable:(BOOL *)a4
{
  int v6 = dd_ensureUrlIsUrl(a3);
  if (objc_msgSend(v6, "dd_isAnySimpleTelephonyScheme"))
  {
    char v7 = objc_msgSend(v6, "dd_phoneNumberFromTelScheme");
    BOOL v8 = [(DDDetectionController *)self _phoneNumberIsABusinessNumber:v7 messageable:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_checkIfBusinessWithResult:(__DDResult *)a3 messageable:(BOOL *)a4
{
  if (!a3) {
    return 0;
  }
  int Category = DDResultGetCategory();
  if (Category != 1)
  {
    if (Category == 2)
    {
      BOOL v8 = [(DDDetectionController *)self _phoneNumberFromResult:a3];
      if ([v8 length])
      {
        uint64_t v9 = TUUnformattedPhoneNumber();
        id v10 = (void *)v9;
        if (v9) {
          char v11 = (void *)v9;
        }
        else {
          char v11 = v8;
        }
        id v12 = v11;

        BOOL v8 = v12;
      }
      BOOL v13 = [(DDDetectionController *)self _phoneNumberIsABusinessNumber:v8 messageable:a4];
      goto LABEL_12;
    }
    return 0;
  }
  uint64_t v14 = DDResultCopyExtractedURL();
  if (!v14) {
    return 0;
  }
  BOOL v8 = (void *)v14;
  uint64_t v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
  BOOL v13 = [(DDDetectionController *)self _checkIfBusinessWithURL:v15 messageable:a4];

LABEL_12:
  return v13;
}

- (id)_phoneNumberFromResult:(__DDResult *)a3
{
  DDResultCopyPhoneValue();
  return 0;
}

- (BOOL)_phoneNumberIsABusinessNumber:(id)a3 messageable:(BOOL *)a4
{
  char v4 = [(DDDetectionController *)self _businessItemForNumber:a3 messageable:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_businessItemForNumber:(id)a3 messageable:(BOOL *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length] && (dd_handleIsChatBot(v6) & 1) == 0 && _supportsBusinessService())
  {
    char v7 = [(DDDetectionController *)self _bizService];
    if (v7)
    {
      BOOL v8 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v9 = dispatch_group_create();
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      long long v32 = __Block_byref_object_copy_;
      long long v33 = __Block_byref_object_dispose_;
      id v34 = 0;
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      dispatch_group_enter(v9);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __60__DDDetectionController__businessItemForNumber_messageable___block_invoke;
      v19[3] = &unk_1E5A85730;
      id v10 = v9;
      __int16 v20 = v10;
      id v21 = v7;
      id v22 = v6;
      id v23 = &v29;
      CFTypeRef v24 = &v25;
      [v21 isBusinessRegisteredForPhoneNumber:v22 completion:v19];
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v10, v11))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "BCS query timed out", buf, 2u);
        }
        id v12 = 0;
      }
      else
      {
        uint64_t v14 = MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = v30[5];
          int v17 = *((unsigned __int8 *)v26 + 24);
          [v8 timeIntervalSinceNow];
          *(_DWORD *)buf = 67109632;
          BOOL v36 = v16 != 0;
          __int16 v37 = 1024;
          int v38 = v17;
          __int16 v39 = 2048;
          double v40 = -v18;
          _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Phone number properties business:%d messageable:%d duration:%f (BCS)", buf, 0x18u);
        }

        if (a4) {
          *a4 = *((unsigned char *)v26 + 24);
        }
        id v12 = (id)v30[5];
      }

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __60__DDDetectionController__businessItemForNumber_messageable___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5 || !a2)
  {
    if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v13 = v6;
      _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable determine phone business status BCS: %@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    char v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__DDDetectionController__businessItemForNumber_messageable___block_invoke_2;
    v9[3] = &unk_1E5A85708;
    long long v11 = *(_OWORD *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    [v7 fetchBusinessItemForPhoneNumber:v8 completion:v9];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__DDDetectionController__businessItemForNumber_messageable___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to fetch business details BCS: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (v8) {
      char v10 = a3;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)barcodeContext:(id)a3 preview:(BOOL)a4 contact:(id)a5 ics:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4
    || ([MEMORY[0x1E4F28B50] mainBundle],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 bundleIdentifier],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEqualToString:@"com.apple.BarcodeSupport.BarcodeNotificationService"],
        v13,
        v12,
        v14))
  {
    uint64_t v15 = +[DDAction contextByAddingValue:MEMORY[0x1E4F1CC38] toKey:@"NotificationStyle" inContext:v9];

    id v9 = (id)v15;
  }
  uint64_t v16 = +[DDAction contextByAddingValue:MEMORY[0x1E4F1CC38] toKey:@"HeyBarcodeSheet" inContext:v9];

  if (v10)
  {
    uint64_t v17 = +[DDAction contextByAddingValue:v10 toKey:@"Contact" inContext:v16];

    uint64_t v16 = (void *)v17;
  }
  if (v11)
  {
    uint64_t v18 = +[DDAction contextByAddingValue:v11 toKey:@"ICS" inContext:v16];

    uint64_t v16 = (void *)v18;
  }

  return v16;
}

- (id)barcodeActionsForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7
{
  id v12 = a4;
  uint64_t v13 = +[DDDetectionController barcodeContext:a3 preview:0 contact:a6 ics:a7];
  int v14 = [(DDActionController *)self->_actionController actionsForURL:v12 result:a5 context:v13];

  return v14;
}

- (id)barcodeDefaultActionForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7
{
  id v12 = a4;
  uint64_t v13 = +[DDDetectionController barcodeContext:a3 preview:0 contact:a6 ics:a7];
  int v14 = [(DDActionController *)self->_actionController defaultActionForURL:v12 result:a5 context:v13];

  return v14;
}

- (id)barcodePreviewActionForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7
{
  id v11 = a4;
  id v12 = +[DDDetectionController barcodeContext:a3 preview:1 contact:a6 ics:a7];
  uint64_t v13 = +[DDPreviewAction previewActionForURL:v11 result:a5 context:v12];

  return v13;
}

+ (unint64_t)allPublicTypes
{
  return 511;
}

+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 count];
  if (v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
    int v14 = +[DDOperation shouldUrlifyBlockForTypes:a4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (((unsigned int (**)(void, uint64_t, id, id))v14)[2](v14, [v20 coreResult], v10, v11))
          {
            [v13 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }

    id v9 = v22;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

+ (id)lightUnderlineColorFromTextColor:(id)a3
{
  double v9 = 0.0;
  uint64_t v10 = 0;
  double v8 = 0.0;
  id v3 = a3;
  [v3 getHue:&v10 saturation:&v9 brightness:&v8 alpha:0];
  BOOL v4 = v8 > 0.98 && v9 < 0.02;
  double v5 = 0.26;
  if (v4) {
    double v5 = 0.46;
  }
  id v6 = [v3 colorWithAlphaComponent:v5];

  return v6;
}

- (void)set_bizService:(id)a3
{
}

- (DDDetectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDDetectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bizService, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_containerToContextsTable, 0);
  objc_storeStrong((id *)&self->_containerToResultsTable, 0);
  objc_storeStrong((id *)&self->_containerToOperationsTable, 0);
  objc_storeStrong((id *)&self->_protectQueue, 0);
  objc_storeStrong((id *)&self->_urlScannerQueue, 0);
  objc_storeStrong((id *)&self->_fullScannerQueue, 0);
}

- (void)resetResultsForFrame:(id)a3
{
  id v4 = a3;
  [(DDDetectionController *)self _commonResetResultsForContainer:v4];
  if (WebThreadIsEnabled())
  {
    id v9 = v4;
    WebThreadRun();
  }
  else
  {
    Main = CFRunLoopGetMain();
    if (Main != CFRunLoopGetCurrent())
    {
      char v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[DDDetectionController(WebKitBackEnd) resetResultsForFrame:]"];
      [v7 handleFailureInFunction:v8 file:@"DDDetectionController+WebKit.m" lineNumber:77 description:@"Main thread violation"];
    }
    id v6 = [v4 DOMDocument];
    objc_msgSend(v6, "dd_resetResults");
  }
}

void __61__DDDetectionController_WebKitBackEnd__resetResultsForFrame___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) DOMDocument];
  objc_msgSend(v1, "dd_resetResults");
}

- (BOOL)shouldImmediatelyShowActionSheetForURL:(id)a3 forFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 scheme];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F5F140]];

  if (v9
    && (uint64_t v10 = [(DDDetectionController *)self _resultForURL:v6 forContainer:v7 context:0]) != 0)
  {
    BOOL v11 = [(DDDetectionController *)self _shouldImmediatelyShowActionSheetForCoreResult:v10];
  }
  else
  {
    BOOL v11 = [(DDDetectionController *)self _shouldImmediatelyShowActionSheetForURL:v6];
  }
  BOOL v12 = v11;

  return v12;
}

- (id)_plainTextAugmentedContext:(id)a3 withFrame:(id)a4
{
  id v4 = (void *)[a3 mutableCopy];
  double v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v7 = v6;

  [v7 setObject:&stru_1EF5023D8 forKey:@"LeadingText"];
  [v7 setObject:&stru_1EF5023D8 forKey:@"TrailingText"];
  double v8 = (void *)[v7 copy];

  return v8;
}

- (__DDResult)_resultForAnchor:(id)a3 forFrame:(id)a4 context:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 absoluteLinkURL];
  BOOL v11 = [v9 getAttribute:@"x-apple-data-detectors-result"];

  if (!v11
    || ![v11 length]
    || (BOOL v12 = [(DDDetectionController *)self _resultForIdentifier:v11 forContainer:v8 context:a5]) == 0)
  {
    uint64_t v13 = [v10 scheme];
    uint64_t v14 = *MEMORY[0x1E4F5F140];
    int v15 = [v13 isEqualToString:*MEMORY[0x1E4F5F140]];

    if (!v15
      || (BOOL v12 = [(DDDetectionController *)self _resultForURL:v10 forContainer:v8 context:a5]) == 0)
    {
      uint64_t v19 = [(id)objc_opt_class() tapAndHoldSchemes];
      __int16 v20 = [v10 scheme];
      id v21 = [v20 lowercaseString];
      if ([v19 containsObject:v21])
      {
        id v22 = [v10 scheme];
        int v23 = [v22 isEqualToString:v14];

        if (!v23)
        {
LABEL_16:
          BOOL v12 = 0;
          goto LABEL_19;
        }
      }
      else
      {
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDDetectionController(WebKitBackEnd) _resultForAnchor:forFrame:context:](v10, (uint64_t)v8);
      }
      goto LABEL_16;
    }
  }
  if (v8 && a5)
  {
    uint64_t v16 = [v8 frameView];
    uint64_t v17 = [v16 documentView];
    uint64_t v18 = [v17 selectedString];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*a5 setObject:v18 forKey:@"SelectedText"];
    }
    else
    {
      long long v24 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*a5];
      [v24 setObject:v18 forKey:@"SelectedText"];
      id v25 = v24;
      *a5 = v25;
    }
  }
LABEL_19:

  return v12;
}

- (__DDResult)resultForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [(DDDetectionController *)self _resultForAnchor:v6 forFrame:v7 context:0];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)actionsForURL:(id)a3
{
  return [(DDActionController *)self->_actionController actionsForURL:a3 result:0 context:0];
}

- (id)actionsForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5
{
  id v15 = 0;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(DDDetectionController *)self resultForNode:a3 url:v9 frame:v8 contextRef:&v15];
  id v11 = v15;
  BOOL v12 = [(DDDetectionController *)self _plainTextAugmentedContext:v11 withFrame:v8];

  uint64_t v13 = [(DDActionController *)self->_actionController actionsForURL:v9 result:v10 context:v12];

  return v13;
}

- (__DDResult)_resultForIdentifier:(id)a3 withResults:(id)a4 context:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    id v11 = [v7 componentsSeparatedByString:@"/"];
    if ([v11 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v44 = v10;
        uint64_t v45 = a5;
        uint64_t v15 = *(void *)v47;
        uint64_t v16 = (uint64_t)v10;
        while (2)
        {
          uint64_t v17 = 0;
          id v10 = (id)v16;
          do
          {
            if (*(void *)v47 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v17), "integerValue", v44, v45, (void)v46);
            if (v18 < 0 || v18 >= [v10 count])
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:](v18, v27, v28, v29, v30, v31, v32, v33);
              }

              goto LABEL_21;
            }
            uint64_t v19 = (__DDResult *)[v10 objectAtIndex:v18];
            uint64_t v16 = DDResultGetSubResults();

            ++v17;
            id v10 = (id)v16;
          }
          while (v14 != v17);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        id v10 = v44;
        a5 = v45;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v16 = (uint64_t)v10;
      }

      if (a5)
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v41 setObject:v10 forKey:@"AllResults"];
        id v42 = v41;
        *a5 = v42;
      }
      id v10 = (id)v16;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:]((uint64_t)v7, v34, v35, v36, v37, v38, v39, v40);
      }
LABEL_21:
      uint64_t v19 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:]((uint64_t)v7, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

- (__DDResult)_resultForURL:(id)a3 withResults:(id)a4 context:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 scheme];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F5F140]];

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController(WebKitBackEnd) _resultForURL:withResults:context:](v8);
    }
    goto LABEL_8;
  }
  id v12 = [v8 resourceSpecifier];
  char v13 = [v12 hasPrefix:@"//"];

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[DDDetectionController(WebKitBackEnd) _resultForURL:withResults:context:](v8);
    }
LABEL_8:
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = [v8 resourceSpecifier];
  uint64_t v15 = [v14 substringFromIndex:2];
  uint64_t v16 = [(DDDetectionController *)self _resultForIdentifier:v15 withResults:v9 context:a5];

LABEL_9:
  return v16;
}

- (__DDResult)resultForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7 extendedContext:(id *)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v36 = a5;
  id v16 = a6;
  id v37 = a7;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v22++), "coreResult", v36));
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v20);
  }

  if (v15 && [v15 length])
  {
    id v39 = 0;
    uint64_t v23 = [(DDDetectionController *)self _resultForIdentifier:v15 withResults:v17 context:&v39];
    id v24 = v39;
    uint64_t v25 = v37;
    if (v23) {
      goto LABEL_15;
    }
  }
  else
  {
    id v24 = 0;
    uint64_t v25 = v37;
  }
  uint64_t v26 = objc_msgSend(v14, "scheme", v36);
  int v27 = [v26 isEqualToString:*MEMORY[0x1E4F5F140]];

  if (!v27)
  {
    uint64_t v23 = 0;
    if (!a8) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  id v38 = v24;
  uint64_t v23 = [(DDDetectionController *)self _resultForURL:v14 withResults:v17 context:&v38];
  id v28 = v38;

  id v24 = v28;
LABEL_15:
  if (!a8) {
    goto LABEL_20;
  }
LABEL_16:
  if (v24) {
    uint64_t v29 = v24;
  }
  else {
    uint64_t v29 = v25;
  }
  *a8 = v29;
LABEL_20:
  if (v23)
  {
    uint64_t v30 = v36;
    if (v24)
    {
      [v24 setObject:v36 forKey:@"SelectedText"];
      if (v25) {
        [v24 addEntriesFromDictionary:v25];
      }
    }
  }
  else
  {
    uint64_t v31 = [(id)objc_opt_class() tapAndHoldSchemes];
    uint64_t v32 = [v14 scheme];
    uint64_t v33 = [v32 lowercaseString];
    if ([v31 containsObject:v33])
    {
      uint64_t v34 = [v14 scheme];
      [v34 isEqualToString:*MEMORY[0x1E4F5F140]];

      uint64_t v25 = v37;
    }

    uint64_t v30 = v36;
  }

  return v23;
}

- (id)actionsForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7
{
  id v17 = 0;
  id v12 = a3;
  char v13 = [(DDDetectionController *)self resultForURL:v12 identifier:a4 selectedText:a5 results:a6 context:a7 extendedContext:&v17];
  id v14 = v17;
  id v15 = [(DDActionController *)self->_actionController actionsForURL:v12 result:v13 context:v14];

  return v15;
}

- (id)defaultActionForURL:(id)a3 results:(id)a4 context:(id)a5
{
  id v13 = 0;
  id v8 = a3;
  id v9 = [(DDDetectionController *)self resultForURL:v8 identifier:0 selectedText:&stru_1EF5023D8 results:a4 context:a5 extendedContext:&v13];
  id v10 = v13;
  char v11 = [(DDActionController *)self->_actionController defaultActionForURL:v8 result:v9 context:v10];

  return v11;
}

- (id)titleForURL:(id)a3 results:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    char v11 = [(DDDetectionController *)self resultForURL:v8 identifier:0 selectedText:&stru_1EF5023D8 results:v9 context:v10 extendedContext:0];
    if (v11) {
      actionSheetTitleForResult((uint64_t)v11);
    }
    else {
    id v12 = actionSheetTitleForURL(v8);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)attributedTitleForURL:(id)a3 updaterBlock:(id)a4
{
  if (a3)
  {
    id v4 = [(DDDetectionController *)self titleForURL:a3 results:0 context:0];
    if (v4) {
      double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)attributedTitleForResult:(__DDResult *)a3 updaterBlock:(id)a4
{
  if (a3)
  {
    id v4 = [(DDDetectionController *)self titleForResult:a3 subResult:0 withURL:0 context:0];
    if (v4) {
      double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)actionsForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6 = a4;
  id v7 = linkAncestorOfNode(a3);
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 absoluteLinkURL];
    id v10 = [(DDDetectionController *)self actionsForAnchor:v8 url:v9 forFrame:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (__DDResult)resultForNode:(id)a3 url:(id)a4 frame:(id)a5 contextRef:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (id v13 = [(DDDetectionController *)self _resultForAnchor:v10 forFrame:v12 context:a6]) == 0)
  {
    id v14 = [v11 scheme];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F5F140]];

    if (v15) {
      id v13 = [(DDDetectionController *)self _resultForURL:v11 forContainer:v12 context:a6];
    }
    else {
      id v13 = 0;
    }
  }

  return v13;
}

- (id)defaultActionForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5
{
  id v15 = 0;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(DDDetectionController *)self resultForNode:a3 url:v9 frame:v8 contextRef:&v15];
  id v11 = v15;
  id v12 = [(DDDetectionController *)self _plainTextAugmentedContext:v11 withFrame:v8];

  id v13 = [(DDActionController *)self->_actionController defaultActionForURL:v9 result:v10 context:v12];

  return v13;
}

- (id)defaultActionForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = linkAncestorOfNode(v6);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 absoluteLinkURL];
    id v11 = [(DDDetectionController *)self defaultActionForAnchor:v9 url:v10 forFrame:v7];
LABEL_3:

    goto LABEL_9;
  }
  id v12 = v6;
  if (v12)
  {
    id v10 = v12;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v13 = [v10 parentNode];

      id v10 = (void *)v13;
      if (!v13) {
        goto LABEL_8;
      }
    }
    id v15 = (void *)MEMORY[0x1E4F1CB10];
    id v16 = [v10 action];
    id v17 = [v15 URLWithString:v16];

    id v11 = [(DDDetectionController *)self defaultActionForAnchor:0 url:v17 forFrame:v7];

    goto LABEL_3;
  }
LABEL_8:
  id v11 = 0;
LABEL_9:

  return v11;
}

+ (id)updateContext:(id)a3 forResult:(__DDResult *)a4 atIndex:(unint64_t)a5 ofStorage:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = [v9 attribute:@"DDContext" atIndex:a5 effectiveRange:0];
  id v12 = +[DDAction contextByAddingValue:v9 toKey:@"TextStorage" inContext:v10];

  if (v11) {
    [v12 addEntriesFromDictionary:v11];
  }
  long long v21 = xmmword_1A175CCF0;
  if (a4)
  {
    uint64_t Range = DDResultGetRange();
    *(void *)&long long v21 = Range;
    *((void *)&v21 + 1) = v14;
  }
  else
  {
    id v15 = (id)[v9 attribute:*MEMORY[0x1E4F42530] atIndex:a5 effectiveRange:&v21];
    uint64_t Range = v21;
  }
  if (Range != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [v9 string];
    id v17 = objc_msgSend(v16, "dd_leadingTextWithNumberOfCharacters:beforeRange:", 350, v21);
    id v18 = objc_msgSend(v16, "dd_trailingTextWithNumberOfCharacters:afterRange:", 350, v21);
    if (*((void *)&v21 + 1))
    {
      uint64_t v19 = objc_msgSend(v16, "dd_trailingTextWithNumberOfCharacters:afterRange:", *((void *)&v21 + 1), (void)v21, 0);
      [v12 setObject:v19 forKey:@"MiddleText"];
    }
    objc_msgSend(v12, "setObject:forKey:", v17, @"LeadingText", (void)v21);
    [v12 setObject:v18 forKey:@"TrailingText"];
  }
  return v12;
}

- (void)resetResultsForTextView:(id)a3
{
  id v4 = a3;
  [(DDDetectionController *)self _commonResetResultsForContainer:v4];
  id v5 = [v4 textStorage];

  objc_msgSend(v5, "dd_resetResults");
}

- (id)_subResultAtIndex:(unint64_t)a3 ofResult:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(a4, "subResults", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v11 = [v10 range];
        if (a3 >= v11 && a3 - v11 < v12)
        {
          id v14 = v10;
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

- (__DDResult)resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  uint64_t v6 = [a4 attribute:*MEMORY[0x1E4F5F118] atIndex:a3 effectiveRange:0];
  uint64_t v7 = [v6 type];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F5F0A0]];

  if (v8)
  {
    id v9 = [(DDDetectionController *)self _subResultAtIndex:a3 ofResult:v6];
    id v10 = (__DDResult *)[v9 coreResult];
  }
  else
  {
    id v10 = (__DDResult *)[v6 coreResult];
  }

  return v10;
}

- (id)linkAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  id v7 = 0;
  id v4 = [(DDDetectionController *)self _resultForLinkAtIndex:a3 inTextStorage:a4 subResult:0 url:&v7 effectiveRange:0];
  id v5 = v7;
  return v5;
}

- (BOOL)shouldImmediatelyShowActionSheetForTapAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v6 = a4;
  id v14 = 0;
  id v7 = [(DDDetectionController *)self _resultForLinkAtIndex:a3 inTextStorage:v6 subResult:&v14 url:0 effectiveRange:0];
  id v8 = v14;
  id v9 = v8;
  if (v7)
  {
    if (!v8) {
      id v8 = v7;
    }
    BOOL v10 = -[DDDetectionController _shouldImmediatelyShowActionSheetForCoreResult:](self, "_shouldImmediatelyShowActionSheetForCoreResult:", [v8 coreResult]);
  }
  else
  {
    unint64_t v11 = [v6 attribute:*MEMORY[0x1E4F42530] atIndex:a3 effectiveRange:0];
    unint64_t v12 = [(DDDetectionController *)self _URLForLinkAttributeValue:v11];
    if (v12) {
      BOOL v10 = [(DDDetectionController *)self _shouldImmediatelyShowActionSheetForURL:v12];
    }
    else {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForTapAndHoldAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v6 = a4;
  id v7 = [v6 attribute:*MEMORY[0x1E4F42530] atIndex:a3 effectiveRange:0];
  id v8 = [(DDDetectionController *)self _URLForLinkAttributeValue:v7];
  if (v8)
  {
    BOOL v9 = [(DDDetectionController *)self shouldImmediatelyLaunchDefaultActionForURL:v8];
  }
  else
  {
    BOOL v10 = [(DDDetectionController *)self _resultForLinkAtIndex:a3 inTextStorage:v6 subResult:0 url:0 effectiveRange:0];
    unint64_t v11 = v10;
    BOOL v9 = v10
      && (uint64_t v12 = [v10 coreResult]) != 0
      && [(DDDetectionController *)self shouldImmediatelyLaunchDefaultActionForResult:v12];
  }
  return v9;
}

- (id)_applyBlock:(id)a3 withResultsAtIndex:(unint64_t)a4 ofStorage:(id)a5 context:(id)a6
{
  BOOL v10 = (void (**)(id, id, void *, id, void *))a3;
  id v11 = a5;
  id v12 = a6;
  id v21 = 0;
  id v22 = 0;
  uint64_t v13 = [(DDDetectionController *)self _resultForLinkAtIndex:a4 inTextStorage:v11 subResult:&v22 url:&v21 effectiveRange:0];
  id v14 = v22;
  id v15 = v21;
  if (v13
    || ([v11 attribute:*MEMORY[0x1E4F42530] atIndex:a4 effectiveRange:0],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        [(DDDetectionController *)self _URLForLinkAttributeValue:v16],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v15,
        v16,
        (id v15 = (id)v17) != 0))
  {
    long long v18 = +[DDDetectionController updateContext:forResult:atIndex:ofStorage:](DDDetectionController, "updateContext:forResult:atIndex:ofStorage:", v12, [v13 coreResult], a4, v11);
    long long v19 = v10[2](v10, v14, v13, v15, v18);
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (id)actionsAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__DDDetectionController_TextKitBackEnd__actionsAtIndex_ofStorage_context___block_invoke;
  v7[3] = &unk_1E5A85EF8;
  v7[4] = self;
  id v5 = [(DDDetectionController *)self _applyBlock:v7 withResultsAtIndex:a3 ofStorage:a4 context:a5];
  return v5;
}

id __74__DDDetectionController_TextKitBackEnd__actionsAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = *(void **)(*(void *)(a1 + 32) + 56);
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (a2) {
    id v12 = a2;
  }
  else {
    id v12 = a3;
  }
  if (a2) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [v12 coreResult];
  uint64_t v15 = [v13 coreResult];

  long long v16 = [v8 actionsForURL:v10 result:v14 enclosingResult:v15 context:v9];

  return v16;
}

- (id)titleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__DDDetectionController_TextKitBackEnd__titleForResultAtIndex_ofStorage_context___block_invoke;
  v7[3] = &unk_1E5A85EF8;
  v7[4] = self;
  id v5 = [(DDDetectionController *)self _applyBlock:v7 withResultsAtIndex:a3 ofStorage:a4 context:a5];
  return v5;
}

id __81__DDDetectionController_TextKitBackEnd__titleForResultAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = *(void **)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  uint64_t v12 = [a3 coreResult];
  uint64_t v13 = [v11 coreResult];

  uint64_t v14 = [v8 titleForResult:v12 subResult:v13 withURL:v10 context:v9];

  return v14;
}

- (id)defaultActionAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__DDDetectionController_TextKitBackEnd__defaultActionAtIndex_ofStorage_context___block_invoke;
  v7[3] = &unk_1E5A85EF8;
  v7[4] = self;
  id v5 = [(DDDetectionController *)self _applyBlock:v7 withResultsAtIndex:a3 ofStorage:a4 context:a5];
  return v5;
}

id __80__DDDetectionController_TextKitBackEnd__defaultActionAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v6 = *(void **)(*(void *)(a1 + 32) + 56);
  if (a2) {
    a3 = a2;
  }
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_msgSend(v6, "defaultActionForURL:result:context:", v9, objc_msgSend(a3, "coreResult"), v8);

  return v10;
}

- (id)titleForResult:(__DDResult *)a3 subResult:(__DDResult *)a4 withURL:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4) {
    id v11 = a4;
  }
  else {
    id v11 = a3;
  }
  if (v11)
  {
    uint64_t v12 = actionSheetTitleForResult((uint64_t)v11);
LABEL_6:
    uint64_t v13 = (void *)v12;
    goto LABEL_10;
  }
  if (v9)
  {
    uint64_t v14 = [v9 scheme];
    char v15 = [v14 isEqualToString:@"x-apple-data-detectors-clientdefined"];

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = dd_urlUserVisibleString(v9);
      goto LABEL_6;
    }
  }
  uint64_t v13 = 0;
LABEL_10:
  if ((unint64_t)[v13 length] >= 0xC9)
  {
    long long v16 = [v13 substringToIndex:200];
    uint64_t v17 = [v16 stringByAppendingString:@"…"];

    uint64_t v13 = (void *)v17;
  }

  return v13;
}

- (id)attributedTitleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 updaterBlock:(id)a5
{
  id v5 = [(DDDetectionController *)self titleForResultAtIndex:a3 ofStorage:a4 context:0];
  if (v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_URLForLinkAttributeValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)interactionDidStartAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__DDDetectionController_TextKitBackEnd__interactionDidStartAtIndex_ofStorage___block_invoke;
  v5[3] = &unk_1E5A85EF8;
  void v5[4] = self;
  id v4 = [(DDDetectionController *)self _applyBlock:v5 withResultsAtIndex:a3 ofStorage:a4 context:0];
}

uint64_t __78__DDDetectionController_TextKitBackEnd__interactionDidStartAtIndex_ofStorage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4) {
    [*(id *)(a1 + 32) _interactionDidStartForURL:a4];
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_interactionDidStartForResult:", objc_msgSend(a3, "coreResult"));
  }
  return 0;
}

- (void)urlifyTextView:(id)a3 withExternalResults:(id)a4 context:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F29060];
  id v11 = a5;
  if (([v10 isMainThread] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DDDetectionController+TextKit.m" lineNumber:343 description:@"-[DDDetectionController urlifyTextView:withExternalResults:context:] Should be called from the main thread"];
  }
  id v12 = [v9 valueForKey:@"coreResult"];

  [(DDDetectionController *)self setResults:v12 forContainer:v15];
  if (v12) {
    CFRelease(v12);
  }
  [(DDDetectionController *)self setContext:v11 forContainer:v15];
  uint64_t v13 = [[DDTextKitOperation alloc] initWithContainer:v15];
  [(DDOperation *)v13 setDetectionTypes:0x7FFFFFFFLL];
  [(DDOperation *)v13 setContext:v11];

  [(DDOperation *)v13 setScannerResults:v9];
  [(DDTextKitOperation *)v13 doURLificationOnDocument];
  [(DDTextKitOperation *)v13 cleanup];
}

void __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2_cold_1(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "dispatchScanQueryCreationWithCompletionBlock of operation %@ completion block: success: %d", (uint8_t *)&v3, 0x12u);
}

- (void)startURLificationForContainer:detectedTypes:options:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "called -startURLificationForContainer:%p detectedTypes:%lx, should probably not happen", v1, v2, v3, v4, v5);
}

- (void)startURLificationForContainer:detectedTypes:options:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "UIDataDetectorTypeLegacyPhoneNumber is incompatible with other types (%lx)", v1, v2, v3, v4, v5);
}

- (void)startURLificationForContainer:(uint64_t)a1 detectedTypes:(uint64_t)a2 options:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "startURLificationForContainer %@ (types %lx) created operation %@", (uint8_t *)&v3, 0x20u);
}

void __43__DDDetectionController__enqueueOperation___block_invoke_cold_1(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Firing completion block for %@", v3, v4, v5, v6, v7);
}

- (void)cancelURLificationForContainer:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Cancelling operation for container %@.", v1, v2, v3, v4, v5);
}

- (void)_doURLification:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Operation %@: container %p has been modified too many times, aborting", v1, v2, v3, v4, v5);
}

- (void)_doURLification:.cold.2()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Operation %@: container %@ was modified after the call to -startURLificationForFrame:.", v0, 0x16u);
}

- (void)_doURLification:.cold.3()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "scan for operation %@ cancelled or results nil (%@)", v0, 0x16u);
}

- (void)_doURLification:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "%@ got an exception in doURLificationOnDocument: %@", v1, v2, v3, v4, v5);
}

- (void)_doURLification:(uint64_t)a3 .cold.5(uint64_t a1, uint8_t *buf, uint64_t a3)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "scan for operation %@ need to start over (%ld results)", buf, 0x16u);
}

- (void)_doURLification:(uint8_t *)buf .cold.6(uint64_t a1, uint64_t a2, uint8_t *buf, uint64_t a4)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = a4;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "scan for operation %@ replaced by another operation %@ (%ld results)", buf, 0x20u);
}

- (void)_doURLification:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "%@", v1, v2, v3, v4, v5);
}

void __41__DDDetectionController__doURLification___block_invoke_2_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Not adding result %@ to the recents because we got back a null weight", buf, 0xCu);
}

- (void)_resultForIdentifier:forContainer:context:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "No known results for this container: %p", v1, v2, v3, v4, v5);
}

- (void)_resultForIdentifier:forContainer:context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Unparseable result identifier %@", v1, v2, v3, v4, v5);
}

- (void)_resultForIdentifier:forContainer:context:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "result number out of bounds %li", v1, v2, v3, v4, v5);
}

- (void)_resultForURL:(void *)a1 forContainer:context:.cold.1(void *a1)
{
  uint64_t v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Wrong URL %p (%@), missing //", v3, v4, v5, v6, v7);
}

- (void)_resultForURL:(void *)a1 forContainer:context:.cold.2(void *a1)
{
  uint64_t v1 = [a1 scheme];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1A1709000, MEMORY[0x1E4F14500], v2, "Wrong scheme for URL %p (%@)", v3, v4, v5, v6, v7);
}

@end