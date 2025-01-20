@interface ATXAction
+ (BOOL)_isTVIntent:(id)a3 bundleId:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4;
+ (id)actionFromProactiveSuggestion:(id)a3;
+ (id)atx_doNotDisturbForCurrentLocationActionWithTitle:(id)a3 subtitle:(id)a4 heuristicName:(id)a5;
+ (id)atx_doNotDisturbForEventActionWithTitle:(id)a3 subtitle:(id)a4 eventTitle:(id)a5 eventIdentifier:(id)a6 eventUniqueID:(id)a7 heuristicName:(id)a8;
+ (id)atx_sendMessageActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 text:(id)a7 contactIdentifier:(id)a8 conversationIdentifier:(id)a9 eventIdentifier:(id)a10 heuristicName:(id)a11;
+ (id)atx_setAirplaneModeActionWithTitle:(id)a3 subtitle:(id)a4;
+ (id)atx_setAlarmActionWithTitle:(id)a3 subtitle:(id)a4 eventIdentifier:(id)a5 eventTitle:(id)a6 alarmDate:(id)a7 heuristicName:(id)a8;
+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8;
+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8 criteria:(id)a9;
+ (id)atx_startAudioCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10;
+ (id)atx_startCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10 mediaType:(id)a11;
+ (id)atx_startVideoCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10;
+ (id)atx_updateAlarmActionWithTitle:(id)a3 subtitle:(id)a4 alarmID:(id)a5 alarmTitle:(id)a6 heuristicName:(id)a7;
+ (id)atx_userActivityActionWithBestAppSuggestion:(id)a3 title:(id)a4 subtitle:(id)a5 bundleID:(id)a6 activityType:(id)a7 heuristicName:(id)a8;
+ (id)atx_userActivityActionWithTitle:(id)a3 subtitle:(id)a4 bundleID:(id)a5 activityType:(id)a6 urlString:(id)a7 userInfo:(id)a8 heuristicName:(id)a9;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)getActionKeyForBundleId:(id)a3 actionType:(id)a4;
+ (id)getDateFromUserActivityString:(id)a3 forActionKey:(id)a4;
+ (id)getNSUATypefromActivityType:(id)a3;
+ (id)unarchivedActionFromData:(id)a3;
+ (id)webUrlParsedForUserActivityWithUrlString:(id)a3;
+ (unint64_t)_userActivityHashForUserInfoDict:(id)a3 activityType:(id)a4 webpageURL:(id)a5;
- (ATXAVRouteInfo)routeInfo;
- (ATXAction)actionWithRouteInfo:(id)a3;
- (ATXAction)initWithActivityProxy:(id)a3 activity:(id)a4 activityString:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 intent:(id)a8 actionUUID:(id)a9 bundleId:(id)a10 type:(unint64_t)a11 heuristic:(id)a12 heuristicMetadata:(id)a13 criteria:(id)a14 isFutureMedia:(BOOL)a15 routeInfo:(id)a16 title:(id)a17 subtitle:(id)a18 languageCode:(id)a19 cachedHash:(id)a20;
- (ATXAction)initWithCoder:(id)a3;
- (ATXAction)initWithIntent:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 heuristic:(id)a6 heuristicMetadata:(id)a7 criteria:(id)a8 isFutureMedia:(BOOL)a9 title:(id)a10 subtitle:(id)a11;
- (ATXAction)initWithNSUserActivity:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 contentAttributeSet:(id)a6 itemIdentifier:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 criteria:(id)a10 isFutureMedia:(BOOL)a11 title:(id)a12 subtitle:(id)a13;
- (ATXAction)initWithNSUserActivityString:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 isFutureMedia:(BOOL)a10 title:(id)a11 subtitle:(id)a12;
- (ATXAction)initWithProto:(id)a3;
- (ATXAction)initWithProtoData:(id)a3;
- (ATXActionCriteria)criteria;
- (BOOL)_shouldUseCachedTitle:(id)a3 cachedLanguageCode:(id)a4;
- (BOOL)hasActionTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAction:(id)a3;
- (BOOL)isFutureMedia;
- (BOOL)isHeuristic;
- (BOOL)isTVAction;
- (BOOL)isTVWhiteListedLongFormMedia;
- (CSSearchableItemAttributeSet)contentAttributeSet;
- (INIntent)intent;
- (NSArray)predictableParameterCombinations;
- (NSDictionary)heuristicMetadata;
- (NSNumber)cachedHash;
- (NSString)bundleId;
- (NSString)description;
- (NSString)heuristic;
- (NSString)itemIdentifier;
- (NSString)userActivityString;
- (NSUUID)actionUUID;
- (NSUserActivity)userActivity;
- (UAUserActivityProxy)userActivityProxy;
- (id)_bundleIdForDisplay;
- (id)_initWithCoder:(id)a3;
- (id)_spotlightContentType;
- (id)_subtitle;
- (id)_title;
- (id)actionDescription;
- (id)actionKey;
- (id)actionSubtitle;
- (id)actionTitle;
- (id)archivedDataForAction;
- (id)copyWithParameterAllowList:(id)a3 metadataProvider:(id)a4;
- (id)copyWithParameterWhitelist:(id)a3;
- (id)dateForAction;
- (id)encodeAsProto;
- (id)initFromBestAppSuggestion:(id)a3 activity:(id)a4 actionUUID:(id)a5 bundleId:(id)a6 contentAttributeSet:(id)a7 itemIdentifier:(id)a8 heuristic:(id)a9 heuristicMetadata:(id)a10 criteria:(id)a11 isFutureMedia:(BOOL)a12 title:(id)a13 subtitle:(id)a14;
- (id)json;
- (id)predictionTypeStringForPET;
- (id)proto;
- (id)slotSet;
- (id)underlyingInteraction;
- (id)userActivityWebpageURL;
- (unint64_t)_hash;
- (unint64_t)actionType;
- (unint64_t)hash;
- (unint64_t)hashSlotSetWithNonNilParameters:(id)a3;
- (unint64_t)paramHash;
- (unint64_t)userActivityHash;
- (unsigned)dataVersion;
- (void)_setUserActivityHash:(unint64_t)a3;
- (void)_spotlightContentType;
- (void)actionKey;
- (void)archivedDataForAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleMemoryPressure;
- (void)invalidateCachedHash;
- (void)proto;
- (void)setCriteria:(id)a3;
- (void)setHeuristic:(id)a3;
- (void)setLaunchIdForIntent:(id)a3;
- (void)setPredictableParameterCombinations:(id)a3;
- (void)setSubtitleForSerializationToCache;
- (void)setTitleForSerializationToCache;
@end

@implementation ATXAction

- (ATXAction)initWithIntent:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 heuristic:(id)a6 heuristicMetadata:(id)a7 criteria:(id)a8 isFutureMedia:(BOOL)a9 title:(id)a10 subtitle:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [[ATXLazyIntent alloc] initWithIntent:v24];
  BOOL v26 = [v24 _type] == 2;

  LOBYTE(v29) = a9;
  v27 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, 0, 0, 0, 0, v25, v23, v22, 2 * v26, v21, v20, v19, v29, 0, v18, v17,
          0,
          0);

  return v27;
}

- (ATXAction)initWithNSUserActivity:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 contentAttributeSet:(id)a6 itemIdentifier:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 criteria:(id)a10 isFutureMedia:(BOOL)a11 title:(id)a12 subtitle:(id)a13
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v33 = a4;
  id v34 = a5;
  id v19 = a6;
  id v35 = a7;
  id v36 = a8;
  id v37 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  id v46 = 0;
  dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __157__ATXAction_initWithNSUserActivity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke;
  v38[3] = &unk_1E5D05FF0;
  v40 = &v41;
  id v24 = v23;
  v39 = v24;
  [v18 _createUserActivityStringsWithOptions:0 completionHandler:v38];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v24 timeoutSeconds:1.0] == 1)
  {
    __atxlog_handle_default();
    BOOL v26 = v25 = self;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      -[ATXAction initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:](v28, buf, v26);
    }
    uint64_t v29 = 0;
LABEL_5:

    goto LABEL_10;
  }
  uint64_t v29 = (ATXAction *)v42[5];
  v25 = self;
  if (v29)
  {
    BOOL v26 = v19;
    if (!v19)
    {
      BOOL v26 = [v18 contentAttributeSet];
      v25 = self;
    }
    LOBYTE(v31) = a11;
    v25 = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](v25, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, v18, v29, v35, v26, 0, v33, v34, 1, v36, v37, v20, v31, 0, v21,
              v22,
              0,
              0));
    uint64_t v29 = v25;
    if (!v19) {
      goto LABEL_5;
    }
  }
LABEL_10:

  _Block_object_dispose(&v41, 8);
  return v29;
}

void __157__ATXAction_initWithNSUserActivity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = a2;
  if (!a5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)initFromBestAppSuggestion:(id)a3 activity:(id)a4 actionUUID:(id)a5 bundleId:(id)a6 contentAttributeSet:(id)a7 itemIdentifier:(id)a8 heuristic:(id)a9 heuristicMetadata:(id)a10 criteria:(id)a11 isFutureMedia:(BOOL)a12 title:(id)a13 subtitle:(id)a14
{
  id v38 = a3;
  id v19 = a4;
  id v37 = a5;
  id v41 = a6;
  id v20 = a7;
  id v40 = a8;
  id v39 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a13;
  id v24 = a14;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__2;
  v49 = __Block_byref_object_dispose__2;
  id v50 = 0;
  if (v19)
  {
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __169__ATXAction_initFromBestAppSuggestion_activity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke;
    v42[3] = &unk_1E5D05FF0;
    v44 = &v45;
    BOOL v26 = v25;
    uint64_t v43 = v26;
    [v19 _createUserActivityStringsWithOptions:0 completionHandler:v42];
    int v27 = [MEMORY[0x1E4F93B18] waitForSemaphore:v26 timeoutSeconds:1.0];

    uint64_t v29 = v37;
    v28 = v38;
    if (v27 == 1)
    {
      v30 = 0;
      uint64_t v31 = self;
      goto LABEL_11;
    }
    uint64_t v32 = v46[5];
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v29 = v37;
    v28 = v38;
  }
  id v33 = v20;
  if (!v20)
  {
    id v33 = [v19 contentAttributeSet];
  }
  LOBYTE(v35) = a12;
  uint64_t v31 = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v28, v19, v32, v40, v33, 0, v29, v41, 5, v39, v21, v22, v35, 0, v23,
            v24,
            0,
            0));
  if (!v20) {

  }
  v30 = v31;
LABEL_11:
  _Block_object_dispose(&v45, 8);

  return v30;
}

void __169__ATXAction_initFromBestAppSuggestion_activity_actionUUID_bundleId_contentAttributeSet_itemIdentifier_heuristic_heuristicMetadata_criteria_isFutureMedia_title_subtitle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (ATXAction)initWithNSUserActivityString:(id)a3 actionUUID:(id)a4 bundleId:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 heuristic:(id)a8 heuristicMetadata:(id)a9 isFutureMedia:(BOOL)a10 title:(id)a11 subtitle:(id)a12
{
  LOBYTE(v13) = a10;
  return -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, 0, a3, a6, a7, 0, a4, a5, 1, a8, a9, 0, v13, 0, a11, a12,
           0,
           0);
}

