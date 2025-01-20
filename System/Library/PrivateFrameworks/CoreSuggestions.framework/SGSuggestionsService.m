@interface SGSuggestionsService
+ (BOOL)hasEntitlement:(id)a3;
+ (BOOL)isHarvestingSupported;
+ (id)_daemonConnectionFutureForMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5;
+ (id)daemonConnections;
+ (id)inProcessSuggestManager;
+ (id)serviceForContacts;
+ (id)serviceForDeliveries;
+ (id)serviceForEvents;
+ (id)serviceForFides;
+ (id)serviceForInternal;
+ (id)serviceForIpsos;
+ (id)serviceForMail;
+ (id)serviceForMessages;
+ (id)serviceForReminders;
+ (id)serviceForSpotlightKnowledge;
+ (id)serviceForURLs;
+ (void)prepareForQuery;
+ (void)setInProcessSuggestManager:(id)a3;
- (BOOL)addInteractions:(id)a3 bundleId:(id)a4 error:(id *)a5;
- (BOOL)addSearchableItems:(id)a3 error:(id *)a4;
- (BOOL)clearCachesFully:(BOOL)a3 error:(id *)a4;
- (BOOL)confirmContact:(id)a3 error:(id *)a4;
- (BOOL)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 error:(id *)a5;
- (BOOL)confirmContactDetailRecord:(id)a3 error:(id *)a4;
- (BOOL)confirmEvent:(id)a3 error:(id *)a4;
- (BOOL)confirmEventByRecordId:(id)a3 error:(id *)a4;
- (BOOL)confirmRealtimeReminder:(id)a3 error:(id *)a4;
- (BOOL)confirmRecord:(id)a3 error:(id *)a4;
- (BOOL)confirmReminderByRecordId:(id)a3 error:(id *)a4;
- (BOOL)daemonExit:(id *)a3;
- (BOOL)deleteEventByRecordId:(id)a3 error:(id *)a4;
- (BOOL)deregisterContactsChangeObserverWithToken:(id)a3;
- (BOOL)deregisterEventsChangeObserverWithToken:(id)a3;
- (BOOL)isEnabledWithError:(id *)a3;
- (BOOL)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 error:(id *)a4;
- (BOOL)logUserCreatedReminderTitle:(id)a3 error:(id *)a4;
- (BOOL)ping:(id *)a3;
- (BOOL)prepareForRealtimeExtraction:(id *)a3;
- (BOOL)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 error:(id *)a5;
- (BOOL)queuesRequestsIfBusy;
- (BOOL)rebuildNamesForDetailCache:(id *)a3;
- (BOOL)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 error:(id *)a5;
- (BOOL)rejectContact:(id)a3 error:(id *)a4;
- (BOOL)rejectContact:(id)a3 rejectionUI:(int)a4 error:(id *)a5;
- (BOOL)rejectContactDetailRecord:(id)a3 error:(id *)a4;
- (BOOL)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5;
- (BOOL)rejectEvent:(id)a3 error:(id *)a4;
- (BOOL)rejectEventByRecordId:(id)a3 error:(id *)a4;
- (BOOL)rejectRealtimeReminder:(id)a3 error:(id *)a4;
- (BOOL)rejectRecord:(id)a3 error:(id *)a4;
- (BOOL)rejectRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5;
- (BOOL)rejectReminderByRecordId:(id)a3 error:(id *)a4;
- (BOOL)reminderAlarmTriggeredForRecordId:(id)a3 error:(id *)a4;
- (BOOL)removeAllStoredPseudoContacts:(id *)a3;
- (BOOL)reportMessagesFound:(id)a3 lost:(id)a4 error:(id *)a5;
- (BOOL)resetConfirmationAndRejectionHistory:(id *)a3;
- (BOOL)resolveFullDownloadRequests:(id)a3 error:(id *)a4;
- (BOOL)sendRTCLogs:(id *)a3;
- (BOOL)sleep:(id *)a3;
- (BOOL)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7;
- (BOOL)updateMessages:(id)a3 state:(unint64_t)a4 error:(id *)a5;
- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4;
- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5;
- (double)syncTimeout;
- (id)_daemonConnection;
- (id)_remoteSuggestionManager;
- (id)allContactsLimitedTo:(unint64_t)a3 error:(id *)a4;
- (id)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)allDeliveriesWithLimit:(unint64_t)a3 error:(id *)a4;
- (id)allEventsLimitedTo:(unint64_t)a3 error:(id *)a4;
- (id)allRemindersLimitedTo:(unint64_t)a3 error:(id *)a4;
- (id)birthdayExtractionsForInterval:(id)a3 error:(id *)a4;
- (id)cacheSnapshotFuture;
- (id)celebrationExtractionsForInterval:(id)a3 error:(id *)a4;
- (id)cnContactMatchesForRecordId:(id)a3 error:(id *)a4;
- (id)cnContactMatchesForRecordIds:(id)a3 error:(id *)a4;
- (id)contactFromRecordID:(id)a3;
- (id)contactFromRecordID:(id)a3 error:(id *)a4;
- (id)contactMatchesByEmailAddress:(id)a3;
- (id)contactMatchesByEmailAddress:(id)a3 error:(id *)a4;
- (id)contactMatchesByPhoneNumber:(id)a3;
- (id)contactMatchesByPhoneNumber:(id)a3 error:(id *)a4;
- (id)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (id)contactMatchesBySocialProfile:(id)a3 error:(id *)a4;
- (id)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)emailAddressIsSignificant:(id)a3 error:(id *)a4;
- (id)eventFromRecordID:(id)a3 error:(id *)a4;
- (id)eventFromUniqueId:(id)a3 error:(id *)a4;
- (id)extractAttributesAndDonate:(id)a3 error:(id *)a4;
- (id)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 error:(id *)a5;
- (id)fullDownloadRequestBatch:(unint64_t)a3 error:(id *)a4;
- (id)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 error:(id *)a12;
- (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 error:(id *)a6;
- (id)interactionStoreLookupForDetail:(id)a3 error:(id *)a4;
- (id)ipsosMessagesFromSearchableItems:(id)a3 error:(id *)a4;
- (id)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 error:(id *)a6;
- (id)messagesToRefreshWithError:(id *)a3;
- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 error:(id *)a6;
- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 error:(id *)a7;
- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 error:(id *)a8;
- (id)namesForDetailCaches;
- (id)originFromRecordId:(id)a3 error:(id *)a4;
- (id)powerState;
- (id)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8;
- (id)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8;
- (id)recentURLsWithLimit:(unsigned int)a3 error:(id *)a4;
- (id)registerContactsChangeObserver:(id)a3;
- (id)registerEventsChangeObserver:(id)a3;
- (id)reminderTitleForContent:(id)a3 error:(id *)a4;
- (id)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 error:(id *)a5;
- (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 error:(id *)a5;
- (id)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 error:(id *)a5;
- (id)saliencyFromEmailHeaders:(id)a3 error:(id *)a4;
- (id)saliencyFromRFC822Data:(id)a3 error:(id *)a4;
- (id)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 error:(id *)a8;
- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 error:(id *)a5;
- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 error:(id *)a7;
- (id)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5;
- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 error:(id *)a4;
- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 error:(id *)a5;
- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 error:(id *)a6;
- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 error:(id *)a7;
- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 error:(id *)a7;
- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8;
- (id)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (id)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 error:(id *)a6;
- (id)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)titleSuggestionForMessage:(id)a3 error:(id *)a4;
- (id)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 error:(id *)a5;
- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 error:(id *)a9;
- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 error:(id *)a7;
- (int)_confirmRejectUI;
- (void)_clearHarvestStoreCache;
- (void)addInteractions:(id)a3 bundleId:(id)a4 withCompletion:(id)a5;
- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5;
- (void)addSearchableItems:(id)a3 withCompletion:(id)a4;
- (void)allContactsLimitedTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4;
- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4;
- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4;
- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4;
- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4;
- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4;
- (void)confirmContact:(id)a3 withCompletion:(id)a4;
- (void)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 withCompletion:(id)a5;
- (void)confirmContactDetailRecord:(id)a3 withCompletion:(id)a4;
- (void)confirmEvent:(id)a3 withCompletion:(id)a4;
- (void)confirmEventByRecordId:(id)a3 withCompletion:(id)a4;
- (void)confirmRealtimeReminder:(id)a3 withCompletion:(id)a4;
- (void)confirmRecord:(id)a3 withCompletion:(id)a4;
- (void)confirmReminderByRecordId:(id)a3 withCompletion:(id)a4;
- (void)contactFromRecordID:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 withCompletion:(id)a5;
- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4;
- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)daemonExitWithCompletion:(id)a3;
- (void)deleteCloudKitZoneWithCompletion:(id)a3;
- (void)deleteEventByRecordId:(id)a3 withCompletion:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4;
- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5;
- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4;
- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5;
- (void)eventFromRecordID:(id)a3 withCompletion:(id)a4;
- (void)eventFromUniqueId:(id)a3 withCompletion:(id)a4;
- (void)eventsForSchemas:(id)a3 usingStore:(id)a4 completion:(id)a5;
- (void)extractAttributesAndDonate:(id)a3 withCompletion:(id)a4;
- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5;
- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4;
- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12;
- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6;
- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4;
- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4;
- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6;
- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 withCompletion:(id)a5;
- (void)keepDirty:(BOOL)a3;
- (void)keysForSchemas:(id)a3 completion:(id)a4;
- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 withCompletion:(id)a4;
- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 withCompletion:(id)a6;
- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6;
- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6;
- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3;
- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5;
- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4;
- (void)messagesToRefreshWithCompletion:(id)a3;
- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8;
- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7;
- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 withCompletion:(id)a6;
- (void)originFromRecordId:(id)a3 withCompletion:(id)a4;
- (void)pingWithCompletion:(id)a3;
- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4;
- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8;
- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8;
- (void)prepareForRealtimeExtractionWithCompletion:(id)a3;
- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5;
- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7;
- (void)rebuildNamesForDetailCacheWithCompletion:(id)a3;
- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4;
- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5;
- (void)rejectContact:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5;
- (void)rejectContact:(id)a3 withCompletion:(id)a4;
- (void)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5;
- (void)rejectContactDetailRecord:(id)a3 withCompletion:(id)a4;
- (void)rejectEvent:(id)a3 withCompletion:(id)a4;
- (void)rejectEventByRecordId:(id)a3 withCompletion:(id)a4;
- (void)rejectRealtimeReminder:(id)a3 withCompletion:(id)a4;
- (void)rejectRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5;
- (void)rejectRecord:(id)a3 withCompletion:(id)a4;
- (void)rejectReminderByRecordId:(id)a3 withCompletion:(id)a4;
- (void)reminderAlarmTriggeredForRecordId:(id)a3 withCompletion:(id)a4;
- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4;
- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3;
- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5;
- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5;
- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5;
- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5;
- (void)resetConfirmationAndRejectionHistoryWithCompletion:(id)a3;
- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4;
- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4;
- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4;
- (void)setManagerForTesting:(id)a3;
- (void)setQueuesRequestsIfBusy:(BOOL)a3;
- (void)setSyncTimeout:(double)a3;
- (void)sleepWithCompletion:(id)a3;
- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8;
- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5;
- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7;
- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 withCompletion:(id)a7;
- (void)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5;
- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5;
- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 withCompletion:(id)a4;
- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7;
- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8;
- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 withCompletion:(id)a7;
- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7;
- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5;
- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6;
- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4;
- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5;
- (void)updateMessages:(id)a3 state:(unint64_t)a4 withCompletion:(id)a5;
- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9;
- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7;
- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithCompletion:(id)a4;
- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5;
@end

@implementation SGSuggestionsService

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7
{
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v4, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: will request new snapshot from suggestd", buf, 2u);
  }

  v5 = [v3 workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_572;
  v7[3] = &unk_1E5B8E908;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_5(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  char v16 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40) found:&v16];
  id v3 = (void *)v2;
  if (v16)
  {
    ++_entitlements_block_invoke_foundCount;
    if (v2)
    {
      v4 = +[SGKeyValueCacheFile fullNameForEncodedContact:v2];
      v5 = v4;
      if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 48) && [v4 length])
      {
        uint64_t v13 = _PASValidatedFormat(*(void **)(a1 + 48), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

        v5 = (void *)v13;
      }
    }
    else
    {
      v5 = 0;
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if ([v5 length])
    {
      v17[0] = v5;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v14 + 16))(v14, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    ++_entitlements_block_invoke_notFoundCount;
  }
}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  if (!v15)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1273, @"Invalid parameter not satisfying: %@", @"detail" object file lineNumber description];
  }
  v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    uint64_t v53 = [v15 length];
    __int16 v54 = 2048;
    unint64_t v55 = a4;
    __int16 v56 = 1024;
    BOOL v57 = v11;
    __int16 v58 = 1024;
    BOOL v59 = v10;
    __int16 v60 = 1024;
    BOOL v61 = v9;
    _os_log_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_INFO, "namesForDetail: %lu length -limitTo: %lu -prependMaybe: %d -onlySignificant: %d -supportsInfoLookup: %d", buf, 0x28u);
  }

  if (([MEMORY[0x1E4F93B10] isClassCLocked] & 1) != 0
    || [v15 isEqualToString:&stru_1EF915628])
  {
    v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_DEFAULT, "Suggestions namesForDetail either queried before first unlock or with an empty parameter", buf, 2u);
    }

    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, MEMORY[0x1E4F1CBF0], 0);
    }
    goto LABEL_25;
  }
  if (!v10 && !v9)
  {
    LODWORD(v19) = +[SGDaemonConnection usingSyncXPC];
    v20 = [(SGSuggestionsService *)self cacheSnapshotFuture];
    if (!v19)
    {
LABEL_24:
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_586;
      v40[3] = &unk_1E5B8EE28;
      char v46 = (char)v19;
      id v41 = v15;
      BOOL v47 = v11;
      v42 = self;
      id v43 = v20;
      id v44 = v16;
      unint64_t v45 = a4;
      BOOL v48 = v10;
      char v49 = 0;
      id v32 = v20;
      [v32 wait:v40];

      goto LABEL_25;
    }
    v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A4D8C000, v21, OS_LOG_TYPE_DEBUG, "namesForDetail: (sync) will synchronously wait for cache snapshot future with timeout", buf, 2u);
    }

    [(SGSuggestionsService *)self syncTimeout];
    v36 = [v20 waitWithTimeout:v22 * 0.5];
    uint64_t v23 = [v36 second];
    log = sgLogHandle();
    BOOL v24 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
    v39 = (void *)v23;
    char v38 = (char)v19;
    v37 = v20;
    if (v23)
    {
      v25 = log;
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v39;
        v26 = "namesForDetail: (sync) cache snapshot future wait failed with error %@";
        v27 = log;
        uint32_t v28 = 12;
LABEL_27:
        _os_log_debug_impl(&dword_1A4D8C000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);
      }
    }
    else
    {
      v25 = log;
      if (v24)
      {
        *(_WORD *)buf = 0;
        v26 = "namesForDetail: (sync) cache snapshot future succeeded";
        v27 = log;
        uint32_t v28 = 2;
        goto LABEL_27;
      }
    }

    v31 = [v36 first];
    v19 = [v36 second];
    os_log_t loga = +[SGFuture createWithImmediateResult:v31 error:v19];

    v20 = loga;
    LOBYTE(v19) = v38;
    goto LABEL_24;
  }
  v29 = sgLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v29, OS_LOG_TYPE_DEBUG, "namesForDetail: Bypassing cache because significance checking is required", buf, 2u);
  }

  id v30 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke;
  v50[3] = &unk_1E5B904B0;
  id v51 = v16;
  [v30 namesForDetail:v15 limitTo:a4 prependMaybe:v11 onlySignificant:v10 supportsInfoLookup:v9 withCompletion:v50];

