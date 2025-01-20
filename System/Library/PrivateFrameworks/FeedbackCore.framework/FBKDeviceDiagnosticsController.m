@interface FBKDeviceDiagnosticsController
+ (BOOL)device:(id)a3 matchesAnyPredicate:(id)a4 fromCollection:(id)a5 formPlatform:(id)a6;
+ (id)currentDeviceAttachmentManagerWithDeviceAttachments:(id)a3;
+ (id)currentDeviceBiased_MatcherPredicatesForDevice:(id)a3 withGivenMatchers:(id)a4;
+ (id)filteredMatcherPredicatesForMatchers:(id)a3 ignoredMatcherPredicates:(id)a4;
+ (id)matchersForDevice:(id)a3 withGivenMatchers:(id)a4 canMatchVisibleDevices:(BOOL)a5 fromCollection:(id)a6 formPlatform:(id)a7;
+ (id)removeDuplicateMatcherPredicatesWithDevice:(id)a3 matchers:(id)a4;
- (BOOL)addedCurrentDeviceNeedsMatcherPredicateEvaluation;
- (BOOL)autoGathersDiagnosticExtensions;
- (BOOL)canCancelAttachmentCollection:(id)a3;
- (BOOL)canDeleteAttachment:(id)a3;
- (BOOL)canRemoveDevice:(id)a3;
- (BOOL)deviceHasAnyAttachmentsWithDevice:(id)a3;
- (BOOL)hasAnyAttachments;
- (BOOL)hasAttachmentsCollecting;
- (BOOL)hasAttachmentsForUpload;
- (BOOL)hasFilePromises;
- (BOOL)hasUnmetRequirementAttachments;
- (BOOL)removeAttachment:(id)a3;
- (DEDBugSession)currentDeviceBugSession;
- (FBKAttachmentManager)currentDeviceAttachmentManager;
- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8;
- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8 attachmentDescriptors:(id)a9 autoGathersDiagnosticExtensions:(BOOL)a10;
- (FBKDeviceDiagnosticsDelegate)delegate;
- (FBKDeviceManager)deviceManager;
- (FBKFilerForm)filerForm;
- (NSArray)attachmentCollections;
- (NSArray)attachmentDescriptors;
- (NSArray)devicesInPlay;
- (NSMutableDictionary)cachedDiffableIdentifiersTable;
- (NSMutableSet)attachmentsBeingAttached;
- (NSNumber)filerFormID;
- (NSSet)currentMatcherPredicates;
- (NSSet)deferredAttachmentCollections;
- (NSSet)ignoredMatchers;
- (NSSet)previousMatcherPredicates;
- (NSSet)removedDevices;
- (NSString)formPlatform;
- (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine)combine;
- (id)_filesBeingAttachedCount;
- (id)additionalDeviceCandidates;
- (id)attachmentsForDevice:(id)a3;
- (id)deviceDataForSubmission;
- (id)deviceDiagnosticsCombineObject;
- (id)devicesMatching:(id)a3 withConfiguredDevices:(id)a4;
- (id)filesBeingCopiedCount;
- (id)generateSectionIdentifierGroupsWithDeviceSectionPrefix:(id)a3 deferredDeviceSectionPrefix:(id)a4;
- (id)generateSnapshotIdentifiersTrackingLastDevice:(BOOL)a3;
- (id)maybeAttachmentWithIdentifier:(id)a3;
- (id)maybeDeviceWithIdentifier:(id)a3;
- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 fromViewController:(id)a4;
- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 orDevice:(id)a4 fromViewController:(id)a5;
- (id)trailingSwipeActionConfigurationWithDevice:(id)a3 fromViewController:(id)a4;
- (id)unreachableDevicesInPlay;
- (int64_t)filesBeingAttachedCount;
- (int64_t)removeDeviceMaxRetry;
- (int64_t)state;
- (void)abortAllSessions;
- (void)addAttachmentWithItemProvider:(id)a3;
- (void)addDevice:(id)a3;
- (void)attachmentManager:(id)a3 didAddAttachment:(id)a4 atIndex:(int64_t)a5;
- (void)attachmentManager:(id)a3 didFinishAttaching:(id)a4 error:(id)a5;
- (void)attachmentManager:(id)a3 didRemoveAttachment:(id)a4 atIndex:(int64_t)a5;
- (void)attachmentManager:(id)a3 didStartAttaching:(id)a4;
- (void)attachmentManager:(id)a3 didStartBugSessionsForDevice:(id)a4 success:(BOOL)a5;
- (void)attachmentManager:(id)a3 didUpdateAttachment:(id)a4 atIndex:(int64_t)a5;
- (void)commitAllFilesForForm:(id)a3 withCompletion:(id)a4;
- (void)copyFileFrom:(id)a3;
- (void)createCombineObjectIfNeeded;
- (void)dealloc;
- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6;
- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6 shouldGetSessionStatus:(BOOL)a7 shouldCheckForDeferredDiagnostics:(BOOL)a8;
- (void)gatherAllMissingRequirementsWithAnswers:(id)a3;
- (void)gatherAttachment:(id)a3 answers:(id)a4;
- (void)moveFileFrom:(id)a3;
- (void)postLaunchAttachLocalFiles:(id)a3;
- (void)reevaluateMatcherPredicates;
- (void)removeAllAttachments;
- (void)removeAttachmentWithAttachment:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)removeDevice:(id)a3;
- (void)requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:(id)a3 matcherPredicates:(id)a4 needsChoices:(id)a5;
- (void)setAddedCurrentDeviceNeedsMatcherPredicateEvaluation:(BOOL)a3;
- (void)setAttachmentCollections:(id)a3;
- (void)setAttachmentDescriptors:(id)a3;
- (void)setAttachmentsBeingAttached:(id)a3;
- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3;
- (void)setCachedDiffableIdentifiersTable:(id)a3;
- (void)setDeferredAttachmentCollections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceDiagnosticsCombineObject:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setFilerForm:(id)a3;
- (void)setFilerFormID:(id)a3;
- (void)setFilesBeingAttachedCount:(int64_t)a3;
- (void)setFilesBeingCopiedCount:(id)a3;
- (void)setIgnoredMatchers:(id)a3;
- (void)setPreviousMatcherPredicates:(id)a3;
- (void)setRemoveDeviceMaxRetry:(int64_t)a3;
- (void)setRemovedDevices:(id)a3;
- (void)setState:(int64_t)a3;
- (void)set_filesBeingAttachedCount:(id)a3;
- (void)updateAttachmentCollectionObserver:(id)a3 formResponse:(id)a4;
- (void)updateStatePublisher;
@end