- (ATXAction)initWithActivityProxy:(id)a3 activity:(id)a4 activityString:(id)a5 itemIdentifier:(id)a6 contentAttributeSet:(id)a7 intent:(id)a8 actionUUID:(id)a9 bundleId:(id)a10 type:(unint64_t)a11 heuristic:(id)a12 heuristicMetadata:(id)a13 criteria:(id)a14 isFutureMedia:(BOOL)a15 routeInfo:(id)a16 title:(id)a17 subtitle:(id)a18 languageCode:(id)a19 cachedHash:(id)a20
{
  id v53 = a3;
  id v49 = a4;
  id v63 = a4;
  id v50 = a5;
  unint64_t v24 = (unint64_t)a5;
  id v51 = a6;
  id v67 = a6;
  id v66 = a7;
  id v52 = a8;
  unint64_t v25 = (unint64_t)a8;
  id v61 = a9;
  id v26 = a10;
  id v59 = a12;
  id v58 = a13;
  id v57 = a14;
  id v56 = a16;
  id v55 = a17;
  id v54 = a18;
  id v27 = a19;
  id v28 = a20;
  v60 = v26;
  if (!v26)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"ATXAction.m", 272, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  BOOL v29 = (v24 | v25) != 0;
  v30 = (void *)v24;
  v62 = (void *)v25;
  if (!v53 && !(v24 | v25))
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = self;
    [v33 handleFailureInMethod:a2, self, @"ATXAction.m", 273, @"Invalid parameter not satisfying: %@", @"intent || activityString || userActivityProxy" object file lineNumber description];
    uint64_t v31 = v67;
LABEL_24:

    goto LABEL_10;
  }
  uint64_t v31 = v67;
  uint64_t v32 = self;
  if (v53)
  {
    if (!v29) {
      goto LABEL_10;
    }
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ATXAction.m", 275, @"Invalid parameter not satisfying: %@", @"!intent && !activityString" object file lineNumber description];
    goto LABEL_24;
  }
  if (v30 && v25)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"ATXAction.m", 277, @"Invalid parameter not satisfying: %@", @"!(intent && activityString)" object file lineNumber description];
    goto LABEL_24;
  }
LABEL_10:
  if (a11 >= 6)
  {
    id v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, v32, @"ATXAction.m", 279, @"Invalid parameter not satisfying: %@", @"actionType < ATXActionTypeMax" object file lineNumber description];
  }
  v68.receiver = v32;
  v68.super_class = (Class)ATXAction;
  id v34 = [(ATXAction *)&v68 init];
  uint64_t v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_userActivityProxy, a3);
    objc_storeStrong((id *)&v35->_userActivity, v49);
    objc_storeStrong((id *)&v35->_userActivityString, v50);
    objc_storeStrong((id *)&v35->_itemIdentifier, v51);
    if (v66) {
      id v36 = (CSSearchableItemAttributeSet *)v66;
    }
    else {
      id v36 = (CSSearchableItemAttributeSet *)objc_opt_new();
    }
    contentAttributeSet = v35->_contentAttributeSet;
    v35->_contentAttributeSet = v36;

    objc_storeStrong((id *)&v35->_lazyIntent, v52);
    objc_storeStrong((id *)&v35->_actionUUID, a9);
    objc_storeStrong((id *)&v35->_bundleId, a10);
    v35->_actionType = a11;
    objc_storeStrong((id *)&v35->_heuristic, a12);
    objc_storeStrong((id *)&v35->_heuristicMetadata, a13);
    objc_storeStrong((id *)&v35->_criteria, a14);
    v35->_isFutureMedia = a15;
    objc_storeStrong((id *)&v35->_routeInfo, a16);
    objc_storeStrong((id *)&v35->_title, a17);
    objc_storeStrong((id *)&v35->_subtitle, a18);
    if (v27)
    {
      id v38 = (NSString *)v27;
      languageCode = v35->_languageCode;
      v35->_languageCode = v38;
    }
    else
    {
      languageCode = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v40 = [languageCode localeIdentifier];
      id v41 = v35->_languageCode;
      v35->_languageCode = (NSString *)v40;
    }
    v35->_isTVWhiteListedLongFormMediaDoNotUseDirectly = 0;
    objc_storeStrong((id *)&v35->_cachedHash, a20);
    [(ATXLazyIntent *)v35->_lazyIntent setDelegate:v35];
    v42 = [MEMORY[0x1E4F4B640] sharedInstance];
    [v42 registerObserver:v35];

    uint64_t v31 = v67;
    if ([(ATXLazyIntent *)v35->_lazyIntent isDeserialized])
    {
      uint64_t v43 = [(ATXLazyIntent *)v35->_lazyIntent intent];
      [(ATXAction *)v35 setLaunchIdForIntent:v43];
    }
  }

  return v35;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F4B640] sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXAction;
  [(ATXAction *)&v4 dealloc];
}

- (ATXAction)actionWithRouteInfo:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [ATXAction alloc];
    LOBYTE(v8) = self->_isFutureMedia;
    v6 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](v5, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", 0, self->_userActivity, self->_userActivityString, self->_itemIdentifier, self->_contentAttributeSet, self->_lazyIntent, self->_actionUUID, self->_bundleId, self->_actionType, self->_heuristic, self->_heuristicMetadata, self->_criteria, v8, v4, self->_title, self->_subtitle,
           self->_languageCode,
           self->_cachedHash);
  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (BOOL)isTVWhiteListedLongFormMedia
{
  v3 = [(ATXAction *)self intent];
  if (+[ATXAction _isTVIntent:v3 bundleId:self->_bundleId])
  {
    id v4 = v3;
    uint64_t v5 = [v4 proxiedBundleIdentifier];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 proxiedBundleIdentifier];
      BOOL v8 = +[ATXAVRoutingUtils isTVExperienceAppWithBundleId:v7];

      if (v8) {
        self->_BOOL isTVWhiteListedLongFormMediaDoNotUseDirectly = 1;
      }
    }
  }
  BOOL isTVWhiteListedLongFormMediaDoNotUseDirectly = self->_isTVWhiteListedLongFormMediaDoNotUseDirectly;

  return isTVWhiteListedLongFormMediaDoNotUseDirectly;
}

+ (BOOL)_isTVIntent:(id)a3 bundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[ATXAVRoutingUtils isTVAppWithBundleId:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXAction *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXAction *)self isEqualToAction:v5];

  return v6;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v4 = (id *)a3;
  bundleId = self->_bundleId;
  BOOL v6 = (NSString *)v4[10];
  if (bundleId == v6)
  {
  }
  else
  {
    BOOL v7 = v6;
    BOOL v8 = bundleId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_28;
    }
  }
  p_unint64_t actionType = &self->_actionType;
  unint64_t actionType = self->_actionType;
  if ((id)actionType == v4[11])
  {
    if (actionType <= 6)
    {
      if (((1 << actionType) & 0x58) != 0)
      {
        id v22 = __atxlog_handle_default();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ATXAction isEqualToAction:]((uint64_t)p_actionType, v22, v23, v24, v25, v26, v27, v28);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Encountered invalid ATXActionType value: %tu", *p_actionType);
        goto LABEL_28;
      }
      if (((1 << actionType) & 5) != 0)
      {
        v12 = [(ATXAction *)self intent];
        uint64_t v13 = [v12 _className];
        v14 = [v4 intent];
        v15 = [v14 _className];
        int v16 = [v13 isEqual:v15];

        if (!v16) {
          goto LABEL_28;
        }
        id v17 = [(ATXAction *)self intent];
        id v18 = objc_msgSend(v17, "atx_nonNilParametersByName");
        id v19 = [v4 intent];
        id v20 = objc_msgSend(v19, "atx_nonNilParametersByName");
        char v21 = objc_msgSend(v18, "atx_isFuzzyMatch:", v20);

        if ((v21 & 1) == 0) {
          goto LABEL_28;
        }
      }
      else
      {
        unint64_t v29 = [(ATXAction *)self userActivityHash];
        if (v29 != [v4 userActivityHash]) {
          goto LABEL_28;
        }
      }
    }
    heuristic = self->_heuristic;
    uint64_t v31 = (NSString *)v4[14];
    if (heuristic == v31)
    {
    }
    else
    {
      uint64_t v32 = v31;
      id v33 = heuristic;
      char v34 = [(NSString *)v33 isEqual:v32];

      if ((v34 & 1) == 0) {
        goto LABEL_28;
      }
    }
    if (self->_isFutureMedia == *((unsigned __int8 *)v4 + 73))
    {
      if ([(ATXAction *)self isHeuristic])
      {
        title = self->_title;
        id v36 = (NSString *)v4[4];
        if (title == v36)
        {
        }
        else
        {
          id v37 = v36;
          id v38 = title;
          char v39 = [(NSString *)v38 isEqual:v37];

          if ((v39 & 1) == 0) {
            goto LABEL_28;
          }
        }
        subtitle = self->_subtitle;
        id v41 = (NSString *)v4[5];
        if (subtitle == v41)
        {
        }
        else
        {
          v42 = v41;
          uint64_t v43 = subtitle;
          char v44 = [(NSString *)v43 isEqual:v42];

          if ((v44 & 1) == 0) {
            goto LABEL_28;
          }
        }
      }
      BOOL v45 = 1;
      goto LABEL_29;
    }
  }
LABEL_28:
  BOOL v45 = 0;
LABEL_29:

  return v45;
}

- (void)invalidateCachedHash
{
  obj = self;
  objc_sync_enter(obj);
  cachedHash = obj->_cachedHash;
  obj->_cachedHash = 0;

  objc_sync_exit(obj);
}

- (unint64_t)hash
{
  v2 = self;
  objc_sync_enter(v2);
  cachedHash = v2->_cachedHash;
  if (cachedHash)
  {
    unint64_t v4 = [(NSNumber *)cachedHash unsignedIntegerValue];
  }
  else
  {
    unint64_t v4 = [(ATXAction *)v2 _hash];
    uint64_t v5 = [objc_alloc(NSNumber) initWithUnsignedInteger:v4];
    BOOL v6 = v2->_cachedHash;
    v2->_cachedHash = (NSNumber *)v5;
  }
  objc_sync_exit(v2);

  return v4;
}

- (unint64_t)_hash
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(ATXAction *)self userActivityHash];
  unint64_t v4 = self->_actionType - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_bundleId hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_heuristic hash];
  unint64_t v7 = self->_isFutureMedia - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  if ([(ATXAction *)self isHeuristic])
  {
    NSUInteger v8 = [(NSString *)self->_title hash] - v7 + 32 * v7;
    unint64_t v7 = [(NSString *)self->_subtitle hash] - v8 + 32 * v8;
  }
  char v9 = [(ATXAction *)self intent];
  v10 = v9;
  unint64_t actionType = self->_actionType;
  if ((!actionType || actionType == 2) && v9)
  {
    v12 = objc_msgSend(v9, "atx_nonNilParameters");
    unint64_t v7 = [(ATXAction *)self hashSlotSetWithNonNilParameters:v12] - v7 + 32 * v7;
    id v37 = v10;
    uint64_t v39 = objc_msgSend(v10, "atx_nonNilParametersByName");
    uint64_t v13 = [v12 allObjects];
    v14 = [v13 sortedArrayUsingSelector:sel_compare_];

    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    id v15 = v12;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v46;
      id v20 = (void *)v38;
      id v19 = (void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (!v15 || [v15 containsObject:*(void *)(*((void *)&v45 + 1) + 8 * i)])
          {
            uint64_t v23 = [v22 hash];
            uint64_t v24 = [v19 objectForKeyedSubscript:v22];
            uint64_t v25 = v24;
            if (v24)
            {
              id v26 = v24;
            }
            else
            {
              id v26 = [MEMORY[0x1E4F1CA98] null];
            }
            uint64_t v27 = v26;
            unint64_t v7 = v23 - v7 + 32 * v7;

            [v20 addObject:v27];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unint64_t v28 = objc_msgSend(v27, "atx_locationHashWithLevel:", 17);
                unint64_t v7 = 31 * (31 * v7 + HIDWORD(v28)) + v28;
              }
              else
              {
                unint64_t v29 = [v27 location];
                unint64_t v30 = objc_msgSend(v29, "atx_locationHashWithLevel:", 17);
                unint64_t v7 = 31 * (31 * v7 + HIDWORD(v30)) + v30;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v43 = 0u;
                long long v44 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                id v31 = v27;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v34 = *(void *)v42;
                  do
                  {
                    for (uint64_t j = 0; j != v33; ++j)
                    {
                      if (*(void *)v42 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      unint64_t v7 = [*(id *)(*((void *)&v41 + 1) + 8 * j) hash] - v7 + 32 * v7;
                    }
                    uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
                  }
                  while (v33);
                }

                id v20 = (void *)v38;
                id v19 = (void *)v39;
              }
              else
              {
                unint64_t v7 = [v27 hash] - v7 + 32 * v7;
              }
            }
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v17);
    }
    else
    {
      id v20 = (void *)v38;
      id v19 = (void *)v39;
    }

    v10 = v37;
  }

  return v7;
}

