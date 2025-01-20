@interface CHRecognitionSession
+ (BOOL)isLocaleSupported:(id)a3;
+ (BOOL)shouldRunRecognitionLocallyWithEnvironment:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (double)autoRefineTriggerFactor;
+ (id)alignReflowableTokens:(id)a3 resultTokens:(id)a4 strokeIdentifiers:(id)a5 outStrokeIdentifiers:(id *)a6;
+ (id)createMathRecognizerRunningRemote:(BOOL)a3 priority:(int64_t)a4;
+ (id)createRecognizerForLocale:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6;
+ (id)createRecognizerForLocales:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6;
+ (id)effectiveLocalesFromLocales:(id)a3;
+ (id)strokeIdentifiersInFullContextForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6;
+ (id)strokeIdentifiersInProximalGroupsForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6;
+ (void)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3;
- (BOOL)disableMathTextSwapping;
- (BOOL)forceLocaleNumberFormat;
- (BOOL)leverageAllProvidedVariables;
- (BOOL)loadSessionData:(id)a3 error:(id *)a4;
- (BOOL)q_needsForegroundRecognition;
- (BOOL)q_wantsAutoRefine;
- (BOOL)shouldForceFastGrouping;
- (BOOL)skipMathOperatorsInference;
- (BOOL)skipPopulatingStyleInventory;
- (BOOL)skipPrincipalLines;
- (BOOL)strokeGroupingOnly;
- (BOOL)textSynthesizerWithLocaleFallbackIsSupported;
- (CHCalculateDocumentProvider)latestCalculateDocumentProvider;
- (CHCanvasAttachmentProvider)latestCanvasAttachmentProvider;
- (CHRecognitionSession)init;
- (CHRecognitionSession)initWithCoder:(id)a3;
- (CHRecognitionSession)initWithMode:(int64_t)a3;
- (CHRecognitionSession)initWithMode:(int64_t)a3 recognitionSessionResult:(id)a4 dataSource:(id)a5;
- (CHRecognitionSession)initWithMode:(int64_t)a3 withVersion:(id)a4;
- (CHRecognitionSessionDataSource)dataSource;
- (CHRecognitionSessionResult)lastRecognitionResult;
- (CHRecognitionSessionVersion)sessionVersion;
- (CHStrokeProvider)latestStrokeProvider;
- (CHTextInputQuery)activeTextInputQuery;
- (NSArray)preferredLocales;
- (NSData)sessionData;
- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (id)evaluationResultForStrokeGroupIdentifier:(int64_t)a3;
- (id)indexableContent;
- (id)lastRecognitionResultWaitingForPendingTasks;
- (id)lineWrapper;
- (id)mathRecognizer;
- (id)mathTranscriptionWithEvaluationResultForStrokeGroup:(id)a3 outStrokeIdentifiers:(id *)a4 outStrokes:(id *)a5;
- (id)recognitionOptionForKey:(id)a3;
- (id)recognizableDrawingForStrokeGroupQueryItem:(id)a3;
- (id)recognizerForLocale:(id)a3;
- (id)refinedTokensForContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)refinedTokensForSingleLineContextStrokes:(id)a3 styleControlParameter:(id)a4 transcription:(id)a5 completion:(id)a6 shouldCancel:(id)a7;
- (id)refinementOfContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)reflowableTextLinesForContextStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6;
- (id)structuredContextualTextResultsWithTextResults:(id)a3;
- (id)styleSampleOptionsForPoint:(CGPoint)a3 shouldCancel:(id)a4;
- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6;
- (id)textCorrectionRecognizerForLocales:(id)a3;
- (id)textSynthesizer;
- (id)textSynthesizerWithLocaleFallback;
- (id)tokenStrokeIdentifiersForContextStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7;
- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int64_t)mode;
- (int64_t)priority;
- (int64_t)recognitionEnvironment;
- (int64_t)status;
- (unint64_t)strokeGroupOrdering;
- (void)_setLastRecognitionResult:(id)a3;
- (void)_setLatestCalculateDocumentProvider:(id)a3;
- (void)_setLatestCanvasAttachmentProvider:(id)a3;
- (void)_setLatestStrokeProvider:(id)a3;
- (void)_setSessionVersion:(id)a3;
- (void)_setStatus:(int64_t)a3;
- (void)cancelOngoingRequests;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rebuildRecognitionResults;
- (void)registerChangeObserver:(id)a3;
- (void)registerInputDrawingClient:(id)a3;
- (void)setActive;
- (void)setActiveTextInputQuery:(id)a3;
- (void)setAutoCapitalizationMode:(int)a3;
- (void)setAutoCorrectionMode:(int)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setDataSource:(id)a3;
- (void)setDisableMathTextSwapping:(BOOL)a3;
- (void)setForceLocaleNumberFormat:(BOOL)a3;
- (void)setIdle;
- (void)setLeverageAllProvidedVariables:(BOOL)a3;
- (void)setNeedsRecognitionUpdate;
- (void)setNeedsRecognitionUpdateImmediately:(BOOL)a3;
- (void)setPreferredLocales:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRecognitionEnvironment:(int64_t)a3;
- (void)setShouldForceFastGrouping:(BOOL)a3;
- (void)setSkipMathOperatorsInference:(BOOL)a3;
- (void)setSkipPopulatingStyleInventory:(BOOL)a3;
- (void)setSkipPrincipalLines:(BOOL)a3;
- (void)setStrokeGroupOrdering:(unint64_t)a3;
- (void)setStrokeGroupingOnly:(BOOL)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)unregisterInputDrawingClient:(id)a3;
- (void)updateRecognitionOptions:(id)a3;
- (void)waitForPendingRecognitionTasks;
@end

@implementation CHRecognitionSession

+ (BOOL)isLocaleSupported:(id)a3
{
  return objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, a2, (uint64_t)a3, 4, v3, v4);
}

- (CHRecognitionSession)initWithMode:(int64_t)a3
{
  v93.receiver = self;
  v93.super_class = (Class)CHRecognitionSession;
  uint64_t v4 = [(CHRecognitionSession *)&v93 init];
  v5 = v4;
  if (v4)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeTasks = v4->__activeTasks;
    v4->__activeTasks = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    correctionRecognizersByLocalesKey = v4->__correctionRecognizersByLocalesKey;
    v4->__correctionRecognizersByLocalesKey = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recognizersByLocaleID = v4->__recognizersByLocaleID;
    v4->__recognizersByLocaleID = v10;

    uint64_t v17 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v12, v13, v14, v15, v16);
    changeObserversTable = v4->__changeObserversTable;
    v4->__changeObserversTable = (NSHashTable *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inputDrawingClients = v4->__inputDrawingClients;
    v4->__inputDrawingClients = v19;

    if (!a3)
    {
      uint64_t v25 = objc_msgSend_modelWithModelName_(CHStrokeClassificationModel, v21, @"stroke_classification.bundle", v22, v23, v24);
      strokeClassificationModel = v4->_strokeClassificationModel;
      v4->_strokeClassificationModel = (CHStrokeClassificationModel *)v25;

      v4->_autoCorrectionMode = 1;
    }
    if (_os_feature_enabled_impl() && (a3 | 2) == 2)
    {
      uint64_t v30 = objc_msgSend_modelWithModelName_contentType_(CHGroupingModel, v27, @"math_grouping.bundle", 3, v28, v29);
      strokeGroupingModel = v4->_strokeGroupingModel;
      v4->_strokeGroupingModel = (CHGroupingModel *)v30;
    }
    v4->_status = 1;
    v4->_mode = a3;
    v32 = [CHRecognitionSessionVersion alloc];
    uint64_t v36 = objc_msgSend_initWithSessionVersion_sessionResultVersion_(v32, v33, 1, 5, v34, v35);
    sessionVersion = v4->_sessionVersion;
    v4->_sessionVersion = (CHRecognitionSessionVersion *)v36;

    v4->_recognitionEnvironment = 0;
    v4->_priority = 0;
    *(void *)&v4->_baseWritingDirection = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4->__sessionQueue)
    {
LABEL_12:
      if (!v4->__observersQueue) {
        goto LABEL_17;
      }
      if (qword_1EA3CA000 == -1)
      {
        v44 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
LABEL_16:

LABEL_17:
          if (!v4->__tasksWorkQueueForeground) {
            goto LABEL_22;
          }
          if (qword_1EA3CA000 == -1)
          {
            v45 = (id)qword_1EA3C9F90[0];
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            {
LABEL_21:

LABEL_22:
              if (!v4->__tasksWorkQueueBackground) {
                goto LABEL_27;
              }
              if (qword_1EA3CA000 == -1)
              {
                v46 = (id)qword_1EA3C9F90[0];
                if (!os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
                {
LABEL_26:

LABEL_27:
                  p_tasksWorkQueueForeground = (id *)&v4->__tasksWorkQueueForeground;
                  if (!v4->__highResponsivenessQueue) {
                    goto LABEL_32;
                  }
                  if (qword_1EA3CA000 == -1)
                  {
                    v48 = (id)qword_1EA3C9F90[0];
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
                    {
LABEL_31:

LABEL_32:
                      if (a3 != 2)
                      {
                        if (a3 == 1)
                        {
                          v4->__taskQueueQoSClass = 25;
                          v57 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                          dispatch_queue_attr_make_with_qos_class(v57, QOS_CLASS_USER_INITIATED, 0);
                          v58 = (CHRecognitionSession *)objc_claimAutoreleasedReturnValue();

                          *(void *)buf = MEMORY[0x1E4F143A8];
                          uint64_t v95 = 3221225472;
                          v96 = sub_1C4B95C4C;
                          v97 = &unk_1E64E0D48;
                          v98 = v58;
                          uint64_t v59 = qword_1EA3C94B0;
                          v52 = v58;
                          if (v59 != -1) {
                            dispatch_once(&qword_1EA3C94B0, buf);
                          }
                          objc_storeStrong(p_tasksWorkQueueForeground, (id)qword_1EA3C94A8);
                          dispatch_queue_t v60 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSession", v52);
                          sessionQueue = v5->__sessionQueue;
                          v5->__sessionQueue = (OS_dispatch_queue *)v60;

                          dispatch_queue_t v62 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSessionObservers", v52);
                          observersQueue = v5->__observersQueue;
                          v5->__observersQueue = (OS_dispatch_queue *)v62;

                          v56 = (OS_dispatch_queue *)v98;
                          goto LABEL_41;
                        }
                        if (a3)
                        {
LABEL_42:
                          *(_DWORD *)&v5->__shouldForceFastGrouping = 0;
                          v5->__forceLocaleNumberFormat = 1;
                          uint64_t v64 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v38, v39, v40, v41, v42);
                          recognitionOptions = v5->_recognitionOptions;
                          v5->_recognitionOptions = (NSMutableDictionary *)v64;

                          v70 = objc_msgSend_numberWithBool_(NSNumber, v66, !v5->__skipMathOperatorsInference, v67, v68, v69);
                          objc_msgSend_setObject_forKeyedSubscript_(v5->_recognitionOptions, v71, (uint64_t)v70, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v72, v73);

                          v78 = objc_msgSend_numberWithBool_(NSNumber, v74, v5->__skipPopulatingStyleInventory, v75, v76, v77);
                          objc_msgSend_setObject_forKeyedSubscript_(v5->_recognitionOptions, v79, (uint64_t)v78, @"CHRecognitionTaskSkipPopulatingInventory", v80, v81);

                          v86 = objc_msgSend_numberWithBool_(NSNumber, v82, v5->__forceLocaleNumberFormat, v83, v84, v85);
                          objc_msgSend_setObject_forKeyedSubscript_(v5->_recognitionOptions, v87, (uint64_t)v86, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v88, v89);

                          v90 = objc_alloc_init(CHSessionStateTracker);
                          stateTracker = v5->_stateTracker;
                          v5->_stateTracker = v90;

                          return v5;
                        }
                      }
                      p_tasksWorkQueueBackground = (id *)&v4->__tasksWorkQueueBackground;
                      p_highResponsivenessQueue = (id *)&v4->__highResponsivenessQueue;
                      v5->__taskQueueQoSClass = 21;
                      v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                      v52 = dispatch_queue_attr_make_with_qos_class(v51, QOS_CLASS_DEFAULT, -15);

                      *(void *)buf = MEMORY[0x1E4F143A8];
                      uint64_t v95 = 3221225472;
                      v96 = sub_1C4B95AF4;
                      v97 = &unk_1E64E0D48;
                      v98 = v5;
                      if (qword_1EA3C94A0 != -1) {
                        dispatch_once(&qword_1EA3C94A0, buf);
                      }
                      objc_storeStrong(p_tasksWorkQueueBackground, (id)qword_1EA3C9488);
                      objc_storeStrong(p_highResponsivenessQueue, (id)qword_1EA3C9490);
                      objc_storeStrong(p_tasksWorkQueueForeground, (id)qword_1EA3C9480);
                      dispatch_queue_t v53 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSession", v52);
                      v54 = v5->__sessionQueue;
                      v5->__sessionQueue = (OS_dispatch_queue *)v53;

                      dispatch_queue_t v55 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSessionObservers", v52);
                      v56 = v5->__observersQueue;
                      v5->__observersQueue = (OS_dispatch_queue *)v55;
LABEL_41:

                      goto LABEL_42;
                    }
                  }
                  else
                  {
                    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                    v48 = (id)qword_1EA3C9F90[0];
                    if (!os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_31;
                    }
                  }
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C492D000, v48, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
                  goto LABEL_31;
                }
              }
              else
              {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                v46 = (id)qword_1EA3C9F90[0];
                if (!os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_26;
                }
              }
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v46, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
              goto LABEL_26;
            }
          }
          else
          {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            v45 = (id)qword_1EA3C9F90[0];
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
              goto LABEL_21;
            }
          }
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
          goto LABEL_21;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        v44 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          goto LABEL_16;
        }
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v44, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
      goto LABEL_16;
    }
    if (qword_1EA3CA000 == -1)
    {
      v43 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v43 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
    goto LABEL_11;
  }
  return v5;
}

- (CHRecognitionSession)init
{
  return (CHRecognitionSession *)objc_msgSend_initWithMode_(self, a2, 0, v2, v3, v4);
}