LABEL_25:
}

- (id)cacheSnapshotFuture
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke;
  v6[3] = &unk_1E5B8ED18;
  v6[4] = self;
  id v3 = +[SGFuture futureForObject:self withKey:a2 onCreate:v6];
  v4 = self;
  objc_sync_enter(v4);
  objc_storeStrong((id *)&v4->_snapshotFuture, v3);
  objc_sync_exit(v4);

  return v3;
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) containsString:@"@"])
  {
    id v2 = *(id *)(a1 + 40);
    SGNormalizeEmailAddress(*(void **)(a1 + 32));
  }
  else
  {
    id v2 = *(id *)(a1 + 48);
    SGNormalizePhoneNumber(*(void **)(a1 + 32));
  id v3 = };
  uint64_t v4 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_5;
  v9[3] = &unk_1E5B8EDD8;
  id v10 = v2;
  id v11 = v3;
  char v14 = *(unsigned char *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 72);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 80);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void *))(v5 + 16);
  id v7 = v3;
  id v8 = v2;
  v6(v5, v4, v9);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_3(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (*(unsigned char *)(a1 + 32)) {
    dispatch_sync(queue, block);
  }
  else {
    dispatch_async(queue, block);
  }
}

void __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke_2;
    block[3] = &unk_1E5B90610;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v14 = v11;
    uint64_t v16 = v12;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

void __41__SGSuggestionsService_daemonConnections__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:1];
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)daemonConnections__pasExprOnceResult;
  daemonConnections__pasExprOnceResult = v3;
}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 withCompletion:(id)a6
{
}

- (void)setQueuesRequestsIfBusy:(BOOL)a3
{
  self->_queuesRequestsIfBusy = a3;
}

- (id)registerContactsChangeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __55__SGSuggestionsService_registerContactsChangeObserver___block_invoke;
  id v13 = &unk_1E5B8EB60;
  id v14 = self;
  id v15 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1A62654A0](&v10);
  uint64_t v7 = [SGNotificationListener alloc];
  uint64_t v8 = [(SGNotificationListener *)v7 initWithNotification:@"com.apple.suggestions.contactsDidChange", v6, v10, v11, v12, v13, v14 callback];

  return v8;
}

uint64_t __39__SGSuggestionsService_hasEntitlement___block_invoke()
{
  hasEntitlement__cache = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(&unk_1EF92F7A0, "count"));

  return MEMORY[0x1F41817F8]();
}

void __137__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __59__SGSuggestionsService_recentURLsWithLimit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = a7;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1A4D8C000, v21, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v20) {
      (*((void (**)(id, void, void))v20 + 2))(v20, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v23 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __137__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion___block_invoke;
    v24[3] = &unk_1E5B904B0;
    id v25 = v20;
    [v23 urlsFoundBetweenStartDate:v16 endDate:v17 excludingBundleIdentifiers:v18 containingSubstring:v19 flagFilter:v10 limit:v9 withCompletion:v24];
  }
}

- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SGSuggestionsService_recentURLsWithLimit_withCompletion___block_invoke;
    v11[3] = &unk_1E5B904B0;
    id v12 = v7;
    [v10 recentURLsWithLimit:v4 withCompletion:v11];
  }
}

- (id)_remoteSuggestionManager
{
  id v3 = (void *)MEMORY[0x1A6265250](self, a2);
  managerForTesting = self->_managerForTesting;
  if (managerForTesting)
  {
    id v5 = managerForTesting;
  }
  else
  {
    uint64_t v6 = +[SGSuggestionsService inProcessSuggestManager];
    if (v6)
    {
      id v7 = sgLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_debug_impl(&dword_1A4D8C000, v7, OS_LOG_TYPE_DEBUG, "_remoteSuggestionManager using in-process suggest manager", v11, 2u);
      }

      id v5 = [[SGRemoteObjectProxy alloc] initWithInProcessSuggestManager:v6];
    }
    else
    {
      uint64_t v8 = [SGRemoteObjectProxy alloc];
      id v9 = [(SGSuggestionsService *)self _daemonConnection];
      id v5 = [(SGRemoteObjectProxy *)v8 initWithConnection:v9 queuesRequestsIfBusy:self->_queuesRequestsIfBusy];
    }
  }
  return v5;
}

+ (id)inProcessSuggestManager
{
  pthread_mutex_lock(&_inProcessSuggestManagerLock);
  id v2 = (id)_inProcessSuggestManager;
  pthread_mutex_unlock(&_inProcessSuggestManagerLock);

  return v2;
}

+ (id)serviceForURLs
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.urls" protocol:&unk_1EF9360C0];

  return v2;
}

void __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke_2(void *a1)
{
  id v4 = +[SGDSuggestManagerInterface xpcInterfaceForProtocol:a1[4]];
  id v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v3 = [[SGDaemonConnection alloc] initWithMachServiceName:a1[5] xpcInterface:v4];
  [v2 succeed:v3];
}

+ (id)serviceForContacts
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.contacts" protocol:&unk_1EF935F38];

  return v2;
}

- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  *(void *)&v27[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SGSuggestionsService;
  uint64_t v11 = [(SGSuggestionsService *)&v25 init];
  if (v11)
  {
    uint64_t v12 = +[SGSuggestionsService _daemonConnectionFutureForMachServiceName:v9 protocol:v10 useCache:v5];
    daemonConnectionFuture = v11->_daemonConnectionFuture;
    v11->_daemonConnectionFuture = (SGFuture *)v12;

    objc_storeStrong((id *)&v11->_machServiceName, a3);
    v11->_syncTimeout = 100.0;
    pthread_mutex_init(&v11->_syncTimeoutLock, 0);
    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v15 = [v14 bundleIdentifier];

    if ([v9 isEqualToString:@"com.apple.suggestd.suggestionmanager"])
    {
      id v16 = sgLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v27 = v15;
      id v17 = "Process using old entitlement (%@)";
    }
    else
    {
      uint64_t v18 = [&unk_1EF92F778 objectForKeyedSubscript:v9];
      if (v18)
      {
        id v19 = (void *)v18;
        if (!v15 || +[SGSuggestionsService hasEntitlement:v18]) {
          goto LABEL_11;
        }
        id v20 = sgLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          id v22 = [(SGSuggestionsService *)v11 _daemonConnection];
          id v23 = [v22 xpcConnection];
          int v24 = [v23 processIdentifier];
          *(_DWORD *)buf = 67109378;
          v27[0] = v24;
          LOWORD(v27[1]) = 2112;
          *(void *)((char *)&v27[1] + 2) = v19;
          _os_log_fault_impl(&dword_1A4D8C000, v20, OS_LOG_TYPE_FAULT, "Rejecting connection missing Suggestions entitlement; pid: %d, entitlementKey: %@",
            buf,
            0x12u);
        }
        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
        {
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
LABEL_18:
        abort();
      }
      id v16 = sgLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
LABEL_13:

        if (!_PASEvaluateLogFaultAndProbCrashCriteria()) {
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v27 = v9;
      id v17 = "Mach service %@ attempting to establish XPC connection with unknown entitlement";
    }
    _os_log_fault_impl(&dword_1A4D8C000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    goto LABEL_13;
  }
LABEL_15:

  return v11;
}

+ (BOOL)hasEntitlement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (hasEntitlement__onceToken == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_31:
    LOBYTE(v9) = 0;
LABEL_32:
    char v8 = v9;
    goto LABEL_33;
  }
  dispatch_once(&hasEntitlement__onceToken, &__block_literal_global_418);
  if (!v4) {
    goto LABEL_31;
  }
LABEL_3:
  id v5 = (id)hasEntitlement__cache;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)hasEntitlement__cache objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    char v8 = [v6 BOOLValue];
LABEL_5:
    LOBYTE(v9) = 0;
    int v10 = 1;
    goto LABEL_28;
  }
  uint64_t v11 = SecTaskCreateFromSelf(0);
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v15, OS_LOG_TYPE_INFO, "SecTaskCreateFromSelf returned NULL", buf, 2u);
    }

    char v8 = 0;
    goto LABEL_5;
  }
  CFErrorRef error = 0;
  CFTypeRef v13 = SecTaskCopyValueForEntitlement(v11, v4, &error);
  CFRelease(v12);
  if (v13)
  {
    CFTypeID v14 = CFGetTypeID(v13);
    BOOL v9 = v14 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v13) != 0;
    CFRelease(v13);
    id v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = @"NO";
      if (v9) {
        id v20 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      objc_super v25 = v4;
      __int16 v26 = 2112;
      CFErrorRef v27 = (CFErrorRef)v20;
      _os_log_impl(&dword_1A4D8C000, v19, OS_LOG_TYPE_INFO, "Found \"%@\" entitlement, value: %@", buf, 0x16u);
    }

    v21 = [NSNumber numberWithBool:v9];
    [(id)hasEntitlement__cache setObject:v21 forKeyedSubscript:v4];

    int v10 = 0;
  }
  else
  {
    CFErrorRef v16 = error;
    id v17 = sgLogHandle();
    uint64_t v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        objc_super v25 = v4;
        __int16 v26 = 2112;
        CFErrorRef v27 = error;
        _os_log_error_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v25 = v4;
      _os_log_debug_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_DEBUG, "Couldn't find the \"%@\" entitlement", buf, 0xCu);
    }

    if (error) {
      CFRelease(error);
    }
    LOBYTE(v9) = 0;
    int v10 = 1;
  }
  char v8 = 0;
LABEL_28:

  objc_sync_exit(v5);
  if (!v10) {
    goto LABEL_32;
  }
LABEL_33:

  return v8;
}

+ (id)_daemonConnectionFutureForMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2210;
  int v24 = __Block_byref_object_dispose__2211;
  id v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke;
  v16[3] = &unk_1E5B8E9A8;
  id v19 = &v20;
  id v9 = v7;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  uint64_t v11 = MEMORY[0x1A62654A0](v16);
  uint64_t v12 = (void *)v11;
  if (v5)
  {
    CFTypeRef v13 = +[SGSuggestionsService daemonConnections];
    [v13 runWithLockAcquired:v12];
  }
  else
  {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v14;
}

+ (id)daemonConnections
{
  if (daemonConnections__pasOnceToken10 != -1) {
    dispatch_once(&daemonConnections__pasOnceToken10, &__block_literal_global_330);
  }
  id v2 = (void *)daemonConnections__pasExprOnceResult;

  return v2;
}

- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4
{
  return [(SGSuggestionsService *)self initWithMachServiceName:a3 protocol:a4 useCache:1];
}

- (id)_daemonConnection
{
  id v3 = (void *)MEMORY[0x1A6265250](self, a2);
  id v4 = [(SGFuture *)self->_daemonConnectionFuture wait];
  BOOL v5 = [(SGFuture *)self->_daemonConnectionFuture result];
  return v5;
}

- (void)setSyncTimeout:(double)a3
{
  p_syncTimeoutLock = &self->_syncTimeoutLock;
  pthread_mutex_lock(&self->_syncTimeoutLock);
  self->_syncTimeout = a3;

  pthread_mutex_unlock(p_syncTimeoutLock);
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_2(uint64_t a1, void *a2)
{
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_2()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("namesForUnknownDetail-lookup", v1);
  id v3 = (void *)_entitlements_block_invoke__pasExprOnceResult_591;
  _entitlements_block_invoke__pasExprOnceResult_591 = (uint64_t)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotFuture, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_managerForTesting, 0);

  objc_storeStrong((id *)&self->_daemonConnectionFuture, 0);
}

- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    CFTypeRef v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2422, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__SGSuggestionsService_foundInStringForRecordId_style_withCompletion___block_invoke;
  v14[3] = &unk_1E5B904B0;
  id v15 = v10;
  id v12 = v10;
  [v11 foundInStringForRecordId:v9 style:v6 withCompletion:v14];
}

void __70__SGSuggestionsService_foundInStringForRecordId_style_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke;
  v13[3] = &unk_1E5B8F190;
  v13[4] = self;
  id v14 = v8;
  unsigned __int8 v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke_2;
  v8[3] = &unk_1E5B8EC50;
  id v9 = v3;
  id v7 = v3;
  [v4 foundInStringForRecordId:v5 style:v6 withCompletion:v8];
}

uint64_t __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_registerURLFeedback_absoluteURL_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v11 = v8;
  [v10 registerURLFeedback:v6 absoluteURL:v9 withCompletion:v12];
}

void __71__SGSuggestionsService_registerURLFeedback_absoluteURL_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke;
  v13[3] = &unk_1E5B8F190;
  unsigned __int8 v15 = a3;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v6 registerURLFeedback:v4 absoluteURL:v5 withCompletion:v8];
}

uint64_t __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  unsigned __int8 v32 = a7;
  unsigned int v31 = a8;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  [(SGSuggestionsService *)self syncTimeout];
  int v24 = objc_msgSend(v19, "waitUntilReturn:withTimeout:error:", &v26, a9);

  return v24;
}