- (unint64_t)paramHash
{
  unint64_t v3 = [(ATXAction *)self slotSet];
  unint64_t v4 = [[ATXSlotResolutionParameters alloc] initWithAction:self slots:v3];
  unint64_t v5 = [(ATXSlotResolutionParameters *)v4 hash];

  return v5;
}

- (id)slotSet
{
  if ((self->_actionType | 2) == 2)
  {
    unint64_t v3 = [ATXSlotSet alloc];
    unint64_t v4 = [(ATXAction *)self intent];
    unint64_t v5 = objc_msgSend(v4, "atx_nonNilParameters");
    NSUInteger v6 = [(ATXSlotSet *)v3 initWithParameters:v5];
  }
  else
  {
    NSUInteger v6 = [[ATXSlotSet alloc] initWithOpaqueParameters];
  }

  return v6;
}

- (ATXAction)initWithProto:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      NSUInteger v6 = [v5 intent];
      if (v6) {
        unint64_t v7 = [[ATXLazyIntent alloc] initWithIntentData:v6];
      }
      else {
        unint64_t v7 = 0;
      }
      char v9 = [v5 userActivityProxy];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        v11 = (void *)MEMORY[0x1AD0D3C30]();
        v12 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v13 = objc_opt_class();
        v14 = [v5 userActivityProxy];
        id v79 = 0;
        uint64_t v10 = [v12 unarchivedObjectOfClass:v13 fromData:v14 error:&v79];
        id v15 = v79;

        if (v15)
        {
          uint64_t v16 = __atxlog_handle_default();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            -[ATXAction initWithProto:]();
          }
        }
      }
      if (!(v10 | v7))
      {
        uint64_t v17 = [v5 activityString];

        if (!v17) {
          goto LABEL_27;
        }
      }
      uint64_t v18 = [v5 bundleId];

      if (v18
        && ([v5 uuid], id v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
      {
        id v20 = objc_alloc(MEMORY[0x1E4F29128]);
        char v21 = [v5 uuid];
        id v22 = (void *)[v20 initWithUUIDString:v21];

        if (v22)
        {
          v72 = v22;
          uint64_t v23 = [v5 contentAttributeSet];
          uint64_t v24 = [v23 length];

          v73 = (ATXLazyIntent *)v7;
          if (v24)
          {
            uint64_t v25 = (void *)MEMORY[0x1AD0D3C30]();
            id v26 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v27 = objc_opt_class();
            unint64_t v28 = [v5 contentAttributeSet];
            id v78 = 0;
            v71 = [v26 unarchivedObjectOfClass:v27 fromData:v28 error:&v78];
            id v29 = v78;

            if (v29)
            {
              unint64_t v30 = __atxlog_handle_default();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                -[ATXAction initWithProto:]();
              }
            }
          }
          else
          {
            v71 = 0;
          }
          id v31 = [v5 heuristicMetadatas];
          uint64_t v32 = [v31 count];

          uint64_t v67 = v10;
          objc_super v68 = v6;
          if (v32)
          {
            id v33 = objc_alloc(MEMORY[0x1E4F1CA60]);
            uint64_t v34 = [v5 heuristicMetadatas];
            uint64_t v35 = objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v36 = [v5 heuristicMetadatas];
            uint64_t v37 = [v36 countByEnumeratingWithState:&v74 objects:v80 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v75;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v75 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  long long v41 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                  long long v42 = [v41 key];

                  if (v42)
                  {
                    long long v43 = [v41 value];
                    long long v44 = [v41 key];
                    [v35 setObject:v43 forKeyedSubscript:v44];
                  }
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v74 objects:v80 count:16];
              }
              while (v38);
            }
          }
          else
          {
            uint64_t v35 = 0;
          }
          long long v45 = [v5 predictableParameterCombinations];
          uint64_t v46 = [v45 count];

          if (v46)
          {
            long long v47 = [v5 predictableParameterCombinations];
            uint64_t v48 = objc_msgSend(v47, "_pas_mappedArrayWithTransform:", &__block_literal_global_15);
          }
          else
          {
            uint64_t v48 = 0;
          }
          id v66 = (void *)v48;
          if ([v5 hasCachedHash]) {
            v70 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSObject cachedHash](v5, "cachedHash"));
          }
          else {
            v70 = 0;
          }
          v65 = [v5 activityString];
          id v63 = [v5 itemIdentifier];
          v69 = [v5 bundleId];
          uint64_t v62 = [v5 actionType];
          v60 = [v5 heuristic];
          id v49 = [ATXActionCriteria alloc];
          v64 = [v5 criteria];
          id v58 = [(ATXActionCriteria *)v49 initWithProto:v64];
          char v59 = [v5 isFutureMedia];
          id v50 = [ATXAVRouteInfo alloc];
          id v61 = [v5 routeInfo];
          id v57 = [(ATXAVRouteInfo *)v50 initWithProto:v61];
          uint64_t v51 = [v5 title];
          id v52 = [v5 subtitle];
          id v53 = [v5 languageCode];
          LOBYTE(v56) = v59;
          uint64_t v10 = v67;
          id v54 = -[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v67, 0, v65, v63, v71, v73, v72, v69, v62, v60, v35, v58, v56, v57, v51, v52,
                  v53,
                  v70);

          if (v54)
          {
            [(ATXAction *)v54 _setUserActivityHash:[v5 userActivityHash]];
            objc_storeStrong((id *)&v54->_predictableParameterCombinations, v66);
          }
          self = v54;

          NSUInteger v8 = self;
          NSUInteger v6 = v68;
          id v22 = v72;
          unint64_t v7 = (unint64_t)v73;
        }
        else
        {
          NSUInteger v8 = 0;
        }
      }
      else
      {
LABEL_27:
        NSUInteger v8 = 0;
      }
    }
    else
    {
      unint64_t v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXAction initWithProto:]((uint64_t)self, v5);
      }
      NSUInteger v8 = 0;
    }
  }
  else
  {
    NSUInteger v8 = 0;
  }

  return v8;
}

ATXActionPredictableParameters *__27__ATXAction_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [ATXActionPredictableParameters alloc];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  unint64_t v5 = [v2 parameterKeys];

  if (v5) {
    NSUInteger v6 = v5;
  }
  else {
    NSUInteger v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  unint64_t v7 = (void *)[v4 initWithArray:v6];
  NSUInteger v8 = [(ATXActionPredictableParameters *)v3 initWithParameterKeys:v7];

  return v8;
}

- (void)setLaunchIdForIntent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    unint64_t v5 = [v4 launchId];

    id v4 = v6;
    if (!v5)
    {
      [v6 _setLaunchId:self->_bundleId];
      id v4 = v6;
    }
  }
}

- (INIntent)intent
{
  return [(ATXLazyIntent *)self->_lazyIntent intent];
}

- (void)handleMemoryPressure
{
}

- (ATXAction)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [[ATXPBAction alloc] initWithData:v4];

    self = [(ATXAction *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  id v2 = [(ATXAction *)self proto];
  unint64_t v3 = [v2 data];

  return v3;
}

- (id)proto
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(ATXAction *)self bundleId];
  [v3 setBundleId:v4];

  objc_msgSend(v3, "setActionType:", -[ATXAction actionType](self, "actionType"));
  unint64_t v5 = [(ATXAction *)self heuristic];
  [v3 setHeuristic:v5];

  objc_msgSend(v3, "setIsFutureMedia:", -[ATXAction isFutureMedia](self, "isFutureMedia"));
  id v6 = [(ATXAction *)self _title];
  [v3 setTitle:v6];

  unint64_t v7 = [(ATXAction *)self _subtitle];
  [v3 setSubtitle:v7];

  objc_msgSend(v3, "setUserActivityHash:", -[ATXAction userActivityHash](self, "userActivityHash"));
  NSUInteger v8 = [(ATXAction *)self userActivityString];
  [v3 setActivityString:v8];

  char v9 = [(ATXAction *)self itemIdentifier];
  [v3 setItemIdentifier:v9];

  uint64_t v10 = [(ATXAction *)self actionUUID];
  v11 = [v10 UUIDString];
  [v3 setUuid:v11];

  [v3 setLanguageCode:self->_languageCode];
  v12 = [(ATXAVRouteInfo *)self->_routeInfo proto];
  [v3 setRouteInfo:v12];

  uint64_t v13 = [(ATXActionCriteria *)self->_criteria proto];
  [v3 setCriteria:v13];

  uint64_t v14 = objc_msgSend(v3, "setCachedHash:", -[ATXAction hash](self, "hash"));
  if (self->_contentAttributeSet)
  {
    id v15 = (void *)MEMORY[0x1AD0D3C30](v14);
    contentAttributeSet = self->_contentAttributeSet;
    id v45 = 0;
    uint64_t v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:contentAttributeSet requiringSecureCoding:1 error:&v45];
    id v18 = v45;
    [v3 setContentAttributeSet:v17];

    if (v18)
    {
      id v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[ATXAction proto]();
      }
    }
  }
  if (self->_heuristicMetadata)
  {
    id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_heuristicMetadata, "count"));
    heuristicMetadata = self->_heuristicMetadata;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __18__ATXAction_proto__block_invoke;
    v43[3] = &unk_1E5D06038;
    id v44 = v20;
    id v22 = v20;
    [(NSDictionary *)heuristicMetadata enumerateKeysAndObjectsUsingBlock:v43];
    [v3 setHeuristicMetadatas:v22];
  }
  uint64_t v23 = [(ATXLazyIntent *)self->_lazyIntent intentData];

  if (v23)
  {
    id v24 = [(ATXLazyIntent *)self->_lazyIntent intentData];
    [v3 setIntent:v24];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v35 = [(ATXAction *)self intent];

  if (v35)
  {
    id v36 = (void *)MEMORY[0x1AD0D3C30]();
    uint64_t v37 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v38 = [(ATXAction *)self intent];
    id v42 = 0;
    uint64_t v39 = [v37 archivedDataWithRootObject:v38 requiringSecureCoding:1 error:&v42];
    id v24 = v42;
    [v3 setIntent:v39];

    if (v24)
    {
      uint64_t v40 = __atxlog_handle_default();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        -[ATXAction proto]();
      }
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v25 = [(ATXAction *)self userActivityProxy];

  if (v25)
  {
    id v26 = (void *)MEMORY[0x1AD0D3C30]();
    uint64_t v27 = (void *)MEMORY[0x1E4F28DB0];
    unint64_t v28 = [(ATXAction *)self userActivityProxy];
    id v41 = 0;
    id v29 = [v27 archivedDataWithRootObject:v28 requiringSecureCoding:1 error:&v41];
    id v30 = v41;
    [v3 setUserActivityProxy:v29];

    if (v30)
    {
      id v31 = __atxlog_handle_default();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[ATXAction proto]();
      }
    }
  }
  if ([(NSArray *)self->_predictableParameterCombinations count])
  {
    uint64_t v32 = [(NSArray *)self->_predictableParameterCombinations _pas_mappedArrayWithTransform:&__block_literal_global_105];
    id v33 = (void *)[v32 mutableCopy];
    [v3 setPredictableParameterCombinations:v33];
  }

  return v3;
}