@implementation FBKDeviceDiagnosticsController

- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8
{
  LOBYTE(v9) = 0;
  return [(FBKDeviceDiagnosticsController *)self initWithDeviceManager:a3 delegate:a4 filerForm:a5 pendingFileUrls:a6 pendingURLExtensions:a7 draftDeviceIds:a8 attachmentDescriptors:0 autoGathersDiagnosticExtensions:v9];
}

- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8 attachmentDescriptors:(id)a9 autoGathersDiagnosticExtensions:(BOOL)a10
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v21 = v19;
  id v99 = v20;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  v123.receiver = self;
  v123.super_class = (Class)FBKDeviceDiagnosticsController;
  v25 = [(FBKDeviceDiagnosticsController *)&v123 init];
  v26 = v25;
  if (v25)
  {
    id v95 = v24;
    objc_storeStrong((id *)&v25->_deviceManager, a3);
    objc_storeStrong((id *)&v26->_filerForm, a5);
    uint64_t v27 = [v21 filerFormID];
    v28 = (void *)v27;
    if (v27) {
      v29 = (void *)v27;
    }
    else {
      v29 = &unk_26DE1E9F0;
    }
    objc_storeStrong((id *)&v26->_filerFormID, v29);

    objc_storeWeak((id *)&v26->_delegate, v18);
    uint64_t v30 = objc_opt_new();
    cachedDiffableIdentifiersTable = v26->_cachedDiffableIdentifiersTable;
    v26->_cachedDiffableIdentifiersTable = (NSMutableDictionary *)v30;

    v26->_addedCurrentDeviceNeedsMatcherPredicateEvaluation = 0;
    v26->_removeDeviceMaxRetry = 3;
    uint64_t v32 = objc_opt_new();
    attachmentCollections = v26->_attachmentCollections;
    v26->_attachmentCollections = (NSArray *)v32;

    uint64_t v34 = objc_opt_new();
    attachmentsBeingAttached = v26->_attachmentsBeingAttached;
    v26->_attachmentsBeingAttached = (NSMutableSet *)v34;

    uint64_t v36 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    deferredAttachmentCollections = v26->_deferredAttachmentCollections;
    v26->_deferredAttachmentCollections = (NSSet *)v36;

    objc_storeStrong((id *)&v26->_attachmentDescriptors, a9);
    v26->_autoGathersDiagnosticExtensions = a10;
    if (a10)
    {
      v38 = Log_6();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v38, OS_LOG_TYPE_INFO, "Will auto-gather all DiagnosticExtensions", buf, 2u);
      }
    }
    id v97 = v17;
    [(FBKDeviceDiagnosticsController *)v26 createCombineObjectIfNeeded];
    [(FBKDeviceDiagnosticsController *)v26 updateFilesBeingCopiedCountCancellable];
    v39 = objc_opt_class();
    v40 = [(FBKDeviceDiagnosticsController *)v26 filerForm];
    v41 = [v40 matcherPredicates];
    v42 = objc_opt_new();
    v43 = [v39 filteredMatcherPredicatesForMatchers:v41 ignoredMatcherPredicates:v42];

    v98 = v43;
    objc_storeStrong((id *)&v26->_previousMatcherPredicates, v43);
    v44 = Log_6();
    v101 = v26;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [v21 filerFormID];
      uint64_t v46 = [v45 unsignedLongValue];
      v47 = [(FBKDeviceDiagnosticsController *)v26 previousMatcherPredicates];
      [v47 description];
      v49 = id v48 = v22;
      *(_DWORD *)buf = 134218242;
      uint64_t v127 = v46;
      __int16 v128 = 2114;
      v129 = v49;
      _os_log_impl(&dword_22A36D000, v44, OS_LOG_TYPE_DEFAULT, "Initialized form [%lu] with Matcher Predicates %{public}@", buf, 0x16u);

      id v22 = v48;
      v26 = v101;
    }
    v50 = (void *)MEMORY[0x263EFFA08];
    v51 = [(FBKDeviceDiagnosticsController *)v26 deviceManager];
    v52 = [v51 availableDevices];
    v53 = [v50 setWithArray:v52];

    if (v23 && [v23 count])
    {
      v93 = v22;
      id v94 = v18;
      v54 = Log_6();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = [v23 description];
        *(_DWORD *)buf = 138543362;
        uint64_t v127 = (uint64_t)v55;
        _os_log_impl(&dword_22A36D000, v54, OS_LOG_TYPE_DEFAULT, "Initialized with draft devices [%{public}@]", buf, 0xCu);
      }
      v92 = v21;

      v56 = (void *)[v23 mutableCopy];
      v57 = [MEMORY[0x263EFF9C0] set];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      v91 = v53;
      id v58 = v53;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v119 objects:v125 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v120;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v120 != v61) {
              objc_enumerationMutation(v58);
            }
            v63 = *(void **)(*((void *)&v119 + 1) + 8 * i);
            v64 = [v63 identifier];
            int v65 = [v23 containsObject:v64];

            if (v65)
            {
              v66 = [v63 identifier];
              [v56 addObject:v66];

              [v57 addObject:v63];
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v119 objects:v125 count:16];
        }
        while (v60);
      }

      v67 = (void *)[v23 mutableCopy];
      [v67 minusSet:v56];
      if ([v67 count])
      {
        v68 = Log_6();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v127 = (uint64_t)v67;
          _os_log_impl(&dword_22A36D000, v68, OS_LOG_TYPE_DEFAULT, "Did not match draft device identifiers [%{public}@]", buf, 0xCu);
        }
      }
      v90 = v67;
      v69 = [MEMORY[0x263EFF9C0] setWithSet:v98];
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v70 = v57;
      uint64_t v71 = [v70 countByEnumeratingWithState:&v115 objects:v124 count:16];
      v100 = v70;
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = *(void *)v116;
LABEL_30:
        uint64_t v74 = 0;
        while (1)
        {
          if (*(void *)v116 != v73) {
            objc_enumerationMutation(v70);
          }
          uint64_t v75 = *(void *)(*((void *)&v115 + 1) + 8 * v74);
          v76 = objc_opt_class();
          v77 = [(FBKDeviceDiagnosticsController *)v101 formPlatform];
          v78 = [v76 matchersForDevice:v75 withGivenMatchers:v69 canMatchVisibleDevices:1 fromCollection:0 formPlatform:v77];

          [v69 minusSet:v78];
          uint64_t v79 = [v69 count];

          id v70 = v100;
          if (!v79) {
            break;
          }
          if (v72 == ++v74)
          {
            uint64_t v72 = [v100 countByEnumeratingWithState:&v115 objects:v124 count:16];
            if (v72) {
              goto LABEL_30;
            }
            break;
          }
        }
      }

      v80 = [MEMORY[0x263EFF9C0] setWithSet:v58];
      [v80 minusSet:v70];
      v89 = v80;
      v81 = [(FBKDeviceDiagnosticsController *)v101 devicesMatching:v69 withConfiguredDevices:v80];
      v21 = v92;
      BOOL v82 = [v92 filerFormType] != 1 || objc_msgSend(v92, "type") == 7;
      BOOL v88 = v82;
      id v24 = v95;
      v84 = v98;
      BOOL v96 = [v92 filerFormType] == 1 && objc_msgSend(v92, "type") == 7;
      v85 = [MEMORY[0x263EFFA08] setWithSet:v81];
      v86 = [v85 setByAddingObjectsFromSet:v100];

      if ((unint64_t)[v81 count] < 2)
      {
        [(FBKDeviceDiagnosticsController *)v101 finishInitializationWithChosenDevices:v86 matcherPredicates:v98 pendingFileUrls:v99 pendingURLExtensions:v93 shouldGetSessionStatus:v88 shouldCheckForDeferredDiagnostics:v96];
      }
      else
      {
        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke;
        v107[3] = &unk_264877178;
        id v108 = v100;
        v109 = v101;
        id v110 = v98;
        id v111 = v99;
        id v112 = v93;
        BOOL v113 = v88;
        BOOL v114 = v96;
        v84 = v98;
        [(FBKDeviceDiagnosticsController *)v109 requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:v81 matcherPredicates:v110 needsChoices:v107];
      }
      id v18 = v94;

      id v22 = v93;
      v26 = v101;
      v53 = v91;
    }
    else
    {
      v83 = sub_22A4573BC(v26, "currentMatcherPredicates");
      v56 = [(FBKDeviceDiagnosticsController *)v26 devicesMatching:v83 withConfiguredDevices:v53];

      id v24 = v95;
      if ((unint64_t)[v56 count] < 2)
      {
        v84 = v98;
        [(FBKDeviceDiagnosticsController *)v26 finishInitializationWithChosenDevices:v56 matcherPredicates:v98 pendingFileUrls:v99 pendingURLExtensions:v22];
      }
      else
      {
        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke_2;
        v102[3] = &unk_2648771A0;
        v103 = v26;
        id v104 = v98;
        id v105 = v99;
        id v106 = v22;
        v84 = v98;
        [(FBKDeviceDiagnosticsController *)v103 requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:v56 matcherPredicates:v104 needsChoices:v102];
      }
    }

    id v17 = v97;
  }

  return v26;
}

