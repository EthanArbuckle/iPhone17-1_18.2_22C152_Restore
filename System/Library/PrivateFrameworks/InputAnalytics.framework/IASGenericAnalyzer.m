@interface IASGenericAnalyzer
- (BOOL)shouldBeGarbageCollected;
- (IASGenericAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4;
- (IASGenericAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5;
- (NSDictionary)channelBasedPayloadKeyAllowList;
- (NSDictionary)signalTranslation;
- (id)description;
- (void)_appendAllowListedPayloadKeyAndValueTo:(id)a3 forSignalAnalyticsObject:(id)a4;
- (void)_appendSignalEnumTo:(id)a3 forSignalAnalyticsObject:(id)a4;
- (void)consumeAction:(id)a3;
- (void)enumerateAnalytics;
- (void)setChannelBasedPayloadKeyAllowList:(id)a3;
- (void)setSignalTranslation:(id)a3;
@end

@implementation IASGenericAnalyzer

- (IASGenericAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4
{
  return (IASGenericAnalyzer *)objc_msgSend_initWithAnalyzerSessionId_sessionManagerDelegate_eventHandler_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (IASGenericAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5
{
  v136[4] = *MEMORY[0x263EF8340];
  v80.receiver = self;
  v80.super_class = (Class)IASGenericAnalyzer;
  v5 = [(IASAnalyzer *)&v80 initWithAnalyzerSessionId:a3 sessionManagerDelegate:a4 eventHandler:a5];
  v7 = v5;
  if (v5)
  {
    v135[0] = @"WritingTools";
    v133[0] = @"Feature";
    v131[0] = @"publishFieldName";
    v131[1] = @"publishEnumName";
    v132[0] = @"feature";
    v132[1] = @"featureEnum";
    v131[2] = @"enumTranslation";
    v129[0] = @"Unspecified";
    v129[1] = @"Proofread";
    v130[0] = &unk_2702EF038;
    v130[1] = &unk_2702EF050;
    v129[2] = @"Transform";
    v129[3] = @"Adjust";
    v130[2] = &unk_2702EF068;
    v130[3] = &unk_2702EF080;
    v129[4] = @"Rewrite";
    v129[5] = @"OpenPrompt";
    v130[4] = &unk_2702EF098;
    v130[5] = &unk_2702EF0B0;
    v79 = v5;
    v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v130, (uint64_t)v129, 6);
    v131[3] = @"enumTranslationDefaultValue";
    v132[2] = v76;
    v132[3] = &unk_2702EF038;
    v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v132, (uint64_t)v131, 4);
    v134[0] = v75;
    v133[1] = @"FeatureDetails";
    v127[0] = @"publishFieldName";
    v127[1] = @"publishEnumName";
    v128[0] = @"featureDetails";
    v128[1] = @"featureDetailsEnum";
    v127[2] = @"enumTranslation";
    v125[0] = @"Generic";
    v125[1] = @"Index";
    v126[0] = &unk_2702EF050;
    v126[1] = &unk_2702EF068;
    v125[2] = @"ProofreadingReview";
    v125[3] = @"MagicRewrite";
    v126[2] = &unk_2702EF080;
    v126[3] = &unk_2702EF098;
    v125[4] = @"ConciseTone";
    v125[5] = @"PoliteTone";
    v126[4] = &unk_2702EF0B0;
    v126[5] = &unk_2702EF0C8;
    v125[6] = @"ProfessionalTone";
    v125[7] = @"OpenEndedTone";
    v126[6] = &unk_2702EF0E0;
    v126[7] = &unk_2702EF0F8;
    v125[8] = @"MessagesReply";
    v125[9] = @"MailReply";
    v126[8] = &unk_2702EF110;
    v126[9] = &unk_2702EF128;
    v125[10] = @"FriendlyTone";
    v125[11] = @"BulletsTransform";
    v126[10] = &unk_2702EF140;
    v126[11] = &unk_2702EF158;
    v125[12] = @"TablesTransform";
    v125[13] = @"TakeawaysTransform";
    v126[12] = &unk_2702EF170;
    v126[13] = &unk_2702EF188;
    v125[14] = @"SummaryTransform";
    v125[15] = @"ServerOpenEndedTone";
    v126[14] = &unk_2702EF1A0;
    v126[15] = &unk_2702EF1B8;
    v125[16] = @"ServerBulletsTransform";
    v125[17] = @"ServerTablesTransform";
    v126[16] = &unk_2702EF1D0;
    v126[17] = &unk_2702EF1E8;
    v125[18] = @"ServerTakeawaysTransform";
    v125[19] = @"OpenEndedExtendedTone";
    v126[18] = &unk_2702EF200;
    v126[19] = &unk_2702EF218;
    v125[20] = @"SmartReply";
    v125[21] = @"Compose";
    v126[20] = &unk_2702EF230;
    v126[21] = &unk_2702EF248;
    v74 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v126, (uint64_t)v125, 22);
    v127[3] = @"enumTranslationDefaultValue";
    v128[2] = v74;
    v128[3] = &unk_2702EF038;
    v73 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v128, (uint64_t)v127, 4);
    v134[1] = v73;
    v133[2] = @"UI";
    v123[0] = @"publishFieldName";
    v123[1] = @"publishEnumName";
    v124[0] = @"ui";
    v124[1] = @"uiEnum";
    v123[2] = @"enumTranslation";
    v121[0] = @"Unspecified";
    v121[1] = @"Menu";
    v122[0] = &unk_2702EF038;
    v122[1] = &unk_2702EF050;
    v121[2] = @"EditMenu";
    v121[3] = @"CandidateBar";
    v122[2] = &unk_2702EF068;
    v122[3] = &unk_2702EF080;
    v121[4] = @"ContextMenu";
    v121[5] = @"MenuBar";
    v122[4] = &unk_2702EF098;
    v122[5] = &unk_2702EF0B0;
    v121[6] = @"Affordance";
    v121[7] = @"Panel";
    v122[6] = &unk_2702EF0C8;
    v122[7] = &unk_2702EF0E0;
    v121[8] = @"RewritingView";
    v121[9] = @"ProofreadingView";
    v122[8] = &unk_2702EF0F8;
    v122[9] = &unk_2702EF110;
    v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v122, (uint64_t)v121, 10);
    v123[3] = @"enumTranslationDefaultValue";
    v124[2] = v72;
    v124[3] = &unk_2702EF038;
    v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v124, (uint64_t)v123, 4);
    v134[2] = v71;
    v133[3] = @"InteractionType";
    v119[0] = @"publishFieldName";
    v119[1] = @"publishEnumName";
    v120[0] = @"interactionType";
    v120[1] = @"interactionTypeEnum";
    v119[2] = @"enumTranslation";
    v117[0] = @"Unspecified";
    v117[1] = @"Copy";
    v118[0] = &unk_2702EF038;
    v118[1] = &unk_2702EF050;
    v117[2] = @"Share";
    v117[3] = @"Replace";
    v118[2] = &unk_2702EF068;
    v118[3] = &unk_2702EF080;
    v117[4] = @"ShowOriginal";
    v117[5] = @"ShowRewritten";
    v118[4] = &unk_2702EF098;
    v118[5] = &unk_2702EF0B0;
    v117[6] = @"NextDraft";
    v117[7] = @"PreviousDraft";
    v118[6] = &unk_2702EF0C8;
    v118[7] = &unk_2702EF0E0;
    v117[8] = @"Retry";
    v117[9] = @"ComposeEntry";
    v118[8] = &unk_2702EF0F8;
    v118[9] = &unk_2702EF110;
    v117[10] = @"ComposePromptEntry";
    v117[11] = @"ComposeExit";
    v118[10] = &unk_2702EF128;
    v118[11] = &unk_2702EF140;
    v117[12] = @"OpenEndedEntry";
    v117[13] = @"OpenEndedExit";
    v118[12] = &unk_2702EF158;
    v118[13] = &unk_2702EF170;
    v70 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v118, (uint64_t)v117, 14);
    v119[3] = @"enumTranslationDefaultValue";
    v120[2] = v70;
    v120[3] = &unk_2702EF038;
    v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v120, (uint64_t)v119, 4);
    v134[3] = v69;
    v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v134, (uint64_t)v133, 4);
    v136[0] = v68;
    v135[1] = @"SmartReplies";
    v115 = @"IsCached";
    v116 = @"isCached";
    v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)&v116, (uint64_t)&v115, 1);
    v136[1] = v67;
    v135[2] = @"Genmoji";
    v113[0] = @"ImageType";
    v111[0] = @"publishFieldName";
    v111[1] = @"publishEnumName";
    v112[0] = @"imageType";
    v112[1] = @"imageTypeEnum";
    v111[2] = @"enumTranslation";
    v109[0] = @"Genmoji";
    v109[1] = @"Stickers1P";
    v110[0] = &unk_2702EF050;
    v110[1] = &unk_2702EF068;
    v109[2] = @"Stickers3P";
    v109[3] = @"Memoji";
    v110[2] = &unk_2702EF080;
    v110[3] = &unk_2702EF098;
    v109[4] = @"Emoji";
    v110[4] = &unk_2702EF0B0;
    v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v110, (uint64_t)v109, 5);
    v111[3] = @"enumTranslationDefaultValue";
    v112[2] = v66;
    v112[3] = &unk_2702EF038;
    v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v112, (uint64_t)v111, 4);
    v114[0] = v65;
    v113[1] = @"UsageSource";
    v107[0] = @"publishFieldName";
    v107[1] = @"publishEnumName";
    v108[0] = @"usageSource";
    v108[1] = @"usageSourceEnum";
    v107[2] = @"enumTranslation";
    v105[0] = @"CreationSheet";
    v105[1] = @"RecentsTab";
    v106[0] = &unk_2702EF050;
    v106[1] = &unk_2702EF068;
    v105[2] = @"KeyboardPicker";
    v105[3] = @"EmojiSearch";
    v106[2] = &unk_2702EF080;
    v106[3] = &unk_2702EF098;
    v105[4] = @"CandidateBarSuggestions";
    v106[4] = &unk_2702EF0B0;
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v106, (uint64_t)v105, 5);
    v107[3] = @"enumTranslationDefaultValue";
    v108[2] = v20;
    v108[3] = &unk_2702EF038;
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v108, (uint64_t)v107, 4);
    v114[1] = v22;
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v114, (uint64_t)v113, 2);
    v136[2] = v24;
    v103[0] = @"FailReason";
    v101[0] = @"publishFieldName";
    v101[1] = @"publishEnumName";
    v135[3] = @"GenmojiCreation";
    v102[0] = @"shownFailReason";
    v102[1] = @"shownFailReasonEnum";
    v101[2] = @"enumTranslation";
    v28 = objc_msgSend_genmojiCreationFailReasonToEnumMap(IAGenmojiAnalytics, v25, v26, v27);
    v101[3] = @"enumTranslationDefaultValue";
    v102[2] = v28;
    v102[3] = &unk_2702EF038;
    v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v102, (uint64_t)v101, 4);
    v104[0] = v30;
    v103[1] = @"ErrorDescription";
    v99[0] = @"publishFieldName";
    v99[1] = @"transform";
    v100[0] = @"errorDescription";
    v100[1] = @"truncate64";
    v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)v100, (uint64_t)v99, 2);
    v104[1] = v32;
    v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v104, (uint64_t)v103, 2);
    v136[3] = v34;
    v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v136, (uint64_t)v135, 4);
    objc_msgSend_setChannelBasedPayloadKeyAllowList_(v79, v37, (uint64_t)v36, v38);

    v97[0] = @"WritingTools";
    v95[0] = @"enumTranslation";
    v93[0] = @"PanelRequested";
    v93[1] = @"PanelAppeared";
    v94[0] = &unk_2702EF050;
    v94[1] = &unk_2702EF068;
    v93[2] = @"ActionSelected";
    v93[3] = @"ResultsRequested";
    v94[2] = &unk_2702EF080;
    v94[3] = &unk_2702EF098;
    v93[4] = @"ResultsFailed";
    v93[5] = @"ResultsGenerated";
    v94[4] = &unk_2702EF0B0;
    v94[5] = &unk_2702EF0C8;
    v93[6] = @"ResultsOffered";
    v93[7] = @"ResultsAccepted";
    v94[6] = &unk_2702EF0E0;
    v94[7] = &unk_2702EF0F8;
    v93[8] = @"ResultsRejected";
    v93[9] = @"ButtonTapped";
    v94[8] = &unk_2702EF110;
    v94[9] = &unk_2702EF128;
    v93[10] = @"PanelDismissed";
    v93[11] = @"UISuspended";
    v94[10] = &unk_2702EF140;
    v94[11] = &unk_2702EF158;
    v93[12] = @"UIResumed";
    v93[13] = @"UITerminated";
    v94[12] = &unk_2702EF170;
    v94[13] = &unk_2702EF188;
    v93[14] = @"TransparencyUIModified";
    v93[15] = @"AttachmentsModified";
    v94[14] = &unk_2702EF1A0;
    v94[15] = &unk_2702EF1B8;
    v93[16] = @"SuggestionChosen";
    v93[17] = @"SlotFormShown";
    v94[16] = &unk_2702EF1D0;
    v94[17] = &unk_2702EF1E8;
    v93[18] = @"SlotFormCompleted";
    v94[18] = &unk_2702EF200;
    v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v39, (uint64_t)v94, (uint64_t)v93, 19);
    v95[1] = @"enumTranslationDefaultValue";
    v96[0] = v78;
    v96[1] = &unk_2702EF038;
    v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)v96, (uint64_t)v95, 2);
    v98[0] = v77;
    v97[1] = @"SmartReplies";
    v91[0] = @"enumTranslation";
    v89[0] = @"ComposeFieldInFocus";
    v89[1] = @"ComposeFieldOutOfFocus";
    v90[0] = &unk_2702EF050;
    v90[1] = &unk_2702EF068;
    v89[2] = @"ComposeTextModified";
    v89[3] = @"IntentRequested";
    v90[2] = &unk_2702EF080;
    v90[3] = &unk_2702EF098;
    v89[4] = @"IntentGenerated";
    v89[5] = @"IntentNotShown";
    v90[4] = &unk_2702EF0B0;
    v90[5] = &unk_2702EF0C8;
    v89[6] = @"IntentShown";
    v89[7] = @"IntentEngaged";
    v90[6] = &unk_2702EF0E0;
    v90[7] = &unk_2702EF0F8;
    v89[8] = @"IntentDismissed";
    v89[9] = @"InitialResponseRequested";
    v90[8] = &unk_2702EF110;
    v90[9] = &unk_2702EF128;
    v89[10] = @"InitialResponseFailed";
    v89[11] = @"InitialResponseCompleted";
    v90[10] = &unk_2702EF140;
    v90[11] = &unk_2702EF158;
    v89[12] = @"QuestionnaireRequested";
    v89[13] = @"QuestionnaireNotShown";
    v90[12] = &unk_2702EF170;
    v90[13] = &unk_2702EF188;
    v89[14] = @"QuestionnaireShown";
    v89[15] = @"QuestionnaireDismissed";
    v90[14] = &unk_2702EF1A0;
    v90[15] = &unk_2702EF1B8;
    v89[16] = @"QuestionnaireAnswerModified";
    v89[17] = @"RewriteRequested";
    v90[16] = &unk_2702EF1D0;
    v90[17] = &unk_2702EF1E8;
    v89[18] = @"RewriteFailed";
    v89[19] = @"RewriteCompleted";
    v90[18] = &unk_2702EF200;
    v90[19] = &unk_2702EF218;
    v89[20] = @"ResultsAccepted";
    v89[21] = @"ResultsRejected";
    v90[20] = &unk_2702EF230;
    v90[21] = &unk_2702EF248;
    v89[22] = @"AppSuspended";
    v89[23] = @"AppResumed";
    v90[22] = &unk_2702EF260;
    v90[23] = &unk_2702EF278;
    v89[24] = @"AppKilled";
    v89[25] = @"UISuspended";
    v90[24] = &unk_2702EF290;
    v90[25] = &unk_2702EF2A8;
    v89[26] = @"UIResumed";
    v89[27] = @"UITerminated";
    v90[26] = &unk_2702EF2C0;
    v90[27] = &unk_2702EF2D8;
    v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v90, (uint64_t)v89, 28);
    v91[1] = @"enumTranslationDefaultValue";
    v92[0] = v42;
    v92[1] = &unk_2702EF038;
    v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v43, (uint64_t)v92, (uint64_t)v91, 2);
    v98[1] = v44;
    v97[2] = @"Genmoji";
    v87[0] = @"enumTranslation";
    v85[0] = @"Usage";
    v85[1] = @"Edit";
    v86[0] = &unk_2702EF050;
    v86[1] = &unk_2702EF068;
    v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v86, (uint64_t)v85, 2);
    v87[1] = @"enumTranslationDefaultValue";
    v88[0] = v46;
    v88[1] = &unk_2702EF038;
    v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, (uint64_t)v88, (uint64_t)v87, 2);
    v98[2] = v48;
    v97[3] = @"GenmojiCreation";
    v83[0] = @"enumTranslation";
    v52 = objc_msgSend_genmojiCreationSignalToEnumMap(IAGenmojiAnalytics, v49, v50, v51);
    v83[1] = @"enumTranslationDefaultValue";
    v84[0] = v52;
    v84[1] = &unk_2702EF038;
    v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)v84, (uint64_t)v83, 2);
    v98[3] = v54;
    v7 = v79;
    v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v98, (uint64_t)v97, 4);
    objc_msgSend_setSignalTranslation_(v79, v57, (uint64_t)v56, v58);

    v59 = sub_252A04A74();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v63 = objc_msgSend_channelBasedPayloadKeyAllowList(v79, v60, v61, v62);
      *(_DWORD *)buf = 138477827;
      v82 = v63;
      _os_log_impl(&dword_2529F1000, v59, OS_LOG_TYPE_INFO, "Initialized with exceptions: %{private}@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v9 = objc_msgSend_analyzerSessionId(self, v6, v7, v8);
  v12 = objc_msgSend_stringWithFormat_(v3, v10, @"%@: Analyzer ID=%@", v11, v5, v9);

  return v12;
}