void __18__ATXAction_proto__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  unint64_t v7 = objc_alloc_init(ATXPBHeuristicMetadata);
  [(ATXPBHeuristicMetadata *)v7 setKey:v6];

  [(ATXPBHeuristicMetadata *)v7 setValue:v5];
  [*(id *)(a1 + 32) addObject:v7];
}

ATXPBPredictableParameters *__18__ATXAction_proto__block_invoke_102(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = objc_alloc_init(ATXPBPredictableParameters);
  id v4 = [v2 parameterKeys];

  id v5 = (void *)[v4 mutableCopy];
  [(ATXPBPredictableParameters *)v3 setParameterKeys:v5];

  return v3;
}

- (unint64_t)hashSlotSetWithNonNilParameters:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "hash", (void)v12);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ((v4 ^ HIDWORD(v4)) <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v4 ^ HIDWORD(v4);
  }

  return v10;
}

- (void)_setUserActivityHash:(unint64_t)a3
{
  self->_userActivityHash = a3;
}

- (unint64_t)userActivityHash
{
  id v2 = self;
  objc_sync_enter(v2);
  if ((v2->_actionType | 4) == 5 && !v2->_userActivityHash)
  {
    id v3 = [(ATXAction *)v2 userActivity];
    unint64_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 userInfo];
      uint64_t v6 = [v4 activityType];
      uint64_t v7 = [v4 webpageURL];
      v2->_unint64_t userActivityHash = +[ATXAction _userActivityHashForUserInfoDict:v5 activityType:v6 webpageURL:v7];
    }
    else
    {
      v2->_unint64_t userActivityHash = -1;
    }
  }
  unint64_t userActivityHash = v2->_userActivityHash;
  objc_sync_exit(v2);

  return userActivityHash;
}

- (id)userActivityWebpageURL
{
  if ((self->_actionType | 4) == 5)
  {
    id v2 = [(ATXAction *)self userActivity];
    id v3 = [v2 webpageURL];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (unint64_t)_userActivityHashForUserInfoDict:(id)a3 activityType:(id)a4 webpageURL:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1AD0D3C30]();
  *(_OWORD *)md = 0u;
  long long v77 = 0u;
  unint64_t v10 = objc_opt_new();
  [v10 addObject:v8];
  uint64_t v51 = v9;
  uint64_t v11 = [v9 absoluteString];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  else {
    long long v13 = &stru_1EFD9B408;
  }
  [v10 addObject:v13];

  long long v14 = objc_opt_new();
  id v55 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v67 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v21 = v14;
        }
        else {
          char v21 = v55;
        }
        [v21 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v17);
  }

  [v14 sortUsingSelector:sel_compare_];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v22 = v14;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v63 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        [v10 addObject:v27];
        unint64_t v28 = [v15 objectForKeyedSubscript:v27];
        id v29 = plistableReplacementFor(v28);
        [v10 addObject:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v24);
  }

  if ([v55 count])
  {
    id v48 = v22;
    id v49 = v8;
    id v53 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v55;
    uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v73 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v54 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v59 != v54) {
            objc_enumerationMutation(obj);
          }
          id v33 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          uint64_t v34 = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v35 = [v15 objectForKeyedSubscript:v33];
          id v36 = plistableReplacementFor(v33);
          v72[0] = v36;
          uint64_t v37 = plistableReplacementFor(v35);
          v72[1] = v37;
          uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];

          id v57 = 0;
          uint64_t v39 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v38 format:100 options:0 error:&v57];
          id v40 = v57;
          if (v39)
          {
            [v53 addObject:v39];
          }
          else
          {
            id v41 = __atxlog_handle_default();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v71 = v40;
              _os_log_fault_impl(&dword_1A790D000, v41, OS_LOG_TYPE_FAULT, "Error serializing: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v58 objects:v73 count:16];
      }
      while (v31);
    }

    [v53 sortUsingComparator:&__block_literal_global_513];
    [v10 addObject:v53];

    id v22 = v48;
    id v8 = v49;
  }
  id v56 = 0;
  id v42 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", v10, 100, 0, &v56, v48, v49);
  id v43 = v56;
  if (v42)
  {
    id v44 = v42;
    CC_SHA256((const void *)[v44 bytes], objc_msgSend(v44, "length"), md);
    if (*(void *)md <= 1uLL) {
      unint64_t v45 = 1;
    }
    else {
      unint64_t v45 = *(void *)md;
    }
  }
  else
  {
    uint64_t v46 = __atxlog_handle_default();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      +[ATXAction _userActivityHashForUserInfoDict:activityType:webpageURL:]();
    }

    unint64_t v45 = 1;
  }

  return v45;
}

- (NSString)description
{
  id v3 = objc_opt_new();
  [v3 appendFormat:@"bundleId: %@\n", self->_bundleId];
  objc_msgSend(v3, "appendFormat:", @"actionType: %lu\n", self->_actionType);
  unint64_t v4 = [(NSUUID *)self->_actionUUID UUIDString];
  [v3 appendFormat:@"actionUUID: %@\n", v4];

  [v3 appendFormat:@"heuristic: %@\n", self->_heuristic];
  [v3 appendFormat:@"itemIdentifier: %@\n", self->_itemIdentifier];
  if (self->_isFutureMedia) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"isFutureMedia: %@\n", v5];
  [v3 appendFormat:@"criteria: %@\n", self->_criteria];
  if (ATXDetailedActionLoggingEnabled())
  {
    uint64_t v6 = [(ATXAction *)self actionTitle];
    [v3 appendFormat:@"actionTitle: %@\n", v6];

    id v7 = [(ATXAction *)self actionSubtitle];
    [v3 appendFormat:@"actionSubtitle: %@\n", v7];

    id v8 = [(ATXAction *)self actionDescription];
    [v3 appendFormat:@"actionDescription: %@\n", v8];
  }
  id v9 = (void *)[v3 copy];

  return (NSString *)v9;
}

- (BOOL)isHeuristic
{
  return self->_heuristic != 0;
}

- (id)actionDescription
{
  id v2 = @"No Intent or action";
  switch(self->_actionType)
  {
    case 0uLL:
    case 2uLL:
      unint64_t v4 = [(ATXAction *)self intent];
      id v2 = [v4 description];
      goto LABEL_6;
    case 1uLL:
    case 5uLL:
      unint64_t v4 = [(ATXAction *)self userActivity];
      id v5 = [v4 userInfo];
      uint64_t v6 = [v5 description];
      userActivityString = v6;
      if (!v6) {
        userActivityString = self->_userActivityString;
      }
      id v2 = userActivityString;

LABEL_6:
      break;
    default:
      break;
  }

  return v2;
}

- (BOOL)_shouldUseCachedTitle:(id)a3 cachedLanguageCode:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a3 length])
  {
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v8 = [v7 localeIdentifier];

    int v9 = [v8 isEqualToString:v6];
    if (v9)
    {
      unint64_t v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        long long v12 = NSStringFromClass(v11);
        int v15 = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%@ - Using cached title because there is a matching cached languageCode: %@.", (uint8_t *)&v15, 0x16u);
      }
    }
    if (self->_heuristic) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v9;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)setTitleForSerializationToCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    languageCode = self->_languageCode;
    int v9 = 138412546;
    unint64_t v10 = v5;
    __int16 v11 = 2112;
    long long v12 = languageCode;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Setting title for serialization for language code: %@.", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(ATXAction *)self actionTitle];
  title = self->_title;
  self->_title = v7;

  [(ATXAction *)self invalidateCachedHash];
}

- (void)setSubtitleForSerializationToCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    languageCode = self->_languageCode;
    int v9 = 138412546;
    unint64_t v10 = v5;
    __int16 v11 = 2112;
    long long v12 = languageCode;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%@ - Setting subtitle for serialization for language code: %@.", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(ATXAction *)self actionSubtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v7;

  [(ATXAction *)self invalidateCachedHash];
}

- (id)actionTitle
{
  if ([(ATXAction *)self _shouldUseCachedTitle:self->_title cachedLanguageCode:self->_languageCode])
  {
    id v3 = self->_title;
  }
  else
  {
    unint64_t actionType = self->_actionType;
    switch(actionType)
    {
      case 0uLL:
      case 2uLL:
        id v5 = [(ATXAction *)self intent];
        uint64_t v6 = objc_msgSend(v5, "atx_titleWithEfficientLocalization");
        break;
      case 1uLL:
        id v5 = [(ATXAction *)self userActivity];
        uint64_t v6 = [v5 title];
        break;
      case 5uLL:
        id v5 = [(ATXAction *)self userActivityProxy];
        uint64_t v6 = [v5 activityTitle];
        break;
      default:
        reportInvalidActionTypeAndCrash(actionType);
    }
    id v3 = (NSString *)v6;
  }

  return v3;
}

- (BOOL)hasActionTitle
{
  if ([(ATXAction *)self _shouldUseCachedTitle:self->_title cachedLanguageCode:self->_languageCode])
  {
    return 1;
  }
  unint64_t actionType = self->_actionType;
  switch(actionType)
  {
    case 0uLL:
    case 2uLL:
      id v5 = [(ATXAction *)self intent];
      char v3 = [v5 _hasTitle];
      goto LABEL_8;
    case 1uLL:
      id v5 = [(ATXAction *)self userActivity];
      uint64_t v6 = [v5 title];
      goto LABEL_7;
    case 5uLL:
      id v5 = [(ATXAction *)self userActivityProxy];
      uint64_t v6 = [v5 activityTitle];
LABEL_7:
      id v7 = v6;
      char v3 = [v6 length] != 0;

LABEL_8:
      break;
    default:
      reportInvalidActionTypeAndCrash(actionType);
  }
  return v3;
}

- (id)actionSubtitle
{
  if (![(ATXAction *)self _shouldUseCachedTitle:self->_subtitle cachedLanguageCode:self->_languageCode])
  {
    unint64_t actionType = self->_actionType;
    switch(actionType)
    {
      case 0uLL:
      case 2uLL:
        id v5 = [(ATXAction *)self intent];
        uint64_t v6 = objc_msgSend(v5, "atx_subtitleWithEfficientLocalization");

        goto LABEL_7;
      case 1uLL:
      case 5uLL:
        char v3 = [(CSSearchableItemAttributeSet *)self->_contentAttributeSet contentDescription];
        goto LABEL_6;
      default:
        reportInvalidActionTypeAndCrash(actionType);
    }
  }
  char v3 = self->_subtitle;
LABEL_6:
  uint64_t v6 = v3;
LABEL_7:

  return v6;
}

