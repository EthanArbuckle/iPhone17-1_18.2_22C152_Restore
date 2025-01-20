@interface IATextInputActionsAnalytics
- (IATextInputActionsAnalytics)initWithAnalyticsDelegate:(id)a3;
- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3;
- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withEventHandler:(id)a4;
- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withServiceName:(id)a4;
- (IATextInputActionsMetadataObserving)analyticsDelegate;
- (NSUUID)sessionIdentifier;
- (OS_dispatch_queue)queue;
- (id)_instanceOfActionClass:(Class)a3;
- (id)lastAction;
- (id)server;
- (void)_didDeleteBackwardAction:(id)a3;
- (void)_didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7;
- (void)_didDeleteBackwardText:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7;
- (void)_didDeleteBackwardTextDetails:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7;
- (void)_didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4;
- (void)_didInsertTextAction:(id)a3;
- (void)_didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4;
- (void)_didReplacementForText:(id)a3 withText:(id)a4 allowNilText:(BOOL)a5 allowEmptyText:(BOOL)a6 allowNilReplacement:(BOOL)a7 withSource:(int64_t)a8 withType:(int64_t)a9 withInputActionCount:(int64_t)a10;
- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4;
- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4;
- (void)didCandidateBarAction;
- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4;
- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4;
- (void)didConversionForMarkedText:(id)a3 withText:(id)a4;
- (void)didCopy:(id)a3;
- (void)didCut:(id)a3;
- (void)didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4;
- (void)didDeleteBackwardText:(id)a3;
- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4;
- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5;
- (void)didDeletionKeyPress;
- (void)didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4;
- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4;
- (void)didDictationEnd;
- (void)didGlomojiTap:(id)a3 newInputMode:(id)a4;
- (void)didGlomojiTap:(unint64_t)a3 originalInputMode:(id)a4 newInputMode:(id)a5;
- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4;
- (void)didInsertText:(id)a3 withType:(int64_t)a4;
- (void)didInsertText:(id)a3 withType:(int64_t)a4 relativeRangeBefore:(_NSRange)a5 withNumAlternatives:(int64_t)a6 selectedTextBefore:(id)a7 withInputMode:(id)a8;
- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5;
- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5 withInputMode:(id)a6;
- (void)didInsertText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5;
- (void)didInsertionKeyPress;
- (void)didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4;
- (void)didKBMenuAppear:(id)a3;
- (void)didKBMenuAppear:(unint64_t)a3 originalInputMode:(id)a4;
- (void)didKBMenuDismiss:(unint64_t)a3;
- (void)didKBMenuInteraction:(unint64_t)a3 selectedAction:(unint64_t)a4 newInputMode:(id)a5;
- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9 inputType:(int64_t)a10 uiInterfaceOrientation:(int64_t)a11;
- (void)didOther;
- (void)didPaste:(id)a3;
- (void)didRedo;
- (void)didReplaceWithCandidate:(int64_t)a3;
- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4;
- (void)didRevisionBubbleTap;
- (void)didSessionBegin;
- (void)didSessionEnd;
- (void)didUndo;
- (void)dispatchToAnalyticsQueue:(id)a3;
- (void)flushAndSetLastAction:(id)a3;
- (void)invalidateConnection;
- (void)mergeOrConsumeAction:(id)a3;
- (void)populateActionInputMode:(id)a3 withInputMode:(id)a4;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation IATextInputActionsAnalytics

- (IATextInputActionsAnalytics)initWithAnalyticsDelegate:(id)a3
{
  return 0;
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3
{
  id v4 = a3;
  v5 = sub_252A05924();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2529F1000, v5, OS_LOG_TYPE_INFO, "initWithAnalyticsMetadataObserver service", v9, 2u);
  }

  v7 = (IATextInputActionsAnalytics *)objc_msgSend_initWithAnalyticsMetadataObserver_withServiceName_(self, v6, (uint64_t)v4, @"com.apple.inputanalyticsd");
  return v7;
}

- (void)invalidateConnection
{
  v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2529F1000, v3, OS_LOG_TYPE_INFO, "invalidateConnection called", buf, 2u);
  }

  objc_msgSend_invalidateConnection(self->_xpcClient, v4, v5, v6);
  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2529F1000, v8, OS_LOG_TYPE_INFO, "invalidateConnection completed", v9, 2u);
  }
}