- (void)consumeAction:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    sub_252A04A74();
    uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
      sub_252A11254(v6, v7, v8, v9);
    }

    v13 = objc_msgSend_channelName(v6, v10, v11, v12);
    v16 = objc_msgSend_stringByAppendingString_(@"com.apple.inputAnalytics.signalAnalytics.", v14, (uint64_t)v13, v15);

    v20 = objc_msgSend_appBundleId(v6, v17, v18, v19);
    v23 = objc_msgSend_lookupAppBundle_(IAUtility, v21, (uint64_t)v20, v22);

    id v24 = objc_alloc(MEMORY[0x263EFF9A0]);
    v37[0] = @"bundleId";
    v37[1] = @"signal";
    v38[0] = v23;
    v28 = objc_msgSend_signalName(v6, v25, v26, v27);
    v38[1] = v28;
    v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v38, (uint64_t)v37, 2);
    v33 = objc_msgSend_initWithDictionary_(v24, v31, (uint64_t)v30, v32);

    objc_msgSend__appendSignalEnumTo_forSignalAnalyticsObject_(self, v34, (uint64_t)v33, (uint64_t)v6);
    objc_msgSend__appendAllowListedPayloadKeyAndValueTo_forSignalAnalyticsObject_(self, v35, (uint64_t)v33, (uint64_t)v6);
    id v36 = v33;
    AnalyticsSendEventLazy();
  }
}