- (CHRecognitionSession)initWithMode:(int64_t)a3 recognitionSessionResult:(id)a4 dataSource:(id)a5
{
  id v7 = a5;
  v12 = (CHRecognitionSession *)objc_msgSend_initWithMode_(self, v8, a3, v9, v10, v11);
  uint64_t v17 = v12;
  if (v12)
  {
    objc_msgSend_setDataSource_(v12, v13, (uint64_t)v7, v14, v15, v16);
    uint64_t v23 = objc_msgSend_strokeProviderSnapshot(v7, v18, v19, v20, v21, v22);
    objc_msgSend__setLatestStrokeProvider_(v17, v24, (uint64_t)v23, v25, v26, v27);
    if (objc_msgSend_mode(v17, v28, v29, v30, v31, v32) && objc_msgSend_mode(v17, v33, v34, v35, v36, v37) != 2)
    {
      if (objc_msgSend_mode(v17, v38, v39, v40, v41, v42) != 1) {
        goto LABEL_16;
      }
      if (objc_opt_respondsToSelector())
      {
        v48 = objc_msgSend_calculateDocumentProviderSnapshot(v7, v62, v63, v64, v65, v66);
        objc_msgSend__setLatestCalculateDocumentProvider_(v17, v67, (uint64_t)v48, v68, v69, v70);
      }
      else
      {
        v48 = 0;
        objc_msgSend__setLatestCalculateDocumentProvider_(v17, v62, 0, v64, v65, v66);
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v48 = objc_msgSend_calculateDocumentProviderSnapshot(v7, v43, v44, v45, v46, v47);
      }
      else
      {
        v48 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        v54 = objc_msgSend_canvasAttachmentProviderSnapshot(v7, v49, v50, v51, v52, v53);
      }
      else
      {
        v54 = 0;
      }
      objc_msgSend__setLatestCalculateDocumentProvider_(v17, v49, (uint64_t)v48, v51, v52, v53);
      objc_msgSend__setLatestCanvasAttachmentProvider_(v17, v55, (uint64_t)v54, v56, v57, v58);
      sub_1C4B95994((uint64_t)v17);
      cachedFastGroupingRecognitionResult = v17->_cachedFastGroupingRecognitionResult;
      if (cachedFastGroupingRecognitionResult)
      {
        v17->_cachedFastGroupingRecognitionResult = 0;
      }
      partialRecognitionResult = v17->_partialRecognitionResult;
      if (partialRecognitionResult)
      {
        v17->_partialRecognitionResult = 0;
      }
    }

LABEL_16:
  }

  return v17;
}

- (void)dealloc
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4B95E64;
  v5[3] = &unk_1E64E0D48;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1C8786E90](v5, a2);
  sub_1C4B95C8C((uint64_t)self, v3);

  v4.receiver = self;
  v4.super_class = (Class)CHRecognitionSession;
  [(CHRecognitionSession *)&v4 dealloc];
}

- (void)setIdle
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FF8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "Session is idle", v9, 2u);
  }

  objc_msgSend_setIdle(self->_stateTracker, v4, v5, v6, v7, v8);
}

- (void)setActive
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FF8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "Session is active", v9, 2u);
  }

  objc_msgSend_setActive(self->_stateTracker, v4, v5, v6, v7, v8);
}

- (CHRecognitionSessionVersion)sessionVersion
{
  return self->_sessionVersion;
}

- (void)_setSessionVersion:(id)a3
{
  uint64_t v5 = (CHRecognitionSessionVersion *)a3;
  sessionVersion = self->_sessionVersion;
  p_sessionVersion = &self->_sessionVersion;
  if (sessionVersion != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_sessionVersion, a3);
    uint64_t v5 = v8;
  }
}

- (void)setPreferredLocales:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1C4B96DEC;
  uint64_t v14 = &unk_1E64E48C0;
  id v5 = v4;
  id v15 = v5;
  uint64_t v16 = self;
  uint64_t v17 = &v23;
  v18 = &v19;
  sub_1C4B95C8C((uint64_t)self, &v11);
  if (*((unsigned char *)v20 + 24))
  {
    if (*((unsigned char *)v24 + 24)) {
      objc_msgSend_rebuildRecognitionResults(self, v6, v7, v8, v9, v10, v11, v12, v13, v14);
    }
    else {
      objc_msgSend_setNeedsRecognitionUpdate(self, v6, v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B974BC;
  v10[3] = &unk_1E64E12A8;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  sub_1C4B95C8C((uint64_t)self, v10);
  if (*((unsigned char *)v15 + 24)) {
    objc_msgSend_setNeedsRecognitionUpdateImmediately_(self, v6, 1, v7, v8, v9);
  }

  _Block_object_dispose(&v14, 8);
}

- (CHRecognitionSessionResult)lastRecognitionResult
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B97654;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionSessionResult *)v2;
}

- (void)_setLastRecognitionResult:(id)a3
{
  uint64_t v5 = (CHRecognitionSessionResult *)a3;
  if (self->_lastRecognitionResult != v5)
  {
    objc_storeStrong((id *)&self->_lastRecognitionResult, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1C4B97724;
    v6[3] = &unk_1E64E48E8;
    v6[4] = self;
    sub_1C4B97730((uint64_t)self, v6);
  }
}

- (CHStrokeProvider)latestStrokeProvider
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B978F8;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHStrokeProvider *)v2;
}

- (void)_setLatestStrokeProvider:(id)a3
{
  uint64_t v5 = (CHStrokeProvider *)a3;
  latestStrokeProvider = self->_latestStrokeProvider;
  p_latestStrokeProvider = &self->_latestStrokeProvider;
  if (latestStrokeProvider != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_latestStrokeProvider, a3);
    uint64_t v5 = v8;
  }
}

- (CHCalculateDocumentProvider)latestCalculateDocumentProvider
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B97A74;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHCalculateDocumentProvider *)v2;
}

- (void)_setLatestCalculateDocumentProvider:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (CHCalculateDocumentProvider *)a3;
  p_latestCalculateDocumentProvider = (void **)&self->_latestCalculateDocumentProvider;
  if (self->_latestCalculateDocumentProvider != v5)
  {
    objc_storeStrong((id *)&self->_latestCalculateDocumentProvider, a3);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = objc_msgSend_expressionEvaluationResults(*p_latestCalculateDocumentProvider, v7, v8, v9, v10, v11);
      uint64_t v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);
    }
    else
    {
      uint64_t v18 = 0;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v19 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = objc_msgSend_declaredVariables(*p_latestCalculateDocumentProvider, v20, v21, v22, v23, v24);
      uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
      uint64_t v37 = objc_msgSend_recognizedExpressions(*p_latestCalculateDocumentProvider, v32, v33, v34, v35, v36);
      int v43 = 134218752;
      uint64_t v44 = self;
      __int16 v45 = 2048;
      uint64_t v46 = v31;
      __int16 v47 = 2048;
      uint64_t v48 = objc_msgSend_count(v37, v38, v39, v40, v41, v42);
      __int16 v49 = 2048;
      uint64_t v50 = v18;
      _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p received updated calculate document provider. Declared variables: %lu, Recognized expressions: %lu, Evaluation results: %lu", (uint8_t *)&v43, 0x2Au);
    }
  }
}

- (CHCanvasAttachmentProvider)latestCanvasAttachmentProvider
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B97D9C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHCanvasAttachmentProvider *)v2;
}

- (void)_setLatestCanvasAttachmentProvider:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (CHCanvasAttachmentProvider *)a3;
  if (self->_latestCanvasAttachmentProvider != v5)
  {
    objc_storeStrong((id *)&self->_latestCanvasAttachmentProvider, a3);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v6 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_msgSend_attachments(self->_latestCanvasAttachmentProvider, v7, v8, v9, v10, v11);
      int v18 = 134218240;
      uint64_t v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);
      _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p received updated canvas attachment provider with %lu attachments.", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (CHTextInputQuery)activeTextInputQuery
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTextInputQuery);
  return (CHTextInputQuery *)WeakRetained;
}

- (void)setActiveTextInputQuery:(id)a3
{
}

- (int64_t)status
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B97FFC;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setStatus:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_status != a3)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v5 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int64_t status = self->_status;
      *(_DWORD *)buf = 134218496;
      int64_t v9 = status;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "RecognitionTask: Session status transitioning from %ld to %ld for session %p", buf, 0x20u);
    }

    self->_int64_t status = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1C4B98170;
    v7[3] = &unk_1E64E48E8;
    v7[4] = self;
    sub_1C4B97730((uint64_t)self, v7);
  }
}

- (id)indexableContent
{
  uint64_t v3 = [CHIndexableContentQuery alloc];
  uint64_t v8 = objc_msgSend_initWithRecognitionSession_(v3, v4, (uint64_t)self, v5, v6, v7);
  objc_msgSend_start(v8, v9, v10, v11, v12, v13);
  objc_msgSend_waitForPendingUpdates(v8, v14, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_indexableContent(v8, v19, v20, v21, v22, v23);

  return v24;
}

- (void)setNeedsRecognitionUpdate
{
  objc_msgSend_setNeedsRecognitionUpdateImmediately_(self, a2, 0, v2, v3, v4);
}

- (void)cancelOngoingRequests
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "Starting cancelOngoingRequests for session", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4B987D0;
  v6[3] = &unk_1E64E0D48;
  v6[4] = self;
  uint64_t v4 = (void *)MEMORY[0x1C8786E90](v6);
  sub_1C4B95C8C((uint64_t)self, v4);
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v5 = (id)qword_1EA3C9FA0;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v5 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = self;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEFAULT, "Ending cancelOngoingRequests for session %p", buf, 0xCu);
  }
LABEL_8:
}