+ (id)getActionKeyForBundleId:(id)a3 actionType:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28E78];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithCapacity:objc_msgSend(v6, "length") + objc_msgSend(v7, "length") + objc_msgSend(@":", "length")];
  [v8 appendString:v7];

  [v8 appendString:@":"];
  [v8 appendString:v6];

  return v8;
}

- (id)dateForAction
{
  if (self->_userActivityString)
  {
    char v3 = [(ATXAction *)self actionKey];
    if (v3)
    {
      unint64_t v4 = +[ATXAction getDateFromUserActivityString:self->_userActivityString forActionKey:v3];
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)archivedDataForAction
{
  char v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  id v9 = 0;
  unint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    id v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXAction archivedDataForAction]();
    }
  }

  return v4;
}

+ (id)unarchivedActionFromData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v11];
  id v6 = v11;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7)
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ATXAction unarchivedActionFromData:]();
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)getDateFromUserActivityString:(id)a3 forActionKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"ATXAction.m", 1048, @"Invalid parameter not satisfying: %@", @"userActivityString" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_29:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"ATXAction.m", 1049, @"Invalid parameter not satisfying: %@", @"actionKey" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_29;
  }
LABEL_3:
  if (![v7 containsString:@"{"]
    || ![v7 containsString:@"}"])
  {
    goto LABEL_15;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"{}"];
  id v11 = [v7 componentsSeparatedByCharactersInSet:v10];

  if ((unint64_t)[v11 count] <= 1)
  {

LABEL_15:
    long long v12 = 0;
    goto LABEL_16;
  }
  long long v12 = [v11 objectAtIndexedSubscript:1];
  if ((unint64_t)[v12 length] >= 2)
  {
    uint64_t v13 = [v12 substringFromIndex:1];

    long long v12 = (void *)v13;
  }

  if (!v12) {
    goto LABEL_16;
  }
  if ([v9 isEqualToString:@"com.apple.news:NSUA_com.apple.news.articleViewing"])
  {
    long long v14 = [a1 _extractValueInKeyValueBlob:v12 withKey:@"contentURL"];
    if (v14)
    {
      uint64_t v26 = 0;
      int v15 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(19|20)\\d\\d[-/\\.](0[1-9]|1[012])[-/\\.](0[1-9]|[12][0-9]|3[01])" options:1 error:&v26];
      uint64_t v16 = objc_msgSend(v15, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));
      id v18 = 0;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = objc_msgSend(v14, "substringWithRange:", v16, v17);
        id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v20 setDateFormat:@"yyyy-MM-dd"];
        id v18 = [v20 dateFromString:v19];
      }
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ([v9 isEqualToString:@"com.apple.mobilecal:NSUA_com.apple.calendar.continuity.event_selection"])
  {
    id v22 = @"com.apple.calendarUIKit.userActivity.endDate";
    goto LABEL_24;
  }
  if (![v9 isEqualToString:@"com.apple.mobilecal:NSUA_com.apple.calendar.continuity.date_selection"])
  {
LABEL_16:
    id v18 = 0;
    goto LABEL_17;
  }
  id v22 = @"com.apple.calendarUIKit.userActivity.date";
LABEL_24:
  uint64_t v23 = [a1 _extractValueInKeyValueBlob:v12 withKey:v22];
  long long v14 = v23;
  if (!v23)
  {
LABEL_26:
    id v18 = 0;
    goto LABEL_27;
  }
  id v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v23, "integerValue"));
LABEL_27:

LABEL_17:

  return v18;
}

+ (id)getNSUATypefromActivityType:(id)a3
{
  return (id)[@"NSUA_" stringByAppendingString:a3];
}

+ (id)_extractValueInKeyValueBlob:(id)a3 withKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(a3, "componentsSeparatedByString:", @",'", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
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
        if ([v11 containsString:@"'="])
        {
          long long v12 = [v11 componentsSeparatedByString:@"'="];
          if ([v12 count] == 2)
          {
            uint64_t v13 = [v12 objectAtIndexedSubscript:0];
            char v14 = [v13 isEqualToString:v5];

            if (v14)
            {
              uint64_t v16 = [v12 objectAtIndexedSubscript:1];
              int v15 = [v16 stringByRemovingPercentEncoding];

              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v15 = 0;
LABEL_14:

  return v15;
}

- (id)actionKey
{
  heuristic = self->_heuristic;
  if (heuristic)
  {
    id v3 = heuristic;
    goto LABEL_20;
  }
  if ([(ATXAction *)self actionType] == 1 || [(ATXAction *)self actionType] == 5)
  {
    id v5 = [(ATXAction *)self userActivity];
    id v6 = [v5 activityType];

    if (v6)
    {
      uint64_t v7 = [(ATXAction *)self userActivity];
      uint64_t v8 = [v7 activityType];
      uint64_t v9 = +[ATXAction getNSUATypefromActivityType:v8];

      goto LABEL_10;
    }
  }
  if (![(ATXAction *)self actionType] || [(ATXAction *)self actionType] == 2)
  {
    uint64_t v7 = [(ATXAction *)self intent];
    uint64_t v9 = [v7 _className];
LABEL_10:

    unint64_t v10 = [(ATXAction *)self bundleId];

    if (v10)
    {
      if (v9)
      {
        id v11 = [(ATXAction *)self bundleId];
        id v3 = +[ATXAction getActionKeyForBundleId:v11 actionType:v9];

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[ATXAction actionKey]();
      }
    }
    else
    {
      long long v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[ATXAction actionKey]();
      }
    }
    id v3 = 0;
    goto LABEL_19;
  }
  id v3 = 0;
LABEL_20:

  return v3;
}

- (id)copyWithParameterWhitelist:(id)a3
{
  return [(ATXAction *)self copyWithParameterAllowList:a3 metadataProvider:0];
}

- (id)copyWithParameterAllowList:(id)a3 metadataProvider:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t actionType = self->_actionType;
  long long v63 = v6;
  if (actionType == 1 || v6 == 0 || actionType == 5)
  {
    id v11 = self;
  }
  else
  {
    uint64_t v13 = [(ATXAction *)self intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    int v15 = [(ATXAction *)self intent];
    uint64_t v16 = v15;
    if (isKindOfClass)
    {
      uint64_t v17 = objc_msgSend(v15, "atx_nonNilParameters");
      long long v18 = (void *)[v17 mutableCopy];

      [v18 minusSet:v6];
      long long v19 = [v16 launchId];

      if (v19)
      {
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F72CE0]);
        }
        long long v20 = [v16 launchId];
        long long v21 = [v16 appIntentIdentifier];
        id v74 = 0;
        id v22 = [v7 actionForBundleIdentifier:v20 andActionIdentifier:v21 error:&v74];
        id v23 = v74;

        if (v22)
        {
          uint64_t v24 = self;
          uint64_t v25 = [v18 allObjects];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          void v72[2] = __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke;
          v72[3] = &unk_1E5D060A8;
          id v73 = v22;
          uint64_t v26 = objc_msgSend(v25, "_pas_filteredArrayWithTest:", v72);

          if ([v26 count])
          {
            uint64_t v27 = [v16 serializedParameters];
            id v58 = v7;
            unint64_t v28 = (void *)[v27 mutableCopy];

            [v28 removeObjectsForKeys:v26];
            id v29 = objc_alloc(MEMORY[0x1E4F302B8]);
            uint64_t v30 = [v16 launchId];
            uint64_t v31 = [v16 appIntentIdentifier];
            uint64_t v32 = (void *)[v29 initWithAppBundleIdentifier:v30 appIntentIdentifier:v31 serializedParameters:v28];

            id v33 = [ATXAction alloc];
            LOBYTE(v57) = v24->_isFutureMedia;
            id v11 = [(ATXAction *)v33 initWithIntent:v32 actionUUID:v24->_actionUUID bundleId:v24->_bundleId heuristic:v24->_heuristic heuristicMetadata:v24->_heuristicMetadata criteria:0 isFutureMedia:v57 title:v24->_title subtitle:v24->_subtitle];

            id v7 = v58;
          }
          else
          {
            id v11 = v24;
          }
        }
        else
        {
          id v56 = __atxlog_handle_default();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
            -[ATXAction copyWithParameterAllowList:metadataProvider:]();
          }

          id v11 = self;
        }
      }
      else
      {
        id v55 = __atxlog_handle_default();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
          -[ATXAction copyWithParameterAllowList:metadataProvider:]();
        }

        id v11 = self;
      }
    }
    else
    {
      uint64_t v34 = [v15 _emptyCopy];

      long long v60 = self;
      uint64_t v35 = [(ATXAction *)self intent];
      id v36 = objc_msgSend(v35, "atx_nonNilParameters");
      uint64_t v37 = (void *)[v36 mutableCopy];

      [v37 intersectSet:v6];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v69 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            id v44 = objc_msgSend(v35, "atx_parameterValueForKey:", v43);
            [v34 setValue:v44 forKey:v43];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v40);
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ([v63 containsObject:@"buckets"] & 1) == 0)
      {
        id v59 = v7;
        long long v61 = objc_opt_new();
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        unint64_t v45 = [(ATXAction *)v60 intent];
        uint64_t v46 = [v45 buckets];

        obuint64_t j = v46;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v64 objects:v75 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v65;
          uint64_t v50 = 1;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v65 != v49) {
                objc_enumerationMutation(obj);
              }
              uint64_t v52 = *(void *)(*((void *)&v64 + 1) + 8 * j);
              id v53 = objc_msgSend(NSString, "stringWithFormat:", @"bucket_%i", v50 + j);
              if ([v63 containsObject:v53]) {
                [v61 addObject:v52];
              }
            }
            uint64_t v48 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
            uint64_t v50 = (v50 + j);
          }
          while (v48);
        }

        [v34 setValue:v61 forKey:@"buckets"];
        id v7 = v59;
      }
      uint64_t v54 = [ATXAction alloc];
      LOBYTE(v57) = v60->_isFutureMedia;
      id v11 = [(ATXAction *)v54 initWithIntent:v34 actionUUID:v60->_actionUUID bundleId:v60->_bundleId heuristic:v60->_heuristic heuristicMetadata:v60->_heuristicMetadata criteria:0 isFutureMedia:v57 title:0 subtitle:0];
    }
  }

  return v11;
}

uint64_t __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) parameters];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke_2;
  v10[3] = &unk_1E5D06080;
  id v11 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v10);
  id v7 = [v6 firstObject];

  uint64_t v8 = [v7 isOptional];
  return v8;
}

uint64_t __57__ATXAction_copyWithParameterAllowList_metadataProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)json
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v20[0] = self->_bundleId;
  v19[0] = @"bundleId";
  v19[1] = @"description";
  uint64_t v3 = [(ATXAction *)self actionDescription];
  uint64_t v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = (void *)v3;
  v20[1] = v3;
  v19[2] = @"type";
  long long v18 = [NSNumber numberWithUnsignedInteger:self->_actionType];
  v20[2] = v18;
  v19[3] = @"heuristic";
  heuristic = self->_heuristic;
  uint64_t v6 = (uint64_t)heuristic;
  if (!heuristic)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = (void *)v6;
  v20[3] = v6;
  v19[4] = @"criteria";
  id v7 = [(ATXAction *)self criteria];
  uint64_t v8 = [v7 json];
  v20[4] = v8;
  v19[5] = @"actionUUID";
  uint64_t v9 = [(NSUUID *)self->_actionUUID UUIDString];
  v20[5] = v9;
  v19[6] = @"actionTitle";
  unint64_t v10 = [(ATXAction *)self actionTitle];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[6] = v11;
  v19[7] = @"actionSubtitle";
  long long v12 = [(ATXAction *)self actionSubtitle];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[7] = v13;
  char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];
  if (!v12) {

  }
  if (!v10) {
  if (!heuristic)
  }

  if (!v4) {

  }
  return v14;
}