- (void)enumerateAnalytics
{
  objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, (uint64_t)self, @"IASGenericAnalyzer.m", 326, @"not implemented!");
}

- (BOOL)shouldBeGarbageCollected
{
  return 0;
}

- (void)_appendSignalEnumTo:(id)a3 forSignalAnalyticsObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_signalTranslation(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_channelName(v7, v12, v13, v14);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v11, v16, (uint64_t)v15, v17);

  if (v18)
  {
    v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, @"enumTranslation", v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = objc_msgSend_objectForKeyedSubscript_(v18, v22, @"enumTranslation", v23);
    }
    else
    {
      id v24 = 0;
    }

    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v18, v25, @"enumTranslationDefaultValue", v26);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = objc_msgSend_objectForKeyedSubscript_(v18, v28, @"enumTranslationDefaultValue", v29);

      BOOL v34 = v24 != 0;
      BOOL v35 = v30 != 0;
      if (v24 && v30)
      {
        id v36 = objc_msgSend_signalName(v7, v31, v32, v33);
        v39 = objc_msgSend_objectForKeyedSubscript_(v24, v37, (uint64_t)v36, v38);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = objc_msgSend_signalName(v7, v40, v41, v42);
          objc_msgSend_objectForKeyedSubscript_(v24, v44, (uint64_t)v43, v45);
          v46 = (char *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
LABEL_20:
            objc_msgSend_setObject_forKeyedSubscript_(v6, v47, (uint64_t)v46, @"signalEnum");
            goto LABEL_21;
          }
        }
        else
        {
        }
        sub_252A04A74();
        uint64_t v50 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR)) {
          sub_252A11308(v7, v50, v51, v52);
        }

        v46 = v30;
        goto LABEL_20;
      }
    }
    else
    {

      BOOL v35 = 0;
      v30 = 0;
      BOOL v34 = v24 != 0;
    }
    if (!v34 && !v35) {
      goto LABEL_22;
    }
    sub_252A04A74();
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_FAULT)) {
      sub_252A113BC(v7, v46, v48, v49);
    }