void __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 76);
  uint64_t v10 = *(unsigned int *)(a1 + 72);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke_2;
  v12[3] = &unk_1E5B8EA70;
  id v13 = v3;
  id v11 = v3;
  [v4 urlsFoundBetweenStartDate:v5 endDate:v6 excludingBundleIdentifiers:v7 containingSubstring:v8 flagFilter:v9 limit:v10 withCompletion:v12];
}

uint64_t __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v23 = v18;
      _os_log_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v19 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __106__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion___block_invoke;
    v20[3] = &unk_1E5B904B0;
    id v21 = v16;
    [v19 urlsFoundBetweenStartDate:v13 endDate:v14 excludingBundleIdentifiers:v15 containingSubstring:0 flagFilter:0 limit:v8 withCompletion:v20];
  }
}

void __106__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(SGSuggestionsService *)self _daemonConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke;
  v21[3] = &unk_1E5B8F1E0;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  unsigned int v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v19 = objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);

  return v19;
}

void __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned int *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke_2;
  v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 urlsFoundBetweenStartDate:v5 endDate:v6 excludingBundleIdentifiers:v7 limit:v8 withCompletion:v10];
}

uint64_t __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)recentURLsWithLimit:(unsigned int)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  LODWORD(v11) = a3;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v4 recentURLsWithLimit:v5 withCompletion:v7];
}

uint64_t __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __113__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v11 = v8;
  [v10 reportMailIntelligenceFollowUpUserEngagement:a3 forStringFromFollowUpWarning:v9 withCompletion:v12];
}

void __113__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  id v14 = v8;
  int64_t v15 = a3;
  v13[4] = self;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 40;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v7 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke_2;
  v9[3] = &unk_1E5B8EE78;
  id v10 = v3;
  id v8 = v3;
  [v4 reportMailIntelligenceFollowUpUserEngagement:v6 forStringFromFollowUpWarning:v5 withCompletion:v9];
}

uint64_t __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__SGSuggestionsService_reportValue_forFeatureSetting_withCompletion___block_invoke;
  v11[3] = &unk_1E5B904B0;
  id v12 = v8;
  id v10 = v8;
  [v9 reportValue:v6 forFeatureSetting:a4 withCompletion:v11];
}

void __69__SGSuggestionsService_reportValue_forFeatureSetting_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 error:(id *)a5
{
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke;
  v12[3] = &unk_1E5B8EB38;
  BOOL v13 = a3;
  void v12[4] = self;
  v12[5] = a4;
  [(SGSuggestionsService *)self syncTimeout];
  id v10 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);

  return v10;
}

void __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke_2;
  v8[3] = &unk_1E5B8EE78;
  id v9 = v3;
  id v7 = v3;
  [v6 reportValue:v4 forFeatureSetting:v5 withCompletion:v8];
}

uint64_t __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_reportUserEngagement_forWarning_withCompletion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v11 = v8;
  [v10 reportUserEngagement:v6 forWarning:v9 withCompletion:v12];
}

void __71__SGSuggestionsService_reportUserEngagement_forWarning_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke;
  v13[3] = &unk_1E5B8F190;
  BOOL v15 = a3;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke_2;
  v8[3] = &unk_1E5B8EE78;
  id v9 = v3;
  id v7 = v3;
  [v6 reportUserEngagement:v4 forWarning:v5 withCompletion:v8];
}

uint64_t __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_withCompletion___block_invoke;
  v16[3] = &unk_1E5B904B0;
  id v17 = v10;
  id v15 = v10;
  [v14 identifyFollowUpWarningFromSubject:v13 body:v12 date:v11 withCompletion:v16];
}

void __84__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v17 = objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v19, a6);

  return v17;
}

void __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke_2;
  v9[3] = &unk_1E5B8F168;
  id v10 = v3;
  id v8 = v3;
  [v4 identifyFollowUpWarningFromSubject:v5 body:v7 date:v6 withCompletion:v9];
}

uint64_t __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12
{
  id v18 = a12;
  id v30 = a11;
  id v29 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __187__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion___block_invoke;
  v31[3] = &unk_1E5B904B0;
  id v32 = v18;
  id v28 = v18;
  [v26 identifyComposeWarningsFromSubject:v25 content:v24 attributes:v23 toRecipients:v22 ccRecipients:v21 bccRecipients:v20 originalToRecipients:v19 originalCcRecipients:v29 attachments:v30 withCompletion:v31];
}

void __187__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 error:(id *)a12
{
  id v35 = a3;
  id v34 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = [(SGSuggestionsService *)self _daemonConnection];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke;
  v40[3] = &unk_1E5B8F140;
  void v40[4] = self;
  id v41 = v35;
  id v42 = v34;
  id v43 = v17;
  id v44 = v18;
  id v45 = v19;
  id v46 = v20;
  id v47 = v21;
  id v48 = v22;
  id v49 = v23;
  id v38 = v23;
  id v37 = v22;
  id v36 = v21;
  id v25 = v20;
  id v26 = v19;
  id v27 = v18;
  id v28 = v17;
  id v29 = v34;
  id v30 = v35;
  [(SGSuggestionsService *)self syncTimeout];
  unsigned int v31 = v24;
  id v32 = objc_msgSend(v24, "waitUntilReturn:withTimeout:error:", v40, a12);

  return v32;
}

void __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 104);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke_2;
  v14[3] = &unk_1E5B8EA70;
  id v15 = v3;
  id v12 = v3;
  objc_msgSend(v4, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:withCompletion:", v5, v6, v7, v8, v9, v10, v13, v11, v14);
}

uint64_t __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion___block_invoke;
  v11[3] = &unk_1E5B904B0;
  id v12 = v8;
  id v10 = v8;
  [v9 sortedUnsubscriptionOpportunitiesForField:a3 limit:a4 withCompletion:v11];
}

void __87__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke;
  v12[3] = &unk_1E5B8F118;
  void v12[4] = self;
  v12[5] = a3;
  void v12[6] = a4;
  [(SGSuggestionsService *)self syncTimeout];
  id v10 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);

  return v10;
}

void __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 sortedUnsubscriptionOpportunitiesForField:v5 limit:v6 withCompletion:v8];
}

uint64_t __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7
{
  id v12 = a7;
  id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion___block_invoke;
  v15[3] = &unk_1E5B904B0;
  id v16 = v12;
  id v14 = v12;
  [v13 sortedUnsubscriptionOpportunitiesForField:a3 minCount:a4 minScore:a6 limit:v15 withCompletion:a5];
}

void __105__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v13 = [(SGSuggestionsService *)self _daemonConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke;
  v16[3] = &unk_1E5B8F0F0;
  void v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  *(double *)&v16[7] = a5;
  v16[8] = a6;
  [(SGSuggestionsService *)self syncTimeout];
  id v14 = objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", v16, a7);

  return v14;
}

void __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)*((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  double v7 = a1[7];
  uint64_t v8 = *((void *)a1 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke_2;
  v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 sortedUnsubscriptionOpportunitiesForField:v5 minCount:v6 minScore:v8 limit:v10 withCompletion:v7];
}

uint64_t __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2275, @"Invalid parameter not satisfying: %@", @"values" object file lineNumber description];
  }
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v10;
  id v12 = v10;
  [v11 preventUnsubscriptionOpportunitiesSuggestionsForField:a3 toValues:v9 withCompletion:v14];
}

void __102__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  id v14 = v8;
  int64_t v15 = a3;
  v13[4] = self;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 40;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(v7 + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke_2;
  v9[3] = &unk_1E5B90460;
  id v10 = v3;
  id v8 = v3;
  [v4 preventUnsubscriptionOpportunitiesSuggestionsForField:v6 toValues:v5 withCompletion:v9];
}

uint64_t __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion___block_invoke;
  v20[3] = &unk_1E5B904B0;
  id v21 = v14;
  id v19 = v14;
  [v18 sortedSaliencyResultsRestrictedToMailboxTypes:v17 mailboxIds:v16 receivedOnOrAfter:v15 ascending:v9 limit:a7 withCompletion:v20];
}

void __130__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  BOOL v28 = a6;
  unint64_t v27 = a7;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [(SGSuggestionsService *)self syncTimeout];
  id v21 = objc_msgSend(v17, "waitUntilReturn:withTimeout:error:", &v23, a8);

  return v21;
}

void __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke_2;
  v11[3] = &unk_1E5B8EA70;
  id v12 = v3;
  id v10 = v3;
  [v4 sortedSaliencyResultsRestrictedToMailboxTypes:v5 mailboxIds:v6 receivedOnOrAfter:v7 ascending:v8 limit:v9 withCompletion:v11];
}

uint64_t __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_topSalienciesForMailboxId_limit_withCompletion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v11 = v8;
  [v10 topSalienciesForMailboxId:v9 limit:a4 withCompletion:v12];
}

void __71__SGSuggestionsService_topSalienciesForMailboxId_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  v13[4] = self;
  id v14 = v8;
  int64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 topSalienciesForMailboxId:v5 limit:v6 withCompletion:v8];
}

uint64_t __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2242, @"Invalid parameter not satisfying: %@", @"headers" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SGSuggestionsService_saliencyFromEmailHeaders_withCompletion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v10 = v8;
  [v9 saliencyFromEmailHeaders:v7 withCompletion:v12];
}

void __64__SGSuggestionsService_saliencyFromEmailHeaders_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)saliencyFromEmailHeaders:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke_2;
  v7[3] = &unk_1E5B8F0A0;
  id v8 = v3;
  id v6 = v3;
  [v5 saliencyFromEmailHeaders:v4 withCompletion:v7];
}

uint64_t __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2232, @"Invalid parameter not satisfying: %@", @"rfc822Data" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_saliencyFromRFC822Data_withCompletion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v10 = v8;
  [v9 saliencyFromRFC822Data:v7 withCompletion:v12];
}

void __62__SGSuggestionsService_saliencyFromRFC822Data_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)saliencyFromRFC822Data:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke_2;
  v7[3] = &unk_1E5B8F0A0;
  id v8 = v3;
  id v6 = v3;
  [v5 saliencyFromRFC822Data:v4 withCompletion:v7];
}

uint64_t __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SGSuggestionsService_titleSuggestionForMessage_withCompletion___block_invoke;
  v10[3] = &unk_1E5B904B0;
  id v11 = v6;
  id v9 = v6;
  [v8 titleSuggestionForMessage:v7 withCompletion:v10];
}

void __65__SGSuggestionsService_titleSuggestionForMessage_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)titleSuggestionForMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke_2;
  v7[3] = &unk_1E5B8EC50;
  id v8 = v3;
  id v6 = v3;
  [v5 titleSuggestionForMessage:v4 withCompletion:v7];
}

uint64_t __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SGSuggestionsService_ipsosMessagesFromSearchableItems_withCompletion___block_invoke;
  v10[3] = &unk_1E5B904B0;
  id v11 = v6;
  id v9 = v6;
  [v8 ipsosMessagesFromSearchableItems:v7 withCompletion:v10];
}

void __72__SGSuggestionsService_ipsosMessagesFromSearchableItems_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)ipsosMessagesFromSearchableItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 ipsosMessagesFromSearchableItems:v4 withCompletion:v7];
}

uint64_t __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_pingWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 pingWithCompletion:v7];
}

void __43__SGSuggestionsService_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)ping:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__SGSuggestionsService_ping___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __29__SGSuggestionsService_ping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__SGSuggestionsService_ping___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 pingWithCompletion:v6];
}

uint64_t __29__SGSuggestionsService_ping___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sleepWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_sleepWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 sleepWithCompletion:v7];
}

void __44__SGSuggestionsService_sleepWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)sleep:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__SGSuggestionsService_sleep___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __30__SGSuggestionsService_sleep___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SGSuggestionsService_sleep___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 sleepWithCompletion:v6];
}

uint64_t __30__SGSuggestionsService_sleep___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)daemonExitWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_daemonExitWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 daemonExitWithCompletion:v7];
}

void __49__SGSuggestionsService_daemonExitWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)daemonExit:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SGSuggestionsService_daemonExit___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __35__SGSuggestionsService_daemonExit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SGSuggestionsService_daemonExit___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 daemonExitWithCompletion:v6];
}

uint64_t __35__SGSuggestionsService_daemonExit___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)keepDirty:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v4 keepDirty:v3];
}

- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v11 = a3;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2171, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v9 logSuggestionInteractionForRecordId:v11 interface:v6 actionType:v5];
}

- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    [v9 logEventInteractionForEventWithExternalIdentifier:v8 interface:v6 actionType:v5];
  }
  else
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEFAULT, "Called logEventInteractionForEventWithExternalIdentifier with nil externalIdentifier. Rejecting.", v11, 2u);
    }
  }
}

- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v11 = a3;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SGSuggestionsService.m" lineNumber:2149 description:@"uniqueKey can't be nil"];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v9 logEventInteractionForEventWithUniqueKey:v11 interface:v6 actionType:v5];
}

- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v5 logMetricSearchResultsIncludedPureSuggestionWithBundleId:v4];
}

- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v11 logMetricContactCreated:v10 contactIdentifier:v9 bundleId:v8];
}

- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v11 logMetricSuggestedContactDetailShown:v10 contactIdentifier:v9 bundleId:v8];
}

- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v11 logMetricSuggestedContactDetailUsed:v10 contactIdentifier:v9 bundleId:v8];
}

- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v11 logMetricContactSearchResultSelected:v10 contactIdentifier:v9 bundleId:v8];
}

- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v11 logMetricAutocompleteUserSelectedRecordId:v10 contactIdentifier:v9 bundleId:v8];
}

- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v13 logMetricContactSearchResult:v8 recordId:v12 contactIdentifier:v11 bundleId:v10];
}

- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  [v13 logMetricAutocompleteResult:v8 recordId:v12 contactIdentifier:v11 bundleId:v10];
}

- (id)namesForDetailCaches
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2210;
  int64_t v15 = __Block_byref_object_dispose__2211;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SGSuggestionsService_namesForDetailCaches__block_invoke;
  v8[3] = &unk_1E5B8F078;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 namesForDetailCacheSnapshotsWithCompletion:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

intptr_t __44__SGSuggestionsService_namesForDetailCaches__block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 response1];
  v10[0] = v4;
  id v5 = [v3 response2];

  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)powerState
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2210;
  int64_t v15 = __Block_byref_object_dispose__2211;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__SGSuggestionsService_powerState__block_invoke;
  v8[3] = &unk_1E5B8F050;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 powerStateWithCompletion:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