- (ATXActionCriteria)criteria
{
  criteria = self->_criteria;
  if (criteria) {
    uint64_t v3 = criteria;
  }
  else {
    uint64_t v3 = (ATXActionCriteria *)objc_opt_new();
  }

  return v3;
}

- (void)setCriteria:(id)a3
{
}

- (void)setHeuristic:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  heuristic = self->_heuristic;
  self->_heuristic = v4;

  MEMORY[0x1F41817F8](v4, heuristic);
}

- (NSUserActivity)userActivity
{
  id v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  userActivity = v2->_userActivity;
  if (!userActivity)
  {
    id v5 = (void *)MEMORY[0x1AD0D3C30](v3);
    if (([(ATXAction *)v2 actionType] == 1 || [(ATXAction *)v2 actionType] == 5)
      && v2->_userActivityString)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v2->_userActivityString secondaryString:0 optionalData:0];
      id v7 = v2->_userActivity;
      v2->_userActivity = (NSUserActivity *)v6;

      [(NSUserActivity *)v2->_userActivity setContentAttributeSet:v2->_contentAttributeSet];
    }
    userActivity = v2->_userActivity;
  }
  uint64_t v8 = userActivity;
  objc_sync_exit(v2);

  return v8;
}

- (id)predictionTypeStringForPET
{
  if ([(ATXAction *)self isHeuristic])
  {
    uint64_t v3 = [@"heuristic_" stringByAppendingString:self->_heuristic];
  }
  else if ([(ATXAction *)self isFutureMedia])
  {
    uint64_t v3 = @"upcoming_media";
  }
  else
  {
    uint64_t v3 = @"default";
  }

  return v3;
}

- (id)_bundleIdForDisplay
{
  uint64_t v3 = [(ATXAction *)self bundleId];
  uint64_t v4 = [(ATXAction *)self intent];

  if (v4)
  {
    id v5 = [(ATXAction *)self intent];
    uint64_t v6 = objc_msgSend(v5, "_intents_bundleIdForDisplay");
LABEL_7:
    uint64_t v9 = (void *)v6;
    if (v6) {
      unint64_t v10 = (void *)v6;
    }
    else {
      unint64_t v10 = v3;
    }
    id v11 = v10;

    goto LABEL_11;
  }
  id v7 = [(ATXAction *)self userActivity];
  if (v7)
  {

LABEL_6:
    id v5 = [(ATXAction *)self bundleId];
    uint64_t v6 = INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
    goto LABEL_7;
  }
  uint64_t v8 = [(ATXAction *)self userActivityProxy];

  if (v8) {
    goto LABEL_6;
  }
  id v11 = v3;
LABEL_11:

  return v11;
}

- (id)_spotlightContentType
{
  uint64_t v3 = [(ATXAction *)self intent];
  if (!v3)
  {
    if (!self->_userActivityString && !self->_userActivityProxy)
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXAction _spotlightContentType]();
      }
    }
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F30118];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(ATXAction *)self intent],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 callCapability],
        v6,
        v7 == 1))
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F300F8];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(ATXAction *)self intent],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 callCapability],
        v8,
        v9 == 2))
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F30120];
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:
    uint64_t v4 = (id *)MEMORY[0x1E4F30100];
    goto LABEL_22;
  }
  uint64_t v10 = [(ATXAction *)self routeInfo];
  if (v10
    && (id v11 = (void *)v10,
        [(ATXAction *)self routeInfo],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isExternalRoute],
        v12,
        v11,
        (v13 & 1) != 0))
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F30108];
  }
  else
  {
    uint64_t v4 = (id *)MEMORY[0x1E4F30110];
  }
LABEL_22:
  id v14 = *v4;

  return v14;
}

- (id)_title
{
  return self->_title;
}

- (id)_subtitle
{
  return self->_subtitle;
}

+ (id)actionFromProactiveSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  if (v5 == 2)
  {
    uint64_t v6 = [v3 executableSpecification];
    uint64_t v7 = [v6 executableClassString];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    char v10 = [v7 isEqualToString:v9];

    if (v10)
    {
      id v11 = [v3 executableSpecification];
      long long v12 = [v11 executableObject];

      if (v12) {
        goto LABEL_11;
      }
      char v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[ATXAction actionFromProactiveSuggestion:]();
      }
    }
    else
    {
      char v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[ATXAction actionFromProactiveSuggestion:]();
      }
      long long v12 = 0;
    }
  }
  else
  {
    long long v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)underlyingInteraction
{
  id v3 = [(ATXAction *)self intent];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F30508]);
    uint64_t v5 = [(ATXAction *)self intent];
    uint64_t v6 = (void *)[v4 initWithIntent:v5 response:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"heuristicMetadata"];

  v65[0] = 0;
  uint64_t v9 = objc_opt_class();
  char v10 = _decodeOrFail(v4, v9, @"INIntent", 0, v65);
  id v11 = v10;
  if (v65[0])
  {

    long long v12 = 0;
  }
  else
  {
    char v64 = 0;
    uint64_t v13 = objc_opt_class();
    id v14 = _decodeOrFail(v4, v13, @"userActivityProxy", 0, &v64);
    int v15 = v14;
    if (v64)
    {

      long long v12 = 0;
    }
    else
    {
      char v63 = 0;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = _decodeOrFail(v4, v16, @"userActivityStr", 0, &v63);
      long long v18 = v17;
      if (v63)
      {

        long long v12 = 0;
      }
      else
      {
        char v62 = 0;
        uint64_t v19 = objc_opt_class();
        long long v20 = _decodeOrFail(v4, v19, @"itemIdentifier", 0, &v62);
        long long v21 = v20;
        if (v62)
        {

          long long v12 = 0;
        }
        else
        {
          char v61 = 0;
          uint64_t v22 = objc_opt_class();
          id v23 = _decodeOrFail(v4, v22, @"contentAttributeSet", 0, &v61);
          uint64_t v24 = v23;
          if (v61)
          {

            long long v12 = 0;
          }
          else
          {
            if (v11) {
              uint64_t v52 = [[ATXLazyIntent alloc] initWithIntent:v11];
            }
            else {
              uint64_t v52 = 0;
            }
            char v60 = 0;
            uint64_t v25 = objc_opt_class();
            uint64_t v26 = _decodeOrFail(v4, v25, @"actionUUID", 1, &v60);
            uint64_t v27 = v26;
            if (v60)
            {

              long long v12 = 0;
            }
            else
            {
              char v59 = 0;
              uint64_t v28 = objc_opt_class();
              id v29 = _decodeOrFail(v4, v28, @"bundleId", 1, &v59);
              uint64_t v51 = v27;
              if (v59)
              {

                long long v12 = 0;
              }
              else
              {
                uint64_t v50 = v29;
                uint64_t v49 = [v4 decodeIntegerForKey:@"actionType"];
                char v58 = 0;
                uint64_t v30 = objc_opt_class();
                uint64_t v31 = _decodeOrFail(v4, v30, @"heuristic", 0, &v58);
                if (v58)
                {

                  long long v12 = 0;
                }
                else
                {
                  uint64_t v48 = v31;
                  char v57 = 0;
                  uint64_t v32 = objc_opt_class();
                  id v33 = _decodeOrFail(v4, v32, @"criteria", 0, &v57);
                  if (v57)
                  {

                    long long v12 = 0;
                  }
                  else
                  {
                    uint64_t v47 = v33;
                    char v34 = [v4 decodeBoolForKey:@"isFutureMedia"];
                    char v56 = 0;
                    uint64_t v35 = objc_opt_class();
                    id v36 = _decodeOrFail(v4, v35, @"routeInfo", 0, &v56);
                    if (v56)
                    {

                      long long v12 = 0;
                    }
                    else
                    {
                      uint64_t v46 = v36;
                      char v55 = 0;
                      uint64_t v37 = objc_opt_class();
                      unint64_t v45 = _decodeOrFail(v4, v37, @"title", 0, &v55);
                      if (v55)
                      {

                        long long v12 = 0;
                      }
                      else
                      {
                        char v54 = 0;
                        uint64_t v38 = objc_opt_class();
                        id v44 = _decodeOrFail(v4, v38, @"subtitle", 0, &v54);
                        if (v54)
                        {

                          long long v12 = 0;
                        }
                        else
                        {
                          char v53 = 0;
                          uint64_t v39 = objc_opt_class();
                          uint64_t v40 = _decodeOrFail(v4, v39, @"languageCode", 0, &v53);
                          uint64_t v41 = v40;
                          if (v53)
                          {

                            long long v12 = 0;
                          }
                          else
                          {
                            LOBYTE(v43) = v34;
                            self = objc_retain(-[ATXAction initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:](self, "initWithActivityProxy:activity:activityString:itemIdentifier:contentAttributeSet:intent:actionUUID:bundleId:type:heuristic:heuristicMetadata:criteria:isFutureMedia:routeInfo:title:subtitle:languageCode:cachedHash:", v15, 0, v18, v21, v24, v52, v51, v50, v49, v48, v8, v47, v43, v46,
                                       v45,
                                       v44,
                                       v40,
                                       0));

                            long long v12 = self;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            if (v11) {
          }
            }
        }
      }
    }
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXAction *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];
  if (v5) {
    uint64_t v6 = [(ATXAction *)self initWithProtoData:v5];
  }
  else {
    uint64_t v6 = [(ATXAction *)self _initWithCoder:v4];
  }
  uint64_t v7 = v6;

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (NSUUID)actionUUID
{
  return self->_actionUUID;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (NSDictionary)heuristicMetadata
{
  return self->_heuristicMetadata;
}

- (BOOL)isFutureMedia
{
  return self->_isFutureMedia;
}

- (NSArray)predictableParameterCombinations
{
  return self->_predictableParameterCombinations;
}

- (void)setPredictableParameterCombinations:(id)a3
{
}

- (UAUserActivityProxy)userActivityProxy
{
  return self->_userActivityProxy;
}

- (NSString)userActivityString
{
  return self->_userActivityString;
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  return self->_contentAttributeSet;
}

- (ATXAVRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (NSNumber)cachedHash
{
  return self->_cachedHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHash, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_contentAttributeSet, 0);
  objc_storeStrong((id *)&self->_userActivityString, 0);
  objc_storeStrong((id *)&self->_predictableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_heuristicMetadata, 0);
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_lazyIntent, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userActivityProxy, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

- (BOOL)isTVAction
{
  id v2 = self;
  id v3 = [(ATXAction *)self intent];
  LOBYTE(v2) = +[ATXAction _isTVIntent:v3 bundleId:v2->_bundleId];

  return (char)v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)atx_doNotDisturbForCurrentLocationActionWithTitle:(id)a3 subtitle:(id)a4 heuristicName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = initializeDNDToggleDoNotDisturbIntent();
  id v11 = v10;
  if (v10)
  {
    [v10 setValue:&unk_1EFDF4698 forKey:@"state"];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F30568]) initWithIdentifier:0 displayString:&stru_1EFD9B408];
    [v11 setValue:v12 forKey:@"location"];

    uint64_t v13 = [ATXAction alloc];
    id v14 = objc_opt_new();
    LOBYTE(v17) = 0;
    int v15 = [(ATXAction *)v13 initWithIntent:v11 actionUUID:v14 bundleId:@"com.apple.Preferences" heuristic:v9 heuristicMetadata:0 criteria:0 isFutureMedia:v17 title:v7 subtitle:v8];
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

+ (id)atx_doNotDisturbForEventActionWithTitle:(id)a3 subtitle:(id)a4 eventTitle:(id)a5 eventIdentifier:(id)a6 eventUniqueID:(id)a7 heuristicName:(id)a8
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = initializeDNDToggleDoNotDisturbIntent();
  long long v20 = v19;
  if (v19)
  {
    [v19 setValue:&unk_1EFDF4698 forKey:@"state"];
    long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F30568]) initWithIdentifier:v17 displayString:v15];
    [v20 setValue:v21 forKey:@"event"];

    if (v16)
    {
      uint64_t v28 = @"eventIdentifier";
      v29[0] = v16;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    }
    else
    {
      uint64_t v22 = 0;
    }
    uint64_t v24 = [ATXAction alloc];
    uint64_t v25 = objc_opt_new();
    LOBYTE(v27) = 0;
    id v23 = [(ATXAction *)v24 initWithIntent:v20 actionUUID:v25 bundleId:@"com.apple.Preferences" heuristic:v18 heuristicMetadata:v22 criteria:0 isFutureMedia:v27 title:v13 subtitle:v14];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)atx_startCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10 mediaType:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  uint64_t v26 = v25;
  if (!v25) {
    goto LABEL_5;
  }
  uint64_t v27 = [v25 integerValue];
  if (v27)
  {
    if (v27 == 2)
    {
      uint64_t v28 = objc_msgSend(a1, "atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_9;
    }
    if (v27 == 1)
    {
LABEL_5:
      uint64_t v28 = objc_msgSend(a1, "atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:", v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_9:
      uint64_t v30 = (void *)v28;
      goto LABEL_13;
    }
    id v29 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[ATXAction(Factory) atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:]();
    }
  }
  else
  {
    id v29 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[ATXAction(Factory) atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:]();
    }
  }

  uint64_t v30 = 0;
LABEL_13:

  return v30;
}

+ (id)atx_startVideoCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = personFromCallRecipient(a8, a6, a5);
  id v21 = objc_alloc(MEMORY[0x1E4F30760]);
  v33[0] = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v23 = (void *)[v21 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v22 callCapability:2];

  id v24 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:]();
  }

  if ([v17 isEqualToString:@"facetime"])
  {
    [v23 _setLaunchId:@"com.apple.InCallService"];
    [v23 _setExtensionBundleId:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
    [v23 setPreferredCallProvider:2];
    if (v18)
    {
      uint64_t v31 = @"eventIdentifier";
      id v32 = v18;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    }
    else
    {
      id v25 = 0;
    }
    uint64_t v27 = [ATXAction alloc];
    uint64_t v28 = objc_opt_new();
    LOBYTE(v30) = 0;
    uint64_t v26 = [(ATXAction *)v27 initWithIntent:v23 actionUUID:v28 bundleId:@"com.apple.InCallService" heuristic:v19 heuristicMetadata:v25 criteria:0 isFutureMedia:v30 title:v15 subtitle:v16];
  }
  else
  {
    id v25 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:]();
    }
    uint64_t v26 = 0;
  }

  return v26;
}