- (id)_instanceOfActionClass:(Class)a3
{
  uint64_t v6 = objc_msgSend_analyticsDelegate(self, a2, (uint64_t)a3, v3);

  if (!v6)
  {
    v7 = sub_252A05924();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_252A0FE64();
    }
  }
  uint64_t v8 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(a3, v9, v8, v10))
  {
    id v11 = objc_alloc_init(a3);
    v15 = objc_msgSend_analyticsDelegate(self, v12, v13, v14);
    v19 = objc_msgSend_sessionIdentifier(v15, v16, v17, v18);
    objc_msgSend_setSessionIdentifier_(self, v20, (uint64_t)v19, v21);

    v25 = objc_msgSend_sessionIdentifier(self, v22, v23, v24);
    objc_msgSend_setTextInputSessionId_(v11, v26, (uint64_t)v25, v27);

    v31 = objc_msgSend_analyticsDelegate(self, v28, v29, v30);
    uint64_t v35 = objc_msgSend_source(v31, v32, v33, v34);
    objc_msgSend_setSource_(v11, v36, v35, v37);

    v41 = objc_msgSend_analyticsDelegate(self, v38, v39, v40);
    uint64_t v45 = objc_msgSend_flagOptions(v41, v42, v43, v44);
    objc_msgSend_setFlagOptions_(v11, v46, v45, v47);

    v51 = objc_msgSend_analyticsDelegate(self, v48, v49, v50);
    v55 = objc_msgSend_appBundleId(v51, v52, v53, v54);
    objc_msgSend_setAppBundleId_(v11, v56, (uint64_t)v55, v57);

    v61 = objc_msgSend_analyticsDelegate(self, v58, v59, v60);
    v65 = objc_msgSend_processBundleId(v61, v62, v63, v64);
    objc_msgSend_setProcessBundleId_(v11, v66, (uint64_t)v65, v67);

    v71 = objc_msgSend_analyticsDelegate(self, v68, v69, v70);
    v75 = objc_msgSend_inputMode(v71, v72, v73, v74);
    objc_msgSend_populateActionInputMode_withInputMode_(self, v76, (uint64_t)v11, (uint64_t)v75);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (void)flushAndSetLastAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v6 = (IATextInputActionsSessionAction *)a3;
  if (self->_lastAction)
  {
    if (self->_useAnalyticsDaemon)
    {
      v7 = sub_252A05924();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        xpcClient = self->_xpcClient;
        v12 = objc_msgSend_server(xpcClient, v8, v9, v10);
        int v22 = 134218240;
        uint64_t v23 = xpcClient;
        __int16 v24 = 2048;
        v25 = v12;
        _os_log_impl(&dword_2529F1000, v7, OS_LOG_TYPE_INFO, "flushAndSetLastAction calling didAction on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v22, 0x16u);
      }
      v16 = objc_msgSend_server(self->_xpcClient, v13, v14, v15);
      objc_msgSend_didAction_(v16, v17, (uint64_t)self->_lastAction, v18);

      objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v19, 1, v20);
    }
    if (self->_useLocalAnalytics) {
      objc_msgSend_consumeAction_(self->_localServer, v4, (uint64_t)self->_lastAction, v5);
    }
  }
  lastAction = self->_lastAction;
  self->_lastAction = v6;
}

- (void)mergeOrConsumeAction:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = v5;
  if (v5)
  {
    if (objc_msgSend_flagOptions(v5, v6, v7, v8) >= 9)
    {
      sub_252A05924();
      uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        sub_252A0FE98(v9, v13, v14, v15);
      }
    }
    if (self->_useAnalyticsDaemon)
    {
      v16 = objc_msgSend_asBegan(v9, v10, v11, v12);

      if (v16)
      {
        uint64_t v17 = sub_252A05924();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          xpcClient = self->_xpcClient;
          objc_msgSend_server(xpcClient, v18, v19, v20);
          int v22 = (IATextInputActionsSessionAction *)objc_claimAutoreleasedReturnValue();
          int v61 = 134218240;
          uint64_t v62 = (uint64_t)xpcClient;
          __int16 v63 = 2048;
          uint64_t v64 = v22;
          _os_log_impl(&dword_2529F1000, v17, OS_LOG_TYPE_INFO, "mergeOrConsumeAction calling didSessionBeginWithSessionMetadata on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v61, 0x16u);
        }
        uint64_t v26 = objc_msgSend_server(self->_xpcClient, v23, v24, v25);
        objc_msgSend_didSessionBeginWithSessionMetadata_(v26, v27, (uint64_t)v9, v28);

        objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v29, 1, v30);
      }
    }
    v31 = objc_msgSend_asEnd(v9, v10, v11, v12);
    uint64_t v35 = v31;
    if (v31)
    {
      if (self->_useLocalAnalytics)
      {
        v36 = objc_msgSend_keyboardTrialParameters(v31, v32, v33, v34);
        objc_msgSend_setKeyboardTrialParameters_(self->_localServer, v37, (uint64_t)v36, v38);
      }
      objc_msgSend_flushAndSetLastAction_(self, v32, (uint64_t)v35, v34);
      objc_msgSend_flushAndSetLastAction_(self, v39, 0, v40);
      if (self->_useAnalyticsDaemon)
      {
        v41 = sub_252A05924();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = self->_xpcClient;
          objc_msgSend_server(v45, v42, v43, v44);
          v46 = (IATextInputActionsSessionAction *)objc_claimAutoreleasedReturnValue();
          int v61 = 134218240;
          uint64_t v62 = (uint64_t)v45;
          __int16 v63 = 2048;
          uint64_t v64 = v46;
          _os_log_impl(&dword_2529F1000, v41, OS_LOG_TYPE_INFO, "mergeOrConsumeAction calling didSessionEndWithSessionMetadata on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v61, 0x16u);
        }
        uint64_t v50 = objc_msgSend_server(self->_xpcClient, v47, v48, v49);
        objc_msgSend_didSessionEndWithSessionMetadata_(v50, v51, (uint64_t)v35, v52);

        objc_msgSend_reportConnectionStatusSuccessful_(IAServerStats, v53, 1, v54);
      }
    }
    else
    {
      lastAction = self->_lastAction;
      if (lastAction)
      {
        uint64_t v56 = objc_msgSend_mergeActionIfPossible_(lastAction, v32, (uint64_t)v9, v34);
        uint64_t v57 = sub_252A05924();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v60 = self->_lastAction;
          int v61 = 134218499;
          uint64_t v62 = v56;
          __int16 v63 = 2113;
          uint64_t v64 = v60;
          __int16 v65 = 2113;
          v66 = v9;
          _os_log_debug_impl(&dword_2529F1000, v57, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] mergeOrConsumeAction: Merge result %lu lastAction:%{private}@ newAction:%{private}@", (uint8_t *)&v61, 0x20u);
        }

        if (!v56) {
          objc_msgSend_flushAndSetLastAction_(self, v58, (uint64_t)v9, v59);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_lastAction, a3);
      }
    }
  }
}