intptr_t __34__SGSuggestionsService_powerState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 response1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (void)deleteCloudKitZoneWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SGSuggestionsService_deleteCloudKitZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 deleteCloudKitZoneWithCompletion:v7];
}

void __57__SGSuggestionsService_deleteCloudKitZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)sendRTCLogs:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__SGSuggestionsService_sendRTCLogs___block_invoke;
  v13[3] = &unk_1E5B8F028;
  int64_t v15 = &v17;
  id v16 = a3;
  id v6 = v5;
  id v14 = v6;
  uint64_t v7 = (void *)MEMORY[0x1A62654A0](v13);
  id v8 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__SGSuggestionsService_sendRTCLogs___block_invoke_2;
  v11[3] = &unk_1E5B904B0;
  id v9 = v7;
  id v12 = v9;
  [v8 sendRTCLogsWithCompletion:v11];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v8) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

void __36__SGSuggestionsService_sendRTCLogs___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(a1 + 48);
  id v7 = v5;
  if (v7)
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_ERROR, "Error! %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v6) {
    *id v6 = v7;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __36__SGSuggestionsService_sendRTCLogs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v6 = [v3 response1];
    uint64_t v4 = [v6 BOOLValue];
    id v5 = [v3 error];

    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
  }
}

- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SGSuggestionsService_removeAllStoredPseudoContactsWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 removeAllStoredPseudoContactsWithCompletion:v7];
}

void __68__SGSuggestionsService_removeAllStoredPseudoContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)removeAllStoredPseudoContacts:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 removeAllStoredPseudoContactsWithCompletion:v6];
}

uint64_t __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    char v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2021, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_8:
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2023, @"Invalid parameter not satisfying: %@", @"HTMLPayload" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2024, @"Invalid parameter not satisfying: %@", @"extractionDate" object file lineNumber description];

      goto LABEL_5;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 2022, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v16) {
    goto LABEL_9;
  }
LABEL_5:
  id v18 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__SGSuggestionsService_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke;
  v24[3] = &unk_1E5B904B0;
  id v25 = v17;
  id v19 = v17;
  [v18 realtimeSuggestionsFromURL:v13 title:v14 HTMLPayload:v15 extractionDate:v16 withCompletion:v24];
}

void __99__SGSuggestionsService_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    id v14 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__SGSuggestionsService_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke;
    v18[3] = &unk_1E5B904B0;
    id v19 = v13;
    [v14 suggestionsFromURL:v10 title:v11 HTMLPayload:v12 withCompletion:v18];

    id v15 = v19;
LABEL_9:

    goto LABEL_10;
  }
  id v16 = sgLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v17 = 0;
    _os_log_error_impl(&dword_1A4D8C000, v16, OS_LOG_TYPE_ERROR, "suggestionsFromURL called with nil arguments", v17, 2u);
  }

  if (v13)
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v15);
    goto LABEL_9;
  }
LABEL_10:
}

void __76__SGSuggestionsService_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__SGSuggestionsService_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke;
  v15[3] = &unk_1E5B904B0;
  id v16 = v10;
  id v14 = v10;
  [v13 isEventCandidateForURL:v12 andTitle:v11 containsSchemaOrg:v6 withCompletion:v15];
}

void __89__SGSuggestionsService_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 response1];
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [v3 BOOLValue]);
  }
}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 withCompletion:(id)a5
{
}

- (void)eventsForSchemas:(id)a3 usingStore:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1959, @"Invalid parameter not satisfying: %@", @"schemas" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1960, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];

LABEL_3:
  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    uint64_t v22 = [v9 count];
    __int16 v23 = 2117;
    id v24 = v9;
    _os_log_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_DEFAULT, "eventsForSchemas count=%tu %{sensitive}@", buf, 0x16u);
  }

  id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke;
  v18[3] = &unk_1E5B8F000;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  [v13 schemaOrgToEvents:v9 completion:v18];
}

void __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 response1];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke_2;
    v8[3] = &unk_1E5B8EFD8;
    id v9 = *(id *)(a1 + 32);
    id v5 = +[SGFn map:v4 f:v8];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v3 error];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);
}

uint64_t __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 toEKEventWithStore:*(void *)(a1 + 32)];
}

- (void)keysForSchemas:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1944, @"Invalid parameter not satisfying: %@", @"schemas" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SGSuggestionsService_keysForSchemas_completion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v10 = v8;
  [v9 schemaOrgToEvents:v7 completion:v12];
}

void __50__SGSuggestionsService_keysForSchemas_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 response1];
  if (v3)
  {
    id v4 = +[SGFn map:v3 f:&__block_literal_global_674];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v7 error];
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v6);
}

uint64_t __50__SGSuggestionsService_keysForSchemas_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 opaqueKey];
}

- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1931, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__SGSuggestionsService_deleteInteractionsWithBundleId_groupIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v11;
  id v13 = v11;
  [v12 deleteInteractionsWithBundleId:v9 groupIdentifiers:v10 completion:v15];
}

void __83__SGSuggestionsService_deleteInteractionsWithBundleId_groupIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1919, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SGSuggestionsService_deleteInteractionsWithBundleId_identifiers_completion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v11;
  id v13 = v11;
  [v12 deleteInteractionsWithBundleId:v9 identifiers:v10 completion:v15];
}

void __78__SGSuggestionsService_deleteInteractionsWithBundleId_identifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1908, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SGSuggestionsService_deleteInteractionsWithBundleId_completion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 deleteInteractionsWithBundleId:v7 completion:v12];
}

void __66__SGSuggestionsService_deleteInteractionsWithBundleId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1898, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 deleteSpotlightReferencesWithBundleIdentifier:v7 completion:v12];
}

void __81__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1888, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1889, @"Invalid parameter not satisfying: %@", @"domainIdentifiers" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E5B8EA20;
  id v17 = v11;
  id v13 = v11;
  [v12 deleteSpotlightReferencesWithBundleIdentifier:v9 domainIdentifiers:v10 completion:v16];
}

void __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1874, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1875, @"Invalid parameter not satisfying: %@", @"uniqueIdentifiers" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E5B8EA20;
  id v17 = v11;
  id v13 = v11;
  [v12 deleteSpotlightReferencesWithBundleIdentifier:v9 uniqueIdentifiers:v10 completion:v16];
}

void __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1864, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1865, @"Invalid parameter not satisfying: %@", @"uniqueIdentifiers" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__SGSuggestionsService_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E5B8EA20;
  id v17 = v11;
  id v13 = v11;
  [v12 purgeSpotlightReferencesWithBundleIdentifier:v9 uniqueIdentifiers:v10 completion:v16];
}

void __98__SGSuggestionsService_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1853, @"Invalid parameter not satisfying: %@", @"recipe" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1854, @"Invalid parameter not satisfying: %@", @"attachments" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__SGSuggestionsService_evaluateRecipe_attachments_completion___block_invoke;
  v16[3] = &unk_1E5B904B0;
  id v17 = v11;
  id v13 = v11;
  [v12 evaluateRecipe:v9 attachments:v10 completion:v16];
}

void __62__SGSuggestionsService_evaluateRecipe_attachments_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1843, @"Invalid parameter not satisfying: %@", @"payload" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SGSuggestionsService_planReceivedFromServerWithPayload_completion___block_invoke;
  v12[3] = &unk_1E5B904B0;
  id v13 = v8;
  id v10 = v8;
  [v9 planReceivedFromServerWithPayload:v7 completion:v12];
}

void __69__SGSuggestionsService_planReceivedFromServerWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1830, @"Invalid parameter not satisfying: %@", @"requests" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SGSuggestionsService_resolveFullDownloadRequests_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 resolveFullDownloadRequests:v7 withCompletion:v12];
}

void __67__SGSuggestionsService_resolveFullDownloadRequests_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)resolveFullDownloadRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 resolveFullDownloadRequests:v4 withCompletion:v7];
}

uint64_t __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SGSuggestionsService_fullDownloadRequestBatch_withCompletion___block_invoke;
  v9[3] = &unk_1E5B904B0;
  id v10 = v6;
  id v8 = v6;
  [v7 fullDownloadRequestBatch:a3 withCompletion:v9];
}

void __64__SGSuggestionsService_fullDownloadRequestBatch_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)fullDownloadRequestBatch:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 fullDownloadRequestBatch:v4 withCompletion:v7];
}

uint64_t __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateMessages:(id)a3 state:(unint64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1812, @"Invalid parameter not satisfying: %@", @"messages" object file lineNumber description];
  }
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__SGSuggestionsService_updateMessages_state_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v10;
  id v12 = v10;
  [v11 updateMessages:v9 state:a4 completion:v14];
}

void __60__SGSuggestionsService_updateMessages_state_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)updateMessages:(id)a3 state:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SGSuggestionsService_updateMessages_state_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __51__SGSuggestionsService_updateMessages_state_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_updateMessages_state_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 updateMessages:v5 state:v6 withCompletion:v8];
}

uint64_t __51__SGSuggestionsService_updateMessages_state_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SGSuggestionsService_reportMessagesFound_lost_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v12 = v8;
  [v11 reportMessagesFound:v10 lost:v9 withCompletion:v13];
}

void __64__SGSuggestionsService_reportMessagesFound_lost_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)reportMessagesFound:(id)a3 lost:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _daemonConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke;
  v15[3] = &unk_1E5B8ECA0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v13 = objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);
  LOBYTE(self) = [v13 BOOLValue];

  return (char)self;
}

void __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 reportMessagesFound:v5 lost:v6 withCompletion:v8];
}

uint64_t __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)messagesToRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_messagesToRefreshWithCompletion___block_invoke;
  v7[3] = &unk_1E5B904B0;
  id v8 = v4;
  id v6 = v4;
  [v5 messagesToRefreshWithCompletion:v7];
}

void __56__SGSuggestionsService_messagesToRefreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)messagesToRefreshWithError:(id *)a3
{
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = self;
  [(SGSuggestionsService *)self syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);

  return v6;
}

void __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke_2;
  v6[3] = &unk_1E5B8EA70;
  id v7 = v3;
  id v5 = v3;
  [v4 messagesToRefreshWithCompletion:v6];
}

uint64_t __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 withCompletion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1784, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v18 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __105__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_withCompletion___block_invoke;
  v21[3] = &unk_1E5B8EA20;
  id v22 = v17;
  id v19 = v17;
  [v18 spotlightReimportFromIdentifier:v13 forPersonHandle:v14 startDate:v15 endDate:v16 completion:v21];
}

void __105__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(SGSuggestionsService *)self _daemonConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke;
  v23[3] = &unk_1E5B8EF90;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v21 = objc_msgSend(v16, "waitUntilReturn:withTimeout:error:", v23, a7);
  LOBYTE(self) = [v21 BOOLValue];

  return (char)self;
}

void __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke_2;
  void v10[3] = &unk_1E5B90460;
  id v11 = v3;
  id v9 = v3;
  [v4 spotlightReimportFromIdentifier:v5 forPersonHandle:v6 startDate:v7 endDate:v8 withCompletion:v10];
}

uint64_t __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInteractions:(id)a3 bundleId:(id)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1775, @"Invalid parameter not satisfying: %@", @"interactions" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1776, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__SGSuggestionsService_addInteractions_bundleId_withCompletion___block_invoke;
  v16[3] = &unk_1E5B8EA20;
  id v17 = v11;
  id v13 = v11;
  [v12 addInteractions:v9 bundleId:v10 completion:v16];
}

void __64__SGSuggestionsService_addInteractions_bundleId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)addInteractions:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _daemonConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke;
  v15[3] = &unk_1E5B8ECA0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v13 = objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);
  LOBYTE(self) = [v13 BOOLValue];

  return (char)self;
}

void __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 addInteractions:v5 bundleId:v6 withCompletion:v8];
}

uint64_t __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__SGSuggestionsService_addSearchableItemMetadata_htmlData_completion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v12 = v8;
  [v11 addSearchableItemMetadata:v10 htmlData:v9 completion:v13];
}

void __70__SGSuggestionsService_addSearchableItemMetadata_htmlData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)addSearchableItems:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_fault_impl(&dword_1A4D8C000, v7, OS_LOG_TYPE_FAULT, "Unexpected call to obsolete addSearchableItems method.", v8, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    abort();
  }
  if (v6) {
    v6[2](v6, 0);
  }
}

- (BOOL)addSearchableItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __49__SGSuggestionsService_addSearchableItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_addSearchableItems_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 addSearchableItems:v4 withCompletion:v7];
}

uint64_t __49__SGSuggestionsService_addSearchableItems_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1736, @"Invalid parameter not satisfying: %@", @"toAddresses" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
LABEL_8:
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1738, @"Invalid parameter not satisfying: %@", @"fromAddress" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
LABEL_9:
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1739, @"Invalid parameter not satisfying: %@", @"bounds" object file lineNumber description];

      goto LABEL_5;
    }
  }
  __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1737, @"Invalid parameter not satisfying: %@", @"ccAddresses" object file lineNumber description];

  if (!v17) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v18) {
    goto LABEL_9;
  }
LABEL_5:
  id v20 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __116__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke;
  v26[3] = &unk_1E5B904B0;
  id v27 = v19;
  id v21 = v19;
  [v20 predictedCCEmailAddressesWithToAddresses:v15 ccAddresses:v16 fromAddress:v17 date:v18 bounds:v26 completion:a6];
}

void __116__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  double v30 = a6;
  id v29 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  [(SGSuggestionsService *)self syncTimeout];
  __int16 v23 = objc_msgSend(v18, "waitUntilReturn:withTimeout:error:", &v25, a8);

  return v23;
}

void __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)*((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  uint64_t v7 = *((void *)a1 + 7);
  double v8 = a1[9];
  uint64_t v9 = *((void *)a1 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2;
  v11[3] = &unk_1E5B8EA70;
  id v12 = v3;
  id v10 = v3;
  [v4 predictedCCEmailAddressesWithToAddresses:v5 ccAddresses:v6 fromAddress:v7 date:v9 bounds:v11 withCompletion:v8];
}

uint64_t __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1715, @"Invalid parameter not satisfying: %@", @"toAddresses" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
LABEL_8:
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1717, @"Invalid parameter not satisfying: %@", @"fromAddress" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1718, @"Invalid parameter not satisfying: %@", @"bounds" object file lineNumber description];

      goto LABEL_5;
    }
  }
  __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1716, @"Invalid parameter not satisfying: %@", @"ccAddresses" object file lineNumber description];

  if (!v17) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v18) {
    goto LABEL_9;
  }