+ (id)atx_setAirplaneModeActionWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1AD0D3C30]();
  id v8 = loadIntentWithBundleIdAndName(@"com.apple.ActionKit.BundledIntentHandler", @"WFSetAirplaneModeIntent");
  id v9 = v8;
  if (v8)
  {
    [v8 _setExtensionBundleId:@"com.apple.ActionKit.BundledIntentHandler"];
    [v9 _setLaunchId:@"com.apple.ActionKit.BundledIntentHandler"];
    [v9 setValue:MEMORY[0x1E4F1CC38] forKey:@"state"];
    [v9 setValue:&unk_1EFDF4698 forKey:@"operation"];
    char v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.proactive.HeuristicInterpreter"];
    id v11 = [v10 URLForResource:@"AirplaneMode" withExtension:@"png"];

    if (v11)
    {
      long long v12 = [MEMORY[0x1E4F304C0] imageWithURL:v11];
      [v9 setImage:v12 forParameterNamed:@"state"];
    }
    id v13 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[ATXAction(Factory) atx_setAirplaneModeActionWithTitle:subtitle:]();
    }

    id v14 = [ATXAction alloc];
    id v15 = objc_opt_new();
    LOBYTE(v18) = 0;
    id v16 = [(ATXAction *)v14 initWithIntent:v9 actionUUID:v15 bundleId:@"com.apple.Preferences" heuristic:@"enableAirplaneMode" heuristicMetadata:0 criteria:0 isFutureMedia:v18 title:v5 subtitle:v6];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)atx_startAudioCallActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 callService:(id)a7 contactIdentifier:(id)a8 eventIdentifier:(id)a9 heuristicName:(id)a10
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = personFromCallRecipient(a8, a6, a5);
  id v21 = objc_alloc(MEMORY[0x1E4F30760]);
  v34[0] = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v23 = (void *)[v21 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v22 callCapability:1];

  id v24 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    +[ATXAction(Factory) atx_startVideoCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:]();
  }

  if ([v17 isEqualToString:@"phone"])
  {
    uint64_t v25 = 1;
LABEL_7:
    [v23 _setLaunchId:@"com.apple.InCallService"];
    [v23 _setExtensionBundleId:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
    [v23 setPreferredCallProvider:v25];
    [v23 setTTYType:1];
    if (v18)
    {
      id v32 = @"eventIdentifier";
      id v33 = v18;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v27 = [ATXAction alloc];
    uint64_t v28 = objc_opt_new();
    LOBYTE(v31) = 0;
    id v29 = [(ATXAction *)v27 initWithIntent:v23 actionUUID:v28 bundleId:@"com.apple.InCallService" heuristic:v19 heuristicMetadata:v26 criteria:0 isFutureMedia:v31 title:v15 subtitle:v16];

    goto LABEL_14;
  }
  if ([v17 isEqualToString:@"facetime"])
  {
    uint64_t v25 = 2;
    goto LABEL_7;
  }
  uint64_t v26 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    +[ATXAction(Factory) atx_startAudioCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:]();
  }
  id v29 = 0;
LABEL_14:

  return v29;
}

+ (id)atx_sendMessageActionWithTitle:(id)a3 subtitle:(id)a4 recipientName:(id)a5 recipientHandle:(id)a6 text:(id)a7 contactIdentifier:(id)a8 conversationIdentifier:(id)a9 eventIdentifier:(id)a10 heuristicName:(id)a11
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v35 = a10;
  id v17 = (objc_class *)MEMORY[0x1E4F305B8];
  id v37 = a11;
  id v36 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = (void *)[[v17 alloc] initWithValue:v20 type:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v24 nameComponents:0 displayName:v21 image:0 contactIdentifier:v18 customIdentifier:v20];

  id v26 = objc_alloc(MEMORY[0x1E4F306D0]);
  v40[0] = v25;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  uint64_t v28 = (void *)[v26 initWithRecipients:v27 outgoingMessageType:0 content:v19 speakableGroupName:0 conversationIdentifier:v36 serviceName:0 sender:0 attachments:0];

  if (v35)
  {
    uint64_t v38 = @"eventIdentifier";
    id v39 = v35;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  }
  else
  {
    id v29 = 0;
  }
  uint64_t v30 = [ATXAction alloc];
  uint64_t v31 = objc_opt_new();
  LOBYTE(v34) = 0;
  id v32 = [(ATXAction *)v30 initWithIntent:v28 actionUUID:v31 bundleId:@"com.apple.MobileSMS" heuristic:v37 heuristicMetadata:v29 criteria:0 isFutureMedia:v34 title:v23 subtitle:v22];

  return v32;
}

+ (id)atx_userActivityActionWithBestAppSuggestion:(id)a3 title:(id)a4 subtitle:(id)a5 bundleID:(id)a6 activityType:(id)a7 heuristicName:(id)a8
{
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4FB36D8];
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = (void *)[[v13 alloc] initWithSuggestion:v17];

  if ([v12 length])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F23850]);
    id v20 = (void *)[v19 initWithContentType:*MEMORY[0x1E4F44370]];
    [v20 setContentDescription:v12];
  }
  else
  {
    id v21 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_INFO, "BestAppSuggestion didn't have a valid subtitle, either because it was an empty string or it was 'null'.", buf, 2u);
    }

    id v20 = 0;
  }
  id v22 = [ATXAction alloc];
  id v23 = objc_opt_new();
  LOBYTE(v26) = 0;
  id v24 = [(ATXAction *)v22 initFromBestAppSuggestion:v18 activity:0 actionUUID:v23 bundleId:v15 contentAttributeSet:v20 itemIdentifier:0 heuristic:v14 heuristicMetadata:0 criteria:0 isFutureMedia:v26 title:v16 subtitle:v12];

  return v24;
}

+ (id)webUrlParsedForUserActivityWithUrlString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  if (v4
    && (id v5 = [objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:1]) != 0)
  {
    id v6 = v5;
    id v7 = [v5 scheme];
    id v8 = [v7 lowercaseString];

    if (([v8 isEqualToString:@"http"] & 1) != 0
      || ([v8 isEqualToString:@"https"] & 1) != 0)
    {

LABEL_10:
      id v4 = v4;
      id v9 = v4;
      goto LABEL_15;
    }
    char v10 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "Unsupported NSUA URL scheme: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "Invalid URL: '%@'", (uint8_t *)&v12, 0xCu);
    }
  }

  id v9 = 0;
LABEL_15:

  return v9;
}

+ (id)atx_userActivityActionWithTitle:(id)a3 subtitle:(id)a4 bundleID:(id)a5 activityType:(id)a6 urlString:(id)a7 userInfo:(id)a8 heuristicName:(id)a9
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = (__CFString *)a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v22 = [a1 webUrlParsedForUserActivityWithUrlString:v19];
  id v39 = v18;
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:v18];
  uint64_t v40 = v15;
  [v23 setTitle:v15];
  if (v20) {
    [v23 setUserInfo:v20];
  }
  if (v22) {
    [v23 setWebpageURL:v22];
  }
  id v24 = [v22 host];
  int v25 = [v24 isEqualToString:@"trackingshipment.apple.com"];

  if (objc_msgSend(v22, "atx_isOpenableFaceTimeURL"))
  {

    id v17 = @"com.apple.InCallService";
  }
  if (v22
    && (([(__CFString *)v17 isEqualToString:@"com.apple.mobilesafari"] ^ 1 | v25) & 1) == 0)
  {
    uint64_t v28 = objc_msgSend(v22, "_lp_simplifiedDisplayString");
    id v42 = @"contentDescription";
    v43[0] = v28;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    [v23 _setContentAttributes:v29];

    id v30 = objc_alloc(MEMORY[0x1E4F23850]);
    uint64_t v27 = (void *)[v30 initWithContentType:*MEMORY[0x1E4F44370]];
    [v27 setContentDescription:v28];
  }
  else if ([v16 length])
  {
    id v26 = objc_alloc(MEMORY[0x1E4F23850]);
    uint64_t v27 = (void *)[v26 initWithContentType:*MEMORY[0x1E4F44370]];
    [v27 setContentDescription:v16];
  }
  else
  {
    uint64_t v31 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_INFO, "NSUA didn't have a valid subtitle, either because it was an empty string or it was 'null'.", buf, 2u);
    }

    uint64_t v27 = 0;
  }
  id v32 = v16;
  id v33 = [ATXAction alloc];
  uint64_t v34 = objc_opt_new();
  LOBYTE(v37) = 0;
  id v35 = [(ATXAction *)v33 initWithNSUserActivity:v23 actionUUID:v34 bundleId:v17 contentAttributeSet:v27 itemIdentifier:0 heuristic:v21 heuristicMetadata:0 criteria:0 isFutureMedia:v37 title:0 subtitle:0];

  return v35;
}