- (void)rebuildRecognitionResults
{
  uint64_t v7 = objc_msgSend_dataSource(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_strokeProviderSnapshot(v7, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_mode(self, v14, v15, v16, v17, v18);
  if (!v19) {
    goto LABEL_4;
  }
  if (v19 != 1)
  {
    if (v19 != 2)
    {
LABEL_6:
      uint64_t v30 = 0;
      goto LABEL_7;
    }
LABEL_4:
    if (objc_opt_respondsToSelector())
    {
      uint64_t v30 = 0;
      uint64_t v31 = objc_msgSend_calculateDocumentProviderSnapshot(v7, v25, v26, v27, v28, v29);
LABEL_10:
      uint64_t v32 = (void *)v31;
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  uint64_t v33 = objc_msgSend_activeTextInputQuery(self, v20, v21, v22, v23, v24);
  uint64_t v39 = objc_msgSend_textInputTargetsDataSource(v33, v34, v35, v36, v37, v38);
  __int16 v45 = objc_msgSend_textInputTargets(v39, v40, v41, v42, v43, v44);
  uint64_t v30 = objc_msgSend_copy(v45, v46, v47, v48, v49, v50);

  if (objc_opt_respondsToSelector())
  {
    uint64_t v31 = objc_msgSend_calculateDocumentProviderSnapshot(v7, v51, v52, v53, v54, v55);
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v32 = 0;
LABEL_11:
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1C4B98C0C;
  v60[3] = &unk_1E64E4938;
  v60[4] = self;
  id v56 = v13;
  id v61 = v56;
  id v57 = v7;
  id v62 = v57;
  id v63 = v32;
  id v64 = v30;
  id v58 = v30;
  id v59 = v32;
  sub_1C4B95C8C((uint64_t)self, v60);
}

- (NSData)sessionData
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B9B8F8;
  v4[3] = &unk_1E64E1A88;
  v4[4] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

- (BOOL)loadSessionData:(id)a3 error:(id *)a4
{
  return 0;
}

+ (BOOL)shouldRunRecognitionLocallyWithEnvironment:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

+ (void)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CHRemoteTextSynthesizer);
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v12 = objc_msgSend_count(v4, v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_setWithCapacity_(v6, v13, v12, v14, v15, v16);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1C4B9BCA8;
  v36[3] = &unk_1E64E3948;
  id v18 = v17;
  id v37 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v19, (uint64_t)v36, v20, v21, v22);
  id v35 = 0;
  char updated = objc_msgSend_updateStyleInventoryWithRemovedStrokeIdentifiers_error_(v5, v23, (uint64_t)v18, (uint64_t)&v35, v24, v25);
  id v27 = v35;
  if ((updated & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v28 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_msgSend_localizedDescription(v27, v29, v30, v31, v32, v33);
      *(_DWORD *)buf = 134218498;
      id v39 = a1;
      __int16 v40 = 2112;
      id v41 = v4;
      __int16 v42 = 2112;
      uint64_t v43 = v34;
      _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_ERROR, "RecognitionSession %p couldn't remove strokes from the inventory with identifiers: %@. Error: %@", buf, 0x20u);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_mode(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInteger_forKey_(v4, v11, v10, @"mode", v12, v13);
  uint64_t v19 = objc_msgSend_sessionVersion(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"version", v21, v22);

  uint64_t v28 = objc_msgSend_lastRecognitionResult(self, v23, v24, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, @"lastRecognitionResult", v30, v31);

  id v37 = objc_msgSend_preferredLocales(self, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"preferredLocales", v39, v40);

  uint64_t v46 = objc_msgSend_recognitionEnvironment(self, v41, v42, v43, v44, v45);
  objc_msgSend_encodeInteger_forKey_(v4, v47, v46, @"recognitionEnvironment", v48, v49);
  uint64_t v55 = objc_msgSend_priority(self, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInteger_forKey_(v4, v56, v55, @"priority", v57, v58);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v59 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(self->_preferredLocales, v60, @", ", (uint64_t)&unk_1F2011290, v61, v62);
    id v116 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v68 = objc_msgSend_recognitionEnvironment(self, v63, v64, v65, v66, v67);
    uint64_t v74 = objc_msgSend_priority(self, v69, v70, v71, v72, v73);
    v115 = objc_msgSend_lastRecognitionResult(self, v75, v76, v77, v78, v79);
    uint64_t v85 = objc_msgSend_orderedStrokeIdentifiers(v115, v80, v81, v82, v83, v84);
    uint64_t v91 = objc_msgSend_count(v85, v86, v87, v88, v89, v90);
    v97 = objc_msgSend_lastRecognitionResult(self, v92, v93, v94, v95, v96);
    v103 = objc_msgSend_strokeGroupingResult(v97, v98, v99, v100, v101, v102);
    v109 = objc_msgSend_strokeGroups(v103, v104, v105, v106, v107, v108);
    *(_DWORD *)buf = 134219266;
    v118 = self;
    __int16 v119 = 2112;
    id v120 = v116;
    __int16 v121 = 2048;
    uint64_t v122 = v68;
    __int16 v123 = 2048;
    uint64_t v124 = v74;
    __int16 v125 = 2048;
    uint64_t v126 = v91;
    __int16 v127 = 2048;
    uint64_t v128 = objc_msgSend_count(v109, v110, v111, v112, v113, v114);
    _os_log_impl(&dword_1C492D000, v59, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p has been serialized with preferredLocales: %@, recognitionEnvironment: %ld, priority: %ld. Last result covers %ld strokes, %ld groups.", buf, 0x3Eu);
  }
}

- (CHRecognitionSession)initWithCoder:(id)a3
{
  v121[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"version", v7, v8);
  if (objc_msgSend_isValidSessionVersion(v9, v10, v11, v12, v13, v14))
  {
    uint64_t v19 = objc_msgSend_decodeIntegerForKey_(v4, v15, @"mode", v16, v17, v18);
    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v121, 2, v22, v23);
    uint64_t v29 = objc_msgSend_setWithArray_(v20, v25, (uint64_t)v24, v26, v27, v28);
    uint64_t v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, @"preferredLocales", v31, v32);

    uint64_t v38 = objc_msgSend_decodeIntegerForKey_(v4, v34, @"recognitionEnvironment", v35, v36, v37);
    uint64_t v43 = objc_msgSend_decodeIntegerForKey_(v4, v39, @"priority", v40, v41, v42);
    uint64_t v47 = (void **)objc_msgSend_initWithMode_withVersion_(self, v44, v19, (uint64_t)v9, v45, v46);
    objc_msgSend_setPreferredLocales_(v47, v48, (uint64_t)v33, v49, v50, v51);
    objc_msgSend_setRecognitionEnvironment_(v47, v52, v38, v53, v54, v55);
    objc_msgSend_setPriority_(v47, v56, v43, v57, v58, v59);
    if (objc_msgSend_isValidSessionResultVersion(v47[14], v60, v61, v62, v63, v64))
    {
      uint64_t v65 = objc_opt_class();
      uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, @"lastRecognitionResult", v67, v68);
      objc_msgSend__setLastRecognitionResult_(v47, v70, (uint64_t)v69, v71, v72, v73);
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v80 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v86 = objc_msgSend_sessionResultVersion(v47[14], v81, v82, v83, v84, v85);
        int v113 = 134218240;
        uint64_t v114 = v86;
        __int16 v115 = 2048;
        uint64_t v116 = 5;
        _os_log_impl(&dword_1C492D000, v80, OS_LOG_TYPE_DEFAULT, "Last recognition result not loaded because session result version %ld does not match the current result version %ld.", (uint8_t *)&v113, 0x16u);
      }

      uint64_t v87 = [CHRecognitionSessionVersion alloc];
      uint64_t v69 = objc_msgSend_initWithSessionVersion_sessionResultVersion_(v87, v88, 1, 5, v89, v90);
      objc_msgSend__setSessionVersion_(v47, v91, (uint64_t)v69, v92, v93, v94);
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v95 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v47[21], v96, @", ", (uint64_t)&unk_1F20112B0, v97, v98);
      id v99 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v105 = objc_msgSend_recognitionEnvironment(v47, v100, v101, v102, v103, v104);
      uint64_t v111 = objc_msgSend_priority(v47, v106, v107, v108, v109, v110);
      int v113 = 134218754;
      uint64_t v114 = (uint64_t)v47;
      __int16 v115 = 2112;
      uint64_t v116 = (uint64_t)v99;
      __int16 v117 = 2048;
      uint64_t v118 = v105;
      __int16 v119 = 2048;
      uint64_t v120 = v111;
      _os_log_impl(&dword_1C492D000, v95, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p has been deserialized with preferredLocales: %@, recognitionEnvironment: %ld, priority: %ld, and lastRecognitionResult.", (uint8_t *)&v113, 0x2Au);
    }
    self = v47;
    uint64_t v79 = self;
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v33 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v113 = 134218240;
      uint64_t v114 = objc_msgSend_sessionVersion(v9, v74, v75, v76, v77, v78);
      __int16 v115 = 2048;
      uint64_t v116 = 1;
      _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_DEFAULT, "Nil RecognitionSession has been returned because session version %ld does not match the current session version %ld.", (uint8_t *)&v113, 0x16u);
    }
    uint64_t v79 = 0;
  }

  return v79;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHRecognitionSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (void)setRecognitionEnvironment:(int64_t)a3
{
  self->_recognitionEnvironment = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeClassificationModel, 0);
  objc_storeStrong((id *)&self->__activeTasks, 0);
  objc_storeStrong((id *)&self->__highResponsivenessQueue, 0);
  objc_storeStrong((id *)&self->__observersQueue, 0);
  objc_storeStrong((id *)&self->__sessionQueue, 0);
  objc_storeStrong((id *)&self->__tasksWorkQueueBackground, 0);
  objc_storeStrong((id *)&self->__tasksWorkQueueForeground, 0);
  objc_storeStrong((id *)&self->__inputDrawingClients, 0);
  objc_storeStrong((id *)&self->__changeObserversTable, 0);
  objc_storeStrong((id *)&self->__lineWrapper, 0);
  objc_storeStrong((id *)&self->__textSynthesizer, 0);
  objc_storeStrong((id *)&self->__mathRecognizer, 0);
  objc_storeStrong((id *)&self->__correctionRecognizersByLocalesKey, 0);
  objc_storeStrong((id *)&self->__latestTextInputTargets, 0);
  objc_storeStrong((id *)&self->__recognizersByLocaleID, 0);
  objc_storeStrong((id *)&self->__textRecognitionLocales, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_recognitionOptions, 0);
  objc_storeStrong((id *)&self->_sessionVersion, 0);
  objc_storeStrong((id *)&self->_partialRecognitionResult, 0);
  objc_storeStrong((id *)&self->_cachedFastGroupingRecognitionResult, 0);
  objc_destroyWeak((id *)&self->_activeTextInputQuery);
  objc_storeStrong((id *)&self->_latestCanvasAttachmentProvider, 0);
  objc_storeStrong((id *)&self->_latestCalculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->_latestStrokeProviderVisibleStrokes, 0);
  objc_storeStrong((id *)&self->_latestStrokeProvider, 0);
  objc_storeStrong((id *)&self->_lastRecognitionResult, 0);
}

- (BOOL)strokeGroupingOnly
{
  return self->_strokeGroupingOnly;
}

- (void)setStrokeGroupingOnly:(BOOL)a3
{
  self->_strokeGroupingOnly = a3;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  self->_autoCapitalizationMode = a3;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (void)setAutoCorrectionMode:(int)a3
{
  self->_autoCorrectionMode = a3;
}

- (int)baseWritingDirection
{
  return *(void *)&self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(void *)&self->_baseWritingDirection = *(void *)&a3;
}

- (unint64_t)strokeGroupOrdering
{
  return self->_strokeGroupOrdering;
}

- (void)setStrokeGroupOrdering:(unint64_t)a3
{
  self->_strokeGroupOrdering = a3;
}

- (BOOL)disableMathTextSwapping
{
  return self->_disableMathTextSwapping;
}

- (void)setDisableMathTextSwapping:(BOOL)a3
{
  self->_disableMathTextSwapping = a3;
}

- (BOOL)leverageAllProvidedVariables
{
  return self->_leverageAllProvidedVariables;
}

- (void)setLeverageAllProvidedVariables:(BOOL)a3
{
  self->_leverageAllProvidedVariables = a3;
}

- (void)updateRecognitionOptions:(id)a3
{
  objc_msgSend_addEntriesFromDictionary_(self->_recognitionOptions, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)recognitionOptionForKey:(id)a3
{
  uint64_t v6 = objc_msgSend_objectForKey_(self->_recognitionOptions, a2, (uint64_t)a3, v3, v4, v5);
  return v6;
}

- (id)lineWrapper
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B9C944;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)createRecognizerForLocale:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6
{
  BOOL v7 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v18[0] = v10;
  uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v18, 1, v12, v13);
  RecognizerForLocales_sessionMode_remote_priority = objc_msgSend_createRecognizerForLocales_sessionMode_remote_priority_(a1, v15, (uint64_t)v14, a4, v7, a6);

  return RecognizerForLocales_sessionMode_remote_priority;
}

+ (id)createRecognizerForLocales:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a4 == 1) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 6;
  }
  uint64_t v118 = v9;
  uint64_t v11 = objc_opt_class();
  objc_msgSend_effectiveRecognitionLocales_recognitionMode_(v11, v12, (uint64_t)v9, v10, v13, v14);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v119, (uint64_t)v128, 16, v17);
  int64_t v117 = a6;
  if (v18)
  {
    uint64_t v19 = *(void *)v120;
    uint64_t v20 = 3;
    if (a4 == 1)
    {
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v120 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v119 + 1) + 8 * i);
          uint64_t v23 = objc_opt_class();
          if (objc_msgSend_shouldForceNoAlternativeRecognitionCandidates_(v23, v24, v22, v25, v26, v27)) {
            uint64_t v20 = 1;
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v28, (uint64_t)&v119, (uint64_t)v128, 16, v29);
      }
      while (v18);
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v120 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v31 = *(void *)(*((void *)&v119 + 1) + 8 * j);
          uint64_t v32 = objc_opt_class();
          objc_msgSend_shouldForceNoAlternativeRecognitionCandidates_(v32, v33, v31, v34, v35, v36);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v37, (uint64_t)&v119, (uint64_t)v128, 16, v38);
      }
      while (v18);
    }
  }
  else
  {
    uint64_t v20 = 3;
  }

  if (v7)
  {
    uint64_t v39 = objc_opt_class();
    uint64_t v43 = objc_msgSend_newRemoteRecognizerWithMode_locales_(v39, v40, v10, (uint64_t)v118, v41, v42);
    objc_msgSend_setPriority_(v43, v44, v117, v45, v46, v47);
  }
  else
  {
    uint64_t v53 = objc_alloc_init(CHRecognizerOptions);
    objc_msgSend_setEnableCachingIfAvailable_(v53, v54, 0, v55, v56, v57);
    objc_msgSend_setEnableGen2ModelIfAvailable_(v53, v58, 1, v59, v60, v61);
    objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v53, v62, a4 == 1, v63, v64, v65);
    uint64_t v71 = objc_msgSend_firstObject(v15, v66, v67, v68, v69, v70);
    if ((unint64_t)objc_msgSend_count(v15, v72, v73, v74, v75, v76) >= 2)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v77 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        uint64_t v83 = objc_msgSend_count(v15, v78, v79, v80, v81, v82);
        uint64_t v89 = objc_msgSend_localeIdentifier(v71, v84, v85, v86, v87, v88);
        *(_DWORD *)buf = 134218242;
        uint64_t v125 = v83;
        __int16 v126 = 2112;
        __int16 v127 = v89;
        _os_log_impl(&dword_1C492D000, v77, OS_LOG_TYPE_ERROR, "Requested creating in-process recognizer with %ld locales. Only the top one will be honored: %@", buf, 0x16u);
      }
    }
    uint64_t v90 = objc_opt_class();
    __int16 v123 = v71;
    uint64_t v94 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v91, (uint64_t)&v123, 1, v92, v93);
    id v99 = objc_msgSend_defaultActiveCharacterSetForLocales_(v90, v95, (uint64_t)v94, v96, v97, v98);

    uint64_t v100 = [CHRecognizer alloc];
    uint64_t v43 = objc_msgSend_initWithMode_locale_recognizerOptions_(v100, v101, v10, (uint64_t)v71, (uint64_t)v53, v102);
    uint64_t v107 = objc_msgSend_objectForKeyedSubscript_(v99, v103, (uint64_t)v71, v104, v105, v106);
    objc_msgSend_setActiveCharacterSet_(v43, v108, (uint64_t)v107, v109, v110, v111);
  }
  objc_msgSend_setMinimumDrawingSize_(v43, v48, v49, v50, v51, v52, 3.0, 3.0, v117);
  objc_msgSend_setMaxRecognitionResultCount_(v43, v112, v20, v113, v114, v115);

  return v43;
}

+ (id)createMathRecognizerRunningRemote:(BOOL)a3 priority:(int64_t)a4
{
  if (a3)
  {
    uint64_t v5 = [CHRemoteMathRecognizer alloc];
    uint64_t v10 = (CHMathRecognizer *)objc_msgSend_initWithEnableCachingIfAvailable_(v5, v6, 1, v7, v8, v9);
    objc_msgSend_setPriority_(v10, v11, a4, v12, v13, v14);
    if (!v10)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v20 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      __int16 v29 = 0;
      uint64_t v21 = "Failed to initialize CHRemoteMathRecognizer";
      uint64_t v22 = (uint8_t *)&v29;
LABEL_12:
      _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_FAULT, v21, v22, 2u);
LABEL_13:

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = objc_alloc_init(CHMathRecognizer);
    if (!v10)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v20 = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      LOWORD(v28) = 0;
      uint64_t v21 = "Failed to initialize CHMathRecognizer";
      uint64_t v22 = (uint8_t *)&v28;
      goto LABEL_12;
    }
  }
  objc_msgSend_setMinimumDrawingSize_(v10, v15, v16, v17, v18, v19, 3.0, 3.0, v28);
  objc_msgSend_setMaxRecognitionResultCount_(v10, v23, 1, v24, v25, v26);
  return v10;
}