LABEL_5:
  id v20 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __116__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke;
  v26[3] = &unk_1E5B904B0;
  id v27 = v19;
  id v21 = v19;
  [v20 predictedToEmailAddressesWithToAddresses:v15 ccAddresses:v16 fromAddress:v17 date:v18 bounds:v26 completion:a6];
}

void __116__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  double v30 = a6;
  id v29 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  [(SGSuggestionsService *)self syncTimeout];
  __int16 v23 = objc_msgSend(v18, "waitUntilReturn:withTimeout:error:", &v25, a8);

  return v23;
}

void __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)*((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  uint64_t v7 = *((void *)a1 + 7);
  double v8 = a1[9];
  uint64_t v9 = *((void *)a1 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2;
  v11[3] = &unk_1E5B8EA70;
  id v12 = v3;
  id v10 = v3;
  [v4 predictedToEmailAddressesWithToAddresses:v5 ccAddresses:v6 fromAddress:v7 date:v9 bounds:v11 withCompletion:v8];
}

uint64_t __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1697, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContactDetailRecord: %@ %td", buf, 0x16u);
  }

  if (v6 == 1) {
    uint64_t v6 = [(SGSuggestionsService *)self _confirmRejectUI];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v10;
  id v13 = v10;
  [v12 rejectContactDetailRecord:v9 confirmRejectUI:v6 completion:v15];
}

void __77__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E5B8EF40;
  void v13[4] = self;
  id v14 = v8;
  int v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 rejectContactDetailRecord:v5 rejectionUI:v6 withCompletion:v8];
}

uint64_t __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectContactDetailRecord:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1686, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContactDetailRecord %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__SGSuggestionsService_rejectContactDetailRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 rejectContactDetailRecord:v7 confirmRejectUI:v11 completion:v14];
}

void __65__SGSuggestionsService_rejectContactDetailRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectContactDetailRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectContactDetailRecord:v4 withCompletion:v7];
}

uint64_t __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1673, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectRecord: %@ %td", buf, 0x16u);
  }

  if (v6 == 1) {
    uint64_t v6 = [(SGSuggestionsService *)self _confirmRejectUI];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__SGSuggestionsService_rejectRecord_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v10;
  id v13 = v10;
  [v12 rejectRecord:v9 confirmRejectUI:v6 completion:v15];
}

void __64__SGSuggestionsService_rejectRecord_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E5B8EF40;
  void v13[4] = self;
  id v14 = v8;
  int v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 rejectRecord:v5 rejectionUI:v6 withCompletion:v8];
}

uint64_t __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectRecord:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1662, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectRecord %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__SGSuggestionsService_rejectRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 rejectRecord:v7 confirmRejectUI:v11 completion:v14];
}

void __52__SGSuggestionsService_rejectRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __43__SGSuggestionsService_rejectRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_rejectRecord_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectRecord:v4 withCompletion:v7];
}

uint64_t __43__SGSuggestionsService_rejectRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectContact:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1651, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContact", buf, 2u);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__SGSuggestionsService_rejectContact_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 rejectContact:v7 confirmRejectUI:v11 completion:v14];
}

void __53__SGSuggestionsService_rejectContact_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __44__SGSuggestionsService_rejectContact_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_rejectContact_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectContact:v4 withCompletion:v7];
}

uint64_t __44__SGSuggestionsService_rejectContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectContact:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1637, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContact: %td", buf, 0xCu);
  }

  if (v6 == 1) {
    uint64_t v6 = [(SGSuggestionsService *)self _confirmRejectUI];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SGSuggestionsService_rejectContact_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v10;
  id v13 = v10;
  [v12 rejectContact:v9 confirmRejectUI:v6 completion:v15];
}

void __65__SGSuggestionsService_rejectContact_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectContact:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E5B8EF40;
  void v13[4] = self;
  id v14 = v8;
  int v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 rejectContact:v5 rejectionUI:v6 withCompletion:v8];
}

uint64_t __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteEventByRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1627, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-deleteEventByRecordId: %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_deleteEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v11 = v8;
  [v10 deleteEventByRecordId:v7 completion:v13];
}

void __61__SGSuggestionsService_deleteEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)deleteEventByRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 deleteEventByRecordId:v4 withCompletion:v7];
}

uint64_t __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectEventByRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1618, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-rejectEventByRecordId: %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_rejectEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v11 = v8;
  [v10 rejectEventByRecordId:v7 completion:v13];
}

void __61__SGSuggestionsService_rejectEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectEventByRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectEventByRecordId:v4 withCompletion:v7];
}

uint64_t __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmEventByRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1609, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-confirmEventByRecordId: %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_confirmEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v11 = v8;
  [v10 confirmEventByRecordId:v7 completion:v13];
}

void __62__SGSuggestionsService_confirmEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmEventByRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmEventByRecordId:v4 withCompletion:v7];
}

uint64_t __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1597, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  uint64_t v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContactDetailRecord: %td", buf, 0xCu);
  }

  if (v6 == 1) {
    uint64_t v6 = [(SGSuggestionsService *)self _confirmRejectUI];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_withCompletion___block_invoke;
  v15[3] = &unk_1E5B8EA20;
  id v16 = v10;
  id v13 = v10;
  [v12 confirmContactDetailRecord:v9 confirmRejectUI:v6 completion:v15];
}

void __81__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke;
  v13[3] = &unk_1E5B8EF40;
  void v13[4] = self;
  id v14 = v8;
  int v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  LOBYTE(self) = [v11 BOOLValue];

  return (char)self;
}

void __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke_2;
  v8[3] = &unk_1E5B90460;
  id v9 = v3;
  id v7 = v3;
  [v4 confirmContactDetailRecord:v5 confirmationUI:v6 withCompletion:v8];
}

uint64_t __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmContactDetailRecord:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1586, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContactDetailRecord", buf, 2u);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SGSuggestionsService_confirmContactDetailRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 confirmContactDetailRecord:v7 confirmRejectUI:v11 completion:v14];
}

void __66__SGSuggestionsService_confirmContactDetailRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmContactDetailRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmContactDetailRecord:v4 withCompletion:v7];
}

uint64_t __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmRecord:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1575, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmRecord %@", buf, 0xCu);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__SGSuggestionsService_confirmRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 confirmRecord:v7 confirmRejectUI:v11 completion:v14];
}

void __53__SGSuggestionsService_confirmRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __44__SGSuggestionsService_confirmRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_confirmRecord_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmRecord:v4 withCompletion:v7];
}

uint64_t __44__SGSuggestionsService_confirmRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmContact:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1564, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContact", buf, 2u);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  uint64_t v11 = [(SGSuggestionsService *)self _confirmRejectUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__SGSuggestionsService_confirmContact_withCompletion___block_invoke;
  v14[3] = &unk_1E5B8EA20;
  id v15 = v8;
  id v12 = v8;
  [v10 confirmContact:v7 confirmRejectUI:v11 completion:v14];
}

void __54__SGSuggestionsService_confirmContact_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __45__SGSuggestionsService_confirmContact_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SGSuggestionsService_confirmContact_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmContact:v4 withCompletion:v7];
}

uint64_t __45__SGSuggestionsService_confirmContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)_confirmRejectUI
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    unsigned int v4 = 1;
  }
  else if (([v3 isEqualToString:@"com.apple.mobilemail"] & 1) != 0 {
         || ([v3 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0)
  }
  {
    unsigned int v4 = 0;
  }
  else if ([v3 isEqualToString:@"com.apple.CoreSuggestions.suggest_tool"])
  {
    unsigned int v4 = 2;
  }
  else
  {
    unsigned int v4 = 4;
  }
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A4D8C000, v5, OS_LOG_TYPE_INFO, "SGSuggestionsServiceContactsConfirmRejectProtocol-_confirmRejectUI setting ui to %td", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)rejectEvent:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1534, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-rejectEvent", buf, 2u);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__SGSuggestionsService_rejectEvent_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v11 = v8;
  [v10 rejectEvent:v7 completion:v13];
}

void __51__SGSuggestionsService_rejectEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectEvent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __42__SGSuggestionsService_rejectEvent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SGSuggestionsService_rejectEvent_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectEvent:v4 withCompletion:v7];
}

uint64_t __42__SGSuggestionsService_rejectEvent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmEvent:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1525, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  uint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-confirmEvent", buf, 2u);
  }

  id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__SGSuggestionsService_confirmEvent_withCompletion___block_invoke;
  v13[3] = &unk_1E5B8EA20;
  id v14 = v8;
  id v11 = v8;
  [v10 confirmEvent:v7 completion:v13];
}

void __52__SGSuggestionsService_confirmEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmEvent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __43__SGSuggestionsService_confirmEvent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_confirmEvent_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmEvent:v4 withCompletion:v7];
}

uint64_t __43__SGSuggestionsService_confirmEvent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)originFromRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1514, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SGSuggestionsService_originFromRecordId_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 originFromRecordId:v7 completion:v13];
  }
}

void __58__SGSuggestionsService_originFromRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)originFromRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __49__SGSuggestionsService_originFromRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_originFromRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B8EF18;
  id v8 = v3;
  id v6 = v3;
  [v5 originFromRecordId:v4 withCompletion:v7];
}

uint64_t __49__SGSuggestionsService_originFromRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1504, @"Invalid parameter not satisfying: %@", @"launchInfo" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 launchAppForSuggestedEventUsingLaunchInfo:v7 completion:v12];
}

void __81__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 launchAppForSuggestedEventUsingLaunchInfo:v4 withCompletion:v7];
}

uint64_t __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 withCompletion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1488, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v22 = v16;
      _os_log_impl(&dword_1A4D8C000, v15, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v14) {
      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
  }
  else
  {
    id v17 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __110__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_withCompletion___block_invoke;
    v19[3] = &unk_1E5B904B0;
    id v20 = v14;
    [v17 launchInfoForSuggestedEventWithUniqueIdentifier:v11 sourceURL:v12 clientLocale:v13 ignoreUserActivitySupport:0 ignoreMailCheck:0 completion:v19];
  }
}

void __110__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v17 = objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v19, a6);

  return v17;
}

void __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke_2;
  v9[3] = &unk_1E5B8EEC8;
  id v10 = v3;
  id v8 = v3;
  [v4 launchInfoForSuggestedEventWithUniqueIdentifier:v5 sourceURL:v7 clientLocale:v6 withCompletion:v9];
}

uint64_t __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eventFromUniqueId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1479, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__SGSuggestionsService_eventFromUniqueId_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 eventFromUniqueId:v7 completion:v13];
  }
}

void __57__SGSuggestionsService_eventFromUniqueId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)eventFromUniqueId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke_2;
  v7[3] = &unk_1E5B8EEA0;
  id v8 = v3;
  id v6 = v3;
  [v5 eventFromUniqueId:v4 withCompletion:v7];
}

uint64_t __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)eventFromRecordID:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1469, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__SGSuggestionsService_eventFromRecordID_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 eventFromRecordId:v7 withCompletion:v13];
  }
}

void __57__SGSuggestionsService_eventFromRecordID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)eventFromRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __48__SGSuggestionsService_eventFromRecordID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SGSuggestionsService_eventFromRecordID_error___block_invoke_2;
  v7[3] = &unk_1E5B8EEA0;
  id v8 = v3;
  id v6 = v3;
  [v5 eventFromRecordID:v4 withCompletion:v7];
}

uint64_t __48__SGSuggestionsService_eventFromRecordID_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1458, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      v8[2](v8, &unk_1EF92F6A0, 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__SGSuggestionsService_emailAddressIsSignificant_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 emailAddressIsSignificant:v7 withCompletion:v13];
  }
}

void __65__SGSuggestionsService_emailAddressIsSignificant_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)emailAddressIsSignificant:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke_2;
  v7[3] = &unk_1E5B8EE78;
  id v8 = v3;
  id v6 = v3;
  [v5 emailAddressIsSignificant:v4 withCompletion:v7];
}

uint64_t __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1448, @"Invalid parameter not satisfying: %@", @"recordIds" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__SGSuggestionsService_cnContactMatchesForRecordIds_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 cnContactMatchesForRecordIds:v7 withCompletion:v13];
  }
}

void __68__SGSuggestionsService_cnContactMatchesForRecordIds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)cnContactMatchesForRecordIds:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 cnContactMatchesForRecordIds:v4 withCompletion:v7];
}

uint64_t __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1438, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SGSuggestionsService_cnContactMatchesForRecordId_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 cnContactMatchesForRecordId:v7 withCompletion:v13];
  }
}

void __67__SGSuggestionsService_cnContactMatchesForRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)cnContactMatchesForRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 cnContactMatchesForRecordId:v4 withCompletion:v7];
}

uint64_t __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactFromRecordID:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1428, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__SGSuggestionsService_contactFromRecordID_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 contactFromRecordId:v7 withCompletion:v13];
  }
}

void __59__SGSuggestionsService_contactFromRecordID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactFromRecordID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __50__SGSuggestionsService_contactFromRecordID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SGSuggestionsService_contactFromRecordID_error___block_invoke_2;
  v7[3] = &unk_1E5B8EE50;
  id v8 = v3;
  id v6 = v3;
  [v5 contactFromRecordID:v4 withCompletion:v7];
}

uint64_t __50__SGSuggestionsService_contactFromRecordID_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contactFromRecordID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1422, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v6 = [(SGSuggestionsService *)self contactFromRecordID:v5 error:0];

  return v6;
}

- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1406, @"Invalid parameter not satisfying: %@", @"detail" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else if ([v7 isEqualToString:&stru_1EF915628])
  {
    uint64_t v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Suggestions interactionStoreLookupForDetail with an empty parameter", buf, 2u);
    }

    if (v8) {
      (*((void (**)(id, __CFString *, void))v8 + 2))(v8, &stru_1EF915628, 0);
    }
  }
  else
  {
    id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__SGSuggestionsService_interactionStoreLookupForDetail_withCompletion___block_invoke;
    v14[3] = &unk_1E5B904B0;
    id v15 = v8;
    [v12 interactionStoreLookupForDetail:v7 withCompletion:v14];
  }
}

void __71__SGSuggestionsService_interactionStoreLookupForDetail_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)interactionStoreLookupForDetail:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke_2;
  v7[3] = &unk_1E5B8EC50;
  id v8 = v3;
  id v6 = v3;
  [v5 interactionStoreLookupForDetail:v4 withCompletion:v7];
}