LABEL_21:

LABEL_22:
  }
}

- (void)_appendAllowListedPayloadKeyAndValueTo:(id)a3 forSignalAnalyticsObject:(id)a4
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v103 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_channelBasedPayloadKeyAllowList(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_channelName(v6, v11, v12, v13);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v10, v15, (uint64_t)v14, v16);

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v18 = v17;
  uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v106, (uint64_t)v116, 16);
  if (v105)
  {
    uint64_t v104 = *(void *)v107;
    *(void *)&long long v23 = 138478083;
    long long v98 = v23;
    id v99 = v18;
    v100 = v6;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v107 != v104) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = *(void *)(*((void *)&v106 + 1) + 8 * v24);
        uint64_t v26 = objc_msgSend_payload(v6, v20, v21, v22, v98);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, v25, v28);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_61;
        }
        uint64_t v33 = objc_msgSend_payload(v6, v30, v31, v32);
        id v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, v25, v35);

        if (!v36) {
          goto LABEL_62;
        }
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v18, v20, v25, v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v37 = v29;
        }
        else {
          v37 = 0;
        }
        id v39 = v37;
        if (!v39)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v40 = v29;
          }
          else {
            v40 = 0;
          }
          id v41 = v40;
          v44 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"publishFieldName", v43);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_32;
          }
          uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v41, v45, @"publishFieldName", v46);

          if (v47)
          {
            uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v41, v48, @"transform", v49);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v53 = v50;
              goto LABEL_30;
            }
            v53 = objc_msgSend_objectForKeyedSubscript_(v41, v51, @"transform", v52);

            if (v53)
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass) {
                v56 = v36;
              }
              else {
                v56 = 0;
              }
              id v57 = v56;
              if (objc_msgSend_isEqualToString_(v53, v58, @"truncate64", v59)
                && (isKindOfClass & 1) != 0
                && (unint64_t)objc_msgSend_length(v57, v60, v61, v62) >= 0x41)
              {
                uint64_t v65 = objc_msgSend_substringToIndex_(v57, v63, 64, v64);

                id v36 = (void *)v65;
              }