void __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x263EFFA08] setWithSet:a2];
  id v4 = [v3 setByAddingObjectsFromSet:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) finishInitializationWithChosenDevices:v4 matcherPredicates:*(void *)(a1 + 48) pendingFileUrls:*(void *)(a1 + 56) pendingURLExtensions:*(void *)(a1 + 64) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 72) shouldCheckForDeferredDiagnostics:*(unsigned __int8 *)(a1 + 73)];
}

uint64_t __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishInitializationWithChosenDevices:a2 matcherPredicates:*(void *)(a1 + 40) pendingFileUrls:*(void *)(a1 + 48) pendingURLExtensions:*(void *)(a1 + 56)];
}

- (void)setAttachmentCollections:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_attachmentCollections, a3);
  v5 = [(FBKDeviceDiagnosticsController *)self filerForm];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(FBKDeviceDiagnosticsController *)self filerForm];
    [(FBKDeviceDiagnosticsController *)self updateAttachmentCollectionObserver:v8 formResponse:v7];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBKDeviceDiagnosticsController;
  [(FBKDeviceDiagnosticsController *)&v4 dealloc];
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  self->_int64_t state = a3;
  [(FBKDeviceDiagnosticsController *)self updateStatePublisher];
  if (state != a3)
  {
    id v6 = [(FBKDeviceDiagnosticsController *)self delegate];
    [v6 deviceDiagnosticsController:self didChangeState:a3];
  }
}