- (void)populateActionInputMode:(id)a3 withInputMode:(id)a4
{
  id v54 = a3;
  id v6 = a4;
  uint64_t v10 = v6;
  if (v6)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    objc_msgSend_setInputMode_(v54, v12, (uint64_t)v11, v13);

    uint64_t v17 = objc_msgSend_analyticsDelegate(self, v14, v15, v16);
    uint64_t v21 = objc_msgSend_flagOptions(v17, v18, v19, v20);
    LODWORD(v11) = objc_msgSend_isWebSetInFlagOptions_(IATextInputActionsUtils, v22, v21, v23);

    if (v11)
    {
      uint64_t v27 = objc_msgSend_inputMode(v54, v24, v25, v26);
      v31 = objc_msgSend_keyboardType(v27, v28, v29, v30);
      uint64_t v35 = objc_msgSend_length(v31, v32, v33, v34);

      uint64_t v39 = objc_msgSend_inputMode(v54, v36, v37, v38);
      uint64_t v43 = v39;
      if (v35)
      {
        uint64_t v44 = objc_msgSend_keyboardType(v39, v40, v41, v42);
        uint64_t v47 = objc_msgSend_stringByAppendingString_(v44, v45, @"Web", v46);
        v51 = objc_msgSend_inputMode(v54, v48, v49, v50);
        objc_msgSend_setKeyboardType_(v51, v52, (uint64_t)v47, v53);
      }
      else
      {
        objc_msgSend_setKeyboardType_(v39, v40, @"Web", v42);
      }
    }
  }
}

- (void)didSessionBegin
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A0FF2C();
  }

  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__instanceOfActionClass_(self, v5, v4, v6);
  uint64_t v11 = objc_msgSend_asBegan(v7, v8, v9, v10);

  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2529F69CC;
  v14[3] = &unk_265387430;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(queue, v14);
}

- (void)didSessionEnd
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A0FF60();
  }

  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__instanceOfActionClass_(self, v5, v4, v6);
  uint64_t v11 = objc_msgSend_asEnd(v7, v8, v9, v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  uint64_t v16 = objc_msgSend_keyboardTrialParameters(WeakRetained, v13, v14, v15);
  objc_msgSend_setKeyboardTrialParameters_(v11, v17, (uint64_t)v16, v18);

  queue = self->_queue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2529F6AF8;
  v21[3] = &unk_265387430;
  v21[4] = self;
  id v22 = v11;
  id v20 = v11;
  dispatch_async(queue, v21);
}

- (void)didOther
{
  v2 = sub_252A05924();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_252A0FF94();
  }
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4
{
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5
{
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5
{
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5 withInputMode:(id)a6
{
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 relativeRangeBefore:(_NSRange)a5 withNumAlternatives:(int64_t)a6 selectedTextBefore:(id)a7 withInputMode:(id)a8
{
  NSUInteger length = a5.length;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = sub_252A05924();
  uint64_t v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v54 = objc_msgSend_description(v15, v18, v19, v20);
      int v55 = 138478339;
      id v56 = v13;
      __int16 v57 = 2113;
      id v58 = v14;
      __int16 v59 = 2113;
      uint64_t v60 = v54;
      _os_log_debug_impl(&dword_2529F1000, v17, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didInsertText:\"%{private}@\" selectedTextBefore:%{private}@ withInputMode:%{private}@", (uint8_t *)&v55, 0x20u);
    }
    if (objc_msgSend_length(v14, v21, v22, v23))
    {
      objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v24, (uint64_t)v14, a4, 1, v15, 1);
    }
    else if (!v14 && length)
    {
      objc_msgSend__didDeleteBackwardCount_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v24, length, a4, 1, v15, 1);
    }
    uint64_t v25 = objc_opt_class();
    uint64_t v28 = objc_msgSend__instanceOfActionClass_(self, v26, v25, v27);
    uint64_t v17 = objc_msgSend_asInsertion(v28, v29, v30, v31);

    objc_msgSend_setTextInputActionsType_(v17, v32, a4, v33);
    objc_msgSend_setWithAlternativesCount_(v17, v34, a6 > 0, v35);
    objc_msgSend_populateActionInputMode_withInputMode_(self, v36, (uint64_t)v17, (uint64_t)v15);
    uint64_t v39 = objc_msgSend_getDetailsForString_(IAStringDetails, v37, (uint64_t)v13, v38);
    uint64_t v43 = objc_msgSend_characters(v39, v40, v41, v42);
    objc_msgSend_setInsertedTextLength_(v17, v44, v43, v45);
    uint64_t v49 = objc_msgSend_emojiCharacters(v39, v46, v47, v48);
    objc_msgSend_setInsertedEmojiCount_(v17, v50, v49, v51);

    objc_msgSend__didInsertTextAction_(self, v52, (uint64_t)v17, v53);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_252A0FFC8();
  }
}

- (void)_didInsertTextAction:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_flagOptions(v4, v5, v6, v7);
  if (objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v9, v8, v10))
  {
    if (objc_msgSend_source(v4, v11, v12, v13) == 5)
    {
      objc_msgSend_setSource_(v4, v14, 4, v15);
      if (objc_msgSend_insertedEmojiCount(v4, v16, v17, v18) == 1
        && objc_msgSend_insertedTextLength(v4, v19, v20, v21) == 1)
      {
        objc_msgSend_setInputActionCountFromMergedActions_(v4, v22, 1, v23);
      }
    }
  }
  queue = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2529F6EEC;
  v26[3] = &unk_265387430;
  v26[4] = self;
  id v27 = v4;
  id v25 = v4;
  dispatch_async(queue, v26);
}

