@interface SGDSuggestManager
+ (BOOL)titleSuggestionForMessageFeatureEnabled;
+ (id)contactAggregator;
+ (id)extractAttributeSetsFromRealtimeEvents:(id)a3;
+ (id)filterAttributesForDonation:(id)a3;
+ (id)filterPseudoEvents:(id)a3 keepPastEvents:(BOOL)a4 keepPartialEvents:(BOOL)a5;
+ (id)filterPseudoEvents:(id)a3 keepPastEvents:(BOOL)a4 keepPartialEvents:(BOOL)a5 keepEventsFromOldDocuments:(BOOL)a6;
+ (id)getAggregatedAttributeSet:(id)a3;
+ (id)getProcessedItemFromEvents:(id)a3 uniqueID:(id)a4 bundleID:(id)a5;
+ (id)preprocessSearchableItem:(id)a3;
+ (id)requestCache;
+ (id)simpleWritebackHandler;
+ (void)clearRequestCache;
+ (void)updateOriginalDocumentsWith:(id)a3 completionHandler:(id)a4;
- (BOOL)_canBannerUseStoredDissection:(id)a3 options:(unint64_t)a4;
- (BOOL)_harvestPeopleFromInteractions:(id)a3 bundleId:(id)a4;
- (BOOL)_isContactInteresting:(id)a3 emailEntity:(id)a4 enrichments:(id)a5 hasContactCard:(unint64_t)a6;
- (BOOL)clientIsMail;
- (BOOL)clientIsMessages;
- (BOOL)containsNonCuratedData:(id)a3;
- (BOOL)isSGEntity:(id)a3 duplicateOfEKEvent:(id)a4 withStore:(id)a5;
- (BOOL)isSearchableItemPartOfReimport:(id)a3;
- (BOOL)isSearchableItemPartOfReimportWithGetterBlock:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)persistRealtimeExtractions;
- (NSString)clientName;
- (SGDSuggestManager)initWithConnection:(id)a3 store:(id)a4;
- (SGDSuggestManager)initWithMessagesConnection:(id)a3 store:(id)a4;
- (SGDSuggestManager)initWithStore:(id)a3;
- (SGDSuggestManager)initWithStore:(id)a3 ctsManager:(id)a4 ekStoreProvider:(id)a5 contactStore:(id)a6 pet2Tracker:(id)a7;
- (SGMContactDetailUsedApp_)_appEnumForBundleId:(id)a3;
- (SGServiceContext)context;
- (id)_emailContentCacheSalt;
- (id)_mapToPseudoEvents:(id)a3;
- (id)_maybeFormatString;
- (id)_pmlTraining;
- (id)_showInFormatStringWithLocalization:(id)a3;
- (id)cachedResultForKey:(id)a3 generateResult:(id)a4 validateResults:(id)a5;
- (id)consumeInteractionWithContext:(id)a3;
- (id)consumeMailContentWithContext:(id)a3;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumerName;
- (id)createLaunchIntentForStorageEvent:(id)a3;
- (id)curatedEventKeyForExactMatchOfPseudoEvent:(id)a3 candidates:(id)a4;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (id)entityFromUniqueKey:(id)a3;
- (id)filterRealtimeEvents:(id)a3;
- (id)filterRealtimeReminders:(id)a3;
- (id)getPet2Tracker;
- (id)harvestStore;
- (id)lastSuggestionsFromMessageLock;
- (id)lastSuggestionsFromMessageRequest;
- (id)lastSuggestionsFromMessageResponse;
- (id)messageHarvestQueue;
- (id)realtimeContactsFromEntity:(id)a3 enrichments:(id)a4 sourceTextMessage:(id)a5 store:(id)a6;
- (id)realtimeWalletOrdersFromEntity:(id)a3 enrichments:(id)a4;
- (id)realtimeWalletPassesFromEntity:(id)a3 enrichments:(id)a4;
- (id)recentlyHarvestedDetailLock;
- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 enrichments:(id)a4 store:(id)a5;
- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 message:(id)a4 enrichments:(id)a5 store:(id)a6 keepPastEvents:(BOOL)a7 keepPartialEvents:(BOOL)a8 keepEventsFromOldDocuments:(BOOL)a9;
- (id)storageContactFromRecordId:(id)a3;
- (unsigned)interfaceForRealtimeReminder:(id)a3;
- (void)_confirmReminderByRecordId:(id)a3 completion:(id)a4;
- (void)_executeBoxTasks:(id)a3;
- (void)_harvestReservationsFromInteractions:(id)a3 bundleId:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_performAction:(id)a3 onContactDetailRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6;
- (void)_performAction:(id)a3 onRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6;
- (void)_performAction:(id)a3 onRecord:(id)a4 withParentConfirmation:(BOOL)a5 confirmRejectUI:(int)a6 completion:(id)a7;
- (void)_processReservationInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)_rejectReminderByRecordId:(id)a3 completion:(id)a4;
- (void)_sendChatChangedNotificationWithDomainIdentifier:(id)a3;
- (void)_setupHistoryObserver:(id)a3;
- (void)_storeAndGeocodeEntity:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 store:(id)a7 afterCallbackQueue:(id)a8 finalize:(id)a9;
- (void)_suggestionsFromMessage:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 completionDelivery:(unint64_t)a6 completionHandler:(id)a7;
- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 withCompletion:(id)a8;
- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 withCompletion:(id)a6;
- (void)_suggestionsFromSingleSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 withCompletion:(id)a8;
- (void)addInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5;
- (void)addSearchableItems:(id)a3 completion:(id)a4;
- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4;
- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)batchSuggestionsFromMessages:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 batchCompletion:(id)a6 writeBackCompletion:(id)a7 shouldStopSignal:(id)a8;
- (void)batchSuggestionsFromSearchableItems:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 batchCompletion:(id)a8 writeBackCompletion:(id)a9 shouldStopSignal:(id)a10;
- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4;
- (void)bumptTTLForNLEvent:(id)a3;
- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4;
- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4;
- (void)clearContactAggregator;
- (void)clearContactAggregatorConversation:(id)a3;
- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4;
- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4;
- (void)confirmContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)confirmContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)confirmEvent:(id)a3 completion:(id)a4;
- (void)confirmEventByRecordId:(id)a3 completion:(id)a4;
- (void)confirmRealtimeReminder:(id)a3 completion:(id)a4;
- (void)confirmRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)confirmReminderByRecordId:(id)a3 completion:(id)a4;
- (void)contactFromRecordId:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contentAdmissionBlocklistDidChange:(id)a3;
- (void)daemonExitWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteCloudKitZoneWithCompletion:(id)a3;
- (void)deleteEventByRecordId:(id)a3 completion:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4;
- (void)enqueueSearchableItems:(id)a3 completion:(id)a4;
- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5;
- (void)eventFromRecordId:(id)a3 withCompletion:(id)a4;
- (void)eventFromUniqueId:(id)a3 completion:(id)a4;
- (void)eventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5;
- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7;
- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8;
- (void)extractAttributesAndDonate:(id)a3 withCompletion:(id)a4;
- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5;
- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4;
- (void)geocodeEnrichmentsInPipelineEntity:(id)a3 withCompletion:(id)a4;
- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)harvestedSuggestionsFromMessages:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12;
- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6;
- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4;
- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4;
- (void)isEnabledWithCompletion:(id)a3;
- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6;
- (void)isEventCandidateForURL:(id)a3 title:(id)a4 withCompletion:(id)a5;
- (void)keepDirty:(BOOL)a3;
- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 completion:(id)a4;
- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 ignoreUserActivitySupport:(BOOL)a6 ignoreMailCheck:(BOOL)a7 completion:(id)a8;
- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForRealtimeEvent:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6;
- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6;
- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3;
- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logUnknownContactInformationShownCount:(unint64_t)a3 notShownCount:(unint64_t)a4 bundleId:(id)a5;
- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4;
- (void)messagesToRefreshWithCompletion:(id)a3;
- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8;
- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7;
- (void)namesForDetailCacheSnapshotsWithCompletion:(id)a3;
- (void)noopWithCompletion:(id)a3;
- (void)originFromRecordId:(id)a3 completion:(id)a4;
- (void)pingWithCompletion:(id)a3;
- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4;
- (void)powerStateWithCompletion:(id)a3;
- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8;
- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8;
- (void)prepareForRealtimeExtraction:(id)a3;
- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5;
- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 isTextMessage:(BOOL)a10;
- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 processingType:(unint64_t)a10 isTextMessage:(BOOL)a11;
- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7;
- (void)rebuildNamesForDetailCache:(id)a3;
- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4;
- (void)registerForCoreSpotlightIndexing;
- (void)registerForProactiveHarvesting;
- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5;
- (void)rejectContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)rejectContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)rejectEvent:(id)a3 completion:(id)a4;
- (void)rejectEventByRecordId:(id)a3 completion:(id)a4;
- (void)rejectRealtimeReminder:(id)a3 completion:(id)a4;
- (void)rejectRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5;
- (void)rejectReminderByRecordId:(id)a3 completion:(id)a4;
- (void)reminderAlarmTriggeredForRecordId:(id)a3 completion:(id)a4;
- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4;
- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3;
- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5;
- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5;
- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5;
- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5;
- (void)resetConfirmationAndRejectionHistory:(id)a3;
- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4;
- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4;
- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4;
- (void)schemaOrgToEvents:(id)a3 completion:(id)a4;
- (void)sendRTCLogsWithCompletion:(id)a3;
- (void)setLastSuggestionsFromMessageRequest:(id)a3;
- (void)setLastSuggestionsFromMessageResponse:(id)a3;
- (void)setupManagerWithConnection:(id)a3 store:(id)a4 ctsManager:(id)a5 ekStoreProvider:(id)a6 contactStore:(id)a7 pet2Tracker:(id)a8;
- (void)sleepWithCompletion:(id)a3;
- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8;
- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5;
- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7;
- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7;
- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 completionHandler:(id)a6 fullCompletionHandler:(id)a7;
- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 fullCompletionHandler:(id)a5;
- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromSingleMessage:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 completionHandler:(id)a6 fullCompletionHandler:(id)a7;
- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6;
- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4;
- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5;
- (void)updateMessages:(id)a3 state:(unint64_t)a4 completion:(id)a5;
- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9;
- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7;
- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5;
@end

@implementation SGDSuggestManager

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_280(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sgLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v5[0] = 0;
      _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "clearing lastSuggestionsFromMessage cache due to settings change", (uint8_t *)v5, 2u);
    }

    [WeakRetained[14] lock];
    id v3 = WeakRetained[12];
    WeakRetained[12] = 0;

    id v4 = WeakRetained[13];
    WeakRetained[13] = 0;

    [WeakRetained[14] unlock];
  }
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(*(void *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_4;
  v10[3] = &unk_1E65B6348;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 updateBox:v10];
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  [v6 addDeletion:v4 domainSelection:v5];
  LOBYTE(v4) = [v6 shouldRunHandlerImmediately];

  *a3 = v4;
}

- (SGDSuggestManager)initWithConnection:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDSuggestManager;
  id v8 = [(SGDSuggestManager *)&v16 init];
  if (!v8) {
    goto LABEL_3;
  }
  id v9 = +[SGDManagerForCTS sharedSingletonInstance];
  v10 = +[SGEKEventStoreProvider defaultEKStoreProvider];
  id v11 = +[SGContactStoreFactory contactStore];
  [(SGDSuggestManager *)v8 setupManagerWithConnection:v6 store:v7 ctsManager:v9 ekStoreProvider:v10 contactStore:v11 pet2Tracker:0];

  if (!v8->_harvestStore)
  {
    v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGDSuggestManager has no entity store and cannot continue", v15, 2u);
    }

    id v12 = 0;
  }
  else
  {
LABEL_3:
    id v12 = v8;
  }

  return v12;
}

- (void)namesForDetailCacheSnapshotsWithCompletion:(id)a3
{
  harvestStore = self->_harvestStore;
  uint64_t v5 = (void (**)(id, void *))a3;
  id v6 = [(SGSqlEntityStore *)harvestStore kvCacheManager];
  id v12 = [v6 cacheOfType:0];

  id v7 = [(SGSqlEntityStore *)self->_harvestStore kvCacheManager];
  id v8 = [v7 cacheOfType:1];

  id v9 = (void *)MEMORY[0x1E4F5DB98];
  v10 = [(SGDSuggestManager *)self _maybeFormatString];
  id v11 = [v9 responseWith:v8 also:v12 also:v10];
  v5[2](v5, v11);
}

id __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_2_285()
{
  v0 = objc_opt_new();
  return v0;
}

- (void)setupManagerWithConnection:(id)a3 store:(id)a4 ctsManager:(id)a5 ekStoreProvider:(id)a6 contactStore:(id)a7 pet2Tracker:(id)a8
{
  v92[20] = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v81 = a4;
  id v64 = a5;
  id v65 = a6;
  id v66 = a7;
  id v15 = a8;
  v67 = v15;
  if (v15)
  {
    objc_super v16 = (PETEventTracker2 *)v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F93728], "sharedInstance", v64, v65, v66, 0);
    objc_super v16 = (PETEventTracker2 *)objc_claimAutoreleasedReturnValue();
  }
  pet2Tracker = self->_pet2Tracker;
  self->_pet2Tracker = v16;

  if (v81)
  {
    v18 = (SGSqlEntityStore *)v81;
  }
  else
  {
    v18 = +[SGSqlEntityStore defaultStore];
  }
  harvestStore = self->_harvestStore;
  self->_harvestStore = v18;

  v20 = [[SGServiceContext alloc] initWithStore:self->_harvestStore];
  context = self->_context;
  self->_context = v20;

  objc_storeStrong((id *)&self->_connection, a3);
  v22 = +[SGSuggestHistory sharedSuggestHistory];
  history = self->_history;
  self->_history = v22;

  if (![(SGSqlEntityStore *)self->_harvestStore isEphemeral]) {
    [(SGDSuggestManager *)self _setupHistoryObserver:self->_harvestStore];
  }
  id location = 0;
  objc_initWeak(&location, self);
  v24 = +[SGAsset asset];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke;
  v88[3] = &unk_1E65B5CA0;
  objc_copyWeak(&v89, &location);
  v25 = [v24 registerUpdateHandler:v88];
  assetUpdateToken = self->_assetUpdateToken;
  self->_assetUpdateToken = v25;

  objc_storeStrong((id *)&self->_ctsManager, a5);
  objc_storeStrong((id *)&self->_ekStoreProvider, a6);
  objc_storeStrong((id *)&self->_contactStore, a7);
  v27 = (NSOperationQueue *)objc_opt_new();
  messageHarvestQueue = self->_messageHarvestQueue;
  self->_messageHarvestQueue = v27;

  [(NSOperationQueue *)self->_messageHarvestQueue setQualityOfService:17];
  [(NSOperationQueue *)self->_messageHarvestQueue setMaxConcurrentOperationCount:2];
  objc_msgSend(v72, "sgd_clientName");
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  self->_clientName = v29;

  v31 = (NSLock *)objc_opt_new();
  dirtyLock = self->_dirtyLock;
  self->_dirtyLock = v31;

  v91[0] = *MEMORY[0x1E4F5DC28];
  uint64_t v33 = *MEMORY[0x1E4F5DD68];
  v80 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD68]];
  v92[0] = v80;
  v91[1] = *MEMORY[0x1E4F5DC50];
  uint64_t v34 = *MEMORY[0x1E4F5DD88];
  v79 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD88]];
  v92[1] = v79;
  v91[2] = *MEMORY[0x1E4F5DC08];
  v78 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD48]];
  v92[2] = v78;
  v91[3] = *MEMORY[0x1E4F5DC38];
  uint64_t v35 = *MEMORY[0x1E4F5DD78];
  v77 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD78]];
  v92[3] = v77;
  v91[4] = *MEMORY[0x1E4F5DC10];
  uint64_t v36 = *MEMORY[0x1E4F5DD50];
  v76 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD50]];
  v92[4] = v76;
  v91[5] = *MEMORY[0x1E4F5DC00];
  uint64_t v37 = *MEMORY[0x1E4F5DD40];
  v75 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD40]];
  v92[5] = v75;
  v91[6] = *MEMORY[0x1E4F5DC68];
  v74 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD98]];
  v92[6] = v74;
  v91[7] = *MEMORY[0x1E4F5DC30];
  v73 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD70]];
  v92[7] = v73;
  v91[8] = *MEMORY[0x1E4F5DC58];
  v71 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD90]];
  v92[8] = v71;
  v91[9] = *MEMORY[0x1E4F5DC20];
  v70 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD60]];
  v92[9] = v70;
  v91[10] = *MEMORY[0x1E4F5DC18];
  v69 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F5DD58]];
  v92[10] = v69;
  v91[11] = @"com.apple.MailCompositionService";
  v68 = [NSNumber numberWithUnsignedInteger:v33];
  v92[11] = v68;
  v91[12] = @"com.apple.MobileAddressBook.ContactsViewService";
  v38 = [NSNumber numberWithUnsignedInteger:v37];
  v92[12] = v38;
  v91[13] = @"com.apple.MobileAddressBook.ContactViewViewService";
  v39 = [NSNumber numberWithUnsignedInteger:v37];
  v92[13] = v39;
  v91[14] = @"com.apple.mobilesms.compose";
  v40 = [NSNumber numberWithUnsignedInteger:v35];
  v92[14] = v40;
  v91[15] = @"FaceTime";
  v41 = [NSNumber numberWithUnsignedInteger:v36];
  v92[15] = v41;
  v91[16] = @"com.apple.FaceTime";
  v42 = [NSNumber numberWithUnsignedInteger:v36];
  v92[16] = v42;
  v91[17] = @"InCallService";
  v43 = [NSNumber numberWithUnsignedInteger:v34];
  v92[17] = v43;
  v91[18] = @"com.apple.telephonyutilities.callservicesd";
  v44 = [NSNumber numberWithUnsignedInteger:v34];
  v92[18] = v44;
  v91[19] = @"MobilePhone";
  v45 = [NSNumber numberWithUnsignedInteger:v34];
  v92[19] = v45;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:20];
  bundleIdToPET = self->_bundleIdToPET;
  self->_bundleIdToPET = v46;

  v48 = (NSLock *)objc_opt_new();
  lastSuggestionsFromMessageLock = self->_lastSuggestionsFromMessageLock;
  self->_lastSuggestionsFromMessageLock = v48;

  v50 = (void *)MEMORY[0x1E4F5DAF0];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_280;
  v86[3] = &unk_1E65C0018;
  objc_copyWeak(&v87, &location);
  self->_settingsChangeToken = [v50 registerBlockOnSuggestionsSettingsChange:v86];
  id v51 = objc_alloc(MEMORY[0x1E4F93B70]);
  v52 = objc_opt_new();
  v53 = (_PASLock *)[v51 initWithGuardedData:v52];
  recentlyHarvestedDetailLock = self->_recentlyHarvestedDetailLock;
  self->_recentlyHarvestedDetailLock = v53;

  v55 = (void *)MEMORY[0x1E4F93B18];
  v56 = dispatch_get_global_queue(5, 0);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_282;
  v84[3] = &unk_1E65C0018;
  objc_copyWeak(&v85, &location);
  [v55 runAsyncOnQueue:v56 afterDelaySeconds:v84 block:5.0];

  self->_persistRealtimeExtractions = 1;
  id v57 = objc_alloc(MEMORY[0x1E4F93B70]);
  v58 = objc_opt_new();
  v59 = (_PASLock *)[v57 initWithGuardedData:v58];
  bufferedInteractionsForBundleLock = self->_bufferedInteractionsForBundleLock;
  self->_bufferedInteractionsForBundleLock = v59;

  v61 = [SGCoalescingDropBox alloc];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_3;
  v82[3] = &unk_1E65B5CE8;
  objc_copyWeak(&v83, &location);
  v62 = [(SGCoalescingDropBox *)v61 initWithName:"SGDSuggestManager-purgeDeletionDropBox" boxMaker:&__block_literal_global_288 handler:v82 qos:17];
  purgeDeletionDropBox = self->_purgeDeletionDropBox;
  self->_purgeDeletionDropBox = v62;

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);
}

- (void)_setupHistoryObserver:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SGDSuggestManager__setupHistoryObserver___block_invoke;
  block[3] = &unk_1E65BEF88;
  id v7 = v3;
  uint64_t v4 = _setupHistoryObserver__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_setupHistoryObserver__onceToken, block);
  }
}

- (id)_maybeFormatString
{
  if (_maybeFormatString_once != -1) {
    dispatch_once(&_maybeFormatString_once, &__block_literal_global_831);
  }
  v2 = (void *)_maybeFormatString_localizedString;
  return v2;
}

- (id)consumerName
{
  return @"com.apple.CoreSuggestionsInternals.SGDSuggestManager";
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9
{
  uint64_t v10 = a7;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v20 = (void (**)(id, void *))a9;
  if (!v20)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4610, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v21 = sgLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    uint64_t v28 = (uint64_t)v16;
    __int16 v29 = 2112;
    id v30 = v17;
    __int16 v31 = 2112;
    id v32 = v18;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 1024;
    int v36 = v10;
    __int16 v37 = 1024;
    unsigned int v38 = a8;
    _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-urlsFoundBetweenStartDate:%@ endDate:%@ excludingBundleIdentifiers:%@ containingSubstring:%@ flagFilter:%d limit:%u called", buf, 0x36u);
  }

  v22 = [(SGSqlEntityStore *)self->_harvestStore urlsFoundBetweenStartDate:v16 endDate:v17 excludingBundleIdentifiers:v18 containingSubstring:v19 flagFilter:v10 limit:a8];
  v23 = sgLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v24;
    _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit returning %tu URLs", buf, 0xCu);
  }

  v25 = [MEMORY[0x1E4F5DB90] responseWith:v22];
  v20[2](v20, v25);
}

- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4580, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a3;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-recentURLsWithLimit:%u called", buf, 8u);
  }

  id v9 = [(SGSqlEntityStore *)self->_harvestStore recentURLsWithLimit:a3];
  uint64_t v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-recentURLsWithLimit returning %tu URLs", buf, 0xCu);
  }

  id v12 = [MEMORY[0x1E4F5DB90] responseWith:v9];
  v7[2](v7, v12);
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4 = a3;
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: deleteDataDerivedFromContentMatchingRequest", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v11[3] = &unk_1E65B8A90;
  v11[4] = self;
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_3;
  v10[3] = &unk_1E65B6370;
  void v10[4] = self;
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_5;
  v9[3] = &unk_1E65B6398;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_7;
  v8[3] = &unk_1E65B6398;
  [v4 accessCriteriaUsingBundleIdentifierBlock:v11 domainSelectionBlock:v10 incontrovertiblyDeletedUniqueIdentifiersBlock:v9 purgedUniqueIdentifiersBlock:v8];

  id v6 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bufferedInteractionsForBundleLock, 0);
  objc_storeStrong((id *)&self->_recentlyHarvestedDetailLock, 0);
  objc_storeStrong((id *)&self->_purgeDeletionDropBox, 0);
  objc_storeStrong((id *)&self->_pet2Tracker, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageLock, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageResponse, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageRequest, 0);
  objc_storeStrong((id *)&self->_dirtyTransaction, 0);
  objc_storeStrong((id *)&self->_dirtyLock, 0);
  objc_storeStrong((id *)&self->_bundleIdToPET, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_ekStoreProvider, 0);
  objc_storeStrong((id *)&self->_ctsManager, 0);
  objc_storeStrong((id *)&self->_messageHarvestQueue, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_harvestStore, 0);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (SGServiceContext)context
{
  return self->_context;
}

- (void)extractAttributesAndDonate:(id)a3 withCompletion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 bundleID];
    uint64_t v10 = [v6 uniqueIdentifier];
    *(_DWORD *)buf = 138413058;
    __int16 v29 = v9;
    __int16 v30 = 2112;
    __int16 v31 = v10;
    __int16 v32 = 2048;
    uint64_t v33 = 1040187394;
    __int16 v34 = 2112;
    __int16 v35 = @"SGDSuggestManagerProcessingTypeRealtime";
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: extractAttributesAndDonate: %@ : %@ options: %tu, processingType: %@", buf, 0x2Au);
  }
  uint64_t v11 = [v6 bundleID];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F5DC28]];

  if (v12)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__SGDSuggestManager_extractAttributesAndDonate_withCompletion___block_invoke;
    v26[3] = &unk_1E65B6128;
    v13 = (void (**)(id, void *))v7;
    v27 = v13;
    v14 = (void *)MEMORY[0x1CB79B4C0](v26);
    uint64_t v15 = +[SGDSuggestManager preprocessSearchableItem:v6];
    if (v15) {
      v13[2](v13, v15);
    }
    else {
      [(SGDSuggestManager *)self _suggestionsFromSingleSearchableItem:v6 options:1040187394 dissectIfNecessary:1 processingType:0 completionDelivery:0 withCompletion:v14];
    }

    id v19 = v27;
  }
  else
  {
    uint64_t v16 = [v6 bundleID];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F5DC38]];

    if (v17)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __63__SGDSuggestManager_extractAttributesAndDonate_withCompletion___block_invoke_934;
      uint64_t v24 = &unk_1E65B9238;
      id v25 = v7;
      id v18 = (void *)MEMORY[0x1CB79B4C0](&v21);
      -[SGDSuggestManager suggestionsFromSingleMessage:options:completionDelivery:completionHandler:fullCompletionHandler:](self, "suggestionsFromSingleMessage:options:completionDelivery:completionHandler:fullCompletionHandler:", v6, 1040187394, 0, v18, 0, v21, v22, v23, v24);

      id v19 = v25;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:&unk_1F25375E8];
      v20 = [MEMORY[0x1E4F5DB90] responseWithError:v19];
      (*((void (**)(id, void *))v7 + 2))(v7, v20);
    }
  }
}

void __63__SGDSuggestManager_extractAttributesAndDonate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 response1];
    int v12 = 134217984;
    uint64_t v13 = [v5 count];
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: found: %ld results", (uint8_t *)&v12, 0xCu);
  }
  id v6 = [v3 error];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (void *)MEMORY[0x1E4F5DB90];
    id v9 = [v3 error];
    [v8 responseWithError:v9];
  }
  else
  {
    uint64_t v10 = [v3 response1];
    id v9 = +[SGDSuggestManager extractAttributeSetsFromRealtimeEvents:v10];

    uint64_t v7 = *(void *)(a1 + 32);
    [MEMORY[0x1E4F5DB90] responseWith:v9];
  uint64_t v11 = };
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
}

void __63__SGDSuggestManager_extractAttributesAndDonate_withCompletion___block_invoke_934(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = [v7 count];
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: found: %ld results", (uint8_t *)&v13, 0xCu);
  }

  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [MEMORY[0x1E4F5DB90] responseWithError:v6];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    uint64_t v10 = +[SGDSuggestManager extractAttributeSetsFromRealtimeEvents:v7];
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = [MEMORY[0x1E4F5DB90] responseWith:v10];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

- (id)consumeInteractionWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 content];
  id v6 = [v5 interaction];

  id v7 = [v4 content];

  id v8 = [v7 bundleIdentifier];

  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeInteractionWithContext: %@", buf, 0xCu);
  }

  int v17 = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(SGDSuggestManager *)self _harvestPeopleFromInteractions:v10 bundleId:v8];

  if (consumeInteractionWithContext___pasOnceToken244 != -1) {
    dispatch_once(&consumeInteractionWithContext___pasOnceToken244, &__block_literal_global_930);
  }
  uint64_t v16 = v6;
  uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = (id)consumeInteractionWithContext___pasExprOnceResult;
  int v13 = [v11 arrayWithObjects:&v16 count:1];
  -[SGDSuggestManager _harvestReservationsFromInteractions:bundleId:queue:completion:](self, "_harvestReservationsFromInteractions:bundleId:queue:completion:", v13, v8, v12, &__block_literal_global_933, v16);

  uint64_t v14 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v14;
}

void __51__SGDSuggestManager_consumeInteractionWithContext___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGSuggestManager-consumeInteractionWithContext" qosClass:25];
  v2 = (void *)consumeInteractionWithContext___pasExprOnceResult;
  consumeInteractionWithContext___pasExprOnceResult = v1;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 content];
    id v7 = [v6 uniqueId];
    id v8 = [v4 content];
    int v22 = 138412547;
    v23 = v7;
    __int16 v24 = 2117;
    id v25 = v8;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeMessagesContentWithContext %@: %{sensitive}@", (uint8_t *)&v22, 0x16u);
  }
  uint64_t v9 = [SGTextMessage alloc];
  uint64_t v10 = [v4 content];
  uint64_t v11 = [v4 contentProtection];
  id v12 = [(SGTextMessage *)v9 initWithMessagesContentEvent:v10 contentProtection:v11];

  int v13 = [SGRequestContext alloc];
  uint64_t v14 = [(SGDManagerForCTS *)self->_ctsManager serviceContext];
  uint64_t v15 = [(SGRequestContext *)v13 initWithServiceContext:v14 concurrencyBehavior:1 backpressureHazard:0];

  uint64_t v16 = [SGHarvestQueueMetrics alloc];
  int v17 = [(SGHarvestQueueMetrics *)v16 initWithBundleIdentifier:*MEMORY[0x1E4F937C0] highPriority:0 harvestedOnBattery:0 receivedOnBattery:0 harvestSource:8];
  ctsManager = self->_ctsManager;
  id v19 = +[SGPipeline fullPipeline];
  [(SGDManagerForCTS *)ctsManager processTextMessage:v12 pipeline:v19 context:v15 harvestMetrics:v17];

  uint64_t v20 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v20;
}

- (id)consumeMailContentWithContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 content];
      uint64_t v9 = [v8 uniqueId];
      uint64_t v10 = [v5 content];
      *(_DWORD *)buf = 138412547;
      uint64_t v28 = v9;
      __int16 v29 = 2117;
      __int16 v30 = v10;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeMailContentWithContext %@: %{sensitive}@", buf, 0x16u);
    }
    uint64_t v11 = [v5 htmlParser];
    if (!v11)
    {
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 5152, @"Invalid parameter not satisfying: %@", @"htmlParserNonNull != nil" object file lineNumber description];
    }
    id v12 = [SGSimpleMailMessage alloc];
    int v13 = [v5 content];
    uint64_t v14 = [v5 contentProtection];
    uint64_t v15 = [(SGSimpleMailMessage *)v12 initWithMailContentEvent:v13 contentProtection:v14 htmlParser:v11];

    uint64_t v16 = [SGRequestContext alloc];
    int v17 = [(SGDManagerForCTS *)self->_ctsManager serviceContext];
    id v18 = [(SGRequestContext *)v16 initWithServiceContext:v17 concurrencyBehavior:1 backpressureHazard:0];

    id v19 = [SGHarvestQueueMetrics alloc];
    uint64_t v20 = [(SGHarvestQueueMetrics *)v19 initWithBundleIdentifier:*MEMORY[0x1E4F937B0] highPriority:0 harvestedOnBattery:0 receivedOnBattery:0 harvestSource:8];
    ctsManager = self->_ctsManager;
    int v22 = [v5 content];
    v23 = [v22 headers];
    __int16 v24 = +[SGPipeline fullPipeline];
    [(SGDManagerForCTS *)ctsManager processMailMessage:v15 headers:v23 pipeline:v24 context:v18 harvestMetrics:v20];
  }
  return v6;
}

uint64_t __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteSpotlightReferencesWithBundleIdentifier:a2 completion:&__block_literal_global_917];
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_6;
  v10[3] = &unk_1E65B6348;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 updateBox:v10];
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_8;
  v10[3] = &unk_1E65B6348;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 updateBox:v10];
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = (void *)*MEMORY[0x1E4F5DC28];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  int v8 = [v5 isEqualToString:v6];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v8) {
    [v7 addPurge:v9 uniqueIds:v10];
  }
  else {
    [v7 addDeletion:v9 uniqueIds:v10];
  }
  char v11 = [v7 shouldRunHandlerImmediately];

  *a3 = v11;
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_6(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  [v6 addDeletion:v4 uniqueIds:v5];
  LOBYTE(v4) = [v6 shouldRunHandlerImmediately];

  *a3 = v4;
}

- (void)registerForProactiveHarvesting
{
  id v3 = [MEMORY[0x1E4F93750] defaultCoordinator];
  [v3 registerMailConsumer:self levelOfService:2];
  [v3 registerInteractionConsumer:self levelOfService:3];
}

- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5
{
  int v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 5033, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 5034, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

LABEL_3:
  char v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v9;
    __int16 v50 = 1024;
    LODWORD(v51) = v6;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestManager-foundInStringForRecordId:%@ style:%u called", buf, 0x12u);
  }

  id v12 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:v9];
  int v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 loadOrigin:self->_harvestStore];
    uint64_t v15 = [v14 localizedApplicationName];
    if (!v15)
    {
      __int16 v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:-1 userInfo:&unk_1F25375C0];
      __int16 v29 = [MEMORY[0x1E4F5DB90] responseWithError:v32];
      v10[2](v10, v29);
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v16 = [v13 duplicateKey];
    uint64_t v17 = [v16 entityType];

    if (v17 == 22)
    {
      id v18 = +[SGStorageReminder storageReminderFromEntity:v13 origin:v14];
      id v19 = sgRemindersLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v13 loggingIdentifier];
        int v44 = v6;
        uint64_t v21 = v20 = v18;
        int v22 = [v20 loggingIdentifier];
        *(_DWORD *)buf = 138543618;
        id v49 = v21;
        __int16 v50 = 2114;
        id v51 = v22;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "Entity %{public}@ -> SGStorageReminder %{public}@", buf, 0x16u);

        id v18 = v20;
        int v6 = v44;
      }

      v23 = [v18 contactIdentifier];
      uint64_t v24 = [v23 length];

      if (v24)
      {
        v45 = v18;
        id v25 = [v18 contactIdentifier];
        uint64_t v26 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
        v47 = v26;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        contactStore = self->_contactStore;
        id v46 = 0;
        __int16 v29 = +[SGContactsInterface unifiedContactWithIdentifier:v25 keysToFetch:v27 usingContactStore:contactStore error:&v46];
        id v43 = v46;

        if (v29)
        {
          __int16 v30 = [MEMORY[0x1E4F1B910] stringFromContact:v29 style:1000];
          if (v30)
          {
            uint64_t v31 = v43;
            if (v6 == 1)
            {
              __int16 v32 = +[SGFoundInAppsStrings foundInAppsStringCompactVersionWithContactName:v30];
              uint64_t v33 = +[SGRTCLogging defaultLogger];
              __int16 v34 = v33;
              __int16 v35 = v45;
              uint64_t v36 = 24;
            }
            else
            {
              if (v6)
              {
                __int16 v32 = 0;
LABEL_37:

                if (v32) {
                  goto LABEL_27;
                }
                goto LABEL_26;
              }
              __int16 v32 = +[SGFoundInAppsStrings foundInAppsStringLongVersionForAppName:v15 contactName:v30];
              uint64_t v33 = +[SGRTCLogging defaultLogger];
              __int16 v34 = v33;
              __int16 v35 = v45;
              uint64_t v36 = 23;
            }
            [v33 logReminderInteractionFromReminder:v35 interface:v36 actionType:4];
          }
          else
          {
            __int16 v34 = sgLogHandle();
            uint64_t v31 = v43;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v34, OS_LOG_TYPE_ERROR, "SGDSuggestManager-foundInStringForRecordId: unable to format contact name.", buf, 2u);
            }
            __int16 v32 = 0;
          }

          goto LABEL_37;
        }
        uint64_t v39 = sgLogHandle();
        unsigned int v38 = v43;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v43;
          _os_log_error_impl(&dword_1CA650000, v39, OS_LOG_TYPE_ERROR, "SGDSuggestManager-foundInStringForRecordId: error when fetching contact: %@", buf, 0xCu);
        }

        id v18 = v45;
      }
      else
      {
        unsigned int v38 = +[SGRTCLogging defaultLogger];
        [v38 logReminderInteractionFromReminder:v18 interface:23 actionType:4];
      }
    }
    __int16 v29 = 0;
LABEL_26:
    __int16 v32 = +[SGFoundInAppsStrings foundInAppsStringWithoutContactForAppName:v15];
LABEL_27:
    v40 = [MEMORY[0x1E4F5DB90] responseWith:v32];
    v10[2](v10, v40);

    goto LABEL_28;
  }
  __int16 v37 = sgLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v9;
    _os_log_error_impl(&dword_1CA650000, v37, OS_LOG_TYPE_ERROR, "No entity found for recordId: %@", buf, 0xCu);
  }

  uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:&unk_1F2537598];
  uint64_t v15 = [MEMORY[0x1E4F5DB90] responseWithError:v14];
  v10[2](v10, v15);
LABEL_29:
}

- (void)_sendChatChangedNotificationWithDomainIdentifier:(id)a3
{
  id v6 = a3;
  id v3 = (void *)MEMORY[0x1CB79B230]();
  CFStringRef v4 = (const __CFString *)[@"com.apple.suggestions.internal.messages.processed." stringByAppendingString:v6];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, v4, 0, 0);
}

- (id)filterRealtimeEvents:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v24 = (id)objc_opt_new();
    CFStringRef v4 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      id v25 = v4;
      uint64_t v26 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v10 = [v9 event];
          char v11 = [v10 opaqueKey];

          if (v11)
          {
            id v12 = [v4 objectForKeyedSubscript:v11];
            int v13 = v12;
            if (!v12) {
              goto LABEL_10;
            }
            uint64_t v14 = [v12 event];
            uint64_t v15 = [v14 creationDate];
            uint64_t v16 = [v9 event];
            uint64_t v17 = [v16 creationDate];
            uint64_t v18 = [v15 compare:v17];

            uint64_t v7 = v26;
            BOOL v19 = v18 == 1;
            CFStringRef v4 = v25;
            if (!v19) {
LABEL_10:
            }
              [v4 setObject:v9 forKeyedSubscript:v11];
          }
          else
          {
            [v24 addObject:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v6);
    }

    uint64_t v20 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v21 = [v4 allValues];
    [v24 addObjectsFromArray:v21];

    [v24 sortUsingComparator:&__block_literal_global_893];
    id v3 = v23;
  }
  else
  {
    id v24 = v3;
  }

  return v24;
}

uint64_t __42__SGDSuggestManager_filterRealtimeEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 event];
  uint64_t v6 = [v5 start];
  uint64_t v7 = [v4 event];

  int v8 = [v7 start];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SGDSuggestManager_suggestionsFromMessage_options_completionHandler___block_invoke;
  v10[3] = &unk_1E65B9238;
  id v11 = v8;
  id v9 = v8;
  [(SGDSuggestManager *)self suggestionsFromMessage:a3 options:a4 completionDelivery:0 completionHandler:v10 fullCompletionHandler:0];
}

void __70__SGDSuggestManager_suggestionsFromMessage_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    [MEMORY[0x1E4F5DB98] responseWithError:a2];
  }
  else {
    objc_msgSend(MEMORY[0x1E4F5DB98], "responseWith:also:also:");
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)harvestedSuggestionsFromMessages:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v39 = a4;
  id v40 = a6;
  uint64_t v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = [v47 count];
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessages: %tu messages (options %tu)", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v39])
  {
    if ([v47 count])
    {
      v45 = objc_opt_new();
      int v44 = objc_opt_new();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v70 = __Block_byref_object_copy__4015;
      v71 = __Block_byref_object_dispose__4016;
      id v72 = 0;
      NSStringFromSelector(a2);
      id v11 = objc_claimAutoreleasedReturnValue();
      queue = dispatch_queue_create((const char *)[v11 UTF8String], 0);

      id v12 = dispatch_group_create();
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      int v13 = [v47 reverseObjectEnumerator];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v64;
        uint64_t v41 = *MEMORY[0x1E4F28358];
        id obj = v13;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v64 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v17, "protection", v39);
            BOOL v19 = v18 == 0;

            if (v19) {
              [v17 setProtection:v41];
            }
            dispatch_group_enter(v12);
            uint64_t v20 = [v17 attributeSet];
            uint64_t v21 = [v20 contentCreationDate];

            if (v21
              && ([MEMORY[0x1E4F1C9C8] date],
                  int v22 = objc_claimAutoreleasedReturnValue(),
                  [v22 timeIntervalSinceDate:v21],
                  BOOL v24 = v23 < 10.0,
                  v22,
                  !v24))
            {
              uint64_t v29 = 0;
            }
            else
            {
              id v25 = [v17 uniqueIdentifier];
              BOOL v26 = v25 == 0;

              if (!v26)
              {
                v27 = [MEMORY[0x1E4F5DB78] sharedInstance];
                long long v28 = [v17 uniqueIdentifier];
                [v27 waitForUniqueIdentifierToProcess:v28];
              }
              uint64_t v29 = 1;
            }
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke;
            v55[3] = &unk_1E65B62D8;
            v56 = queue;
            id v57 = v17;
            v58 = v45;
            id v59 = v44;
            id v60 = v47;
            v62 = buf;
            v61 = v12;
            [(SGDSuggestManager *)self _suggestionsFromMessage:v17 options:a5 dissectIfNecessary:v29 completionDelivery:0 completionHandler:v55];
          }
          int v13 = obj;
          uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
        }
        while (v14);
      }

      long long v30 = self;
      if ((unint64_t)[v45 count] < 2)
      {
        __int16 v32 = v45;
      }
      else
      {
        long long v31 = [v45 lastObject];
        v67 = v31;
        __int16 v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];

        long long v30 = self;
      }
      uint64_t v36 = -[SGDSuggestManager filterRealtimeEvents:](v30, "filterRealtimeEvents:", v44, v39);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_888;
      block[3] = &unk_1E65B6300;
      id v49 = v32;
      id v50 = v36;
      id v53 = v40;
      v54 = buf;
      id v51 = v47;
      uint64_t v52 = v30;
      id v37 = v36;
      unsigned int v38 = v32;
      dispatch_group_notify(v12, queue, block);

      _Block_object_dispose(buf, 8);
      __int16 v34 = v45;
    }
    else
    {
      if (v40)
      {
        __int16 v35 = [MEMORY[0x1E4F5DB98] responseWith:0 also:0 also:0];
        (*((void (**)(id, void *))v40 + 2))(v40, v35);
      }
      __int16 v34 = sgLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v34, OS_LOG_TYPE_INFO, "harvestedSuggestionsFromMessages called with no inputs", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  uint64_t v33 = sgLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessages ignoring item since the bundle is disallowed by user's settings", buf, 2u);
  }

  if (v40)
  {
    __int16 v34 = [MEMORY[0x1E4F5DB98] responseWith:0 also:0 also:0];
    (*((void (**)(id, NSObject *))v40 + 2))(v40, v34);
LABEL_32:
  }
}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2;
  v10[3] = &unk_1E65B97A0;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v11 = v3;
  uint64_t v12 = v4;
  id v13 = v6;
  id v14 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  dispatch_sync(v5, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_888(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = [MEMORY[0x1E4F5DB98] responseWith:*(void *)(a1 + 32) also:*(void *)(a1 + 40) also:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t v4 = [*(id *)(a1 + 48) firstObject];
  uint64_t v5 = [v4 domainIdentifier];

  uint64_t v6 = (void *)MEMORY[0x1E4F93B18];
  id v7 = dispatch_get_global_queue(9, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2_889;
  v9[3] = &unk_1E65BFD88;
  v9[4] = *(void *)(a1 + 56);
  id v10 = v5;
  id v8 = v5;
  [v6 runAsyncOnQueue:v7 afterDelaySeconds:v9 block:0.1];
}

uint64_t __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2_889(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendChatChangedNotificationWithDomainIdentifier:*(void *)(a1 + 40)];
}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) contacts];

  if (v2)
  {
    BOOL v3 = +[SGTextMessage isSent:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 32) contacts];
    uint64_t v6 = v5;
    if (v3)
    {
      id v7 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_886);
      [v4 addObjectsFromArray:v7];
    }
    else
    {
      [v4 addObjectsFromArray:v5];
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) events];
  if (v8)
  {
    id v9 = (void *)v8;
    BOOL v10 = +[SGTextMessage isSent:*(void *)(a1 + 40)];

    if (!v10)
    {
      id v11 = *(void **)(a1 + 56);
      uint64_t v12 = [*(id *)(a1 + 32) events];
      [v11 addObjectsFromArray:v12];
    }
  }
  id v13 = [*(id *)(a1 + 32) reminders];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) reminders];
    uint64_t v15 = [v14 count];

    if (v15 == 1)
    {
      uint64_t v16 = +[SGReminderTrialClientWrapper sharedInstance];
      uint64_t v17 = [v16 messagesBannerLimit];
      unint64_t v18 = [v17 unsignedIntegerValue];

      if ([*(id *)(a1 + 64) indexOfObject:*(void *)(a1 + 40)] < v18)
      {
        BOOL v19 = sgRemindersLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v27 = [*(id *)(a1 + 32) reminders];
          long long v28 = [v27 firstObject];
          uint64_t v29 = [v28 reminder];
          long long v30 = [v29 recordId];
          int v31 = 138412290;
          __int16 v32 = v30;
          _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: harvestedSuggestionsFromMessages: Suggesting reminder with recordId: %@", (uint8_t *)&v31, 0xCu);
        }
        uint64_t v20 = [*(id *)(a1 + 32) reminders];
        uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
        int v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        double v23 = +[SGRTCLogging defaultLogger];
        BOOL v24 = [*(id *)(a1 + 32) reminders];
        id v25 = [v24 firstObject];
        BOOL v26 = [v25 reminder];
        [v23 logReminderInteractionFromReminder:v26 interface:5 actionType:4];
      }
    }
  }
}

BOOL __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 contact];
  BOOL v3 = [v2 birthday];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 bundleID];
    uint64_t v15 = [v10 uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    BOOL v26 = v14;
    __int16 v27 = 2112;
    long long v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessage (deprecated): %@ : %@ options: %tu", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v11] & 1) == 0)
  {
    int v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessage ignoring item since the bundle is disallowed by user's settings", buf, 2u);
    }

    goto LABEL_11;
  }
  uint64_t v16 = [v10 domainIdentifier];

  if (!v16)
  {
    harvestStore = self->_harvestStore;
    unint64_t v18 = [v10 uniqueIdentifier];
    BOOL v19 = [(SGSqlEntityStore *)harvestStore domainIdentifierForSpotlightReferenceForBundleIdentifier:v11 uniqueIdentifier:v18];
    [v10 setDomainIdentifier:v19];
  }
  uint64_t v20 = [v10 domainIdentifier];

  if (!v20)
  {
LABEL_11:
    uint64_t v21 = [MEMORY[0x1E4F5DB98] responseWith:0 also:0 also:0];
    v12[2](v12, v21);
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke;
  v23[3] = &unk_1E65B91C0;
  BOOL v24 = v12;
  [(SGDSuggestManager *)self _suggestionsFromMessage:v10 options:a5 dissectIfNecessary:0 completionDelivery:0 completionHandler:v23];
  uint64_t v21 = v24;
LABEL_12:
}

void __96__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F5DB98];
    id v4 = a2;
    id v8 = [v4 contacts];
    uint64_t v5 = [v4 events];
    uint64_t v6 = [v4 reminders];

    id v7 = [v3 responseWith:v8 also:v5 also:v6];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
  }
}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 bundleID];
    uint64_t v15 = [v10 uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    BOOL v26 = v14;
    __int16 v27 = 2112;
    long long v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessage: %@ : %@ options: %tu", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v11] & 1) == 0)
  {
    int v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessage ignoring item since the bundle is disallowed by user's settings", buf, 2u);
    }

    goto LABEL_11;
  }
  uint64_t v16 = [v10 domainIdentifier];

  if (!v16)
  {
    harvestStore = self->_harvestStore;
    unint64_t v18 = [v10 uniqueIdentifier];
    BOOL v19 = [(SGSqlEntityStore *)harvestStore domainIdentifierForSpotlightReferenceForBundleIdentifier:v11 uniqueIdentifier:v18];
    [v10 setDomainIdentifier:v19];
  }
  uint64_t v20 = [v10 domainIdentifier];

  if (!v20)
  {
LABEL_11:
    uint64_t v21 = [MEMORY[0x1E4F5DB90] responseWith:0];
    v12[2](v12, v21);
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke;
  v23[3] = &unk_1E65B91C0;
  BOOL v24 = v12;
  [(SGDSuggestManager *)self _suggestionsFromMessage:v10 options:a5 dissectIfNecessary:0 completionDelivery:0 completionHandler:v23];
  uint64_t v21 = v24;
LABEL_12:
}

void __93__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    BOOL v3 = (objc_class *)MEMORY[0x1E4F5DB60];
    id v4 = a2;
    id v5 = [v3 alloc];
    uint64_t v6 = [v4 contacts];
    id v7 = [v4 events];
    id v8 = [v4 reminders];
    id v9 = [v4 walletOrders];
    id v10 = [v4 walletPasses];

    id v13 = (id)[v5 initWithContacts:v6 events:v7 reminders:v8 walletOrders:v9 walletPasses:v10];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [MEMORY[0x1E4F5DB90] responseWith:v13];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v24 = 2048;
    unint64_t v25 = a4;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: dissectAttachmentsFromSearchableItem: %@ options: %tu", buf, 0x16u);
  }
  *(void *)buf = 0;
  id v12 = objc_initWeak((id *)buf, self);
  [(SGDSuggestManager *)self clearCachesFully:1 withCompletion:&__block_literal_global_878];

  id v13 = [v8 uniqueIdentifier];
  id v14 = [v13 dataUsingEncoding:4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_879;
  v21[3] = &unk_1E65B91C0;
  id v15 = v9;
  id v22 = v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_2;
  v19[3] = &unk_1E65B91E8;
  id v16 = v8;
  id v20 = v16;
  LOBYTE(v18) = 0;
  LOBYTE(v17) = 1;
  [(SGDSuggestManager *)self realtimeSuggestionsForMailOrMessageWithHash:v14 options:a4 completion:v21 completionDelivery:0 providedBy:v19 searchableItem:v16 dissectIfNecessary:v17 processingType:1 isTextMessage:v18];

  objc_destroyWeak((id *)buf);
}

void __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_879(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v11 = v3;
    id v4 = [v3 walletOrders];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v6 postNotificationName:@"com.apple.coresuggestions.SGDissectOrderSuggestion" object:0];
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (void *)MEMORY[0x1E4F5DB90];
    id v9 = [v11 combinedSuggestions];
    id v10 = [v8 responseWith:v9];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

    id v3 = v11;
  }
}

SGSimpleMailMessage *__81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_2(uint64_t a1)
{
  return +[SGMessage messageWithSearchableItem:*(void *)(a1 + 32)];
}

void __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [v2 error];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Failed to clear caches in dissectAttachmentsFromSearchableItem, error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 spotlightBundleIdentifier];
    id v15 = [v10 spotlightUniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    long long v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = a5;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: suggestionsFromSimpleMailMessage: %@ : %@ options: %tu", buf, 0x20u);
  }
  id v16 = [(SGDSuggestManager *)self _emailContentCacheSalt];
  uint64_t v17 = SGSha256Data(v12, v16);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke;
  v23[3] = &unk_1E65B91C0;
  id v24 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2;
  v21[3] = &unk_1E65B91E8;
  id v22 = v10;
  id v18 = v10;
  id v19 = v11;
  LOWORD(v20) = 1;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v17, a5, v23, 0, v21, 0, v20);
}

void __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F5DB90];
    id v5 = [a2 combinedSuggestions];
    id v4 = [v3 responseWith:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

id __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = sgLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v14;
    __int16 v32 = 2048;
    unint64_t v33 = a6;
    _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: suggestionsFromEmailContent: %@ options: %tu", buf, 0x16u);
  }

  uint64_t v17 = [(SGDSuggestManager *)self _emailContentCacheSalt];
  id v18 = SGSha256Data(v13, v17);

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke;
  v28[3] = &unk_1E65B91C0;
  id v29 = v15;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke_2;
  v24[3] = &unk_1E65B6290;
  id v25 = v13;
  id v26 = v12;
  id v27 = v14;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  id v22 = v15;
  LOWORD(v23) = 1;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v18, a6, v28, 0, v24, 0, v23);
}

void __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F5DB90];
    id v5 = [a2 combinedSuggestions];
    id v4 = [v3 responseWith:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

id __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke_2(void *a1)
{
  return +[SGSimpleMailMessage parseRfc822Headers:a1[4] htmlContent:a1[5] source:a1[6]];
}

- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 bundleID];
    id v12 = [v8 uniqueIdentifier];
    int v17 = 138412802;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: harvestedSuggestionsFromSearchableItem: %@ : %@ options: %tu", (uint8_t *)&v17, 0x20u);
  }
  id v13 = (void *)MEMORY[0x1E4F93760];
  id v14 = [v8 bundleID];
  LOBYTE(v13) = [v13 shouldAdmitContentFromBundleIdentifier:v14];

  if (v13)
  {
    [(SGDSuggestManager *)self _suggestionsFromSearchableItem:v8 options:a4 dissectIfNecessary:0 withCompletion:v9];
  }
  else
  {
    id v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromSearchableItem ignoring item since the bundle is disallowed by user's settings", (uint8_t *)&v17, 2u);
    }

    id v16 = [MEMORY[0x1E4F5DB90] responseWith:0];
    v9[2](v9, v16);
  }
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6
{
  id v12 = a3;
  id v10 = (void (**)(id, void *))a6;
  id v11 = +[SGDSuggestManager preprocessSearchableItem:v12];
  if (v11) {
    v10[2](v10, v11);
  }
  else {
    [(SGDSuggestManager *)self _suggestionsFromSearchableItem:v12 options:a4 dissectIfNecessary:1 processingType:a5 completionDelivery:0 withCompletion:v10];
  }
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
}

- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4627, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = [v9 length];
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-registerURLFeedback:%d url.length:%tu called", buf, 0x12u);
  }

  BOOL v12 = [(SGSqlEntityStore *)self->_harvestStore registerURLFeedback:v6 absoluteURL:v9];
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v12;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-registerURLFeedback returning %d", buf, 8u);
  }

  id v14 = objc_opt_new();
  v10[2](v10, v14);
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7
{
}

- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if ([(id)objc_opt_class() titleSuggestionForMessageFeatureEnabled])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-titleSuggestionForMessage", buf, 2u);
    }

    if (!v8)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4472, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
    }
    if (titleSuggestionForMessage_withCompletion___pasOnceToken202 != -1) {
      dispatch_once(&titleSuggestionForMessage_withCompletion___pasOnceToken202, &__block_literal_global_844);
    }
    id v10 = (id)titleSuggestionForMessage_withCompletion___pasExprOnceResult;
    *(void *)buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__4015;
    long long v28 = __Block_byref_object_dispose__4016;
    id v29 = 0;
    if (_serialQueueForTitleGeneration__pasOnceToken200 != -1) {
      dispatch_once(&_serialQueueForTitleGeneration__pasOnceToken200, &__block_literal_global_1246);
    }
    id v11 = _serialQueueForTitleGeneration__pasExprOnceResult;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_2;
    block[3] = &unk_1E65C0700;
    id v21 = v7;
    uint64_t v23 = buf;
    id v12 = v10;
    id v22 = v12;
    dispatch_async_and_wait(v11, block);
    id v13 = (void *)*((void *)v25 + 5);
    if (v13 && ([v13 isEqualToString:&stru_1F24EEF20] & 1) == 0)
    {
      BOOL v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *((void *)v25 + 5);
        *(_DWORD *)unint64_t v30 = 138477827;
        uint64_t v31 = v18;
        _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Returning title '%{private}@'", v30, 0xCu);
      }

      id v15 = [MEMORY[0x1E4F5DB90] responseWith:*((void *)v25 + 5)];
      v8[2](v8, v15);
    }
    else
    {
      id v14 = sgLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unint64_t v30 = 0;
        _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: No Title generated from plugin", v30, 2u);
      }

      id v15 = [MEMORY[0x1E4F5DB90] responseWith:0];
      v8[2](v8, v15);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v16 = [MEMORY[0x1E4F5DB90] responseWith:0];
    v8[2](v8, v16);
  }
}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_2(uint64_t a1)
{
  v54[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) messageUnits];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) messageUnits];
    id v4 = [v3 objectAtIndexedSubscript:0];

    if (v4)
    {
      id v5 = (id *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 32) messageUnits];
      id v7 = [v6 objectAtIndexedSubscript:0];

      uint64_t v8 = [*(id *)(a1 + 32) subject];
      id v9 = (void *)v8;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      else {
        id v10 = &stru_1F24EEF20;
      }
      id v11 = v10;

      uint64_t v12 = [*v5 type];
      id v13 = (void *)v12;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      else {
        id v14 = &stru_1F24EEF20;
      }
      id v15 = v14;

      id v16 = [*v5 messageId];
      if (!v16)
      {
        id v17 = [NSString alloc];
        uint64_t v18 = [(__CFString *)v11 sg_md5Hash];
        uint64_t v19 = [v7 sg_md5Hash];
        id v16 = (void *)[v17 initWithFormat:@"%@-%@-%@", v15, v18, v19];
      }
      uint64_t v20 = [*(id *)(a1 + 40) objectForKey:v16];
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        goto LABEL_34;
      }
      uint64_t v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: No title found in cache", buf, 2u);
      }

      id v24 = [MEMORY[0x1E4F28F80] processInfo];
      int v25 = [v24 isLowPowerModeEnabled];

      if (v25)
      {
        uint64_t v26 = sgLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Skipping running Title Generation model since Low Power Mode is Active", buf, 2u);
        }
        goto LABEL_33;
      }
      id v27 = +[SGAsset localeAsset];
      uint64_t v26 = [v27 filesystemPathForAssetDataRelativePath:@"MLTitleGenerationModel.assets"];

      if (!v26)
      {
        long long v28 = sgLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v28, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Assets not found for title suggestion", buf, 2u);
        }
        goto LABEL_32;
      }
      long long v28 = (id)*MEMORY[0x1E4F5DF08];
      uint64_t v29 = *MEMORY[0x1E4F5DF10];
      v53[0] = @"TaskName";
      v53[1] = @"InputMessage";
      v54[0] = v29;
      v54[1] = v7;
      v53[2] = @"InputMessageSubject";
      v53[3] = @"InputMessageType";
      v54[2] = v11;
      v54[3] = v15;
      v53[4] = @"AssetFolderPath";
      v54[4] = v26;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:5];
      uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F737C0]) initWithParametersDict:v42];
      *(void *)buf = 0;
      v48 = buf;
      uint64_t v49 = 0x3032000000;
      id v50 = __Block_byref_object_copy__4015;
      id v51 = __Block_byref_object_dispose__4016;
      id v52 = 0;
      dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
      uint64_t v31 = (void *)MEMORY[0x1E4F737B8];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_870;
      v44[3] = &unk_1E65B9548;
      id v46 = buf;
      uint64_t v32 = v30;
      v45 = v32;
      [v31 performTask:v41 forPluginID:v28 completionHandler:v44];
      if ([MEMORY[0x1E4F93B18] waitForSemaphore:v32 timeoutSeconds:2.0] == 1)
      {
        unint64_t v33 = sgLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v43 = 0;
          _os_log_error_impl(&dword_1CA650000, v33, OS_LOG_TYPE_ERROR, "SGDSuggestManager: MLRuntime Plugin task timeout", v43, 2u);
        }
      }
      else
      {
        uint64_t v34 = (void *)*((void *)v48 + 5);
        if (!v34) {
          goto LABEL_29;
        }
        __int16 v35 = [v34 objectForKeyedSubscript:@"title"];
        BOOL v36 = v35 == 0;

        if (v36) {
          goto LABEL_29;
        }
        uint64_t v37 = [*((id *)v48 + 5) objectForKeyedSubscript:@"title"];
        uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
        unint64_t v33 = *(NSObject **)(v38 + 40);
        *(void *)(v38 + 40) = v37;
      }

LABEL_29:
      uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v40 = *(void *)(v39 + 40);
      if (!v40)
      {
        *(void *)(v39 + 40) = &stru_1F24EEF20;
        uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [*(id *)(a1 + 40) setObject:v40 forKey:v16];

      _Block_object_dispose(buf, 8);
LABEL_32:

LABEL_33:
LABEL_34:

      goto LABEL_35;
    }
  }
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Found empty input message for title suggestion", buf, 2u);
  }
LABEL_35:
}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_870(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 JSONResult];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGDSuggestManager: MLRuntime Plugin Task failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:5];
  uint64_t v2 = (void *)titleSuggestionForMessage_withCompletion___pasExprOnceResult;
  titleSuggestionForMessage_withCompletion___pasExprOnceResult = v1;
}

- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v21 = (void (**)(id, void *))a4;
  if (!v21)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4443, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-ipsosMessagesFromSearchableItems", buf, 2u);
  }

  id v9 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x1CB79B230]();
        id v17 = +[SGThreadParser ipsosMessageWithSearchableItem:v15];
        if (v17)
        {
          uint64_t v18 = [MEMORY[0x1E4F5DA38] messageWithIPMessage:v17];
          [v9 addObject:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v19 = [MEMORY[0x1E4F5DB90] responseWith:v9];
  v21[2](v21, v19);
}

- (id)_showInFormatStringWithLocalization:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SGDSuggestManager__showInFormatStringWithLocalization___block_invoke;
  block[3] = &unk_1E65BEF88;
  id v9 = v3;
  uint64_t v4 = _showInFormatStringWithLocalization__once;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_showInFormatStringWithLocalization__once, block);
  }
  id v6 = (id)_showInFormatStringWithLocalization__localizedString;

  return v6;
}

void __57__SGDSuggestManager__showInFormatStringWithLocalization___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[SGFoundInAppsStrings localizedStringForKey:@"Show in %@" preferredLocalization:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)_showInFormatStringWithLocalization__localizedString;
  _showInFormatStringWithLocalization__localizedString = v1;

  if (!_showInFormatStringWithLocalization__localizedString)
  {
    id v5 = +[SGFoundInAppsStrings resourceBundle];
    uint64_t v3 = [v5 localizedStringForKey:@"Show in %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
    uint64_t v4 = (void *)_showInFormatStringWithLocalization__localizedString;
    _showInFormatStringWithLocalization__localizedString = v3;
  }
}

void __39__SGDSuggestManager__maybeFormatString__block_invoke()
{
  uint64_t v0 = +[SGFoundInAppsStrings localizedStringForKey:@"Maybe: %@" preferredLocalization:0];
  uint64_t v1 = (void *)_maybeFormatString_localizedString;
  _maybeFormatString_localizedString = v0;

  if (!_maybeFormatString_localizedString)
  {
    id v4 = +[SGFoundInAppsStrings resourceBundle];
    uint64_t v2 = [v4 localizedStringForKey:@"Maybe: %@" value:&stru_1F24EEF20 table:*MEMORY[0x1E4F5DF48]];
    uint64_t v3 = (void *)_maybeFormatString_localizedString;
    _maybeFormatString_localizedString = v2;
  }
}

- (void)powerStateWithCompletion:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F93788];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [v3 defaultBudget];
  id v7 = [v5 throttlingState];

  id v6 = [MEMORY[0x1E4F5DB90] responseWith:v7];
  v4[2](v4, v6);
}

- (void)deleteCloudKitZoneWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SGDCloudKitSync sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SGDSuggestManager_deleteCloudKitZoneWithCompletion___block_invoke;
  v6[3] = &unk_1E65B6268;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteZoneWithCompletion:v6];
}

void __54__SGDSuggestManager_deleteCloudKitZoneWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5DB88] responseWithError:a2];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (void)clearContactAggregatorConversation:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Dropping aggregated contact for conversation: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[SGDSuggestManager contactAggregator];
  [v5 clearContactsWithConversationIdentifier:v3];
}

- (void)clearContactAggregator
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Dropping all aggregated contacts", v4, 2u);
  }

  id v3 = +[SGDSuggestManager contactAggregator];
  [v3 clear];
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)sleepWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SGDSuggestManager_sleepWithCompletion___block_invoke;
  block[3] = &unk_1E65B8D68;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __41__SGDSuggestManager_sleepWithCompletion___block_invoke(uint64_t a1)
{
  usleep(0xAAE60u);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)daemonExitWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "exiting due to daemonExitWithCompletion request", v5, 2u);
  }

  _exit(0);
}

- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v5 = (id)objc_opt_new();
  [v5 removeAllStoredPseudoContacts];
  id v4 = objc_opt_new();
  v3[2](v3, v4);
}

- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke;
  v11[3] = &unk_1E65B7DF0;
  v11[4] = self;
  id v12 = v8;
  unsigned __int16 v13 = a4;
  unsigned __int16 v14 = a5;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x1CB79B4C0](v11);
  if (logEventInteractionForEventWithUniqueKey_interface_actionType___pasOnceToken195 != -1) {
    dispatch_once(&logEventInteractionForEventWithUniqueKey_interface_actionType___pasOnceToken195, &__block_literal_global_826);
  }
  [MEMORY[0x1E4F93B18] runAsyncOnQueue:logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult afterDelaySeconds:v10 block:5.0];
}

void __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entityFromUniqueKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEventInteractionForEntity:v2 interface:*(unsigned __int16 *)(a1 + 48) actionType:*(unsigned __int16 *)(a1 + 50)];
}

void __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke_2()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.suggestd.event-metrics-queue", v1);
  id v3 = (void *)logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult;
  logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult = (uint64_t)v2;
}

- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [v8 duplicateKey];
  [v9 entityType];
  char IsEvent = SGEntityTypeIsEvent();

  if (IsEvent)
  {
    if ([v8 isNaturalLanguageEvent])
    {
      harvestStore = self->_harvestStore;
      id v12 = [v8 duplicateKey];
      unsigned __int16 v13 = [(SGSqlEntityStore *)harvestStore loadEventByDuplicateKey:v12];

      unsigned __int16 v14 = [v13 convertToEvent:self->_harvestStore];
      ekStoreProvider = self->_ekStoreProvider;
      if (ekStoreProvider) {
        callBlockWithEKEventStoreForReading = (void (**)(id, void *))ekStoreProvider->_callBlockWithEKEventStoreForReading;
      }
      else {
        callBlockWithEKEventStoreForReading = 0;
      }
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      long long v22 = __71__SGDSuggestManager_logEventInteractionForEntity_interface_actionType___block_invoke;
      long long v23 = &unk_1E65B6240;
      id v17 = v14;
      id v24 = v17;
      __int16 v25 = v6;
      __int16 v26 = v5;
      callBlockWithEKEventStoreForReading[2](callBlockWithEKEventStoreForReading, &v20);
      if (v6 == 2 && v5 == 4) {
        -[SGDSuggestManager bumptTTLForNLEvent:](self, "bumptTTLForNLEvent:", v17, v20, v21, v22, v23);
      }
    }
    else
    {
      uint64_t v19 = +[SGRTCLogging defaultLogger];
      [v19 logEventInteractionForEntity:v8 interface:v6 actionType:v5];
    }
  }
  else
  {
    uint64_t v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "Entity is not a pseudo event", buf, 2u);
    }
  }
}

void __71__SGDSuggestManager_logEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sg_confirmedEKEventForSGEvent:", *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1E4F5DAB8] recordInteractionForEventWithInterface:*(unsigned __int16 *)(a1 + 40) actionType:*(unsigned __int16 *)(a1 + 42) harvestedSGEvent:*(void *)(a1 + 32) curatedEKEvent:v3];
}

- (id)entityFromUniqueKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 hasPrefix:@"x-apple-eventkit:///SuggestedEventInfo/"])
  {
    sgLogHandle();
    uint64_t v6 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      id v7 = "Not logging event interaction for bogus uniqueKey: %@";
LABEL_13:
      _os_log_impl(&dword_1CA650000, &v6->super, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!v5)
  {
    unsigned __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 4245, @"Invalid parameter not satisfying: %@", @"uniqueKey" object file lineNumber description];
  }
  if (!+[SGDuplicateKey serializationPassesBasicScrutiny:v5])
  {
    sgLogHandle();
    uint64_t v6 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      id v7 = "Not logging event interaction for uniqueKey with bad serialization: %@";
      goto LABEL_13;
    }
LABEL_14:
    id v10 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = [[SGDuplicateKey alloc] initWithSerialized:v5];
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "Attempting to retrieve entity from harvestStore for uniqueKey = %@", buf, 0xCu);
  }

  id v9 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByKey:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Couldn't find Entity with uniqueKey = %@", buf, 0xCu);
    }
  }
LABEL_19:

  return v10;
}

- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v11 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:a3];
  id v8 = [v11 duplicateKey];
  uint64_t v9 = [v8 entityType];

  if (v9 == 22)
  {
    id v10 = +[SGRTCLogging defaultLogger];
    [v10 logReminderInteractionFromEntity:v11 usingStore:self->_harvestStore interface:v6 actionType:v5];
  }
  else if (v9 == 2)
  {
    [(SGDSuggestManager *)self logEventInteractionForEntity:v11 interface:v6 actionType:v5];
  }
}

- (void)logEventInteractionForRealtimeEvent:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v16 = (id)objc_opt_new();
  LODWORD(self) = [(SGDSuggestManager *)self clientIsMail];
  uint64_t v9 = [SGDuplicateKey alloc];
  if (self)
  {
    id v10 = [[SGEmailKey alloc] initWithSource:&stru_1F24EEF20 messageId:&stru_1F24EEF20];
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = 5;
  }
  else
  {
    id v10 = [(SGMessageKey *)[SGTextMessageKey alloc] initWithSource:&stru_1F24EEF20 uniqueIdentifier:&stru_1F24EEF20];
    id v11 = v9;
    id v12 = v10;
    uint64_t v13 = 13;
  }
  unsigned __int16 v14 = [(SGDuplicateKey *)v11 initWithEntityKey:v12 entityType:v13 parentKey:0];
  [v16 setDuplicateKey:v14];

  uint64_t v15 = +[SGRTCLogging defaultLogger];
  [v15 logEventInteractionForRealtimeEvent:v8 parentEntity:v16 interface:v6 actionType:v5];
}

- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasOnceToken187 != -1) {
    dispatch_once(&logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasOnceToken187, &__block_literal_global_809);
  }
  uint64_t v9 = [(id)logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult result];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__4015;
  id v24 = __Block_byref_object_dispose__4016;
  id v25 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unsigned __int16 v14 = __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_3;
  uint64_t v15 = &unk_1E65B6218;
  uint64_t v19 = &v20;
  id v10 = v8;
  id v16 = v10;
  uint64_t v17 = self;
  uint64_t v18 = @"notFromSuggestions";
  [v9 runWithLockAcquired:&v12];
  id v11 = (void *)v21[5];
  if (v11 && (objc_msgSend(v11, "isEqualToString:", @"notFromSuggestions", v12, v13, v14, v15) & 1) == 0) {
    [(SGDSuggestManager *)self logEventInteractionForEventWithUniqueKey:v21[5] interface:v6 actionType:v5];
  }

  _Block_object_dispose(&v20, 8);
}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if ((unint64_t)[v3 count] >= 0x64) {
      [v3 removeAllObjects];
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 56);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_4;
    v11[3] = &unk_1E65B61F0;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = v9;
    uint64_t v15 = v10;
    id v13 = v3;
    id v14 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }
}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 calendarItemsWithExternalIdentifier:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 suggestionInfo];
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [v4 suggestionInfo];
    uint64_t v8 = [v7 uniqueKey];

    if (v8)
    {
      id v9 = [v4 suggestionInfo];
      uint64_t v10 = [v9 uniqueKey];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      [*(id *)(a1 + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v17 = 138412290;
        uint64_t v18 = v13;
        id v14 = MEMORY[0x1E4F14500];
        uint64_t v15 = "Caching event from with external identifer = %@.";
        uint32_t v16 = 12;
LABEL_9:
        _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, v16);
      }
    }
    else
    {
LABEL_6:
      [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 32)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v17) = 0;
        id v14 = MEMORY[0x1E4F14500];
        uint64_t v15 = "Event found for Spotlight interaction, but not from Suggestions.";
        uint32_t v16 = 2;
        goto LABEL_9;
      }
    }
  }
}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_811];
  dispatch_queue_t v2 = (void *)logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult;
  logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult = v1;
}

id __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v1 = objc_opt_new();
  dispatch_queue_t v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_opt_new();
  v5.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v4];

  [v12 setApp:v5.var0];
  uint64_t v6 = [MEMORY[0x1E4F93728] sharedInstance];
  [v6 trackScalarForMessage:v12];

  id v7 = [NSString alloc];
  uint64_t v8 = *MEMORY[0x1E4F5DEF0];
  id v9 = [v12 key];
  uint64_t v10 = (void *)[v7 initWithFormat:@"%@.%@", v8, v9];

  uint64_t v11 = [v12 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7 = a5;
  id v15 = (id)objc_opt_new();
  [v15 setWasSuggestedContact:a3 != 0];
  v8.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v7];

  [v15 setApp:v8.var0];
  id v9 = [MEMORY[0x1E4F93728] sharedInstance];
  [v9 trackScalarForMessage:v15];

  id v10 = [NSString alloc];
  uint64_t v11 = *MEMORY[0x1E4F5DEF0];
  id v12 = [v15 key];
  uint64_t v13 = (void *)[v10 initWithFormat:@"%@.%@", v11, v12];

  id v14 = [v15 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v6 = a5;
  id v14 = (id)objc_opt_new();
  v7.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v6];

  [v14 setApp:v7.var0];
  SGMContactDetailUsedApp_ v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v14];

  id v9 = [NSString alloc];
  uint64_t v10 = *MEMORY[0x1E4F5DEF0];
  uint64_t v11 = [v14 key];
  id v12 = (void *)[v9 initWithFormat:@"%@.%@", v10, v11];

  uint64_t v13 = [v14 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v6 = a5;
  id v14 = (id)objc_opt_new();
  v7.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v6];

  [v14 setApp:v7.var0];
  SGMContactDetailUsedApp_ v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v14];

  id v9 = [NSString alloc];
  uint64_t v10 = *MEMORY[0x1E4F5DEF0];
  uint64_t v11 = [v14 key];
  id v12 = (void *)[v9 initWithFormat:@"%@.%@", v10, v11];

  uint64_t v13 = [v14 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7 = a5;
  id v15 = (id)objc_opt_new();
  [v15 setWasSuggestedContact:a3 != 0];
  [v15 setWasKnownContact:0];
  v8.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v7];

  [v15 setApp:v8.var0];
  id v9 = [MEMORY[0x1E4F93728] sharedInstance];
  [v9 trackScalarForMessage:v15];

  id v10 = [NSString alloc];
  uint64_t v11 = *MEMORY[0x1E4F5DEF0];
  id v12 = [v15 key];
  uint64_t v13 = (void *)[v10 initWithFormat:@"%@.%@", v11, v12];

  id v14 = [v15 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7 = a5;
  id v15 = (id)objc_opt_new();
  [v15 setWasSuggestedContact:a3 != 0];
  [v15 setWasKnownContact:*MEMORY[0x1E4F5DE88] != 0];
  v8.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v7];

  [v15 setApp:v8.var0];
  id v9 = [MEMORY[0x1E4F93728] sharedInstance];
  [v9 trackScalarForMessage:v15];

  id v10 = [NSString alloc];
  uint64_t v11 = *MEMORY[0x1E4F5DEF0];
  id v12 = [v15 key];
  uint64_t v13 = (void *)[v10 initWithFormat:@"%@.%@", v11, v12];

  id v14 = [v15 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v7 = (a3 >> 3) & 1;
  BOOL v8 = a4 != 0;
  id v9 = a6;
  id v17 = (id)objc_opt_new();
  [v17 setWasSuggestedContact:v8];
  [v17 setWasKnownContact:v7];
  v10.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v9];

  [v17 setApp:v10.var0];
  uint64_t v11 = [MEMORY[0x1E4F93728] sharedInstance];
  [v11 trackScalarForMessage:v17];

  id v12 = [NSString alloc];
  uint64_t v13 = *MEMORY[0x1E4F5DEF0];
  id v14 = [v17 key];
  id v15 = (void *)[v12 initWithFormat:@"%@.%@", v13, v14];

  uint32_t v16 = [v17 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v7 = (a3 >> 3) & 1;
  BOOL v8 = a4 != 0;
  id v9 = a6;
  id v17 = (id)objc_opt_new();
  [v17 setWasSuggestedContact:v8];
  [v17 setWasKnownContact:v7];
  v10.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v9];

  [v17 setApp:v10.var0];
  uint64_t v11 = [MEMORY[0x1E4F93728] sharedInstance];
  [v11 trackScalarForMessage:v17];

  id v12 = [NSString alloc];
  uint64_t v13 = *MEMORY[0x1E4F5DEF0];
  id v14 = [v17 key];
  id v15 = (void *)[v12 initWithFormat:@"%@.%@", v13, v14];

  uint32_t v16 = [v17 dictionaryRepresentation];
  AnalyticsSendEvent();
}

- (void)logUnknownContactInformationShownCount:(unint64_t)a3 notShownCount:(unint64_t)a4 bundleId:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SGDSuggestManager_logUnknownContactInformationShownCount_notShownCount_bundleId___block_invoke;
  v11[3] = &unk_1E65B61C8;
  void v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  SGMContactDetailUsedApp_ v10 = (void (**)(void, void, void))MEMORY[0x1CB79B4C0](v11);
  v10[2](v10, 1, a3);
  v10[2](v10, 0, a4);
}

void __83__SGDSuggestManager_logUnknownContactInformationShownCount_notShownCount_bundleId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v14 = @"misses";
      if (a2) {
        id v14 = @"hits";
      }
      *(_DWORD *)buf = 138412546;
      uint32_t v16 = v14;
      __int16 v17 = 2048;
      uint64_t v18 = a3;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "#logUnknownContactInformationShownCount names for detail %@: %lu", buf, 0x16u);
    }

    uint64_t v7 = objc_opt_new();
    objc_msgSend(v7, "setApp:", objc_msgSend(*(id *)(a1 + 32), "_appEnumForBundleId:", *(void *)(a1 + 40)));
    [v7 setWasSuggestedContact:a2];
    id v8 = [MEMORY[0x1E4F93728] sharedInstance];
    [v8 trackScalarForMessage:v7];

    id v9 = [NSString alloc];
    uint64_t v10 = *MEMORY[0x1E4F5DEF0];
    uint64_t v11 = [v7 key];
    id v12 = (void *)[v9 initWithFormat:@"%@.%@", v10, v11];

    uint64_t v13 = [v7 dictionaryRepresentation];
    AnalyticsSendEvent();
  }
}

- (SGMContactDetailUsedApp_)_appEnumForBundleId:(id)a3
{
  id v4 = (NSString *)a3;
  if (!v4)
  {
    id v4 = self->_clientName;
    if (!v4)
    {
LABEL_7:
      v7.var0 = *MEMORY[0x1E4F5DD80];
      goto LABEL_9;
    }
  }
  SGMContactDetailUsedApp_ v5 = [(NSDictionary *)self->_bundleIdToPET objectForKey:v4];
  if (!v5)
  {
    id v8 = (void *)MEMORY[0x1CB79B230]();
    id v9 = [(NSString *)v4 stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    if (([v9 isEqualToString:v4] & 1) == 0)
    {
      v7.var0 = (unint64_t)[(SGDSuggestManager *)self _appEnumForBundleId:v9];

      goto LABEL_9;
    }

    uint64_t v10 = objc_opt_new();
    [v10 setBundleId:v4];
    uint64_t v11 = [MEMORY[0x1E4F93728] sharedInstance];
    [v11 trackScalarForMessage:v10];

    id v12 = [NSString alloc];
    uint64_t v13 = *MEMORY[0x1E4F5DEF0];
    id v14 = [v10 key];
    id v15 = (void *)[v12 initWithFormat:@"%@.%@", v13, v14];

    uint32_t v16 = [v10 dictionaryRepresentation];
    AnalyticsSendEvent();

    goto LABEL_7;
  }
  id v6 = v5;
  v7.var0 = [v5 unsignedIntegerValue];

LABEL_9:
  return v7;
}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_INFO, "SGDSuggestManager-waitForEventWithIdentifier: %@ -toAppearInEventStoreWithLastModificationDate: %@", buf, 0x16u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke;
  v26[3] = &unk_1E65B6150;
  id v12 = v9;
  id v27 = v12;
  uint64_t v13 = (unsigned int (**)(void, void))MEMORY[0x1CB79B4C0](v26);
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider) {
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_newEKEventStoreGetter;
  }
  callBlockWithEKEventStoreForReading = (void (*)(void))ekStoreProvider->_callBlockWithEKEventStoreForReading;
  uint32_t v16 = ekStoreProvider;
  __int16 v17 = callBlockWithEKEventStoreForReading();

  uint64_t v18 = [v17 eventWithIdentifier:v8];
  if (!((unsigned int (**)(void, void *))v13)[2](v13, v18))
  {
    uint64_t v20 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_2;
    block[3] = &unk_1E65B61A0;
    id v22 = v17;
    id v23 = v8;
    id v24 = v13;
    id v25 = v10;
    dispatch_async(v20, block);

    uint64_t v19 = v22;
    goto LABEL_9;
  }
  if (v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F5DB90] responseWith:MEMORY[0x1E4F1CC38]];
    (*((void (**)(id, void *))v10 + 2))(v10, v19);
LABEL_9:
  }
}

BOOL __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(void *)(a1 + 32))
    {
      SGMContactDetailUsedApp_ v5 = [v3 lastModifiedDate];
      [v5 timeIntervalSinceReferenceDate];
      double v7 = v6;
      [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
      BOOL v9 = v7 >= v8;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F25460];
  SGMContactDetailUsedApp_ v5 = objc_opt_new();
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_3;
  uint64_t v18 = &unk_1E65B6178;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  double v6 = v2;
  uint64_t v21 = v6;
  double v7 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:&v15];

  double v8 = objc_msgSend(*(id *)(a1 + 32), "eventWithIdentifier:", *(void *)(a1 + 40), v15, v16, v17, v18);
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))()) {
    dispatch_semaphore_signal(v6);
  }
  int v9 = [MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:5.0];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:v7];

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F5DB90];
    uint64_t v13 = [NSNumber numberWithInt:v9 == 0];
    id v14 = [v12 responseWith:v13];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);
  }
}

void __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventWithIdentifier:*(void *)(a1 + 40)];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

- (void)noopWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)keepDirty:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_dirtyLock lock];
  dirtyTransaction = self->_dirtyTransaction;
  if (v3)
  {
    if (dirtyTransaction) {
      goto LABEL_6;
    }
    double v6 = +[SGXpcTransaction transactionWithName:"com.apple.suggestions.suggestManagerKeepDirty"];
    dirtyTransaction = self->_dirtyTransaction;
  }
  else
  {
    double v6 = 0;
  }
  self->_dirtyTransaction = v6;

LABEL_6:
  dirtyLock = self->_dirtyLock;
  [(NSLock *)dirtyLock unlock];
}

- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *))a7;
  uint64_t v16 = *MEMORY[0x1E4F5DC60];
  if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:*MEMORY[0x1E4F5DC60]])
  {
    __int16 v17 = +[SGDuplicateKey duplicateKeyForWebPageFromSource:v16];
    uint64_t v18 = [[SGPipelineEntity alloc] initWithDuplicateKey:v17 title:v12];
    [v14 timeIntervalSince1970];
    -[SGPipelineEntity setCreationTimestamp:](v18, "setCreationTimestamp:");
    [v14 timeIntervalSince1970];
    -[SGPipelineEntity setLastModifiedTimestamp:](v18, "setLastModifiedTimestamp:");
    __int16 v30 = objc_opt_new();
    id v31 = v13;
    id v32 = v11;
    [v30 dissectURL:v11 title:v12 htmlPayload:v13 entity:v18];
    id v19 = +[SGSqlEntityStore sqlStoreInMemory];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = [(SGPipelineEntity *)v18 enrichments];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          [v19 writeEnrichment:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v22);
    }

    id v25 = [(SGPipelineEntity *)v18 enrichments];
    unint64_t v33 = v19;
    id v26 = v19;
    id v27 = sgMapAndFilter();

    uint64_t v28 = [MEMORY[0x1E4F5DB90] responseWith:v27];
    v15[2](v15, v28);

    id v13 = v31;
    id v11 = v32;
  }
  else
  {
    id v29 = sgLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_INFO, "realtimeSuggestionsFromURL ignoring item since Safari is disallowed by user's settings", buf, 2u);
    }

    __int16 v17 = [MEMORY[0x1E4F5DB90] responseWith:0];
    v15[2](v15, v17);
  }
}

id __96__SGDSuggestManager_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 duplicateKey];
  uint64_t v5 = [v4 entityType];

  if (v5 != 2) {
    goto LABEL_4;
  }
  double v6 = *(void **)(a1 + 32);
  double v7 = [v3 duplicateKey];
  double v8 = [v6 loadEventByDuplicateKey:v7];
  int v9 = [v8 convertToEvent:*(void *)(a1 + 32)];

  if (v9)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F5DB00], "realtimeEventForNewEvent:harvested:", v9, objc_msgSend(*(id *)(a1 + 32), "isEphemeral") ^ 1);
  }
  else
  {
LABEL_4:
    id v10 = 0;
  }

  return v10;
}

- (void)geocodeEnrichmentsInPipelineEntity:(id)a3 withCompletion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  uint64_t v6 = *MEMORY[0x1E4F5DC08];
  double v7 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  LODWORD(v6) = [v7 containsObject:v6];

  if (v6)
  {
    double v8 = sgDeveloperLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – \"Show Siri Suggestions\" disabled in Calendar.", buf, 2u);
    }
  }
  if ((objc_msgSend(MEMORY[0x1E4F5DAF0], "allowGeocode", v23) & 1) == 0)
  {
    int v9 = sgDeveloperLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – you must acknowledge \"What's new in Calendar\" screen in the Calendar app.", buf, 2u);
    }
  }
  id v10 = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v5;
  id v11 = [v5 enrichments];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
        if ([MEMORY[0x1E4F5DAF0] allowGeocode])
        {
          __int16 v17 = +[SGStorageEvent storageEventFromEntity:v16];
          dispatch_group_enter(v10);
          uint64_t v18 = (void *)MEMORY[0x1E4F5DA10];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke;
          v28[3] = &unk_1E65BBA90;
          id v29 = v17;
          __int16 v30 = v16;
          id v31 = v10;
          id v19 = v17;
          [v18 geocodeEvent:v19 withCallback:v28];
        }
        else
        {
          [v16 setPendingGeocode:1];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v13);
  }

  qos_class_t v20 = qos_class_self();
  uint64_t v21 = dispatch_get_global_queue(v20, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke_2;
  block[3] = &unk_1E65B8D68;
  id v27 = v24;
  id v22 = v24;
  dispatch_group_notify(v10, v21, block);
}

void __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "Geocode modified locations, updating enrichment", v13, 2u);
    }

    id v5 = [*(id *)(a1 + 40) locations];
    [v5 removeAllObjects];

    uint64_t v6 = [*(id *)(a1 + 40) locations];
    double v7 = [v3 locations];
    [v6 addObjectsFromArray:v7];

    double v8 = [v3 when];
    [*(id *)(a1 + 40) setTimeRange:v8];

    int v9 = [*(id *)(a1 + 40) tags];
    id v10 = [MEMORY[0x1E4F5D9F0] allDay];
    int v11 = [v9 containsObject:v10];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 40) timeRange];
      if (([v12 isValidAllDayRange] & 1) == 0) {
        __assert_rtn("-[SGDSuggestManager geocodeEnrichmentsInPipelineEntity:withCompletion:]_block_invoke", "SGDSuggestManager.m", 3879, "[enrichment.timeRange isValidAllDayRange]");
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "SGDSuggestManager suggestionsFromURL - Start processing webpage", buf, 2u);
  }

  uint64_t v15 = sgEventsLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v10 host];
    uint64_t v19 = [v12 length];
    *(_DWORD *)buf = 138740483;
    id v27 = v18;
    __int16 v28 = 2117;
    id v29 = v11;
    __int16 v30 = 2053;
    uint64_t v31 = v19;
    _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-suggestionsFromURL: %{sensitive}@ -title: %{sensitive}@ -HTMLPayload length: %{sensitive}lu ", buf, 0x20u);
  }
  if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:*MEMORY[0x1E4F5DC60]])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke;
    v20[3] = &unk_1E65B8558;
    id v21 = v11;
    id v22 = v10;
    id v23 = v12;
    id v24 = self;
    id v25 = v13;
    SGNotUserInitiated(@"suggestionsFromURL", 2, v20);

    uint64_t v16 = v21;
  }
  else
  {
    __int16 v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "suggestionsFromURL ignoring item since Safari is disallowed by user's settings", buf, 2u);
    }

    uint64_t v16 = [MEMORY[0x1E4F5DB90] responseWith:0];
    (*((void (**)(id, void *))v13 + 2))(v13, v16);
  }
}

void __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke(void *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents])
  {
    id v2 = [MEMORY[0x1E4F1C9C8] date];
    id v3 = +[SGDuplicateKey duplicateKeyForWebPageFromSource:*MEMORY[0x1E4F5DC60]];
    id v4 = [[SGPipelineEntity alloc] initWithDuplicateKey:v3 title:a1[4]];
    [v2 timeIntervalSince1970];
    -[SGPipelineEntity setCreationTimestamp:](v4, "setCreationTimestamp:");
    [v2 timeIntervalSince1970];
    -[SGPipelineEntity setLastModifiedTimestamp:](v4, "setLastModifiedTimestamp:");
    id v5 = objc_opt_new();
    [v5 dissectURL:a1[5] title:a1[4] htmlPayload:a1[6] entity:v4];
    uint64_t v6 = [(SGPipelineEntity *)v4 enrichments];
    double v7 = +[SGDSuggestManager filterPseudoEvents:keepPastEvents:keepPartialEvents:](SGDSuggestManager, "filterPseudoEvents:keepPastEvents:keepPartialEvents:", v6, [MEMORY[0x1E4F5DAF0] showPastEvents], 0);
    [(SGPipelineEntity *)v4 setEnrichments:v7];

    double v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [(SGPipelineEntity *)v4 enrichments];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = [v9 count];
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager suggestionsFromURL: parent entity has %lu enrichment(s) after dissection", buf, 0xCu);
    }
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = (void *)a1[7];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke_779;
    v35[3] = &unk_1E65BEF88;
    id v12 = v10;
    long long v36 = v12;
    [v11 geocodeEnrichmentsInPipelineEntity:v4 withCompletion:v35];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    id v13 = [(SGPipelineEntity *)v4 enrichments];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      __int16 v28 = v3;
      id v29 = v2;
      uint64_t v15 = sgEventsLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [(SGPipelineEntity *)v4 enrichments];
        uint64_t v17 = [v16 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v39 = v17;
        _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_INFO, "Parents entity has %lu enrichements", buf, 0xCu);
      }
      [*(id *)(a1[7] + 8) writeEntity:v4];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v18 = [(SGPipelineEntity *)v4 enrichments];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            id v24 = +[SGDCloudKitSync sharedInstance];
            [v24 addEnrichment:v23 withParentEntity:v4];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v20);
      }

      id v3 = v28;
      id v2 = v29;
    }
    uint64_t v25 = a1[8];
    id v26 = [MEMORY[0x1E4F5DB90] responseWith:0];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    uint64_t v27 = a1[8];
    id v30 = [MEMORY[0x1E4F5DB90] responseWith:0];
    (*(void (**)(uint64_t))(v27 + 16))(v27);
  }
}

intptr_t __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke_779(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)isEventCandidateForURL:(id)a3 title:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SGDSuggestManager_isEventCandidateForURL_title_withCompletion___block_invoke;
  v13[3] = &unk_1E65BFFF0;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  SGNotUserInitiated(@"isEventCandidateForURL", 2, v13);
}

void __65__SGDSuggestManager_isEventCandidateForURL_title_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = sgEventsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager isEventCandidateForURL: Checking classifier output for webpage", (uint8_t *)&v10, 2u);
  }

  id v3 = sgEventsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [*(id *)(a1 + 32) host];
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138740227;
    id v11 = v8;
    __int16 v12 = 2117;
    uint64_t v13 = v9;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-isEventCandidateForURL: %{sensitive}@ -title: %{sensitive}@", (uint8_t *)&v10, 0x16u);
  }
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents])
  {
    id v4 = objc_opt_new();
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isStructuredEventCandidateForURL:title:](v4, "isStructuredEventCandidateForURL:title:", *(void *)(a1 + 32), *(void *)(a1 + 40)));
  }
  else
  {
    id v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGDSuggestManager isEventCandidateForURL: end processing because detectStructuredEvents is OFF.", (uint8_t *)&v10, 2u);
    }
    id v5 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [MEMORY[0x1E4F5DB90] responseWith:v5];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = sgEventsLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [v10 host];
    *(_DWORD *)buf = 138740227;
    uint64_t v25 = v21;
    __int16 v26 = 2117;
    id v27 = v11;
    _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "isEventCandidateForURL: %{sensitive}@ -title: %{sensitive}@", buf, 0x16u);
  }
  if (v10 && v11)
  {
    uint64_t v14 = NSNumber;
    BOOL v15 = ([MEMORY[0x1E4F5DAF0] allowAnyDomainForMarkup] & 1) != 0
       || +[SGDomainWhitelistChecker isStructuredEventCandidateForURL:v10 title:v11];
    uint64_t v17 = [v14 numberWithInt:v15];
    if (v17 && !a5)
    {
      uint64_t v20 = sgEventsLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_INFO, "SGSuggestionsService isEventCandidateForURL: Based on whitelist check, URL is candidate", buf, 2u);
      }

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __86__SGDSuggestManager_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke;
      v22[3] = &unk_1E65B6128;
      id v23 = v12;
      [(SGDSuggestManager *)self isEventCandidateForURL:v10 title:v11 withCompletion:v22];
      uint64_t v19 = v23;
      goto LABEL_20;
    }
  }
  else
  {
    id v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGSuggestionsService isEventCandidateForURL: method called with nil arguments", buf, 2u);
    }

    uint64_t v17 = 0;
  }
  uint64_t v18 = sgEventsLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "SGSuggestionsService isEventCandidateForURL: eventCandidate is nil, domain appears not to be whitelisted.", buf, 2u);
  }

  if (v12)
  {
    uint64_t v19 = [MEMORY[0x1E4F5DB90] responseWith:v17];
    (*((void (**)(id, void *))v12 + 2))(v12, v19);
LABEL_20:
  }
}

void __86__SGDSuggestManager_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F5DB90];
    id v5 = [a2 response1];
    id v4 = [v3 responseWith:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

- (void)schemaOrgToEvents:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "SGDSuggestManager-schemaOrgToEvents", v11, 2u);
  }

  id v8 = objc_opt_new();
  uint64_t v9 = [v8 eventsFromSchemaOrgItems:v6];

  id v10 = [MEMORY[0x1E4F5DB90] responseWith:v9];
  v5[2](v5, v10);
}

- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5
{
  harvestStore = self->_harvestStore;
  id v8 = (void (**)(id, id))a5;
  [(SGSqlEntityStore *)harvestStore deleteInteractionsWithBundleId:a3 groupIdentifiers:a4];
  id v9 = (id)objc_opt_new();
  v8[2](v8, v9);
}

- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  harvestStore = self->_harvestStore;
  id v8 = (void (**)(id, id))a5;
  [(SGSqlEntityStore *)harvestStore deleteInteractionsWithBundleId:a3 identifiers:a4];
  id v9 = (id)objc_opt_new();
  v8[2](v8, v9);
}

- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4
{
  harvestStore = self->_harvestStore;
  id v6 = (void (**)(id, id))a4;
  [(SGSqlEntityStore *)harvestStore deleteInteractionsWithBundleId:a3];
  id v7 = (id)objc_opt_new();
  v6[2](v6, v7);
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E65BFFF0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  SGNotUserInitiated(@"deleteSpotlightReferencesWithBundleIdentifier", 2, v10);
}

void __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) deleteSpotlightReferencesWithBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) _pmlTraining];
  [v2 deleteSessionsWithBundleID:*(void *)(a1 + 40)];

  id v3 = +[SGDPluginManager sharedInstance];
  id v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E65B6100;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 deleteSpotlightReferencesWithBundleIdentifier:v6 completion:v5];
}

void __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished deleting bundle: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[a4 copy];
  id v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    long long v36 = v10;
    _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: deleting spotlight references: %@ : %@", buf, 0x16u);
  }

  if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v8])
  {
    [(SGSqlEntityStore *)self->_harvestStore deleteSpotlightReferencesWithBundleIdentifier:v8 domainIdentifiers:v10];
    if ([v8 isEqualToString:*MEMORY[0x1E4F5DC38]])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = [v10 allDomains];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            [(SGDSuggestManager *)self clearContactAggregatorConversation:*(void *)(*((void *)&v28 + 1) + 8 * v16++)];
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v14);
      }
    }
  }
  uint64_t v17 = [v10 allDomains];
  uint64_t v18 = [v17 allObjects];

  uint64_t v19 = [(SGDSuggestManager *)self _pmlTraining];
  [v19 deleteSessionsWithDomainIdentifiers:v18 bundleID:v8];

  uint64_t v20 = +[SGDPluginManager sharedInstance];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v24[3] = &unk_1E65B60D8;
  id v25 = v10;
  id v26 = v8;
  id v27 = v9;
  id v21 = v9;
  id v22 = v8;
  id v23 = v10;
  [v20 deleteSpotlightReferencesWithBundleIdentifier:v22 domainIdentifiers:v18 completion:v24];
}

void __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished deleting %lu domains from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SGSqlEntityStore *)self->_harvestStore deleteSpotlightReferencesWithBundleIdentifier:v8 uniqueIdentifiers:v9];
  if ([v8 isEqualToString:*MEMORY[0x1E4F5DC38]]) {
    [(SGDSuggestManager *)self clearContactAggregator];
  }
  uint64_t v11 = [(SGDSuggestManager *)self _pmlTraining];
  [v11 deleteSessionsWithIdentifiers:v9 bundleID:v8];

  id v12 = +[SGDPluginManager sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E65B60D8;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v12 deleteSpotlightReferencesWithBundleIdentifier:v14 uniqueIdentifiers:v15 completion:v16];
}

void __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Plugins finished deleting %lu items from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F93760] shouldAdmitContentFromBundleIdentifier:v8]) {
    [(SGSqlEntityStore *)self->_harvestStore markLostSpotlightReferencesWithBundleIdentifier:v8 uniqueIdentifiers:v9];
  }
  uint64_t v11 = +[SGDPluginManager sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__SGDSuggestManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E65B60D8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v11 purgeSpotlightReferencesWithBundleIdentifier:v13 uniqueIdentifiers:v14 completion:v15];
}

void __95__SGDSuggestManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished purging %lu items from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  uint64_t v11 = (void (**)(id, id))a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[SGDSpotlightCommander sharedInstance];
  [v16 requestReimportFromIdentifier:v15 forPersonHandle:v14 startDate:v13 endDate:v12];

  id v17 = (id)objc_opt_new();
  v11[2](v11, v17);
}

- (void)registerForCoreSpotlightIndexing
{
  harvestStore = self->_harvestStore;
  id v3 = +[SGSpotlightContactsAdapter searchableIndex];
  [v3 setIndexDelegate:harvestStore];
}

- (void)_processReservationInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_processReservationInteractions_bundleId_completion___pasOnceToken160 != -1) {
    dispatch_once(&_processReservationInteractions_bundleId_completion___pasOnceToken160, &__block_literal_global_758);
  }
  uint64_t v11 = (void *)_processReservationInteractions_bundleId_completion___pasExprOnceResult;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_2;
  v16[3] = &unk_1E65B85A8;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(v15, v16);
}

void __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v38 = [v2 UUIDString];

  uint64_t v3 = a1;
  id obj = (id)objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v53 objects:v62 count:16];
  uint64_t v36 = a1;
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v54;
    uint64_t v41 = *MEMORY[0x1E4F5DE08];
    *(void *)&long long v6 = 138543362;
    long long v35 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "identifier", v35);

        if (v12)
        {
          if ([v11 canConvertToSchemaOrg])
          {
            if (!v8)
            {
              id v13 = objc_opt_new();
              v61 = v13;
              id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
              uint64_t v3 = v36;
              id v8 = +[SGPipeline customPipeline:v14];
            }
            id v15 = [[SGPipelineEntity alloc] initWithInteraction:v11 identifier:v38 fromBundleIdentifier:*(void *)(v3 + 40)];
            id v16 = v8;
            [v8 dissect:v15];
            id v17 = [(SGPipelineEntity *)v15 enrichments];
            uint64_t v18 = [v17 count];

            if (v18)
            {
              dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
              id v20 = *(void **)(v3 + 48);
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_762;
              v51[3] = &unk_1E65BEF88;
              dispatch_semaphore_t v52 = v19;
              id v21 = v19;
              [v20 geocodeEnrichmentsInPipelineEntity:v15 withCompletion:v51];
              dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
              [obj addObject:v15];
            }
            else
            {
              id v21 = sgEventsLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                id v23 = objc_msgSend(v11, "sg_LoggingIdentifier");
                *(_DWORD *)buf = v35;
                id v60 = v23;
                _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_INFO, "SGDSuggestManager addInteractions: Didn't find any enrichment after dissection of the INInteraction (%{public}@).", buf, 0xCu);
              }
            }
            id v8 = v16;
          }
        }
        else
        {
          id v22 = sgEventsLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGDSuggestManager addInteractions: Encountered INInteraction with nil identifier.", buf, 2u);
          }

          [MEMORY[0x1E4F5D9F8] recordInteractionIgnoredWithReason:v41];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v37 = v8;

  [*(id *)(*(void *)(v3 + 48) + 8) writeInteractionEventEntities:obj];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obja = obj;
  uint64_t v24 = [obja countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(obja);
        }
        id v27 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v28 = [v27 enrichments];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v44 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v43 + 1) + 8 * k);
              id v34 = +[SGDCloudKitSync sharedInstance];
              [v34 addEnrichment:v33 withParentEntity:v27];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
          }
          while (v30);
        }
      }
      uint64_t v25 = [obja countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v25);
  }

  [*(id *)(*(void *)(v36 + 48) + 8) syncNewBlobsIfChanged];
  (*(void (**)(void))(*(void *)(v36 + 56) + 16))();
}

intptr_t __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_762(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"processReservationInteractions" qosClass:25];
  uint64_t v2 = (void *)_processReservationInteractions_bundleId_completion___pasExprOnceResult;
  _processReservationInteractions_bundleId_completion___pasExprOnceResult = v1;
}

- (void)_harvestReservationsFromInteractions:(id)a3 bundleId:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  id v14 = self->_bufferedInteractionsForBundleLock;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke;
  v23[3] = &unk_1E65BB0F0;
  id v15 = v10;
  id v24 = v15;
  id v16 = v11;
  id v25 = v16;
  id v26 = &v27;
  [(_PASLock *)v14 runWithLockAcquired:v23];
  if (v28[3])
  {
    id v17 = (void *)MEMORY[0x1E4F93B18];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_2;
    v18[3] = &unk_1E65C03B0;
    id v22 = &v27;
    dispatch_semaphore_t v19 = v14;
    id v20 = self;
    id v21 = v13;
    [v17 runAsyncOnQueue:v12 afterDelaySeconds:v18 block:0.2];
  }
  else
  {
    v13[2](v13);
  }

  _Block_object_dispose(&v27, 8);
}

void __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v9 canConvertToSchemaOrg])
        {
          id v10 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

          if (!v10)
          {
            id v11 = objc_opt_new();
            [v3 setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
          }
          id v12 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
          [v12 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = objc_msgSend(v3, "allValues", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*((void *)&v18 + 1) + 8 * j) count];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

uint64_t __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_3;
  v5[3] = &unk_1E65BB4E8;
  uint64_t v3 = a1[7];
  void v5[4] = a1[5];
  v5[5] = v3;
  [v2 runWithLockAcquired:v5];
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v29 + 1) + 8 * i) count];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v10 = sgEventsLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = v11;
    __int16 v36 = 2048;
    uint64_t v37 = v7;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "Buffered interactions when block was scheduled: %tu, now: %tu", buf, 0x16u);
  }

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v13 = sgEventsLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 == v7)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Processing all buffered interactions", buf, 2u);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v3;
    id v15 = v3;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * j);
          long long v21 = (void *)MEMORY[0x1CB79B230]();
          long long v22 = [v15 objectForKeyedSubscript:v20];
          dispatch_block_t v23 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_756);
          [*(id *)(a1 + 32) _processReservationInteractions:v22 bundleId:v20 completion:v23];
          dispatch_block_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v17);
    }

    [v15 removeAllObjects];
    id v3 = v24;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Waiting for more interactions to be donated before processing.", buf, 2u);
    }
  }
}

- (BOOL)_harvestPeopleFromInteractions:(id)a3 bundleId:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  if (([v31 hasPrefix:@"com.apple."] & 1) == 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = v6;
    id obj = v6;
    uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (!v29) {
      goto LABEL_32;
    }
    uint64_t v7 = 0;
    uint64_t v28 = *(void *)v37;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v8;
        uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
        id v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v9 identifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (uint64_t)v11;
          __int16 v43 = 2112;
          id v44 = v31;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: _harvestPeopleFromInteractions: harvesting from %@ %@", buf, 0x16u);
        }
        uint64_t v12 = +[SGParsedPersonFromInteraction parseInteraction:v9 bundleId:v31];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
              [v17 grabNameIfNeededFromContactStore:self->_contactStore];
              uint64_t v18 = [v17 socialProfile];
              if (v18) {
                goto LABEL_15;
              }
              long long v19 = [v17 displayName];

              if (!v19) {
                goto LABEL_16;
              }
              uint64_t v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789@"];
              uint64_t v20 = [v17 displayName];
              uint64_t v21 = [v20 rangeOfCharacterFromSet:v18];

              if (v21 == 0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_15:

LABEL_16:
                uint64_t v18 = [v17 pipelineEntity];
                if (v18)
                {
                  [(SGSqlEntityStore *)self->_harvestStore writeEntity:v18];
                  ++v7;
                }
                goto LABEL_18;
              }
              long long v22 = sgLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v42 = (uint64_t)v31;
                _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_INFO, "Interaction from %@ rejected. Display name is very likely a phone-number or email address.", buf, 0xCu);
              }

LABEL_18:
              ++v16;
            }
            while (v14 != v16);
            uint64_t v23 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
            uint64_t v14 = v23;
          }
          while (v23);
        }
        if (v7 >= 1)
        {
          id v24 = sgLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v42 = v7;
            _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: _harvestPeopleFromInteractions: harevsted %tu entities", buf, 0xCu);
          }

          [(SGSqlEntityStore *)self->_harvestStore syncNewBlobsIfChanged];
        }

        uint64_t v8 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (!v29)
      {
LABEL_32:

        id v6 = v26;
        break;
      }
    }
  }

  return 1;
}

- (void)addInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (addInteractions_bundleId_completion___pasOnceToken150 != -1) {
    dispatch_once(&addInteractions_bundleId_completion___pasOnceToken150, &__block_literal_global_742);
  }
  id v11 = (id)addInteractions_bundleId_completion___pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_2;
  block[3] = &unk_1E65B8558;
  id v17 = v9;
  id v18 = v8;
  id v20 = v11;
  id v21 = v10;
  long long v19 = self;
  uint64_t v12 = v11;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, block);
}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager addInteractions: bundleId: %{public}@", buf, 0xCu);
  }

  if (![*(id *)(a1 + 40) count])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager addInteractions: Can't add 0 interaction from bundleId: %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (!*(void *)(a1 + 32))
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v13;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGDSuggestManager addInteractions: Got %i interactions from nil bundleId! Ignoring.", buf, 8u);
    }

    [MEMORY[0x1E4F5D9F8] recordInteractionIgnoredWithReason:*MEMORY[0x1E4F5DE00]];
LABEL_12:
    uint64_t v12 = *(void *)(a1 + 64);
    id v8 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 48), "_harvestPeopleFromInteractions:bundleId:", *(void *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_745;
  v14[3] = &unk_1E65B8D68;
  id v15 = *(id *)(a1 + 64);
  [v6 _harvestReservationsFromInteractions:v4 bundleId:v5 queue:v7 completion:v14];
  id v8 = v15;
LABEL_13:
}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_745(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGSuggestManager-addInteractions" qosClass:25];
  id v2 = (void *)addInteractions_bundleId_completion___pasExprOnceResult;
  addInteractions_bundleId_completion___pasExprOnceResult = v1;
}

- (void)addSearchableItems:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGDSuggestManager_addSearchableItems_completion___block_invoke;
  v8[3] = &unk_1E65B60B0;
  id v9 = v6;
  id v7 = v6;
  [(SGDSuggestManager *)self enqueueSearchableItems:a3 completion:v8];
}

void __51__SGDSuggestManager_addSearchableItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *))a5;
  id v9 = [MEMORY[0x1E4F93790] deserializeAttributes:a3 andBody:a4];
  if (v9)
  {
    int v10 = [MEMORY[0x1E4F93770] searchableItemIsEligibleForHarvesting:v9 eligibleExceptForAge:0];
    id v11 = sgLogHandle();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = [v9 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager: addSearchableItemMetadata: %@ is eligible for harvesting.", buf, 0xCu);
      }
      long long v19 = v9;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [(SGDSuggestManager *)self addSearchableItems:v14 completion:v8];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v9 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        id v21 = v18;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: addSearchableItemMetadata: %@ is NOT eligible for harvesting.", buf, 0xCu);
      }
      id v14 = [MEMORY[0x1E4F5DB88] response];
      v8[2](v8, v14);
    }
  }
  else
  {
    id v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGDSuggestManager: addSearchableItemMetadata: failed to deserialize item data.", buf, 2u);
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F5DB88];
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:12 userInfo:0];
    uint64_t v17 = [v16 responseWithError:v14];
    v8[2](v8, v17);
  }
}

- (void)enqueueSearchableItems:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    unint64_t v19 = v8;
    id v20 = v7;
    +[SGDPowerLog startIngestOfMessages:v8];
    id v9 = [[SGRequestContext alloc] initWithServiceContext:self->_context concurrencyBehavior:1 backpressureHazard:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x1CB79B230]();
          ctsManager = self->_ctsManager;
          uint64_t v17 = +[SGPipeline fullPipeline];
          [(SGDManagerForCTS *)ctsManager processSearchableItem:v14 pipeline:v17 context:v9];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    [(SGSqlEntityStore *)self->_harvestStore incStatsCounterWithKey:@"enqueued_items" byValue:(double)v19];
    +[SGDPowerLog endIngestOfMessages:v19];

    id v7 = v20;
  }
  uint64_t v18 = objc_opt_new();
  v7[2](v7, v18);
}

- (BOOL)isSearchableItemPartOfReimportWithGetterBlock:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if ([(SGSqlEntityStore *)self->_harvestStore reimportRequestsContainBundleIdentifier:v7 uniqueIdentifier:0])
  {
    harvestStore = self->_harvestStore;
    id v9 = v6[2](v6);
    uint64_t v10 = [v9 uniqueIdentifier];
    BOOL v11 = [(SGSqlEntityStore *)harvestStore reimportRequestsContainBundleIdentifier:v7 uniqueIdentifier:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isSearchableItemPartOfReimport:(id)a3
{
  harvestStore = self->_harvestStore;
  id v4 = a3;
  uint64_t v5 = [v4 bundleID];
  id v6 = [v4 uniqueIdentifier];

  LOBYTE(harvestStore) = [(SGSqlEntityStore *)harvestStore reimportRequestsContainBundleIdentifier:v5 uniqueIdentifier:v6];
  return (char)harvestStore;
}

- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    int v14 = 138412547;
    id v15 = v10;
    __int16 v16 = 2117;
    id v17 = v7;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions received feedback %@ for StringFromFollowUpWarning %{sensitive}@.", (uint8_t *)&v14, 0x16u);
  }
  BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F5DA68]) initWithString:v7];
  uint64_t v12 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138740227;
    id v15 = v7;
    __int16 v16 = 2117;
    id v17 = v11;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "FollowUpFeedback: for StringFromFollowUpWarning %{sensitive}@ for warning %{sensitive}@", (uint8_t *)&v14, 0x16u);
  }

  +[SGMIFollowUpAnalyzer reportUserEngagement:a3 forWarning:v11];
  int v13 = [MEMORY[0x1E4F5DB90] responseWith:&unk_1F2535700];
  v8[2](v8, v13);
}

- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a5;
  uint64_t v8 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [NSNumber numberWithBool:v6];
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Suggestions received value %@ for feature setting %ld. Processing of the information not implemented yet.", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x1E4F5DB90] responseWith:&unk_1F2535700];
  v7[2](v7, v10);
}

- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v7 = (void (**)(id, void *))a5;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[SGMIFollowUpAnalyzer reportUserEngagement:v6 forWarning:v8];
    id v10 = 0;
  }
  else
  {
    id v10 = +[SGMIOmissionAnalyzer reportUserEngagement:v6 forWarning:v8];
  }

  id v9 = [MEMORY[0x1E4F5DB90] responseWith:v10];
  v7[2](v7, v9);
}

- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6
{
  id v9 = (void (**)(id, void *))a6;
  id v11 = +[SGMIFollowUpAnalyzer identifyFollowUpWarningFromSubject:a3 body:a4 date:a5];
  id v10 = [MEMORY[0x1E4F5DB90] responseWith:v11];
  v9[2](v9, v10);
}

- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12
{
  uint64_t v18 = (void (**)(id, void *))a12;
  id v20 = +[SGMIOmissionAnalyzer identifyComposeWarningsFromSubject:a3 content:a4 attributes:a5 toRecipients:a6 ccRecipients:a7 bccRecipients:a8 originalToRecipients:a9 originalCcRecipients:a10 attachments:a11];
  unint64_t v19 = [MEMORY[0x1E4F5DB90] responseWith:v20];
  v18[2](v18, v19);
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5
{
  harvestStore = self->_harvestStore;
  id v8 = (void (**)(id, void *))a5;
  id v10 = [(SGSqlEntityStore *)harvestStore sortedUnsubscriptionOpportunitiesForField:a3 limit:a4];
  id v9 = [MEMORY[0x1E4F5DB90] responseWith:v10];
  v8[2](v8, v9);
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7
{
  harvestStore = self->_harvestStore;
  uint64_t v12 = (void (**)(id, void *))a7;
  id v14 = [(SGSqlEntityStore *)harvestStore sortedUnsubscriptionOpportunitiesForField:a3 minCount:a4 minScore:a6 limit:a5];
  __int16 v13 = [MEMORY[0x1E4F5DB90] responseWith:v14];
  v12[2](v12, v13);
}

- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5
{
  harvestStore = self->_harvestStore;
  id v8 = (void (**)(id, id))a5;
  [(SGSqlEntityStore *)harvestStore preventUnsubscriptionOpportunitiesSuggestionsForField:a3 toValues:a4];
  id v9 = (id)objc_opt_new();
  v8[2](v8, v9);
}

- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8
{
  BOOL v9 = a6;
  harvestStore = self->_harvestStore;
  id v14 = (void (**)(id, void *))a8;
  id v16 = [(SGSqlEntityStore *)harvestStore sortedSaliencyResultsRestrictedToMailboxTypes:a3 mailboxIds:a4 receivedOnOrAfter:a5 ascending:v9 limit:a7];
  uint64_t v15 = [MEMORY[0x1E4F5DB90] responseWith:v16];
  v14[2](v14, v15);
}

- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5
{
  id v15 = a3;
  harvestStore = self->_harvestStore;
  BOOL v9 = (void (**)(id, void *))a5;
  id v10 = [(SGSqlEntityStore *)harvestStore topSalienciesForMailboxId:v15 limit:a4];
  if (v15)
  {
    id v11 = +[SGSqlEntityStore defaultStore];
    [v11 setNSString:v15 forKey:@"lastMailboxCheckedForTopSGMISaliency"];

    uint64_t v12 = +[SGSqlEntityStore defaultStore];
    __int16 v13 = [NSNumber numberWithInteger:a4];
    [v12 setInt64NSNumber:v13 forKey:@"lastLimitCheckedForTopSGMISaliency"];
  }
  id v14 = [MEMORY[0x1E4F5DB90] responseWith:v10];
  v9[2](v9, v14);
}

- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4
{
  v44[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v34 = (void (**)(id, void *))a4;
  v43[0] = @"message-id";
  BOOL v6 = [v5 messageId];
  v44[0] = v6;
  v43[1] = @"subject";
  id v7 = [v5 subject];
  v44[1] = v7;
  v43[2] = @"from";
  id v8 = [v5 from];
  BOOL v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
  v44[2] = v9;
  v43[3] = @"to";
  id v10 = [v5 to];
  id v11 = objc_msgSend(v10, "_pas_componentsJoinedByString:", @",");
  v44[3] = v11;
  v43[4] = @"cc";
  uint64_t v12 = [v5 cc];
  __int16 v13 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @",");
  void v44[4] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:5];

  id v15 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        long long v22 = [v16 objectForKeyedSubscript:v21];
        if (v22)
        {
          long long v23 = [[SGSimpleMailHeaderKeyValue alloc] initWithKey:v21 value:v22];
          [v15 addObject:v23];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v18);
  }

  long long v24 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:v15];
  long long v25 = [SGMIFeatureVector alloc];
  id v26 = [v24 messageId];
  uint64_t v27 = +[SGSqlEntityStore defaultStore];
  uint64_t v28 = [(SGMIFeatureVector *)v25 initWithMessageId:v26 hasHashedMessageId:0 simpleMailMessage:v24 senderConnectionScore:&unk_1F25361C8 biomeMessageSummary:0 store:v27 preLoadedFeatureNames:MEMORY[0x1E4F1CBF0]];

  uint64_t v29 = +[SGMISaliencyModelConfig defaultConfig];
  id v35 = 0;
  uint64_t v30 = +[SGMISaliencyInference evaluate:v28 enablePreFiltering:1 config:v29 error:&v35];
  id v31 = v35;

  if (v31)
  {
    long long v32 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v31;
      _os_log_error_impl(&dword_1CA650000, v32, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: %@", buf, 0xCu);
    }
  }
  long long v33 = [MEMORY[0x1E4F5DB90] responseWith:v30];
  v34[2](v34, v33);
}

- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  BOOL v6 = +[SGSimpleMailMessage parseRfc822:a3];
  id v7 = [SGMIFeatureVector alloc];
  id v8 = [v6 messageId];
  BOOL v9 = +[SGSqlEntityStore defaultStore];
  id v10 = [(SGMIFeatureVector *)v7 initWithMessageId:v8 hasHashedMessageId:0 simpleMailMessage:v6 senderConnectionScore:&unk_1F25361C8 biomeMessageSummary:0 store:v9 preLoadedFeatureNames:MEMORY[0x1E4F1CBF0]];

  id v11 = +[SGMISaliencyModelConfig defaultConfig];
  id v16 = 0;
  uint64_t v12 = +[SGMISaliencyInference evaluate:v10 enablePreFiltering:1 config:v11 error:&v16];
  id v13 = v16;

  if (v13)
  {
    id v14 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: %@", buf, 0xCu);
    }
  }
  id v15 = [MEMORY[0x1E4F5DB90] responseWith:v12];
  v5[2](v5, v15);
}

- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F93860];
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[SGPaths suggestionsDirectory];
  uint64_t v12 = [v7 sharedSingletonWithDirectory:v11];

  id v16 = 0;
  id v13 = [v12 planReceivedWithRecipe:v10 attachments:v9 error:&v16];

  id v14 = v16;
  if (v14) {
    [MEMORY[0x1E4F5DB90] responseWithError:v14];
  }
  else {
  id v15 = [MEMORY[0x1E4F5DB90] responseWith:v13];
  }
  v8[2](v8, v15);
}

- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F93860];
  BOOL v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  id v8 = +[SGPaths suggestionsDirectory];
  id v9 = [v5 sharedSingletonWithDirectory:v8];

  id v13 = 0;
  id v10 = [v9 planReceivedWithPayload:v7 error:&v13];

  id v11 = v13;
  if (v11) {
    [MEMORY[0x1E4F5DB90] responseWithError:v11];
  }
  else {
  uint64_t v12 = [MEMORY[0x1E4F5DB90] responseWith:v10];
  }
  v6[2](v6, v12);
}

- (void)sendRTCLogsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[SGRTCLogging defaultLogger];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SGDSuggestManager_sendRTCLogsWithCompletion___block_invoke;
  v6[3] = &unk_1E65B6038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendRTCLogsWithCompletion:v6];
}

void __47__SGDSuggestManager_sendRTCLogsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)MEMORY[0x1E4F5DB90];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F5DB90], "responseWithError:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v6 = [NSNumber numberWithBool:a2];
    id v5 = objc_msgSend(v4, "responseWith:");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8
{
  id v9 = (void *)MEMORY[0x1E4F5DB90];
  id v10 = a8;
  id v11 = [v9 responseWith:MEMORY[0x1E4F1CBF0]];
  (*((void (**)(id, id))a8 + 2))(v10, v11);
}

- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8
{
  id v9 = (void *)MEMORY[0x1E4F5DB90];
  id v10 = a8;
  id v11 = [v9 responseWith:MEMORY[0x1E4F1CBF0]];
  (*((void (**)(id, id))a8 + 2))(v10, v11);
}

- (void)rebuildNamesForDetailCache:(id)a3
{
  harvestStore = self->_harvestStore;
  id v4 = (void (**)(id, id))a3;
  [(SGSqlEntityStore *)harvestStore rebuildContactDetailsCacheWithShouldContinueBlock:&__block_literal_global_720];
  id v5 = (id)objc_opt_new();
  v4[2](v4, v5);
}

uint64_t __48__SGDSuggestManager_rebuildNamesForDetailCache___block_invoke()
{
  return 1;
}

- (void)resetConfirmationAndRejectionHistory:(id)a3
{
  history = self->_history;
  id v4 = (void (**)(id, id))a3;
  [(SGSuggestHistory *)history reset];
  id v5 = (id)objc_opt_new();
  v4[2](v4, v5);
}

- (void)rejectContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  harvestStore = self->_harvestStore;
  id v20 = 0;
  [(SGSqlEntityStore *)harvestStore rejectRealtimeContact:v8 error:&v20];
  id v11 = v20;
  +[SGAggregateLogging contactRejected:v8 inApp:[(SGDSuggestManager *)self clientIsMail] ^ 1];
  uint64_t v12 = (void *)MEMORY[0x1E4F5DB50];
  BOOL v13 = [(SGDSuggestManager *)self clientIsMail];
  id v14 = (void *)MEMORY[0x1E4F5DC88];
  if (!v13) {
    id v14 = (void *)MEMORY[0x1E4F5DC90];
  }
  if (a4 > 4) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = dword_1CA8CB5C0[a4];
  }
  [v12 recordRejectedContact:v8 inApp:*v14 rejectionUI:v15 pet2Tracker:self->_pet2Tracker];
  id v16 = +[SGDSuggestManager contactAggregator];
  uint64_t v17 = [v8 contact];
  [v16 removeContact:v17];

  +[SGDSuggestManager clearRequestCache];
  if (v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F5DB88] responseWithError:v11];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  uint64_t v19 = (void *)v18;
  v9[2](v9, v18);
}

- (void)rejectContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectContactDetailRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  [(SGDSuggestManager *)self _performAction:@"reject" onContactDetailRecord:v8 confirmRejectUI:v6 completion:v9];
}

- (void)confirmContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmContactDetailRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  [(SGDSuggestManager *)self _performAction:@"confirm" onContactDetailRecord:v8 confirmRejectUI:v6 completion:v9];
}

- (void)rejectRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  [(SGDSuggestManager *)self _performAction:@"reject" onRecord:v8 confirmRejectUI:v6 completion:v9];
}

- (void)confirmRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  [(SGDSuggestManager *)self _performAction:@"confirm" onRecord:v8 confirmRejectUI:v6 completion:v9];
}

- (void)_performAction:(id)a3 onRecord:(id)a4 withParentConfirmation:(BOOL)a5 confirmRejectUI:(int)a6 completion:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = (void (**)(id, void *))a7;
  uint64_t v14 = [(SGSqlEntityStore *)self->_harvestStore suggestContactByRecordId:v12 withSnippets:0 filterConfirmRejectDetails:0];
  uint64_t v15 = [v14 recordId];
  int v16 = [v15 isEqual:v12];

  if (v16)
  {
    if ([v11 isEqualToString:@"confirm"])
    {
      uint64_t v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v14;
        _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "Confirming details as workaround for Contacts search for contact %@", buf, 0xCu);
      }

      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      long long v34 = __95__SGDSuggestManager__performAction_onRecord_withParentConfirmation_confirmRejectUI_completion___block_invoke;
      id v35 = &unk_1E65BADD0;
      long long v36 = self;
      id v18 = v14;
      id v37 = v18;
      [v18 enumerateDetailsWithBlock:&v32];
      -[SGSqlEntityStore confirmContactByRecordID:error:](self->_harvestStore, "confirmContactByRecordID:error:", v12, 0, v32, v33, v34, v35, v36);
      +[SGAggregateLogging recordConfirmedForContact:v18];
      uint64_t v19 = (void *)MEMORY[0x1E4F5DB50];
      id v20 = [MEMORY[0x1E4F5DAF8] realtimeContactForNewContact:v18];
      BOOL v21 = [(SGDSuggestManager *)self clientIsMail];
      long long v22 = (void *)MEMORY[0x1E4F5DC88];
      if (!v21) {
        long long v22 = (void *)MEMORY[0x1E4F5DC90];
      }
      if (a6 > 4) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = dword_1CA8CB5C0[a6];
      }
      [v19 recordBannerConfirmedWithContact:v20 proposedCNContact:0 confirmedCNContact:0 inApp:*v22 confirmationUI:v23 pet2Tracker:self->_pet2Tracker];
    }
    else
    {
      [(SGSuggestHistory *)self->_history rejectContact:v14];
      [(SGSqlEntityStore *)self->_harvestStore rejectContactByRecordID:v12 error:0];
      +[SGAggregateLogging recordRejectedForContact:v14];
      id v26 = (void *)MEMORY[0x1E4F5DB50];
      uint64_t v27 = [MEMORY[0x1E4F5DAF8] realtimeContactForNewContact:v14];
      BOOL v28 = [(SGDSuggestManager *)self clientIsMail];
      uint64_t v29 = (void *)MEMORY[0x1E4F5DC88];
      if (!v28) {
        uint64_t v29 = (void *)MEMORY[0x1E4F5DC90];
      }
      if (a6 > 4) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = dword_1CA8CB5C0[a6];
      }
      [v26 recordRejectedContact:v27 inApp:*v29 rejectionUI:v30 pet2Tracker:self->_pet2Tracker];
    }
  }
  else
  {
    long long v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v14 recordId];
      *(_DWORD *)buf = 138412546;
      id v39 = v12;
      __int16 v40 = 2112;
      id v41 = v25;
      _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact, provided recordId was not contactId: %@ %@", buf, 0x16u);
    }
  }
  +[SGDSuggestManager clearRequestCache];
  if (v13)
  {
    id v31 = objc_opt_new();
    v13[2](v13, v31);
  }
}

uint64_t __95__SGDSuggestManager__performAction_onRecord_withParentConfirmation_confirmRejectUI_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) confirmOrRejectDetail:a2 forContact:*(void *)(a1 + 40)];
}

- (void)_performAction:(id)a3 onRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6
{
}

- (void)_performAction:(id)a3 onContactDetailRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a6;
  id v12 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:v10];
  if ([v12 groupId] < 1)
  {
    if ([v12 masterEntityId] < 1) {
      uint64_t v13 = [v10 rowId];
    }
    else {
      uint64_t v13 = [v12 masterEntityId];
    }
  }
  else
  {
    uint64_t v13 = [v12 groupId];
  }
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F5DB20] recordIdForContactWithRowId:v13];
    uint64_t v15 = [(SGSqlEntityStore *)self->_harvestStore suggestContactByRecordId:v14 withSnippets:0 filterConfirmRejectDetails:0];
    int v16 = [v15 detailForRecordId:v10];
    if (!v16)
    {
      id v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v10;
        _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact detail, requested detail not in loaded contract for record id: %@", buf, 0xCu);
      }

      +[SGDSuggestManager clearRequestCache];
      uint64_t v19 = objc_opt_new();
      v11[2](v11, v19);

      goto LABEL_31;
    }
    [(SGSuggestHistory *)self->_history confirmOrRejectDetail:v16 forContact:v15];
    id v38 = v9;
    id v39 = v15;
    if ([v9 isEqualToString:@"confirm"])
    {
      [(SGSqlEntityStore *)self->_harvestStore confirmContactDetailByRecordID:v10 error:0];
      +[SGAggregateLogging detail:v16 confirmedForContact:v15];
      uint64_t v36 = 0;
    }
    else
    {
      id v20 = [v12 duplicateKey];
      [v20 entityType];
      int IsContactDetail = SGEntityTypeIsContactDetail();

      if (IsContactDetail)
      {
        history = self->_history;
        uint64_t v23 = [v12 duplicateKey];
        long long v24 = [v23 contactDetailKey];
        [(SGSuggestHistory *)history rejectContactDetailKey:v24];

        uint64_t v15 = v39;
      }
      [(SGSqlEntityStore *)self->_harvestStore rejectContactDetailByRecordID:v10 error:0];
      +[SGAggregateLogging detail:v16 rejectedForContact:v15];
      uint64_t v36 = 1;
    }
    id v35 = (void *)MEMORY[0x1E4F5DB50];
    id v25 = v16;
    objc_opt_class();
    id v37 = v14;
    if (objc_opt_isKindOfClass())
    {
      id v26 = (uint64_t *)MEMORY[0x1E4F5DD38];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v28 = *MEMORY[0x1E4F5DD30];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v27 = *MEMORY[0x1E4F5DD20];
        }
        else {
          uint64_t v27 = v28;
        }
LABEL_27:

        uint64_t v29 = [v25 extractionInfo];
        uint64_t v30 = [v29 extractionType];
        id v31 = [v25 extractionInfo];
        uint64_t v32 = [v31 modelVersion];
        if (a5 > 4) {
          uint64_t v33 = 2;
        }
        else {
          uint64_t v33 = dword_1CA8CB5C0[a5];
        }
        objc_msgSend(v35, "recordContactDetailEngagementWithResolution:detailType:extractionType:modelVersion:confirmRejectUI:pet2Tracker:", v36, v27, v30, v32, v33, self->_pet2Tracker, v35);

        +[SGDSuggestManager clearRequestCache];
        long long v34 = objc_opt_new();
        v11[2](v11, v34);

        uint64_t v14 = v37;
        id v9 = v38;
        uint64_t v15 = v39;
LABEL_31:

        goto LABEL_32;
      }
      id v26 = (uint64_t *)MEMORY[0x1E4F5DD28];
    }
    uint64_t v27 = *v26;
    goto LABEL_27;
  }
  uint64_t v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v10;
    _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact detail, failed to load detail for record id: %@", buf, 0xCu);
  }

  +[SGDSuggestManager clearRequestCache];
  uint64_t v14 = objc_opt_new();
  v11[2](v11, v14);
LABEL_32:
}

- (void)confirmContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 cnContactIdentifier];
    *(_DWORD *)buf = 138412290;
    long long v24 = v11;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmContact: %@", buf, 0xCu);
  }
  harvestStore = self->_harvestStore;
  id v22 = 0;
  [(SGSqlEntityStore *)harvestStore confirmRealtimeContact:v8 error:&v22];
  id v13 = v22;
  +[SGAggregateLogging contactConfirmed:v8 inApp:[(SGDSuggestManager *)self clientIsMail] ^ 1];
  uint64_t v14 = (void *)MEMORY[0x1E4F5DB50];
  BOOL v15 = [(SGDSuggestManager *)self clientIsMail];
  int v16 = (void *)MEMORY[0x1E4F5DC88];
  if (!v15) {
    int v16 = (void *)MEMORY[0x1E4F5DC90];
  }
  if (a4 > 4) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = dword_1CA8CB5C0[a4];
  }
  [v14 recordBannerConfirmedWithContact:v8 proposedCNContact:0 confirmedCNContact:0 inApp:*v16 confirmationUI:v17 pet2Tracker:self->_pet2Tracker];
  id v18 = +[SGDSuggestManager contactAggregator];
  uint64_t v19 = [v8 contact];
  [v18 removeContact:v19];

  +[SGDSuggestManager clearRequestCache];
  if (v13)
  {
    uint64_t v20 = [MEMORY[0x1E4F5DB88] responseWithError:v13];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  BOOL v21 = (void *)v20;
  v9[2](v9, v20);
}

- (void)deleteEventByRecordId:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sgEventsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - deleteEventByRecordId: event Id: (%{public}@)", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  id v25 = 0;
  [(SGSqlEntityStore *)harvestStore rejectEventByRecordId:v6 error:&v25];
  id v10 = v25;
  id v11 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:v6];
  id v12 = v11;
  if (v11)
  {
    id v13 = self->_harvestStore;
    uint64_t v14 = [v11 duplicateKey];
    BOOL v15 = [v14 parentKey];
    int v16 = [(SGSqlEntityStore *)v13 loadEntityByKey:v15];

    if (v16)
    {
      id v26 = v12;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      id v18 = [(SGDSuggestManager *)self shortNamesAndRealtimeEventsFromEntity:v16 enrichments:v17 store:self->_harvestStore];

      if ([v18 count])
      {
        uint64_t v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = [v19 second];
        +[SGAggregateLogging eventRejectedByRecord:v20];

        BOOL v21 = [v12 duplicateKey];
        id v22 = [v21 serialize];
        [(SGDSuggestManager *)self logEventInteractionForEventWithUniqueKey:v22 interface:7 actionType:9];
      }
    }
  }
  +[SGDSuggestManager clearRequestCache];
  if (v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  long long v24 = (void *)v23;
  v7[2](v7, v23);
}

- (void)rejectEventByRecordId:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectEventByRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  id v25 = 0;
  [(SGSqlEntityStore *)harvestStore rejectEventByRecordId:v6 error:&v25];
  id v10 = v25;
  id v11 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:v6];
  id v12 = v11;
  if (v11)
  {
    id v13 = self->_harvestStore;
    uint64_t v14 = [v11 duplicateKey];
    BOOL v15 = [v14 parentKey];
    int v16 = [(SGSqlEntityStore *)v13 loadEntityByKey:v15];

    if (v16)
    {
      id v26 = v12;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      id v18 = [(SGDSuggestManager *)self shortNamesAndRealtimeEventsFromEntity:v16 enrichments:v17 store:self->_harvestStore];

      if ([v18 count])
      {
        uint64_t v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = [v19 second];
        +[SGAggregateLogging eventRejectedByRecord:v20];

        BOOL v21 = [v12 duplicateKey];
        id v22 = [v21 serialize];
        [(SGDSuggestManager *)self logEventInteractionForEventWithUniqueKey:v22 interface:7 actionType:7];
      }
    }
  }
  +[SGDSuggestManager clearRequestCache];
  if (v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  long long v24 = (void *)v23;
  v7[2](v7, v23);
}

- (void)rejectEvent:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 eventIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v9;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectEvent: %@", buf, 0xCu);
  }
  harvestStore = self->_harvestStore;
  id v18 = 0;
  [(SGSqlEntityStore *)harvestStore rejectRealtimeEvent:v6 error:&v18];
  id v11 = v18;
  +[SGAggregateLogging eventRejected:v6 inApp:[(SGDSuggestManager *)self clientIsMail] ^ 1];
  id v12 = (void *)MEMORY[0x1E4F5DB50];
  BOOL v13 = [(SGDSuggestManager *)self clientIsMail];
  uint64_t v14 = (void *)MEMORY[0x1E4F5DC88];
  if (!v13) {
    uint64_t v14 = (void *)MEMORY[0x1E4F5DC90];
  }
  [v12 recordBannerRejectedWithEvent:v6 inApp:*v14];
  if ([(SGDSuggestManager *)self clientIsMail]) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 4;
  }
  [(SGDSuggestManager *)self logEventInteractionForRealtimeEvent:v6 interface:v15 actionType:7];
  +[SGDSuggestManager clearRequestCache];
  if (v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F5DB88] responseWithError:v11];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  uint64_t v17 = (void *)v16;
  v7[2](v7, v16);
}

- (void)confirmEventByRecordId:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmEventByRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  id v25 = 0;
  [(SGSqlEntityStore *)harvestStore confirmEventByRecordId:v6 error:&v25];
  id v10 = v25;
  id v11 = [(SGSqlEntityStore *)self->_harvestStore loadEntityByRecordId:v6];
  id v12 = v11;
  if (v11)
  {
    BOOL v13 = self->_harvestStore;
    uint64_t v14 = [v11 duplicateKey];
    uint64_t v15 = [v14 parentKey];
    uint64_t v16 = [(SGSqlEntityStore *)v13 loadEntityByKey:v15];

    if (v16)
    {
      id v26 = v12;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      id v18 = [(SGDSuggestManager *)self shortNamesAndRealtimeEventsFromEntity:v16 enrichments:v17 store:self->_harvestStore];

      if ([v18 count])
      {
        uint64_t v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = [v19 second];
        +[SGAggregateLogging eventConfirmedByRecord:v20];

        uint64_t v21 = [v12 duplicateKey];
        id v22 = [v21 serialize];
        [(SGDSuggestManager *)self logEventInteractionForEventWithUniqueKey:v22 interface:7 actionType:6];
      }
    }
  }
  +[SGDSuggestManager clearRequestCache];
  if (v10)
  {
    uint64_t v23 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  long long v24 = (void *)v23;
  v7[2](v7, v23);
}

- (void)confirmEvent:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 eventIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v9;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmEvent: %@", buf, 0xCu);
  }
  harvestStore = self->_harvestStore;
  id v28 = 0;
  [(SGSqlEntityStore *)harvestStore confirmRealtimeEvent:v6 error:&v28];
  id v11 = v28;
  BOOL v12 = [(SGDSuggestManager *)self clientIsMail];
  +[SGAggregateLogging eventConfirmed:v6 inApp:!v12];
  BOOL v13 = self->_ekStoreProvider;
  uint64_t v14 = (void *)MEMORY[0x1E4F93B18];
  uint64_t v15 = dispatch_get_global_queue(9, 0);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __45__SGDSuggestManager_confirmEvent_completion___block_invoke;
  long long v24 = &unk_1E65B6088;
  uint64_t v16 = v13;
  id v25 = v16;
  id v17 = v6;
  id v26 = v17;
  BOOL v27 = v12;
  [v14 runAsyncOnQueue:v15 afterDelaySeconds:&v21 block:60.0];

  if (v12) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 4;
  }
  -[SGDSuggestManager logEventInteractionForRealtimeEvent:interface:actionType:](self, "logEventInteractionForRealtimeEvent:interface:actionType:", v17, v18, 6, v21, v22, v23, v24);
  +[SGDSuggestManager clearRequestCache];
  if (v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F5DB88] responseWithError:v11];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  uint64_t v20 = (void *)v19;
  v7[2](v7, v19);
}

void __45__SGDSuggestManager_confirmEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(void))(v3 + 16))();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [*(id *)(a1 + 40) event];
  id v5 = objc_msgSend(v9, "sg_confirmedEKEventForSGEvent:", v4);

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) event];
    id v7 = [v6 toEKEventWithStore:v9];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = (void *)MEMORY[0x1E4F5DC90];
  if (*(unsigned char *)(a1 + 48)) {
    id v8 = (void *)MEMORY[0x1E4F5DC88];
  }
  [MEMORY[0x1E4F5DB50] recordBannerConfirmedWithEvent:*(void *)(a1 + 40) proposedEKEvent:v7 confirmedEKEvent:v5 inApp:*v8];
}

- (void)originFromRecordId:(id)a3 completion:(id)a4
{
  harvestStore = self->_harvestStore;
  id v6 = (void (**)(id, void *))a4;
  id v8 = [(SGSqlEntityStore *)harvestStore loadOriginByRecordId:a3];
  id v7 = [MEMORY[0x1E4F5DB90] responseWith:v8];
  v6[2](v6, v7);
}

- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v8 = [v5 bundleId];
  id v24 = 0;
  id v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v24];
  id v10 = v24;

  if (v10)
  {
    id v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchAppForSuggestedEventUsingLaunchInfo: Error creating application record: %@", buf, 0xCu);
    }

    BOOL v12 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
    v6[2](v6, v12);
  }
  else
  {
    BOOL v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    BOOL v13 = [v5 intent];

    if (v13)
    {
      uint64_t v14 = [v5 userActivity];
      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F30508]);
        uint64_t v16 = [v5 intent];
        id v17 = (void *)[v15 initWithIntent:v16 response:0];

        [v17 setIntentHandlingStatus:5];
        [v14 _setInteraction:v17 donate:0];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke;
        v22[3] = &unk_1E65B6038;
        uint64_t v23 = v6;
        [v12 openUserActivity:v14 usingApplicationRecord:v9 configuration:0 completionHandler:v22];

        id v10 = 0;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:-1 userInfo:&unk_1F2537548];
        id v17 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
        v6[2](v6, v17);
      }
    }
    else
    {
      uint64_t v18 = [v5 sourceURL];

      if (v18)
      {
        uint64_t v19 = [v5 sourceURL];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke_700;
        v20[3] = &unk_1E65B6060;
        uint64_t v21 = v6;
        [v12 openURL:v19 configuration:0 completionHandler:v20];

        id v10 = 0;
        uint64_t v14 = v21;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:-1 userInfo:&unk_1F2537570];
        uint64_t v14 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
        v6[2](v6, v14);
      }
    }
  }
}

void __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchAppForSuggestedEventUsingLaunchInfo: Error opening user activity: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [MEMORY[0x1E4F5DB88] responseWithError:v4];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
}

void __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke_700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F5DB88], "responseWithError:");
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (id)v4;
  (*(void (**)(uint64_t))(v3 + 16))(v3);
}

- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 ignoreUserActivitySupport:(BOOL)a6 ignoreMailCheck:(BOOL)a7 completion:(id)a8
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  unint64_t v94 = (unint64_t)a4;
  id v93 = a5;
  v97 = (void (**)(id, id))a8;
  if (!v13)
  {
    v88 = [MEMORY[0x1E4F28B00] currentHandler];
    [v88 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2502, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  uint64_t v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!+[SGDuplicateKey serializationPassesBasicScrutiny:v13])
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F5DB90];
    uint64_t v98 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:0];
    v96 = [v20 responseWithError:v98];
    v97[2](v97, v96);
    goto LABEL_106;
  }
  id v15 = [[SGDuplicateKey alloc] initWithSerialized:v13];
  harvestStore = self->_harvestStore;
  id v17 = [(SGDuplicateKey *)v15 entityKey];
  v92 = [(SGSqlEntityStore *)harvestStore loadEntitiesByEntityKey:v17 entityType:2 resolveDuplicates:&__block_literal_global_678];

  if ([v92 count])
  {
    uint64_t v18 = [v92 lastObject];
    uint64_t v98 = +[SGStorageEvent storageEventFromEntity:v18];

    uint64_t v19 = [(id)v98 duplicateKey];

    id v15 = (SGDuplicateKey *)v19;
  }
  else
  {
    uint64_t v98 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__4015;
  v114 = __Block_byref_object_dispose__4016;
  id v115 = 0;
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider) {
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
  }
  uint64_t v22 = ekStoreProvider;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke_2;
  v103[3] = &unk_1E65B5E20;
  v96 = v15;
  v104 = v96;
  v105 = self;
  p_long long buf = &buf;
  ((void (*)(SGEKEventStoreProvider *, void *))v22->_callBlockWithEKEventStoreForReading)(v22, v103);

  if (!(v94 | v98) && !*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v33 = sgEventsLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v108 = 0;
      _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Event was not found and no fallback URL provided.", v108, 2u);
    }
    goto LABEL_112;
  }
  uint64_t v23 = [(SGDuplicateKey *)v96 parentKey];
  uint64_t v89 = [v23 entityType];

  if (!v89)
  {
    uint64_t v33 = sgEventsLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v108 = 0;
      _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not get the entity type.", v108, 2u);
    }
    goto LABEL_112;
  }
  if (v89 != 16)
  {
    switch(v89)
    {
      case 18:
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          uint64_t v55 = objc_msgSend(MEMORY[0x1E4F223C8], "sg_preferredApplicationRecordForURL:");
LABEL_79:
          long long v50 = (void *)v55;
          id v60 = *(void **)(*((void *)&buf + 1) + 40);
          goto LABEL_80;
        }
        break;
      case 13:
        if (!v94
          || ([(id)v94 scheme],
              long long v56 = objc_claimAutoreleasedReturnValue(),
              [v56 lowercaseString],
              id v57 = objc_claimAutoreleasedReturnValue(),
              int v58 = [v57 isEqualToString:@"sms"],
              v57,
              v56,
              !v58))
        {
          long long v50 = 0;
          id v26 = 0;
          id v53 = 0;
          goto LABEL_87;
        }
        if (!a7)
        {
          id v59 = [(NSXPCConnection *)self->_connection sgd_clientName];
          [v59 isEqualToString:*MEMORY[0x1E4F5DC38]];
        }
        id v41 = sgEventsLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found message for Event Found in Messages on device.", v108, 2u);
        }
        goto LABEL_71;
      case 5:
        if (v94)
        {
          long long v34 = [(id)v94 scheme];
          id v35 = [v34 lowercaseString];
          int v36 = [v35 isEqualToString:@"message"];

          if (v36)
          {
            if (a7) {
              goto LABEL_42;
            }
            id v37 = [(NSXPCConnection *)self->_connection sgd_clientName];
            char v38 = [v37 isEqualToString:*MEMORY[0x1E4F5DC28]];

            if ((v38 & 1) != 0
              || (+[SGMailClientUtil sharedInstance],
                  id v39 = objc_claimAutoreleasedReturnValue(),
                  int v40 = [v39 isMessageAvailable:v94],
                  v39,
                  v40))
            {
LABEL_42:
              id v41 = sgEventsLogHandle();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v108 = 0;
                _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found e-mail for Event Found in Mail on device.", v108, 2u);
              }
LABEL_71:

              long long v50 = objc_msgSend(MEMORY[0x1E4F223C8], "sg_preferredApplicationRecordForURL:", v94);
              id v60 = (void *)v94;
LABEL_80:
              id v53 = v60;
              id v26 = 0;
              goto LABEL_87;
            }
          }
        }
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          v62 = sgEventsLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v108 = 0;
            _os_log_impl(&dword_1CA650000, v62, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find e-mail for Event Found in Mail on device but did find fallback URL", v108, 2u);
          }

          uint64_t v55 = objc_msgSend(MEMORY[0x1E4F223C8], "sg_preferredApplicationRecordForURL:", *(void *)(*((void *)&buf + 1) + 40));
          goto LABEL_79;
        }
        uint64_t v33 = sgEventsLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find e-mail for Event Found in Mail on device or fallback URL.", v108, 2u);
        }
LABEL_112:

        long long v50 = [MEMORY[0x1E4F5DB90] responseWith:0];
        v97[2](v97, v50);
        goto LABEL_105;
    }
    uint64_t v33 = sgEventsLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v108 = 134217984;
      uint64_t v109 = v89;
      _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Can't find a bundleId for entity type: '%lld'", v108, 0xCu);
    }
    goto LABEL_112;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v24 = [(id)v98 tags];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v110 count:16];
  if (!v25)
  {

    uint64_t v27 = 0;
    goto LABEL_49;
  }
  id v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = *(void *)v100;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v100 != v28) {
        objc_enumerationMutation(v24);
      }
      uint64_t v30 = *(void **)(*((void *)&v99 + 1) + 8 * i);
      if ([v30 isIntentResponseUserActivityString])
      {
        uint64_t v31 = [v30 intentResponseUserActivityString];
        if (v31)
        {
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F22488], "sg_userActivityWithRequiredString:", v31);

          id v26 = (void *)v32;
        }
      }
      else
      {
        if (![v30 isInteractionTeamId]) {
          continue;
        }
        [v30 value];
        v27 = uint64_t v31 = v27;
      }
    }
    uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v110 count:16];
  }
  while (v25);

  if (!v26) {
LABEL_49:
  }
    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"INGetReservationDetailsIntent"];
  if (a6)
  {
    id v42 = [(id)v98 duplicateKey];
    uint64_t v43 = [v42 parentKey];
    id v44 = [v43 bundleId];
    BOOL v45 = v44 == 0;

    if (!v45)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F223C8]);
      long long v47 = [(id)v98 duplicateKey];
      long long v48 = [v47 parentKey];
      long long v49 = [v48 bundleId];
      long long v50 = (void *)[v46 initWithBundleIdentifier:v49 allowPlaceholder:0 error:0];
      goto LABEL_54;
    }
    long long v50 = 0;
  }
  else
  {
    id v51 = (void *)MEMORY[0x1E4F223C8];
    long long v47 = [v26 activityType];
    long long v48 = [(id)v98 duplicateKey];
    long long v49 = [v48 parentKey];
    dispatch_semaphore_t v52 = [v49 bundleId];
    long long v50 = objc_msgSend(v51, "sg_preferredApplicationRecordForUserActivityType:withTeamIdentifier:preferredBundleIdentifier:", v47, v27, v52);

LABEL_54:
  }
  if (objc_msgSend(v50, "sg_isAppleBundleIdentifier"))
  {
LABEL_56:
    id v53 = 0;
    goto LABEL_86;
  }
  if (!v50)
  {
    uint64_t v61 = *(void *)(*((void *)&buf + 1) + 40);
    if (!v61)
    {
      long long v50 = 0;
      goto LABEL_56;
    }
LABEL_84:
    uint64_t v64 = objc_msgSend(MEMORY[0x1E4F223C8], "sg_preferredApplicationRecordForURL:", v61);

    id v53 = *(id *)(*((void *)&buf + 1) + 40);
    long long v54 = v26;
    long long v50 = (void *)v64;
    id v26 = 0;
    goto LABEL_85;
  }
  long long v54 = [v50 applicationState];
  if (([v54 isInstalled] & 1) == 0)
  {
    BOOL v63 = *(void *)(*((void *)&buf + 1) + 40) == 0;

    if (v63) {
      goto LABEL_56;
    }
    uint64_t v61 = *(void *)(*((void *)&buf + 1) + 40);
    goto LABEL_84;
  }
  id v53 = 0;
LABEL_85:

LABEL_86:
LABEL_87:
  if ((objc_msgSend(v50, "sg_isAppleBundleIdentifier") & 1) == 0)
  {
    if (!v50
      || ([v50 applicationState],
          long long v65 = objc_claimAutoreleasedReturnValue(),
          char v66 = [v65 isInstalled],
          v65,
          (v66 & 1) == 0))
    {
      v68 = sgEventsLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v108 = 0;
        _os_log_impl(&dword_1CA650000, v68, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find an installed bundle id.", v108, 2u);
      }
      goto LABEL_97;
    }
  }
  uint64_t v67 = 0;
  if (v89 == 16)
  {
    if (v26)
    {
      uint64_t v67 = [(SGDSuggestManager *)self createLaunchIntentForStorageEvent:v98];
      if (!v67)
      {
        v68 = sgEventsLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1CA650000, v68, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not create launch intent for event.", v108, 2u);
        }
LABEL_97:

        v69 = [MEMORY[0x1E4F5DB90] responseWith:0];
        v97[2](v97, v69);
        goto LABEL_104;
      }
    }
  }
  if (v93)
  {
    v91 = [v93 localeIdentifier];
  }
  else
  {
    v70 = [MEMORY[0x1E4F1CA20] currentLocale];
    v91 = [v70 localeIdentifier];
  }
  if (objc_msgSend(v50, "sg_isAppleBundleIdentifier")
    && ([v50 applicationState],
        v71 = objc_claimAutoreleasedReturnValue(),
        char v72 = [v71 isInstalled],
        v71,
        (v72 & 1) == 0))
  {
    v74 = [v50 bundleIdentifier];
  }
  else
  {
    v107 = v91;
    uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
    v74 = [v50 localizedNameWithPreferredLocalizations:v73];
  }
  v75 = [(SGDSuggestManager *)self _showInFormatStringWithLocalization:v91];
  id v83 = _PASValidatedFormat(v75, v76, v77, v78, v79, v80, v81, v82, (uint64_t)v74);
  id v84 = objc_alloc(MEMORY[0x1E4F5DB58]);
  id v85 = [v50 bundleIdentifier];
  v86 = (void *)[v84 initWithBundleId:v85 localizedShowInString:v83 userActivity:v26 intent:v67 sourceURL:v53];

  id v87 = [MEMORY[0x1E4F5DB90] responseWith:v86];
  v97[2](v97, v87);

  v69 = v53;
  id v53 = v26;
  id v26 = (void *)v67;
LABEL_104:

LABEL_105:
  _Block_object_dispose(&buf, 8);

LABEL_106:
}

void __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke_2(void *a1, void *a2)
{
  id v7 = [a2 eventsWithSameOpaqueKeyAsDuplicateKey:a1[4] extraKey:0 harvestStore:*(void *)(a1[5] + 8)];
  if ([v7 count])
  {
    uint64_t v3 = [v7 firstObject];
    uint64_t v4 = objc_msgSend(v3, "sg_fallbackURL");
    uint64_t v5 = *(void *)(a1[6] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

id __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((unint64_t)[v2 count] > 1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = objc_msgSend(v2, "reverseObjectEnumerator", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [v9 duplicateKey];
          uint64_t v11 = [v10 parentKey];
          uint64_t v12 = [v11 entityType];

          if (v12 == 16)
          {
            uint64_t v21 = v9;
            id v13 = (void *)MEMORY[0x1E4F1C978];
            uint64_t v14 = &v21;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v4 = [v2 lastObject];
    uint64_t v20 = v4;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = &v20;
LABEL_13:
    id v3 = [v13 arrayWithObjects:v14 count:1];
  }
  else
  {
    id v3 = v2;
  }

  return v3;
}

- (id)createLaunchIntentForStorageEvent:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 duplicateKey];
  uint64_t v5 = [v4 serialize];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v3 tags];
  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v7)
  {
    int v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    *(void *)&long long v8 = 138412290;
    long long v21 = v8;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v6);
      }
      id v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      if (objc_msgSend(v13, "isReservationItemReferences", v21))
      {
        uint64_t v14 = [v13 reservationItemReferences];
        if (![v14 count])
        {
          long long v19 = sgLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v21;
            uint64_t v28 = v5;
            _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found no item references for event with unique id '%@'", buf, 0xCu);
          }

          uint64_t v7 = 0;
          goto LABEL_25;
        }
        uint64_t v15 = [v14 firstObject];

        id v10 = (void *)v15;
      }
      else
      {
        if (![v13 isReservationContainerReference]) {
          goto LABEL_13;
        }
        uint64_t v16 = [v13 reservationContainerReference];

        if (v16)
        {
          int v9 = (void *)v16;
          goto LABEL_13;
        }
        uint64_t v14 = sgLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = v21;
          uint64_t v28 = v5;
          _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found no container reference for event with unique id '%@'", buf, 0xCu);
        }
        int v9 = 0;
      }

LABEL_13:
      if (v7 == (void *)++v12)
      {
        uint64_t v17 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
        uint64_t v7 = (void *)v17;
        if (v17) {
          goto LABEL_3;
        }

        if (v10)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F30470]);
          id v26 = v10;
          uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          uint64_t v7 = (void *)[v18 initWithReservationContainerReference:v9 reservationItemReferences:v6];
          goto LABEL_25;
        }
        uint64_t v7 = 0;
        goto LABEL_26;
      }
    }
  }
  id v10 = 0;
  int v9 = 0;
LABEL_25:

LABEL_26:
  return v7;
}

- (void)eventFromUniqueId:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v8 = (void (**)(id, void *))a4;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2451, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  int v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-eventFromUniqueId: %@", buf, 0xCu);
  }

  if (+[SGDuplicateKey serializationPassesBasicScrutiny:v7])
  {
    id v10 = [[SGDuplicateKey alloc] initWithSerialized:v7];
    uint64_t v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v7;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "dupKey: %@", buf, 0xCu);
    }

    uint64_t v12 = [(SGSqlEntityStore *)self->_harvestStore loadEventByDuplicateKey:v10];
    id v13 = [v12 convertToEvent:self->_harvestStore];

    uint64_t v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v13 uniqueKey];
      *(_DWORD *)long long buf = 138412802;
      id v20 = v7;
      __int16 v21 = 2112;
      long long v22 = v10;
      __int16 v23 = 2112;
      long long v24 = v17;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "eventFromUniqueId: %@ resulted in dupKey: %@ and event: %@", buf, 0x20u);
    }
    uint64_t v15 = [MEMORY[0x1E4F5DB90] responseWith:v13];
    v8[2](v8, v15);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F5DB90];
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:0];
    id v13 = [v16 responseWithError:v10];
    v8[2](v8, v13);
  }
}

- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke;
  v10[3] = &unk_1E65BFFF0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  SGNotUserInitiated(@"resolveFullDownloadRequests", 2, v10);
}

void __64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke(void *a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-resolveFullDownloadRequests", v7, 2u);
  }

  id v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = [MEMORY[0x1E4F5DA28] map:a1[5] f:&__block_literal_global_671];
  [v3 resolveFullDownloadRequests:v4];

  uint64_t v5 = a1[6];
  id v6 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

SGEmailKey *__64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke_669(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SGEmailKey alloc] initWithMailMessageKey:v2];

  return v3;
}

- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke;
  v8[3] = &unk_1E65B6010;
  void v8[4] = self;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  SGNotUserInitiated(@"fullDownloadRequestBatch", 2, v8);
}

void __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke(void *a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-fullDownloadRequestBatch", v9, 2u);
  }

  id v3 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v4 = (void *)MEMORY[0x1E4F5DA28];
  uint64_t v5 = a1[5];
  id v6 = [*(id *)(a1[4] + 8) loadFullDownloadRequestBatch:a1[6]];
  id v7 = [v4 map:v6 f:&__block_literal_global_665];
  id v8 = [v3 responseWith:v7];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
}

uint64_t __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke_663(uint64_t a1, void *a2)
{
  return [a2 toMailMessageKey];
}

- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke;
  v14[3] = &unk_1E65B85A8;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  SGNotUserInitiated(@"reportMessagesFound", 2, v14);
}

void __61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke(void *a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-reportMessagesFound", v11, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [MEMORY[0x1E4F5DA28] map:a1[4] f:&__block_literal_global_657];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  [*(id *)(a1[5] + 8) markMessagesFound:v5];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v7 = [MEMORY[0x1E4F5DA28] map:a1[6] f:&__block_literal_global_659];
  id v8 = (void *)[v6 initWithArray:v7];

  [*(id *)(a1[5] + 8) updateMessages:v8 state:3];
  uint64_t v9 = a1[7];
  id v10 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

SGEmailKey *__61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SGEmailKey alloc] initWithMailMessageKey:v2];

  return v3;
}

SGEmailKey *__61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke_655(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SGEmailKey alloc] initWithMailMessageKey:v2];

  return v3;
}

- (void)updateMessages:(id)a3 state:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SGDSuggestManager_updateMessages_state_completion___block_invoke;
  v12[3] = &unk_1E65B5FE8;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = v9;
  unint64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  SGNotUserInitiated(@"updateMessages", 2, v12);
}

void __53__SGDSuggestManager_updateMessages_state_completion___block_invoke(void *a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-updateMessages", v8, 2u);
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [MEMORY[0x1E4F5DA28] map:a1[4] f:&__block_literal_global_650];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  [*(id *)(a1[5] + 8) updateMessages:v5 state:a1[7]];
  uint64_t v6 = a1[6];
  id v7 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

SGEmailKey *__53__SGDSuggestManager_updateMessages_state_completion___block_invoke_647(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SGEmailKey alloc] initWithMailMessageKey:v2];

  return v3;
}

- (void)messagesToRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke;
  v6[3] = &unk_1E65C0440;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  SGNotUserInitiated(@"messagesToRefreshWithCompletion", 2, v6);
}

void __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-messagesToRefreshWithCompletion", buf, 2u);
  }

  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v10 = 0;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "Loading messages to refresh.", v10, 2u);
  }

  id v4 = (void *)MEMORY[0x1E4F5DB90];
  id v5 = (void *)MEMORY[0x1E4F5DA28];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) loadMessagesToRefresh];
  id v8 = [v5 map:v7 f:&__block_literal_global_642];
  id v9 = [v4 responseWith:v8];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);
}

uint64_t __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke_639(uint64_t a1, void *a2)
{
  return [a2 toMailMessageKey];
}

- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v45 = (void (**)(id, void *))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-birthdayExtractionsForInterval", buf, 2u);
  }

  if (!v7)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2350, @"Invalid parameter not satisfying: %@", @"interval" object file lineNumber description];
  }
  uint64_t v9 = [v7 startDate];
  id v46 = v7;
  uint64_t v43 = [v7 endDate];
  id v44 = (void *)v9;
  id v10 = -[SGSqlEntityStore allContactsWithExtractionStartDate:extractionEndDate:](self->_harvestStore, "allContactsWithExtractionStartDate:extractionEndDate:", v9);
  size_t v11 = [v10 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SGDSuggestManager_birthdayExtractionsForInterval_withCompletion___block_invoke;
  block[3] = &unk_1E65B5D60;
  id v12 = v10;
  id v60 = v12;
  uint64_t v61 = self;
  dispatch_apply(v11, 0, block);
  long long v48 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v12;
  uint64_t v52 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v52)
  {
    uint64_t v13 = *(void *)v56;
    uint64_t v47 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        harvestStore = self->_harvestStore;
        id v17 = [v15 recordId];
        id v18 = [(SGSqlEntityStore *)harvestStore loadEntityByRecordId:v17];

        if (v18)
        {
          long long v19 = [SGMessageKey alloc];
          id v20 = [v18 duplicateKey];
          __int16 v21 = [v20 parentKey];
          long long v22 = [v21 entityKey];
          __int16 v23 = [v22 serialize];
          long long v24 = [(SGMessageKey *)v19 initWithSerialized:v23];

          contactStore = self->_contactStore;
          id v54 = 0;
          id v26 = +[SGCuratedContactMatcher realtimeContactWithContactStore:contactStore forPseudoContact:v15 fromEntity:v18 error:&v54];
          id v27 = v54;
          if (v27)
          {
            uint64_t v28 = sgLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412546;
              BOOL v63 = v15;
              __int16 v64 = 2112;
              id v65 = v27;
              _os_log_debug_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEBUG, "birthdayExtractionsForInterval: Error getting realtime contact for %@: %@", buf, 0x16u);
            }
          }
          if (v26)
          {
            id v50 = objc_alloc(MEMORY[0x1E4F5D9E8]);
            uint64_t v29 = [(SGMessageKey *)v24 uniqueIdentifier];
            [(SGMessageKey *)v24 source];
            v30 = id v51 = v24;
            uint64_t v31 = [v18 duplicateKey];
            uint64_t v32 = [v31 parentKey];
            id v53 = v26;
            id v33 = v27;
            uint64_t v34 = [v32 entityType];
            [v18 creationTimestamp];
            double v36 = v35;
            [v53 cnContactIdentifier];
            v38 = id v37 = self;
            uint64_t v39 = v34;
            id v27 = v33;
            int v40 = (void *)[v50 initWithSpotlightIdentifier:v29 source:v30 entityType:v39 creationTimestamp:1 extractionType:v38 contactIdentifier:v36];

            self = v37;
            uint64_t v13 = v47;

            long long v24 = v51;
            [v48 addObject:v40];

            id v26 = v53;
          }
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v52);
  }

  id v41 = [MEMORY[0x1E4F5DB90] responseWith:v48];
  v45[2](v45, v41);
}

void __67__SGDSuggestManager_birthdayExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  if (![v4 significance])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 8) contactIsSignificantOrSignificanceIsDisabled:v4])uint64_t v3 = 1; {
    else
    }
      uint64_t v3 = 2;
    [v4 setSignificance:v3];
  }
}

- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-celebrationExtractionsForInterval", buf, 2u);
  }

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2342, @"Invalid parameter not satisfying: %@", @"interval" object file lineNumber description];
  }
  [(SGDSuggestManager *)self birthdayExtractionsForInterval:v7 withCompletion:v8];
}

- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactsBySocialProfile", buf, 2u);
  }

  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2334, @"Invalid parameter not satisfying: %@", @"socialProfile" object file lineNumber description];
  }
  id v10 = (void *)MEMORY[0x1E4F5DB90];
  size_t v11 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesBySocialProfile:v7];
  id v12 = [v10 responseWith:v11];
  v8[2](v8, v12);
}

- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactsByEmailAddress", buf, 2u);
  }

  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 2326, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  id v10 = (void *)MEMORY[0x1E4F5DB90];
  size_t v11 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesByEmailAddress:v7];
  id v12 = [v10 responseWith:v11];
  v8[2](v8, v12);
}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  BOOL v59 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v57 = (void (**)(id, void *))a7;
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-namesForDetail", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke;
  block[3] = &unk_1E65BEF88;
  void block[4] = self;
  if (namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__once != -1) {
    dispatch_once(&namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__once, block);
  }
  int v13 = [v11 containsString:@"@"];
  harvestStore = self->_harvestStore;
  long long v58 = v11;
  long long v56 = self;
  if (v13) {
    [(SGSqlEntityStore *)harvestStore suggestContactMatchesByEmailAddress:v11 isMaybe:v59 onlySignificant:v8];
  }
  else {
  id v15 = [(SGSqlEntityStore *)harvestStore suggestContactMatchesByPhoneNumber:v11 isMaybe:v59 onlySignificant:v8];
  }
  unint64_t v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_618];

  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v18 = [v16 count];
  if (v18 >= a4) {
    unint64_t v19 = a4;
  }
  else {
    unint64_t v19 = v18;
  }
  id v20 = (void *)[v17 initWithCapacity:v19];
  if ([v16 count])
  {
    __int16 v21 = [v16 firstObject];
    long long v22 = [v21 contact];
    __int16 v23 = [v22 name];
    long long v24 = [v23 extractionInfo];
    uint64_t v25 = [v24 extractionType];

    id v26 = (void *)MEMORY[0x1E4F5DB50];
    id v27 = [v21 contact];
    uint64_t v28 = [v27 name];
    uint64_t v29 = [v28 extractionInfo];
    uint64_t v30 = [v29 modelVersion];
    [v26 recordMaybeContactFrom:v25 withVersion:v30];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v31 = v16;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    int v34 = 0;
    uint64_t v35 = *(void *)v61;
LABEL_15:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v61 != v35) {
        objc_enumerationMutation(v31);
      }
      id v37 = [*(id *)(*((void *)&v60 + 1) + 8 * v36) contact];
      char v38 = [v37 name];
      uint64_t v39 = [v38 fullName];

      if ([v39 length])
      {
        if (v59)
        {
          uint64_t v47 = _PASValidatedFormat((void *)namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__maybeFormat, v40, v41, v42, v43, v44, v45, v46, (uint64_t)v39);
          [v20 addObject:v47];
        }
        else
        {
          [v20 addObject:v39];
        }
        ++v34;
      }

      if (v34 >= a4) {
        break;
      }
      if (v33 == ++v36)
      {
        uint64_t v33 = [v31 countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v33) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  long long v48 = objc_opt_new();
  objc_msgSend(v48, "setApp:", -[SGDSuggestManager _appEnumForBundleId:](v56, "_appEnumForBundleId:", 0));
  objc_msgSend(v48, "setWasSuggestedContact:", objc_msgSend(v20, "count") != 0);
  long long v49 = [MEMORY[0x1E4F93728] sharedInstance];
  [v49 trackScalarForMessage:v48];

  id v50 = [NSString alloc];
  uint64_t v51 = *MEMORY[0x1E4F5DEF0];
  uint64_t v52 = [v48 key];
  id v53 = (void *)[v50 initWithFormat:@"%@.%@", v51, v52];

  id v54 = [v48 dictionaryRepresentation];
  AnalyticsSendEvent();

  long long v55 = [MEMORY[0x1E4F5DB90] responseWith:v20];
  v57[2](v57, v55);
}

uint64_t __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke(uint64_t a1)
{
  namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__maybeFormat = [*(id *)(a1 + 32) _maybeFormatString];
  return MEMORY[0x1F41817F8]();
}

uint64_t __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 contact];
  uint64_t v6 = [v5 recordId];
  uint64_t v7 = [v6 rowId];

  BOOL v8 = [v4 contact];

  uint64_t v9 = [v8 recordId];
  uint64_t v10 = [v9 rowId];

  if (v7 <= v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v7 < v10) {
    return 1;
  }
  else {
    return v11;
  }
}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = (void (**)(id, void *))a8;
  if (a7)
  {
    unint64_t v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_INFO, "SGDSuggestManager-namesForDetail with additional information lookup", buf, 2u);
    }

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    *(void *)long long buf = 0;
    uint64_t v41 = buf;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke;
    v35[3] = &unk_1E65B5F38;
    id v19 = v18;
    id v36 = v19;
    char v38 = buf;
    unint64_t v39 = a4;
    id v20 = v17;
    id v37 = v20;
    [(SGDSuggestManager *)self namesForDetail:v14 limitTo:a4 prependMaybe:v11 onlySignificant:v10 withCompletion:v35];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    if (*((void *)v41 + 3) < a4)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_611;
      v28[3] = &unk_1E65B5F60;
      id v29 = v19;
      uint64_t v30 = &v31;
      [(SGDSuggestManager *)self interactionStoreLookupForDetail:v14 withCompletion:v28];
    }
    __int16 v21 = objc_opt_new();
    objc_msgSend(v21, "setApp:", -[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", 0));
    [v21 setDidInteractionLookup:*((unsigned __int8 *)v32 + 24)];
    long long v22 = [MEMORY[0x1E4F93728] sharedInstance];
    [v22 trackScalarForMessage:v21];

    id v23 = [NSString alloc];
    long long v24 = [v21 key];
    uint64_t v25 = (void *)[v23 initWithFormat:@"%@.%@", *MEMORY[0x1E4F5DEF0], v24];

    id v26 = [v21 dictionaryRepresentation];
    AnalyticsSendEvent();

    id v27 = [MEMORY[0x1E4F5DB90] responseWith:v19];
    v15[2](v15, v27);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(SGDSuggestManager *)self namesForDetail:v14 limitTo:a4 prependMaybe:v11 onlySignificant:v10 withCompletion:v15];
  }
}

void __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [v3 error];
      *(_DWORD *)long long buf = 138412290;
      dispatch_semaphore_t v17 = v11;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "Error encountered: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = objc_msgSend(v3, "response1", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) addObject:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) count];
        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > *(void *)(a1 + 56)) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
          if (v8) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_611(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 error];

  if (!v3)
  {
    id v4 = [v7 response1];

    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v7 response1];
      [v5 addObject:v6];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138478083;
    id v17 = v5;
    __int16 v18 = 2050;
    uint64_t v19 = [v5 length];
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-interactionStoreLookupForDetail:%{private}@ (length %{public}tu)", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v8 = [[SGPSInteractionLookup alloc] initWithDetail:v5];
  uint64_t v9 = [(SGPSInteractionLookup *)v8 interactionString];
  uint64_t v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v5 length];
    uint64_t v12 = [v9 length];
    int v16 = 138478595;
    id v17 = v5;
    __int16 v18 = 2050;
    uint64_t v19 = v11;
    __int16 v20 = 2113;
    __int16 v21 = v9;
    __int16 v22 = 2050;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-interactionStoreLookupForDetail:%{private}@ (length %{public}tu) -> result: %{private}@ (length %{public}tu)", (uint8_t *)&v16, 0x2Au);
  }

  long long v13 = (void *)MEMORY[0x1E4F5DB90];
  if ([v9 length]) {
    long long v14 = v9;
  }
  else {
    long long v14 = 0;
  }
  long long v15 = [v13 responseWith:v14];
  v6[2](v6, v15);
}

- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesByPhoneNumber", v12, 2u);
  }

  uint64_t v9 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v10 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesByPhoneNumber:v7];

  uint64_t v11 = [v9 responseWith:v10];
  v6[2](v6, v11);
}

- (id)realtimeContactsFromEntity:(id)a3 enrichments:(id)a4 sourceTextMessage:(id)a5 store:(id)a6
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v93 = a4;
  id v94 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SGFeatureVectorLog([v10 inhumanFeatures]);
  }
  if ([v10 isInhuman])
  {
    uint64_t v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "Entity is from inhuman sender", buf, 2u);
    }
    long long v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_98;
  }
  v91 = v11;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v14 = [v10 tags];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v137 objects:v150 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v138;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v138 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        if ([v19 isMailingListId])
        {
          uint64_t v12 = [v19 value];
          goto LABEL_17;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v137 objects:v150 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_17:

  __int16 v20 = objc_opt_new();
  __int16 v21 = objc_opt_new();
  uint64_t v126 = MEMORY[0x1E4F143A8];
  uint64_t v127 = 3221225472;
  v128 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke;
  v129 = &unk_1E65B5EC0;
  id v89 = v10;
  SEL v136 = a2;
  id v87 = v10;
  id v130 = v87;
  v131 = self;
  id v88 = v20;
  id v132 = v88;
  id v133 = v91;
  id v90 = v21;
  id v134 = v90;
  id v135 = v93;
  id v86 = v135;
  __int16 v22 = sgMapAndFilter();
  uint64_t v23 = sgLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v149 = (uint64_t)v22;
    _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Contacts after filter, before realtiming, %{private}@", buf, 0xCu);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v122 objects:v147 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v123;
    v97 = v12;
    id v98 = v24;
    uint64_t v95 = *(void *)v123;
    do
    {
      uint64_t v28 = 0;
      uint64_t v100 = v26;
      do
      {
        if (*(void *)v123 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v122 + 1) + 8 * v28);
        if (v12)
        {
          uint64_t v30 = [*(id *)(*((void *)&v122 + 1) + 8 * v28) emailAddresses];
          uint64_t v117 = MEMORY[0x1E4F143A8];
          uint64_t v118 = 3221225472;
          v119 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_601;
          v120 = &unk_1E65B5EE8;
          v121 = v12;
          uint64_t v31 = sgFilter();

          [v29 setEmailAddresses:v31];
        }
        uint64_t v32 = [v29 name];

        if (!v32)
        {
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          uint64_t v33 = [v29 emailAddresses];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v113 objects:v146 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v114;
            while (2)
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v114 != v36) {
                  objc_enumerationMutation(v33);
                }
                char v38 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                unint64_t v39 = [v38 emailAddress];
                uint64_t v40 = [v39 length];

                if (v40)
                {
                  uint64_t v41 = [v38 emailAddress];
                  uint64_t v42 = +[SGNames nameStringFromEmailAddress:v41];

                  if (v42)
                  {
                    uint64_t v43 = [v38 origin];
                    uint64_t v44 = [v38 recordId];
                    uint64_t v45 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
                    uint64_t v46 = +[SGNames sgNameFromString:v42 origin:v43 recordId:v44 extractionInfo:v45];
                    [v29 setName:v46];

                    goto LABEL_38;
                  }
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v113 objects:v146 count:16];
              if (v35) {
                continue;
              }
              break;
            }
          }
LABEL_38:

          uint64_t v12 = v97;
          id v24 = v98;
          uint64_t v27 = v95;
          uint64_t v26 = v100;
        }
        ++v28;
      }
      while (v28 != v26);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v122 objects:v147 count:16];
    }
    while (v26);
  }

  uint64_t v47 = v94;
  long long v48 = [v94 conversationIdentifier];
  if (![v48 length]) {
    goto LABEL_92;
  }
  unint64_t v49 = [v24 count];

  if (v49 <= 1)
  {
    if ([v24 count] == 1)
    {
      long long v48 = [v24 objectAtIndexedSubscript:0];
    }
    else
    {
      long long v48 = 0;
    }
    id v50 = [v94 author];
    uint64_t v51 = [v50 handles];
    uint64_t v52 = [v51 firstObject];

    long long v102 = v52;
    if (!v48)
    {
      long long v63 = 0;
LABEL_78:
      if (objc_msgSend(v52, "containsString:", @"@", v85)) {
        SGNormalizeEmailAddress();
      }
      else {
      uint64_t v74 = SGNormalizePhoneNumber();
      }

      long long v48 = 0;
      long long v63 = (void *)v74;
LABEL_82:
      if (v63)
      {
        v75 = +[SGDSuggestManager contactAggregator];
        uint64_t v76 = [v47 conversationIdentifier];
        uint64_t v77 = [v75 augmentSuggestedContactWithContact:v48 conversationId:v76 store:self->_harvestStore handle:v63];

        if (v77)
        {
          v141 = v77;
          uint64_t v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
LABEL_87:

          uint64_t v79 = sgLogHandle();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v149 = (uint64_t)v48;
            _os_log_debug_impl(&dword_1CA650000, v79, OS_LOG_TYPE_DEBUG, "Contact pre-aggregation: %@", buf, 0xCu);
          }

          uint64_t v80 = sgLogHandle();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v149 = (uint64_t)v77;
            _os_log_debug_impl(&dword_1CA650000, v80, OS_LOG_TYPE_DEBUG, "Contact post-aggregation: %@", buf, 0xCu);
          }

          id v24 = (id)v78;
LABEL_92:

          goto LABEL_93;
        }
      }
      else
      {
        uint64_t v77 = 0;
      }
      uint64_t v78 = MEMORY[0x1E4F1CBF0];
      goto LABEL_87;
    }
    +[SGIdentityKey keyForPersonHandle:v50];
    uint64_t v101 = v96 = v50;
    id v53 = SGNormalizePhoneNumber();
    uint64_t v54 = +[SGIdentityKey keyForNormalizedPhone:v53];

    long long v55 = SGNormalizeEmailAddress();
    long long v56 = +[SGIdentityKey keyForNormalizedEmail:v55];

    id v85 = (void *)v54;
    if ([v94 senderIsAccountOwner])
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v110 = 0u;
      long long v109 = 0u;
      v144[0] = v101;
      v144[1] = v56;
      v144[2] = v54;
      long long v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:3];
      uint64_t v58 = [v57 countByEnumeratingWithState:&v109 objects:v145 count:16];
      id v50 = v96;
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v110;
        while (2)
        {
          for (uint64_t k = 0; k != v59; ++k)
          {
            if (*(void *)v110 != v60) {
              objc_enumerationMutation(v57);
            }
            if (objc_msgSend(v90, "containsObject:", *(void *)(*((void *)&v109 + 1) + 8 * k), v85, v86, v87, v88))
            {

              v70 = sgLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v149 = (uint64_t)v48;
                _os_log_impl(&dword_1CA650000, v70, OS_LOG_TYPE_DEFAULT, "Extracted Realtime contact details about the user and tried to show them in a banner: %@", buf, 0xCu);
              }

              long long v63 = 0;
              long long v62 = v48;
              long long v48 = 0;
              goto LABEL_70;
            }
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v109 objects:v145 count:16];
          if (v59) {
            continue;
          }
          break;
        }
      }

      long long v62 = [v90 anyObject];
      long long v63 = [v62 uniqueIdentifier];
LABEL_70:
      v71 = (void *)v101;
      uint64_t v52 = v102;
      char v72 = v85;
    }
    else
    {
      id v99 = v24;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      v142[0] = v101;
      v142[1] = v56;
      v142[2] = v54;
      __int16 v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:3];
      uint64_t v65 = [v64 countByEnumeratingWithState:&v105 objects:v143 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v106;
LABEL_60:
        uint64_t v68 = 0;
        while (1)
        {
          if (*(void *)v106 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = *(void **)(*((void *)&v105 + 1) + 8 * v68);
          if (objc_msgSend(v90, "containsObject:", v69, v85, v86, v87, v88)) {
            break;
          }
          if (v66 == ++v68)
          {
            uint64_t v66 = [v64 countByEnumeratingWithState:&v105 objects:v143 count:16];
            if (v66) {
              goto LABEL_60;
            }
            goto LABEL_66;
          }
        }
        long long v63 = [v69 uniqueIdentifier];

        if (!v63) {
          goto LABEL_73;
        }
        id v24 = v99;
        v71 = (void *)v101;
        id v50 = v96;
        uint64_t v52 = v102;
        char v72 = v85;
LABEL_77:

        uint64_t v47 = v94;
        if (v48) {
          goto LABEL_82;
        }
        goto LABEL_78;
      }
LABEL_66:

LABEL_73:
      uint64_t v73 = sgLogHandle();
      uint64_t v52 = v102;
      char v72 = v85;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v149 = (uint64_t)v48;
        _os_log_impl(&dword_1CA650000, v73, OS_LOG_TYPE_DEFAULT, "Extracted a contact with a different handle to the sender: %@", buf, 0xCu);
      }

      long long v63 = 0;
      long long v62 = v48;
      long long v48 = 0;
      id v24 = v99;
      v71 = (void *)v101;
      id v50 = v96;
    }

    goto LABEL_77;
  }
LABEL_93:
  id v103 = v87;
  id v104 = v86;
  long long v13 = sgMapAndFilter();
  uint64_t v81 = sgLogHandle();
  id v10 = v89;
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v82 = [v13 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v149 = v82;
    _os_log_impl(&dword_1CA650000, v81, OS_LOG_TYPE_DEFAULT, "Returning %tu realtime contacts", buf, 0xCu);
  }

  id v83 = sgLogHandle();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v149 = (uint64_t)v13;
    _os_log_debug_impl(&dword_1CA650000, v83, OS_LOG_TYPE_DEBUG, "Realtime contacts: %@", buf, 0xCu);
  }

  id v11 = v91;
LABEL_98:

  return v13;
}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 duplicateKey];
  [v4 entityType];
  if (SGEntityTypeIsContactDetail())
  {
    id v5 = [v3 tags];
    uint64_t v6 = [MEMORY[0x1E4F5D9F0] fromReply];
    int v7 = [v5 containsObject:v6] ^ 1;
  }
  else
  {
    int v7 = 0;
  }

  uint64_t v8 = [v3 duplicateKey];
  if ([v8 entityType] != 4)
  {
    int v12 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = [v3 extractionInfo];
  uint64_t v10 = [v9 extractionType];
  if (v10 == 2)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  unint64_t v49 = [v3 extractionInfo];
  if ([v49 extractionType] == 64)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  uint64_t v16 = [v3 extractionInfo];
  if ([v16 extractionType] == 128)
  {
    uint64_t v47 = v16;
    int v11 = 1;
LABEL_10:
    uint64_t v13 = a1;
    long long v14 = [*(id *)(a1 + 32) tags];
    uint64_t v15 = [MEMORY[0x1E4F5D9F0] fromTextMessage];
    int v12 = [v14 containsObject:v15];

    if (v11) {
    a1 = v13;
    }
    if (v10 == 2) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  int v12 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

  if ((v7 | v12) != 1)
  {
LABEL_28:
    uint64_t v23 = 0;
    goto LABEL_40;
  }
  uint64_t v17 = [v3 duplicateKey];
  __int16 v18 = v17;
  if (v7) {
    [v17 contactDetailKey];
  }
  else {
  uint64_t v19 = [v17 pseudoContactKey];
  }
  __int16 v20 = [v19 identityKey];

  __int16 v21 = [v3 duplicateKey];
  __int16 v22 = [v21 parentKey];
  if (!v22) {
    __assert_rtn("-[SGDSuggestManager realtimeContactsFromEntity:enrichments:sourceTextMessage:store:]_block_invoke", "SGDSuggestManager.m", 2015, "enrichment.duplicateKey.parentKey");
  }

  if (!v20)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"SGDSuggestManager.m", 2016, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if ([*(id *)(a1 + 48) containsObject:v20])
  {

    goto LABEL_28;
  }
  id v24 = (void *)MEMORY[0x1CB79B230]([*(id *)(a1 + 48) addObject:v20]);
  uint64_t v25 = *(void **)(a1 + 56);
  uint64_t v26 = [v3 duplicateKey];
  uint64_t v27 = [v25 storageContactByKey:v26];

  uint64_t v28 = (void *)MEMORY[0x1CB79B230]();
  id v50 = v27;
  id v29 = [v27 profiles];
  uint64_t v30 = [v29 allObjects];
  uint64_t v55 = MEMORY[0x1E4F143A8];
  uint64_t v56 = 3221225472;
  long long v57 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_2;
  uint64_t v58 = &unk_1E65B5E98;
  uint64_t v46 = a1;
  id v59 = *(id *)(a1 + 32);
  uint64_t v31 = sgMapAndFilter();
  uint64_t v32 = +[SGStorageContact mergeAll:v31];
  uint64_t v33 = [v32 anyObject];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v48 = v33;
  uint64_t v34 = [v33 profiles];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(v34);
        }
        unint64_t v39 = [*(id *)(*((void *)&v51 + 1) + 8 * i) tags];
        uint64_t v40 = [MEMORY[0x1E4F5D9F0] hardName];
        char v41 = [v39 containsObject:v40];

        if (v41)
        {

          uint64_t v23 = 0;
          uint64_t v42 = v48;
          uint64_t v43 = v50;
          goto LABEL_39;
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  [*(id *)(v46 + 64) addObject:v20];
  uint64_t v42 = v48;
  uint64_t v23 = [v48 convertToContact:*(void *)(v46 + 56) sourceEntity:*(void *)(v46 + 32) enrichments:*(void *)(v46 + 72)];
  uint64_t v43 = v50;
LABEL_39:

LABEL_40:
  return v23;
}

uint64_t __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_601(uint64_t a1, void *a2)
{
  id v3 = [a2 emailAddress];
  id v4 = SGNormalizeEmailAddress();
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v5;
}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_608(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _isContactInteresting:v3 emailEntity:*(void *)(a1 + 40) enrichments:*(void *)(a1 + 48) hasContactCard:1];
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v23 = v3;
    __int16 v24 = 1024;
    LODWORD(v25) = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Contact: %@, interesting: %i", buf, 0x12u);
  }

  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
    id v21 = 0;
    uint64_t v8 = +[SGCuratedContactMatcher realtimeContactWithContactStore:v7 forPseudoContact:v3 fromEntity:v6 error:&v21];
    id v9 = v21;
    if (v9)
    {
      uint64_t v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        id v23 = v3;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "Error getting realtime contact for %@: %@", buf, 0x16u);
      }
    }
    BOOL v11 = [v8 state] == 2;
    int v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v8 contact];
    char v14 = [v12 _isContactInteresting:v13 emailEntity:*(void *)(a1 + 40) enrichments:*(void *)(a1 + 48) hasContactCard:2 * v11];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = sgLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "Contact deemed uninteresting. Suggestion suppressed", buf, 2u);
      }

      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v16 = [v8 contact];
  uint64_t v17 = [v16 recordId];
  uint64_t v18 = [v17 rowId];

  if (v18 >= 1
    && !+[SGSqlEntityStore isEphemeralIdentifier:v18])
  {
    uint64_t v19 = [v8 markedAsHarvested];

    uint64_t v8 = (void *)v19;
  }

  return v8;
}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = [v3 duplicateKey];
  uint64_t v6 = [v5 parentKey];
  uint64_t v7 = [v6 messageKey];
  uint64_t v8 = [*(id *)(a1 + 32) duplicateKey];
  id v9 = [v8 messageKey];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    BOOL v11 = +[SGStorageContact contactFromContactEntity:v3];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)realtimeWalletPassesFromEntity:(id)a3 enrichments:(id)a4
{
  int v4 = sgMapAndFilter();
  uint64_t v5 = v4;
  if (!v4) {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

id __64__SGDSuggestManager_realtimeWalletPassesFromEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 duplicateKey];
  uint64_t v4 = [v3 entityType];

  if (v4 != 26)
  {
    __int16 v22 = 0;
    goto LABEL_22;
  }
  uint64_t v5 = [v2 duplicateKey];
  id v6 = [v5 walletPassKey];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v2 tags];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v8)
  {

    int v12 = 0;
    BOOL v11 = 0;
LABEL_18:
    id v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v31 = v25;
      _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "%@: Wallet Pass Data or Dictionary cannot be empty", buf, 0xCu);
    }
    __int16 v22 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  int v10 = v6;
  BOOL v11 = 0;
  int v12 = 0;
  uint64_t v13 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v15 isWalletPassData])
      {
        uint64_t v16 = [v15 walletPassData];

        BOOL v11 = (void *)v16;
      }
      if ([v15 isWalletPassDictionary])
      {
        uint64_t v17 = [v15 walletPassDictionary];

        int v12 = (void *)v17;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  }
  while (v9);

  id v6 = v10;
  if (!v11 || !v12) {
    goto LABEL_18;
  }
  uint64_t v18 = [v12 objectForKeyedSubscript:@"passState"];
  uint64_t v19 = stateForWalletPassStateString(v18);

  id v20 = objc_alloc(MEMORY[0x1E4F5DB18]);
  id v21 = [v6 identifier];
  __int16 v22 = (void *)[v20 initRealtimeWalletPassForState:v19 identifier:v21 walletPassDictionary:v12 walletPassData:v11];
LABEL_21:

LABEL_22:
  return v22;
}

- (BOOL)_isContactInteresting:(id)a3 emailEntity:(id)a4 enrichments:(id)a5 hasContactCard:(unint64_t)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [MEMORY[0x1E4F5D9F0] isSent];
  char v12 = [v9 hasTag:v11];

  uint64_t v65 = v9;
  if (v12)
  {
    int v13 = 0;
  }
  else
  {
    char v14 = [v9 author];
    uint64_t v15 = objc_msgSend(v14, "sg_emailAddress");
    uint64_t v16 = (void *)v15;
    uint64_t v17 = &stru_1F24EEF20;
    if (v15) {
      uint64_t v17 = (__CFString *)v15;
    }
    uint64_t v18 = v17;

    uint64_t v19 = SGNormalizeEmailAddress();
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v20 = [v8 emailAddresses];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v62 = v10;
      uint64_t v23 = *(void *)v75;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v75 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v74 + 1) + 8 * i) emailAddress];
          long long v26 = SGNormalizeEmailAddress();
          int v27 = [v26 isEqualToString:v19];

          if (!v27)
          {
            int v13 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v74 objects:v80 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      int v13 = 0;
LABEL_15:
      id v10 = v62;
    }
    else
    {
      int v13 = 0;
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v28 = v10;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    int v63 = v13;
    uint64_t v31 = *(void *)v71;
    while (2)
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v71 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        uint64_t v34 = [v33 duplicateKey];
        [v34 entityType];
        int IsContact = SGEntityTypeIsContact();

        if (IsContact)
        {
          uint64_t v36 = [v8 name];
          uint64_t v37 = [v36 fullName];
          char v38 = [v33 title];
          int v39 = [v37 isEqual:v38];

          if (v39)
          {
            uint64_t v40 = [v33 extractionInfo];
            uint64_t v41 = [v40 extractionType];

            if (v41 == 2)
            {
              char v42 = 1;
              goto LABEL_30;
            }
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v30) {
        continue;
      }
      break;
    }
    char v42 = 0;
LABEL_30:
    int v13 = v63;
  }
  else
  {
    char v42 = 0;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v43 = v28;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v67;
LABEL_34:
    uint64_t v47 = 0;
    while (1)
    {
      if (*(void *)v67 != v46) {
        objc_enumerationMutation(v43);
      }
      long long v48 = *(void **)(*((void *)&v66 + 1) + 8 * v47);
      unint64_t v49 = [v48 extractionInfo];
      uint64_t v50 = [v49 extractionType];

      if (v50 == 64) {
        break;
      }
      long long v51 = [v48 extractionInfo];
      uint64_t v52 = [v51 extractionType];

      if (v52 == 128)
      {

        int v53 = 0;
        char v54 = 0;
        if ([v43 count] != 1) {
          goto LABEL_48;
        }
        goto LABEL_61;
      }
      if (v45 == ++v47)
      {
        uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v45) {
          goto LABEL_34;
        }
        goto LABEL_41;
      }
    }

    if ([v43 count] != 1)
    {
      int v53 = 1;
      goto LABEL_48;
    }
    if (a6 == 2)
    {
      char v54 = 0;
    }
    else
    {
      uint64_t v60 = [v8 name];
      uint64_t v61 = [v60 fullName];
      char v54 = [v61 length] == 0;
    }
  }
  else
  {
LABEL_41:

    int v53 = 0;
LABEL_48:
    uint64_t v55 = [v8 birthday];

    if (a6 == 2) {
      char v56 = 0;
    }
    else {
      char v56 = v42;
    }
    if (a6) {
      BOOL v57 = v55 == 0;
    }
    else {
      BOOL v57 = 1;
    }
    char v58 = !v57;
    char v54 = 1;
    if ((v56 & 1) == 0 && ((v13 | v53) & 1) == 0 && (v58 & 1) == 0) {
      char v54 = [v8 hasNonTrivialInfo];
    }
  }
LABEL_61:

  return v54;
}

- (id)realtimeWalletOrdersFromEntity:(id)a3 enrichments:(id)a4
{
  uint64_t v4 = sgMapAndFilter();
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

id __64__SGDSuggestManager_realtimeWalletOrdersFromEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 duplicateKey];
  uint64_t v4 = [v3 entityType];

  if (v4 != 25)
  {
    uint64_t v22 = 0;
    goto LABEL_22;
  }
  uint64_t v5 = [v2 duplicateKey];
  id v6 = [v5 walletOrderKey];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v2 tags];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v8)
  {

    char v12 = 0;
    BOOL v11 = 0;
LABEL_18:
    uint64_t v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v31 = v25;
      _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "%@: Wallet Order Data or Dictionary cannot be empty", buf, 0xCu);
    }
    uint64_t v22 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  id v10 = v6;
  BOOL v11 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v15 isWalletOrderData])
      {
        uint64_t v16 = [v15 walletOrderData];

        BOOL v11 = (void *)v16;
      }
      if ([v15 isWalletOrderDictionary])
      {
        uint64_t v17 = [v15 walletOrderDictionary];

        char v12 = (void *)v17;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  }
  while (v9);

  id v6 = v10;
  if (!v11 || !v12) {
    goto LABEL_18;
  }
  uint64_t v18 = [v12 objectForKeyedSubscript:@"orderState"];
  uint64_t v19 = stateForWalletOrderString(v18);

  id v20 = objc_alloc(MEMORY[0x1E4F5DB10]);
  uint64_t v21 = [v6 serialize];
  uint64_t v22 = (void *)[v20 initRealtimeWalletOrderForState:v19 identifier:v21 walletOrderDictionary:v12 walletOrderData:v11];
LABEL_21:

LABEL_22:
  return v22;
}

- (BOOL)containsNonCuratedData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "origin", (void)v10);
        uint64_t v8 = [v7 type];

        if (v8 != 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isSGEntity:(id)a3 duplicateOfEKEvent:(id)a4 withStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v8 duplicateKey];
  long long v12 = [v10 loadEventByDuplicateKey:v11];
  long long v13 = [v12 convertToEvent:v10];

  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider) {
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
  }
  uint64_t v15 = ekStoreProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__SGDSuggestManager_isSGEntity_duplicateOfEKEvent_withStore___block_invoke;
  v19[3] = &unk_1E65B5E20;
  id v16 = v13;
  id v20 = v16;
  id v17 = v9;
  id v21 = v17;
  uint64_t v22 = &v23;
  ((void (*)(SGEKEventStoreProvider *, void *))v15->_callBlockWithEKEventStoreForReading)(v15, v19);

  LOBYTE(v15) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v15;
}

void __61__SGDSuggestManager_isSGEntity_duplicateOfEKEvent_withStore___block_invoke(uint64_t a1, uint64_t a2)
{
  id v23 = [*(id *)(a1 + 32) toEKEventWithStore:a2];
  id v3 = objc_opt_new();
  uint64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  uint64_t v5 = [v23 timeZone];
  [v3 setTimeZone:v5];

  id v6 = [v23 startDate];
  uint64_t v7 = [v3 stringFromDate:v6];

  id v8 = [v23 endDate];
  id v9 = [v3 stringFromDate:v8];

  id v10 = [*(id *)(a1 + 40) timeZone];
  [v3 setTimeZone:v10];

  long long v11 = [*(id *)(a1 + 40) startDate];
  long long v12 = [v3 stringFromDate:v11];

  long long v13 = [*(id *)(a1 + 40) endDate];
  char v14 = [v3 stringFromDate:v13];

  uint64_t v15 = [v23 startDate];
  id v16 = [*(id *)(a1 + 40) startDate];
  if ([v15 isEqualToDate:v16] && objc_msgSend(v7, "isEqualToString:", v12))
  {
    id v17 = [v23 endDate];
    uint64_t v18 = [*(id *)(a1 + 40) endDate];
    if ([v17 isEqualToDate:v18]
      && [v9 isEqualToString:v14])
    {
      uint64_t v22 = [v23 locationWithoutPrediction];
      id v21 = [*(id *)(a1 + 40) locationWithoutPrediction];
      if (objc_msgSend(v22, "isEqualToString:"))
      {
        id v20 = [v23 title];
        uint64_t v19 = [*(id *)(a1 + 40) title];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v20 isEqualToString:v19];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (id)curatedEventKeyForExactMatchOfPseudoEvent:(id)a3 candidates:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [SGDuplicateKey alloc];
  id v8 = [v5 duplicateKey];
  id v9 = [v8 parentKey];
  id v10 = [v9 serialize];
  uint64_t v36 = [(SGDuplicateKey *)v7 initWithSerialized:v10];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v6;
  long long v12 = (SGCuratedEventKey *)[v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v12)
  {
    id v35 = v5;
    uint64_t v13 = *(void *)v38;
    while (1)
    {
      char v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v14);
        uint64_t v16 = [v15 suggestionInfo];
        if (v16)
        {
          id v17 = (void *)v16;
          uint64_t v18 = [v15 calendar];
          if ([v18 isSuggestedEventCalendar]) {
            goto LABEL_8;
          }
          uint64_t v19 = [v15 calendar];
          char v20 = [v19 isNaturalLanguageSuggestedEventCalendar];

          if (v20) {
            goto LABEL_23;
          }
          id v21 = [v15 suggestionInfo];
          id v17 = [v21 uniqueKey];

          if (v17)
          {
            if (+[SGDuplicateKey serializationPassesBasicScrutiny:v17])
            {
              uint64_t v22 = [[SGDuplicateKey alloc] initWithSerialized:v17];
              uint64_t v18 = v22;
              if (v22)
              {
                id v23 = [(SGDuplicateKey *)v22 parentKey];
                int v24 = [v23 isEqualToDuplicateKey:v36];

                if (v24)
                {
                  uint64_t v25 = [v15 eventIdentifier];

                  if (v25)
                  {
                    uint64_t v32 = [SGCuratedEventKey alloc];
                    uint64_t v33 = [v15 eventIdentifier];
                    long long v12 = [(SGCuratedEventKey *)v32 initWithExternalId:v33];

                    goto LABEL_30;
                  }
                  char v26 = sgLogHandle();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "EKEvent exact match with the same duplicate key found, but eventIdentifier is nil.", buf, 2u);
                  }
                }
              }
LABEL_8:

LABEL_22:
              goto LABEL_23;
            }
            long long v27 = sgLogHandle();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
LABEL_21:

              if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
                abort();
              }
              goto LABEL_22;
            }
            *(_DWORD *)long long buf = 138477827;
            char v42 = v17;
            long long v28 = v27;
            long long v29 = "Skipping event with dupKeyString that does not pass basic scrutiny: %{private}@";
            uint32_t v30 = 12;
          }
          else
          {
            long long v27 = sgLogHandle();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
              goto LABEL_21;
            }
            *(_WORD *)long long buf = 0;
            long long v28 = v27;
            long long v29 = "Skipping event with nonnull suggestionInfo but null suggestionInfo.uniqueKey";
            uint32_t v30 = 2;
          }
          _os_log_fault_impl(&dword_1CA650000, v28, OS_LOG_TYPE_FAULT, v29, buf, v30);
          goto LABEL_21;
        }
LABEL_23:
        char v14 = (SGCuratedEventKey *)((char *)v14 + 1);
      }
      while (v12 != v14);
      uint64_t v31 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
      long long v12 = (SGCuratedEventKey *)v31;
      if (!v31)
      {
LABEL_30:
        id v5 = v35;
        break;
      }
    }
  }

  return v12;
}

- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 message:(id)a4 enrichments:(id)a5 store:(id)a6 keepPastEvents:(BOOL)a7 keepPartialEvents:(BOOL)a8 keepEventsFromOldDocuments:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  char v20 = [MEMORY[0x1E4F5DAF0] alwaysShowCancelledEvents];
  id v21 = +[SGDSuggestManager filterPseudoEvents:v18 keepPastEvents:v10 keepPartialEvents:v9 keepEventsFromOldDocuments:a9];
  uint64_t v22 = sgEventsLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = [v16 loggingIdentifier];
    *(_DWORD *)long long v48 = 138543618;
    *(void *)&v48[4] = v36;
    *(_WORD *)&v48[12] = 1024;
    *(_DWORD *)&v48[14] = [v21 count];
    _os_log_debug_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEBUG, "SGDSuggestManager - For [SGEntity %{public}@], Found %d extracted event candidates.", v48, 0x12u);
  }
  *(void *)long long v48 = 0;
  *(void *)&v48[8] = v48;
  *(void *)&v48[16] = 0x3032000000;
  unint64_t v49 = __Block_byref_object_copy__4015;
  uint64_t v50 = __Block_byref_object_dispose__4016;
  id v51 = 0;
  if ([v21 count])
  {
    ekStoreProvider = self->_ekStoreProvider;
    if (ekStoreProvider) {
      ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
    }
    int v24 = ekStoreProvider;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __145__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store_keepPastEvents_keepPartialEvents_keepEventsFromOldDocuments___block_invoke;
    v37[3] = &unk_1E65B5DD0;
    id v43 = v48;
    id v38 = v21;
    long long v39 = self;
    SEL v44 = a2;
    id v40 = v19;
    char v45 = v20;
    id v41 = v17;
    id v42 = v16;
    ((void (*)(SGEKEventStoreProvider *, void *))v24->_callBlockWithEKEventStoreForReading)(v24, v37);

    uint64_t v25 = v38;
  }
  else
  {
    uint64_t v25 = *(void **)(*(void *)&v48[8] + 40);
    *(void *)(*(void *)&v48[8] + 40) = MEMORY[0x1E4F1CBF0];
  }

  if (os_variant_has_internal_diagnostics() && [v16 hasExtractionException])
  {
    id v26 = [[SGRealtimeEventResponse alloc] initExtractionExceptionWithEntity:v16];
    long long v27 = [MEMORY[0x1E4F1CA48] arrayWithArray:*(void *)(*(void *)&v48[8] + 40)];
    [v27 addObject:v26];
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithArray:v27];
    long long v29 = *(void **)(*(void *)&v48[8] + 40);
    *(void *)(*(void *)&v48[8] + 40) = v28;
  }
  id v30 = v19;
  id v31 = v16;
  uint64_t v32 = sgMapAndFilter();
  uint64_t v33 = sgLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    int v34 = [v32 count];
    *(_DWORD *)long long buf = 67109120;
    int v47 = v34;
    _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_INFO, "Returning %d realtime events.", buf, 8u);
  }

  _Block_object_dispose(v48, 8);
  return v32;
}

void __145__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store_keepPastEvents_keepPartialEvents_keepEventsFromOldDocuments___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v3 = v7;
  uint64_t v4 = sgMapAndFilter();
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id __145__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store_keepPastEvents_keepPartialEvents_keepEventsFromOldDocuments___block_invoke_568(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([v3 state])
  {
    case 1u:
      uint64_t v4 = sgLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "New realtime event", buf, 2u);
      }

      uint64_t v5 = [v3 entity];
      id v6 = [v5 duplicateKey];
      id v7 = [v6 parentKey];
      if ([v7 entityType] == 18) {
        id v8 = (id *)(*(void *)(a1 + 32) + 8);
      }
      else {
        id v8 = (id *)(a1 + 40);
      }
      id v14 = *v8;

      id v41 = [v3 entity];
      id v42 = [v41 duplicateKey];
      id v43 = [v14 loadEventByDuplicateKey:v42];
      long long v39 = [v43 convertToEvent:v14];

      if (v39)
      {
        uint64_t v40 = objc_msgSend(MEMORY[0x1E4F5DB00], "realtimeEventForNewEvent:harvested:", v39, objc_msgSend(v14, "isEphemeral") ^ 1);
        goto LABEL_29;
      }
      id v31 = 0;
      goto LABEL_31;
    case 2u:
      id v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "Update realtime event", v50, 2u);
      }

      id v10 = *(void **)(a1 + 40);
      id v11 = [v3 entity];
      long long v12 = [v11 duplicateKey];
      uint64_t v13 = [v10 loadEventByDuplicateKey:v12];
      id v14 = [v13 convertToEvent:*(void *)(a1 + 40)];

      if (!v14) {
        goto LABEL_19;
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F5DB00];
      id v16 = [v3 duplicateEventKey];
      id v17 = [v16 externalId];
      uint64_t v18 = objc_msgSend(v15, "realtimeEventUpdateToEvent:withNewValues:harvested:", v17, v14, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
      goto LABEL_18;
    case 3u:
      id v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v49 = 0;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "Cancellation realtime event", v49, 2u);
      }

      char v20 = *(void **)(a1 + 40);
      id v21 = [v3 entity];
      uint64_t v22 = [v21 duplicateKey];
      id v23 = [v20 loadEventByDuplicateKey:v22];
      id v14 = [v23 convertToEvent:*(void *)(a1 + 40)];

      if (!v14) {
        goto LABEL_19;
      }
      int v24 = (void *)MEMORY[0x1E4F5DB00];
      id v16 = [v3 duplicateEventKey];
      id v17 = [v16 externalId];
      uint64_t v18 = objc_msgSend(v24, "realtimeEventForCanceledEvent:eventIdentifier:harvested:", v14, v17, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
      goto LABEL_18;
    case 4u:
      uint64_t v25 = sgLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v51 = 0;
        _os_log_impl(&dword_1CA650000, v25, OS_LOG_TYPE_INFO, "Duplicate realtime event", v51, 2u);
      }

      id v26 = *(void **)(a1 + 40);
      long long v27 = [v3 entity];
      uint64_t v28 = [v27 duplicateKey];
      long long v29 = [v26 loadEventByDuplicateKey:v28];
      id v14 = [v29 convertToEvent:*(void *)(a1 + 40)];

      if (v14)
      {
        id v30 = (void *)MEMORY[0x1E4F5DB00];
        id v16 = [v3 duplicateEventKey];
        id v17 = [v16 externalId];
        uint64_t v18 = objc_msgSend(v30, "realtimeEventForDuplicateEvent:eventIdentifier:harvested:", v14, v17, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
LABEL_18:
        id v31 = (void *)v18;
      }
      else
      {
LABEL_19:
        id v31 = 0;
      }
      break;
    case 5u:
      uint64_t v32 = sgLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v48 = 0;
        _os_log_impl(&dword_1CA650000, v32, OS_LOG_TYPE_INFO, "Near duplicate realtime event", v48, 2u);
      }

      uint64_t v33 = (void *)MEMORY[0x1E4F5DB00];
      int v34 = [v3 duplicateEventKey];
      id v35 = [v34 externalId];
      id v31 = objc_msgSend(v33, "realtimeEventForNearDuplicateEvent:harvested:", v35, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);

      if (!v31) {
        goto LABEL_34;
      }
      goto LABEL_33;
    case 6u:
      uint64_t v36 = [*(id *)(a1 + 48) duplicateKey];
      uint64_t v37 = [v36 entityType];

      if (v37 != 5) {
        goto LABEL_34;
      }
      id v38 = [*(id *)(a1 + 48) duplicateKey];
      id v14 = [v38 entityKey];

      long long v39 = [v14 messageId];
      uint64_t v40 = [MEMORY[0x1E4F5DB00] realtimeEventForExtractionExceptionWithSourceMessageId:v39];
LABEL_29:
      id v31 = (void *)v40;
LABEL_31:

      break;
    default:
      goto LABEL_34;
  }

  if (v31)
  {
LABEL_33:
    SEL v44 = (void *)MEMORY[0x1E4F93BB8];
    char v45 = [v3 templateShortName];
    uint64_t v46 = [v44 tupleWithFirst:v45 second:v31];
  }
  else
  {
LABEL_34:
    uint64_t v46 = 0;
  }

  return v46;
}

id __145__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store_keepPastEvents_keepPartialEvents_keepEventsFromOldDocuments___block_invoke_2(uint64_t a1, void *a2)
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) eventsWithSameOpaqueKeyAsPseudoEvent:v3 harvestStore:*(void *)(*(void *)(a1 + 40) + 8)];
  if (![v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 32) eventsWithSameAlternativeOpaqueKeyAsPseudoEvent:v3 harvestStore:*(void *)(*(void *)(a1 + 40) + 8)];
    if ([v5 count])
    {
      if ((unint64_t)[v5 count] >= 2)
      {
        id v6 = sgLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "More than one event found using alternative keys", buf, 2u);
        }
      }
      id v7 = [v3 duplicateKey];
      id v8 = [v7 pseudoEventKey];
      char v9 = [v8 isDropoff];

      if ((v9 & 1) == 0)
      {
        id v10 = [v5 firstObject];
        id v11 = [v10 suggestionInfo];
        long long v12 = [v11 opaqueKey];

        if (!v12)
        {
          long long v77 = [MEMORY[0x1E4F28B00] currentHandler];
          [v77 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 40), @"SGDSuggestManager.m", 1566, @"Invalid parameter not satisfying: %@", @"foundEvent.suggestionInfo.opaqueKey" object file lineNumber description];
        }
        uint64_t v13 = [SGPseudoEventKey alloc];
        id v14 = [v10 suggestionInfo];
        uint64_t v15 = [v14 opaqueKey];
        id v16 = [(SGPseudoEventKey *)v13 initWithSerialized:v15];

        if (![(SGPseudoEventKey *)v16 isDropoff])
        {
          v79[0] = v10;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];

          uint64_t v4 = (void *)v17;
        }
      }
    }
  }
  if (![v4 count])
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = [v3 duplicateKey];
    char v20 = [v19 pseudoEventKey];
    id v21 = [v20 groupId];
    uint64_t v22 = [v18 eventWithExternalID:v21];

    if (v22)
    {
      id v23 = [v22 suggestionInfo];

      if (!v23)
      {
        id v35 = [v22 eventIdentifier];

        if (v35)
        {
          uint64_t v36 = [SGCuratedEventKey alloc];
          uint64_t v37 = [v22 eventIdentifier];
          id v38 = [(SGCuratedEventKey *)v36 initWithExternalId:v37];

          id v26 = [[SGRealtimeEventResponse alloc] initDuplicateOfCuratedEvent:v38 withEntity:v3];
        }
        else
        {
          id v38 = sgLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEBUG, "EKEvent with the same externalIdentifier found, but eventIdentifier is nil.", buf, 2u);
          }
          id v26 = 0;
        }

        goto LABEL_21;
      }
    }
  }
  uint64_t v24 = [*(id *)(a1 + 40) curatedEventKeyForExactMatchOfPseudoEvent:v3 candidates:v4];
  if (v24)
  {
    uint64_t v22 = (void *)v24;
    id v25 = [[SGRealtimeEventResponse alloc] initDuplicateOfCuratedEvent:v24 withEntity:v3];
LABEL_20:
    id v26 = v25;
LABEL_21:

    goto LABEL_22;
  }
  if ([v4 count])
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v28 = sgLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEFAULT, "More than one EKEvent with the same opaque key detected.", buf, 2u);
      }
    }
    uint64_t v22 = [v4 firstObject];
    long long v29 = [v22 eventIdentifier];

    if (v29)
    {
      id v30 = [SGCuratedEventKey alloc];
      id v31 = [v22 eventIdentifier];
      uint64_t v32 = [(SGCuratedEventKey *)v30 initWithExternalId:v31];

      if ([v3 isCancelled])
      {
        if (v32)
        {
          uint64_t v33 = [SGRealtimeEventResponse alloc];
          int v34 = [v3 templateShortName];
          id v26 = [(SGRealtimeEventResponse *)v33 initCancellationOfCuratedEvent:v32 templateShortName:v34 entity:v3];
LABEL_52:

          goto LABEL_53;
        }
        goto LABEL_42;
      }
    }
    else
    {
      long long v39 = sgLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEBUG, "EKEvent with the same opaque key found, but eventIdentifier is nil.", buf, 2u);
      }

      if ([v3 isCancelled])
      {
LABEL_42:
        uint64_t v32 = sgLogHandle();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
LABEL_43:
          id v26 = 0;
LABEL_53:

          goto LABEL_21;
        }
        *(_WORD *)long long buf = 0;
        long long v66 = "EKEvent for cancellation found, but eventIdentifier is nil.";
LABEL_96:
        _os_log_debug_impl(&dword_1CA650000, v32, OS_LOG_TYPE_DEBUG, v66, buf, 2u);
        goto LABEL_43;
      }
      uint64_t v32 = 0;
    }
    uint64_t v40 = [v22 calendar];
    if ([v40 isSuggestedEventCalendar])
    {

      goto LABEL_48;
    }
    id v41 = [v22 calendar];
    int v42 = [v41 isNaturalLanguageSuggestedEventCalendar];

    if (v42)
    {
LABEL_48:
      if ([*(id *)(a1 + 40) isSGEntity:v3 duplicateOfEKEvent:v22 withStore:*(void *)(a1 + 48)])
      {
        id v43 = [v22 suggestionInfo];
        SEL v44 = [v43 uniqueKey];

        if (v44)
        {
          char v45 = [v22 suggestionInfo];
          int v34 = [v45 uniqueKey];

          if (+[SGDuplicateKey serializationPassesBasicScrutiny:v34])
          {
            uint64_t v46 = [[SGDuplicateKey alloc] initWithSerialized:v34];
            int v47 = [*(id *)(*(void *)(a1 + 40) + 8) loadEntityByKey:v46];
            id v26 = [[SGRealtimeEventResponse alloc] initNewEventWithEntity:v47];

            goto LABEL_52;
          }
        }
      }

      uint64_t v22 = v32;
LABEL_65:
      unint64_t v49 = *(void **)(a1 + 32);
      if (*(void *)(a1 + 56)) {
        objc_msgSend(v49, "sg_fetchEKEventsForPseudoNLEvent:message:", v3);
      }
      else {
      uint64_t v50 = objc_msgSend(v49, "sg_fetchEKEventsForPseudoNLEvent:entity:", v3, *(void *)(a1 + 64));
      }
      if (!v50)
      {
        uint64_t v50 = objc_msgSend(*(id *)(a1 + 32), "sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime:", v3);
        if (!v50)
        {
          id v25 = [[SGRealtimeEventResponse alloc] initNewEventWithEntity:v3];
          goto LABEL_20;
        }
      }
      if ([v50 count] == 1)
      {
        id v51 = [v3 tags];
        uint64_t v52 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
        int v53 = [v51 containsObject:v52];

        if (v53)
        {
          char v54 = [v3 timeRange];
          uint64_t v55 = [v54 absoluteRange];
          [v55 start];
          BOOL v57 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v56];

          char v58 = [v50 objectAtIndexedSubscript:0];
          id v59 = [v58 startDate];
          char v60 = [v59 isEqualToDate:v57];

          if ((v60 & 1) == 0)
          {
            int v63 = sgLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              __int16 v64 = "Suppressing NL event because it looks like a near-duplicate of a curated event.";
              goto LABEL_100;
            }
LABEL_81:

            goto LABEL_88;
          }
          uint64_t v61 = [v50 objectAtIndexedSubscript:0];
          int v62 = [v61 hasRecurrenceRules];

          if (v62)
          {
            int v63 = sgLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              __int16 v64 = "Suppressing NL event because it looks like a duplicate of a recurring curated event.";
LABEL_100:
              _os_log_debug_impl(&dword_1CA650000, v63, OS_LOG_TYPE_DEBUG, v64, buf, 2u);
              goto LABEL_81;
            }
            goto LABEL_81;
          }
        }
        long long v67 = [v50 objectAtIndexedSubscript:0];
        long long v68 = [v67 eventIdentifier];

        if (v68)
        {
          long long v69 = [SGCuratedEventKey alloc];
          long long v70 = [v50 objectAtIndexedSubscript:0];
          long long v71 = [v70 eventIdentifier];
          uint64_t v72 = [(SGCuratedEventKey *)v69 initWithExternalId:v71];

          id v26 = [[SGRealtimeEventResponse alloc] initDuplicateOfCuratedEvent:v72 withEntity:v3];
          uint64_t v22 = (void *)v72;
          goto LABEL_21;
        }
        BOOL v57 = sgLogHandle();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
LABEL_88:

          id v26 = 0;
          goto LABEL_21;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v65 = "Suppressing NL event because eventIdentifier is nil.";
      }
      else
      {
        BOOL v57 = sgLogHandle();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_88;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v65 = "Suppressing event because we found more than 1 duplicate.";
      }
      _os_log_debug_impl(&dword_1CA650000, v57, OS_LOG_TYPE_DEBUG, v65, buf, 2u);
      goto LABEL_88;
    }
    if (!v32)
    {
      uint64_t v32 = sgEventsLogHandle();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_43;
      }
      *(_WORD *)long long buf = 0;
      long long v66 = "Suppressing update or view duplicate of EKEvent because eventIdentifier is nil.";
      goto LABEL_96;
    }
    if ([v22 status] == 3)
    {
      long long v48 = sgEventsLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v48, OS_LOG_TYPE_DEBUG, "Suppressing update or view duplicate of EKEvent because event status is canceled.", buf, 2u);
      }

      goto LABEL_43;
    }
    [v3 creationTimestamp];
    if (objc_msgSend(v22, "sg_isCuratedEventFromSuggestionNewerThan:"))
    {
      long long v73 = sgEventsLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v73, OS_LOG_TYPE_DEBUG, "Newer EKEvent from Suggestions has been found. Showing the updated event insead of this one.", buf, 2u);
      }

      long long v74 = [SGRealtimeEventResponse alloc];
    }
    else
    {
      int v75 = [*(id *)(a1 + 40) isSGEntity:v3 duplicateOfEKEvent:v22 withStore:*(void *)(a1 + 48)];
      long long v74 = [SGRealtimeEventResponse alloc];
      if (!v75)
      {
        uint64_t v76 = [(SGRealtimeEventResponse *)v74 initUpdatedEventWithEntity:v3 curatedEventKey:v32];
        goto LABEL_98;
      }
    }
    uint64_t v76 = [(SGRealtimeEventResponse *)v74 initDuplicateOfCuratedEvent:v32 withEntity:v3];
LABEL_98:
    id v26 = (id)v76;
    goto LABEL_53;
  }
  uint64_t v22 = 0;
  if (![v3 isCancelled]) {
    goto LABEL_65;
  }
  id v26 = 0;
  if (*(unsigned char *)(a1 + 80)) {
    goto LABEL_65;
  }
LABEL_22:

  return v26;
}

- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 enrichments:(id)a4 store:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F5DAF0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  LOBYTE(v14) = [v8 showPastEvents];
  long long v12 = -[SGDSuggestManager shortNamesAndRealtimeEventsFromEntity:message:enrichments:store:keepPastEvents:keepPartialEvents:keepEventsFromOldDocuments:](self, "shortNamesAndRealtimeEventsFromEntity:message:enrichments:store:keepPastEvents:keepPartialEvents:keepEventsFromOldDocuments:", v11, 0, v10, v9, [MEMORY[0x1E4F5DAF0] showPastEvents], 0, v14);

  return v12;
}

- (void)bumptTTLForNLEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isNaturalLanguageEvent])
  {
    uint64_t v5 = self->_ekStoreProvider;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke;
    id v11 = &unk_1E65BFD88;
    long long v12 = v5;
    id v13 = v4;
    id v6 = v5;
    id v7 = (void *)MEMORY[0x1CB79B4C0](&v8);
    if (bumptTTLForNLEvent___pasOnceToken53 != -1) {
      dispatch_once(&bumptTTLForNLEvent___pasOnceToken53, &__block_literal_global_558);
    }
    objc_msgSend(MEMORY[0x1E4F93B18], "runAsyncOnQueue:afterDelaySeconds:block:", bumptTTLForNLEvent___pasExprOnceResult, v7, 2.0, v8, v9, v10, v11);
  }
}

void __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke(uint64_t a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "NaturalLanguageEvent Found: Bumping TTL", v7, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[1];
  }
  id v4 = (void (*)(void))v3[2];
  uint64_t v5 = v3;
  id v6 = v4();
  objc_msgSend(v6, "sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction:", *(void *)(a1 + 40));
}

void __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke_556()
{
  id v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.suggestions.SGEKCalendarWrite" qosClass:17];
  id v2 = (void *)bumptTTLForNLEvent___pasExprOnceResult;
  bumptTTLForNLEvent___pasExprOnceResult = v1;
}

- (id)cachedResultForKey:(id)a3 generateResult:(id)a4 validateResults:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  uint64_t v9 = (void (**)(id, void))a5;
  id v10 = (void *)[v7 mutableCopy];
  id v11 = [NSString alloc];
  long long v12 = +[SGAsset asset];
  id v13 = objc_msgSend(v11, "initWithFormat:", @"%lu", objc_msgSend(v12, "assetVersion"));
  uint64_t v14 = [v13 dataUsingEncoding:1];
  [v10 appendData:v14];

  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x3032000000;
  SEL v44 = __Block_byref_object_copy__4015;
  char v45 = __Block_byref_object_dispose__4016;
  id v46 = 0;
  uint64_t v15 = +[SGDSuggestManager requestCache];
  id v16 = [v15 resultIfAvailable];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke;
  v38[3] = &unk_1E65BB4E8;
  uint64_t v40 = &v41;
  id v17 = v10;
  id v39 = v17;
  [v16 runWithLockAcquired:v38];

  if (v42[5])
  {
    uint64_t v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v32 = v42[5];
      *(_DWORD *)long long buf = 138412290;
      *(void *)long long v48 = v32;
      _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "Suggestions Cache hit: %@", buf, 0xCu);
    }

    id v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "Suggestions Cache hit", buf, 2u);
    }
  }
  else
  {
    char v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = v42[5];
      *(_DWORD *)long long buf = 138412290;
      *(void *)long long v48 = v34;
      _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "Suggestions Cache miss: %@", buf, 0xCu);
    }

    id v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_INFO, "Suggestions Cache miss", buf, 2u);
    }

    uint64_t v22 = v8[2](v8);
    uint64_t v23 = [v22 copy];
    uint64_t v24 = (void *)v42[5];
    v42[5] = v23;

    id v25 = (void *)v42[5];
    if (!v25)
    {
      long long v29 = 0;
      goto LABEL_17;
    }
    objc_setAssociatedObject(v25, &kAssociatedCacheObjectKey, v17, (void *)1);
    id v26 = +[SGDSuggestManager requestCache];
    long long v27 = [v26 result];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke_552;
    v35[3] = &unk_1E65BB4E8;
    uint64_t v36 = v17;
    uint64_t v37 = &v41;
    [v27 runWithLockAcquired:v35];

    id v19 = v36;
  }

  uint64_t v28 = [(id)v42[5] suggestionsCount];
  long long v29 = v9[2](v9, v42[5]);
  if ([v29 suggestionsCount] != v28)
  {
    id v30 = sgLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      int v33 = [v29 suggestionsCount];
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)long long v48 = v28;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v33;
      _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, "Went from %d to %d suggestions after filtering out already acted-on suggestions", buf, 0xEu);
    }
  }
LABEL_17:

  _Block_object_dispose(&v41, 8);
  return v29;
}

uint64_t __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

void __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke_552(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 0xA) {
    [v3 removeAllObjects];
  }
  [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  +[SGPatterns useAllLanguagesAtOnce:](SGPatterns, "useAllLanguagesAtOnce:", [v11 isEqualToString:@"suggest_tool"]);
  id v14 = +[SGSimpleMailMessage parseRfc822:v12];
  id v13 = [v14 htmlBody];
  [(SGDSuggestManager *)self suggestionsFromEmailContent:v13 headers:v12 source:v11 options:a5 withCompletion:v10];
}

- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "SuggestionsManager getting all Deliveries", v11, 2u);
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v9 = [(SGSqlEntityStore *)self->_harvestStore allDeliveriesWithLimit:a3];
  id v10 = [v8 responseWith:v9];
  v6[2](v6, v10);
}

- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = sgRemindersLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager logging user created reminder title", v9, 2u);
  }

  +[SGDPLogging logUserCreatedReminderTitle:v6];
  uint64_t v8 = objc_opt_new();
  v5[2](v5, v8);
}

- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = sgRemindersLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v12 = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager getting reminder title for content", v12, 2u);
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v9 = +[SGReminderDissector sharedInstance];
  id v10 = [v9 reminderTitleForContent:v6];

  id v11 = [v8 responseWith:v10];
  v5[2](v5, v11);
}

- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = sgRemindersLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v11 = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager getting all Reminders", v11, 2u);
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v9 = [(SGSqlEntityStore *)self->_harvestStore allRemindersLimitedTo:a3];
  id v10 = [v8 responseWith:v9];
  v6[2](v6, v10);
}

- (void)reminderAlarmTriggeredForRecordId:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = sgRemindersLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-alarmTriggeredForRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  id v13 = 0;
  [(SGSqlEntityStore *)harvestStore reminderAlarmTriggeredForRecordId:v6 error:&v13];
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F5DB88] responseWithError:v10];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  id v12 = (void *)v11;
  v7[2](v7, v11);
}

- (unsigned)interfaceForRealtimeReminder:(id)a3
{
  id v3 = [a3 origin];
  uint64_t v4 = [v3 type];

  if (v4 == 1) {
    return 1;
  }
  else {
    return 4;
  }
}

- (void)_rejectReminderByRecordId:(id)a3 completion:(id)a4
{
  harvestStore = self->_harvestStore;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t))a4;
  [(SGSqlEntityStore *)harvestStore rejectReminderByRecordId:a3 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F5DB88] responseWithError:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  uint64_t v9 = (void *)v8;
  v6[2](v6, v8);
}

- (void)rejectRealtimeReminder:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  uint64_t v9 = sgRemindersLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectRealtimeReminer", buf, 2u);
  }

  id v10 = [v7 uniqueKey];
  if (+[SGDuplicateKey serializationPassesBasicScrutiny:v10])
  {
    harvestStore = self->_harvestStore;
    id v12 = [SGDuplicateKey alloc];
    id v13 = [v7 uniqueKey];
    id v14 = [(SGDuplicateKey *)v12 initWithSerialized:v13];
    id v15 = [(SGSqlEntityStore *)harvestStore loadReminderByKey:v14];

    if (v15)
    {
      uint64_t v16 = [v15 recordId];
      [(SGDSuggestManager *)self _rejectReminderByRecordId:v16 completion:v8];

      id v17 = [v15 recordId];

      if (!v17)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1302, @"Invalid parameter not satisfying: %@", @"storageReminder.recordId" object file lineNumber description];
      }
      uint64_t v18 = [v15 recordId];
      [(SGDSuggestManager *)self logSuggestionInteractionForRecordId:v18 interface:[(SGDSuggestManager *)self interfaceForRealtimeReminder:v7] actionType:7];
    }
    else
    {
      id v21 = sgRemindersLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - Rejection: Unable to retrieve reminder from the harvest store. Computing and storing hashes only.", v24, 2u);
      }

      uint64_t v22 = +[SGSuggestHistory sharedSuggestHistory];
      [v22 rejectReminder:v7];

      uint64_t v18 = objc_opt_new();
      v8[2](v8, v18);
    }

    char v20 = +[SGRTCLogging defaultLogger];
    objc_msgSend(v20, "logReminderInteractionFromReminder:interface:actionType:", v7, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 7);
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F5DB88];
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:0];
    char v20 = [v19 responseWithError:v15];
    v8[2](v8, v20);
  }
}

- (void)rejectReminderByRecordId:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sgRemindersLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectReminderByRecordId: %@", buf, 0xCu);
  }

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1282, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  [(SGDSuggestManager *)self logSuggestionInteractionForRecordId:v7 interface:21 actionType:7];
  [(SGDSuggestManager *)self _rejectReminderByRecordId:v7 completion:v8];
}

- (void)_confirmReminderByRecordId:(id)a3 completion:(id)a4
{
  harvestStore = self->_harvestStore;
  id v10 = 0;
  id v6 = (void (**)(id, uint64_t))a4;
  [(SGSqlEntityStore *)harvestStore confirmReminderByRecordId:a3 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F5DB88] responseWithError:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  uint64_t v9 = (void *)v8;
  v6[2](v6, v8);
}

- (void)confirmRealtimeReminder:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *))a4;
  uint64_t v9 = sgRemindersLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmRealtimeReminder", buf, 2u);
  }

  id v10 = [v7 uniqueKey];
  if (v10
    && +[SGDuplicateKey serializationPassesBasicScrutiny:v10])
  {
    harvestStore = self->_harvestStore;
    id v12 = [[SGDuplicateKey alloc] initWithSerialized:v10];
    uint64_t v13 = [(SGSqlEntityStore *)harvestStore loadReminderByKey:v12];

    if (v13)
    {
      id v14 = [v13 recordId];
      [(SGDSuggestManager *)self _confirmReminderByRecordId:v14 completion:v8];

      id v15 = [v13 recordId];

      if (!v15)
      {
        id v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1255, @"Invalid parameter not satisfying: %@", @"storageReminder.recordId" object file lineNumber description];
      }
      uint64_t v16 = [v13 recordId];
      [(SGDSuggestManager *)self logSuggestionInteractionForRecordId:v16 interface:[(SGDSuggestManager *)self interfaceForRealtimeReminder:v7] actionType:6];
    }
    else
    {
      id v19 = sgRemindersLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - Confirmation: Unable to retrieve reminder from the harvest store. Computing and storing hashes only.", v22, 2u);
      }

      char v20 = +[SGSuggestHistory sharedSuggestHistory];
      [v20 confirmReminder:v7];

      uint64_t v16 = objc_opt_new();
      v8[2](v8, v16);
    }

    uint64_t v18 = +[SGRTCLogging defaultLogger];
    objc_msgSend(v18, "logReminderInteractionFromReminder:interface:actionType:", v7, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 6);
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F5DB88];
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:0];
    uint64_t v18 = [v17 responseWithError:v13];
    v8[2](v8, v18);
  }
}

- (void)confirmReminderByRecordId:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sgRemindersLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmReminderByRecordId: %@", buf, 0xCu);
  }

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1237, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  [(SGDSuggestManager *)self logSuggestionInteractionForRecordId:v7 interface:21 actionType:6];
  [(SGDSuggestManager *)self _confirmReminderByRecordId:v7 completion:v8];
}

- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v9 = [v6 dateWithTimeIntervalSince1970:0.0];
  id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [(SGDSuggestManager *)self eventsStartingAt:v9 endingAt:v8 limitTo:a3 options:2 withCompletion:v7];
}

- (void)eventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *))a5;
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 134217984;
    unint64_t v17 = a3;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsInFutureLimitTo:%lu", (uint8_t *)&v16, 0xCu);
  }

  harvestStore = self->_harvestStore;
  uint64_t v11 = objc_opt_new();
  [v11 timeIntervalSince1970];
  id v12 = -[SGSqlEntityStore suggestEventsStartingAt:endingAt:limitTo:options:](harvestStore, "suggestEventsStartingAt:endingAt:limitTo:options:", a3, v5);

  uint64_t v13 = (void *)MEMORY[0x1E4F5DB90];
  id v14 = [(SGDSuggestManager *)self _mapToPseudoEvents:v12];
  id v15 = [v13 responseWith:v14];
  v8[2](v8, v15);
}

- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  unint64_t v17 = (void (**)(id, void *))a8;
  uint64_t v18 = sgLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v27 = 138413058;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2048;
    unint64_t v34 = a6;
    _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsStartingAt:%@ endingAt:%@ prefix:%@ limitTo:%lu", (uint8_t *)&v27, 0x2Au);
  }

  harvestStore = self->_harvestStore;
  [v14 timeIntervalSince1970];
  double v21 = v20;
  [v15 timeIntervalSince1970];
  uint64_t v23 = [(SGSqlEntityStore *)harvestStore suggestEventsStartingAt:v16 endingAt:a6 prefix:v9 limitTo:v21 options:v22];
  uint64_t v24 = (void *)MEMORY[0x1E4F5DB90];
  id v25 = [(SGDSuggestManager *)self _mapToPseudoEvents:v23];
  id v26 = [v24 responseWith:v25];
  v17[2](v17, v26);
}

- (void)eventFromRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "eventFromRecordId: %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v9 = [(SGSqlEntityStore *)self->_harvestStore loadEventByRecordId:v6];
  id v10 = v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F5DB90];
  if (v9)
  {
    id v12 = [v9 convertToEvent:self->_harvestStore];
    [v11 responseWith:v12];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:&unk_1F2537520];
    [v11 responseWithError:v12];
  uint64_t v13 = };
  v7[2](v7, v13);
}

- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  int v14 = (void (**)(id, void *))a7;
  id v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412802;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2048;
    unint64_t v29 = a5;
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsStartingAt:%@ endingAt:%@ limitTo:%lu", (uint8_t *)&v24, 0x20u);
  }

  harvestStore = self->_harvestStore;
  [v12 timeIntervalSince1970];
  double v18 = v17;
  [v13 timeIntervalSince1970];
  double v20 = [(SGSqlEntityStore *)harvestStore suggestEventsStartingAt:a5 endingAt:v8 limitTo:v18 options:v19];
  double v21 = (void *)MEMORY[0x1E4F5DB90];
  double v22 = [(SGDSuggestManager *)self _mapToPseudoEvents:v20];
  uint64_t v23 = [v21 responseWith:v22];
  v14[2](v14, v23);
}

- (id)_mapToPseudoEvents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "convertToEvent:", self->_harvestStore, (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(id, void *))a5;
  if (!v9)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1162, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = @"NO";
    if (v6) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    double v21 = v11;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-allContactsWithSnippets:%@ limitTo:%lu", buf, 0x16u);
  }

  id v12 = [(SGSqlEntityStore *)self->_harvestStore allContactsWithSnippets:v6 limitTo:a4];
  size_t v13 = [v12 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SGDSuggestManager_allContactsWithSnippets_limitTo_withCompletion___block_invoke;
  block[3] = &unk_1E65B5D60;
  id v18 = v12;
  double v19 = self;
  id v14 = v12;
  dispatch_apply(v13, 0, block);
  long long v15 = [MEMORY[0x1E4F5DB90] responseWith:v14];
  v9[2](v9, v15);
}

void __68__SGDSuggestManager_allContactsWithSnippets_limitTo_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  if (![v4 significance])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 8) contactIsSignificantOrSignificanceIsDisabled:v4])uint64_t v3 = 1; {
    else
    }
      uint64_t v3 = 2;
    [v4 setSignificance:v3];
  }
}

- (void)contactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1154, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  double v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1155, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesWithMessagingPrefix:%@ limitTo:%lu", buf, 0x16u);
  }

  size_t v13 = (void *)MEMORY[0x1E4F5DB90];
  id v14 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesWithMessagingPrefix:v9 limitTo:a4];
  long long v15 = [v13 responseWith:v14];
  ((void (**)(void, void *))v11)[2](v11, v15);
}

- (void)contactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1146, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  double v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1147, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesWithFullTextSearch:%@ limitTo:%lu", buf, 0x16u);
  }

  size_t v13 = (void *)MEMORY[0x1E4F5DB90];
  id v14 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesWithFullTextSearch:v9 limitTo:a4];
  long long v15 = [v13 responseWith:v14];
  ((void (**)(void, void *))v11)[2](v11, v15);
}

- (id)storageContactFromRecordId:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "storageContactFromRecordId: %@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(SGSqlEntityStore *)self->_harvestStore storageContactByRecordId:v4 withSnippets:1];

  return v6;
}

- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  int v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "cnContactMatchesForRecordIds (%lu ids)", (uint8_t *)&buf, 0xCu);
  }

  v13[2] = 0;
  v13[0] = @"cnContactMatchesForRecordIds";
  v13[1] = mach_absolute_time();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__4015;
  double v17 = __Block_byref_object_dispose__4016;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SGDSuggestManager_cnContactMatchesForRecordIds_withCompletion___block_invoke;
  v12[3] = &unk_1E65B5D38;
  void v12[4] = self;
  v12[5] = &buf;
  id v9 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  uint64_t v10 = v9;
  if (!*(void *)(*((void *)&buf + 1) + 40)) {
    goto LABEL_7;
  }

  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
    uint64_t v11 = [MEMORY[0x1E4F5DB90] responseWith:v10];
    v7[2](v7, v11);
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F5DB90], "responseWithError:");
  v7[2](v7, v11);
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:

  _Block_object_dispose(&buf, 8);
  SGRecordMeasurementState(v13);
}

id __65__SGDSuggestManager_cnContactMatchesForRecordIds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v30 = 0;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) cnContactMatchesForRecordId:v3 found:&v30];
  uint64_t v5 = v4;
  if (v30)
  {
    id v6 = v4;
    goto LABEL_23;
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) suggestContactByRecordId:v3 withSnippets:0 filterConfirmRejectDetails:0];
  if (v7)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
    id v29 = 0;
    id v9 = +[SGCuratedContactMatcher curatedContactsFromContactStore:v8 matchingPseudoContact:v7 error:&v29];
    id v10 = v29;
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      if (!*(void *)(v12 + 40))
      {
        id v13 = v10;
        id v14 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v13;
LABEL_20:
      }
    }
    else if (v9)
    {
      uint64_t v15 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v24 = v9;
      id v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            unint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (v21)
            {
              uint64_t v22 = [v21 identifier];
              [v15 addObject:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v18);
      }

      if (![v16 count]) {
        [*(id *)(*(void *)(a1 + 32) + 8) writeCNContactMissForRecordId:v3];
      }
      id v14 = v5;
      uint64_t v5 = v15;
      uint64_t v11 = 0;
      id v9 = v24;
      goto LABEL_20;
    }
  }
  id v6 = v5;

LABEL_23:
  return v6;
}

- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v15[0] = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = [v8 arrayWithObjects:v15 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SGDSuggestManager_cnContactMatchesForRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E65B5D10;
  id v13 = v7;
  SEL v14 = a2;
  void v12[4] = self;
  id v11 = v7;
  [(SGDSuggestManager *)self cnContactMatchesForRecordIds:v10 withCompletion:v12];
}

void __64__SGDSuggestManager_cnContactMatchesForRecordId_withCompletion___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 response1];
  if ([v3 count] != 1)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6] object:a1[4] file:@"SGDSuggestManager.m" lineNumber:1077 description:@"Unexpected number of matches"];
  }
  id v4 = [v10 error];

  uint64_t v5 = a1[5];
  id v6 = (void *)MEMORY[0x1E4F5DB90];
  if (v4)
  {
    id v7 = [v10 error];
    [v6 responseWithError:v7];
  }
  else
  {
    id v7 = [v3 objectAtIndexedSubscript:0];
    [v6 responseWith:v7];
  uint64_t v8 = };
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
}

- (void)contactFromRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "contactFromRecordId: %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = [(SGSqlEntityStore *)self->_harvestStore suggestContactByRecordId:v6];
  id v10 = [MEMORY[0x1E4F5DB90] responseWith:v9];
  v7[2](v7, v10);
}

- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1054, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1055, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-emailAddressIsSignificant:%@", buf, 0xCu);
  }

  int v11 = [MEMORY[0x1E4F5DB20] recordIdForContactWithRowId:0];
  id v12 = (void *)MEMORY[0x1E4F5D9E0];
  uint64_t v13 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
  SEL v14 = [v12 emailAddress:v7 label:@"none" extractionInfo:v13 withRecordId:v11];

  uint64_t v15 = (void *)MEMORY[0x1E4F5D9B0];
  unint64_t v23 = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v17 = [v15 contactWithId:v11 name:0 emailAddresses:v16 phones:MEMORY[0x1E4F1CBF0] postalAddresses:MEMORY[0x1E4F1CBF0] socialProfiles:MEMORY[0x1E4F1CBF0]];

  uint64_t v18 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[SGSqlEntityStore contactIsSignificantOrSignificanceIsDisabled:](self->_harvestStore, "contactIsSignificantOrSignificanceIsDisabled:", v17));
  __int16 v20 = [v18 responseWith:v19];
  ((void (**)(void, void *))v9)[2](v9, v20);
}

- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    char v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1017, @"Invalid parameter not satisfying: %@", @"contactIdentifiers" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  __int16 v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 1018, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v32 = v10;
  int v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v50 = [v8 count];
    _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "contactsFromContactIdentifiers (%lu ids)", buf, 0xCu);
  }

  id v12 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v41 = *(void *)v44;
    uint64_t v40 = *MEMORY[0x1E4F1ADF0];
    uint64_t v39 = *MEMORY[0x1E4F1AEA0];
    uint64_t v38 = *MEMORY[0x1E4F1ADE0];
    uint64_t v37 = *MEMORY[0x1E4F1ADC8];
    uint64_t v36 = *MEMORY[0x1E4F1AEE0];
    uint64_t v35 = *MEMORY[0x1E4F1AF10];
    uint64_t v16 = *MEMORY[0x1E4F1AF78];
    uint64_t v17 = *MEMORY[0x1E4F1AD90];
    id obj = v13;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v12;
        __int16 v20 = self;
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * v18);
        uint64_t v42 = 0;
        uint64_t v22 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
        v47[0] = v22;
        v47[1] = v40;
        v47[2] = v39;
        v47[3] = v38;
        v47[4] = v37;
        v47[5] = v36;
        v47[6] = v35;
        v47[7] = v16;
        v47[8] = v17;
        unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:9];
        uint64_t v24 = +[SGContactsInterface unifiedContactWithIdentifier:v21 keysToFetch:v23 usingContactStore:v20->_contactStore error:&v42];

        if (!v24)
        {
          id v12 = v19;
          if (v42)
          {
            long long v28 = sgLogHandle();
            long long v27 = (void (**)(void, void))v32;
            id v13 = obj;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v50 = v42;
              _os_log_error_impl(&dword_1CA650000, v28, OS_LOG_TYPE_ERROR, "Error from CNContactStore contactWithIdentifier: %@", buf, 0xCu);
            }

            id v29 = [MEMORY[0x1E4F5DB90] responseWithError:v42];
          }
          else
          {
            id v29 = [MEMORY[0x1E4F5DB90] responseWith:MEMORY[0x1E4F1CBF0]];
            long long v27 = (void (**)(void, void))v32;
            id v13 = obj;
          }
          ((void (**)(void, void *))v27)[2](v27, v29);

          uint64_t v26 = v13;
          goto LABEL_20;
        }
        id v25 = [(SGSqlEntityStore *)v20->_harvestStore suggestContactMatchesWithContact:v24 limitTo:a4];
        id v12 = v19;
        [v19 addObject:v25];

        ++v18;
        self = v20;
      }
      while (v15 != v18);
      id v13 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v26 = [MEMORY[0x1E4F5DB90] responseWith:v12];
  long long v27 = (void (**)(void, void))v32;
  (*((void (**)(id, void *))v32 + 2))(v32, v26);
LABEL_20:
}

- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = (void (**)(void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 985, @"Invalid parameter not satisfying: %@", @"contactIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  unint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 986, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v9;
    _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "contactsFromContactIdentifier: %@", buf, 0xCu);
  }

  uint64_t v24 = 0;
  id v13 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v14 = *MEMORY[0x1E4F1ADF0];
  v25[0] = v13;
  v25[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1ADE0];
  v25[2] = *MEMORY[0x1E4F1AEA0];
  v25[3] = v15;
  uint64_t v16 = *MEMORY[0x1E4F1AEE0];
  v25[4] = *MEMORY[0x1E4F1ADC8];
  v25[5] = v16;
  uint64_t v17 = *MEMORY[0x1E4F1AF78];
  v25[6] = *MEMORY[0x1E4F1AF10];
  v25[7] = v17;
  v25[8] = *MEMORY[0x1E4F1AD90];
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:9];
  uint64_t v19 = +[SGContactsInterface unifiedContactWithIdentifier:v9 keysToFetch:v18 usingContactStore:self->_contactStore error:&v24];

  if (v19)
  {
    [(SGDSuggestManager *)self contactMatchesWithContact:v19 limitTo:a4 withCompletion:v11];
  }
  else
  {
    if (v24) {
      objc_msgSend(MEMORY[0x1E4F5DB90], "responseWithError:");
    }
    else {
    __int16 v20 = [MEMORY[0x1E4F5DB90] responseWith:MEMORY[0x1E4F1CBF0]];
    }
    ((void (**)(void, void *))v11)[2](v11, v20);
  }
  if (v24)
  {
    uint64_t v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = v24;
      _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "Error from CNContactStore contactWithIdentifier: %@", buf, 0xCu);
    }
  }
}

- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = (void (**)(void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 977, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SGDSuggestManager.m", 978, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v9;
    _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "contactsFromContact: %@", buf, 0xCu);
  }

  id v13 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v14 = [(SGSqlEntityStore *)self->_harvestStore suggestContactMatchesWithContact:v9 limitTo:a4];
  uint64_t v15 = [v13 responseWith:v14];
  ((void (**)(void, void *))v11)[2](v11, v15);
}

- (void)isEnabledWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5DB90];
  id v5 = a3;
  id v6 = [v4 responseWith:MEMORY[0x1E4F1CC38]];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  id v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "clearCachesFully: %i", (uint8_t *)v8, 8u);
  }

  +[SGDSuggestManager clearRequestCache];
  if (v4)
  {
    +[SGPatterns clearAllRegexCaches];
    _PASSimpleICUClearCache();
    +[SGSqlEntityStore deletePreparedSqlStoreInMemory];
    SGDataNormalizationClearCaches();
    [MEMORY[0x1E4F5F220] resetSharedCachesAndModels];
  }
  if (v5)
  {
    id v7 = objc_opt_new();
    v5[2](v5, v7);
  }
}

- (void)prepareForRealtimeExtraction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = Current - *(double *)&prepareForRealtimeExtraction__lastWarmTime;
  id v7 = sgLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6 <= 300.0)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 134217984;
      double v15 = Current - *(double *)&prepareForRealtimeExtraction__lastWarmTime;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "Suggestions is already warmed up (as of %0.1f seconds ago)", buf, 0xCu);
    }

    id v10 = objc_opt_new();
    v4[2](v4, v10);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "Warming up suggestions...", buf, 2u);
    }

    +[SGDPowerLog logPrewarmWithLastPrewarmTime:*(double *)&prepareForRealtimeExtraction__lastWarmTime];
    prepareForRealtimeExtraction__lastWarmTime = *(void *)&Current;
    uint64_t v9 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SGDSuggestManager_prepareForRealtimeExtraction___block_invoke;
    block[3] = &unk_1E65B6010;
    void block[4] = self;
    double v13 = Current;
    id v12 = v4;
    dispatch_async(v9, block);
  }
}

void __50__SGDSuggestManager_prepareForRealtimeExtraction___block_invoke(uint64_t a1)
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v17[0] = @"htmlBody";
  v17[1] = @"body";
  v18[0] = @"My phone is 515-555-5555. My address is 1234 Hey Street.";
  v18[1] = @"My phone is 515-555-5555. My address is 1234 Hey Street.";
  v17[2] = @"from";
  v17[3] = @"to";
  v18[2] = @"Warm Up <warm@up.com>";
  v18[3] = &unk_1F25366E0;
  void v18[4] = @"Warm up! Awaken!";
  v17[4] = @"subject";
  v17[5] = @"date";
  id v2 = [NSNumber numberWithDouble:*(double *)&prepareForRealtimeExtraction__lastWarmTime];
  v18[5] = v2;
  v18[6] = @"<hey@example.com>";
  v17[6] = @"messageId";
  v17[7] = @"sourceId";
  v18[7] = @"warmUpSuggestions";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:8];
  BOOL v4 = +[SGMessage fromDictionary:v3];

  id v5 = [[SGPipelineEntity alloc] initWithEmailMessage:v4];
  double v6 = +[SGPipeline fullPipeline];
  [v6 dissect:v5];

  id v7 = +[SGCuratedContactMatcher fetchMeContactFromContactStore:*(void *)(*(void *)(a1 + 32) + 64)];
  +[SGSqlEntityStore prepareSqlStoreInMemory];
  BOOL v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v9 = (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48)) * 1000.0;
    id v10 = [(SGPipelineEntity *)v5 enrichments];
    int v13 = 134218240;
    CFAbsoluteTime v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v10 count];
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "Warmed up suggestions in %0.2f ms and found %i enrichments", (uint8_t *)&v13, 0x12u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

- (BOOL)clientIsMessages
{
  id v2 = [(NSXPCConnection *)self->_connection exportedInterface];
  id v3 = [v2 protocol];
  BOOL isEqual = protocol_isEqual(v3, (Protocol *)&unk_1F2543878);

  return isEqual;
}

- (BOOL)clientIsMail
{
  id v2 = [(NSXPCConnection *)self->_connection exportedInterface];
  id v3 = [v2 protocol];
  BOOL isEqual = protocol_isEqual(v3, (Protocol *)&unk_1F25418D0);

  return isEqual;
}

- (id)_pmlTraining
{
  id v2 = (void *)MEMORY[0x1E4F93860];
  id v3 = +[SGPaths suggestionsDirectory];
  BOOL v4 = [v2 sharedSingletonWithDirectory:v3];

  return v4;
}

- (void)dealloc
{
  [(SGCoalescingDropBox *)self->_purgeDeletionDropBox wait];
  int settingsChangeToken = self->_settingsChangeToken;
  if (settingsChangeToken) {
    notify_cancel(settingsChangeToken);
  }
  BOOL v4 = +[SGAsset asset];
  [v4 deregisterUpdateHandlerAsyncWithToken:self->_assetUpdateToken];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  double v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGDSuggestionsManager going away now, bye!", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SGDSuggestManager;
  [(SGDSuggestManager *)&v7 dealloc];
}

- (SGDSuggestManager)initWithStore:(id)a3
{
  id v4 = a3;
  id v5 = +[SGDManagerForCTS sharedSingletonInstance];
  double v6 = +[SGEKEventStoreProvider defaultEKStoreProvider];
  objc_super v7 = +[SGContactStoreFactory contactStore];
  BOOL v8 = [(SGDSuggestManager *)self initWithStore:v4 ctsManager:v5 ekStoreProvider:v6 contactStore:v7 pet2Tracker:0];

  return v8;
}

- (SGDSuggestManager)initWithStore:(id)a3 ctsManager:(id)a4 ekStoreProvider:(id)a5 contactStore:(id)a6 pet2Tracker:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SGDSuggestManager;
  uint64_t v17 = [(SGDSuggestManager *)&v20 init];
  uint64_t v18 = v17;
  if (v17) {
    [(SGDSuggestManager *)v17 setupManagerWithConnection:0 store:v12 ctsManager:v13 ekStoreProvider:v14 contactStore:v15 pet2Tracker:v16];
  }

  return v18;
}

- (SGDSuggestManager)initWithMessagesConnection:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDSuggestManager;
  BOOL v8 = [(SGDSuggestManager *)&v16 init];
  if (!v8) {
    goto LABEL_3;
  }
  CFAbsoluteTime v9 = +[SGDManagerForCTS sharedSingletonInstance];
  id v10 = +[SGEKEventStoreProvider defaultEKStoreProvider];
  uint64_t v11 = +[SGContactStoreFactory contactStore];
  [(SGDSuggestManager *)v8 setupManagerWithConnection:v6 store:v7 ctsManager:v9 ekStoreProvider:v10 contactStore:v11 pet2Tracker:0];

  if (!v8->_harvestStore)
  {
    id v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGDSuggestManager has no entity store and cannot continue", v15, 2u);
    }

    id v12 = 0;
  }
  else
  {
LABEL_3:
    id v12 = v8;
  }

  return v12;
}

- (void)contentAdmissionBlocklistDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v17 = [v4 count];
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: contentAdmissionBlocklistDidChange: called with %tu bundles", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SGDSuggestManager deleteSpotlightReferencesWithBundleIdentifier:completion:](self, "deleteSpotlightReferencesWithBundleIdentifier:completion:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), &__block_literal_global_299, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)messageHarvestQueue
{
  return self->_messageHarvestQueue;
}

- (void)setLastSuggestionsFromMessageResponse:(id)a3
{
}

- (id)lastSuggestionsFromMessageResponse
{
  return self->_lastSuggestionsFromMessageResponse;
}

- (void)setLastSuggestionsFromMessageRequest:(id)a3
{
}

- (id)lastSuggestionsFromMessageRequest
{
  return self->_lastSuggestionsFromMessageRequest;
}

- (id)lastSuggestionsFromMessageLock
{
  return self->_lastSuggestionsFromMessageLock;
}

- (id)recentlyHarvestedDetailLock
{
  return self->_recentlyHarvestedDetailLock;
}

- (BOOL)persistRealtimeExtractions
{
  return self->_persistRealtimeExtractions;
}

- (id)harvestStore
{
  return self->_harvestStore;
}

void __43__SGDSuggestManager__setupHistoryObserver___block_invoke(uint64_t a1)
{
  id v2 = [[SGHistoryObserver alloc] initWithStore:*(void *)(a1 + 32)];
  uint64_t v1 = +[SGSuggestHistory sharedSuggestHistory];
  [v1 addSuggestHistoryObserver:v2];
}

- (void)_executeBoxTasks:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 deleteUniqueIds];
  id v6 = objc_opt_new();
  uint64_t v35 = v4;
  [v4 setDeleteUniqueIds:v6];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v36 = v5;
  uint64_t v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        long long v13 = [v5 objectForKeyedSubscript:v12];
        long long v14 = [v13 allObjects];
        [(SGDSuggestManager *)self deleteSpotlightReferencesWithBundleIdentifier:v12 uniqueIdentifiers:v14 completion:&__block_literal_global_292];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v9);
  }

  id v15 = [v35 deleteDomainIds];
  objc_super v16 = objc_opt_new();
  [v35 setDeleteDomainIds:v16];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v17 = [v15 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        unint64_t v23 = [v15 objectForKeyedSubscript:v22];
        [(SGDSuggestManager *)self deleteSpotlightReferencesWithBundleIdentifier:v22 domainIdentifiers:v23 completion:&__block_literal_global_294];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v19);
  }
  unint64_t v34 = v15;

  uint64_t v24 = [v35 purgeUniqueIds];
  id v25 = objc_opt_new();
  [v35 setPurgeUniqueIds:v25];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v26 = [v24 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * k);
        id v32 = [v24 objectForKeyedSubscript:v31];
        __int16 v33 = [v32 allObjects];
        [(SGDSuggestManager *)self purgeSpotlightReferencesWithBundleIdentifier:v31 uniqueIdentifiers:v33 completion:&__block_literal_global_296];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v28);
  }
}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke(uint64_t a1)
{
  notify_post((const char *)[(id)*MEMORY[0x1E4F5DF58] UTF8String]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCachesFully:1 withCompletion:&__block_literal_global_246];
}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_282(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (id)[WeakRetained _pmlTraining];
    id WeakRetained = v3;
  }
}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _executeBoxTasks:v3];
}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v2 error];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGDSuggestManager failed to clear caches following an asset update: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)getPet2Tracker
{
  return self->_pet2Tracker;
}

+ (id)preprocessSearchableItem:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F93790] mailItemIsValid:v3])
  {
    id v4 = (void *)MEMORY[0x1E4F93760];
    id v5 = [v3 bundleID];
    LOBYTE(v4) = [v4 shouldAdmitContentFromBundleIdentifier:v5];

    if (v4)
    {
      int v6 = [v3 protection];

      if (!v6)
      {
        uint64_t v7 = [v3 bundleID];
        HVDataSourceForBundleIdentifier();

        uint64_t v8 = HVDataSourceFileProtection();
        [v3 setProtection:v8];
      }
      uint64_t v9 = 0;
    }
    else
    {
      long long v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "suggestionsFromSearchableItem ignoring item since the bundle is disallowed by user's settings", v15, 2u);
      }

      uint64_t v9 = [MEMORY[0x1E4F5DB90] responseWith:0];
    }
  }
  else
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Mail: suggestionsFromSearchableItem was called with an invalid item", buf, 2u);
    }

    long long v11 = (void *)MEMORY[0x1E4F5DB90];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:6 userInfo:0];
    uint64_t v9 = [v11 responseWithError:v12];
  }
  return v9;
}

+ (BOOL)titleSuggestionForMessageFeatureEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)filterPseudoEvents:(id)a3 keepPastEvents:(BOOL)a4 keepPartialEvents:(BOOL)a5 keepEventsFromOldDocuments:(BOOL)a6
{
  int v6 = sgMapAndFilter();
  return v6;
}

id __100__SGDSuggestManager_filterPseudoEvents_keepPastEvents_keepPartialEvents_keepEventsFromOldDocuments___block_invoke(unsigned char *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 duplicateKey];
  uint64_t v5 = [v4 entityType];

  if (v5 != 2) {
    goto LABEL_15;
  }
  if (a1[32]
    || ([v3 timeRange],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEndDatePast],
        v6,
        !v7))
  {
    if (a1[33] || ([v3 isEventComplete] & 1) != 0)
    {
      if (a1[34]
        || ([v3 tags],
            long long v11 = objc_claimAutoreleasedReturnValue(),
            [MEMORY[0x1E4F5D9F0] eventExtractedFromOldDocument],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v11 containsObject:v12],
            v12,
            v11,
            !v13))
      {
        id v14 = v3;
        goto LABEL_16;
      }
      uint64_t v8 = sgLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      __int16 v16 = 0;
      uint64_t v9 = "Skipping future event extracted from older mail.";
      uint64_t v10 = (uint8_t *)&v16;
      goto LABEL_20;
    }
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v9 = "Skipping partial event that doesn't contain all information.";
      uint64_t v10 = buf;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      uint64_t v9 = "Skipping extracted event that has already passed.";
      uint64_t v10 = (uint8_t *)&v18;
LABEL_20:
      _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, v9, v10, 2u);
    }
  }
LABEL_14:

LABEL_15:
  id v14 = 0;
LABEL_16:

  return v14;
}

+ (id)filterPseudoEvents:(id)a3 keepPastEvents:(BOOL)a4 keepPartialEvents:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v7 = (void *)MEMORY[0x1E4F5DAF0];
  id v8 = a3;
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "filterPseudoEvents:keepPastEvents:keepPartialEvents:keepEventsFromOldDocuments:", v8, v6, v5, objc_msgSend(v7, "showPastEvents"));

  return v9;
}

+ (void)clearRequestCache
{
  id v3 = [a1 requestCache];
  id v2 = [v3 resultIfAvailable];
  [v2 runWithLockAcquired:&__block_literal_global_238];
}

uint64_t __38__SGDSuggestManager_clearRequestCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

+ (id)contactAggregator
{
  if (contactAggregator__pasOnceToken6 != -1) {
    dispatch_once(&contactAggregator__pasOnceToken6, &__block_literal_global_235);
  }
  id v2 = (void *)contactAggregator__pasExprOnceResult;
  return v2;
}

void __38__SGDSuggestManager_contactAggregator__block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)contactAggregator__pasExprOnceResult;
  contactAggregator__pasExprOnceResult = v1;
}

+ (id)requestCache
{
  if (requestCache__pasOnceToken5 != -1) {
    dispatch_once(&requestCache__pasOnceToken5, &__block_literal_global_222);
  }
  id v2 = (void *)requestCache__pasExprOnceResult;
  return v2;
}

void __33__SGDSuggestManager_requestCache__block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_226 idleTimeout:5.0];
  id v2 = (void *)requestCache__pasExprOnceResult;
  requestCache__pasExprOnceResult = v1;
}

id __33__SGDSuggestManager_requestCache__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)[v0 initWithGuardedData:v1];

  id location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SGDSuggestManager_requestCache__block_invoke_3;
  v6[3] = &unk_1E65C0018;
  objc_copyWeak(&v7, &location);
  +[SGCuratedChangeNotifications addAddressBookObserver:v6 forObjectLifetime:v2];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SGDSuggestManager_requestCache__block_invoke_5;
  v4[3] = &unk_1E65C0018;
  objc_copyWeak(&v5, &location);
  +[SGCuratedChangeNotifications addCalendarObserver:v4 forObjectLifetime:v2];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v2;
}

void __33__SGDSuggestManager_requestCache__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runWithLockAcquired:&__block_literal_global_231];
}

void __33__SGDSuggestManager_requestCache__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained runWithLockAcquired:&__block_literal_global_233];
}

uint64_t __33__SGDSuggestManager_requestCache__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

uint64_t __33__SGDSuggestManager_requestCache__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

+ (void)updateOriginalDocumentsWith:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    if ([v5 count])
    {
      id v7 = [v5 firstObject];
      id v8 = [v7 bundleID];

      uint64_t v9 = [v5 firstObject];
      uint64_t v10 = [v9 protection];

      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F23838]) initWithName:@"SuggestedEventsUpdate" protectionClass:v10 bundleIdentifier:v8];
      uint64_t v12 = v11;
      if (v11)
      {
        [v11 indexSearchableItems:v5 completionHandler:v6];
      }
      else
      {
        int v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28568];
        v17[0] = @"index is not initialized";
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        id v15 = [v13 errorWithDomain:@"SGDOriginalDocDonationErrorDomain" code:-1000 userInfo:v14];
        v6[2](v6, v15);
      }
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

+ (id)getProcessedItemFromEvents:(id)a3 uniqueID:(id)a4 bundleID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[SGDSuggestManager extractAttributeSetsFromRealtimeEvents:a3];
  uint64_t v10 = +[SGDSuggestManager getAggregatedAttributeSet:v9];
  if (v10)
  {
    long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v7 domainIdentifier:0 attributeSet:v10];
    [v11 setBundleID:v8];
    [v11 setIsUpdate:1];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

+ (id)getAggregatedAttributeSet:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 attributeDictionary];
    uint64_t v6 = +[SGDSuggestManager filterAttributesForDonation:v5];

    uint64_t v19 = (void *)v6;
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
    id v8 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) attributeDictionary];
          id v15 = [v14 objectForKey:@"kMDItemEventType"];

          if (v15) {
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v8 allObjects];
    [v7 setObject:v16 forKey:@"kMDItemDetectedEventTypes"];

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithAttributes:v7];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)extractAttributeSetsFromRealtimeEvents:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    uint64_t v21 = *MEMORY[0x1E4F5DC80];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = [v11 event];

          if (v12)
          {
            int v13 = [v11 event];
            id v14 = [v13 attributeSetForEvent];

            if (v14)
            {
              [v4 addObject:v14];
            }
            else
            {
              id v15 = sgLogHandle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v27 = v20;
                uint64_t v28 = @"nil attribute set for realtime event";
                long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
                uint64_t v17 = [v16 errorWithDomain:v21 code:12 userInfo:v22];
                *(_DWORD *)long long buf = 138412290;
                char v30 = v17;
                _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "extractAttributeSetsFromRealtimeEvents: %@", buf, 0xCu);
              }
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v18;
}

+ (id)filterAttributesForDonation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (filterAttributesForDonation__onceToken != -1) {
    dispatch_once(&filterAttributesForDonation__onceToken, &__block_literal_global_6);
  }
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)filterAttributesForDonation__suggestedEventsAllowListAttributes;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v3, "objectForKey:", v10, (void)v14);
        if (v11) {
          [v4 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

void __71__SGDSuggestManager_OriginalDocDonations__filterAttributesForDonation___block_invoke()
{
  id v2 = (id)objc_opt_new();
  uint64_t v0 = [v2 getAllUniqueEventAttributes];
  uint64_t v1 = (void *)filterAttributesForDonation__suggestedEventsAllowListAttributes;
  filterAttributesForDonation__suggestedEventsAllowListAttributes = v0;
}

+ (id)simpleWritebackHandler
{
  if (_os_feature_enabled_impl()) {
    return &__block_literal_global_6320;
  }
  else {
    return 0;
  }
}

void __65__SGDSuggestManager_OriginalDocDonations__simpleWritebackHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = sgLogHandle();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "**** SGDSuggestManager: original document writeback error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: original document writeback completed successfully", (uint8_t *)&v5, 2u);
  }
}

- (id)filterRealtimeReminders:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_127);
}

id __64__SGDSuggestManager_RealtimeDonations__filterRealtimeReminders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SGSuggestHistory sharedSuggestHistory];
  id v4 = [v2 reminder];
  char v5 = [v3 isValidNewReminder:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = sgRemindersLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v9 = "SGDSuggestManager: Filtering out previously engaged reminder";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    id v11 = 0;
    goto LABEL_13;
  }
  id v6 = [v2 reminder];
  BOOL v7 = +[SGRemindersAdapter reminderHasDuplicate:v6 usingStore:0];

  if (v7)
  {
    uint64_t v8 = sgRemindersLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = 0;
      uint64_t v9 = "SGDSuggestManager: Filtering out duplicate reminder";
      uint64_t v10 = (uint8_t *)&v21;
LABEL_7:
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v12 = [v2 reminder];
  int v13 = [v12 dueDateComponents];

  if (v13)
  {
    long long v14 = [v2 reminder];
    long long v15 = [v14 dueDateComponents];
    long long v16 = [MEMORY[0x1E4F1C9C8] date];
    long long v17 = [v2 reminder];
    BOOL v18 = +[SGReminderDissector isReminderDueDateComponentsInPast:givenReferenceDate:allDay:](SGReminderDissector, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v15, v16, [v17 isAllDay]);

    if (v18 && ([MEMORY[0x1E4F5DAF0] showPastEvents] & 1) == 0)
    {
      uint64_t v8 = sgRemindersLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      __int16 v20 = 0;
      uint64_t v9 = "SGDSuggestManager: Filtering past Reminder";
      uint64_t v10 = (uint8_t *)&v20;
      goto LABEL_7;
    }
  }
  id v11 = v2;
LABEL_13:

  return v11;
}

- (void)_storeAndGeocodeEntity:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 store:(id)a7 afterCallbackQueue:(id)a8 finalize:(id)a9
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v14 = a9;
  queue = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = objc_opt_new();
  if ([MEMORY[0x1E4F5DAF0] shouldHarvestEvents])
  {
    id v20 = v28;
    __int16 v21 = [v19 geocodeOperation:v28 withDependencies:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    __int16 v21 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_123];
    id v20 = v28;
  }
  v31[0] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  long long v23 = [v19 storeOperation:v20 spotlightBundleIdentifier:v18 spotlightUniqueIdentifier:v17 spotlightDomainIdentifier:v16 withStore:v15 dependencies:v22];

  long long v24 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v14];

  [v24 addDependency:v23];
  long long v25 = objc_opt_new();
  [v25 setMaxConcurrentOperationCount:1];
  [v25 setSuspended:1];
  [v25 addOperation:v21];
  [v25 addOperation:v23];
  [v25 addOperation:v24];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __175__SGDSuggestManager_RealtimeDonations___storeAndGeocodeEntity_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_store_afterCallbackQueue_finalize___block_invoke_2;
  block[3] = &unk_1E65BEF88;
  id v30 = v25;
  id v26 = v25;
  dispatch_async(queue, block);
}

uint64_t __175__SGDSuggestManager_RealtimeDonations___storeAndGeocodeEntity_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_store_afterCallbackQueue_finalize___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuspended:0];
}

- (BOOL)_canBannerUseStoredDissection:(id)a3 options:(unint64_t)a4
{
  if (a3) {
    return [a3 isPartiallyDownloaded] ^ 1;
  }
  else {
    return 0;
  }
}

- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 processingType:(unint64_t)a10 isTextMessage:(BOOL)a11
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  uint64_t v101 = (void (**)(id, void *))a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = sgLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v17 bundleID];
    id v20 = [v17 uniqueIdentifier];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: realtimeSuggestionsForMailOrMessageWithHash: %@ : %@", buf, 0x16u);
  }
  long long v115 = dispatch_queue_create("after banner callback", 0);
  dispatch_suspend(v115);
  if (!a4)
  {
    id v93 = [MEMORY[0x1E4F28B00] currentHandler];
    [v93 handleFailureInMethod:a2 object:self file:@"SGDSuggestManager+RealtimeDonations.m" lineNumber:438 description:@"Passing 0 for options would return nothing"];
  }
  if (realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__initMemoryStoreOneTimeToken != -1) {
    dispatch_once(&realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__initMemoryStoreOneTimeToken, &__block_literal_global_56);
  }
  uint64_t v173 = 0;
  *(void *)&long long v172 = @"suggestionsFromEmailContent";
  *((void *)&v172 + 1) = mach_absolute_time();
  long long v114 = objc_opt_new();
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v183 = 0;
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x2020000000;
  char v171 = 0;
  long long v22 = [(SGDSuggestManager *)self context];
  int8x16_t v23 = (int8x16_t)vdupq_n_s64(a4);
  int32x4_t v24 = vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)v23, (uint64x2_t)xmmword_1CA8CB4E0), (int32x4_t)vshlq_u64((uint64x2_t)v23, (uint64x2_t)xmmword_1CA8CB4D0));
  *(int8x8_t *)v24.i8 = vand_s8((int8x8_t)vmovn_s32(v24), (int8x8_t)0x1000100010001);
  int16x8_t v112 = (int16x8_t)v24;
  int8x16_t v110 = vandq_s8(v23, (int8x16_t)xmmword_1CA8CB4F0);
  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2;
  v155[3] = &unk_1E65B92D8;
  id v25 = v16;
  id v161 = v25;
  v155[4] = self;
  int8x16_t v164 = v110;
  unint64_t v165 = a10;
  BOOL v168 = a9;
  id v97 = v17;
  id v156 = v97;
  v162 = buf;
  dispatch_object_t object = v115;
  dispatch_object_t v157 = object;
  id v95 = v22;
  id v158 = v95;
  v163 = v170;
  unsigned __int32 v169 = vmovn_s16(v112).u32[0];
  dispatch_semaphore_t dsema = v21;
  dispatch_semaphore_t v159 = dsema;
  SEL v166 = a2;
  id v94 = v114;
  id v160 = v94;
  unint64_t v167 = a4 & 1;
  id v103 = (void (**)(void))MEMORY[0x1CB79B4C0](v155);
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_98;
  v148[3] = &unk_1E65B9370;
  long long v151 = v172;
  v148[4] = self;
  uint64_t v152 = v173;
  BOOL v153 = a11;
  BOOL v154 = (a4 & 0x40000000) == 0;
  long long v109 = (void (**)(void))v25;
  uint64_t v149 = v109;
  v150 = v170;
  long long v102 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v148);
  if (a11)
  {
    id v26 = v103[2]();
    uint64_t v27 = (void *)[v26 copy];

    if (v27)
    {
      id v104 = ((void (**)(void, void *))v102)[2](v102, v27);
    }
    else
    {
      id v104 = 0;
    }
    id v28 = self;
  }
  else
  {
    id v28 = self;
    id v104 = [(SGDSuggestManager *)self cachedResultForKey:v100 generateResult:v103 validateResults:v102];
  }
  uint64_t v29 = [(SGDSuggestManager *)v28 harvestStore];
  id v30 = [v29 kvCacheManager];
  long long v113 = [v30 cacheOfType:0];

  uint64_t v31 = [(SGDSuggestManager *)self harvestStore];
  uint64_t v32 = [v31 kvCacheManager];
  long long v111 = [v32 cacheOfType:1];

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id obj = [v104 contacts];
  uint64_t v107 = [obj countByEnumeratingWithState:&v144 objects:v181 count:16];
  if (v107)
  {
    uint64_t v106 = *(void *)v145;
    do
    {
      for (uint64_t i = 0; i != v107; ++i)
      {
        if (*(void *)v145 != v106) {
          objc_enumerationMutation(obj);
        }
        __int16 v33 = [*(id *)(*((void *)&v144 + 1) + 8 * i) contact];
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v116 = v33;
        unint64_t v34 = [v33 phones];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v140 objects:v180 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v141;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v141 != v36) {
                objc_enumerationMutation(v34);
              }
              long long v38 = *(void **)(*((void *)&v140 + 1) + 8 * j);
              long long v39 = [v38 phoneNumber];
              long long v40 = SGNormalizePhoneNumber();

              *(void *)v178 = 0;
              *(void *)&v178[8] = v178;
              *(void *)&v178[16] = 0x2020000000;
              char v179 = 0;
              long long v41 = [(SGDSuggestManager *)self recentlyHarvestedDetailLock];
              v137[0] = MEMORY[0x1E4F143A8];
              v137[1] = 3221225472;
              v137[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_112;
              v137[3] = &unk_1E65B9398;
              id v42 = v40;
              id v138 = v42;
              long long v139 = v178;
              [v41 runWithLockAcquired:v137];

              if (*(unsigned char *)(*(void *)&v178[8] + 24))
              {
                long long v43 = (void *)MEMORY[0x1E4F5DA40];
                long long v44 = [v116 name];
                long long v45 = [v44 fullName];
                long long v46 = [v43 encodedStringForFullName:v45];

                [v113 setValueIfNotPresent:v46 forKey:v42 fromRecordId:0];
                long long v47 = [v38 recordId];
                +[SGDNotificationBroadcaster emitContactUpdated:v47];
              }
              _Block_object_dispose(v178, 8);
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v140 objects:v180 count:16];
          }
          while (v35);
        }

        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v48 = [v116 emailAddresses];
        uint64_t v49 = [v48 countByEnumeratingWithState:&v133 objects:v177 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v134;
          do
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              if (*(void *)v134 != v50) {
                objc_enumerationMutation(v48);
              }
              uint64_t v52 = *(void **)(*((void *)&v133 + 1) + 8 * k);
              int v53 = [v52 emailAddress];
              char v54 = SGNormalizeEmailAddress();

              *(void *)v178 = 0;
              *(void *)&v178[8] = v178;
              *(void *)&v178[16] = 0x2020000000;
              char v179 = 0;
              uint64_t v55 = [(SGDSuggestManager *)self recentlyHarvestedDetailLock];
              v130[0] = MEMORY[0x1E4F143A8];
              v130[1] = 3221225472;
              v130[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_116;
              v130[3] = &unk_1E65B9398;
              id v56 = v54;
              id v131 = v56;
              id v132 = v178;
              [v55 runWithLockAcquired:v130];

              if (*(unsigned char *)(*(void *)&v178[8] + 24))
              {
                BOOL v57 = (void *)MEMORY[0x1E4F5DA40];
                char v58 = [v116 name];
                id v59 = [v58 fullName];
                char v60 = [v57 encodedStringForFullName:v59];

                [v111 setValueIfNotPresent:v60 forKey:v56 fromRecordId:0];
                uint64_t v61 = [v52 recordId];
                +[SGDNotificationBroadcaster emitContactUpdated:v61];
              }
              _Block_object_dispose(v178, 8);
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v133 objects:v177 count:16];
          }
          while (v49);
        }
      }
      uint64_t v107 = [obj countByEnumeratingWithState:&v144 objects:v181 count:16];
    }
    while (v107);
  }

  int v62 = sgLogHandle();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    int v63 = [v97 uniqueIdentifier];
    *(_DWORD *)v178 = 138412546;
    *(void *)&v178[4] = v63;
    *(_WORD *)&v178[12] = 2112;
    *(void *)&v178[14] = v104;
    _os_log_impl(&dword_1CA650000, v62, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: realtimeSuggestionsForMailOrMessageWithHash: %@: results: %@", v178, 0x16u);
  }
  if (!a6)
  {
    v101[2](v101, v104);

    uint64_t v101 = 0;
  }
  dispatch_resume(object);
  dispatch_barrier_sync(object, &__block_literal_global_119_21120);
  SGRecordMeasurementState(&v172);
  [(id)realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore clearAllTables];
  __int16 v64 = v109[2]();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v128 = 0uLL;
    long long v129 = 0uLL;
    long long v126 = 0uLL;
    long long v127 = 0uLL;
    long long v66 = [v104 events];
    uint64_t v67 = [v66 countByEnumeratingWithState:&v126 objects:v176 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v127;
      do
      {
        for (uint64_t m = 0; m != v67; ++m)
        {
          if (*(void *)v127 != v68) {
            objc_enumerationMutation(v66);
          }
          long long v70 = *(void **)(*((void *)&v126 + 1) + 8 * m);
          long long v71 = [v70 event];
          int v72 = [v71 isNaturalLanguageEvent];

          if (v72)
          {
            long long v73 = [v70 event];
            [(SGDSuggestManager *)self bumptTTLForNLEvent:v73];
          }
        }
        uint64_t v67 = [v66 countByEnumeratingWithState:&v126 objects:v176 count:16];
      }
      while (v67);
    }
    uint64_t v74 = 4;
  }
  else
  {
    long long v124 = 0uLL;
    long long v125 = 0uLL;
    long long v122 = 0uLL;
    long long v123 = 0uLL;
    long long v66 = [v104 reminders];
    uint64_t v75 = [v66 countByEnumeratingWithState:&v122 objects:v175 count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v123;
      do
      {
        for (uint64_t n = 0; n != v75; ++n)
        {
          if (*(void *)v123 != v76) {
            objc_enumerationMutation(v66);
          }
          uint64_t v78 = *(void **)(*((void *)&v122 + 1) + 8 * n);
          uint64_t v79 = +[SGRTCLogging defaultLogger];
          uint64_t v80 = [v78 reminder];
          [v79 logReminderInteractionFromReminder:v80 interface:1 actionType:4];
        }
        uint64_t v75 = [v66 countByEnumeratingWithState:&v122 objects:v175 count:16];
      }
      while (v75);
    }
    uint64_t v74 = 1;
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v81 = [v104 events];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v118 objects:v174 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v119;
    do
    {
      for (iuint64_t i = 0; ii != v82; ++ii)
      {
        if (*(void *)v119 != v83) {
          objc_enumerationMutation(v81);
        }
        id v85 = *(void **)(*((void *)&v118 + 1) + 8 * ii);
        id v86 = [v85 event];
        char v87 = [v86 isNaturalLanguageEvent];

        if ((v87 & 1) == 0)
        {
          id v88 = [SGPipelineEntity alloc];
          id v89 = (void *)MEMORY[0x1CB79B230]();
          id v90 = v109[2]();
          v91 = [(SGPipelineEntity *)v88 initWithMessage:v90];

          v92 = +[SGRTCLogging defaultLogger];
          [v92 logEventInteractionForRealtimeEvent:v85 parentEntity:v91 interface:v74 actionType:4];
        }
      }
      uint64_t v82 = [v81 countByEnumeratingWithState:&v118 objects:v174 count:16];
    }
    while (v82);
  }

  if (a6 == 1)
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    }
    v101[2](v101, v104);
  }

  _Block_object_dispose(v170, 8);
  _Block_object_dispose(buf, 8);

  SGRecordMeasurementState(&v172);
}

id __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230](+[SGPatterns pauseCacheEvictionTemporarily]);
  id v3 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v141 = (id)realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore;
  char v5 = [v3 accountType];
  BOOL v6 = +[SGSqlEntityStore canStoreEventsForAccountType:v5];

  uint64_t v140 = a1;
  id v133 = v4;
  if (v6 && (!*(void *)(a1 + 104) || [MEMORY[0x1E4F5DAF0] shouldHarvestEvents]))
  {
    BOOL v7 = [v3 source];
    uint64_t v8 = +[SGDuplicateKey duplicateKeyForMessage:v3 fromSource:v7];

    uint64_t v9 = [*(id *)(a1 + 32) harvestStore];
    uint64_t v10 = [v9 loadEntityByKey:v8];

    int v11 = [*(id *)(a1 + 32) _canBannerUseStoredDissection:v10 options:*(void *)(a1 + 112)];
    char v12 = v11;
    if (v11)
    {
      int v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "Existing valid dissection found in store.", buf, 2u);
      }

      id v14 = [*(id *)(a1 + 32) harvestStore];
      id v15 = [v14 childrenFromParentKey:v8];

      uint64_t v16 = [*(id *)(a1 + 32) harvestStore];

      id v17 = v10;
      id v18 = [(SGEntity *)v17 tags];
      uint64_t v19 = [MEMORY[0x1E4F5D9F0] requiresDeferredDissection];
      int v20 = [v18 containsObject:v19];

      if (!v20)
      {
        BOOL v21 = 0;
        goto LABEL_22;
      }
      BOOL v21 = *(void *)(v140 + 120) == 1;
      id v141 = (id)v16;
      if (v10) {
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v21 = 0;
      id v15 = 0;
      id v17 = 0;
      if (v10)
      {
LABEL_18:
        int8x16_t v23 = sgLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Existing dissection found in store, but HTML does not match.", buf, 2u);
        }

        if ((v12 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_15:
        uint64_t v16 = (uint64_t)v141;
LABEL_22:
        id v4 = v133;

        char v22 = 0;
        id v141 = (id)v16;
        a1 = v140;
        goto LABEL_23;
      }
    }
    if ((v12 & 1) == 0)
    {
LABEL_21:
      int32x4_t v24 = [[SGPipelineEntity alloc] initWithMessage:v3];

      uint64_t v16 = (uint64_t)v141;
      id v17 = v24;
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  BOOL v21 = 0;
  id v15 = 0;
  id v17 = 0;
  char v22 = 1;
LABEL_23:
  id v25 = objc_opt_new();
  id v132 = v3;
  long long v139 = v25;
  if (v21 || !v15)
  {
    int v27 = *(unsigned __int8 *)(a1 + 144);
    id v28 = sgLogHandle();
    uint64_t v29 = v28;
    if (!v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEBUG, "Entity not harvested, but I was told not to dissect.", buf, 2u);
      }

      id v122 = 0;
      goto LABEL_103;
    }
    char v134 = v22;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: starting dissection.", buf, 2u);
    }

    id v30 = [SGHarvestQueueMetrics alloc];
    uint64_t v31 = [v3 spotlightBundleIdentifier];
    id v32 = [(SGHarvestQueueMetrics *)v30 initRealtime:v31 wasNoBudgetItem:0];

    [v32 startHarvest];
    [v3 setHarvestMetrics:v32];
    +[SGDPowerLog startDissectionOfMessage:v3 inContext:0];
    __int16 v33 = dispatch_group_create();
    unint64_t v34 = v33;
    uint64_t v35 = a1;
    if (*(void *)(a1 + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      dispatch_group_enter(v33);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_69;
      block[3] = &unk_1E65C0688;
      uint64_t v36 = *(NSObject **)(a1 + 48);
      id v160 = *(id *)(a1 + 40);
      id v161 = v32;
      v162 = v34;
      dispatch_async(v36, block);
    }
    group = v34;
    long long v37 = [[SGRequestContext alloc] initWithServiceContext:*(void *)(a1 + 56) concurrencyBehavior:1 backpressureHazard:1 extractionMode:2];
    long long v38 = v32;
    long long v39 = [[SGPipelineEntity alloc] initWithMessage:v3];

    long long v40 = v38;
    [(SGPipelineEntity *)v39 setHarvestMetrics:v38];
    long long v41 = +[SGPipeline fullPipeline];
    [v41 dissectAndStoreEntity:v39 inContext:v37 destinationStore:v141];

    id v26 = [(SGPipelineEntity *)v39 enrichments];

    *(unsigned char *)(*(void *)(*(void *)(v35 + 96) + 8) + 24) = [(SGPipelineEntity *)v39 needsSourceVerification];
    long long v142 = v39;
    id v42 = [(SGPipelineEntity *)v39 invalidatedMessageIdentifiers];
    [v139 setInvalidatedIdentifiers:v42];

    +[SGDPowerLog endDissectionOfMessage:v3 inContext:0];
    if ([*(id *)(v35 + 32) persistRealtimeExtractions])
    {
      objc_opt_class();
      if (!(v134 & 1 | ((objc_opt_isKindOfClass() & 1) == 0)))
      {
        *(unsigned char *)(*(void *)(*(void *)(v140 + 88) + 8) + 24) = 1;
        dispatch_group_enter(v34);
        long long v129 = *(void **)(v140 + 32);
        long long v135 = v26;
        id v43 = v3;
        long long v128 = [v43 spotlightBundleIdentifier];
        long long v44 = [v43 spotlightUniqueIdentifier];
        long long v45 = [v43 spotlightDomainIdentifier];

        long long v46 = [*(id *)(v140 + 32) harvestStore];
        uint64_t v47 = *(void *)(v140 + 48);
        v157[0] = MEMORY[0x1E4F143A8];
        v157[1] = 3221225472;
        v157[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_78;
        v157[3] = &unk_1E65BEF88;
        id v158 = group;
        [v129 _storeAndGeocodeEntity:v39 spotlightBundleIdentifier:v128 spotlightUniqueIdentifier:v44 spotlightDomainIdentifier:v45 store:v46 afterCallbackQueue:v47 finalize:v157];

        id v26 = v135;
      }
    }
    long long v48 = v40;
    if (v4)
    {
      long long v136 = v26;
      id v130 = v37;
      if ([v4 senderIsAccountOwner])
      {
        uint64_t v49 = [*(id *)(v140 + 32) harvestStore];
        [v49 registerSentTextMessage:v4];
      }
      *(unsigned char *)(*(void *)(*(void *)(v140 + 88) + 8) + 24) = 1;
      dispatch_group_enter(group);
      uint64_t v50 = *(void **)(v140 + 32);
      uint64_t v51 = [v4 spotlightBundleIdentifier];
      uint64_t v52 = [v4 spotlightUniqueIdentifier];
      int v53 = [v4 spotlightDomainIdentifier];
      char v54 = [*(id *)(v140 + 32) harvestStore];
      uint64_t v55 = *(void *)(v140 + 48);
      v155[0] = MEMORY[0x1E4F143A8];
      v155[1] = 3221225472;
      v155[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_79;
      v155[3] = &unk_1E65BEF88;
      id v156 = group;
      [v50 _storeAndGeocodeEntity:v142 spotlightBundleIdentifier:v51 spotlightUniqueIdentifier:v52 spotlightDomainIdentifier:v53 store:v54 afterCallbackQueue:v55 finalize:v155];

      long long v37 = v130;
      id v3 = v132;
      id v26 = v136;
    }
    id v56 = dispatch_get_global_queue(9, 0);
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_80;
    v151[3] = &unk_1E65C0688;
    uint64_t v152 = group;
    id v153 = v40;
    a1 = v140;
    id v154 = *(id *)(v140 + 64);
    id v57 = v48;
    char v58 = group;
    dispatch_async(v56, v151);

    id v25 = v139;
  }
  else
  {
    long long v142 = v17;
    id v26 = v15;
  }
  if (*(void *)(a1 + 104))
  {
    id v59 = sgEventsLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      long long v125 = [(SGEntity *)v142 loggingIdentifier];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v165 = (uint64_t)v125;
      _os_log_debug_impl(&dword_1CA650000, v59, OS_LOG_TYPE_DEBUG, "SGDSuggestManager - Getting realtime events for dissected entity [SGEntity %{public}@]", buf, 0xCu);
    }
    char v60 = objc_opt_new();
    unsigned int v61 = [MEMORY[0x1E4F5DAF0] showPastEvents];
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    if (*(unsigned char *)(a1 + 145)) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = v61;
    }
    if (*(unsigned char *)(a1 + 147)) {
      char v63 = 1;
    }
    else {
      char v63 = v61;
    }
    LOBYTE(v127) = v63;
    id v131 = v26;
    __int16 v64 = [*(id *)(a1 + 32) shortNamesAndRealtimeEventsFromEntity:v142 message:v3 enrichments:v26 store:v141 keepPastEvents:v62 keepPartialEvents:*(unsigned __int8 *)(a1 + 146) keepEventsFromOldDocuments:v127];
    uint64_t v65 = [v64 countByEnumeratingWithState:&v147 objects:v169 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v148;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v148 != v67) {
            objc_enumerationMutation(v64);
          }
          long long v69 = *(void **)(*((void *)&v147 + 1) + 8 * i);
          long long v70 = [v69 first];
          long long v71 = [v69 second];
          int v72 = v71;
          if (!*(unsigned char *)(a1 + 148))
          {
            long long v73 = [v71 event];
            [v73 setAttributeSetForEvent:0];
          }
          if (!v72)
          {
            uint64_t v82 = [MEMORY[0x1E4F28B00] currentHandler];
            [v82 handleFailureInMethod:*(void *)(a1 + 128), *(void *)(a1 + 32), @"SGDSuggestManager+RealtimeDonations.m", 657, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
          }
          [v60 addObject:v72];
          uint64_t v74 = *(void **)(a1 + 72);
          if (v70)
          {
            [*(id *)(a1 + 72) addObject:v70];
          }
          else
          {
            uint64_t v75 = [MEMORY[0x1E4F1CA98] null];
            [v74 addObject:v75];
          }
          uint64_t v76 = sgEventsLogHandle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v78 = [v72 event];
            uint64_t v79 = [v78 loggingIdentifier];
            int v80 = [v72 state];
            *(_DWORD *)long long buf = 138543618;
            uint64_t v165 = (uint64_t)v79;
            __int16 v166 = 1024;
            LODWORD(v167) = v80;
            _os_log_debug_impl(&dword_1CA650000, v76, OS_LOG_TYPE_DEBUG, "  -> Event [SGEvent %{public}@] in state %i", buf, 0x12u);

            a1 = v140;
          }

          long long v77 = sgEventsLogHandle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v81 = [v72 event];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v165 = (uint64_t)v81;
            _os_log_debug_impl(&dword_1CA650000, v77, OS_LOG_TYPE_DEBUG, "    -> %@", buf, 0xCu);
          }
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v147 objects:v169 count:16];
      }
      while (v66);
    }

    uint64_t v83 = sgLogHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      int v126 = [v60 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v165) = v126;
      _os_log_debug_impl(&dword_1CA650000, v83, OS_LOG_TYPE_DEBUG, "Found %i realtime events", buf, 8u);
    }

    id v25 = v139;
    [v139 setEvents:v60];

    id v4 = v133;
    id v26 = v131;
  }
  id v84 = sgLogHandle();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v84, OS_LOG_TYPE_INFO, "Getting realtime wallet orders for dissected entity", buf, 2u);
  }

  id v85 = [*(id *)(a1 + 32) realtimeWalletOrdersFromEntity:v142 enrichments:v26];
  id v86 = sgLogHandle();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
  {
    int v87 = [v85 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v165) = v87;
    _os_log_impl(&dword_1CA650000, v86, OS_LOG_TYPE_INFO, "Found %i realtime wallet orders", buf, 8u);
  }

  [v25 setWalletOrders:v85];
  id v88 = [*(id *)(a1 + 32) realtimeWalletPassesFromEntity:v142 enrichments:v26];
  sgLogHandle();
  v90 = id v89 = v25;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v124 = [v88 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v165 = v124;
    _os_log_debug_impl(&dword_1CA650000, v90, OS_LOG_TYPE_DEBUG, "Found %tu realtime wallet passes", buf, 0xCu);
  }

  [v89 setWalletPasses:v88];
  id v25 = v89;
  if (*(void *)(a1 + 136))
  {
    v91 = sgLogHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v91, OS_LOG_TYPE_INFO, "Getting realtime contacts for dissected entity", buf, 2u);
    }

    v92 = [*(id *)(a1 + 32) realtimeContactsFromEntity:v142 enrichments:v26 sourceTextMessage:v4 store:v141];
    id v93 = sgLogHandle();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      int v94 = [v92 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v165) = v94;
      _os_log_impl(&dword_1CA650000, v93, OS_LOG_TYPE_INFO, "Found %i realtime contacts", buf, 8u);
    }

    [v89 setContacts:v92];
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v95 = v26;
  uint64_t v96 = [v95 countByEnumeratingWithState:&v143 objects:v168 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    char v98 = 0;
    uint64_t v99 = *(void *)v144;
    uint64_t groupa = *(void *)v144;
    do
    {
      for (uint64_t j = 0; j != v97; ++j)
      {
        if (*(void *)v144 != v99) {
          objc_enumerationMutation(v95);
        }
        uint64_t v101 = *(void **)(*((void *)&v143 + 1) + 8 * j);
        long long v102 = [v101 duplicateKey];
        char v103 = ([v102 entityType] != 22) | v98;

        if (v103)
        {
          id v104 = [v101 duplicateKey];
          [v104 entityType];
          int IsDelivery = SGEntityTypeIsDelivery();

          if (!IsDelivery) {
            continue;
          }
          uint64_t v106 = [MEMORY[0x1E4F5D9D0] deliveryForEntity:v101 store:v141];
          uint64_t v107 = [v25 deliveries];

          if (!v107) {
            [v25 setDeliveries:MEMORY[0x1E4F1CBF0]];
          }
          long long v108 = [v25 deliveries];
          long long v109 = (void *)[v108 mutableCopy];

          if (([v109 containsObject:v106] & 1) == 0 && v106) {
            [v109 addObject:v106];
          }
          [v25 setDeliveries:v109];
        }
        else
        {
          id v110 = v95;
          long long v111 = (void *)MEMORY[0x1E4F5DAC8];
          int16x8_t v112 = [v101 duplicateKey];
          uint64_t v106 = [v111 originForDuplicateKey:v112 entity:v101 parent:v142 store:v141];

          if (!v106)
          {
            long long v121 = [MEMORY[0x1E4F28B00] currentHandler];
            [v121 handleFailureInMethod:*(void *)(a1 + 128), *(void *)(a1 + 32), @"SGDSuggestManager+RealtimeDonations.m", 695, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];
          }
          uint64_t v113 = v97;
          long long v109 = +[SGStorageReminder storageReminderFromEntity:v101 origin:v106];
          long long v114 = [v109 toReminder];
          long long v115 = sgRemindersLogHandle();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            long long v116 = [(SGEntity *)v142 loggingIdentifier];
            uint64_t v117 = [v114 loggingIdentifier];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v165 = (uint64_t)v116;
            __int16 v166 = 2112;
            unint64_t v167 = v117;
            _os_log_impl(&dword_1CA650000, v115, OS_LOG_TYPE_DEFAULT, "Entity %@ -> SGReminder %@", buf, 0x16u);
          }
          long long v118 = +[SGRemindersAdapter constructNotesForReminder:v109];
          long long v119 = (void *)[objc_alloc(MEMORY[0x1E4F5DB08]) initWithReminder:v114 notes:v118];
          v163 = v119;
          long long v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v163 count:1];
          id v25 = v139;
          [v139 setReminders:v120];

          a1 = v140;
          id v95 = v110;
          uint64_t v99 = groupa;
          uint64_t v97 = v113;
          char v98 = 1;
        }
      }
      uint64_t v97 = [v95 countByEnumeratingWithState:&v143 objects:v168 count:16];
    }
    while (v97);
  }

  id v122 = v25;
  id v15 = v95;
  id v17 = v142;
  id v3 = v132;
  id v4 = v133;
LABEL_103:

  return v122;
}

id __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v55 = [v3 suggestionsCount];
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: validating cached results %tu", buf, 0xCu);
  }

  if (![v3 suggestionsCount])
  {
    id v10 = v3;
    goto LABEL_30;
  }
  uint64_t v5 = [*(id *)(a1 + 32) clientIsMail] ^ 1;
  BOOL v6 = [v3 contacts];
  uint64_t v7 = mach_absolute_time() - *(void *)(a1 + 64);
  if (SGMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
  }
  +[SGAggregateLogging contactsSuggested:v6 withElapsedTime:v7 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1EB9F00D4 inApp:v5];

  uint64_t v8 = [v3 events];
  uint64_t v9 = mach_absolute_time() - *(void *)(a1 + 64);
  if (SGMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
  }
  +[SGAggregateLogging eventsSuggested:v8 withElapsedTime:v9 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1EB9F00D4 inApp:v5];

  id v10 = (id)[v3 copy];
  int v11 = [v3 contacts];
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  long long v48 = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_100;
  uint64_t v49 = &unk_1E65B9300;
  char v52 = *(unsigned char *)(a1 + 80);
  id v12 = *(id *)(a1 + 40);
  char v53 = *(unsigned char *)(a1 + 81);
  uint64_t v50 = *(void *)(a1 + 32);
  id v51 = v12;
  int v13 = sgFilter();
  [v10 setContacts:v13];

  id v14 = objc_opt_new();
  id v15 = [v3 events];
  v43[1] = (id)MEMORY[0x1E4F143A8];
  v43[2] = (id)3221225472;
  v43[3] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_103;
  v43[4] = &unk_1E65B9328;
  char v45 = *(unsigned char *)(a1 + 81);
  void v43[5] = *(id *)(a1 + 32);
  id v16 = v14;
  id v44 = v16;
  id v17 = sgFilter();
  [v10 setEvents:v17];

  id v18 = [v10 events];
  if (![v18 count] || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    goto LABEL_19;
  }
  uint64_t v19 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v21 = +[SGMailClientUtil sharedInstance];
    char v22 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    int8x16_t v23 = [v22 messageId];
    v43[0] = 0;
    uint64_t v24 = [v21 verifyDKIMSignatureForMailWithIdentifier:v23 error:v43];
    id v18 = v43[0];

    if (v24)
    {
      [v10 setEvents:MEMORY[0x1E4F1CBF0]];
      id v25 = sgEventsLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v55 = (uint64_t)v18;
        id v26 = "SGSuggestManager validateResultsvalidateResults: DKIM verification resulted in failure: %@";
        int v27 = v25;
        uint32_t v28 = 12;
LABEL_17:
        _os_log_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else
    {
      id v25 = sgEventsLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v26 = "SGSuggestManager validateResultsvalidateResults: Successfully verified DKIM signature.";
        int v27 = v25;
        uint32_t v28 = 2;
        goto LABEL_17;
      }
    }

LABEL_19:
  }
  uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
  id v30 = [v10 events];
  if ([*(id *)(a1 + 32) clientIsMessages])
  {
    uint64_t v31 = sgFilter();

    id v30 = (void *)v31;
  }
  +[SGAggregateLogging suggestionImpressionsViaBanner:](SGAggregateLogging, "suggestionImpressionsViaBanner:", [v3 suggestionsCount]);
  +[SGAggregateLogging eventSuggestionImpressionsViaBanner:](SGAggregateLogging, "eventSuggestionImpressionsViaBanner:", [v30 count]);
  id v32 = [v10 contacts];
  +[SGAggregateLogging contactSuggestionImpressionsViaBanner:](SGAggregateLogging, "contactSuggestionImpressionsViaBanner:", [v32 count]);

  +[SGAggregateLogging suggestionImpressionsViaBannerSuppressed:](SGAggregateLogging, "suggestionImpressionsViaBannerSuppressed:", [v3 suggestionsCount] - objc_msgSend(v10, "suggestionsCount"));
  __int16 v33 = (void *)MEMORY[0x1E4F5DB50];
  uint64_t v34 = [v10 contacts];
  uint64_t v35 = (void *)v34;
  if (v34) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = (uint64_t)v29;
  }
  if (v30) {
    uint64_t v29 = v30;
  }
  int v37 = [*(id *)(a1 + 32) clientIsMail];
  long long v38 = (void *)MEMORY[0x1E4F5DC88];
  if (!v37) {
    long long v38 = (void *)MEMORY[0x1E4F5DC90];
  }
  [v33 recordBannerShownWithContacts:v36 events:v29 inApp:*v38];

  long long v39 = *(void **)(a1 + 32);
  long long v40 = [v3 reminders];
  long long v41 = [v39 filterRealtimeReminders:v40];
  [v10 setReminders:v41];

LABEL_30:
  return v10;
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_112(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [v3 addObject:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [v3 addObject:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    int v5 = [v4 senderIsBusinessChat];
  }
  else
  {
    int v5 = 0;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    BOOL v6 = +[SGSuggestHistory sharedSuggestHistory];
    int v7 = [v6 isValidSuggestion:v3] ^ 1;
  }
  else
  {
    int v7 = 0;
  }
  if (*(unsigned char *)(a1 + 48)
    || ([*(id *)(a1 + 32) harvestStore],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 realtimeContactIsSignificantOrSignificanceIsDisabled:v3],
        v8,
        v9))
  {
    int v9 = 1;
    +[SGAggregateLogging hypotheticalSuggestionImpressionsIncludingActedOn:1];
  }
  if (!v7)
  {
    +[SGAggregateLogging hypotheticalContactSuggestionImpressionsIncludingInsignificant:1];
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "filtering out suggestion that has already been acted on according to history", buf, 2u);
  }

  if (v5)
  {
LABEL_16:
    int v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v13 = 0;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "filtering out suggestion for business chat text", v13, 2u);
    }
  }
LABEL_19:

  return v9 & ((v7 | v5) ^ 1u);
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_103(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = +[SGSuggestHistory sharedSuggestHistory];
    int v5 = [v4 isValidSuggestion:v3] ^ 1;
  }
  else
  {
    int v5 = 0;
  }
  BOOL v6 = [v3 event];
  if ([v6 isNaturalLanguageEvent]
    && [MEMORY[0x1E4F5DAF0] onlyShowSignificantNLEvents])
  {
    char v7 = [*(id *)(a1 + 32) clientIsMessages];

    if (v7)
    {
      LODWORD(v8) = 1;
      goto LABEL_10;
    }
    BOOL v6 = [v3 event];
    unint64_t v8 = ((unint64_t)[v6 naturalLanguageEventAttributes] >> 8) & 1;
  }
  else
  {
    LODWORD(v8) = 1;
  }

LABEL_10:
  int v9 = [v3 event];

  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    int v11 = [v3 event];
    id v12 = [v11 opaqueKey];
    LODWORD(v10) = [v10 containsObject:v12];

    int v13 = *(void **)(a1 + 40);
    id v14 = [v3 event];
    id v15 = [v14 opaqueKey];
    [v13 addObject:v15];

    int v16 = v10 ^ 1;
    if (v8) {
      goto LABEL_12;
    }
  }
  else
  {
    int v16 = 1;
    if (v8)
    {
LABEL_12:
      +[SGAggregateLogging hypotheticalSuggestionImpressionsIncludingActedOn:1];
      if ((v5 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
  }
  if (v5)
  {
LABEL_16:
    id v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)char v22 = 0;
      _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "filtering out suggestion that has already been acted on according to history", v22, 2u);
    }

    goto LABEL_21;
  }
  id v18 = [v3 event];

  if (v18)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F5DAB8];
    int v20 = [v3 event];
    [v19 recordInteractionForEventWithInterface:0 actionType:2 harvestedSGEvent:v20 curatedEKEvent:0];
  }
LABEL_21:

  return v8 & ~v5 & v16;
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_107(uint64_t a1, void *a2)
{
  id v2 = [a2 event];
  uint64_t v3 = [v2 isNaturalLanguageEvent] ^ 1;

  return v3;
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_69(id *a1)
{
  if (kSGDPluginNameURLPlugin_block_invoke__pasOnceToken24 != -1) {
    dispatch_once(&kSGDPluginNameURLPlugin_block_invoke__pasOnceToken24, &__block_literal_global_72);
  }
  id v2 = kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3;
  block[3] = &unk_1E65C0688;
  id v4 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  dispatch_async(v2, block);
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_78(uint64_t a1)
{
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_79(uint64_t a1)
{
}

intptr_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_80(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 20000000000);
  intptr_t v4 = dispatch_group_wait(v2, v3);

  if (v4)
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "Timed out waiting for async realtime harvest work", v7, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) endHarvest];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[SGDPluginManager sharedInstance];
  id v3 = (id)[v2 processSearchableItem:*(void *)(a1 + 32) harvestMetrics:*(void *)(a1 + 40)];

  intptr_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v6 = 138412290;
    char v7 = v5;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "Plugins finished processing message: %@", (uint8_t *)&v6, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_70()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"_suggestionsFromMessage-plugins" qosClass:9];
  id v2 = (void *)kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult;
  kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult = v1;
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke()
{
  realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore = +[SGSqlEntityStore sqlStoreInMemory];
  return MEMORY[0x1F41817F8]();
}

- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 isTextMessage:(BOOL)a10
{
  LOBYTE(v11) = a10;
  LOBYTE(v10) = a9;
  [(SGDSuggestManager *)self realtimeSuggestionsForMailOrMessageWithHash:a3 options:a4 completion:a5 completionDelivery:a6 providedBy:a7 searchableItem:a8 dissectIfNecessary:v10 processingType:2 isTextMessage:v11];
}

- (void)_suggestionsFromMessage:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 completionDelivery:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  int v13 = (void (**)(id, void))a7;
  if (!v9) {
    goto LABEL_15;
  }
  id v14 = [v12 attributeSet];
  id v15 = [v14 authors];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = [v12 domainIdentifier];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      uint64_t v19 = [v12 protection];

      if (v19)
      {
        char v20 = 1;
LABEL_16:
        uint64_t v24 = [(SGDSuggestManager *)self harvestStore];
        id v25 = [v12 bundleID];
        id v26 = [v12 uniqueIdentifier];
        [v24 markReimportItemAsSeenByReceiverWithBundleId:v25 uniqueId:v26];

        int v27 = [v12 uniqueIdentifier];
        uint32_t v28 = [v27 dataUsingEncoding:4];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __128__SGDSuggestManager_RealtimeDonations___suggestionsFromMessage_options_dissectIfNecessary_completionDelivery_completionHandler___block_invoke;
        v30[3] = &unk_1E65B92B0;
        id v31 = v12;
        BYTE1(v29) = 1;
        LOBYTE(v29) = v20;
        -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v28, a4, v13, a6, v30, v31, v29);

        goto LABEL_17;
      }
      int8x16_t v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no content protection type defined. Will not dissect..", buf, 2u);
      }

LABEL_15:
      char v20 = 0;
      goto LABEL_16;
    }
    BOOL v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      char v22 = "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no domainIdentifier (conversationIden"
            "tifier). Ignoring.";
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      char v22 = "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no authors. Ignoring.";
LABEL_10:
      _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    }
  }

  v13[2](v13, 0);
LABEL_17:
}

SGTextMessage *__128__SGDSuggestManager_RealtimeDonations___suggestionsFromMessage_options_dissectIfNecessary_completionDelivery_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = [[SGTextMessage alloc] initWithSearchableItem:*(void *)(a1 + 32)];
  return v1;
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 completionHandler:(id)a6 fullCompletionHandler:(id)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  int v13 = v12;
  if (a7)
  {
    id v14 = a3;
    [(SGDSuggestManager *)self suggestionsFromSingleMessage:v14 options:a4 completionDelivery:a5 completionHandler:v13 fullCompletionHandler:a7];

    id v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager+RealtimeDonations: suggestionsFromMessage legacy path processing", buf, 2u);
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke;
    v19[3] = &unk_1E65B9210;
    id v20 = v12;
    id v15 = a3;
    uint64_t v16 = (void *)MEMORY[0x1CB79B4C0](v19);
    v22[0] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    uint64_t v18 = +[SGDSuggestManager simpleWritebackHandler];
    [(SGDSuggestManager *)self batchSuggestionsFromMessages:v17 options:a4 completionDelivery:a5 batchCompletion:v16 writeBackCompletion:v18 shouldStopSignal:0];
  }
}

void __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  intptr_t v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      BOOL v21 = [v4 objectAtIndexedSubscript:0];
      uint64_t v19 = [v21 error];
      id v20 = [v4 objectAtIndexedSubscript:0];
      char v7 = [v20 tuple];
      uint64_t v8 = [v7 contacts];
      BOOL v9 = [v4 objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 tuple];
      uint64_t v11 = [v10 events];
      id v12 = [v4 objectAtIndexedSubscript:0];
      int v13 = [v12 tuple];
      id v14 = [v13 invalidatedIdentifiers];
      (*(void (**)(uint64_t, void *, void *, void *, void *))(v6 + 16))(v6, v19, v8, v11, v14);
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5DC80];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"no response from calling batchSuggestionsFromMessage";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:12 userInfo:v17];
      (*(void (**)(uint64_t, void *, void, void, void))(v6 + 16))(v6, v18, 0, 0, 0);
    }
  }
}

- (void)suggestionsFromSingleMessage:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 completionHandler:(id)a6 fullCompletionHandler:(id)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v12 bundleID];
    id v17 = [v12 uniqueIdentifier];
    *(_DWORD *)long long buf = 138413058;
    id v66 = v16;
    __int16 v67 = 2112;
    uint64_t v68 = v17;
    __int16 v69 = 2048;
    unint64_t v70 = a4;
    __int16 v71 = 2048;
    unint64_t v72 = a5;
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: suggestionsFromMessage: %@ : %@ options: %tu completionDelivery: %tu", buf, 0x2Au);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v19 = [v12 bundleID];

  if (!v19) {
    [v12 setBundleID:*MEMORY[0x1E4F937C0]];
  }
  id v20 = [v12 protection];

  if (!v20) {
    [v12 setProtection:*MEMORY[0x1E4F28358]];
  }
  BOOL v21 = (void *)MEMORY[0x1E4F93760];
  uint64_t v22 = [v12 bundleID];
  LOBYTE(v21) = [v21 shouldAdmitContentFromBundleIdentifier:v22];

  if ((v21 & 1) == 0)
  {
    long long v40 = sgLogHandle();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)long long buf = 0;
    long long v41 = "suggestionsFromMessage ignoring item since the bundle is disallowed by user's settings";
LABEL_22:
    _os_log_impl(&dword_1CA650000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
    goto LABEL_23;
  }
  int8x16_t v23 = [v12 domainIdentifier];
  uint64_t v24 = [v23 length];

  if (!v24)
  {
    long long v40 = sgLogHandle();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)long long buf = 0;
    long long v41 = "suggestionsFromMessage ignoring item since the domainIdentifier (conversationIdentifier) is nil";
    goto LABEL_22;
  }
  id v25 = [v12 attributeSet];
  id v26 = [v25 textContentNoCopy];

  if (v26)
  {
    int v27 = objc_opt_new();
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke;
    v61[3] = &unk_1E65B9260;
    id v62 = v13;
    id v63 = v14;
    char v52 = v27;
    [v27 wait:v61];
    if (a4 == 3 && !a5)
    {
      uint32_t v28 = [SGSearchableItemIdTriple alloc];
      uint64_t v29 = [v12 bundleID];
      id v30 = [v12 domainIdentifier];
      id v31 = [v12 uniqueIdentifier];
      id v32 = [(SGSearchableItemIdTriple *)v28 initWithBundleId:v29 domainId:v30 uniqueId:v31];

      __int16 v33 = [(SGDSuggestManager *)self lastSuggestionsFromMessageLock];
      [v33 lock];

      uint64_t v34 = [(SGDSuggestManager *)self lastSuggestionsFromMessageRequest];
      if ([(SGSearchableItemIdTriple *)v32 isEqualToSearchableItemIdTriple:v34])
      {
        uint64_t v35 = sgLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEBUG, "suggestionsFromMessage consolidating repeated item with previous request", buf, 2u);
        }

        uint64_t v36 = [(SGDSuggestManager *)self lastSuggestionsFromMessageResponse];
        int v37 = [(SGDSuggestManager *)self lastSuggestionsFromMessageLock];
        [v37 unlock];

        long long v38 = v52;
        long long v39 = [v52 completer];
        [v36 wait:v39];

LABEL_35:
        goto LABEL_36;
      }
      [(SGDSuggestManager *)self setLastSuggestionsFromMessageRequest:v32];
      [(SGDSuggestManager *)self setLastSuggestionsFromMessageResponse:v52];
      id v42 = [(SGDSuggestManager *)self lastSuggestionsFromMessageLock];
      [v42 unlock];
    }
    id v43 = +[SGXpcTransaction transactionWithName:"suggestionsFromMessage message harvest queue"];
    id v44 = [(SGDSuggestManager *)self messageHarvestQueue];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_35;
    v54[3] = &unk_1E65BF920;
    v54[4] = self;
    id v45 = v12;
    id v55 = v45;
    unint64_t v58 = a4;
    unint64_t v59 = a5;
    CFAbsoluteTime v60 = Current;
    long long v38 = v52;
    id v56 = v52;
    id v32 = v43;
    id v57 = v32;
    [v44 addOperationWithBlock:v54];

    if ((a4 & 0x4000000) == 0)
    {
      uint64_t v46 = [MEMORY[0x1E4F93768] defaultReceiver];
      id v64 = v45;
      uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      long long v48 = [v45 bundleID];
      id v53 = 0;
      char v49 = [v46 donateSearchableItems:v47 bundleIdentifier:v48 error:&v53];
      id v50 = v53;

      if ((v49 & 1) == 0)
      {
        id v51 = sgLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v66 = v50;
          _os_log_error_impl(&dword_1CA650000, v51, OS_LOG_TYPE_ERROR, "SGDSuggestManager+RealtimeDonations: error donating message to ProactiveHarvesting: %@", buf, 0xCu);
        }
      }
      long long v38 = v52;
    }

    goto LABEL_35;
  }
  long long v40 = sgLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    long long v41 = "suggestionsFromMessage ignoring item since the textContent is nil";
    goto LABEL_22;
  }
LABEL_23:

  if (v13) {
    (*((void (**)(id, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0);
  }
  if (v14) {
    (*((void (**)(id, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0);
  }
LABEL_36:
}

void __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    char v7 = [v14 contacts];
    uint64_t v8 = [v14 events];
    BOOL v9 = [v14 invalidatedIdentifiers];
    (*(void (**)(uint64_t, id, void *, void *, void *))(v6 + 16))(v6, v5, v7, v8, v9);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = [v14 contacts];
    id v12 = [v14 events];
    id v13 = [v14 invalidatedIdentifiers];
    (*(void (**)(uint64_t, id, void *, void *, void *))(v10 + 16))(v10, v5, v11, v12, v13);
  }
}

void __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_35(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E65B9288;
  uint64_t v16 = *(void *)(a1 + 80);
  id v12 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 56);
  [v2 _suggestionsFromMessage:v3 options:v4 dissectIfNecessary:1 completionDelivery:v5 completionHandler:v11];
  uint64_t v8 = [*(id *)(a1 + 40) uniqueIdentifier];

  if (v8)
  {
    BOOL v9 = [MEMORY[0x1E4F5DB78] sharedInstance];
    uint64_t v10 = [*(id *)(a1 + 40) uniqueIdentifier];
    [v9 finishProcessingForUniqueIdentifier:v10];
  }
}

void __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  uint64_t v5 = objc_opt_new();
  [v5 setMethod:0];
  id v6 = [MEMORY[0x1E4F93728] sharedInstance];
  [v6 trackDistributionForMessage:v5 value:v4];

  if (!v3) {
    id v3 = (id)objc_opt_new();
  }
  [*(id *)(a1 + 32) succeed:v3];
  uint64_t v7 = +[SGChatLengthEstimator sharedInstance];
  uint64_t v8 = [*(id *)(a1 + 40) domainIdentifier];
  [v7 recordMessageInChat:v8];

  BOOL v9 = [*(id *)(a1 + 48) messageHarvestQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E65BEF88;
  id v11 = *(id *)(a1 + 56);
  [v9 addOperationWithBlock:v10];
}

uint64_t __136__SGDSuggestManager_RealtimeDonations__suggestionsFromSingleMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) done];
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 fullCompletionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_fullCompletionHandler___block_invoke;
  v10[3] = &unk_1E65B9238;
  id v11 = v8;
  id v9 = v8;
  [(SGDSuggestManager *)self suggestionsFromMessage:a3 options:a4 completionDelivery:1 completionHandler:0 fullCompletionHandler:v10];
}

void __93__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_fullCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    [MEMORY[0x1E4F5DB98] responseWithError:a2];
  }
  else {
    objc_msgSend(MEMORY[0x1E4F5DB98], "responseWith:also:also:");
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (id)_emailContentCacheSalt
{
  if (_emailContentCacheSalt__pasOnceToken6 != -1) {
    dispatch_once(&_emailContentCacheSalt__pasOnceToken6, &__block_literal_global_21186);
  }
  uint64_t v2 = (void *)_emailContentCacheSalt__pasExprOnceResult;
  return v2;
}

void __62__SGDSuggestManager_RealtimeDonations___emailContentCacheSalt__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [@"kSuggestionsFromEmailContentCacheSalt" dataUsingEncoding:4];
  uint64_t v2 = (void *)_emailContentCacheSalt__pasExprOnceResult;
  _emailContentCacheSalt__pasExprOnceResult = v1;
}

- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 withCompletion:(id)a8
{
  BOOL v10 = a5;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __147__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke;
  v20[3] = &unk_1E65B9210;
  id v21 = v14;
  id v15 = v14;
  id v16 = a3;
  id v17 = (void *)MEMORY[0x1CB79B4C0](v20);
  v22[0] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v19 = +[SGDSuggestManager simpleWritebackHandler];
  [(SGDSuggestManager *)self batchSuggestionsFromSearchableItems:v18 options:a4 dissectIfNecessary:v10 processingType:a6 completionDelivery:a7 batchCompletion:v17 writeBackCompletion:v19 shouldStopSignal:0];
}

void __147__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFAbsoluteTime v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v7 = [v4 objectAtIndexedSubscript:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F5DB90];
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F5DC80];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"no response from calling batchSuggestionsFromSearchableItems";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v12 = [v9 errorWithDomain:v10 code:12 userInfo:v11];
      id v13 = [v8 responseWithError:v12];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v13);
    }
  }
}

- (void)_suggestionsFromSingleSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = (void (**)(id, void *))a8;
  id v16 = [v14 attributeSet];
  id v17 = [v16 emailHeaders];

  uint64_t v18 = [v14 attributeSet];
  uint64_t v19 = [v18 accountIdentifier];

  if (v17 && v19)
  {
    unint64_t v31 = a4;
    if ([MEMORY[0x1E4F93790] mailItemIsSPAM:v14])
    {
      id v20 = sgLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        uint64_t v24 = [MEMORY[0x1E4F5DB90] responseWith:MEMORY[0x1E4F1CBF0]];
        v15[2](v15, v24);
        goto LABEL_15;
      }
      *(_WORD *)long long buf = 0;
      id v21 = "SGDSuggestManager: Mail: Not providing suggestions for searchable item that is spam.";
    }
    else
    {
      if (![MEMORY[0x1E4F93790] mailItemIsInTrash:v14])
      {
        id v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
        [(SGDSuggestManager *)self _emailContentCacheSalt];
        v27 = unint64_t v30 = a7;
        uint64_t v24 = SGSha256Data(v26, v27);

        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __153__SGDSuggestManager_RealtimeDonations___suggestionsFromSingleSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke;
        v34[3] = &unk_1E65B91C0;
        uint64_t v35 = v15;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __153__SGDSuggestManager_RealtimeDonations___suggestionsFromSingleSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke_2;
        v32[3] = &unk_1E65B91E8;
        id v33 = v14;
        LOBYTE(v29) = 0;
        LOBYTE(v28) = a5;
        [(SGDSuggestManager *)self realtimeSuggestionsForMailOrMessageWithHash:v24 options:v31 completion:v34 completionDelivery:v30 providedBy:v32 searchableItem:v33 dissectIfNecessary:v28 processingType:a6 isTextMessage:v29];

        goto LABEL_15;
      }
      id v20 = sgLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)long long buf = 0;
      id v21 = "SGDSuggestManager: Mail: Skipping suggestions for searchable item that is in trash.";
    }
    _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_13;
  }
  uint64_t v22 = sgLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: Asked for suggestions for a searchable item without headers dictionary or source, returning 0 suggestions", buf, 2u);
  }

  int8x16_t v23 = (void *)MEMORY[0x1E4F5DB90];
  uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5DC80] code:4 userInfo:0];
  id v25 = [v23 responseWithError:v24];
  v15[2](v15, v25);

LABEL_15:
}

void __153__SGDSuggestManager_RealtimeDonations___suggestionsFromSingleSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F5DB90];
    id v5 = [a2 combinedSuggestions];
    CFAbsoluteTime v4 = [v3 responseWith:v5];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

SGSimpleMailMessage *__153__SGDSuggestManager_RealtimeDonations___suggestionsFromSingleSearchableItem_options_dissectIfNecessary_processingType_completionDelivery_withCompletion___block_invoke_2(uint64_t a1)
{
  return +[SGMessage messageWithSearchableItem:*(void *)(a1 + 32)];
}

- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 withCompletion:(id)a6
{
}

- (void)batchSuggestionsFromMessages:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 batchCompletion:(id)a6 writeBackCompletion:(id)a7 shouldStopSignal:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v24 = (void (**)(id, void *))a6;
  id v13 = a7;
  id v14 = (uint64_t (**)(void))a8;
  id v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v38 = [v12 count];
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: batchSuggestionsFromMessages: %lu item(s)", buf, 0xCu);
  }

  int v27 = objc_opt_new();
  id v16 = objc_opt_new();
  id v17 = dispatch_group_create();
  if (v13) {
    unint64_t v18 = a4 | 0x8000000;
  }
  else {
    unint64_t v18 = a4;
  }
  if ([v12 count])
  {
    unint64_t v19 = 0;
    do
    {
      if (v14 && (v14[2](v14) & 1) != 0) {
        break;
      }
      id v20 = [v12 objectAtIndexedSubscript:v19];
      dispatch_group_enter(v17);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      void v31[2] = __146__SGDSuggestManager_BatchDonations__batchSuggestionsFromMessages_options_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke;
      v31[3] = &unk_1E65BA218;
      id v32 = v27;
      id v36 = v13;
      id v33 = v16;
      id v34 = v20;
      uint64_t v35 = v17;
      id v21 = v20;
      [(SGDSuggestManager *)self suggestionsFromSingleMessage:v21 options:v18 completionDelivery:a5 completionHandler:v31 fullCompletionHandler:0];

      ++v19;
    }
    while (v19 < [v12 count]);
  }
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (v24)
  {
    uint64_t v22 = (void *)[v27 copy];
    v24[2](v24, v22);
  }
  if (v13 && [v16 count])
  {
    int8x16_t v23 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __146__SGDSuggestManager_BatchDonations__batchSuggestionsFromMessages_options_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke_2;
    block[3] = &unk_1E65C0440;
    id v29 = v16;
    id v30 = v13;
    dispatch_async(v23, block);
  }
}

void __146__SGDSuggestManager_BatchDonations__batchSuggestionsFromMessages_options_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v19 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = *(id *)(a1 + 32);
  objc_sync_enter(v12);
  id v13 = *(void **)(a1 + 32);
  id v14 = [[SGMessageCompletionHandlerParams alloc] initWithError:v19 foundContacts:v9 foundEvents:v10 invalidatedMessageIdentifiers:v11];
  [v13 addObject:v14];

  objc_sync_exit(v12);
  if (*(void *)(a1 + 64))
  {
    id v15 = *(id *)(a1 + 40);
    objc_sync_enter(v15);
    id v16 = [*(id *)(a1 + 48) uniqueIdentifier];
    id v17 = [*(id *)(a1 + 48) bundleID];
    unint64_t v18 = +[SGDSuggestManager getProcessedItemFromEvents:v10 uniqueID:v16 bundleID:v17];

    if (v18) {
      [*(id *)(a1 + 40) addObject:v18];
    }

    objc_sync_exit(v15);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __146__SGDSuggestManager_BatchDonations__batchSuggestionsFromMessages_options_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) copy];
  +[SGDSuggestManager updateOriginalDocumentsWith:v2 completionHandler:*(void *)(a1 + 40)];
}

- (void)batchSuggestionsFromSearchableItems:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 completionDelivery:(unint64_t)a7 batchCompletion:(id)a8 writeBackCompletion:(id)a9 shouldStopSignal:(id)a10
{
  BOOL v26 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v24 = (void (**)(id, void *))a8;
  id v13 = a9;
  id v14 = (uint64_t (**)(void))a10;
  id v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v40 = [v12 count];
    _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "**** SGDSuggestManager: batchSuggestionsFromSearchableItems: %lu item(s)", buf, 0xCu);
  }

  id v29 = objc_opt_new();
  id v16 = objc_opt_new();
  id v17 = dispatch_group_create();
  unint64_t v18 = v13;
  if (v13) {
    a4 |= 0x8000000uLL;
  }
  if ([v12 count])
  {
    unint64_t v19 = 0;
    do
    {
      if (v14 && (v14[2](v14) & 1) != 0) {
        break;
      }
      id v20 = [v12 objectAtIndexedSubscript:v19];
      dispatch_group_enter(v17);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __187__SGDSuggestManager_BatchDonations__batchSuggestionsFromSearchableItems_options_dissectIfNecessary_processingType_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke;
      v33[3] = &unk_1E65BA1F0;
      id v34 = v29;
      id v38 = v18;
      id v35 = v16;
      id v36 = v20;
      int v37 = v17;
      id v21 = v20;
      [(SGDSuggestManager *)self _suggestionsFromSingleSearchableItem:v21 options:a4 dissectIfNecessary:v26 processingType:a6 completionDelivery:a7 withCompletion:v33];

      ++v19;
    }
    while (v19 < [v12 count]);
  }
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if (v24)
  {
    uint64_t v22 = (void *)[v29 copy];
    v24[2](v24, v22);
  }
  if (v18 && [v16 count])
  {
    int8x16_t v23 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __187__SGDSuggestManager_BatchDonations__batchSuggestionsFromSearchableItems_options_dissectIfNecessary_processingType_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke_2;
    block[3] = &unk_1E65C0440;
    id v31 = v16;
    id v32 = v18;
    dispatch_async(v23, block);
  }
}

void __187__SGDSuggestManager_BatchDonations__batchSuggestionsFromSearchableItems_options_dissectIfNecessary_processingType_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) addObject:v9];
  objc_sync_exit(v3);

  if (*(void *)(a1 + 64))
  {
    id v4 = *(id *)(a1 + 40);
    objc_sync_enter(v4);
    id v5 = [v9 response1];
    uint64_t v6 = [*(id *)(a1 + 48) uniqueIdentifier];
    uint64_t v7 = [*(id *)(a1 + 48) bundleID];
    id v8 = +[SGDSuggestManager getProcessedItemFromEvents:v5 uniqueID:v6 bundleID:v7];

    if (v8) {
      [*(id *)(a1 + 40) addObject:v8];
    }

    objc_sync_exit(v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __187__SGDSuggestManager_BatchDonations__batchSuggestionsFromSearchableItems_options_dissectIfNecessary_processingType_completionDelivery_batchCompletion_writeBackCompletion_shouldStopSignal___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) copy];
  +[SGDSuggestManager updateOriginalDocumentsWith:v2 completionHandler:*(void *)(a1 + 40)];
}

@end