- (void)setFilesBeingAttachedCount:(int64_t)a3
{
  int64_t filesBeingAttachedCount = self->_filesBeingAttachedCount;
  self->_int64_t filesBeingAttachedCount = a3;
  if (filesBeingAttachedCount != a3)
  {
    id v5 = [(FBKDeviceDiagnosticsController *)self delegate];
    objc_msgSend(v5, "deviceDiagnosticsController:didChangeState:", self, -[FBKDeviceDiagnosticsController state](self, "state"));
  }
}

- (FBKDeviceDiagnosticsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKDeviceDiagnosticsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (FBKDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (FBKFilerForm)filerForm
{
  return self->_filerForm;
}

- (void)setFilerForm:(id)a3
{
}

- (NSMutableDictionary)cachedDiffableIdentifiersTable
{
  return self->_cachedDiffableIdentifiersTable;
}

- (void)setCachedDiffableIdentifiersTable:(id)a3
{
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (NSSet)previousMatcherPredicates
{
  return self->_previousMatcherPredicates;
}

- (void)setPreviousMatcherPredicates:(id)a3
{
}

- (NSSet)currentMatcherPredicates
{
  return self->_currentMatcherPredicates;
}

- (NSString)formPlatform
{
  return self->_formPlatform;
}

- (NSSet)removedDevices
{
  return self->_removedDevices;
}

- (void)setRemovedDevices:(id)a3
{
}

- (NSSet)ignoredMatchers
{
  return self->_ignoredMatchers;
}

- (void)setIgnoredMatchers:(id)a3
{
}

- (BOOL)addedCurrentDeviceNeedsMatcherPredicateEvaluation
{
  return self->_addedCurrentDeviceNeedsMatcherPredicateEvaluation;
}

- (void)setAddedCurrentDeviceNeedsMatcherPredicateEvaluation:(BOOL)a3
{
  self->_addedCurrentDeviceNeedsMatcherPredicateEvaluation = a3;
}

- (NSArray)attachmentCollections
{
  return self->_attachmentCollections;
}

- (NSSet)deferredAttachmentCollections
{
  return self->_deferredAttachmentCollections;
}

- (void)setDeferredAttachmentCollections:(id)a3
{
}

- (id)deviceDiagnosticsCombineObject
{
  return self->_deviceDiagnosticsCombineObject;
}

- (void)setDeviceDiagnosticsCombineObject:(id)a3
{
}

- (id)filesBeingCopiedCount
{
  return self->_filesBeingCopiedCount;
}

- (void)setFilesBeingCopiedCount:(id)a3
{
}

- (id)_filesBeingAttachedCount
{
  return self->__filesBeingAttachedCount;
}

- (void)set_filesBeingAttachedCount:(id)a3
{
}

- (int64_t)filesBeingAttachedCount
{
  return self->_filesBeingAttachedCount;
}

- (NSMutableSet)attachmentsBeingAttached
{
  return self->_attachmentsBeingAttached;
}

- (void)setAttachmentsBeingAttached:(id)a3
{
}

- (NSNumber)filerFormID
{
  return self->_filerFormID;
}

- (void)setFilerFormID:(id)a3
{
}

- (int64_t)removeDeviceMaxRetry
{
  return self->_removeDeviceMaxRetry;
}

- (void)setRemoveDeviceMaxRetry:(int64_t)a3
{
  self->_removeDeviceMaxRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filerFormID, 0);
  objc_storeStrong((id *)&self->_attachmentsBeingAttached, 0);
  objc_storeStrong(&self->__filesBeingAttachedCount, 0);
  objc_storeStrong(&self->_filesBeingCopiedCount, 0);
  objc_storeStrong(&self->_deviceDiagnosticsCombineObject, 0);
  objc_storeStrong((id *)&self->_deferredAttachmentCollections, 0);
  objc_storeStrong((id *)&self->_attachmentCollections, 0);
  objc_storeStrong((id *)&self->_ignoredMatchers, 0);
  objc_storeStrong((id *)&self->_removedDevices, 0);
  objc_storeStrong((id *)&self->_formPlatform, 0);
  objc_storeStrong((id *)&self->_currentMatcherPredicates, 0);
  objc_storeStrong((id *)&self->_previousMatcherPredicates, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);
  objc_storeStrong((id *)&self->_cachedDiffableIdentifiersTable, 0);
  objc_storeStrong((id *)&self->_filerForm, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)devicesInPlay
{
  return (NSArray *)sub_22A460B68(self, (uint64_t)a2, (void (*)(void))FBKDeviceDiagnosticsController.devicesInPlay.getter);
}

- (void)createCombineObjectIfNeeded
{
  v2 = self;
  sub_22A457514();
}

- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6
{
  sub_22A40F5A0(0, &qword_268376840);
  sub_22A40F55C((unint64_t *)&qword_268376D00, &qword_268376840);
  uint64_t v9 = sub_22A4B36B8();
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v10 = sub_22A4B36B8();
  if (a5)
  {
    sub_22A4B24C8();
    a5 = (id)sub_22A4B33F8();
  }
  if (a6)
  {
    sub_22A40F5A0(0, &qword_268376E68);
    sub_22A40F55C(&qword_268376E70, &qword_268376E68);
    uint64_t v11 = sub_22A4B36B8();
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = self;
  sub_22A45760C(v9, v10, a5, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6 shouldGetSessionStatus:(BOOL)a7 shouldCheckForDeferredDiagnostics:(BOOL)a8
{
  sub_22A40F5A0(0, &qword_268376840);
  sub_22A40F55C((unint64_t *)&qword_268376D00, &qword_268376840);
  v12 = (void *)sub_22A4B36B8();
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v13 = sub_22A4B36B8();
  if (a5)
  {
    sub_22A4B24C8();
    a5 = (id)sub_22A4B33F8();
  }
  if (a6)
  {
    sub_22A40F5A0(0, &qword_268376E68);
    sub_22A40F55C(&qword_268376E70, &qword_268376E68);
    a6 = (id)sub_22A4B36B8();
  }
  v14 = self;
  sub_22A4579DC(v12, v13, (uint64_t)a5, (uint64_t)a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:(id)a3 matcherPredicates:(id)a4 needsChoices:(id)a5
{
  id v6 = _Block_copy(a5);
  sub_22A40F5A0(0, &qword_268376840);
  sub_22A40F55C((unint64_t *)&qword_268376D00, &qword_268376840);
  uint64_t v7 = sub_22A4B36B8();
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v8 = sub_22A4B36B8();
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_22A4709C4(v7, v8, v9, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)reevaluateMatcherPredicates
{
  v2 = self;
  FBKDeviceDiagnosticsController.reevaluateMatcherPredicates()();
}

- (id)devicesMatching:(id)a3 withConfiguredDevices:(id)a4
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v5 = sub_22A4B36B8();
  sub_22A40F5A0(0, &qword_268376840);
  sub_22A40F55C((unint64_t *)&qword_268376D00, &qword_268376840);
  uint64_t v6 = sub_22A4B36B8();
  uint64_t v7 = self;
  sub_22A473B54(v6, v5, v7);
  swift_bridgeObjectRelease();

  uint64_t v8 = (void *)sub_22A4B36A8();
  swift_release();

  return v8;
}

- (BOOL)hasAttachmentsCollecting
{
  v2 = self;
  Swift::Bool v3 = FBKDeviceDiagnosticsController.hasAttachmentsCollecting()();

  return v3;
}

- (id)attachmentsForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FBKDeviceDiagnosticsController.attachmentsForDevice(_:)(v4);

  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  uint64_t v6 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)abortAllSessions
{
  v2 = self;
  FBKDeviceDiagnosticsController.abortAllSessions()();
}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FBKDeviceDiagnosticsController.addAttachment(itemProvider:)((NSItemProvider)v4);
}

- (void)moveFileFrom:(id)a3
{
}

- (void)copyFileFrom:(id)a3
{
}

- (BOOL)hasUnmetRequirementAttachments
{
  v2 = self;
  Swift::Bool v3 = FBKDeviceDiagnosticsController.hasUnmetRequirementAttachments()();

  return v3;
}

- (BOOL)deviceHasAnyAttachmentsWithDevice:(id)a3
{
  id v4 = (objc_class *)a3;
  uint64_t v5 = self;
  v6.super.isa = v4;
  LOBYTE(self) = FBKDeviceDiagnosticsController.deviceHasAnyAttachments(device:)(v6);

  return self & 1;
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22A45E7C8(v4, 0);
}

- (void)postLaunchAttachLocalFiles:(id)a3
{
  sub_22A4B24C8();
  uint64_t v4 = sub_22A4B33F8();
  uint64_t v5 = self;
  FBKDeviceDiagnosticsController.postLaunchAttachLocalFiles(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)gatherAllMissingRequirementsWithAnswers:(id)a3
{
  if (a3) {
    uint64_t v4 = (void *)sub_22A4B33F8();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = self;
  v7.value._rawValue = v4;
  FBKDeviceDiagnosticsController.gatherAllMissingRequirements(answers:)(v7);

  swift_bridgeObjectRelease();
}

- (void)gatherAttachment:(id)a3 answers:(id)a4
{
  uint64_t v6 = sub_22A4B33F8();
  Swift::OpaquePointer_optional v7 = (FBKAttachment *)a3;
  uint64_t v8 = self;
  FBKDeviceDiagnosticsController.gatherAttachment(_:answers:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (BOOL)canCancelAttachmentCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(FBKDeviceDiagnosticsController *)v5 attachmentCollections];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376CE0);
  unint64_t v7 = sub_22A4B3628();

  id v8 = v4;
  uint64_t v9 = (FBKDeviceDiagnosticsController *)sub_22A46CAF4(v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    id v10 = [(FBKDeviceDiagnosticsController *)v9 attachmentManager];
    unsigned __int8 v11 = objc_msgSend(v10, sel_canCancelAttachmentCollection_, v8);

    id v8 = v10;
    uint64_t v5 = v9;
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void)removeAllAttachments
{
  v2 = self;
  FBKDeviceDiagnosticsController.removeAllAttachments()();
}

- (BOOL)hasAnyAttachments
{
  v2 = self;
  Swift::Bool v3 = FBKDeviceDiagnosticsController.hasAnyAttachments()();

  return v3;
}

- (BOOL)hasAttachmentsForUpload
{
  v2 = self;
  unsigned __int8 v3 = FBKDeviceDiagnosticsController.hasAttachmentsForUpload.getter();

  return v3 & 1;
}

- (BOOL)removeAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(FBKDeviceDiagnosticsController *)v5 attachmentCollections];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376CE0);
  unint64_t v7 = sub_22A4B3628();

  id v8 = (FBKAttachment *)v4;
  uint64_t v9 = (FBKAttachment *)sub_22A46CAF4(v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    id v10 = (FBKDeviceDiagnosticsController *)[(FBKAttachment *)v9 attachmentManager];
    Swift::Bool v11 = FBKAttachmentManager.removeAttachment(_:)(v8);

    id v8 = v9;
    uint64_t v5 = v10;
  }
  else
  {
    Swift::Bool v11 = 0;
  }

  return v11;
}

- (BOOL)canDeleteAttachment:(id)a3
{
  return objc_msgSend(a3, sel_canBeDeleted);
}

- (id)unreachableDevicesInPlay
{
  return sub_22A460B68(self, (uint64_t)a2, FBKDeviceDiagnosticsController.unreachableDevicesInPlay());
}

- (BOOL)canRemoveDevice:(id)a3
{
  id v4 = (objc_class *)a3;
  uint64_t v5 = self;
  v6.super.isa = v4;
  LOBYTE(self) = FBKDeviceDiagnosticsController.canRemoveDevice(_:)(v6);

  return self & 1;
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_22A45D7A0(v4, 1);
}

- (id)additionalDeviceCandidates
{
  v2 = self;
  FBKDeviceDiagnosticsController.additionalDeviceCandidates()();

  sub_22A40F5A0(0, &qword_268376840);
  sub_22A40F55C((unint64_t *)&qword_268376D00, &qword_268376840);
  unsigned __int8 v3 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)generateSnapshotIdentifiersTrackingLastDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  FBKDeviceDiagnosticsController.generateSnapshotIdentifiers(shouldTrackLastDevice:)(v3);

  uint64_t v5 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)generateSectionIdentifierGroupsWithDeviceSectionPrefix:(id)a3 deferredDeviceSectionPrefix:(id)a4
{
  uint64_t v5 = sub_22A4B3458();
  uint64_t v7 = v6;
  uint64_t v8 = sub_22A4B3458();
  uint64_t v10 = v9;
  Swift::Bool v11 = self;
  FBKDeviceDiagnosticsController.generateSectionIdentifierGroups(deviceSectionPrefix:deferredDeviceSectionPrefix:)(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22A40F5A0(0, (unint64_t *)&unk_268376E38);
  v12 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)maybeAttachmentWithIdentifier:(id)a3
{
  return sub_22A463410(self);
}

- (id)maybeDeviceWithIdentifier:(id)a3
{
  return sub_22A463410(self);
}

- (void)updateAttachmentCollectionObserver:(id)a3 formResponse:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  uint64_t v7 = [(FBKDeviceDiagnosticsController *)v6 combine];
  sub_22A456414(v5);
}

- (void)attachmentManager:(id)a3 didStartAttaching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_22A474B0C((uint64_t)v7);
}

- (void)attachmentManager:(id)a3 didFinishAttaching:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_22A474C4C((uint64_t)v9, a5);
}

- (void)attachmentManager:(id)a3 didRemoveAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_22A474E54(v8);
}

- (void)attachmentManager:(id)a3 didAddAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_22A47504C(v8);
}