- (id)recognizableDrawingForStrokeGroupQueryItem:(id)a3
{
  uint64_t v98 = 0;
  id v99 = &v98;
  uint64_t v100 = 0x3032000000;
  uint64_t v101 = sub_1C4B9763C;
  uint64_t v102 = sub_1C4B9764C;
  id v103 = 0;
  id v91 = a3;
  uint64_t v93 = objc_msgSend_strokeGroupIdentifier(v91, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_dataSource(self, v9, v10, v11, v12, v13);
  uint64_t v89 = v14;
  uint64_t v92 = objc_msgSend_strokeProviderSnapshot(v14, v15, v16, v17, v18, v19);
  if (self->_mode | 2) == 2 && (objc_opt_respondsToSelector())
  {
    uint64_t v90 = objc_msgSend_calculateDocumentProviderSnapshot(v14, v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v90 = 0;
  }
  uint64_t v88 = [CHRecognitionSessionTask alloc];
  uint64_t v30 = objc_msgSend_mode(self, v25, v26, v27, v28, v29);
  textRecognitionLocales = self->__textRecognitionLocales;
  preferredLocales = self->_preferredLocales;
  lastRecognitionResult = self->_lastRecognitionResult;
  unsigned int taskQueueQoSClass = self->__taskQueueQoSClass;
  uint64_t v40 = objc_msgSend_recognitionEnvironment(self, v35, v36, v37, v38, v39);
  strokeGroupingModel = self->_strokeGroupingModel;
  recognitionOptions = self->_recognitionOptions;
  uint64_t v43 = self->_strokeClassificationModel;
  isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine = objc_msgSend_initWithSessionMode_locales_preferredLocales_strokeProvider_calculateDocumentProvider_inputResult_recognitionQOSClass_recognitionEnvironment_isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine_(v88, v44, v30, (uint64_t)textRecognitionLocales, (uint64_t)preferredLocales, (uint64_t)v92, v90, lastRecognitionResult, taskQueueQoSClass, v40, 0, v43, strokeGroupingModel, 0, 0, 0, 0, recognitionOptions, 0, 0);

  objc_msgSend_setDisableMathTextSwapping_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v46, self->_disableMathTextSwapping, v47, v48, v49);
  objc_msgSend_setLeverageAllProvidedVariables_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v50, self->_leverageAllProvidedVariables, v51, v52, v53);
  objc_msgSend_setDelegate_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v54, (uint64_t)self, v55, v56, v57);
  objc_msgSend_setStrokeGroupingOnly_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v58, 1, v59, v60, v61);
  objc_msgSend_setSaveInputDrawings_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v62, 1, v63, v64, v65);
  uint64_t v70 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v66, (uint64_t)v93, v67, v68, v69);
  objc_msgSend_setForceRecognitionStrokeGroupIdentifiers_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine, v71, (uint64_t)v70, v72, v73, v74);

  int v80 = objc_msgSend_q_needsForegroundRecognition(self, v75, v76, v77, v78, v79);
  uint64_t v81 = 288;
  if (v80) {
    uint64_t v81 = 280;
  }
  uint64_t v82 = *(Class *)((char *)&self->super.isa + v81);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4B9D530;
  block[3] = &unk_1E64E12A8;
  id v95 = isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine;
  id v96 = v93;
  uint64_t v97 = &v98;
  id v83 = v93;
  id v84 = isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_subjectStrokeClassificationResult_recognitionOptions_partialResultBlock_wantsAutoRefine;
  uint64_t v85 = v82;
  dispatch_sync(v85, block);
  id v86 = (id)v99[5];

  _Block_object_dispose(&v98, 8);
  return v86;
}

- (void)registerChangeObserver:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v5 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_count(self->__changeObserversTable, v6, v7, v8, v9, v10);
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = v11;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEFAULT, "Starting registering a new observer change on session %p (%ld observers)", buf, 0x16u);
  }

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_1C4B9DA8C;
  uint64_t v23 = &unk_1E64E11E0;
  uint64_t v24 = self;
  id v12 = v4;
  id v25 = v12;
  sub_1C4B95C8C((uint64_t)self, &v20);
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v13 = (id)qword_1EA3C9FA0;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v13 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    uint64_t v19 = objc_msgSend_count(self->__changeObserversTable, v14, v15, v16, v17, v18, v20, v21, v22, v23, v24);
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = v19;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEFAULT, "Ending registering a new observer change on session %p (%ld observers remaining)", buf, 0x16u);
  }
LABEL_8:
}

- (void)unregisterChangeObserver:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v5 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)objc_opt_class();
    uint64_t v12 = objc_msgSend_count(self->__changeObserversTable, v7, v8, v9, v10, v11);
    *(_DWORD *)buf = 138412802;
    id v29 = v6;
    __int16 v30 = 2048;
    uint64_t v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = (CHRecognitionSession *)v12;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEFAULT, "Starting unregistering an observer of type %@ from session %p (%ld observers)", buf, 0x20u);
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = sub_1C4B9DD3C;
  id v25 = &unk_1E64E11E0;
  uint64_t v26 = self;
  id v13 = v4;
  id v27 = v13;
  sub_1C4B95C8C((uint64_t)self, &v22);
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v14 = (id)qword_1EA3C9FA0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v14 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    uint64_t v15 = (CHRecognitionSession *)(id)objc_opt_class();
    uint64_t v21 = objc_msgSend_count(self->__changeObserversTable, v16, v17, v18, v19, v20, v22, v23, v24, v25, v26);
    *(_DWORD *)buf = 134218754;
    id v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    __int16 v32 = 2048;
    uint64_t v33 = self;
    __int16 v34 = 2048;
    uint64_t v35 = v21;
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "Unregistering an observer %p of type %@ on session %p (%ld observers remaining)", buf, 0x2Au);
  }
LABEL_8:
}

- (id)textSynthesizer
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  uint64_t v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4B9DE50;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)textSynthesizerWithLocaleFallback
{
  uint64_t v7 = objc_msgSend_textSynthesizer(self, a2, v2, v3, v4, v5);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_1C4B9763C;
  uint64_t v19 = sub_1C4B9764C;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4B9E0AC;
  v11[3] = &unk_1E64E49D8;
  id v13 = self;
  uint64_t v14 = &v15;
  id v12 = v7;
  id v8 = v7;
  sub_1C4B95C8C((uint64_t)self, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)textSynthesizerWithLocaleFallbackIsSupported
{
  return 1;
}

- (CHRecognitionSession)initWithMode:(int64_t)a3 withVersion:(id)a4
{
  id v6 = a4;
  uint64_t v11 = (CHRecognitionSession *)objc_msgSend_initWithMode_(self, v7, a3, v8, v9, v10);
  uint64_t v16 = v11;
  if (v11) {
    objc_msgSend__setSessionVersion_(v11, v12, (uint64_t)v6, v13, v14, v15);
  }

  return v16;
}

- (void)setNeedsRecognitionUpdateImmediately:(BOOL)a3
{
  uint64_t v8 = objc_msgSend_dataSource(self, a2, a3, v3, v4, v5);
  uint64_t v14 = objc_msgSend_strokeProviderSnapshot(v8, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_mode(self, v15, v16, v17, v18, v19);
  if (!v20)
  {
LABEL_4:
    if (objc_opt_respondsToSelector())
    {
      uint64_t v31 = objc_msgSend_calculateDocumentProviderSnapshot(v8, v26, v27, v28, v29, v30);
    }
    else
    {
      uint64_t v31 = 0;
    }
    uint64_t v50 = 0;
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend_canvasAttachmentProviderSnapshot(v8, v58, v59, v60, v61, v62);
      uint64_t v56 = v57 = (void *)v31;
      goto LABEL_15;
    }
    uint64_t v57 = (void *)v31;
LABEL_14:
    uint64_t v56 = 0;
    goto LABEL_15;
  }
  if (v20 != 1)
  {
    if (v20 == 2) {
      goto LABEL_4;
    }
    uint64_t v50 = 0;
LABEL_9:
    uint64_t v57 = 0;
    goto LABEL_14;
  }
  __int16 v32 = objc_msgSend_activeTextInputQuery(self, v21, v22, v23, v24, v25);
  uint64_t v38 = objc_msgSend_textInputTargetsDataSource(v32, v33, v34, v35, v36, v37);
  uint64_t v44 = objc_msgSend_textInputTargets(v38, v39, v40, v41, v42, v43);
  uint64_t v50 = objc_msgSend_copy(v44, v45, v46, v47, v48, v49);

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v56 = 0;
  uint64_t v57 = objc_msgSend_calculateDocumentProviderSnapshot(v8, v51, v52, v53, v54, v55);
LABEL_15:
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = sub_1C4B9E4A8;
  v68[3] = &unk_1E64E4A00;
  v68[4] = self;
  id v63 = v14;
  id v69 = v63;
  id v64 = v8;
  id v70 = v64;
  id v71 = v57;
  id v72 = v56;
  id v73 = v50;
  BOOL v74 = a3;
  id v65 = v50;
  id v66 = v56;
  id v67 = v57;
  sub_1C4B95C8C((uint64_t)self, v68);
}

- (BOOL)shouldForceFastGrouping
{
  return self->__shouldForceFastGrouping;
}

- (void)setShouldForceFastGrouping:(BOOL)a3
{
  self->__shouldForceFastGrouping = a3;
}

- (BOOL)skipMathOperatorsInference
{
  return self->__skipMathOperatorsInference;
}

- (void)setSkipMathOperatorsInference:(BOOL)a3
{
  self->__skipMathOperatorsInference = a3;
  objc_msgSend_numberWithBool_(NSNumber, a2, !a3, v3, v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_recognitionOptions, v7, (uint64_t)v10, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v8, v9);
}

- (BOOL)skipPopulatingStyleInventory
{
  return self->__skipPopulatingStyleInventory;
}

- (void)setSkipPopulatingStyleInventory:(BOOL)a3
{
  self->__skipPopulatingStyleInventory = a3;
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_recognitionOptions, v7, (uint64_t)v10, @"CHRecognitionTaskSkipPopulatingInventory", v8, v9);
}

- (BOOL)skipPrincipalLines
{
  return self->__skipPrincipalLines;
}

- (void)setSkipPrincipalLines:(BOOL)a3
{
  self->__skipPrincipalLines = a3;
}

- (BOOL)forceLocaleNumberFormat
{
  return self->__forceLocaleNumberFormat;
}

- (void)setForceLocaleNumberFormat:(BOOL)a3
{
  self->__forceLocaleNumberFormat = a3;
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3, v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_recognitionOptions, v7, (uint64_t)v10, (uint64_t)CHMathPostProcessingOptionForceLocaleNumberFormat, v8, v9);
}

+ (id)effectiveLocalesFromLocales:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v65 = v3;
  uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  objc_msgSend_arrayWithCapacity_(v4, v11, v10, v12, v13, v14);
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v65;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v71, (uint64_t)v75, 16, v16);
  if (v21)
  {
    uint64_t v22 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (objc_msgSend_isLocaleSupported_(a1, v17, (uint64_t)v24, v18, v19, v20))
        {
          uint64_t v26 = objc_msgSend_languageCode(v24, v17, v25, v18, v19, v20);
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = sub_1C4B9EC9C;
          v69[3] = &unk_1E64E21A8;
          id v27 = v26;
          id v70 = v27;
          uint64_t v36 = objc_msgSend_indexOfObjectPassingTest_(v68, v28, (uint64_t)v69, v29, v30, v31);
          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend_addObject_(v68, v32, (uint64_t)v24, v33, v34, v35);
          }
          else
          {
            uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v68, v32, v36, v33, v34, v35);
            uint64_t v43 = objc_msgSend_countryCode(v37, v38, v39, v40, v41, v42);
            if (objc_msgSend_length(v43, v44, v45, v46, v47, v48))
            {
            }
            else
            {
              uint64_t v54 = objc_msgSend_countryCode(v24, v49, v50, v51, v52, v53);
              BOOL v60 = objc_msgSend_length(v54, v55, v56, v57, v58, v59) == 0;

              if (!v60) {
                objc_msgSend_replaceObjectAtIndex_withObject_(v68, v61, v36, (uint64_t)v24, v62, v63);
              }
            }
          }
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v71, (uint64_t)v75, 16, v20);
    }
    while (v21);
  }

  return v68;
}

+ (double)autoRefineTriggerFactor
{
  double v7 = 1.0;
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v8 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v2, v3, v4, v5, v6);
    uint64_t v13 = objc_msgSend_objectForKey_(v8, v9, @"CHAutoRefineTriggerFactor", v10, v11, v12);

    if (v13)
    {
      uint64_t v19 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v14, v15, v16, v17, v18);
      objc_msgSend_floatForKey_(v19, v20, @"CHAutoRefineTriggerFactor", v21, v22, v23);
      float v25 = v24;

      return v25;
    }
  }
  return v7;
}

- (void)waitForPendingRecognitionTasks
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4B9EE6C;
  v5[3] = &unk_1E64E11E0;
  v5[4] = self;
  dispatch_semaphore_t v6 = v3;
  uint64_t v4 = v3;
  sub_1C4B95C8C((uint64_t)self, v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)lastRecognitionResultWaitingForPendingTasks
{
  objc_msgSend_waitForPendingRecognitionTasks(self, a2, v2, v3, v4, v5);
  return (id)objc_msgSend_lastRecognitionResult(self, v7, v8, v9, v10, v11);
}

- (void)registerInputDrawingClient:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  sessionQueue = self->__sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4B9F160;
  block[3] = &unk_1E64E12A8;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v15;
  dispatch_sync(sessionQueue, block);
  if (*((unsigned char *)v16 + 24)) {
    objc_msgSend_rebuildRecognitionResults(self, v7, v8, v9, v10, v11);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)unregisterInputDrawingClient:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  sessionQueue = self->__sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4B9F3A0;
  block[3] = &unk_1E64E12A8;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = &v15;
  dispatch_sync(sessionQueue, block);
  if (*((unsigned char *)v16 + 24)) {
    objc_msgSend_rebuildRecognitionResults(self, v7, v8, v9, v10, v11);
  }

  _Block_object_dispose(&v15, 8);
}