- (void)_didDeleteBackwardTextDetails:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  if (v12)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v17 = objc_msgSend__instanceOfActionClass_(self, v15, v14, v16);
    uint64_t v21 = objc_msgSend_asDeletion(v17, v18, v19, v20);

    objc_msgSend_setTextInputActionsType_(v21, v22, a4, v23);
    uint64_t v27 = objc_msgSend_characters(v12, v24, v25, v26);
    objc_msgSend_setRemovedTextLength_(v21, v28, v27, v29);
    uint64_t v33 = objc_msgSend_emojiCharacters(v12, v30, v31, v32);
    objc_msgSend_setRemovedEmojiCount_(v21, v34, v33, v35);
    objc_msgSend_populateActionInputMode_withInputMode_(self, v36, (uint64_t)v21, (uint64_t)v13);
    if (v9)
    {
      uint64_t v40 = objc_msgSend_inputActionCount(v21, v37, v38, v39);
      objc_msgSend_setInputActionCountFromMergedActions_(v21, v41, -v40, v42);
    }
    if (v7)
    {
      uint64_t v43 = objc_msgSend_flagOptions(v21, v37, v38, v39);
      objc_msgSend_setFlagOptions_(v21, v44, v43 & 0xFFFFFFFFFFFFFFFDLL, v45);
    }
    objc_msgSend__didDeleteBackwardAction_(self, v37, (uint64_t)v21, v39);
  }
  else
  {
    uint64_t v46 = sub_252A05924();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_252A10060();
    }
  }
}

- (void)_didDeleteBackwardText:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  id v14 = a6;
  if (a3)
  {
    uint64_t v15 = objc_msgSend_getDetailsForString_(IAStringDetails, v12, (uint64_t)a3, v13);
    objc_msgSend__didDeleteBackwardTextDetails_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v16, (uint64_t)v15, a4, v8, v14, v7);
  }
  else
  {
    uint64_t v17 = sub_252A05924();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_252A10060();
    }
  }
}

- (void)didDeleteBackwardText:(id)a3
{
  id v4 = a3;
  id v5 = sub_252A05924();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_252A10094((uint64_t)v4, v5);
  }

  objc_msgSend_didDeleteBackwardText_withType_(self, v6, (uint64_t)v4, 1);
}

- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = sub_252A05924();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_252A1010C();
  }

  objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v8, (uint64_t)v6, a4, 0, 0, 0);
}

- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_252A05924();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v14 = objc_msgSend_stringForType_(IATextInputActionsUtils, v11, a4, v12);
    uint64_t v18 = objc_msgSend_description(v9, v15, v16, v17);
    int v19 = 138740483;
    id v20 = v8;
    __int16 v21 = 2113;
    uint64_t v22 = v14;
    __int16 v23 = 2113;
    uint64_t v24 = v18;
    _os_log_debug_impl(&dword_2529F1000, v10, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@ withType:%{private}@ withInputMode:'%{private}@'", (uint8_t *)&v19, 0x20u);
  }
  objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v13, (uint64_t)v8, a4, 0, v9, 0);
}

- (void)didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4
{
}

- (void)_didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  BOOL v7 = a5;
  id v11 = a6;
  uint64_t v12 = sub_252A05924();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_252A101AC(a4, (const char *)a3, v12, v13);
  }

  id v14 = objc_alloc_init(IAStringDetails);
  objc_msgSend_setCharacters_(v14, v15, a3, v16);
  objc_msgSend__didDeleteBackwardTextDetails_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v17, (uint64_t)v14, a4, v7, v11, 0);
}

- (void)_didDeleteBackwardAction:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2529F747C;
  v7[3] = &unk_265387430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3.length != a4.length || a3.location != a4.location)
  {
    id v9 = sub_252A05924();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218752;
      NSUInteger v25 = v7;
      __int16 v26 = 2048;
      NSUInteger v27 = v6;
      __int16 v28 = 2048;
      NSUInteger v29 = location;
      __int16 v30 = 2048;
      NSUInteger v31 = length;
      _os_log_debug_impl(&dword_2529F1000, v9, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
    }

    uint64_t v10 = objc_opt_class();
    uint64_t v13 = objc_msgSend__instanceOfActionClass_(self, v11, v10, v12);
    uint64_t v17 = objc_msgSend_asSelection(v13, v14, v15, v16);

    objc_msgSend_setRelativeRangeBefore_(v17, v18, location, length);
    objc_msgSend_setRangeAfter_(v17, v19, v7, v6);
    queue = self->_queue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2529F7640;
    v22[3] = &unk_265387430;
    v22[4] = self;
    id v23 = v17;
    id v21 = v17;
    dispatch_async(queue, v22);
  }
}

- (void)didCopy:(id)a3
{
  id v4 = sub_252A05924();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_252A10250();
  }

  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend__instanceOfActionClass_(self, v6, v5, v7);
  uint64_t v12 = objc_msgSend_asCopy(v8, v9, v10, v11);

  objc_msgSend_setTextInputActionsType_(v12, v13, 11, v14);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2529F774C;
  v17[3] = &unk_265387430;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  dispatch_async(queue, v17);
}