- (void)attachmentManager:(id)a3 didUpdateAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_22A4751DC(v8);
}

- (void)attachmentManager:(id)a3 didStartBugSessionsForDevice:(id)a4 success:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_22A4755D8(v9, a5);
}

- (BOOL)hasFilePromises
{
  v2 = self;
  Swift::Bool v3 = FBKDeviceDiagnosticsController.hasFilePromises()();

  return v3;
}

- (void)commitAllFilesForForm:(id)a3 withCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  id v8 = self;
  FBKDeviceDiagnosticsController.commitAllFiles(for:withCompletion:)((uint64_t)a3, (uint64_t)sub_22A475DDC, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)deviceDataForSubmission
{
  v2 = self;
  unint64_t v3 = sub_22A457064();
  id v4 = v2;
  sub_22A46B664(v3, v4);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_268376E30);
  id v5 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)removeDuplicateMatcherPredicatesWithDevice:(id)a3 matchers:(id)a4
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v5 = sub_22A4B36B8();
  id v6 = a3;
  sub_22A454214(MEMORY[0x263F8EE88], v5);

  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)filteredMatcherPredicatesForMatchers:(id)a3 ignoredMatcherPredicates:(id)a4
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v4 = sub_22A4B36B8();
  uint64_t v5 = sub_22A4B36B8();
  sub_22A4703D4(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return v6;
}