- (id)recognizerForLocale:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B9763C;
  uint64_t v15 = sub_1C4B9764C;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4BA1F30;
  v8[3] = &unk_1E64E1190;
  id v9 = v4;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  sub_1C4B95C8C((uint64_t)self, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)textCorrectionRecognizerForLocales:(id)a3
{
  id v4 = a3;
  self;
  uint64_t v8 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v4, v5, @".", (uint64_t)&unk_1F2013BC8, v6, v7);

  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1C4B9763C;
  uint64_t v21 = sub_1C4B9764C;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4BA240C;
  v13[3] = &unk_1E64E4A78;
  id v16 = &v17;
  v13[4] = self;
  id v14 = v8;
  id v9 = v4;
  id v15 = v9;
  id v10 = v8;
  sub_1C4B95C8C((uint64_t)self, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)mathRecognizer
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1C4B9763C;
  id v9 = sub_1C4B9764C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1C4BA268C;
  v4[3] = &unk_1E64E1168;
  v4[4] = self;
  void v4[5] = &v5;
  sub_1C4B95C8C((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)evaluationResultForStrokeGroupIdentifier:(int64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = objc_msgSend_expressionEvaluationResults(self->_latestCalculateDocumentProvider, v5, v6, v7, v8, v9, 0);
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, (uint64_t)v35, 16, v12);
    if (v18)
    {
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v10);
          }
          uint64_t v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v22 = objc_msgSend_strokeGroupIdentifier(v21, v13, v14, v15, v16, v17);
          BOOL v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27) == a3;

          if (v28)
          {
            id v29 = v21;
            goto LABEL_13;
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v31, (uint64_t)v35, 16, v17);
        if (v18) {
          continue;
        }
        break;
      }
    }
    id v29 = 0;
LABEL_13:
  }
  else
  {
    id v29 = 0;
  }
  return v29;
}

- (id)mathTranscriptionWithEvaluationResultForStrokeGroup:(id)a3 outStrokeIdentifiers:(id *)a4 outStrokes:(id *)a5
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v170 = a3;
  uint64_t v12 = objc_msgSend_lastRecognitionResult(self, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_uniqueIdentifier(v170, v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v12, v19, v18, v20, v21, v22);

  if (!v23
    || (objc_msgSend_mathResult(v23, v24, v25, v26, v27, v28),
        id v29 = objc_claimAutoreleasedReturnValue(),
        v29,
        !v29))
  {
    uint64_t v52 = 0;
    uint64_t v36 = 0;
    goto LABEL_13;
  }
  uint64_t v30 = objc_msgSend_mathResult(v23, v24, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_preferredTranscription(v30, v31, v32, v33, v34, v35);

  uint64_t v42 = objc_msgSend_strokeIdentifiers(v170, v37, v38, v39, v40, v41);
  uint64_t v48 = objc_msgSend_latestStrokeProvider(self, v43, v44, v45, v46, v47);
  uint64_t v52 = objc_msgSend_sortedStrokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v49, (uint64_t)v42, (uint64_t)v48, v50, v51);

  uint64_t v58 = objc_msgSend_uniqueIdentifier(v170, v53, v54, v55, v56, v57);
  uint64_t v63 = objc_msgSend_evaluationResultForStrokeGroupIdentifier_(self, v59, v58, v60, v61, v62);
  id v69 = v63;
  if (v63)
  {
    id v70 = (void *)MEMORY[0x1E4F1CA48];
    long long v71 = objc_msgSend_string(v63, v64, v65, v66, v67, v68);
    uint64_t v77 = objc_msgSend_length(v71, v72, v73, v74, v75, v76);
    uint64_t v82 = objc_msgSend_arrayWithCapacity_(v70, v78, v77, v79, v80, v81);

    uint64_t v88 = objc_msgSend_string(v69, v83, v84, v85, v86, v87);
    uint64_t v94 = objc_msgSend_string(v69, v89, v90, v91, v92, v93);
    uint64_t v100 = objc_msgSend_length(v94, v95, v96, v97, v98, v99);
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = sub_1C4BA2F30;
    v175[3] = &unk_1E64E0E38;
    id v101 = v82;
    id v176 = v101;
    objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v88, v102, 0, v100, 2, (uint64_t)v175);

    uint64_t v107 = objc_msgSend_componentsJoinedByString_(v101, v103, @" ", v104, v105, v106);
    if (objc_msgSend_hasPrefix_(v36, v108, @"\\begin{array}{lr}", v109, v110, v111)
      && objc_msgSend_hasSuffix_(v36, v112, @"\\hline \\end{array}", v113, v114, v115))
    {
      uint64_t v117 = objc_msgSend_length(v36, v112, v116, v113, v114, v115);
      uint64_t v123 = objc_msgSend_length(@"\\end{array}", v118, v119, v120, v121, v122);
      uint64_t v128 = objc_msgSend_substringToIndex_(v36, v124, v117 - v123, v125, v126, v127);
      uint64_t v133 = objc_msgSend_stringByAppendingFormat_(v128, v129, @"%@ %@", v130, v131, v132, v107, @"\\end{array}");

      uint64_t v36 = (void *)v133;
    }
    else
    {
      if (!objc_msgSend_hasSuffix_(v36, v112, @"=", v113, v114, v115))
      {
LABEL_11:
        v139 = objc_msgSend_strokes(v69, v134, v135, v136, v137, v138);
        uint64_t v144 = objc_msgSend_arrayByAddingObjectsFromArray_(v52, v140, (uint64_t)v139, v141, v142, v143);

        uint64_t v52 = (void *)v144;
        goto LABEL_12;
      }
      objc_msgSend_stringByAppendingFormat_(v36, v134, @" %@", v136, v137, v138, v107);
      uint64_t v36 = v128 = v36;
    }

    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  if (a4)
  {
    v145 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25, v26, v27, v28);
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v146 = v52;
    uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v147, (uint64_t)&v171, (uint64_t)v177, 16, v148);
    if (v154)
    {
      uint64_t v155 = *(void *)v172;
      do
      {
        for (uint64_t i = 0; i != v154; ++i)
        {
          if (*(void *)v172 != v155) {
            objc_enumerationMutation(v146);
          }
          v157 = objc_msgSend_strokeIdentifier(*(void **)(*((void *)&v171 + 1) + 8 * i), v149, v150, v151, v152, v153);
          objc_msgSend_addObject_(v145, v158, (uint64_t)v157, v159, v160, v161);
        }
        uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v149, (uint64_t)&v171, (uint64_t)v177, 16, v153);
      }
      while (v154);
    }

    *a4 = (id)objc_msgSend_copy(v145, v162, v163, v164, v165, v166);
  }
  if (a5) {
    *a5 = v52;
  }
  id v167 = v36;

  return v167;
}

- (id)tokenStrokeIdentifiersForContextStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  uint64_t v20 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v16, 1, v17, v18, v19);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4BA3108;
  v29[3] = &unk_1E64E4AA0;
  v29[4] = self;
  id v22 = v13;
  id v30 = v22;
  CGFloat v34 = x;
  CGFloat v35 = y;
  int64_t v36 = a5;
  id v23 = v15;
  id v32 = v23;
  id v24 = v20;
  id v31 = v24;
  id v25 = v14;
  id v33 = v25;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"OnDemandGrouping", v29);
  uint64_t v26 = v33;
  id v27 = v24;

  return v27;
}

- (id)reflowableTextLinesForContextStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v14 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = objc_msgSend_count(v11, v15, v16, v17, v18, v19);
    _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "reflowable text lines query with context strokes %ld", buf, 0xCu);
  }

  id v24 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v20, 100, v21, v22, v23);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4BA3638;
  v33[3] = &unk_1E64E4AC8;
  v33[4] = self;
  id v26 = v11;
  id v34 = v26;
  CGFloat v38 = x;
  CGFloat v39 = y;
  id v27 = v13;
  id v36 = v27;
  id v28 = v24;
  id v35 = v28;
  id v29 = v12;
  id v37 = v29;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"ReflowableTextLines", v33);
  id v30 = v37;
  id v31 = v28;

  return v31;
}

+ (id)strokeIdentifiersInProximalGroupsForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  id v99 = a4;
  id v91 = a5;
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v8, v9, v10, v11, v12);
  id v94 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v97 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16, v17);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v18 = v92;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v104, (uint64_t)v117, 16, v20);
  if (v21)
  {
    uint64_t v22 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v105 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v104 + 1) + 8 * i);
        id v25 = objc_opt_class();
        id v33 = objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_(v25, v26, v24, (uint64_t)v99, v27, v28);
        if (v33) {
          objc_msgSend_addObject_(v97, v29, (uint64_t)v33, v30, v31, v32);
        }
        else {
          objc_msgSend_addObject_(v94, v29, v24, v30, v31, v32);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v34, (uint64_t)&v104, (uint64_t)v117, 16, v35);
    }
    while (v21);
  }

  id v90 = v97;
  id v98 = v91;
  self;
  uint64_t v96 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v36, v37, v38, v39, v40);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v90;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v112, (uint64_t)v119, 16, v42);
  if (v43)
  {
    uint64_t v44 = *(void *)v113;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v113 != v44) {
          objc_enumerationMutation(obj);
        }
        id v46 = v18;
        uint64_t v47 = *(void *)(*((void *)&v112 + 1) + 8 * j);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v48 = v98;
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v108, (uint64_t)v118, 16, v50);
        if (v55)
        {
          uint64_t v56 = *(void *)v109;
          while (2)
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v109 != v56) {
                objc_enumerationMutation(v48);
              }
              uint64_t v58 = *(void **)(*((void *)&v108 + 1) + 8 * k);
              if (objc_msgSend_containsObject_(v58, v51, v47, v52, v53, v54, v90))
              {
                objc_msgSend_addObjectsFromArray_(v96, v51, (uint64_t)v58, v52, v53, v54);
                goto LABEL_26;
              }
            }
            uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v108, (uint64_t)v118, 16, v54);
            if (v55) {
              continue;
            }
            break;
          }
        }
LABEL_26:

        id v18 = v46;
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v112, (uint64_t)v119, 16, v60);
    }
    while (v43);
  }

  uint64_t v66 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v61, v62, v63, v64, v65);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v67 = v96;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v100, (uint64_t)v116, 16, v69);
  if (v75)
  {
    uint64_t v76 = *(void *)v101;
    do
    {
      for (uint64_t m = 0; m != v75; ++m)
      {
        if (*(void *)v101 != v76) {
          objc_enumerationMutation(v67);
        }
        uint64_t v78 = objc_msgSend_strokeIdentifiers(*(void **)(*((void *)&v100 + 1) + 8 * m), v70, v71, v72, v73, v74, v90);
        uint64_t v84 = objc_msgSend_allObjects(v78, v79, v80, v81, v82, v83);
        objc_msgSend_addObjectsFromArray_(v66, v85, (uint64_t)v84, v86, v87, v88);
      }
      uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v100, (uint64_t)v116, 16, v74);
    }
    while (v75);
  }

  if (a6) {
    *a6 = v94;
  }

  return v66;
}

+ (id)strokeIdentifiersInFullContextForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  id v109 = a4;
  id v101 = a5;
  objc_msgSend_set(MEMORY[0x1E4F1CA80], v8, v9, v10, v11, v12);
  id v105 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v13, v14, v15, v16, v17);
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  obuint64_t j = v102;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v126, (uint64_t)v134, 16, v20);
  if (v21)
  {
    uint64_t v22 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v127 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        id v25 = objc_opt_class();
        id v33 = objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_(v25, v26, v24, (uint64_t)v109, v27, v28);
        if (v33) {
          objc_msgSend_addObject_(v18, v29, (uint64_t)v33, v30, v31, v32);
        }
        else {
          objc_msgSend_addObject_(v105, v29, v24, v30, v31, v32);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v126, (uint64_t)v134, 16, v35);
    }
    while (v21);
  }

  long long v108 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v36, v37, v38, v39, v40);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v106 = v101;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v41, (uint64_t)&v122, (uint64_t)v133, 16, v42);
  if (v43)
  {
    uint64_t v44 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v123 != v44) {
          objc_enumerationMutation(v106);
        }
        id v46 = *(void **)(*((void *)&v122 + 1) + 8 * j);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v47 = v18;
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v118, (uint64_t)v132, 16, v49);
        if (v54)
        {
          uint64_t v55 = *(void *)v119;
          while (2)
          {
            for (uint64_t k = 0; k != v54; ++k)
            {
              if (*(void *)v119 != v55) {
                objc_enumerationMutation(v47);
              }
              if (objc_msgSend_containsObject_(v46, v50, *(void *)(*((void *)&v118 + 1) + 8 * k), v51, v52, v53))
              {
                objc_msgSend_addObject_(v108, v50, (uint64_t)v46, v51, v52, v53);
                goto LABEL_26;
              }
            }
            uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v118, (uint64_t)v132, 16, v53);
            if (v54) {
              continue;
            }
            break;
          }
        }
LABEL_26:
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v57, (uint64_t)&v122, (uint64_t)v133, 16, v58);
    }
    while (v43);
  }

  uint64_t v59 = objc_opt_class();
  long long v100 = objc_msgSend_expandedStrokeGroupClusters_allClusters_(v59, v60, (uint64_t)v108, (uint64_t)v106, v61, v62);
  uint64_t v68 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v63, v64, v65, v66, v67);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v103 = v100;
  uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v69, (uint64_t)&v114, (uint64_t)v131, 16, v70);
  if (v71)
  {
    uint64_t v104 = *(void *)v115;
    do
    {
      for (uint64_t m = 0; m != v71; ++m)
      {
        if (*(void *)v115 != v104) {
          objc_enumerationMutation(v103);
        }
        uint64_t v73 = *(void **)(*((void *)&v114 + 1) + 8 * m);
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v74 = v73;
        uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v75, (uint64_t)&v110, (uint64_t)v130, 16, v76);
        if (v82)
        {
          uint64_t v83 = *(void *)v111;
          do
          {
            for (uint64_t n = 0; n != v82; ++n)
            {
              if (*(void *)v111 != v83) {
                objc_enumerationMutation(v74);
              }
              uint64_t v85 = objc_msgSend_strokeIdentifiers(*(void **)(*((void *)&v110 + 1) + 8 * n), v77, v78, v79, v80, v81);
              id v91 = objc_msgSend_allObjects(v85, v86, v87, v88, v89, v90);
              objc_msgSend_addObjectsFromArray_(v68, v92, (uint64_t)v91, v93, v94, v95);
            }
            uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v77, (uint64_t)&v110, (uint64_t)v130, 16, v81);
          }
          while (v82);
        }
      }
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v96, (uint64_t)&v114, (uint64_t)v131, 16, v97);
    }
    while (v71);
  }

  if (a6) {
    *a6 = v105;
  }

  return v68;
}

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v11, 100, v12, v13, v14);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C4BA6A90;
  v23[3] = &unk_1E64E4B40;
  id v17 = v10;
  id v25 = v17;
  v23[4] = self;
  id v18 = v15;
  id v24 = v18;
  CGFloat v27 = x;
  CGFloat v28 = y;
  id v19 = v9;
  id v26 = v19;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"ContextLookupAtLocation", v23);
  uint64_t v20 = v26;
  id v21 = v18;

  return v21;
}