uint64_t __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 response1];
  uint64_t v4 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_586(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v4, OS_LOG_TYPE_DEBUG, "namesForDetail: in [cacheFuture wait:] callback", buf, 2u);
  }

  id v5 = sgLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A4D8C000, v5, OS_LOG_TYPE_DEBUG, "namesForDetail: got a snapshot in [cacheFuture wait:] callback", buf, 2u);
    }

    id v7 = v3[1];
    id v8 = v3[2];
    id v9 = v3[3];
    if (_entitlements_block_invoke__pasOnceToken67 != -1) {
      dispatch_once(&_entitlements_block_invoke__pasOnceToken67, &__block_literal_global_589);
    }
    id v10 = (id)_entitlements_block_invoke__pasExprOnceResult;
    if (_entitlements_block_invoke__pasOnceToken68 != -1) {
      dispatch_once(&_entitlements_block_invoke__pasOnceToken68, &__block_literal_global_593);
    }
    id v11 = (id)_entitlements_block_invoke__pasExprOnceResult_591;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_3;
    v37[3] = &__block_descriptor_33_e46_v24__0__NSObject_OS_dispatch_queue__8___v___16l;
    char v38 = *(unsigned char *)(a1 + 72);
    id v12 = (void (**)(void, void, void))MEMORY[0x1A62654A0](v37);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_4;
    v28[3] = &unk_1E5B8EE00;
    id v29 = *(id *)(a1 + 32);
    id v13 = v8;
    id v30 = v13;
    id v14 = v7;
    id v31 = v14;
    id v15 = v12;
    id v34 = v15;
    id v16 = v11;
    id v32 = v16;
    char v36 = *(unsigned char *)(a1 + 73);
    id v17 = v9;
    id v33 = v17;
    id v35 = *(id *)(a1 + 56);
    ((void (**)(void, id, void *))v12)[2](v15, v10, v28);
    if ((atomic_exchange((atomic_uchar *volatile)_entitlements_block_invoke_reportingFlag, 1u) & 1) == 0)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_6;
      v27[3] = &unk_1E5B90528;
      v27[4] = *(void *)(a1 + 40);
      [MEMORY[0x1E4F93B18] runAsyncOnQueue:v16 afterDelaySeconds:v27 block:10.0];
    }
  }
  else
  {
    if (v6)
    {
      id v24 = [*(id *)(a1 + 48) error];
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_debug_impl(&dword_1A4D8C000, v5, OS_LOG_TYPE_DEBUG, "namesForDetail: falling back to asking for detail individually because we failed to get a snapshot in [cacheFuture wait:] callback (error: %@)", buf, 0xCu);
    }
    uint64_t v18 = (void *)[*(id *)(a1 + 40) _remoteSuggestionManager];
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 73);
    uint64_t v21 = *(unsigned __int8 *)(a1 + 74);
    uint64_t v22 = *(unsigned __int8 *)(a1 + 75);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_605;
    v25[3] = &unk_1E5B904B0;
    uint64_t v23 = *(void *)(a1 + 64);
    id v26 = *(id *)(a1 + 56);
    [v18 namesForDetail:v19 limitTo:v23 prependMaybe:v20 onlySignificant:v21 supportsInfoLookup:v22 withCompletion:v25];

    id v14 = v26;
  }
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_6(uint64_t a1)
{
  atomic_store(0, _entitlements_block_invoke_reportingFlag);
  if (__PAIR128__(_entitlements_block_invoke_foundCount, _entitlements_block_invoke_notFoundCount) != 0)
  {
    id v1 = (void *)[*(id *)(a1 + 32) _remoteSuggestionManager];
    [v1 logUnknownContactInformationShownCount:_entitlements_block_invoke_foundCount notShownCount:_entitlements_block_invoke_notFoundCount bundleId:0];

    _entitlements_block_invoke_foundCount = 0;
    _entitlements_block_invoke_notFoundCount = 0;
  }
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_605(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 response1];
  uint64_t v4 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_587()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("namesForUnknownDetail-norm", v1);
  id v3 = (void *)_entitlements_block_invoke__pasExprOnceResult;
  _entitlements_block_invoke__pasExprOnceResult = (uint64_t)v2;
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  id v20 = v14;
  unint64_t v21 = a4;
  BOOL v22 = a5;
  BOOL v23 = a6;
  BOOL v24 = a7;
  id v16 = v14;
  [(SGSuggestionsService *)self syncTimeout];
  id v17 = objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", &v19, a8);

  return v17;
}

void __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 58);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke_2;
  v11[3] = &unk_1E5B8EA70;
  id v12 = v3;
  id v10 = v3;
  [v4 namesForDetail:v5 limitTo:v6 prependMaybe:v7 onlySignificant:v8 supportsInfoLookup:v9 withCompletion:v11];
}

uint64_t __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v18 = v12;
  unint64_t v19 = a4;
  BOOL v20 = a5;
  BOOL v21 = a6;
  id v14 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v15 = objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v17, a7);

  return v15;
}

void __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 57);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke_2;
  void v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 namesForDetail:v5 limitTo:v6 prependMaybe:v7 onlySignificant:v8 withCompletion:v10];
}

uint64_t __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v10;
  unint64_t v17 = a4;
  BOOL v18 = a5;
  id v12 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v13 = objc_msgSend(v11, "waitUntilReturn:withTimeout:error:", &v15, a6);

  return v13;
}

void __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke_2;
  v9[3] = &unk_1E5B8EA70;
  id v10 = v3;
  id v8 = v3;
  [v4 namesForDetail:v5 limitTo:v6 prependMaybe:v7 withCompletion:v9];
}

uint64_t __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_572(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2210;
  id v31 = __Block_byref_object_dispose__2211;
  id v32 = 0;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__2210;
  uint64_t v25 = __Block_byref_object_dispose__2211;
  id v26 = 0;
  dispatch_queue_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: now on future work queue", buf, 2u);
  }

  id v3 = (void *)[*(id *)(a1 + 32) _daemonConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_573;
  v20[3] = &unk_1E5B8ECC8;
  void v20[4] = &v21;
  uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_2;
  v19[3] = &unk_1E5B8ECF0;
  void v19[4] = &v27;
  [v4 namesForDetailCacheSnapshotsWithCompletion:v19];

  uint64_t v5 = v28[5];
  if (v22[5])
  {
    if (v5) {
      __assert_rtn("-[SGSuggestionsService cacheSnapshotFuture]_block_invoke_3", "SGSuggestionsService.m", 1222, "error == nil || response == nil");
    }
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v22[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v17;
      _os_log_debug_impl(&dword_1A4D8C000, v6, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: got xpc response with error %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) disassociateFromParentObject];
    [*(id *)(a1 + 40) fail:v22[5]];
  }
  else if (v5)
  {
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A4D8C000, v7, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: got xpc response with snapshot", buf, 2u);
    }

    id v8 = objc_opt_new();
    uint64_t v9 = [(id)v28[5] response1];
    id v10 = (void *)v8[2];
    v8[2] = v9;

    uint64_t v11 = [(id)v28[5] response2];
    id v12 = (void *)v8[1];
    v8[1] = v11;

    uint64_t v13 = [(id)v28[5] response3];
    id v14 = (void *)v8[3];
    v8[3] = v13;

    [*(id *)(a1 + 40) succeed:v8];
    uint64_t v15 = (void *)MEMORY[0x1E4F93B18];
    id v16 = dispatch_get_global_queue(17, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_578;
    v18[3] = &unk_1E5B90528;
    void v18[4] = *(void *)(a1 + 32);
    [v15 runAsyncOnQueue:v16 afterDelaySeconds:v18 block:10.0];
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_573(uint64_t a1, void *a2)
{
}

uint64_t __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_578(uint64_t a1)
{
  dispatch_queue_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: expired the snapshot", v4, 2u);
  }

  return [*(id *)(a1 + 32) _clearHarvestStoreCache];
}

- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1198, @"Invalid parameter not satisfying: %@", @"interval" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__SGSuggestionsService_celebrationExtractionsForInterval_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 celebrationExtractionsForInterval:v7 withCompletion:v13];
  }
}

void __73__SGSuggestionsService_celebrationExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)celebrationExtractionsForInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 celebrationExtractionsForInterval:v4 withCompletion:v7];
}

uint64_t __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1188, @"Invalid parameter not satisfying: %@", @"interval" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__SGSuggestionsService_birthdayExtractionsForInterval_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 birthdayExtractionsForInterval:v7 withCompletion:v13];
  }
}

void __70__SGSuggestionsService_birthdayExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)birthdayExtractionsForInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 birthdayExtractionsForInterval:v4 withCompletion:v7];
}

uint64_t __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 withCompletion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1166, @"Invalid parameter not satisfying: %@", @"userIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1167, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      BOOL v24 = v13;
      _os_log_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v11) {
      (*((void (**)(id, void, void))v11 + 2))(v11, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v14 = [SGSocialProfile alloc];
    uint64_t v15 = +[SGExtractionInfo extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
    id v16 = +[SGRecordId recordIdWithNumericValue:-1];
    uint64_t v17 = [(SGSocialProfile *)v14 initWithUsername:0 userIdentifier:v9 bundleIdentifier:v10 displayName:0 service:0 teamIdentifier:0 label:0 extractionInfo:v15 recordId:v16];

    id v18 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_withCompletion___block_invoke;
    v21[3] = &unk_1E5B904B0;
    id v22 = v11;
    [v18 contactMatchesBySocialProfile:v17 withCompletion:v21];
  }
}

void __86__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SGSuggestionsService *)self _daemonConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E5B8ECA0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v13 = objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);

  return v13;
}

void __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 contactMatchesBySocialProfile:v5 bundleIdentifier:v6 withCompletion:v8];
}

uint64_t __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1156, @"Invalid parameter not satisfying: %@", @"socialProfile" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__SGSuggestionsService_contactMatchesBySocialProfile_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 contactMatchesBySocialProfile:v7 withCompletion:v13];
  }
}

void __69__SGSuggestionsService_contactMatchesBySocialProfile_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesBySocialProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 contactMatchesBySocialProfile:v4 withCompletion:v7];
}

uint64_t __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1146, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__SGSuggestionsService_contactMatchesByEmailAddress_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 contactMatchesByEmailAddress:v7 withCompletion:v13];
  }
}

void __68__SGSuggestionsService_contactMatchesByEmailAddress_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesByEmailAddress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 contactMatchesByEmailAddress:v4 withCompletion:v7];
}

uint64_t __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contactMatchesByEmailAddress:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1140, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  id v6 = [(SGSuggestionsService *)self contactMatchesByEmailAddress:v5 error:0];

  return v6;
}

- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1130, @"Invalid parameter not satisfying: %@", @"phoneNumber" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SGSuggestionsService_contactMatchesByPhoneNumber_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v8;
    [v11 contactMatchesByPhoneNumber:v7 withCompletion:v13];
  }
}

void __67__SGSuggestionsService_contactMatchesByPhoneNumber_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesByPhoneNumber:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 contactMatchesByPhoneNumber:v4 withCompletion:v7];
}

uint64_t __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)contactMatchesByPhoneNumber:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1124, @"Invalid parameter not satisfying: %@", @"phoneNumber" object file lineNumber description];
  }
  id v6 = [(SGSuggestionsService *)self contactMatchesByPhoneNumber:v5 error:0];

  return v6;
}

- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1113, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SGSuggestionsService.m" lineNumber:1114 description:@"Passing 0 for options would return nothing"];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_withCompletion___block_invoke;
  v15[3] = &unk_1E5B904B0;
  id v16 = v10;
  id v12 = v10;
  [v11 harvestedSuggestionsFromSearchableItem:v9 options:a4 withCompletion:v15];
}

void __86__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 harvestedSuggestionsFromSearchableItem:v5 options:v6 withCompletion:v8];
}

uint64_t __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)extractAttributesAndDonate:(id)a3 withCompletion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = [v6 bundleID];
    int v9 = [v8 isEqualToString:@"com.apple.mobilemail"];

    if (!v9
      || ([v6 attributeSet],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 HTMLContentDataNoCopy],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unint64_t v12 = [v11 length],
          v11,
          v10,
          v12 < 0xC8001))
    {
      uint64_t v13 = [v6 attributeSet];
      id v14 = [v13 contentCreationDate];

      if (v14 && ([v14 timeIntervalSinceNow], v15 <= -31536000.0))
      {
        id v22 = [NSString alloc];
        uint64_t v23 = [v14 description];
        uint64_t v17 = (void *)[v22 initWithFormat:@"Content date: %@ Rejecting as expired", v23];

        BOOL v24 = sgLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v33 = (unint64_t)v17;
          _os_log_impl(&dword_1A4D8C000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        if (v7)
        {
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          id v30 = @"message";
          id v31 = v17;
          id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          uint64_t v27 = [v25 errorWithDomain:@"SGErrorDomain" code:13 userInfo:v26];
          v7[2](v7, 0, v27);
        }
      }
      else
      {
        id v16 = [(SGSuggestionsService *)self _remoteSuggestionManager];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __66__SGSuggestionsService_extractAttributesAndDonate_withCompletion___block_invoke;
        v28[3] = &unk_1E5B904B0;
        uint64_t v29 = v7;
        [v16 extractAttributesAndDonate:v6 withCompletion:v28];

        uint64_t v17 = v29;
      }

      goto LABEL_19;
    }
    uint64_t v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v33 = v12;
      __int16 v34 = 2048;
      uint64_t v35 = 819200;
      _os_log_impl(&dword_1A4D8C000, v21, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
    }

    if (v7)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v19 = &unk_1EF92F890;
      uint64_t v20 = 8;
      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    unint64_t v19 = &unk_1EF92F868;
    uint64_t v20 = 0;
LABEL_9:
    id v14 = [v18 errorWithDomain:@"SGErrorDomain" code:v20 userInfo:v19];
    v7[2](v7, 0, v14);
LABEL_19:
  }
}

void __66__SGSuggestionsService_extractAttributesAndDonate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)extractAttributesAndDonate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  int v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __57__SGSuggestionsService_extractAttributesAndDonate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SGSuggestionsService_extractAttributesAndDonate_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 extractAttributesAndDonate:v4 withCompletion:v7];
}

uint64_t __57__SGSuggestionsService_extractAttributesAndDonate_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1041, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"SGSuggestionsService.m" lineNumber:1042 description:@"Passing 0 for options would return nothing"];