+ (BOOL)device:(id)a3 matchesAnyPredicate:(id)a4 fromCollection:(id)a5 formPlatform:(id)a6
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v9 = sub_22A4B36B8();
  if (a6)
  {
    uint64_t v10 = sub_22A4B3458();
    a6 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = sub_22A46E8D8(v12, v9, 0, a5, v10, (uint64_t)a6);
  if ((v14 & 0xC000000000000001) != 0) {
    uint64_t v15 = sub_22A4B3A08();
  }
  else {
    uint64_t v15 = *(void *)(v14 + 16);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v15 > 0;
}

+ (id)matchersForDevice:(id)a3 withGivenMatchers:(id)a4 canMatchVisibleDevices:(BOOL)a5 fromCollection:(id)a6 formPlatform:(id)a7
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v11 = sub_22A4B36B8();
  if (a7)
  {
    uint64_t v12 = sub_22A4B3458();
    a7 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v14 = a3;
  id v15 = a6;
  sub_22A46E8D8(v14, v11, a5, a6, v12, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_22A4B36A8();
  swift_bridgeObjectRelease();

  return v16;
}

+ (id)currentDeviceBiased_MatcherPredicatesForDevice:(id)a3 withGivenMatchers:(id)a4
{
  sub_22A40F5A0(0, &qword_2683760E8);
  sub_22A40F55C(&qword_268376190, &qword_2683760E8);
  uint64_t v5 = sub_22A4B36B8();
  id v6 = a3;
  sub_22A46D8CC(v5, v6);

  uint64_t v7 = (void *)sub_22A4B36A8();
  swift_release();

  return v7;
}

+ (id)currentDeviceAttachmentManagerWithDeviceAttachments:(id)a3
{
  sub_22A40F5A0(0, (unint64_t *)&unk_268376CE0);
  unint64_t v3 = sub_22A4B3628();
  id v4 = sub_22A475860(v3);
  swift_bridgeObjectRelease();

  return v4;
}

- (void)updateStatePublisher
{
  v2 = self;
  unint64_t v3 = [(FBKDeviceDiagnosticsController *)v2 combine];
  swift_beginAccess();
  swift_retain();

  [(FBKDeviceDiagnosticsController *)v2 state];
  sub_22A4B2938();

  swift_release();
}

- (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine)combine
{
  v2 = self;
  result = (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *)[(FBKDeviceDiagnosticsController *)v2 deviceDiagnosticsCombineObject];
  if (result)
  {
    sub_22A4B3968();
    swift_unknownObjectRelease();
    sub_22A40EF78(&v5, &v6);
    type metadata accessor for FBKDeviceDiagnosticsControllerCombine();
    swift_dynamicCast();

    return (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (DEDBugSession)currentDeviceBugSession
{
  v2 = self;
  unint64_t v3 = [(FBKDeviceDiagnosticsController *)v2 attachmentCollections];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376CE0);
  unint64_t v4 = sub_22A4B3628();

  id v5 = sub_22A475860(v4);
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v5, sel_deCollector);
  id v7 = objc_msgSend(v6, sel_bugSession);

  return (DEDBugSession *)v7;
}

- (FBKAttachmentManager)currentDeviceAttachmentManager
{
  v2 = self;
  unint64_t v3 = [(FBKDeviceDiagnosticsController *)v2 attachmentCollections];
  sub_22A40F5A0(0, (unint64_t *)&unk_268376CE0);
  unint64_t v4 = sub_22A4B3628();

  id v5 = sub_22A475860(v4);
  swift_bridgeObjectRelease();

  return (FBKAttachmentManager *)v5;
}

- (id)trailingSwipeActionConfigurationWithDevice:(id)a3 fromViewController:(id)a4
{
  id v4 = [(FBKDeviceDiagnosticsController *)self trailingSwipeActionConfigurationWithAttachment:0 orDevice:a3 fromViewController:a4];

  return v4;
}

- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 fromViewController:(id)a4
{
  id v4 = [(FBKDeviceDiagnosticsController *)self trailingSwipeActionConfigurationWithAttachment:a3 orDevice:0 fromViewController:a4];

  return v4;
}

- (void)removeAttachmentWithAttachment:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  _Block_copy(v8);
  if (objc_msgSend(v10, sel_isRequired)) {
    sub_22A48D9E4(v10, v11, (uint64_t)sub_22A48ED74, v9);
  }
  else {
    (*((void (**)(void *, BOOL))v8 + 2))(v8, [(FBKDeviceDiagnosticsController *)v12 removeAttachment:v10]);
  }
  swift_release();
  _Block_release(v8);
}

- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 orDevice:(id)a4 fromViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = self;
  id v13 = sub_22A48DF9C(a3, a4, v11);

  return v13;
}

@end