- (void)didCut:(id)a3
{
  id v4 = sub_252A05924();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_252A10284();
  }

  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend__instanceOfActionClass_(self, v6, v5, v7);
  uint64_t v12 = objc_msgSend_asCut(v8, v9, v10, v11);

  objc_msgSend_setTextInputActionsType_(v12, v13, 10, v14);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2529F7858;
  v17[3] = &unk_265387430;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  dispatch_async(queue, v17);
}

- (void)didPaste:(id)a3
{
  id v4 = sub_252A05924();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_252A102B8();
  }

  uint64_t v5 = objc_opt_class();
  id v8 = objc_msgSend__instanceOfActionClass_(self, v6, v5, v7);
  uint64_t v12 = objc_msgSend_asPaste(v8, v9, v10, v11);

  objc_msgSend_setTextInputActionsType_(v12, v13, 12, v14);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2529F7964;
  v17[3] = &unk_265387430;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  dispatch_async(queue, v17);
}

- (void)didUndo
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A102EC();
  }

  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__instanceOfActionClass_(self, v5, v4, v6);
  uint64_t v11 = objc_msgSend_asUndo(v7, v8, v9, v10);

  objc_msgSend_setTextInputActionsType_(v11, v12, 13, v13);
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2529F7A70;
  v16[3] = &unk_265387430;
  v16[4] = self;
  id v17 = v11;
  id v15 = v11;
  dispatch_async(queue, v16);
}

- (void)didRedo
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A10320();
  }

  uint64_t v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend__instanceOfActionClass_(self, v5, v4, v6);
  uint64_t v11 = objc_msgSend_asRedo(v7, v8, v9, v10);

  objc_msgSend_setTextInputActionsType_(v11, v12, 14, v13);
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2529F7B7C;
  v16[3] = &unk_265387430;
  v16[4] = self;
  id v17 = v11;
  id v15 = v11;
  dispatch_async(queue, v16);
}

- (void)_didReplacementForText:(id)a3 withText:(id)a4 allowNilText:(BOOL)a5 allowEmptyText:(BOOL)a6 allowNilReplacement:(BOOL)a7 withSource:(int64_t)a8 withType:(int64_t)a9 withInputActionCount:(int64_t)a10
{
  id v16 = (__CFString *)a3;
  id v20 = a4;
  if (v16) {
    id v21 = v16;
  }
  else {
    id v21 = &stru_2702E3F20;
  }
  if (v16 || a5)
  {
    if (objc_msgSend_length(v21, v17, v18, v19) || a6)
    {
      if (v20 || a7)
      {
        if (v20) {
          uint64_t v22 = v20;
        }
        else {
          uint64_t v22 = &stru_2702E3F20;
        }
        uint64_t v26 = objc_opt_class();
        NSUInteger v29 = objc_msgSend__instanceOfActionClass_(self, v27, v26, v28);
        uint64_t v33 = objc_msgSend_asReplaceText(v29, v30, v31, v32);

        objc_msgSend_setSource_(v33, v34, a8, v35);
        objc_msgSend_setTextInputActionsType_(v33, v36, a9, v37);
        uint64_t v40 = objc_msgSend_getDetailsForString_(IAStringDetails, v38, (uint64_t)v21, v39);
        uint64_t v44 = objc_msgSend_characters(v40, v41, v42, v43);
        objc_msgSend_setRemovedTextLength_(v33, v45, v44, v46);
        uint64_t v50 = objc_msgSend_emojiCharacters(v40, v47, v48, v49);
        objc_msgSend_setRemovedEmojiCount_(v33, v51, v50, v52);

        int v55 = objc_msgSend_getDetailsForString_(IAStringDetails, v53, (uint64_t)v22, v54);
        uint64_t v59 = objc_msgSend_characters(v55, v56, v57, v58);
        objc_msgSend_setInsertedTextLength_(v33, v60, v59, v61);
        uint64_t v65 = objc_msgSend_emojiCharacters(v55, v62, v63, v64);
        objc_msgSend_setInsertedEmojiCount_(v33, v66, v65, v67);
        uint64_t v71 = objc_msgSend_inputActionCount(v33, v68, v69, v70);
        objc_msgSend_setInputActionCountFromMergedActions_(v33, v72, a10 - v71, v73);
        queue = self->_queue;
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = sub_2529F7E0C;
        v76[3] = &unk_265387430;
        v76[4] = self;
        id v77 = v33;
        id v75 = v33;
        dispatch_async(queue, v76);
      }
      else
      {
        uint64_t v22 = sub_252A05924();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_252A10354((uint64_t)v21, v22, v25);
        }
      }
    }
    else
    {
      uint64_t v24 = sub_252A05924();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_252A103D0();
      }

      uint64_t v22 = v20;
    }
  }
  else
  {
    uint64_t v22 = sub_252A05924();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_252A10438((uint64_t)v20, v22, v23);
    }
    id v21 = (__CFString *)v20;
  }
}

- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A104B4();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, 7, 1, 1);
}

- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A1051C();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 0, 8, 1, 1);
}

- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A10584();
  }

  uint64_t v12 = objc_msgSend_analyticsDelegate(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_source(v12, v13, v14, v15);
  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v17, (uint64_t)v6, (uint64_t)v7, 0, 0, 1, v16, 6, 1);
}

- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A105EC();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 1, 12, 6, 1);
}

- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A10654();
  }

  uint64_t v12 = objc_msgSend_analyticsDelegate(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_source(v12, v13, v14, v15);
  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v17, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, v16, 15, 1);
}

- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A106BC();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, 12, 15, 1);
}

- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_252A05924();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A10724();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 0, 11, 1, 0);
}

- (void)didRevisionBubbleTap
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A1078C();
  }

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v4, (uint64_t)&stru_2702E3F20, (uint64_t)&stru_2702E3F20, 0, 1, 0, 11, 1, 1);
}