LABEL_30:
            }
            objc_msgSend_setObject_forKeyedSubscript_(v103, v54, (uint64_t)v36, v47);
            v44 = (void *)v47;
LABEL_32:
          }
          v66 = objc_msgSend_objectForKeyedSubscript_(v41, v48, @"publishEnumName", v49);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v69 = objc_msgSend_objectForKeyedSubscript_(v41, v67, @"publishEnumName", v68);
          }
          else
          {
            v69 = 0;
          }

          v72 = objc_msgSend_objectForKeyedSubscript_(v41, v70, @"enumTranslation", v71);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = objc_msgSend_objectForKeyedSubscript_(v41, v73, @"enumTranslation", v74);
          }
          else
          {
            v75 = 0;
          }

          v78 = objc_msgSend_objectForKeyedSubscript_(v41, v76, @"enumTranslationDefaultValue", v77);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v81 = objc_msgSend_objectForKeyedSubscript_(v41, v79, @"enumTranslationDefaultValue", v80);
          }
          else
          {
            v81 = 0;
          }

          if (v69 && v75 && v81)
          {
            v101 = v69;
            v84 = objc_msgSend_objectForKeyedSubscript_(v75, v82, (uint64_t)v36, v83);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v69 = v101;
              goto LABEL_54;
            }
            v87 = objc_msgSend_objectForKeyedSubscript_(v75, v85, (uint64_t)v36, v86);

            v69 = v101;
            if (!v87)
            {
LABEL_54:
              v93 = sub_252A04A74();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                v97 = objc_msgSend_channelName(v100, v94, v95, v96);
                *(_DWORD *)buf = 138478339;
                v111 = v36;
                __int16 v112 = 2113;
                uint64_t v113 = (uint64_t)v97;
                __int16 v114 = 2113;
                uint64_t v115 = v25;
                _os_log_error_impl(&dword_2529F1000, v93, OS_LOG_TYPE_ERROR, "Payload value '%{private}@' not found in translator for channel '%{private}@' payloadKey '%{private}@'. Using default", buf, 0x20u);

                v69 = v101;
              }

              v87 = v81;
            }
            objc_msgSend_setObject_forKeyedSubscript_(v103, v88, (uint64_t)v87, (uint64_t)v69);