- (id)structuredContextualTextResultsWithTextResults:(id)a3
{
  uint64_t v425 = *MEMORY[0x1E4F143B8];
  id v364 = a3;
  uint64_t v8 = objc_msgSend_strokeGroupingResult(self->_lastRecognitionResult, v3, v4, v5, v6, v7);
  v371 = objc_msgSend_textStrokeGroupClusters(v8, v9, v10, v11, v12, v13);

  v383 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16, v17, v18);
  long long v410 = 0u;
  long long v411 = 0u;
  long long v408 = 0u;
  long long v409 = 0u;
  obuint64_t j = v364;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v408, (uint64_t)v424, 16, v20);
  if (v21)
  {
    id v379 = *(id *)v409;
    do
    {
      CGFloat v27 = 0;
      v376 = (char *)v21;
      do
      {
        if (*(id *)v409 != v379) {
          objc_enumerationMutation(obj);
        }
        unint64_t v28 = 0;
        v381 = v27;
        id v29 = *(void **)(*((void *)&v408 + 1) + 8 * (void)v27);
        while (v28 < objc_msgSend_count(v371, v22, v23, v24, v25, v26))
        {
          long long v406 = 0u;
          long long v407 = 0u;
          long long v404 = 0u;
          long long v405 = 0u;
          uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v371, v22, v28, v24, v25, v26);
          uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v404, (uint64_t)v423, 16, v32);
          if (v38)
          {
            uint64_t v39 = *(void *)v405;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v405 != v39) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v41 = *(void **)(*((void *)&v404 + 1) + 8 * i);
                uint64_t v42 = objc_msgSend_strokeGroup(v29, v33, v34, v35, v36, v37);
                LODWORD(v41) = objc_msgSend_isEquivalentToStrokeGroup_(v41, v43, (uint64_t)v42, v44, v45, v46);

                if (v41)
                {
                  id v47 = objc_msgSend_numberWithInteger_(NSNumber, v33, v28, v35, v36, v37);
                  uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v383, v48, (uint64_t)v47, v49, v50, v51);

                  if (!v52)
                  {
                    uint64_t v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v53, v54, v55, v56, v57);
                    uint64_t v63 = objc_msgSend_numberWithInteger_(NSNumber, v59, v28, v60, v61, v62);
                    objc_msgSend_setObject_forKeyedSubscript_(v383, v64, v58, (uint64_t)v63, v65, v66);

                    uint64_t v52 = (void *)v58;
                  }
                  uint64_t v67 = objc_msgSend_numberWithInteger_(NSNumber, v53, v28, v55, v56, v57);
                  uint64_t v72 = objc_msgSend_objectForKeyedSubscript_(v383, v68, (uint64_t)v67, v69, v70, v71);
                  objc_msgSend_addObject_(v72, v73, (uint64_t)v29, v74, v75, v76);
                }
              }
              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v404, (uint64_t)v423, 16, v37);
            }
            while (v38);
          }

          ++v28;
        }
        CGFloat v27 = v381 + 1;
      }
      while (v381 + 1 != v376);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v408, (uint64_t)v424, 16, v26);
    }
    while (v21);
  }

  uint64_t v82 = objc_msgSend_allKeys(v383, v77, v78, v79, v80, v81);
  v360 = objc_msgSend_sortedArrayUsingSelector_(v82, v83, (uint64_t)sel_compare_, v84, v85, v86);

  v374 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v87, v88, v89, v90, v91);
  long long v402 = 0u;
  long long v403 = 0u;
  long long v400 = 0u;
  long long v401 = 0u;
  id v367 = v360;
  uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v92, (uint64_t)&v400, (uint64_t)v422, 16, v93);
  if (v98)
  {
    uint64_t v99 = *(void *)v401;
    do
    {
      for (uint64_t j = 0; j != v98; ++j)
      {
        if (*(void *)v401 != v99) {
          objc_enumerationMutation(v367);
        }
        id v101 = objc_msgSend_objectForKeyedSubscript_(v383, v94, *(void *)(*((void *)&v400 + 1) + 8 * j), v95, v96, v97);
        id v102 = [CHContextualTextResults alloc];
        long long v107 = objc_msgSend_initWithTextResults_(v102, v103, (uint64_t)v101, v104, v105, v106);
        objc_msgSend_addObject_(v374, v108, (uint64_t)v107, v109, v110, v111);
      }
      uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v367, v94, (uint64_t)&v400, (uint64_t)v422, 16, v97);
    }
    while (v98);
  }

  if (objc_msgSend_count(obj, v112, v113, v114, v115, v116) && !objc_msgSend_count(v374, v117, v118, v119, v120, v121))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    long long v122 = (id)qword_1EA3C9FA0;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v122, OS_LOG_TYPE_ERROR, "No textStrokeGroupClusters containing selected textResults in finding structuredContextualTextResults", buf, 2u);
    }

    long long v398 = 0u;
    long long v399 = 0u;
    long long v396 = 0u;
    long long v397 = 0u;
    id v123 = obj;
    uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v396, (uint64_t)v421, 16, v125);
    if (v126)
    {
      uint64_t v127 = *(void *)v397;
      do
      {
        for (uint64_t k = 0; k != v126; ++k)
        {
          if (*(void *)v397 != v127) {
            objc_enumerationMutation(v123);
          }
          uint64_t v129 = *(void *)(*((void *)&v396 + 1) + 8 * k);
          uint64_t v130 = [CHContextualTextResults alloc];
          uint64_t v420 = v129;
          v134 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v131, (uint64_t)&v420, 1, v132, v133);
          v139 = objc_msgSend_initWithTextResults_(v130, v135, (uint64_t)v134, v136, v137, v138);

          objc_msgSend_addObject_(v374, v140, (uint64_t)v139, v141, v142, v143);
        }
        uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v144, (uint64_t)&v396, (uint64_t)v421, 16, v145);
      }
      while (v126);
    }
  }
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v117, v118, v119, v120, v121);
  id v375 = (id)objc_claimAutoreleasedReturnValue();
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v366 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v150, v151, v152, v153, v154);
  long long v394 = 0u;
  long long v395 = 0u;
  long long v392 = 0u;
  long long v393 = 0u;
  id v382 = v374;
  uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v155, (uint64_t)&v392, (uint64_t)v419, 16, v156);
  if (v162)
  {
    uint64_t v163 = *(void *)v393;
    do
    {
      for (uint64_t m = 0; m != v162; ++m)
      {
        if (*(void *)v393 != v163) {
          objc_enumerationMutation(v382);
        }
        uint64_t v165 = *(void **)(*((void *)&v392 + 1) + 8 * m);
        if (objc_msgSend_isMathForContextLookup(v165, v157, v158, v159, v160, v161))
        {
          objc_msgSend_addObject_(v375, v166, (uint64_t)v165, v168, v169, v170);
        }
        else
        {
          objc_msgSend_bounds(v165, v166, v167, v168, v169, v170);
          v429.origin.double x = x;
          v429.origin.double y = y;
          v429.size.double width = width;
          v429.size.double height = height;
          CGRect v428 = CGRectUnion(v427, v429);
          double x = v428.origin.x;
          double y = v428.origin.y;
          double width = v428.size.width;
          double height = v428.size.height;
          objc_msgSend_addObject_(v366, v171, (uint64_t)v165, v172, v173, v174);
        }
      }
      uint64_t v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v382, v157, (uint64_t)&v392, (uint64_t)v419, 16, v161);
    }
    while (v162);
  }

  v370 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v175, v176, v177, v178, v179);
  long long v390 = 0u;
  long long v391 = 0u;
  long long v388 = 0u;
  long long v389 = 0u;
  id v380 = v366;
  uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v380, v180, (uint64_t)&v388, (uint64_t)v418, 16, v181);
  if (v182)
  {
    id v368 = *(id *)v389;
    do
    {
      uint64_t v372 = v182;
      for (uint64_t n = 0; n != v372; ++n)
      {
        if (*(id *)v389 != v368) {
          objc_enumerationMutation(v380);
        }
        v189 = *(void **)(*((void *)&v388 + 1) + 8 * n);
        objc_msgSend_bounds(v189, v183, v184, v185, v186, v187);
        double v191 = v190;
        double v193 = v192;
        double v195 = v194;
        double v197 = v196;
        id v198 = objc_alloc(MEMORY[0x1E4FAF188]);
        v377 = objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v198, v199, v200, v201, v202, v203, (v191 - x) / width, (v193 - y) / height, (v191 + v195 - x) / width, (v193 - y) / height, (v191 + v195 - x) / width, (v193 + v197 - y) / height, (v191 - x) / width, (v193 + v197 - y) / height, *(void *)&width, *(void *)&height);
        v209 = objc_msgSend_textResults(v189, v204, v205, v206, v207, v208);
        v214 = objc_msgSend_objectAtIndexedSubscript_(v209, v210, 0, v211, v212, v213);
        v220 = objc_msgSend_textResult(v214, v215, v216, v217, v218, v219);
        v231 = objc_msgSend_locale(v220, v221, v222, v223, v224, v225);
        if (v231)
        {
          v232 = objc_msgSend_textResults(v189, v226, v227, v228, v229, v230);
          v237 = objc_msgSend_objectAtIndexedSubscript_(v232, v233, 0, v234, v235, v236);
          v243 = objc_msgSend_textResult(v237, v238, v239, v240, v241, v242);
          v249 = objc_msgSend_locale(v243, v244, v245, v246, v247, v248);
        }
        else
        {
          v249 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v226, @"en_US", v228, v229, v230);
        }

        v255 = objc_msgSend_topTranscription(v189, v250, v251, v252, v253, v254);
        v259 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v255, v256, @"\n", @" ", v257, v258);

        v260 = [CHLineWrappableLine alloc];
        v263 = objc_msgSend_initWithQuad_text_locale_(v260, v261, (uint64_t)v377, (uint64_t)v259, (uint64_t)v249, v262);
        objc_msgSend_addObject_(v370, v264, (uint64_t)v263, v265, v266, v267);
      }
      uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v380, v183, (uint64_t)&v388, (uint64_t)v418, 16, v187);
    }
    while (v182);
  }

  v268 = [CHLineWrappableGroup alloc];
  v361 = objc_msgSend_initWithLines_(v268, v269, (uint64_t)v370, v270, v271, v272);
  v278 = objc_msgSend_lineWrapper(self, v273, v274, v275, v276, v277);
  v417 = v361;
  v282 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v279, (uint64_t)&v417, 1, v280, v281);
  v363 = objc_msgSend_lineWrappingResultForGroups_options_error_(v278, v283, (uint64_t)v282, 0, 0, v284);

  long long v386 = 0u;
  long long v387 = 0u;
  long long v384 = 0u;
  long long v385 = 0u;
  v290 = objc_msgSend_lineWrappableGroups(v363, v285, v286, v287, v288, v289);
  id v369 = v290;
  uint64_t v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v291, (uint64_t)&v384, (uint64_t)v416, 16, v292);
  if (v298)
  {
    uint64_t v299 = 0;
    uint64_t v373 = *(void *)v385;
    while (1)
    {
      uint64_t v300 = 0;
      uint64_t v378 = v298;
      do
      {
        uint64_t v301 = v299;
        if (*(void *)v385 != v373) {
          objc_enumerationMutation(v369);
        }
        v302 = *(void **)(*((void *)&v384 + 1) + 8 * v300);
        v308 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v293, v294, v295, v296, v297);
        for (iuint64_t i = 0; ; ++ii)
        {
          v310 = objc_msgSend_subregions(v302, v303, v304, v305, v306, v307);
          BOOL v316 = ii < objc_msgSend_count(v310, v311, v312, v313, v314, v315);

          if (!v316) {
            break;
          }
          if (v301 + ii < objc_msgSend_count(v382, v317, v318, v319, v320, v321))
          {
            v326 = objc_msgSend_objectAtIndexedSubscript_(v380, v322, v301 + ii, v323, v324, v325);
            v332 = objc_msgSend_textResults(v326, v327, v328, v329, v330, v331);
            objc_msgSend_addObjectsFromArray_(v308, v333, (uint64_t)v332, v334, v335, v336);

            goto LABEL_75;
          }
          if (qword_1EA3CA000 == -1)
          {
            v326 = (id)qword_1EA3C9FA0;
            if (!os_log_type_enabled(v326, OS_LOG_TYPE_ERROR)) {
              goto LABEL_75;
            }
LABEL_74:
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v326, OS_LOG_TYPE_ERROR, "structuredContextualTextResults: Number of wrapping result lines doesn't match wrappable textResults count", buf, 2u);
            goto LABEL_75;
          }
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          v326 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
LABEL_75:
        }
        v337 = [CHContextualTextResults alloc];
        v342 = objc_msgSend_initWithTextResults_(v337, v338, (uint64_t)v308, v339, v340, v341);
        objc_msgSend_addObject_(v375, v343, (uint64_t)v342, v344, v345, v346);

        uint64_t v299 = v301 + ii;
        ++v300;
      }
      while (v300 != v378);
      v290 = v369;
      uint64_t v298 = objc_msgSend_countByEnumeratingWithState_objects_count_(v369, v293, (uint64_t)&v384, (uint64_t)v416, 16, v297);
      uint64_t v299 = v301 + ii;
      if (!v298)
      {
        uint64_t v298 = v301 + ii;
        break;
      }
    }
  }

  if (v298 != objc_msgSend_count(v380, v347, v348, v349, v350, v351))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v352 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v352, OS_LOG_TYPE_FAULT))
    {
      uint64_t v358 = objc_msgSend_count(v382, v353, v354, v355, v356, v357);
      *(_DWORD *)buf = 134218240;
      uint64_t v413 = v298;
      __int16 v414 = 2048;
      uint64_t v415 = v358;
      _os_log_impl(&dword_1C492D000, v352, OS_LOG_TYPE_FAULT, "structuredContextualTextResults: Number of wrapping result lines should match that of wrappable textResults count: %lu != %lu", buf, 0x16u);
    }
  }
  return v375;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v11, 100, v12, v13, v14);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4BAB264;
  v24[3] = &unk_1E64E4BE0;
  id v17 = v10;
  id v28 = v17;
  id v18 = v15;
  id v25 = v18;
  id v19 = v8;
  id v26 = v19;
  CGFloat v27 = self;
  id v20 = v9;
  id v29 = v20;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"ContextLookupWithSelectedStrokes", v24);
  uint64_t v21 = v29;
  id v22 = v18;

  return v22;
}

- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v10, 100, v11, v12, v13);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4BAB524;
  v22[3] = &unk_1E64E4B90;
  id v16 = v9;
  id v24 = v16;
  v22[4] = self;
  id v17 = v14;
  id v23 = v17;
  id v26 = a3;
  id v18 = v8;
  id v25 = v18;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"ContextLookupWithPath", v22);
  id v19 = v25;
  id v20 = v17;

  return v20;
}

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v11 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_DEFAULT, "contextualTextResultsForContextStrokes", buf, 2u);
  }

  id v16 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v12, 100, v13, v14, v15);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4BABDA0;
  v25[3] = &unk_1E64E4BE0;
  id v18 = v16;
  id v26 = v18;
  CGFloat v27 = self;
  id v19 = v8;
  id v28 = v19;
  id v20 = v10;
  id v29 = v20;
  id v21 = v9;
  id v30 = v21;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"ContextualTextResults", v25);
  id v22 = v30;
  id v23 = v18;

  return v23;
}

- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v11, 100, v12, v13, v14);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4BAC038;
  v24[3] = &unk_1E64E4BE0;
  void v24[4] = self;
  id v17 = v8;
  id v25 = v17;
  id v18 = v10;
  id v27 = v18;
  id v19 = v15;
  id v26 = v19;
  id v20 = v9;
  id v28 = v20;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"StrokesCoveredByStroke", v24);
  id v21 = v28;
  id v22 = v19;

  return v22;
}

- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v18 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v14, 100, v15, v16, v17);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4BADBF8;
  v28[3] = &unk_1E64E4CF0;
  v28[4] = self;
  id v20 = v10;
  id v29 = v20;
  id v21 = v13;
  id v32 = v21;
  id v22 = v12;
  id v33 = v22;
  id v23 = v11;
  id v30 = v23;
  id v24 = v18;
  id v31 = v24;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"StrokePointTransformations", v28);
  id v25 = v31;
  id v26 = v24;

  return v26;
}

+ (id)alignReflowableTokens:(id)a3 resultTokens:(id)a4 strokeIdentifiers:(id)a5 outStrokeIdentifiers:(id *)a6
{
  uint64_t v343 = *MEMORY[0x1E4F143B8];
  id v284 = a3;
  id v8 = a4;
  id v318 = a5;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12, v13);
  id v286 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17, v18);
  id v287 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v319 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22, v23);
  long long v339 = 0u;
  long long v340 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  obuint64_t j = v284;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v337, (uint64_t)v342, 16, v25);
  if (!v26)
  {

    v317 = 0;
    id v33 = &stru_1F20141C8;
    if (!a6) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  unint64_t v32 = 0;
  v317 = 0;
  uint64_t v289 = *(void *)v338;
  uint64_t v290 = v26;
  id v33 = &stru_1F20141C8;
  do
  {
    for (uint64_t i = 0; i != v290; ++i)
    {
      if (*(void *)v338 != v289) {
        objc_enumerationMutation(obj);
      }
      uint64_t v34 = *(void **)(*((void *)&v337 + 1) + 8 * i);
      if (v317)
      {
        uint64_t v35 = objc_msgSend_string(v317, v27, v28, v29, v30, v31);
        if (objc_msgSend_hasPrecedingSpace(v34, v36, v37, v38, v39, v40))
        {
          uint64_t v46 = objc_msgSend_stringByAppendingString_(v35, v41, @" ", v43, v44, v45);

          uint64_t v35 = (void *)v46;
        }
        id v47 = objc_msgSend_string(v34, v41, v42, v43, v44, v45, v284);
        uint64_t v314 = objc_msgSend_stringByAppendingString_(v35, v48, (uint64_t)v47, v49, v50, v51);

        objc_msgSend_bounds(v317, v52, v53, v54, v55, v56);
        CGFloat v58 = v57;
        CGFloat v60 = v59;
        CGFloat v62 = v61;
        CGFloat v64 = v63;
        objc_msgSend_bounds(v34, v65, v66, v67, v68, v69);
        v346.origin.double x = v70;
        v346.origin.double y = v71;
        v346.size.double width = v72;
        v346.size.double height = v73;
        v344.origin.double x = v58;
        v344.origin.double y = v60;
        v344.size.double width = v62;
        v344.size.double height = v64;
        CGRect v345 = CGRectUnion(v344, v346);
        double x = v345.origin.x;
        double y = v345.origin.y;
        double width = v345.size.width;
        double height = v345.size.height;
        objc_msgSend_principalLines(v317, v78, v79, v80, v81, v82);
        objc_msgSend_bounds(v317, v83, v84, v85, v86, v87);
        double v96 = v95;
        double v98 = v97;
        double v311 = v330;
        double v312 = v329;
        double v99 = 1.0;
        if (v93 == 0.0) {
          double v100 = 1.0;
        }
        else {
          double v100 = v93;
        }
        if (v94 != 0.0) {
          double v99 = v94;
        }
        double v313 = v99;
        double v309 = v332;
        double v310 = v331;
        double v307 = v334;
        double v308 = v333;
        double v305 = v336;
        double v306 = v335;
        if (v34)
        {
          objc_msgSend_principalLines(v34, v88, v89, v90, v91, v92);
        }
        else
        {
          long long v327 = 0u;
          long long v328 = 0u;
          long long v325 = 0u;
          long long v326 = 0u;
          long long v323 = 0u;
          long long v324 = 0u;
          long long v321 = 0u;
          long long v322 = 0u;
        }
        objc_msgSend_bounds(v34, v88, v89, v90, v91, v92);
        double v110 = v109;
        double v301 = v111;
        double v302 = v100;
        double v303 = v98;
        double v304 = v96;
        double v299 = *((double *)&v322 + 1);
        double v300 = *(double *)&v322;
        if (v107 == 0.0) {
          double v112 = 1.0;
        }
        else {
          double v112 = v107;
        }
        if (v108 == 0.0) {
          double v113 = 1.0;
        }
        else {
          double v113 = v108;
        }
        double v297 = *((double *)&v324 + 1);
        double v298 = *(double *)&v324;
        double v295 = *((double *)&v326 + 1);
        double v296 = *(double *)&v326;
        double v293 = *((double *)&v328 + 1);
        double v294 = *(double *)&v328;
        if (width == 0.0) {
          double v114 = 1.0;
        }
        else {
          double v114 = width;
        }
        BOOL v115 = height == 0.0;
        double v116 = height;
        if (height == 0.0) {
          double height = 1.0;
        }
        double v291 = v116;
        double v292 = width;
        double v117 = 1.0 / v116;
        if (v115) {
          double v118 = 1.0;
        }
        else {
          double v118 = v117;
        }
        uint64_t v119 = objc_opt_class();
        uint64_t v120 = objc_opt_class();
        uint64_t v315 = objc_msgSend_textSize(v317, v121, v122, v123, v124, v125);
        objc_msgSend_bounds(v317, v126, v127, v128, v129, v130);
        uint64_t v136 = objc_msgSend_scaledSize_scale_(v120, v131, (uint64_t)v315, v132, v133, v134, v135);
        v341[0] = v136;
        uint64_t v137 = objc_opt_class();
        uint64_t v143 = objc_msgSend_textSize(v34, v138, v139, v140, v141, v142);
        objc_msgSend_bounds(v34, v144, v145, v146, v147, v148);
        uint64_t v154 = objc_msgSend_scaledSize_scale_(v137, v149, (uint64_t)v143, v150, v151, v152, v153);
        v341[1] = v154;
        uint64_t v158 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v155, (uint64_t)v341, 2, v156, v157);
        uint64_t v163 = objc_msgSend_averageTextSize_(v119, v159, (uint64_t)v158, v160, v161, v162);
        uint64_t v168 = objc_msgSend_scaledSize_scale_(CHTextSize, v164, (uint64_t)v163, v165, v166, v167, v118);

        uint64_t v174 = objc_msgSend_drawing(v317, v169, v170, v171, v172, v173);
        v180 = objc_msgSend_drawing(v34, v175, v176, v177, v178, v179);
        objc_msgSend_appendDrawing_(v174, v181, (uint64_t)v180, v182, v183, v184);

        uint64_t v185 = [CHReflowableSynthesisResultToken alloc];
        double v191 = objc_msgSend_drawing(v317, v186, v187, v188, v189, v190);
        v320[0] = (v304 + v312 * v302 - x) / v114;
        v320[1] = (v303 + v311 * v313 - y) / height;
        v320[2] = (v301 + v300 * v112 - x) / v114;
        v320[3] = (v110 + v299 * v113 - y) / height;
        v320[4] = (v304 + v310 * v302 - x) / v114;
        v320[5] = (v303 + v309 * v313 - y) / height;
        v320[6] = (v301 + v298 * v112 - x) / v114;
        v320[7] = (v110 + v297 * v113 - y) / height;
        v320[8] = (v304 + v308 * v302 - x) / v114;
        v320[9] = (v303 + v307 * v313 - y) / height;
        v320[10] = (v301 + v296 * v112 - x) / v114;
        v320[11] = (v110 + v295 * v113 - y) / height;
        v320[12] = (v304 + v306 * v302 - x) / v114;
        v320[13] = (v303 + v305 * v313 - y) / height;
        v320[14] = (v301 + v294 * v112 - x) / v114;
        v320[15] = (v110 + v293 * v113 - y) / height;
        uint64_t hasPrecedingSpace = objc_msgSend_hasPrecedingSpace(v317, v192, v193, v194, v195, v196);
        uint64_t v199 = objc_msgSend_initWithDrawing_string_principalLines_textSize_bounds_hasPrecedingSpace_(v185, v198, (uint64_t)v191, (uint64_t)v314, (uint64_t)v320, (uint64_t)v168, hasPrecedingSpace, x, y, v292, v291);

        id v101 = (id)v199;
      }
      else
      {
        id v101 = v34;
      }
      v317 = v101;
      if (objc_msgSend_hasPrecedingSpace(v101, v102, v103, v104, v105, v106, v284)) {
        uint64_t v205 = @" ";
      }
      else {
        uint64_t v205 = &stru_1F20141C8;
      }
      uint64_t v206 = objc_msgSend_string(v317, v200, v201, v202, v203, v204);
      uint64_t v211 = objc_msgSend_stringByAppendingString_(v205, v207, (uint64_t)v206, v208, v209, v210);
      while (1)
      {

        unint64_t v217 = objc_msgSend_length(v33, v212, v213, v214, v215, v216);
        if (v217 >= objc_msgSend_length(v211, v218, v219, v220, v221, v222)
          || v32 >= objc_msgSend_count(v8, v223, v224, v225, v226, v227))
        {
          break;
        }
        uint64_t v206 = objc_msgSend_objectAtIndexedSubscript_(v8, v223, v32, v225, v226, v227);
        if ((objc_msgSend_properties(v206, v228, v229, v230, v231, v232) & 0x20) != 0)
        {
          uint64_t v238 = objc_msgSend_stringByAppendingString_(v33, v233, @" ", v235, v236, v237);

          id v33 = (__CFString *)v238;
        }
        uint64_t v239 = objc_msgSend_string(v206, v233, v234, v235, v236, v237);
        uint64_t v244 = objc_msgSend_stringByAppendingString_(v33, v240, (uint64_t)v239, v241, v242, v243);

        v250 = objc_msgSend_strokeIndexes(v206, v245, v246, v247, v248, v249);
        v255 = objc_msgSend_objectsAtIndexes_(v318, v251, (uint64_t)v250, v252, v253, v254);

        objc_msgSend_addObjectsFromArray_(v319, v256, (uint64_t)v255, v257, v258, v259);
        ++v32;
        id v33 = (__CFString *)v244;
      }
      if (objc_msgSend_isEqualToString_(v33, v223, (uint64_t)v211, v225, v226, v227))
      {
        objc_msgSend_addObject_(v286, v260, (uint64_t)v317, v261, v262, v263);
        objc_msgSend_addObject_(v287, v264, (uint64_t)v319, v265, v266, v267);

        id v33 = &stru_1F20141C8;
        uint64_t v273 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v268, v269, v270, v271, v272);

        v317 = 0;
        uint64_t v319 = (void *)v273;
      }
    }
    uint64_t v290 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v337, (uint64_t)v342, 16, v31);
  }
  while (v290);

  if (v317)
  {
    objc_msgSend_addObject_(v286, v274, (uint64_t)v317, v275, v276, v277);
    objc_msgSend_addObject_(v287, v278, (uint64_t)v319, v279, v280, v281);
    if (!a6) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  v317 = 0;
  if (a6) {
LABEL_52:
  }
    *a6 = v287;
LABEL_53:
  id v282 = v286;

  return v282;
}

- (id)refinedTokensForSingleLineContextStrokes:(id)a3 styleControlParameter:(id)a4 transcription:(id)a5 completion:(id)a6 shouldCancel:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v55 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v17, 100, v18, v19, v20);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v21 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend_count(v12, v22, v23, v24, v25, v26);
    id v33 = objc_msgSend_latestStrokeProvider(self, v28, v29, v30, v31, v32);
    uint64_t v39 = objc_msgSend_orderedStrokes(v33, v34, v35, v36, v37, v38);
    *(_DWORD *)buf = 134218240;
    uint64_t v64 = v27;
    __int16 v65 = 2048;
    uint64_t v66 = objc_msgSend_count(v39, v40, v41, v42, v43, v44);
    _os_log_impl(&dword_1C492D000, v21, OS_LOG_TYPE_DEFAULT, "Session scheduling a synthesis for AutoRefine with strokes to replace = %ld, strokes in provider = %ld", buf, 0x16u);
  }
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1C4BB0D08;
  v56[3] = &unk_1E64E4CC8;
  id v46 = v16;
  id v61 = v46;
  id v47 = v15;
  id v62 = v47;
  v56[4] = self;
  id v48 = v12;
  id v57 = v48;
  id v49 = v14;
  id v58 = v49;
  id v50 = v13;
  id v59 = v50;
  id v51 = v55;
  id v60 = v51;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"RefinedTokensForSingleLineContextStroke", v56);
  uint64_t v52 = v60;
  id v53 = v51;

  return v53;
}