- (void)didCandidateBarAction
{
  uint64_t v3 = objc_opt_class();
  id v6 = objc_msgSend__instanceOfActionClass_(self, v4, v3, v5);
  uint64_t v10 = objc_msgSend_asReplaceText(v6, v7, v8, v9);

  objc_msgSend_setTextInputActionsType_(v10, v11, 1, v12);
  objc_msgSend_setSource_(v10, v13, 7, v14);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2529F8434;
  v17[3] = &unk_265387430;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  dispatch_async(queue, v17);
}

- (void)didReplaceWithCandidate:(int64_t)a3
{
  sub_252A05924();
  uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    sub_252A107C0(a3, v5, v6, v7);
  }

  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend__instanceOfActionClass_(self, v9, v8, v10);
  uint64_t v15 = objc_msgSend_asReplaceWithCandidate(v11, v12, v13, v14);

  objc_msgSend_setReplaceWithCandidateType_(v15, v16, a3, v17);
  uint64_t v21 = objc_msgSend_inputActionCount(v15, v18, v19, v20);
  objc_msgSend_setInputActionCountFromMergedActions_(v15, v22, -v21, v23);
  queue = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2529F855C;
  v26[3] = &unk_265387430;
  v26[4] = self;
  id v27 = v15;
  id v25 = v15;
  dispatch_async(queue, v26);
}

- (void)didConversionForMarkedText:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = v7;
  if (v6 && v7)
  {
    if (objc_msgSend_length(v6, v8, v9, v10) && objc_msgSend_length(v11, v12, v13, v14))
    {
      id v18 = objc_msgSend_analyticsDelegate(self, v15, v16, v17);
      unint64_t v22 = objc_msgSend_source(v18, v19, v20, v21);

      if (v22 <= 0xC && ((1 << v22) & 0x10B8) != 0)
      {
        uint64_t v26 = objc_msgSend_analyticsDelegate(self, v23, v24, v25);
        uint64_t v30 = objc_msgSend_flagOptions(v26, v27, v28, v29);
        int isMarkedTextSetInFlagOptions = objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v31, v30, v32);

        if (isMarkedTextSetInFlagOptions)
        {
          uint64_t v34 = sub_252A05924();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_252A10934();
          }
        }
        uint64_t v35 = objc_opt_class();
        uint64_t v38 = objc_msgSend__instanceOfActionClass_(self, v36, v35, v37);
        uint64_t v42 = objc_msgSend_asInsertion(v38, v39, v40, v41);

        objc_msgSend_setTextInputActionsType_(v42, v43, 7, v44);
        uint64_t v47 = objc_msgSend_getDetailsForString_(IAStringDetails, v45, (uint64_t)v11, v46);
        uint64_t v51 = objc_msgSend_characters(v47, v48, v49, v50);
        objc_msgSend_setInsertedTextLength_(v42, v52, v51, v53);
        uint64_t v57 = objc_msgSend_emojiCharacters(v47, v54, v55, v56);
        objc_msgSend_setInsertedEmojiCount_(v42, v58, v57, v59);
        uint64_t v63 = objc_msgSend_inputActionCount(v42, v60, v61, v62);
        objc_msgSend_setInputActionCountFromMergedActions_(v42, v64, 1 - v63, v65);
        queue = self->_queue;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = sub_2529F8800;
        v68[3] = &unk_265387430;
        v68[4] = self;
        id v69 = v42;
        id v67 = v42;
        dispatch_async(queue, v68);

        goto LABEL_16;
      }
      uint64_t v47 = sub_252A05924();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v47 = sub_252A05924();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
    }
    sub_252A108CC();
    goto LABEL_16;
  }
  uint64_t v47 = sub_252A05924();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_252A10864();
  }
LABEL_16:
}

- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9 inputType:(int64_t)a10 uiInterfaceOrientation:(int64_t)a11
{
  double y = a7.y;
  double x = a7.x;
  double v18 = a6.y;
  double v19 = a6.x;
  double height = a5.height;
  double width = a5.width;
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v24 = sub_252A05924();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v59 = objc_msgSend_stringForKeyboardDockItemButtonPressResult_(IATextInputActionsUtils, v25, a3, v26);
    uint64_t v62 = objc_msgSend_stringForKeyboardDockItemButtonType_(IATextInputActionsUtils, v60, a4, v61);
    *(_DWORD *)buf = 138479875;
    v66 = v59;
    __int16 v67 = 2113;
    v68 = v62;
    __int16 v69 = 2048;
    double v70 = width;
    __int16 v71 = 2048;
    double v72 = height;
    __int16 v73 = 2048;
    double v74 = v19;
    __int16 v75 = 2048;
    double v76 = v18;
    __int16 v77 = 2048;
    double v78 = x;
    __int16 v79 = 2048;
    double v80 = y;
    __int16 v81 = 2048;
    double v82 = a8;
    _os_log_debug_impl(&dword_2529F1000, v24, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didKeyboardDockItemButtonPress:%{private}@ buttonType:%{private}@ buttonSize:(%fw %fh) touchDown:(%f,%f) touchUp:(%f,%f) touchDuration:%f", buf, 0x5Cu);
  }
  uint64_t v27 = objc_opt_class();
  uint64_t v30 = objc_msgSend__instanceOfActionClass_(self, v28, v27, v29);
  uint64_t v34 = objc_msgSend_asKeyboardDockItemButtonPress(v30, v31, v32, v33);

  objc_msgSend_setSource_(v34, v35, a9, v36);
  objc_msgSend_setTextInputActionsType_(v34, v37, a10, v38);
  objc_msgSend_setButtonPressResult_(v34, v39, a3, v40);
  objc_msgSend_setButtonType_(v34, v41, a4, v42);
  objc_msgSend_setUiOrientation_(v34, v43, a11, v44);
  objc_msgSend_setButtonSize_(v34, v45, v46, v47, width, height);
  objc_msgSend_setTouchDownPoint_(v34, v48, v49, v50, v19, v18);
  objc_msgSend_setTouchUpPoint_(v34, v51, v52, v53, x, y);
  objc_msgSend_setTouchDuration_(v34, v54, v55, v56, a8);
  queue = self->_queue;
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = sub_2529F8AB4;
  v63[3] = &unk_265387430;
  v63[4] = self;
  id v64 = v34;
  id v58 = v34;
  dispatch_async(queue, v63);
}