LABEL_3:
  uint64_t v13 = [v11 bundleID];

  if (!v13)
  {
    id v14 = [MEMORY[0x1E4F28B50] mainBundle];
    double v15 = [v14 bundleIdentifier];
    [v11 setBundleID:v15];
  }
  id v16 = [v11 attributeSet];
  uint64_t v17 = [v16 HTMLContentDataNoCopy];
  unint64_t v18 = [v17 length];

  if (v18 <= 0xC8000)
  {
    id v21 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __92__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_withCompletion___block_invoke;
    v24[3] = &unk_1E5B904B0;
    id v25 = v12;
    [v21 suggestionsFromSearchableItem:v11 options:a4 processingType:a5 withCompletion:v24];

    uint64_t v20 = v25;
    goto LABEL_11;
  }
  unint64_t v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v27 = v18;
    __int16 v28 = 2048;
    uint64_t v29 = 819200;
    _os_log_impl(&dword_1A4D8C000, v19, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:8 userInfo:&unk_1EF92F840];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v20);
LABEL_11:
  }
}

void __92__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = v10;
  unint64_t v17 = a4;
  unint64_t v18 = a5;
  id v12 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  uint64_t v13 = objc_msgSend(v11, "waitUntilReturn:withTimeout:error:", &v15, a6);

  return v13;
}

void __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke_2;
  v9[3] = &unk_1E5B8EA70;
  id v10 = v3;
  id v8 = v3;
  [v4 suggestionsFromSearchableItem:v5 options:v7 processingType:v6 withCompletion:v9];
}

uint64_t __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 1015, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"SGSuggestionsService.m" lineNumber:1016 description:@"Passing 0 for options would return nothing"];

LABEL_3:
  id v11 = [v9 bundleID];

  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v13 = [v12 bundleIdentifier];
    [v9 setBundleID:v13];
  }
  id v14 = [v9 attributeSet];
  uint64_t v15 = [v14 HTMLContentDataNoCopy];
  unint64_t v16 = [v15 length];

  if (v16 <= 0xC8000)
  {
    id v19 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__SGSuggestionsService_suggestionsFromSearchableItem_options_withCompletion___block_invoke;
    v22[3] = &unk_1E5B904B0;
    id v23 = v10;
    [v19 suggestionsFromSearchableItem:v9 options:a4 withCompletion:v22];

    unint64_t v18 = v23;
    goto LABEL_11;
  }
  unint64_t v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = 819200;
    _os_log_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v10)
  {
    unint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:8 userInfo:&unk_1EF92F818];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
LABEL_11:
  }
}

void __77__SGSuggestionsService_suggestionsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 suggestionsFromSearchableItem:v5 options:v6 withCompletion:v8];
}

uint64_t __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 990, @"Invalid parameter not satisfying: %@", @"htmlContent" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_15:
      id v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 992, @"Invalid parameter not satisfying: %@", @"sourceId" object file lineNumber description];

      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 991, @"Invalid parameter not satisfying: %@", @"rfc822Headers" object file lineNumber description];

  if (!v15) {
    goto LABEL_15;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_16:
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"SGSuggestionsService.m" lineNumber:993 description:@"Passing 0 for options would return nothing"];

LABEL_5:
  if ((unint64_t)[v13 length] <= 0xC8000)
  {
    id v19 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __90__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke;
    v24[3] = &unk_1E5B904B0;
    id v25 = v16;
    [v19 suggestionsFromEmailContent:v13 headers:v14 source:v15 options:a6 withCompletion:v24];

    unint64_t v18 = v25;
    goto LABEL_11;
  }
  unint64_t v17 = sgLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = [v13 length];
    __int16 v28 = 2048;
    uint64_t v29 = 819200;
    _os_log_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v16)
  {
    unint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:8 userInfo:&unk_1EF92F7F0];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v18);
LABEL_11:
  }
}

void __90__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(SGSuggestionsService *)self _daemonConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke;
  v21[3] = &unk_1E5B8EC00;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  unint64_t v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v19 = objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);

  return v19;
}

void __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke_2;
  void v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 suggestionsFromEmailContent:v5 headers:v6 source:v7 options:v8 withCompletion:v10];
}

uint64_t __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F93B10] isClassCLocked];
  id v9 = sgLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsService getting all Deliveries", buf, 2u);
    }

    id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__SGSuggestionsService_allDeliveriesWithLimit_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v7;
    [v12 allDeliveriesWithLimit:a3 withCompletion:v13];
  }
}

void __62__SGSuggestionsService_allDeliveriesWithLimit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)allDeliveriesWithLimit:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  int v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 allDeliveriesWithLimit:v4 withCompletion:v7];
}

uint64_t __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sgRemindersLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsService logging user created reminder title", buf, 2u);
  }

  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__SGSuggestionsService_logUserCreatedReminderTitle_withCompletion___block_invoke;
  v11[3] = &unk_1E5B8EA20;
  id v12 = v6;
  id v10 = v6;
  [v9 logUserCreatedReminderTitle:v7 withCompletion:v11];
}

void __67__SGSuggestionsService_logUserCreatedReminderTitle_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)logUserCreatedReminderTitle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 logUserCreatedReminderTitle:v4 withCompletion:v7];
}

uint64_t __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sgRemindersLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsService detecting reminder for content", buf, 2u);
  }

  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SGSuggestionsService_reminderTitleForContent_withCompletion___block_invoke;
  v11[3] = &unk_1E5B904B0;
  id v12 = v6;
  id v10 = v6;
  [v9 reminderTitleForContent:v7 withCompletion:v11];
}

void __63__SGSuggestionsService_reminderTitleForContent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)reminderTitleForContent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);

  return v9;
}

void __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke_2;
  v7[3] = &unk_1E5B8EC50;
  id v8 = v3;
  id v6 = v3;
  [v5 reminderTitleForContent:v4 withCompletion:v7];
}

uint64_t __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v10 = sgRemindersLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsService getting all reminders", buf, 2u);
    }

    id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SGSuggestionsService_allRemindersLimitedTo_withCompletion___block_invoke;
    v12[3] = &unk_1E5B904B0;
    id v13 = v7;
    [v11 allRemindersLimitedTo:a3 withCompletion:v12];
  }
}

void __61__SGSuggestionsService_allRemindersLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)allRemindersLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 allRemindersLimitedTo:v4 withCompletion:v7];
}

uint64_t __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reminderAlarmTriggeredForRecordId:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 938, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__SGSuggestionsService_reminderAlarmTriggeredForRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 reminderAlarmTriggeredForRecordId:v7 completion:v12];
}

void __73__SGSuggestionsService_reminderAlarmTriggeredForRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)reminderAlarmTriggeredForRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 reminderAlarmTriggeredForRecordId:v4 withCompletion:v7];
}

uint64_t __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectRealtimeReminder:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 930, @"Invalid parameter not satisfying: %@", @"reminder" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_rejectRealtimeReminder_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 rejectRealtimeReminder:v7 completion:v12];
}

void __62__SGSuggestionsService_rejectRealtimeReminder_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectRealtimeReminder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectRealtimeReminder:v4 withCompletion:v7];
}

uint64_t __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rejectReminderByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 922, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SGSuggestionsService_rejectReminderByRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 rejectReminderByRecordId:v7 completion:v12];
}

void __64__SGSuggestionsService_rejectReminderByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rejectReminderByRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 rejectReminderByRecordId:v4 withCompletion:v7];
}

uint64_t __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmRealtimeReminder:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 914, @"Invalid parameter not satisfying: %@", @"reminder" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SGSuggestionsService_confirmRealtimeReminder_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 confirmRealtimeReminder:v7 completion:v12];
}

void __63__SGSuggestionsService_confirmRealtimeReminder_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmRealtimeReminder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmRealtimeReminder:v4 withCompletion:v7];
}

uint64_t __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmReminderByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 906, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];
  }
  id v9 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SGSuggestionsService_confirmReminderByRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E5B8EA20;
  id v13 = v8;
  id v10 = v8;
  [v9 confirmReminderByRecordId:v7 completion:v12];
}

void __65__SGSuggestionsService_confirmReminderByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)confirmReminderByRecordId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v8 = v6;
  [(SGSuggestionsService *)self syncTimeout];
  id v9 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  LOBYTE(self) = [v9 BOOLValue];

  return (char)self;
}

void __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v5 confirmReminderByRecordId:v4 withCompletion:v7];
}

uint64_t __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__SGSuggestionsService_allEventsLimitedTo_withCompletion___block_invoke;
    v11[3] = &unk_1E5B904B0;
    id v12 = v7;
    [v10 allEventsLimitedTo:a3 withCompletion:v11];
  }
}

void __58__SGSuggestionsService_allEventsLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)allEventsLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 allEventsLimitedTo:v4 withCompletion:v7];
}

uint64_t __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SGSuggestionsService_suggestEventsInFutureLimitTo_withCompletion___block_invoke;
    v11[3] = &unk_1E5B904B0;
    id v12 = v7;
    [v10 eventsInFutureLimitTo:a3 options:0 withCompletion:v11];
  }
}

void __68__SGSuggestionsService_suggestEventsInFutureLimitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 suggestEventsInFutureLimitTo:v4 withCompletion:v7];
}

uint64_t __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 withCompletion:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_12:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 878, @"Invalid parameter not satisfying: %@", @"end" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 877, @"Invalid parameter not satisfying: %@", @"start" object file lineNumber description];

  if (!v14) {
    goto LABEL_12;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_13:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 879, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];

LABEL_4:
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    uint64_t v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v18;
      _os_log_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v16) {
      (*((void (**)(id, void, void))v16 + 2))(v16, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v19 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_withCompletion___block_invoke;
    v23[3] = &unk_1E5B904B0;
    id v24 = v16;
    [v19 eventsStartingAt:v13 endingAt:v14 prefix:v15 limitTo:a6 options:0 withCompletion:v23];
  }
}

void __87__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(SGSuggestionsService *)self _daemonConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke;
  v21[3] = &unk_1E5B8EC00;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  unint64_t v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v19 = objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);

  return v19;
}

void __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = a1[8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke_2;
  void v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 suggestEventsStartingAt:v5 endingAt:v6 prefix:v7 limitTo:v8 withCompletion:v10];
}

uint64_t __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 866, @"Invalid parameter not satisfying: %@", @"start" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 867, @"Invalid parameter not satisfying: %@", @"end" object file lineNumber description];

LABEL_3:
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl(&dword_1A4D8C000, v14, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v16 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_withCompletion___block_invoke;
    v19[3] = &unk_1E5B904B0;
    id v20 = v13;
    [v16 eventsStartingAt:v11 endingAt:v12 limitTo:a5 options:0 withCompletion:v19];
  }
}

void __80__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v18 = v10;
  id v19 = v11;
  unint64_t v20 = a5;
  id v13 = v11;
  id v14 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v15 = objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);

  return v15;
}

void __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke_2;
  v9[3] = &unk_1E5B8EA70;
  id v10 = v3;
  id v8 = v3;
  [v4 suggestEventsStartingAt:v5 endingAt:v7 limitTo:v6 withCompletion:v9];
}

uint64_t __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__SGSuggestionsService_suggestEventsInFutureLimitTo_options_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v9;
    [v12 eventsInFutureLimitTo:a3 options:v5 withCompletion:v13];
  }
}

void __76__SGSuggestionsService_suggestEventsInFutureLimitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 error:(id *)a5
{
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke;
  v12[3] = &unk_1E5B8EBD8;
  void v12[4] = self;
  v12[5] = a3;
  unsigned int v13 = a4;
  [(SGSuggestionsService *)self syncTimeout];
  id v10 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);

  return v10;
}

void __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 suggestEventsInFutureLimitTo:v5 options:v6 withCompletion:v8];
}

uint64_t __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 846, @"Invalid parameter not satisfying: %@", @"end" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 845, @"Invalid parameter not satisfying: %@", @"start" object file lineNumber description];

  if (!v16) {
    goto LABEL_12;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_13:
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 847, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];

LABEL_4:
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      __int16 v28 = v20;
      _os_log_impl(&dword_1A4D8C000, v19, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v18) {
      (*((void (**)(id, void, void))v18 + 2))(v18, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v21 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_withCompletion___block_invoke;
    v25[3] = &unk_1E5B904B0;
    id v26 = v18;
    [v21 eventsStartingAt:v15 endingAt:v16 prefix:v17 limitTo:a6 options:v9 withCompletion:v25];
  }
}

void __95__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  unint64_t v27 = a6;
  unsigned int v28 = a7;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [(SGSuggestionsService *)self syncTimeout];
  id v21 = objc_msgSend(v17, "waitUntilReturn:withTimeout:error:", &v23, a8);

  return v21;
}

void __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(unsigned int *)(a1 + 72);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke_2;
  v11[3] = &unk_1E5B8EA70;
  id v12 = v3;
  id v10 = v3;
  [v4 suggestEventsStartingAt:v5 endingAt:v6 prefix:v7 limitTo:v8 options:v9 withCompletion:v11];
}

uint64_t __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 834, @"Invalid parameter not satisfying: %@", @"start" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 835, @"Invalid parameter not satisfying: %@", @"end" object file lineNumber description];

LABEL_3:
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_1A4D8C000, v16, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v15) {
      (*((void (**)(id, void, void))v15 + 2))(v15, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v18 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_withCompletion___block_invoke;
    v21[3] = &unk_1E5B904B0;
    id v22 = v15;
    [v18 eventsStartingAt:v13 endingAt:v14 limitTo:a5 options:v8 withCompletion:v21];
  }
}

void __88__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [(SGSuggestionsService *)self _daemonConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke;
  v19[3] = &unk_1E5B8EB88;
  void v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  unint64_t v22 = a5;
  unsigned int v23 = a6;
  id v15 = v13;
  id v16 = v12;
  [(SGSuggestionsService *)self syncTimeout];
  id v17 = objc_msgSend(v14, "waitUntilReturn:withTimeout:error:", v19, a7);

  return v17;
}

void __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned int *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke_2;
  void v10[3] = &unk_1E5B8EA70;
  id v11 = v3;
  id v9 = v3;
  [v4 suggestEventsStartingAt:v5 endingAt:v6 limitTo:v7 options:v8 withCompletion:v10];
}