- (id)refinedTokensForContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v18 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v14, 100, v15, v16, v17);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4BB1758;
  v28[3] = &unk_1E64E4CF0;
  v28[4] = self;
  id v20 = v10;
  id v29 = v20;
  id v21 = v13;
  id v32 = v21;
  id v22 = v11;
  id v30 = v22;
  id v23 = v18;
  id v31 = v23;
  id v24 = v12;
  id v33 = v24;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"RefinedTokensForContextStroke", v28);
  uint64_t v25 = v33;
  id v26 = v23;

  return v26;
}

- (id)refinementOfContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v18 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v14, 100, v15, v16, v17);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4BB1EB4;
  v28[3] = &unk_1E64E4CF0;
  v28[4] = self;
  id v20 = v10;
  id v29 = v20;
  id v21 = v13;
  id v32 = v21;
  id v22 = v11;
  id v30 = v22;
  id v23 = v18;
  id v31 = v23;
  id v24 = v12;
  id v33 = v24;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"RefinementOfContextStrokes", v28);
  uint64_t v25 = v33;
  id v26 = v23;

  return v26;
}

- (id)styleSampleOptionsForPoint:(CGPoint)a3 shouldCancel:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v283 = *MEMORY[0x1E4F143B8];
  id v249 = a4;
  if (!self || !self->_lastRecognitionResult)
  {
    uint64_t v105 = 0;
    double v112 = 0;
    goto LABEL_45;
  }
  v256 = self;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v274 = x;
    __int16 v275 = 2048;
    double v276 = y;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEBUG, "Style Sampling: evaluate if stroke group near the point: x: @%f y: @%f is acceptable", buf, 0x16u);
  }

  uint64_t v251 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_strokeGroupingResult(v256->_lastRecognitionResult, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_strokeGroupOrdering(v256, v19, v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v18, v25, v24, 1, v26, v27);
  uint64_t v254 = objc_msgSend_strokeGroupClosestToPoint_strokeGroups_(CHStrokeGroup, v29, (uint64_t)v28, v30, v31, v32, x, y);

  lastRecognitionResult = v256->_lastRecognitionResult;
  uint64_t v39 = objc_msgSend_uniqueIdentifier(v254, v34, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_recognitionResultForStrokeGroupIdentifier_(lastRecognitionResult, v40, v39, v41, v42, v43);
  id v50 = objc_msgSend_strokeClassificationResult(v256->_lastRecognitionResult, v45, v46, v47, v48, v49);
  long long v269 = 0u;
  long long v270 = 0u;
  long long v267 = 0u;
  long long v268 = 0u;
  objc_msgSend_inputStrokeIdentifiers(v44, v51, v52, v53, v54, v55);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v267, (uint64_t)v279, 16, v57);
  if (v63)
  {
    uint64_t v64 = *(void *)v268;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v268 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = *(void *)(*((void *)&v267 + 1) + 8 * i);
        uint64_t v67 = objc_msgSend_textSynthesizer(v256, v58, v59, v60, v61, v62);
        char isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v68, (uint64_t)v254, (uint64_t)v67, (uint64_t)v256->_latestStrokeProvider, (uint64_t)v44, v50, 1);

        if (isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes)
        {
          objc_msgSend_addObject_(v251, v70, v66, v72, v73, v74);
        }
        else
        {
          uint64_t v80 = objc_msgSend_mathResult(v44, v70, v71, v72, v73, v74);
          if (v80)
          {
            uint64_t v81 = objc_msgSend_mathResult(v44, v75, v76, v77, v78, v79);
            uint64_t v87 = objc_msgSend_topTranscription(v81, v82, v83, v84, v85, v86);
          }
          else
          {
            uint64_t v81 = objc_msgSend_recognitionResultsByLocale(v44, v75, v76, v77, v78, v79);
            double v93 = objc_msgSend_preferredLocale(v44, v88, v89, v90, v91, v92);
            double v98 = objc_msgSend_objectForKeyedSubscript_(v81, v94, (uint64_t)v93, v95, v96, v97);
            uint64_t v87 = objc_msgSend_topTranscription(v98, v99, v100, v101, v102, v103);
          }
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v104 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138740483;
            double v274 = *(double *)&v87;
            __int16 v275 = 2048;
            double v276 = x;
            __int16 v277 = 2048;
            double v278 = y;
            _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_DEFAULT, "Style Sampling: stroke group with recognition result: %{sensitive}@ near the point: x: @%f y: @%f rejected since it does not pass the style inventory gating criteria", buf, 0x20u);
          }
        }
      }
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v267, (uint64_t)v279, 16, v62);
    }
    while (v63);
  }

  uint64_t v105 = v251;
  if (!v251)
  {
    double v112 = 0;
    if (qword_1EA3CA000 == -1) {
      goto LABEL_46;
    }
    goto LABEL_53;
  }
  uint64_t v106 = sub_1C4BA446C((uint64_t)v256, v251, 0, 0, 0, 0, 0, v249);
  double v112 = v106;
  if (!v106 || !objc_msgSend_count(v106, v107, v108, v109, v110, v111))
  {
LABEL_45:
    if (qword_1EA3CA000 == -1)
    {
LABEL_46:
      id obja = v112;
      uint64_t v243 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v279 = 134218240;
        double v280 = x;
        __int16 v281 = 2048;
        double v282 = y;
        _os_log_impl(&dword_1C492D000, v243, OS_LOG_TYPE_DEFAULT, "Style Sampling: No style sample in surrounding context of point: x: @%f y: @%f, fallback to default style", v279, 0x16u);
      }
      uint64_t v223 = 0;
      goto LABEL_49;
    }
LABEL_53:
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    goto LABEL_46;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id obja = v112;
  double v113 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v279 = 134218240;
    double v280 = x;
    __int16 v281 = 2048;
    double v282 = y;
    _os_log_impl(&dword_1C492D000, v113, OS_LOG_TYPE_DEFAULT, "Style Sampling: Finding an input style sample from the text group in surrounding context of point: x: @%f y: @%f", v279, 0x16u);
  }

  uint64_t v246 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v114, v115, v116, v117, v118);
  uint64_t v123 = objc_msgSend_objectAtIndexedSubscript_(v112, v119, 0, v120, v121, v122);
  uint64_t v129 = objc_msgSend_textResult(v123, v124, v125, v126, v127, v128);
  v261[0] = MEMORY[0x1E4F143A8];
  v261[1] = 3221225472;
  v261[2] = sub_1C4BB3314;
  v261[3] = &unk_1E64E4D18;
  double v265 = x;
  double v266 = y;
  id v245 = v251;
  id v262 = v245;
  uint64_t v263 = v256;
  uint64_t v248 = v246;
  v264 = v248;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v129, v130, (uint64_t)v261, v131, v132, v133);

  uint64_t v137 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v134, @"distance", 1, v135, v136);
  uint64_t v272 = v137;
  uint64_t v141 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v138, (uint64_t)&v272, 1, v139, v140);
  uint64_t v247 = objc_msgSend_sortedArrayUsingDescriptors_(v248, v142, (uint64_t)v141, v143, v144, v145);

  v255 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v146, v147, v148, v149, v150);
  long long v259 = 0u;
  long long v260 = 0u;
  long long v257 = 0u;
  long long v258 = 0u;
  id v250 = v247;
  uint64_t v153 = objc_msgSend_countByEnumeratingWithState_objects_count_(v250, v151, (uint64_t)&v257, (uint64_t)v271, 16, v152);
  if (v153)
  {
    uint64_t v154 = 0;
    uint64_t v155 = *(void *)v258;
LABEL_33:
    uint64_t v156 = 0;
    while (1)
    {
      if (*(void *)v258 != v155) {
        objc_enumerationMutation(v250);
      }
      uint64_t v157 = *(void **)(*((void *)&v257 + 1) + 8 * v156);
      uint64_t v158 = objc_opt_class();
      uint64_t v163 = objc_msgSend_objectForKeyedSubscript_(v157, v159, @"strokeIdentifiers", v160, v161, v162);
      uint64_t v169 = objc_msgSend_latestStrokeProvider(v256, v164, v165, v166, v167, v168);
      uint64_t v171 = objc_msgSend_createDrawingForStrokeIdentifiers_strokeProvider_interpolationType_resolution_cancellationBlock_(v158, v170, (uint64_t)v163, (uint64_t)v169, 1, 2, v249);

      uint64_t v176 = objc_msgSend_objectForKeyedSubscript_(v157, v172, @"transcription", v173, v174, v175);
      uint64_t v182 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v177, v178, v179, v180, v181);
      uint64_t v185 = objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v183, (uint64_t)v176, (uint64_t)v171, (uint64_t)v182, v184);

      uint64_t v190 = objc_msgSend_objectForKeyedSubscript_(v157, v186, @"transcription", v187, v188, v189);
      uint64_t v196 = objc_msgSend_countCharacters(v190, v191, v192, v193, v194, v195);

      objc_msgSend_addObject_(v255, v197, (uint64_t)v185, v198, v199, v200);
      v154 += v196;

      if (v154 >= 15) {
        break;
      }
      if (v153 == ++v156)
      {
        uint64_t v153 = objc_msgSend_countByEnumeratingWithState_objects_count_(v250, v201, (uint64_t)&v257, (uint64_t)v271, 16, v202);
        if (v153) {
          goto LABEL_33;
        }
        break;
      }
    }
  }

  uint64_t v207 = objc_msgSend_stitchStyleSamples_(CHSynthesisStyleInventory, v203, (uint64_t)v255, v204, v205, v206);
  uint64_t v213 = objc_msgSend_drawing(v207, v208, v209, v210, v211, v212);
  uint64_t v219 = objc_msgSend_transcription(v207, v214, v215, v216, v217, v218);
  uint64_t v223 = objc_msgSend_synthesisOptionsWithDrawing_content_(CHSynthesisRequestOptions, v220, (uint64_t)v213, (uint64_t)v219, v221, v222);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v224 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v230 = objc_msgSend_transcription(v207, v225, v226, v227, v228, v229);
    uint64_t v236 = objc_msgSend_transcription(v207, v231, v232, v233, v234, v235);
    uint64_t v242 = objc_msgSend_length(v236, v237, v238, v239, v240, v241);
    *(_DWORD *)uint64_t v279 = 138740227;
    double v280 = *(double *)&v230;
    __int16 v281 = 2048;
    double v282 = *(double *)&v242;
    _os_log_impl(&dword_1C492D000, v224, OS_LOG_TYPE_DEFAULT, "Style Sampling: Found input style sample: %{sensitive}@ from surrounding text with length: %lu", v279, 0x16u);
  }
  uint64_t v105 = v245;
  uint64_t v243 = v248;
LABEL_49:

  return v223;
}

- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v20 = objc_msgSend_length(v11, v15, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_progressWithTotalUnitCount_(v14, v21, v20, v22, v23, v24);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C4BB36B0;
  v34[3] = &unk_1E64E4AC8;
  id v27 = v11;
  id v35 = v27;
  uint64_t v36 = self;
  CGFloat v40 = x;
  CGFloat v41 = y;
  id v28 = v13;
  id v38 = v28;
  id v29 = v25;
  id v37 = v29;
  id v30 = v12;
  id v39 = v30;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"SynthesizeTokensForString", v34);
  uint64_t v31 = v39;
  id v32 = v29;

  return v32;
}

- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v18 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E4F28F90], v14, 100, v15, v16, v17);
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1C4BB44D8;
  v28[3] = &unk_1E64E4CF0;
  v28[4] = self;
  id v20 = v11;
  id v29 = v20;
  id v21 = v13;
  id v32 = v21;
  id v22 = v10;
  id v30 = v22;
  id v23 = v18;
  id v31 = v23;
  id v24 = v12;
  id v33 = v24;
  sub_1C4B96814((uint64_t)self, highResponsivenessQueue, @"HighResponsiveness", @"SynthesizeTokensReplacingStrokesForString", v28);
  uint64_t v25 = v33;
  id v26 = v23;

  return v26;
}

- (BOOL)q_wantsAutoRefine
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  label = dispatch_queue_get_label(0);
  if (strcmp(label, "com.apple.CoreHandwriting.RecognitionSession"))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v4 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "-[CHRecognitionSession(Impl) q_wantsAutoRefine]";
      __int16 v26 = 2080;
      id v27 = "com.apple.CoreHandwriting.RecognitionSession";
      __int16 v28 = 2080;
      id v29 = dispatch_queue_get_label(0);
      _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_FAULT, "Method %s should be running on queue %s, found %s.", buf, 0x20u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (self) {
    changeObserversTable = self->__changeObserversTable;
  }
  else {
    changeObserversTable = 0;
  }
  uint64_t v6 = changeObserversTable;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16, v8);
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend_wantsAutoRefineUpdates(v12, v13, v14, v15, v16, v17, (void)v19) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v19, (uint64_t)v23, 16, v17);
    }
    while (v9);
  }
LABEL_19:

  return v9;
}

- (BOOL)q_needsForegroundRecognition
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  label = dispatch_queue_get_label(0);
  if (strcmp(label, "com.apple.CoreHandwriting.RecognitionSession"))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v4 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "-[CHRecognitionSession(Impl) q_needsForegroundRecognition]";
      __int16 v26 = 2080;
      id v27 = "com.apple.CoreHandwriting.RecognitionSession";
      __int16 v28 = 2080;
      id v29 = dispatch_queue_get_label(0);
      _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_FAULT, "Method %s should be running on queue %s, found %s.", buf, 0x20u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (self) {
    changeObserversTable = self->__changeObserversTable;
  }
  else {
    changeObserversTable = 0;
  }
  uint64_t v6 = changeObserversTable;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16, v8);
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend_needsForegroundRecognition(v12, v13, v14, v15, v16, v17, (void)v19) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v19, (uint64_t)v23, 16, v17);
    }
    while (v9);
  }
LABEL_19:

  return v9;
}

@end