- (void)didGlomojiTap:(id)a3 newInputMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sub_252A05A54();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_252A1099C();
  }

  uint64_t v9 = objc_opt_class();
  uint64_t v12 = objc_msgSend__instanceOfActionClass_(self, v10, v9, v11);
  uint64_t v16 = objc_msgSend_asGlomojiTap(v12, v13, v14, v15);

  objc_msgSend_setGlomojiType_(v16, v17, 0, v18);
  objc_msgSend_setOriginalInputMode_(v16, v19, (uint64_t)v7, v20);

  objc_msgSend_setUpdatedInputMode_(v16, v21, (uint64_t)v6, v22);
  queue = self->_queue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_2529F8BFC;
  v25[3] = &unk_265387430;
  v25[4] = self;
  id v26 = v16;
  id v24 = v16;
  dispatch_async(queue, v25);
}

- (void)didGlomojiTap:(unint64_t)a3 originalInputMode:(id)a4 newInputMode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = sub_252A05A54();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_252A1099C();
  }

  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend__instanceOfActionClass_(self, v12, v11, v13);
  uint64_t v18 = objc_msgSend_asGlomojiTap(v14, v15, v16, v17);

  objc_msgSend_setGlomojiType_(v18, v19, a3, v20);
  objc_msgSend_setOriginalInputMode_(v18, v21, (uint64_t)v9, v22);

  objc_msgSend_setUpdatedInputMode_(v18, v23, (uint64_t)v8, v24);
  queue = self->_queue;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_2529F8D48;
  v27[3] = &unk_265387430;
  v27[4] = self;
  id v28 = v18;
  id v26 = v18;
  dispatch_async(queue, v27);
}

- (void)didKBMenuAppear:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_252A05A54();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_252A109D0();
  }

  uint64_t v6 = objc_opt_class();
  id v9 = objc_msgSend__instanceOfActionClass_(self, v7, v6, v8);
  uint64_t v13 = objc_msgSend_asKBMenuAppear(v9, v10, v11, v12);

  objc_msgSend_setGlomojiType_(v13, v14, 0, v15);
  objc_msgSend_setOriginalInputMode_(v13, v16, (uint64_t)v4, v17);

  queue = self->_queue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2529F8E6C;
  v20[3] = &unk_265387430;
  v20[4] = self;
  id v21 = v13;
  id v19 = v13;
  dispatch_async(queue, v20);
}

- (void)didKBMenuAppear:(unint64_t)a3 originalInputMode:(id)a4
{
  id v6 = a4;
  id v7 = sub_252A05A54();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_252A109D0();
  }

  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend__instanceOfActionClass_(self, v9, v8, v10);
  uint64_t v15 = objc_msgSend_asKBMenuAppear(v11, v12, v13, v14);

  objc_msgSend_setGlomojiType_(v15, v16, a3, v17);
  objc_msgSend_setOriginalInputMode_(v15, v18, (uint64_t)v6, v19);

  queue = self->_queue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2529F8F9C;
  v22[3] = &unk_265387430;
  v22[4] = self;
  id v23 = v15;
  id v21 = v15;
  dispatch_async(queue, v22);
}

- (void)didKBMenuInteraction:(unint64_t)a3 selectedAction:(unint64_t)a4 newInputMode:(id)a5
{
  id v8 = a5;
  id v9 = sub_252A05A54();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_252A10A04();
  }

  uint64_t v10 = objc_opt_class();
  uint64_t v13 = objc_msgSend__instanceOfActionClass_(self, v11, v10, v12);
  uint64_t v17 = objc_msgSend_asKBMenuInteraction(v13, v14, v15, v16);

  objc_msgSend_setKBMenuInteractionSource_(v17, v18, a3, v19);
  objc_msgSend_setKBMenuSelectedAction_(v17, v20, a4, v21);
  objc_msgSend_setUpdatedInputMode_(v17, v22, (uint64_t)v8, v23);

  queue = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2529F90DC;
  v26[3] = &unk_265387430;
  v26[4] = self;
  id v27 = v17;
  id v25 = v17;
  dispatch_async(queue, v26);
}

- (void)didKBMenuDismiss:(unint64_t)a3
{
  uint64_t v5 = sub_252A05A54();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_252A10A38();
  }

  uint64_t v6 = objc_opt_class();
  id v9 = objc_msgSend__instanceOfActionClass_(self, v7, v6, v8);
  uint64_t v13 = objc_msgSend_asKBMenuDismiss(v9, v10, v11, v12);

  objc_msgSend_setKBMenuDismissSource_(v13, v14, a3, v15);
  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2529F91EC;
  v18[3] = &unk_265387430;
  v18[4] = self;
  id v19 = v13;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4
{
  id v7 = sub_252A05924();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_252A10A6C();
  }

  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend__instanceOfActionClass_(self, v9, v8, v10);
  uint64_t v15 = objc_msgSend_asDictationBegan(v11, v12, v13, v14);

  objc_msgSend_setSource_(v15, v16, 1, v17);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2529F9310;
  block[3] = &unk_265387458;
  BOOL v23 = a3;
  BOOL v24 = a4;
  id v21 = v15;
  uint64_t v22 = self;
  id v19 = v15;
  dispatch_async(queue, block);
}