+ (id)atx_updateAlarmActionWithTitle:(id)a3 subtitle:(id)a4 alarmID:(id)a5 alarmTitle:(id)a6 heuristicName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2050000000;
  id v18 = (void *)getMTUpdateAlarmIntentClass_softClass;
  uint64_t v35 = getMTUpdateAlarmIntentClass_softClass;
  if (!getMTUpdateAlarmIntentClass_softClass)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __getMTUpdateAlarmIntentClass_block_invoke;
    v31[3] = &unk_1E5D04E28;
    v31[4] = &v32;
    __getMTUpdateAlarmIntentClass_block_invoke((uint64_t)v31);
    id v18 = (void *)v33[3];
  }
  id v19 = v18;
  _Block_object_dispose(&v32, 8);
  if (!v19)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:a1 file:@"ATXAction+Factory.m" lineNumber:392 description:@"Failed to dyload MobileTimer."];
  }
  id v20 = objc_opt_new();
  [v20 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [v20 _setLaunchId:@"com.apple.mobiletimer"];
  [v20 _setNanoLaunchId:@"com.apple.NanoAlarm"];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F30568]) initWithIdentifier:v15 displayString:v16];
  [v20 setAlarmID:v21];

  id v22 = INIntentWithTypedIntent();
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = [ATXAction alloc];
      id v24 = objc_opt_new();
      LOBYTE(v30) = 0;
      int v25 = [(ATXAction *)v23 initWithIntent:v22 actionUUID:v24 bundleId:@"com.apple.mobiletimer" heuristic:v17 heuristicMetadata:0 criteria:0 isFutureMedia:v30 title:v13 subtitle:v14];

      goto LABEL_15;
    }
    uint64_t v27 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[ATXAction(Factory) atx_updateAlarmActionWithTitle:subtitle:alarmID:alarmTitle:heuristicName:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Generic intent created from MTUpdateAlarmIntent is not an INIntent object."];
  }
  else
  {
    id v26 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_updateAlarmActionWithTitle:subtitle:alarmID:alarmTitle:heuristicName:]();
    }
  }
  int v25 = 0;
LABEL_15:

  return v25;
}

+ (id)atx_setAlarmActionWithTitle:(id)a3 subtitle:(id)a4 eventIdentifier:(id)a5 eventTitle:(id)a6 alarmDate:(id)a7 heuristicName:(id)a8
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v41 = a4;
  id v42 = a5;
  id v44 = a6;
  id v45 = a7;
  id v43 = a8;
  context = (void *)MEMORY[0x1AD0D3C30]();
  id v15 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v16 = [v15 components:96 fromDate:v45];
  uint64_t v17 = [v16 hour];
  uint64_t v18 = [v16 minute];
  id v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v20 = [v15 dateBySettingHour:v17 minute:v18 second:0 ofDate:v19 options:0];

  id v21 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v20 dateStyle:0 timeStyle:1];
  id v22 = NSString;
  [v20 timeIntervalSinceReferenceDate];
  id v24 = objc_msgSend(v22, "stringWithFormat:", @"%f", v23);
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2050000000;
  int v25 = (void *)getMTCreateAlarmIntentClass_softClass;
  uint64_t v50 = getMTCreateAlarmIntentClass_softClass;
  if (!getMTCreateAlarmIntentClass_softClass)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __getMTCreateAlarmIntentClass_block_invoke;
    v46[3] = &unk_1E5D04E28;
    v46[4] = &v47;
    __getMTCreateAlarmIntentClass_block_invoke((uint64_t)v46);
    int v25 = (void *)v48[3];
  }
  id v26 = v25;
  _Block_object_dispose(&v47, 8);
  if (!v26)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"ATXAction+Factory.m" lineNumber:443 description:@"Failed to dyload MobileTimer."];
  }
  uint64_t v27 = objc_opt_new();
  [v27 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [v27 _setLaunchId:@"com.apple.mobiletimer"];
  [v27 _setNanoLaunchId:@"com.apple.NanoAlarm"];
  [v27 setRequiresAppLaunch:1];
  [v27 setLabel:v44];
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F30568]) initWithIdentifier:v24 displayString:v21];
  [v27 setTime:v28];

  id v29 = INIntentWithTypedIntent();
  if (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v42)
      {
        uint64_t v51 = @"eventIdentifier";
        v52[0] = v42;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v34 = [ATXAction alloc];
      uint64_t v35 = objc_opt_new();
      LOBYTE(v38) = 0;
      id v33 = [(ATXAction *)v34 initWithIntent:v29 actionUUID:v35 bundleId:@"com.apple.mobiletimer" heuristic:v43 heuristicMetadata:v30 criteria:0 isFutureMedia:v38 title:v40 subtitle:v41];

      goto LABEL_18;
    }
    uint64_t v32 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[ATXAction(Factory) atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Generic intent created from MTCreateAlarmIntent is not an INIntent object."];
  }
  else
  {
    uint64_t v31 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:]();
    }
  }
  id v33 = 0;
LABEL_18:

  return v33;
}

+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8
{
  return (id)objc_msgSend(a1, "atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)atx_showCheckInActionWithTeamId:(id)a3 userActivityString:(id)a4 subtitle:(id)a5 overrideBundleId:(id)a6 suggestedEventUniqueKey:(id)a7 heuristicName:(id)a8 criteria:(id)a9
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (![v14 length])
  {
    id v24 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:]();
    }
    goto LABEL_15;
  }
  if (![v15 length])
  {
    id v24 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:]();
    }
    goto LABEL_15;
  }
  if (![v16 length])
  {
    id v24 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:]();
    }
LABEL_15:
    id v26 = 0;
    goto LABEL_36;
  }
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v15 secondaryString:0 optionalData:0];
  char v61 = v21;
  if (!v21)
  {
    uint64_t v27 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.4();
    }
    id v24 = 0;
    id v26 = 0;
    goto LABEL_35;
  }
  id v22 = v21;
  id v57 = v19;
  id v58 = v20;
  id v59 = v16;
  id v60 = v18;
  if (v17)
  {
    uint64_t v23 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v17;
      _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Using fallback bundle. Override bundle is: %@", buf, 0xCu);
    }

    id v24 = v22;
    int v25 = (__CFString *)v17;
    goto LABEL_30;
  }
  uint64_t v28 = [v21 activityType];
  uint64_t v29 = _LSCopyAdvertisementStringForTeamIdentifierAndActivityType();

  uint64_t v30 = v29;
  char v55 = [MEMORY[0x1E4F223C8] applicationRecordsForUserActivityType:v29 limit:1 error:0];
  uint64_t v31 = [v55 firstObject];
  uint64_t v32 = [v31 applicationState];
  char v54 = v31;
  if (([v32 isInstalled] & 1) == 0)
  {

    goto LABEL_25;
  }
  id v33 = [v31 bundleIdentifier];

  if (!v33)
  {
LABEL_25:
    uint64_t v38 = [v22 webpageURL];

    id v39 = __atxlog_handle_heuristic();
    id v40 = v39;
    if (!v38)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        +[ATXAction(Factory) atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:].cold.5(v22, v40);
      }

      id v24 = 0;
      id v26 = 0;
      id v20 = v58;
      uint64_t v27 = v30;
      goto LABEL_34;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v41 = [v22 activityType];
      *(_DWORD *)buf = 138412290;
      id v67 = v41;
      _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Could not find an installed app to handle activityType='%@'. Using webpageURL to handle in Safari.", buf, 0xCu);
    }
    id v42 = objc_alloc(MEMORY[0x1E4F22488]);
    id v43 = v22;
    id v24 = [v42 initWithActivityType:*MEMORY[0x1E4F28AC0]];
    id v44 = [v43 title];
    [v24 setTitle:v44];

    id v45 = [v43 webpageURL];
    [v24 setWebpageURL:v45];

    uint64_t v37 = @"com.apple.mobilesafari";
    id v36 = v54;
    goto LABEL_29;
  }
  uint64_t v34 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = [v22 activityType];
    *(_DWORD *)buf = 138412290;
    id v67 = v35;
    _os_log_impl(&dword_1A790D000, v34, OS_LOG_TYPE_INFO, "atx_showCheckInAction: Found an installed app that can handle activityType='%@'", buf, 0xCu);
  }
  id v24 = v22;
  id v36 = v54;
  uint64_t v37 = [v54 bundleIdentifier];
LABEL_29:

  int v25 = v37;
  id v16 = v59;
LABEL_30:
  id v56 = v17;
  char v64 = @"contentDescription";
  id v65 = v16;
  uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  [v24 _setContentAttributes:v46];

  id v47 = objc_alloc(MEMORY[0x1E4F23850]);
  uint64_t v48 = (void *)[v47 initWithContentType:*MEMORY[0x1E4F44370]];
  [v48 setContentDescription:v16];
  if (v60)
  {
    char v62 = @"uniqueKey";
    id v63 = v60;
    uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  }
  else
  {
    uint64_t v49 = 0;
  }
  uint64_t v50 = [ATXAction alloc];
  uint64_t v51 = objc_opt_new();
  LOBYTE(v53) = 0;
  id v20 = v58;
  id v26 = [(ATXAction *)v50 initWithNSUserActivity:v24 actionUUID:v51 bundleId:v25 contentAttributeSet:v48 itemIdentifier:0 heuristic:v57 heuristicMetadata:v49 criteria:v58 isFutureMedia:v53 title:0 subtitle:0];

  uint64_t v27 = v25;
  id v19 = v57;
  id v18 = v60;
  id v17 = v56;
LABEL_34:
  id v16 = v59;
LABEL_35:

LABEL_36:

  return v26;
}

- (void)initWithNSUserActivity:(os_log_t)log actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%@ - timed out trying to fetch activityString from NSUserActivity", buf, 0xCu);
}

- (void)isEqualToAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "Could not de-serialize content attribute set: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "Could not de-serialize user activity proxy from recently engaged protobufs: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAction proto", v5, 0xCu);
}

- (void)proto
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "Could not serialize content attribute set via protobufs: %@", v2, v3, v4, v5, v6);
}

+ (void)_userActivityHashForUserInfoDict:activityType:webpageURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "Error serializing: %@", v2, v3, v4, v5, v6);
}

- (void)archivedDataForAction
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Unable to archive ATXAction. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)unarchivedActionFromData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "error unarchiving action from data: %@", v2, v3, v4, v5, v6);
}

- (void)actionKey
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_8(&dword_1A790D000, v0, v1, "actionType is null to build actionKey for ATXAction %@", v2, v3, v4, v5, v6);
}

- (void)copyWithParameterAllowList:metadataProvider:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "The app intent doesn't have an app bundle id", v2, v3, v4, v5, v6);
}

- (void)copyWithParameterAllowList:metadataProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A790D000, v0, v1, "Could not obtain link action metadata: %@", v2, v3, v4, v5, v6);
}

- (void)_spotlightContentType
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "reached presumably unreachable code path in APUISpotlightContentTypeForAction", v2, v3, v4, v5, v6);
}

+ (void)actionFromProactiveSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Found nil ATXAction from ATXProactiveSuggestion with executable type Action", v2, v3, v4, v5, v6);
}

+ (void)actionFromProactiveSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "executableClassString is not ATXAction for ATXProactiveSuggestion with executable type Action", v2, v3, v4, v5, v6);
}

@end