uint64_t __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithCompletion:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  id v8 = v11;
  id v9 = v7;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 828, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    id v8 = 0;
  }
  [(SGSuggestionsService *)self waitForEventWithIdentifier:v8 toAppearInEventStoreWithLastModificationDate:0 completion:v9];
}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 818, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__SGSuggestionsService_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke;
  v15[3] = &unk_1E5B904B0;
  id v16 = v11;
  id v13 = v11;
  [v12 waitForEventWithIdentifier:v9 toAppearInEventStoreWithLastModificationDate:v10 completion:v15];
}

void __107__SGSuggestionsService_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 response1];
  uint64_t v4 = [v6 BOOLValue];
  uint64_t v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
}

- (BOOL)deregisterEventsChangeObserverWithToken:(id)a3
{
  return [a3 unsubscribe];
}

- (id)registerEventsChangeObserver:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SGNotificationListener alloc] initWithNotification:@"com.apple.suggestions.eventsDidChange" callback:v3];

  return v4;
}

- (BOOL)deregisterContactsChangeObserverWithToken:(id)a3
{
  return [a3 unsubscribe];
}

void __55__SGSuggestionsService_registerContactsChangeObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _clearHarvestStoreCache];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_clearHarvestStoreCache
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj;
  snapshotFuture = obj->_snapshotFuture;
  if (snapshotFuture)
  {
    [(SGFuture *)snapshotFuture disassociateFromParentObject];
    uint64_t v4 = obj->_snapshotFuture;
    obj->_snapshotFuture = 0;

    uint64_t v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v12 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__SGSuggestionsService_allContactsWithSnippets_limitTo_withCompletion___block_invoke;
    v13[3] = &unk_1E5B904B0;
    id v14 = v9;
    [v12 allContactsWithSnippets:v6 limitTo:a4 withCompletion:v13];
  }
}

void __71__SGSuggestionsService_allContactsWithSnippets_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke;
  v12[3] = &unk_1E5B8EB38;
  BOOL v13 = a3;
  void v12[4] = self;
  v12[5] = a4;
  [(SGSuggestionsService *)self syncTimeout];
  id v10 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);

  return v10;
}

void __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v6 allContactsWithSnippets:v4 limitTo:v5 withCompletion:v8];
}

uint64_t __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allContactsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v10 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SGSuggestionsService_allContactsLimitedTo_withCompletion___block_invoke;
    v11[3] = &unk_1E5B904B0;
    id v12 = v7;
    [v10 allContactsWithSnippets:1 limitTo:a3 withCompletion:v11];
  }
}

void __60__SGSuggestionsService_allContactsLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)allContactsLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);

  return v8;
}

void __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E5B8EA70;
  id v8 = v3;
  id v6 = v3;
  [v5 allContactsLimitedTo:v4 withCompletion:v7];
}

uint64_t __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 751, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E5B904B0;
    id v16 = v10;
    [v13 contactMatchesWithMessagingPrefix:v9 limitTo:a4 withCompletion:v15];
  }
}

void __88__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 suggestContactMatchesWithMessagingPrefix:v5 limitTo:v6 withCompletion:v8];
}

uint64_t __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 741, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E5B904B0;
    id v16 = v10;
    [v13 contactMatchesWithFullTextSearch:v9 limitTo:a4 withCompletion:v15];
  }
}

void __87__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 suggestContactMatchesWithFullTextSearch:v5 limitTo:v6 withCompletion:v8];
}

uint64_t __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 731, @"Invalid parameter not satisfying: %@", @"contactIdentifiers" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E5B904B0;
    id v16 = v10;
    [v13 contactMatchesWithContactIdentifiers:v9 limitTo:a4 withCompletion:v15];
  }
}

void __84__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 contactMatchesWithContactIdentifiers:v5 limitTo:v6 withCompletion:v8];
}

uint64_t __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 721, @"Invalid parameter not satisfying: %@", @"contactIdentifier" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E5B904B0;
    id v16 = v10;
    [v13 contactMatchesWithContactIdentifier:v9 limitTo:a4 withCompletion:v15];
  }
}

void __83__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 contactMatchesWithContactIdentifier:v5 limitTo:v6 withCompletion:v8];
}

uint64_t __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 711, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);
    }
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    id v13 = [(SGSuggestionsService *)self _remoteSuggestionManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__SGSuggestionsService_contactMatchesWithContact_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E5B904B0;
    id v16 = v10;
    [v13 contactMatchesWithContact:v9 limitTo:a4 withCompletion:v15];
  }
}

void __73__SGSuggestionsService_contactMatchesWithContact_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 contactMatchesWithContact:v5 limitTo:v6 withCompletion:v8];
}

uint64_t __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 702, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  id v11 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke;
  v14[3] = &unk_1E5B904B0;
  id v15 = v10;
  id v12 = v10;
  [v11 dissectAttachmentsFromSearchableItem:v9 options:a4 withCompletion:v14];
}

void __84__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(SGSuggestionsService *)self _daemonConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E5B8EAE8;
  void v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v10 = v8;
  [(SGSuggestionsService *)self syncTimeout];
  id v11 = objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);

  return v11;
}

void __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E5B8EA70;
  id v9 = v3;
  id v7 = v3;
  [v4 dissectAttachmentsFromSearchableItem:v5 options:v6 withCompletion:v8];
}

uint64_t __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 688, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 689, @"Invalid parameter not satisfying: %@", @"headers" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke;
  v20[3] = &unk_1E5B8EAC0;
  void v20[4] = self;
  id v21 = v11;
  id v23 = v13;
  unint64_t v24 = a5;
  id v22 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v14 clearCachesFully:1 withCompletion:v20];
}

void __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _remoteSuggestionManager];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2;
  v6[3] = &unk_1E5B904B0;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 suggestionsFromSimpleMailMessage:v3 headers:v4 options:v5 withCompletion:v6];
}

void __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v18 = v10;
  id v19 = v11;
  unint64_t v20 = a5;
  id v13 = v11;
  id v14 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v15 = objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);

  return v15;
}

void __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke_2;
  v9[3] = &unk_1E5B8EA70;
  id v10 = v3;
  id v8 = v3;
  [v4 suggestionsFromSimpleMailMessage:v5 headers:v7 options:v6 withCompletion:v9];
}

uint64_t __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 672, @"Invalid parameter not satisfying: %@", @"rfc822Data" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGSuggestionsService.m", 673, @"Invalid parameter not satisfying: %@", @"sourceId" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke;
  v20[3] = &unk_1E5B8EAC0;
  void v20[4] = self;
  id v21 = v11;
  id v23 = v13;
  unint64_t v24 = a5;
  id v22 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v14 clearCachesFully:1 withCompletion:v20];
}

void __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _remoteSuggestionManager];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke_2;
  v6[3] = &unk_1E5B904B0;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 suggestionsFromRFC822Data:v3 source:v4 options:v5 withCompletion:v6];
}

void __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 response1];
    uint64_t v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

- (id)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SGSuggestionsService *)self _daemonConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  id v18 = v10;
  id v19 = v11;
  unint64_t v20 = a5;
  id v13 = v11;
  id v14 = v10;
  [(SGSuggestionsService *)self syncTimeout];
  id v15 = objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);

  return v15;
}

void __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke_2;
  v9[3] = &unk_1E5B8EA70;
  id v10 = v3;
  id v8 = v3;
  [v4 suggestionsFromRFC822Data:v5 source:v7 options:v6 withCompletion:v9];
}

uint64_t __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SGSuggestionsService_clearCachesFully_withCompletion___block_invoke;
  v9[3] = &unk_1E5B8EA20;
  id v10 = v6;
  id v8 = v6;
  [v7 clearCachesFully:v4 withCompletion:v9];
}

void __56__SGSuggestionsService_clearCachesFully_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)clearCachesFully:(BOOL)a3 error:(id *)a4
{
  id v7 = [(SGSuggestionsService *)self _daemonConnection];
  LOBYTE(v12) = a3;
  [(SGSuggestionsService *)self syncTimeout];
  id v8 = objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  char v9 = [v8 BOOLValue];

  return v9;
}

void __47__SGSuggestionsService_clearCachesFully_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SGSuggestionsService_clearCachesFully_error___block_invoke_2;
  v7[3] = &unk_1E5B90460;
  id v8 = v3;
  id v6 = v3;
  [v4 clearCachesFully:v5 withCompletion:v7];
}

uint64_t __47__SGSuggestionsService_clearCachesFully_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rebuildNamesForDetailCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SGSuggestionsService_rebuildNamesForDetailCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 rebuildNamesForDetailCache:v7];
}

void __65__SGSuggestionsService_rebuildNamesForDetailCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)rebuildNamesForDetailCache:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 rebuildNamesForDetailCacheWithCompletion:v6];
}

uint64_t __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetConfirmationAndRejectionHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SGSuggestionsService_resetConfirmationAndRejectionHistoryWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 resetConfirmationAndRejectionHistory:v7];
}

void __75__SGSuggestionsService_resetConfirmationAndRejectionHistoryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)resetConfirmationAndRejectionHistory:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 resetConfirmationAndRejectionHistoryWithCompletion:v6];
}

uint64_t __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareForRealtimeExtractionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SGSuggestionsService *)self _remoteSuggestionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SGSuggestionsService_prepareForRealtimeExtractionWithCompletion___block_invoke;
  v7[3] = &unk_1E5B8EA20;
  id v8 = v4;
  id v6 = v4;
  [v5 prepareForRealtimeExtraction:v7];
}

void __67__SGSuggestionsService_prepareForRealtimeExtractionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (BOOL)prepareForRealtimeExtraction:(id *)a3
{
  id v4 = self;
  id v5 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = v4;
  [(SGSuggestionsService *)v4 syncTimeout];
  id v6 = objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  LOBYTE(v4) = [v6 BOOLValue];

  return (char)v4;
}

void __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke_2;
  v6[3] = &unk_1E5B90460;
  id v7 = v3;
  id v5 = v3;
  [v4 prepareForRealtimeExtractionWithCompletion:v6];
}

uint64_t __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)queuesRequestsIfBusy
{
  return self->_queuesRequestsIfBusy;
}

- (BOOL)isEnabledWithError:(id *)a3
{
  id v4 = [(SGSuggestionsService *)self _daemonConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SGSuggestionsService_isEnabledWithError___block_invoke;
  v8[3] = &unk_1E5B8E9D0;
  void v8[4] = self;
  [(SGSuggestionsService *)self syncTimeout];
  id v5 = objc_msgSend(v4, "waitUntilReturn:withTimeout:error:", v8, 0);
  char v6 = [v5 BOOLValue];

  return v6;
}

void __43__SGSuggestionsService_isEnabledWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[*(id *)(a1 + 32) _remoteSuggestionManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SGSuggestionsService_isEnabledWithError___block_invoke_2;
  v6[3] = &unk_1E5B904B0;
  id v7 = v3;
  id v5 = v3;
  [v4 isEnabledWithCompletion:v6];
}

void __43__SGSuggestionsService_isEnabledWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v9 = [v3 error];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_error_impl(&dword_1A4D8C000, v5, OS_LOG_TYPE_ERROR, "Error! %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [v3 response1];
  id v8 = [v3 error];
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
}

- (void)setManagerForTesting:(id)a3
{
}

- (double)syncTimeout
{
  p_syncTimeoutLock = &self->_syncTimeoutLock;
  pthread_mutex_lock(&self->_syncTimeoutLock);
  double syncTimeout = self->_syncTimeout;
  pthread_mutex_unlock(p_syncTimeoutLock);
  return syncTimeout;
}

+ (BOOL)isHarvestingSupported
{
  return 1;
}

+ (void)prepareForQuery
{
  notify_post((const char *)[@"com.apple.suggestions.prepareForQuery" UTF8String]);
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SGSuggestionsService_prepareForQuery__block_invoke;
  v4[3] = &unk_1E5B8E9F8;
  v4[4] = &v5;
  [&unk_1EF92F7C8 enumerateKeysAndObjectsUsingBlock:v4];
  if (!*((unsigned char *)v6 + 24))
  {
    uint64_t v2 = sgLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v3 = 0;
      _os_log_error_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_ERROR, "Unable to boost for prepareForQuery due to no suitable entitlement being available", v3, 2u);
    }
  }
  _Block_object_dispose(&v5, 8);
}

void __39__SGSuggestionsService_prepareForQuery__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (+[SGSuggestionsService hasEntitlement:a3])
  {
    char v8 = [[SGSuggestionsService alloc] initWithMachServiceName:v7 protocol:&unk_1EF9374C0 useCache:0];
    char v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_DEBUG, "prepareForQuery -- beginning keepDirty", buf, 2u);
    }

    [(SGSuggestionsService *)v8 keepDirty:1];
    int v10 = (void *)MEMORY[0x1E4F93B18];
    uint64_t v11 = dispatch_get_global_queue(-2, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__SGSuggestionsService_prepareForQuery__block_invoke_449;
    v13[3] = &unk_1E5B90528;
    id v14 = v8;
    uint64_t v12 = v8;
    [v10 runAsyncOnQueue:v11 afterDelaySeconds:v13 block:5.0];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __39__SGSuggestionsService_prepareForQuery__block_invoke_449(uint64_t a1)
{
  uint64_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_DEBUG, "prepareForQuery -- ending keepDirty", v4, 2u);
  }

  return [*(id *)(a1 + 32) keepDirty:0];
}

+ (id)serviceForSpotlightKnowledge
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.spotlightknowledged" protocol:&unk_1EF937038];

  return v2;
}

+ (id)serviceForMessages
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

+ (id)serviceForFides
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.fides" protocol:&unk_1EF936FA8];

  return v2;
}

+ (id)serviceForInternal
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.internal" protocol:&unk_1EF936D68];

  return v2;
}

+ (id)serviceForIpsos
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.ipsos" protocol:&unk_1EF9365F0];

  return v2;
}

+ (id)serviceForDeliveries
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.deliveries" protocol:&unk_1EF936528];

  return v2;
}

+ (id)serviceForReminders
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.reminders" protocol:&unk_1EF9364A0];

  return v2;
}

+ (id)serviceForEvents
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.events" protocol:&unk_1EF9362F0];

  return v2;
}

+ (id)serviceForMail
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithMachServiceName:@"com.apple.suggestd.mail" protocol:&unk_1EF935AA0];

  return v2;
}

+ (void)setInProcessSuggestManager:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&_inProcessSuggestManagerLock);
  id v4 = (void *)_inProcessSuggestManager;
  _inProcessSuggestManager = (uint64_t)v3;

  pthread_mutex_unlock(&_inProcessSuggestManagerLock);
}

@end