- (void)didDictationEnd
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A10AA0();
  }

  uint64_t v4 = objc_opt_class();
  id v7 = objc_msgSend__instanceOfActionClass_(self, v5, v4, v6);
  uint64_t v11 = objc_msgSend_asDictationEnded(v7, v8, v9, v10);

  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2529F9468;
  v14[3] = &unk_265387430;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(queue, v14);
}

- (void)_didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend__instanceOfActionClass_(self, v7, v6, v8);
  objc_msgSend_asInsertion(v9, v10, v11, v12);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v27, v13, a4, v14);
  objc_msgSend_setInsertedTextLength_(v27, v15, 0, v16);
  objc_msgSend_setInsertedEmojiCount_(v27, v17, 0, v18);
  uint64_t v22 = objc_msgSend_inputActionCount(v27, v19, v20, v21);
  objc_msgSend_setInputActionCountFromMergedActions_(v27, v23, 1 - v22, v24);
  objc_msgSend__didInsertTextAction_(self, v25, (uint64_t)v27, v26);
}

- (void)didInsertionKeyPress
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A10AD4();
  }

  objc_msgSend__didInsertionKeyPressOfKey_withType_(self, v4, 0, 1);
}

- (void)didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_252A05924();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_252A10B08();
  }

  objc_msgSend__didInsertionKeyPressOfKey_withType_(self, v8, (uint64_t)v6, a4);
}

- (void)_didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend__instanceOfActionClass_(self, v7, v6, v8);
  objc_msgSend_asDeletion(v9, v10, v11, v12);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v27, v13, a4, v14);
  objc_msgSend_setRemovedTextLength_(v27, v15, 0, v16);
  objc_msgSend_setRemovedEmojiCount_(v27, v17, 0, v18);
  uint64_t v22 = objc_msgSend_inputActionCount(v27, v19, v20, v21);
  objc_msgSend_setInputActionCountFromMergedActions_(v27, v23, 1 - v22, v24);
  objc_msgSend__didDeleteBackwardAction_(self, v25, (uint64_t)v27, v26);
}

- (void)didDeletionKeyPress
{
  uint64_t v3 = sub_252A05924();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_252A10BA8();
  }

  objc_msgSend__didDeletionKeyPressOfKey_withType_(self, v4, 0, 1);
}

- (void)didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_252A05924();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_252A10BDC();
  }

  objc_msgSend__didDeletionKeyPressOfKey_withType_(self, v8, (uint64_t)v6, a4);
}

- (IATextInputActionsMetadataObserving)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (IATextInputActionsMetadataObserving *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_lastAction, 0);
  objc_storeStrong((id *)&self->_localServer, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withEventHandler:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)IATextInputActionsAnalytics;
  id v5 = a4;
  id v6 = a3;
  id v7 = [(IATextInputActionsAnalytics *)&v18 init];
  *(_WORD *)&v7->_useAnalyticsDaemon = 256;
  uint64_t v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsAnalytics", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  lastAction = v7->_lastAction;
  v7->_lastAction = 0;

  objc_storeWeak((id *)&v7->_analyticsDelegate, v6);
  uint64_t v12 = [IATextInputActionsServer alloc];
  uint64_t v15 = objc_msgSend_initWithEventHandler_(v12, v13, (uint64_t)v5, v14, v18.receiver, v18.super_class);

  localServer = v7->_localServer;
  v7->_localServer = (IATextInputActionsServer *)v15;

  return v7;
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withServiceName:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)IATextInputActionsAnalytics;
  id v5 = a4;
  id v6 = a3;
  id v7 = [(IATextInputActionsAnalytics *)&v26 init];
  *(_WORD *)&v7->_useAnalyticsDaemon = 1;
  uint64_t v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsAnalytics", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  lastAction = v7->_lastAction;
  v7->_lastAction = 0;

  objc_storeWeak((id *)&v7->_analyticsDelegate, v6);
  uint64_t v12 = [IAXPCClient alloc];
  uint64_t v15 = objc_msgSend_initWithServiceName_(v12, v13, (uint64_t)v5, v14, v26.receiver, v26.super_class);

  xpcClient = v7->_xpcClient;
  v7->_xpcClient = (IAXPCClient *)v15;

  uint64_t v17 = sub_252A05924();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_super v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    uint64_t v20 = v7->_xpcClient;
    uint64_t v24 = objc_msgSend_server(v20, v21, v22, v23);
    *(_DWORD *)buf = 138478339;
    id v28 = v19;
    __int16 v29 = 2048;
    uint64_t v30 = v20;
    __int16 v31 = 2048;
    uint64_t v32 = v24;
    _os_log_impl(&dword_2529F1000, v17, OS_LOG_TYPE_INFO, "initialized new %{private}@ xpc client 0x%lx with server 0x%lx", buf, 0x20u);
  }
  return v7;
}

- (void)dispatchToAnalyticsQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2529F9B98;
  block[3] = &unk_265387480;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)server
{
  return self->_localServer;
}

- (id)lastAction
{
  return self->_lastAction;
}

@end