LABEL_58:
          }
          else if (v69 || v75 || v81)
          {
            v87 = sub_252A04A74();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend_channelName(v100, v89, v90, v91);
              v92 = v102 = v69;
              *(_DWORD *)buf = v98;
              v111 = v92;
              __int16 v112 = 2113;
              uint64_t v113 = v25;
              _os_log_fault_impl(&dword_2529F1000, v87, OS_LOG_TYPE_FAULT, "Missing definitions in channelBasedPayloadKeyAllowList for channel '%{private}@' payloadKey '%{private}@'", buf, 0x16u);

              v69 = v102;
            }
            goto LABEL_58;
          }

          id v18 = v99;
          id v6 = v100;
          goto LABEL_60;
        }
        objc_msgSend_setObject_forKeyedSubscript_(v103, v38, (uint64_t)v36, (uint64_t)v39);
LABEL_60:

        uint64_t v26 = v36;
LABEL_61:

LABEL_62:
        ++v24;
      }
      while (v105 != v24);
      uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v106, (uint64_t)v116, 16);
    }
    while (v105);
  }
}

- (NSDictionary)channelBasedPayloadKeyAllowList
{
  return self->_channelBasedPayloadKeyAllowList;
}

- (void)setChannelBasedPayloadKeyAllowList:(id)a3
{
}

- (NSDictionary)signalTranslation
{
  return self->_signalTranslation;
}

- (void)setSignalTranslation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalTranslation, 0);
  objc_storeStrong((id *)&self->_channelBasedPayloadKeyAllowList, 0);
}

@end