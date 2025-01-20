@interface PHRecentsController
+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4;
- (BOOL)canLoadOlderRecentCalls;
- (BOOL)isInitializationBlockQueued;
- (BOOL)isLocalizedSubtitleUnknown:(id)a3;
- (BOOL)startedLoadingOlderCalls;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (MPAnalyticsLogger)analyticsLogger;
- (NSArray)recentCalls;
- (NSCache)callProviderCache;
- (NSMapTable)delegateToQueue;
- (NSMutableDictionary)contactCache;
- (NSMutableDictionary)itemCache;
- (NSMutableDictionary)localizedSubtitleCache;
- (NSNumberFormatter)numberFormatter;
- (NSPredicate)preFetchingPredicate;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialQueue;
- (PHRecentsController)init;
- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7;
- (TUCallHistoryController)callHistoryController;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (TUSubtitleProvider)subtitleProvider;
- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4;
- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactForHandle:(id)a3;
- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactHandlesForHandle:(id)a3;
- (id)contactHandlesForRecentCalls:(id)a3;
- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)dialRequestForRecentCall:(id)a3;
- (id)fetchCallProviderForRecentCall:(id)a3;
- (id)fetchContactForContactCardDisplay:(id)a3;
- (id)fetchContactFormatter;
- (id)fetchImageForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)fetchNumberFormatter;
- (id)fetchRecentCalls;
- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)itemForRecentCall:(id)a3;
- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4;
- (id)localizedSubtitleForRecentCall:(id)a3;
- (id)localizedSubtitleForRecentEmergencyCall:(id)a3;
- (id)metadataItemsForRecentCall:(id)a3;
- (id)presentScreenTimeShield;
- (id)recentCallsChangedFromCachedRecentCalls:(id)a3 callHistoryControllerRecentCalls:(id)a4;
- (id)subtitleForRecentEmergencyCall:(id)a3;
- (id)unknownLabel;
- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)callHistoryControllerCoalescingStrategy;
- (unint64_t)callHistoryControllerOptions;
- (unint64_t)unreadCallCount;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)cancelSearchFetchOperations;
- (void)checkRecentMissedCallCount;
- (void)continuousScrollingReachedIndexPath:(int64_t)a3;
- (void)dealloc;
- (void)deleteAllRecentCalls;
- (void)deleteRecentCalls:(id)a3;
- (void)fetchContactsForHandles:(id)a3;
- (void)fetchContactsForRecentCalls:(id)a3;
- (void)fetchMetadataForRecentCalls:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3;
- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3;
- (void)loadOlderCallsIfNecessaryForRemainingRowCount:(int64_t)a3;
- (void)logRecentsScrollingEvent:(int64_t)a3;
- (void)markRecentAudioCallsAsRead;
- (void)markRecentCallsAsRead;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didCompleteFetchingCalls:(id)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4;
- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3;
- (void)performDialRequest:(id)a3;
- (void)performDialRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4;
- (void)performSynchronousBlock:(id)a3;
- (void)populateCachesForRecentCalls:(id)a3;
- (void)populateItemCacheForRecentCalls:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)recentCallsWillShow;
- (void)removeDelegate:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3;
- (void)setContactFormatter:(id)a3;
- (void)setInitializationBlockQueued:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setPresentScreenTimeShield:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setStartedLoadingOlderCalls:(BOOL)a3;
- (void)setUnreadCallCount:(unint64_t)a3;
- (void)updateRecentCalls;
@end

@implementation PHRecentsController

- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  v8 = objc_alloc_init(PHMutableRecentsItem);
  v9 = [v6 validRemoteParticipantHandles];
  uint64_t v10 = (uint64_t)[v9 count];
  uint64_t v11 = (uint64_t)[v6 countOfExcludedHandles];
  uint64_t v12 = v11;
  if (!v10 && v11 >= 1)
  {
    if (v11 == 1)
    {
      v13 = TUBundle();
      id v47 = [v13 localizedStringForKey:@"ONE_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
    }
    else
    {
      v39 = TUBundle();
      [v39 localizedStringForKey:@"%@_OTHERS" value:&stru_100285990 table:@"TelephonyUtilities"];
      v40 = id v169 = v6;
      [(PHRecentsController *)self numberFormatter];
      v42 = v41 = v8;
      v43 = +[NSNumber numberWithInteger:v12];
      [v42 stringFromNumber:v43];
      unint64_t v44 = a4;
      v46 = v45 = v9;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v45;
      a4 = v44;

      v8 = v41;
      id v6 = v169;
    }
    id v17 = 0;
    goto LABEL_81;
  }
  v165 = v8;
  v166 = v9;
  if (v10 <= 1)
  {
    v14 = [v9 anyObject];
    v179[0] = _NSConcreteStackBlock;
    v179[1] = 3221225472;
    v179[2] = __72__PHRecentsController_fetchMutableItemForRecentCall_numberOfOccurences___block_invoke;
    v179[3] = &unk_10027E798;
    v179[4] = self;
    v179[5] = v12;
    v15 = objc_retainBlock(v179);
    if (v14)
    {
      [(PHRecentsController *)self contactHandlesForHandle:v14];
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
      if (v17)
      {
        v167 = v14;
        unint64_t v163 = a4;
        uint64_t v18 = *(void *)v176;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v176 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v175 + 1) + 8 * i);
            v21 = [(PHRecentsController *)self contactCache];
            v22 = [v21 objectForKeyedSubscript:v20];
            v23 = [v22 value];

            if (v23)
            {
              v48 = [(PHRecentsController *)self contactFormatter];
              v49 = [v48 stringFromContact:v23];
              ((void (*)(void *, void *))v15[2])(v15, v49);
              id v47 = (id)objc_claimAutoreleasedReturnValue();

              v50 = [(PHRecentsController *)self contactFormatter];
              id v17 = [v50 stringFromContact:v23];

              goto LABEL_38;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        id v47 = 0;
LABEL_38:
        a4 = v163;
        v14 = v167;
      }
      else
      {
        id v47 = 0;
      }
    }
    else
    {
      id v17 = 0;
      id v47 = 0;
    }
    v79 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (![v47 length] && (objc_msgSend(v79, "isTelephonyProvider") & 1) == 0)
    {
      v80 = [v6 name];
      uint64_t v81 = ((void (*)(void *, void *))v15[2])(v15, v80);

      uint64_t v82 = [v6 name];

      id v17 = (id)v82;
      id v47 = (id)v81;
    }
    if (![v47 length])
    {
      v83 = [v6 callerIdForDisplay];
      uint64_t v84 = ((void (*)(void *, void *))v15[2])(v15, v83);

      uint64_t v85 = [v6 callerIdForDisplay];

      id v17 = (id)v85;
      id v47 = (id)v84;
    }
    if (![v47 length])
    {
      unsigned int v86 = [v6 callerIdIsBlocked];
      v87 = +[NSBundle mainBundle];
      v88 = v87;
      v170 = v14;
      unint64_t v89 = a4;
      v90 = v6;
      if (v86) {
        CFStringRef v91 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v91 = @"UNKNOWN_CALLER";
      }
      v92 = [v87 localizedStringForKey:v91 value:&stru_100285990 table:@"PHRecents"];
      uint64_t v93 = ((void (*)(void *, void *))v15[2])(v15, v92);

      LODWORD(v92) = [v90 callerIdIsBlocked];
      v94 = +[NSBundle mainBundle];
      v95 = v94;
      if (v92) {
        CFStringRef v96 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v96 = @"UNKNOWN_CALLER";
      }
      uint64_t v97 = [v94 localizedStringForKey:v96 value:&stru_100285990 table:@"PHRecents"];

      id v17 = (id)v97;
      id v47 = (id)v93;
      id v6 = v90;
      a4 = v89;
      v14 = v170;
    }

    v8 = v165;
    v9 = v166;
    goto LABEL_81;
  }
  uint64_t v160 = v11;
  unint64_t v164 = a4;
  v168 = v6;
  v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v25 = v9;
  id v26 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  if (!v26) {
    goto LABEL_30;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v172;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v172 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void *)(*((void *)&v171 + 1) + 8 * (void)j);
      v31 = [(PHRecentsController *)self contactForHandle:v30];
      if (v31)
      {
        v32 = [(PHRecentsController *)self contactFormatter];
        v33 = [v32 stringFromContact:v31];

        if (v33)
        {
          [v24 addObject:v33];
          goto LABEL_28;
        }
        v34 = [v168 isoCountryCode];
        v35 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v34];
        [v24 addObject:v35];
      }
      else
      {
        v33 = [v168 isoCountryCode];
        v34 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v33];
        [v24 addObject:v34];
      }

LABEL_28:
    }
    id v27 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  }
  while (v27);
LABEL_30:

  v36 = +[NSMutableString string];
  uint64_t v37 = (uint64_t)[v24 count];
  if (v37 == 3)
  {
    v156 = v36;
    if (v160 == 1)
    {
      v108 = TUBundle();
      [v108 localizedStringForKey:@"%@_%@_%@_AND_ONE_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
      v110 = v109 = v36;
      v111 = [v24 objectAtIndexedSubscript:0];
      v112 = [v24 objectAtIndexedSubscript:1];
      v113 = [v24 objectAtIndexedSubscript:2];
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v110, v111, v112, v113);

      v114 = v109;
    }
    else
    {
      if (!v160)
      {
        v51 = TUBundle();
        v52 = [v51 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
        v53 = [v24 objectAtIndexedSubscript:0];
        v54 = [v24 objectAtIndexedSubscript:1];
        v55 = [v24 objectAtIndexedSubscript:2];
        v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v53, v54, v55);
        [v156 appendString:v56];

LABEL_73:
        a4 = v164;

        v123 = TUBundle();
        v124 = [v123 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
        v125 = [v24 objectAtIndexedSubscript:0];
        v126 = [v24 objectAtIndexedSubscript:1];
        v127 = [v24 objectAtIndexedSubscript:2];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v124, v125, v126, v127);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        v8 = v165;
        v9 = v166;
        v36 = v156;
        goto LABEL_77;
      }
      v154 = TUBundle();
      uint64_t v115 = [v154 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHERS" value:&stru_100285990 table:@"TelephonyUtilities"];
      v116 = [v24 objectAtIndexedSubscript:0];
      v117 = [v24 objectAtIndexedSubscript:1];
      v118 = [v24 objectAtIndexedSubscript:2];
      v119 = [(PHRecentsController *)self numberFormatter];
      v120 = +[NSNumber numberWithInteger:v160];
      v121 = [v119 stringFromNumber:v120];
      v122 = (void *)v115;
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v115, v116, v117, v118, v121);

      v114 = v156;
    }
    [v114 appendString:v51];
    goto LABEL_73;
  }
  v9 = v166;
  if (v37 == 2)
  {
    if (v160 == 1)
    {
      v57 = TUBundle();
      v58 = [v57 localizedStringForKey:@"%@_%@_AND_ONE_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
      v59 = [v24 objectAtIndexedSubscript:0];
      v60 = [v24 objectAtIndexedSubscript:1];
      v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      a4 = v164;
    }
    else
    {
      a4 = v164;
      TUBundle();
      if (v160) {
        v155 = {;
      }
        v58 = [v155 localizedStringForKey:@"%@_%@_AND_%@_OTHERS" value:&stru_100285990 table:@"TelephonyUtilities"];
        v59 = [v24 objectAtIndexedSubscript:0];
        v60 = [v24 objectAtIndexedSubscript:1];
        v128 = [(PHRecentsController *)self numberFormatter];
        +[NSNumber numberWithInteger:v160];
        v129 = v159 = v36;
        v130 = [v128 stringFromNumber:v129];
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60, v130);

        v57 = v155;
        v36 = v159;
      }
      else {
        v57 = {;
      }
        v58 = [v57 localizedStringForKey:@"%@_AND_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
        v59 = [v24 objectAtIndexedSubscript:0];
        v60 = [v24 objectAtIndexedSubscript:1];
        v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      }
    }

    [v36 appendString:v61];
    TUBundle();
    v132 = v131 = v36;
    v133 = [v132 localizedStringForKey:@"%@_AND_%@" value:&stru_100285990 table:@"TelephonyUtilities"];
    v134 = [v24 objectAtIndexedSubscript:0];
    v135 = [v24 objectAtIndexedSubscript:1];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v133, v134, v135);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v36 = v131;
    v8 = v165;
    v9 = v166;
  }
  else if (v37 == 1)
  {
    a4 = v164;
    if (v160 == 1)
    {
      v38 = TUBundle();
      [v38 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
      v99 = v98 = v36;
      v100 = [v24 objectAtIndexedSubscript:0];
      v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v99, v100);
      [v98 appendString:v101];

      v36 = v98;
    }
    else
    {
      if (v160)
      {
        v102 = TUBundle();
        v103 = [v102 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_100285990 table:@"TelephonyUtilities"];
        [v24 objectAtIndexedSubscript:0];
        v104 = v158 = v36;
        v105 = [(PHRecentsController *)self numberFormatter];
        v106 = +[NSNumber numberWithInteger:v160];
        v107 = [v105 stringFromNumber:v106];
        v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v103, v104, v107);

        v9 = v166;
        v36 = v158;
      }
      else
      {
        v38 = [v24 objectAtIndexedSubscript:0];
      }
      [v36 appendString:v38];
    }

    id v17 = [v24 objectAtIndexedSubscript:0];
    v8 = v165;
  }
  else
  {
    if (v37 < 4)
    {
      id v17 = 0;
    }
    else
    {
      v62 = (char *)[v24 count] + v160 - 3;
      v161 = TUBundle();
      uint64_t v63 = [v161 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
      v64 = [v24 objectAtIndexedSubscript:0];
      v65 = [v24 objectAtIndexedSubscript:1];
      v66 = [v24 objectAtIndexedSubscript:2];
      [(PHRecentsController *)self numberFormatter];
      v67 = v157 = v36;
      v68 = +[NSNumber numberWithUnsignedInteger:v62];
      v69 = [v67 stringFromNumber:v68];
      v70 = (void *)v63;
      v71 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65, v66, v69);
      [v157 appendString:v71];

      v162 = TUBundle();
      v72 = [v162 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
      v73 = [v24 objectAtIndexedSubscript:0];
      v74 = [v24 objectAtIndexedSubscript:1];
      v75 = [v24 objectAtIndexedSubscript:2];
      v76 = [(PHRecentsController *)self numberFormatter];
      v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v24 count] - 3);
      v78 = [v76 stringFromNumber:v77];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v72, v73, v74, v75, v78);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      v36 = v157;
      v9 = v166;
    }
    a4 = v164;
    v8 = v165;
  }
LABEL_77:
  if ([v36 length]) {
    id v47 = [v36 copy];
  }
  else {
    id v47 = 0;
  }

  id v6 = v168;
LABEL_81:
  v136 = [v6 date];
  [(PHRecentsItem *)v8 setDate:v136];

  v137 = [(PHRecentsItem *)v8 image];

  if (!v137)
  {
    v138 = [(PHRecentsController *)self fetchImageForRecentCall:v6];
    [(PHRecentsItem *)v8 setImage:v138];
  }
  if (a4 <= 1)
  {
    [(PHRecentsItem *)v8 setLocalizedCount:0];
  }
  else
  {
    v139 = [(PHRecentsController *)self numberFormatter];
    v140 = +[NSNumber numberWithUnsignedInteger:a4];
    [v139 stringFromNumber:v140];
    v142 = id v141 = v6;
    v143 = +[NSString stringWithFormat:@"(%@)", v142];
    [(PHRecentsItem *)v8 setLocalizedCount:v143];

    id v6 = v141;
  }
  [(PHRecentsItem *)v8 setLocalizedTitle:v47];
  [(PHRecentsItem *)v8 setLocalizedValidHandlesTitle:v17];
  -[PHRecentsItem setVerified:](v8, "setVerified:", [v6 verificationStatus] == (id)1);
  if (+[PHDevice isGeminiCapable])
  {
    v144 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (objc_msgSend(v6, "ph_supportsLocalParticipantBadge"))
    {
      v145 = [v144 prioritizedSenderIdentities];
      id v146 = [v145 count];

      if ((unint64_t)v146 >= 2)
      {
        v147 = [(PHRecentsController *)self callProviderManager];
        v148 = [v147 telephonyProvider];
        v149 = [v6 localParticipantUUID];
        [v148 senderIdentityForAccountUUID:v149];
        v151 = id v150 = v6;

        v152 = [v151 localizedShortName];
        [(PHRecentsItem *)v8 setLocalizedSenderIdentityTitle:v152];

        id v6 = v150;
      }
    }
  }

  return v8;
}

- (id)contactHandlesForHandle:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  v5 = [v3 value];
  if ([v5 length])
  {
    [v4 addObject:v5];
    id v6 = [v3 normalizedValue];
    if ([v6 length])
    {
      v7 = [v3 value];
      unsigned __int8 v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0) {
        [v4 addObject:v6];
      }
    }
  }
  id v9 = [v4 copy];

  return v9;
}

- (id)fetchCallProviderForRecentCall:(id)a3
{
  id v5 = a3;
  id v6 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v6);

  v7 = [v5 serviceProvider];
  unsigned __int8 v8 = [(PHRecentsController *)self callProviderManager];
  if (v7)
  {
    id v9 = [(PHRecentsController *)self callProviderCache];
    uint64_t v10 = [v9 objectForKey:v7];

    if (v10) {
      goto LABEL_11;
    }
    uint64_t v11 = [v8 providerForRecentCall:v5];
    if (v11)
    {
      uint64_t v10 = (void *)v11;
      uint64_t v12 = [(PHRecentsController *)self callProviderCache];
      [v12 setObject:v10 forKey:v7];

      goto LABEL_11;
    }
    v15 = PHDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not retrieve a call provider for the specified recent call: %@", buf, 0xCu);
    }
  }
  else
  {
    v13 = +[NSString stringWithFormat:@"Service provider is nil for the specified recent call: %@", v5];
    NSLog(@"** TUAssertion failure: %@", v13);

    if (_TUAssertShouldCrashApplication())
    {
      v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PHRecentsController.m", 991, @"Service provider is nil for the specified recent call: %@", v5 object file lineNumber description];
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (NSCache)callProviderCache
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  callProviderCache = self->_callProviderCache;

  return callProviderCache;
}

- (NSMutableDictionary)contactCache
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactCache = self->_contactCache;

  return contactCache;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (TUCallProviderManager)callProviderManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_callProviderManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

id __72__PHRecentsController_fetchMutableItemForRecentCall_numberOfOccurences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 length]) {
    goto LABEL_6;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1)
  {
    id v5 = TUBundle();
    id v6 = [v5 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_100285990 table:@"TelephonyUtilities"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (v4 >= 2)
  {
    unsigned __int8 v8 = TUBundle();
    id v9 = [v8 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_100285990 table:@"TelephonyUtilities"];
    uint64_t v10 = [*(id *)(a1 + 32) numberFormatter];
    uint64_t v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    uint64_t v12 = [v10 stringFromNumber:v11];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v3, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v7 = v3;
  }
LABEL_7:

  return v7;
}

- (BOOL)isLocalizedSubtitleUnknown:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  id v7 = [v4 length];
  if (v7) {
    unsigned __int8 v8 = v6;
  }
  else {
    unsigned __int8 v8 = 1;
  }
  if (v6 && v7)
  {
    id v9 = [(PHRecentsController *)self unknownLabel];
    unsigned __int8 v8 = [v4 isEqualToString:v9];
  }
  return v8;
}

- (id)localizedSubtitleForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 wasEmergencyCall])
  {
    id v6 = [(PHRecentsController *)self subtitleForRecentEmergencyCall:v4];
    goto LABEL_95;
  }
  id v7 = [v4 blockedByExtension];

  if (v7)
  {
    unsigned __int8 v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"%@_BLOCKED_BY" value:&stru_100285990 table:@"PHRecents"];
    uint64_t v10 = [v4 localizedBlockedByExtensionName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_95;
  }
  uint64_t v11 = [v4 uniqueId];
  uint64_t v12 = [(PHRecentsController *)self featureFlags];
  unsigned int v13 = [v12 increaseCallHistoryEnabled];

  if (!v13)
  {
    v15 = 0;
LABEL_9:
    id v16 = [(PHRecentsController *)self featureFlags];
    unsigned int v17 = [v16 callHistorySearchEnabled];

    if (v17)
    {
      id v18 = [v4 remoteParticipantHandles];
      v19 = [v18 anyObject];

      if (v19)
      {
        [(PHRecentsController *)self contactHandlesForHandle:v19];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = [v20 countByEnumeratingWithState:&v89 objects:v94 count:16];
        if (v21)
        {
          v79 = v19;
          uint64_t v81 = v15;
          v83 = v11;
          uint64_t v22 = *(void *)v90;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v90 != v22) {
                objc_enumerationMutation(v20);
              }
              v24 = *(void **)(*((void *)&v89 + 1) + 8 * i);
              id v25 = [(PHRecentsController *)self contactCache];
              id v26 = [v25 objectForKeyedSubscript:v24];
              id v27 = [v26 value];

              if (v27)
              {
                id v21 = v24;
                goto LABEL_25;
              }
            }
            id v21 = [v20 countByEnumeratingWithState:&v89 objects:v94 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          id v27 = 0;
LABEL_25:
          v15 = v81;
          uint64_t v11 = v83;
          v19 = v79;
        }
        else
        {
          id v27 = 0;
        }
      }
      else
      {
        id v21 = 0;
        id v27 = 0;
      }
      v45 = [(PHRecentsController *)self subtitleProvider];
      v46 = [v45 localizedSubtitleForRecentCall:v4 handle:v21 contact:v27];

      if (![v46 length])
      {
        uint64_t v47 = [(PHRecentsController *)self unknownLabel];

        v46 = (void *)v47;
      }
      if (v11)
      {
        v48 = [(PHRecentsController *)self localizedSubtitleCache];
        [v48 setObject:v46 forKey:v11];
      }
      id v6 = v46;

      goto LABEL_94;
    }
    uint64_t v28 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v4];
    v29 = v28;
    if (!v28) {
      goto LABEL_88;
    }
    if ([v28 isFaceTimeProvider])
    {
      id v30 = [v4 mediaType];
      v31 = +[NSBundle mainBundle];
      v32 = v31;
      if (v30 == (id)2) {
        CFStringRef v33 = @"RECENTS_FACETIME_VIDEO";
      }
      else {
        CFStringRef v33 = @"RECENTS_FACETIME_AUDIO";
      }
      uint64_t v49 = [v31 localizedStringForKey:v33 value:&stru_100285990 table:@"PHRecents"];

      goto LABEL_57;
    }
    if (![v29 isTelephonyProvider])
    {
      id v50 = [v4 mediaType];
      if (v50 == (id)1)
      {
        CFStringRef v51 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_AUDIO";
      }
      else
      {
        if (v50 != (id)2)
        {
LABEL_88:
          if (![v15 length])
          {
            uint64_t v73 = [(PHRecentsController *)self unknownLabel];

            v15 = (void *)v73;
          }
          v74 = [(PHRecentsController *)self featureFlags];
          unsigned int v75 = [v74 increaseCallHistoryEnabled];

          if (v75 && v11)
          {
            v76 = [(PHRecentsController *)self localizedSubtitleCache];
            [v76 setObject:v15 forKey:v11];
          }
          id v6 = v15;

          goto LABEL_94;
        }
        CFStringRef v51 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_VIDEO";
      }
      v56 = +[NSBundle mainBundle];
      v57 = [v56 localizedStringForKey:v51 value:&stru_100285990 table:@"PHRecents"];
      v58 = [v29 localizedName];
      uint64_t v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v58);

LABEL_57:
      v15 = (void *)v49;
      goto LABEL_88;
    }
    v34 = [v4 remoteParticipantHandles];
    v35 = [v34 anyObject];

    if (v35)
    {
      v80 = v35;
      [(PHRecentsController *)self contactHandlesForHandle:v35];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v37 = [v36 countByEnumeratingWithState:&v85 objects:v93 count:16];
      if (v37)
      {
        id v38 = v37;
        v78 = v29;
        uint64_t v82 = v15;
        uint64_t v84 = v11;
        uint64_t v39 = *(void *)v86;
LABEL_31:
        uint64_t v40 = 0;
        while (1)
        {
          if (*(void *)v86 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v85 + 1) + 8 * v40);
          v42 = [(PHRecentsController *)self contactCache];
          v43 = [v42 objectForKeyedSubscript:v41];
          unint64_t v44 = [v43 value];

          if (v44) {
            break;
          }
          if (v38 == (id)++v40)
          {
            id v38 = [v36 countByEnumeratingWithState:&v85 objects:v93 count:16];
            if (v38) {
              goto LABEL_31;
            }
            v15 = v82;
            uint64_t v11 = v84;
            v29 = v78;
            goto LABEL_38;
          }
        }
        v35 = v80;
        id v52 = [v80 type];
        if (v52 == (id)3)
        {
          v53 = [v44 labeledValueForEmailAddress:v41];
          v54 = [v53 label];
          uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v54 propertyName:CNContactEmailAddressesKey];
          v15 = v82;
          v29 = v78;
        }
        else
        {
          v15 = v82;
          v29 = v78;
          if (v52 == (id)2)
          {
            v59 = [v4 isoCountryCode];
            v54 = +[CNPhoneNumber phoneNumberWithDigits:v41 countryCode:v59];

            if (v54)
            {
              v53 = [v44 labeledValueForPhoneNumber:v54];
            }
            else
            {
              v53 = 0;
            }
            uint64_t v60 = [v53 label];
            uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v60 propertyName:CNContactPhoneNumbersKey];

            v15 = (void *)v60;
          }
          else
          {
            if (v52 != (id)1)
            {
LABEL_64:

              uint64_t v11 = v84;
              goto LABEL_65;
            }
            v53 = [v44 labeledValueForSocialProfileWithUsername:v41];
            v54 = [v53 label];
            uint64_t v55 = +[CNLabeledValue localizedDisplayStringForLabel:v54 propertyName:CNContactSocialProfilesKey];
          }
        }

        v15 = (void *)v55;
        v35 = v80;
        goto LABEL_64;
      }
LABEL_38:
      v35 = v80;
LABEL_65:
    }
    if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
      && [v4 isJunk])
    {
      v61 = [v4 junkIdentificationCategory];
      if (v61)
      {
        v62 = [v4 junkIdentificationCategory];
      }
      else
      {
        v62 = @"MAYBE_JUNK";
      }

      uint64_t v63 = +[NSBundle mainBundle];
      uint64_t v64 = [v63 localizedStringForKey:v62 value:&stru_100285990 table:@"PHRecents"];

      v15 = (void *)v64;
    }
    if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
    {
      v65 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
      v66 = [v65 firstObject];

      if (v66)
      {
        v67 = [(PHRecentsController *)self metadataCache];
        v68 = [v67 metadataForDestinationID:v66];

        if (v68)
        {
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
            && ([v4 callerIdIsBlocked] & 1) == 0)
          {
            uint64_t v69 = [v68 metadataForProvider:objc_opt_class()];

            v15 = (void *)v69;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]
            && ([v4 callerIdIsBlocked] & 1) == 0)
          {
            uint64_t v70 = [v68 metadataForProvider:objc_opt_class()];

            v15 = (void *)v70;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
          {
            uint64_t v71 = [v68 metadataForProvider:objc_opt_class()];

            v15 = (void *)v71;
          }
          if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15])
          {
            uint64_t v72 = [v68 metadataForProvider:objc_opt_class()];

            v15 = (void *)v72;
          }
        }
      }
      else
      {
        v68 = 0;
      }
    }
    goto LABEL_88;
  }
  v14 = [(PHRecentsController *)self localizedSubtitleCache];
  v15 = [v14 objectForKey:v11];

  if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v15]) {
    goto LABEL_9;
  }
  id v6 = v15;
LABEL_94:

LABEL_95:

  return v6;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSMutableDictionary)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (TUSubtitleProvider)subtitleProvider
{
  return self->_subtitleProvider;
}

- (id)fetchImageForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 ttyType];
  if (v6 == (id)2)
  {
    uint64_t v7 = +[UIImage recentsTTYRelayGlyphImage];
LABEL_5:
    unsigned __int8 v8 = (void *)v7;
    if (v7) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    uint64_t v7 = +[UIImage recentsTTYDirectGlyphImage];
    goto LABEL_5;
  }
LABEL_6:
  unsigned int v9 = [v4 callStatus];
  if (v9 != kCHCallStatusConnectedOutgoing)
  {
    unsigned int v10 = [v4 callStatus];
    if (v10 != kCHCallStatusCancelled) {
      goto LABEL_11;
    }
  }
  id v11 = [v4 mediaType];
  if (v11 == (id)2)
  {
    uint64_t v12 = +[UIImage recentsOutgoingVideoCallGlyphImage];
    goto LABEL_13;
  }
  if (v11 != (id)1)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = +[UIImage recentsOutgoingAudioCallGlyphImage];
LABEL_13:
  unsigned __int8 v8 = (void *)v12;
LABEL_14:

  return v8;
}

- (NSNumberFormatter)numberFormatter
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  numberFormatter = self->_numberFormatter;

  return numberFormatter;
}

- (void)fetchContactsForHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        unsigned int v13 = [(PHRecentsController *)self contactCache];
        v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v15 = [(PHRecentsController *)self contactStore];
    id v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v6 count];
      *(_DWORD *)buf = 134218242;
      id v44 = v17;
      __int16 v45 = 2112;
      v46 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    id v18 = [v6 allObjects];
    id v32 = v7;
    if (_defaultContactsKeyDescriptors_onceToken != -1) {
      dispatch_once(&_defaultContactsKeyDescriptors_onceToken, &__block_literal_global_511);
    }
    v31 = v15;
    v19 = [v15 contactsForHandles:v18 keyDescriptors:_defaultContactsKeyDescriptors_keyDescriptors alwaysUnifyLabeledValues:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    CFStringRef v33 = v6;
    id obj = v6;
    id v20 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          id v25 = [v19 objectForKeyedSubscript:v24];
          id v26 = [v25 firstObject];
          if ((unint64_t)[v25 count] >= 2)
          {
            id v27 = PHDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v25 count];
              *(_DWORD *)buf = 134218498;
              id v44 = v28;
              __int16 v45 = 2112;
              v46 = v24;
              __int16 v47 = 2112;
              v48 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Found %lu contacts for contact handle %@; caching the first contact %@",
                buf,
                0x20u);
            }
          }
          id v29 = [objc_alloc((Class)TUOptionalObject) initWithValue:v26];
          id v30 = [(PHRecentsController *)self contactCache];
          [v30 setObject:v29 forKeyedSubscript:v24];
        }
        id v21 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v21);
    }

    id v7 = v32;
    id v6 = v33;
  }
}

- (void)populateItemCacheForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self itemCache];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v13 = -[PHRecentsController fetchMutableItemForRecentCall:](self, "fetchMutableItemForRecentCall:", v12, (void)v17);
        v14 = [(PHRecentsController *)self localizedSubtitleForRecentCall:v12];
        [v13 setLocalizedSubtitle:v14];

        id v15 = [v13 copy];
        id v16 = [v12 uniqueId];
        [v6 setObject:v15 forKeyedSubscript:v16];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)fetchMutableItemForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = -[PHRecentsController fetchMutableItemForRecentCall:numberOfOccurences:](self, "fetchMutableItemForRecentCall:numberOfOccurences:", v4, [v4 numberOfOccurrences]);

  return v6;
}

void __60__PHRecentsController_itemForRecentCall_numberOfOccurences___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemCache];
  v2 = [*(id *)(a1 + 40) uniqueId];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSMutableDictionary)itemCache
{
  uint64_t v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  itemCache = self->_itemCache;

  return itemCache;
}

- (CNContactStore)contactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v4 = self->_contactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (id)contactHandlesForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = [v10 validRemoteParticipantHandles];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = [(PHRecentsController *)self contactHandlesForHandle:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
              [v5 addObjectsFromArray:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v17 = [v5 array];

  return v17;
}

- (id)recentCallsChangedFromCachedRecentCalls:(id)a3 callHistoryControllerRecentCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v15 = [v14 uniqueId];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        long long v22 = [v21 uniqueId:v25];
        long long v23 = [v8 objectForKey:v22];

        if (!v23 || ([v23 isEqual:v21] & 1) == 0) {
          [v7 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  return v7;
}

+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  id v8 = 0;
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v6 objectAtIndexedSubscript:v9];
      if (v8 >= [v5 count])
      {
        id v11 = 0;
      }
      else
      {
        id v11 = [v5 objectAtIndexedSubscript:v8];
      }
      if ([v11 isEqual:v10])
      {
        ++v8;
      }
      else
      {
        uint64_t v12 = +[NSIndexPath indexPathForRow:v9 inSection:0];
        [v7 addObject:v12];
      }
      ++v9;
    }
    while (v9 < (unint64_t)[v6 count]);
  }
  if (v8 == [v5 count]) {
    id v13 = v7;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

id __59__PHRecentsController_continuousScrollingReachedIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logRecentsScrollingEvent:*(void *)(a1 + 40)];
}

- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(PHRecentsController *)self callHistoryController];
  unsigned __int8 v7 = [v5 isEqual:v6];

  id v8 = PHDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [v4 name];
      *(_DWORD *)buf = 138412802;
      id v15 = v10;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    id v8 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __85__PHRecentsController_handleTUCallHistoryControllerRecentCallsDidChangeNotification___block_invoke;
    block[3] = &unk_10027C670;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring calls change notification from different callHistoryController", buf, 2u);
  }
}

- (void)logRecentsScrollingEvent:(int64_t)a3
{
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if (!(a3 % 100))
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = +[NSNumber numberWithInteger:a3 / 100];
    [v9 setObject:v6 forKey:@"BucketedScrollingIndex"];

    [v9 setObject:&off_10028D040 forKey:@"AppName"];
    unsigned __int8 v7 = [(PHRecentsController *)self analyticsLogger];
    id v8 = [v9 copy];
    [v7 logEvent:@"com.apple.MobilePhone.RecentsScrollingIndex" withCoreAnalyticsDictionary:v8];
  }
}

- (MPAnalyticsLogger)analyticsLogger
{
  return self->_analyticsLogger;
}

void __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) fetchNumberFormatter];
  uint64_t v6 = *(void *)(a1 + 32);
  unsigned __int8 v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v5;

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  [*(id *)(a1 + 32) updateRecentCalls];
  [*(id *)(a1 + 32) setUnreadCallCount:[*(id *)(*(void *)(a1 + 32) + 24) unreadCallCount]];
  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleIDSServiceAvailabilityDidChangeNotification:" name:IDSServiceAvailabilityDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerRecentCallsDidChangeNotification:" name:TUCallHistoryControllerRecentCallsDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:" name:TUCallHistoryControllerUnreadCallCountDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:*(void *)(*(void *)(a1 + 32) + 104)];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationSignificantTimeChangeNotification:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1) {
    dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_35);
  }
  uint64_t v12 = (const char *)__CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = (int *)(v13 + 16);
  id v15 = *(NSObject **)(v13 + 48);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_2;
  handler[3] = &unk_10027E6F8;
  objc_copyWeak(&v18, &location);
  id v17 = *(id *)(a1 + 32);
  notify_register_dispatch(v12, v14, v15, handler);
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (unint64_t)unreadCallCount
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unint64_t unreadCallCount = self->_unreadCallCount;
  os_unfair_lock_unlock(p_accessorLock);
  return unreadCallCount;
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_unreadCallCount != a3)
  {
    self->_unint64_t unreadCallCount = a3;
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeUnreadCallCount:a3];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setInitializationBlockQueued:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3) {
    self->_initializationBlockQueued = v3;
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (id)fetchNumberFormatter
{
  uint64_t v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)NSNumberFormatter);

  return v3;
}

- (id)fetchContactFormatter
{
  uint64_t v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)CNContactFormatter);
  [v3 setStyle:0];

  return v3;
}

- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = -[PHRecentsController itemForRecentCall:numberOfOccurences:](self, "itemForRecentCall:numberOfOccurences:", v6, [v6 numberOfOccurrences]);
  id v8 = [v6 serviceProvider];
  if ([v8 isEqualToString:kCHServiceProviderTelephony])
  {
    uint64_t v9 = [v6 remoteParticipantHandles];
    id v10 = [v9 count];
    BOOL v11 = v10 != (id)1;

    if (!a4)
    {
      if (v10 == (id)1) {
        goto LABEL_11;
      }
LABEL_10:
      self = v7;
      goto LABEL_19;
    }
  }
  else
  {

    if (!a4) {
      goto LABEL_10;
    }
    BOOL v11 = 1;
  }
  uint64_t v12 = [v6 imageURL];
  if (v12)
  {

    goto LABEL_10;
  }
  if (v11) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v13 = [v6 remoteParticipantHandles];
  id v14 = [v13 anyObject];

  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = [v6 name];
  if (!v15) {
    goto LABEL_17;
  }
  __int16 v16 = (void *)v15;
  id v17 = [v6 name];
  id v18 = [v17 length];

  if (!v18) {
    goto LABEL_17;
  }
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__9;
  long long v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __59__PHRecentsController_itemForRecentCall_presentationStyle___block_invoke;
  v23[3] = &unk_10027CBB8;
  long long v25 = &v26;
  v23[4] = self;
  id v24 = v14;
  [(PHRecentsController *)self performSynchronousBlock:v23];
  uint64_t v19 = v27[5];
  if (!v19)
  {
    id v20 = [v7 mutableCopy];
    long long v21 = [v6 name];
    [v20 setLocalizedSubtitle:v21];

    self = (PHRecentsController *)[v20 copy];
  }

  _Block_object_dispose(&v26, 8);
  if (v19) {
LABEL_17:
  }
    self = v7;

LABEL_19:

  return self;
}

- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __60__PHRecentsController_itemForRecentCall_numberOfOccurences___block_invoke;
  v7[3] = &unk_10027CBB8;
  id v10 = &v11;
  id v8 = self;
  id v4 = a3;
  id v9 = v4;
  [(PHRecentsController *)v8 performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)continuousScrollingReachedIndexPath:(int64_t)a3
{
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  if (v6)
  {
    unsigned __int8 v7 = [(PHRecentsController *)self recentCalls];
    id v8 = (char *)[v7 count] - a3;

    id v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      int64_t v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = [(PHRecentsController *)self startedLoadingOlderCalls];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_continuousScrollingReachedIndexPath %ld, remaining rows: %ld startedLoadingOlderCalls: %d", buf, 0x1Cu);
    }

    [(PHRecentsController *)self loadOlderCallsIfNecessaryForRemainingRowCount:v8];
    serialQueue = self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __59__PHRecentsController_continuousScrollingReachedIndexPath___block_invoke;
    v11[3] = &unk_10027CA40;
    v11[4] = self;
    v11[5] = a3;
    dispatch_async(serialQueue, v11);
  }
}

- (NSArray)recentCalls
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __34__PHRecentsController_recentCalls__block_invoke;
  v15[3] = &unk_10027E720;
  v15[4] = self;
  id v3 = objc_retainBlock(v15);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__9;
  int64_t v13 = __Block_byref_object_dispose__9;
  ((void (*)(void))v3[2])();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10[5] && [(PHRecentsController *)self isInitializationBlockQueued])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __34__PHRecentsController_recentCalls__block_invoke_98;
    v6[3] = &unk_10027C6E8;
    id v8 = &v9;
    unsigned __int8 v7 = v3;
    [(PHRecentsController *)self performSynchronousBlock:v6];
  }
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

id __34__PHRecentsController_recentCalls__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

- (void)loadOlderCallsIfNecessaryForRemainingRowCount:(int64_t)a3
{
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned int v6 = [v5 increaseCallHistoryEnabled];

  if (v6 && ![(PHRecentsController *)self startedLoadingOlderCalls])
  {
    id v13 = [(PHRecentsController *)self recentCalls];
    id v7 = [v13 count];
    id v8 = [(PHRecentsController *)self callHistoryController];
    id v9 = [v8 callHistoryControllerCallHistoryFetchLimit];
    if (a3 > 50 || v7 >= v9)
    {
    }
    else
    {
      unsigned int v10 = [(PHRecentsController *)self canLoadOlderRecentCalls];

      if (v10)
      {
        uint64_t v11 = PHDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loading older recent calls", buf, 2u);
        }

        [(PHRecentsController *)self setStartedLoadingOlderCalls:1];
        uint64_t v12 = [(PHRecentsController *)self callHistoryController];
        [v12 loadOlderRecentCalls];
      }
    }
  }
}

- (BOOL)startedLoadingOlderCalls
{
  return self->_startedLoadingOlderCalls;
}

- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__9;
  id v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = __67__PHRecentsController_contactByHandleForRecentCall_keyDescriptors___block_invoke;
  uint64_t v15 = &unk_10027E748;
  __int16 v16 = self;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  uint64_t v19 = &v20;
  [(PHRecentsController *)self performSynchronousBlock:&v12];
  id v10 = [v21[5] copy:v12, v13, v14, v15, v16];

  _Block_object_dispose(&v20, 8);

  return v10;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(PHRecentsControllerSerialQueueContextKey) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(PHRecentsController *)self serialQueue];
    dispatch_sync(v7, v5);
  }
}

- (TUCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

id __85__PHRecentsController_handleTUCallHistoryControllerRecentCallsDidChangeNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartedLoadingOlderCalls:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateRecentCalls];
}

- (void)setStartedLoadingOlderCalls:(BOOL)a3
{
  self->_startedLoadingOlderCalls = a3;
}

uint64_t __34__PHRecentsController_recentCalls__block_invoke_98(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

- (BOOL)isInitializationBlockQueued
{
  id v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (BOOL)canLoadOlderRecentCalls
{
  id v3 = [(PHRecentsController *)self featureFlags];
  if ([v3 increaseCallHistoryEnabled])
  {
    id v4 = [(PHRecentsController *)self callHistoryController];
    unsigned __int8 v5 = [v4 canLoadOlderRecentCalls];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v10 = a4;
  p_accessorLock = &self->_accessorLock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  id v8 = [(PHRecentsController *)self delegateToQueue];
  if (v10) {
    id v9 = v10;
  }
  else {
    id v9 = &_dispatch_main_q;
  }
  [v8 setObject:v9 forKey:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)checkRecentMissedCallCount
{
  id v3 = [(PHRecentsController *)self featureFlags];
  unsigned int v4 = [v3 increaseCallHistoryEnabled];

  if (v4)
  {
    unsigned __int8 v5 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __49__PHRecentsController_checkRecentMissedCallCount__block_invoke;
    block[3] = &unk_10027C670;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

id __81__PHRecentsController_notifyDelegatesRecentsController_didCompleteFetchingCalls___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didCompleteFetchingCalls:*(void *)(a1 + 48)];
}

id __71__PHRecentsController_notifyDelegatesRecentsController_didChangeCalls___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(a1 + 48)];
}

- (void)updateRecentCalls
{
  id v3 = [(PHRecentsController *)self fetchRecentCalls];
  [(PHRecentsController *)self setRecentCalls:v3];

  unsigned int v4 = [(PHRecentsController *)self featureFlags];
  unsigned __int8 v5 = [v4 callHistorySearchEnabled];

  if ((v5 & 1) == 0)
  {
    [(PHRecentsController *)self checkRecentMissedCallCount];
  }
}

- (void)setRecentCalls:(id)a3
{
  id v7 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  recentCalls = self->_recentCalls;
  if (recentCalls != v7 && ![(NSArray *)recentCalls isEqualToArray:v7])
  {
    unsigned __int8 v5 = (NSArray *)[(NSArray *)v7 copy];
    id v6 = self->_recentCalls;
    self->_recentCalls = v5;

    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:self->_recentCalls];
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (id)fetchRecentCalls
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(PHRecentsController *)self recentCalls];
  unsigned __int8 v5 = [(PHRecentsController *)self callHistoryController];
  id v6 = [v5 recentCalls];

  if ([v4 isEqualToArray:v6])
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recent calls array has not changed. Ignoring", (uint8_t *)&v20, 2u);
    }

    id v8 = [(PHRecentsController *)self featureFlags];
    unsigned int v9 = [v8 callHistorySearchEnabled];

    if (v9)
    {
      os_unfair_lock_lock(&self->_accessorLock);
      [(PHRecentsController *)self notifyDelegatesRecentsController:self didCompleteFetchingCalls:v4];
      os_unfair_lock_unlock(&self->_accessorLock);
    }
    id v10 = v4;
    goto LABEL_16;
  }
  uint64_t v11 = [(PHRecentsController *)self featureFlags];
  unsigned int v12 = [v11 increaseCallHistoryEnabled];

  if (!v12)
  {
    id v18 = [(PHRecentsController *)self itemCache];
    [v18 removeAllObjects];

    [(PHRecentsController *)self populateCachesForRecentCalls:v6];
    id v10 = v6;
LABEL_16:
    id v17 = v10;
    goto LABEL_17;
  }
  uint64_t v13 = PHDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Recent calls array has changed. Find the changed objects and only update their cache", (uint8_t *)&v20, 2u);
  }

  id v14 = [(PHRecentsController *)self recentCallsChangedFromCachedRecentCalls:v4 callHistoryControllerRecentCalls:v6];
  uint64_t v15 = PHDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v14 count];
    int v20 = 134217984;
    id v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %lu changed objects", (uint8_t *)&v20, 0xCu);
  }

  if ([v14 count]) {
    [(PHRecentsController *)self populateCachesForRecentCalls:v14];
  }
  id v17 = v6;

LABEL_17:

  return v17;
}

- (void)populateCachesForRecentCalls:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting contacts for %lu calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchContactsForRecentCalls:v4];
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 count];
    int v11 = 134217984;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting metadata for %lu recent calls.", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchMetadataForRecentCalls:v4];
  unsigned int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 count];
    int v11 = 134217984;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Populating item cache with %lu recent calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self populateItemCacheForRecentCalls:v4];
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v8 = [(PHRecentsController *)self delegateToQueue];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          id v14 = [v8 objectForKey:v13];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __71__PHRecentsController_notifyDelegatesRecentsController_didChangeCalls___block_invoke;
          block[3] = &unk_10027CBE0;
          block[4] = v13;
          id v16 = v6;
          id v17 = v7;
          dispatch_async(v14, block);
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)notifyDelegatesRecentsController:(id)a3 didCompleteFetchingCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHRecentsController *)self featureFlags];
  unsigned int v9 = [v8 callHistorySearchEnabled];

  if (v9)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    id v10 = [(PHRecentsController *)self delegateToQueue];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v14);
          if (objc_opt_respondsToSelector())
          {
            id v16 = [v10 objectForKey:v15];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = __81__PHRecentsController_notifyDelegatesRecentsController_didCompleteFetchingCalls___block_invoke;
            block[3] = &unk_10027CBE0;
            block[4] = v15;
            id v18 = v6;
            id v19 = v7;
            dispatch_async(v16, block);
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)fetchContactsForRecentCalls:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self contactHandlesForRecentCalls:v4];
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = [v4 count];
    __int16 v10 = 2048;
    id v11 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu calls using %lu handles", (uint8_t *)&v8, 0x16u);
  }

  [(PHRecentsController *)self fetchContactsForHandles:v6];
}

- (void)fetchMetadataForRecentCalls:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self metadataCache];

  if (v6)
  {
    id v7 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:v4];
    int v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v16 = [v4 count];
      __int16 v17 = 2048;
      id v18 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu recent calls using %lu handles", buf, 0x16u);
    }

    id v9 = [(PHRecentsController *)self featureFlags];
    unsigned int v10 = [v9 phoneRecentsAvatarsEnabled];

    id v11 = [(PHRecentsController *)self metadataCache];
    id v12 = v11;
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __51__PHRecentsController_fetchMetadataForRecentCalls___block_invoke;
      v13[3] = &unk_10027C940;
      v13[4] = self;
      id v14 = v4;
      [v12 updateCacheWithDestinationIDs:v7 completion:v13];
    }
    else
    {
      [v11 updateCacheWithDestinationIDs:v7];
    }
  }
}

- (TUMetadataCache)metadataCache
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = self->_metadataCache;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

void __67__PHRecentsController_contactByHandleForRecentCall_keyDescriptors___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    unsigned __int8 v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v2 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [v2 objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 firstObject];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v13 forKeyedSubscript:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v54 = a4;
  id v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v53 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v48 = objc_alloc_init((Class)NSMutableDictionary);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v44 = v6;
  id obj = [v6 validRemoteParticipantHandles];
  __int16 v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v47)
  {
    uint64_t v55 = 0;
    uint64_t v46 = *(void *)v69;
    id v8 = v53;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v9;
        uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v9);
        unsigned int v10 = -[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:");
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v65;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v65 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              long long v16 = [(PHRecentsController *)self contactCache];
              long long v17 = [v16 objectForKeyedSubscript:v15];

              if (!v17) {
                goto LABEL_21;
              }
              uint64_t v18 = [v17 value];
              if (!v18
                || (id v19 = (void *)v18,
                    [v17 value],
                    long long v20 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v21 = [v20 areKeysAvailable:v54],
                    v20,
                    id v8 = v53,
                    v19,
                    v21))
              {
                long long v22 = [v17 value];
                if (v22)
                {
                  id v23 = v55;
                  if (!v55) {
                    id v23 = objc_alloc_init((Class)NSMutableDictionary);
                  }
                  uint64_t v55 = v23;
                  id v24 = [v23 objectForKeyedSubscript:v51];
                  if (!v24)
                  {
                    id v24 = +[NSMutableArray array];
                    [v55 setObject:v24 forKeyedSubscript:v51];
                  }
                  [v24 addObject:v22];
                }
              }
              else
              {
LABEL_21:
                [v8 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v12);
        }
        [v48 setObject:v10 forKeyedSubscript:v51];

        uint64_t v9 = v49 + 1;
      }
      while (v49 + 1 != v47);
      __int16 v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v47);
  }
  else
  {
    uint64_t v55 = 0;
    id v8 = v53;
  }

  if ([v8 count])
  {
    id v25 = [(PHRecentsController *)self contactStore];
    uint64_t v26 = [v8 array];
    long long v27 = [v25 contactsForHandles:v26 keyDescriptors:v54];

    if (v27)
    {
      id v28 = v55;
      if (!v55) {
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
      }
      uint64_t v55 = v28;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v50 = [v48 allKeys];
      id v29 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v52 = *(void *)v61;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v61 != v52) {
              objc_enumerationMutation(v50);
            }
            uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
            id v33 = objc_alloc_init((Class)NSMutableOrderedSet);
            v34 = [v48 objectForKeyedSubscript:v32];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v35 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v57;
              do
              {
                for (k = 0; k != v36; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  long long v39 = [v27 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
                  if ([v39 count]) {
                    [v33 addObjectsFromArray:v39];
                  }
                }
                id v36 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
              }
              while (v36);
            }
            long long v40 = [v55 objectForKeyedSubscript:v32];
            if (!v40)
            {
              long long v40 = +[NSMutableArray array];
              [v55 setObject:v40 forKeyedSubscript:v32];
            }
            long long v41 = [v33 array];
            [v40 addObjectsFromArray:v41];
          }
          id v30 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v30);
      }
    }
    id v8 = v53;
  }
  id v42 = [v55 copy];

  return v42;
}

id __70__PHRecentsController_handleUIApplicationDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v43 = a6;
  id v16 = a7;
  v46.receiver = self;
  v46.super_class = (Class)PHRecentsController;
  long long v17 = [(PHRecentsController *)&v46 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v18->_delegateToQueue;
    v18->_delegateToQueue = (NSMapTable *)v19;

    v18->_initializationBlockQueued = 1;
    id v42 = v13;
    +[NSString stringWithFormat:@"com.apple.calls.queue.%@.%p", objc_opt_class(), v18];
    unsigned int v21 = v41 = v15;
    long long v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v23 = v21;
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], v22);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v24;

    dispatch_queue_set_specific((dispatch_queue_t)v18->_serialQueue, PHRecentsControllerSerialQueueContextKey, v18, 0);
    objc_storeStrong((id *)&v18->_completionDispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v18->_callHistoryController, a3);
    uint64_t v26 = (NSCache *)objc_alloc_init((Class)NSCache);
    callProviderCache = v18->_callProviderCache;
    v18->_callProviderCache = v26;

    objc_storeStrong((id *)&v18->_callProviderManager, a4);
    callProviderManager = v18->_callProviderManager;
    id v29 = [(PHRecentsController *)v18 serialQueue];
    [(TUCallProviderManager *)callProviderManager addDelegate:v18 queue:v29];

    id v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v18->_contactCache;
    v18->_contactCache = v30;

    objc_storeStrong((id *)&v18->_contactStore, a5);
    objc_storeStrong((id *)&v18->_suggestedContactStore, a6);
    objc_storeStrong((id *)&v18->_metadataCache, a7);
    uint64_t v32 = (TUSubtitleProvider *)[objc_alloc((Class)TUSubtitleProvider) initWithMetadataCache:v16 callProviderManager:v14];
    subtitleProvider = v18->_subtitleProvider;
    v18->_subtitleProvider = v32;

    v34 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v18->_featureFlags;
    v18->_featureFlags = v34;

    id v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    localizedSubtitleCache = v18->_localizedSubtitleCache;
    v18->_localizedSubtitleCache = v36;

    v18->_startedLoadingOlderCalls = 0;
    long long v38 = objc_alloc_init(MPAnalyticsLogger);
    [(PHRecentsController *)v18 setAnalyticsLogger:v38];

    long long v39 = v18->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke;
    block[3] = &unk_10027C670;
    __int16 v45 = v18;
    dispatch_async(v39, block);

    id v13 = v42;
    id v15 = v41;
  }

  return v18;
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__PHRecentsController_handleUIApplicationDidBecomeActiveNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

void __49__PHRecentsController_checkRecentMissedCallCount__block_invoke(uint64_t a1)
{
  id v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking for missed calls count", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) recentCalls];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    int v8 = kCHCallStatusMissed;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((v8 & [*(id *)(*((void *)&v10 + 1) + 8 * i) callStatus]) != 0) {
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 32) loadOlderCallsIfNecessaryForRemainingRowCount:v6];
}

- (PHRecentsController)init
{
  return 0;
}

void __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit != -1) {
        dispatch_once(&__CUTWeakCXCallDirectoryManagerIdentificationEntriesChangedNotification__pred_CXCallDirectoryManagerIdentificationEntriesChangedNotificationCallKit, &__block_literal_global_35);
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = __CUTStaticWeak_CXCallDirectoryManagerIdentificationEntriesChangedNotification;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling %s by fetching metadata for recent calls", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) recentCalls];
    if ([v4 count])
    {
      id v5 = [*(id *)(a1 + 32) serialQueue];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_92;
      v6[3] = &unk_10027C940;
      id v7 = *(id *)(a1 + 32);
      id v8 = v4;
      dispatch_async(v5, v6);
    }
  }
}

id __122__PHRecentsController_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache___block_invoke_92(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchMetadataForRecentCalls:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel([(PHRecentsController *)self callDirectoryManagerIdentificationEntriesChangedNotificationToken]);
  v4.receiver = self;
  v4.super_class = (Class)PHRecentsController;
  [(PHRecentsController *)&v4 dealloc];
}

- (CNContactStore)suggestedContactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_suggestedContactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (id)itemForRecentCall:(id)a3
{
  return [(PHRecentsController *)self itemForRecentCall:a3 presentationStyle:1];
}

uint64_t __59__PHRecentsController_itemForRecentCall_presentationStyle___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) contactForHandle:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__9;
  unsigned int v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  id v8 = [(PHRecentsController *)self serialQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __57__PHRecentsController_coalesceRecentCall_withRecentCall___block_invoke;
  v13[3] = &unk_10027D8A8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __57__PHRecentsController_coalesceRecentCall_withRecentCall___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryController];
  id v3 = [v2 coalescingStrategy];

  if (v3 == (id)2)
  {
    objc_super v4 = (id *)&kCHCoalescingStrategyCollapseIfEqual;
  }
  else
  {
    if (v3 != (id)1) {
      return;
    }
    objc_super v4 = (id *)&kCHCoalescingStrategyRecents;
  }
  id v5 = *v4;
  if (v5)
  {
    id v9 = v5;
    uint64_t v6 = [*(id *)(a1 + 40) coalescedCallWithCall:*(void *)(a1 + 48) usingStrategy:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)deleteAllRecentCalls
{
  id v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__PHRecentsController_deleteAllRecentCalls__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__PHRecentsController_deleteAllRecentCalls__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 deleteAllRecentCalls];
}

- (void)deleteRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __41__PHRecentsController_deleteRecentCalls___block_invoke;
  v7[3] = &unk_10027C940;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__PHRecentsController_deleteRecentCalls___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryController];
  [v2 deleteRecentCalls:*(void *)(a1 + 40)];
}

- (void)markRecentCallsAsRead
{
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Mark recent calls as read", buf, 2u);
  }

  id v4 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__PHRecentsController_markRecentCallsAsRead__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __44__PHRecentsController_markRecentCallsAsRead__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentCallsAsRead];
}

- (void)markRecentAudioCallsAsRead
{
  id v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__PHRecentsController_markRecentAudioCallsAsRead__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __49__PHRecentsController_markRecentAudioCallsAsRead__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentAudioCallsAsRead];
}

- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  dispatch_queue_t v24 = __Block_byref_object_copy__9;
  id v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  id v8 = [v6 validRemoteParticipantHandles];
  id v9 = [v8 count];

  if (v9 == (id)1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __59__PHRecentsController_contactForRecentCall_keyDescriptors___block_invoke;
    v17[3] = &unk_10027E748;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    long long v20 = &v21;
    [(PHRecentsController *)self performSynchronousBlock:v17];
  }
  id v10 = (void *)v22[5];
  if (!v10)
  {
    id v11 = [(PHRecentsController *)self metadataCache];
    long long v12 = +[CNMutableContact contactForRecentCall:v6 metadataCache:v11];
    id v13 = [v12 copy];
    id v14 = (void *)v22[5];
    v22[5] = (uint64_t)v13;

    id v10 = (void *)v22[5];
  }
  id v15 = v10;
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __59__PHRecentsController_contactForRecentCall_keyDescriptors___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  id v2 = [v7 allValues];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)dialRequestForRecentCall:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  id v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__PHRecentsController_dialRequestForRecentCall___block_invoke;
  v7[3] = &unk_10027CEB0;
  id v4 = a3;
  id v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(PHRecentsController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __48__PHRecentsController_dialRequestForRecentCall___block_invoke(uint64_t a1)
{
  id v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for recent call %@", (uint8_t *)&v12, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) callProviderManager];
  uint64_t v5 = [v4 dialRequestForRecentCall:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = [*(id *)(a1 + 32) validRemoteParticipantHandles];
    id v9 = [v8 anyObject];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) contactForHandle:v9];
      uint64_t v11 = [v10 identifier];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setContactIdentifier:v11];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOriginatingUIType:8];
  }
  else
  {
    id v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __48__PHRecentsController_dialRequestForRecentCall___block_invoke_cold_1((uint64_t *)(a1 + 32), v9);
    }
  }
}

- (void)performDialRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHRecentsController *)self presentScreenTimeShield];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)v5;
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 callFilterController];
  unsigned int v9 = [v8 shouldRestrictDialRequest:v4 performSynchronously:1];

  if (v9)
  {
    id v10 = [(PHRecentsController *)self presentScreenTimeShield];
    ((void (**)(void, id))v10)[2](v10, v4);
  }
  else
  {
LABEL_4:
    uint64_t v11 = +[TUCallCenter sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __42__PHRecentsController_performDialRequest___block_invoke;
    v12[3] = &unk_10027CD38;
    id v13 = v4;
    [v11 launchAppForDialRequest:v13 completion:v12];
  }
}

void __42__PHRecentsController_performDialRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__PHRecentsController_performDialRequest___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)performDialRequestForRecentCall:(id)a3
{
  id v4 = [(PHRecentsController *)self dialRequestForRecentCall:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(PHRecentsController *)self performDialRequest:v4];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)performJoinRequestForRecentCall:(id)a3
{
}

- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHRecentsController -performJoinRequestForRecentCall", buf, 2u);
  }

  unsigned int v9 = [(PHRecentsController *)self featureFlags];
  unsigned int v10 = [v9 callHistorySearchEnabled];

  if (v10)
  {
    uint64_t v11 = [(PHRecentsController *)self callProviderManager];
    int v12 = [v11 joinConversationRequestForRecentCall:v6];

    if (v12)
    {
      [v12 setOriginatingUIType:8];
      if (v7) {
        [v12 setProvider:v7];
      }
      id v13 = +[TUCallCenter sharedInstance];
      [v13 launchAppForJoinRequest:v12];
      goto LABEL_32;
    }
    id v13 = PHDefaultLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    goto LABEL_32;
  }
  id v36 = self;
  id v14 = [v6 validRemoteParticipantHandles];
  int v12 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v14 count]);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = v6;
  id v15 = [v6 validRemoteParticipantHandles];
  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [*(id *)(*((void *)&v38 + 1) + 8 * i) tuHandle];
        if (v20)
        {
          id v21 = objc_alloc((Class)TUConversationMember);
          id v22 = +[NSSet setWithObject:v20];
          id v23 = [v21 initWithHandles:v22];

          [v12 addObject:v23];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v17);
  }

  if (![v12 count])
  {
    id v13 = PHDefaultLog();
    id v6 = v37;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138412290;
    id v44 = v37;
    goto LABEL_31;
  }
  id v13 = [objc_alloc((Class)TUJoinConversationRequest) initWithRemoteMembers:v12];
  id v6 = v37;
  -[NSObject setVideo:](v13, "setVideo:", [v37 mediaType] == (id)2);
  -[NSObject setVideoEnabled:](v13, "setVideoEnabled:", [v37 mediaType] == (id)2);
  [v13 setOriginatingUIType:8];
  if (v7) {
    -[NSObject setProvider:](v13, "setProvider:");
  }
  dispatch_queue_t v24 = [(PHRecentsController *)v36 callProviderManager];
  id v25 = [v24 faceTimeProvider];
  id v26 = [v37 outgoingLocalParticipantUUID];
  long long v27 = [v25 senderIdentityForAccountUUID:v26];

  if (v27)
  {
    id v28 = [v27 handle];
    [v13 setCallerID:v28];
  }
  id v29 = +[TUCallProviderManager invitationPreferencesForRecentCall];
  [v13 setInvitationPreferences:v29];

  uint64_t v30 = [(PHRecentsController *)v36 presentScreenTimeShield];
  if (!v30) {
    goto LABEL_25;
  }
  id v31 = (void *)v30;
  uint64_t v32 = +[TUCallCenter sharedInstance];
  id v33 = [v32 callFilterController];
  unsigned int v34 = [v33 shouldRestrictJoinConversationRequest:v13 performSynchronously:1];

  id v6 = v37;
  if (v34)
  {
    id v35 = [(PHRecentsController *)v36 presentScreenTimeShield];
    ((void (**)(void, NSObject *))v35)[2](v35, v13);
  }
  else
  {
LABEL_25:
    id v35 = +[TUCallCenter sharedInstance];
    [v35 launchAppForJoinRequest:v13];
  }

LABEL_32:
}

- (void)removeDelegate:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  id v6 = [(PHRecentsController *)self delegateToQueue];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [(PHRecentsController *)self featureFlags];
  unsigned int v8 = [v7 phoneRecentsAvatarsEnabled];

  if (v8)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    id v17 = self;
    unsigned int v9 = [(PHRecentsController *)self delegateToQueue];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v9 objectForKey:v14];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __71__PHRecentsController_notifyDelegatesRecentsController_didUpdateCalls___block_invoke;
          block[3] = &unk_10027CBE0;
          void block[4] = v14;
          id v22 = v6;
          id v23 = v18;
          dispatch_async(v15, block);

          id v16 = &v22;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          id v15 = [v9 objectForKey:v14];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = __71__PHRecentsController_notifyDelegatesRecentsController_didUpdateCalls___block_invoke_2;
          v19[3] = &unk_10027CBE0;
          v19[4] = v14;
          v20[0] = v6;
          v20[1] = v17;
          dispatch_async(v15, v19);
          id v16 = (id *)v20;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
}

id __71__PHRecentsController_notifyDelegatesRecentsController_didUpdateCalls___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 48)];
}

id __71__PHRecentsController_notifyDelegatesRecentsController_didUpdateCalls___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(*(void *)(a1 + 48) + 112)];
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v7 = [(PHRecentsController *)self delegateToQueue];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [v7 objectForKey:v12];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __81__PHRecentsController_notifyDelegatesRecentsController_didChangeUnreadCallCount___block_invoke;
          block[3] = &unk_10027E770;
          void block[4] = v12;
          id v15 = v6;
          unint64_t v16 = a4;
          dispatch_async(v13, block);
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

id __81__PHRecentsController_notifyDelegatesRecentsController_didChangeUnreadCallCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeUnreadCallCount:*(void *)(a1 + 48)];
}

- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v5 = [(PHRecentsController *)self delegateToQueue];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v5 objectForKey:v10];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = __73__PHRecentsController_notifyDelegatesRecentsControllerDidChangeMessages___block_invoke;
          v12[3] = &unk_10027C940;
          void v12[4] = v10;
          id v13 = v4;
          dispatch_async(v11, v12);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

id __73__PHRecentsController_notifyDelegatesRecentsControllerDidChangeMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsControllerDidChangeMessages:*(void *)(a1 + 40)];
}

- (CNContactFormatter)contactFormatter
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;

  return contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  uint64_t v8 = (CNContactFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  contactFormatter = self->_contactFormatter;
  p_contactFormatter = &self->_contactFormatter;
  if (contactFormatter != v8) {
    objc_storeStrong((id *)p_contactFormatter, a3);
  }
}

- (void)setNumberFormatter:(id)a3
{
  uint64_t v8 = (NSNumberFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  numberFormatter = self->_numberFormatter;
  p_numberFormatter = &self->_numberFormatter;
  if (numberFormatter != v8) {
    objc_storeStrong((id *)p_numberFormatter, a3);
  }
}

- (void)setPreFetchingPredicate:(id)a3
{
  id v7 = (NSPredicate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_preFetchingPredicate != v7)
  {
    objc_storeStrong((id *)&self->_preFetchingPredicate, a3);
    id v6 = [(PHRecentsController *)self callHistoryController];
    [v6 setPreFetchingPredicate:v7];
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)contactForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  [(PHRecentsController *)self contactHandlesForHandle:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(PHRecentsController *)self contactCache];
        id v13 = [v12 objectForKeyedSubscript:v11];
        long long v14 = [v13 value];

        if (v14)
        {
          long long v15 = v6;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v15 = PHDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle not found in cache: %@", buf, 0xCu);
  }
  long long v14 = 0;
LABEL_13:

  return v14;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  id v8 = PHDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v9)
    {
      uint64_t v10 = [v5 value];
      int v16 = 138412546;
      long long v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v11 = [v5 value];
    uint64_t v12 = TUFormattedPhoneNumber();

    if (!v12)
    {
LABEL_9:
      long long v14 = +[NSBundle mainBundle];
      uint64_t v12 = [v14 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_100285990 table:@"PHRecents"];
    }
  }
  else
  {
    if (v9)
    {
      id v13 = [v5 value];
      int v16 = 138412290;
      long long v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v12 = [v5 value];
    if (!v12) {
      goto LABEL_9;
    }
  }

  return v12;
}

- (id)fetchContactForContactCardDisplay:(id)a3
{
  id v4 = a3;
  if ([v4 canExceedUnifyingThreshold])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    long long v15 = __Block_byref_object_copy__9;
    int v16 = __Block_byref_object_dispose__9;
    id v17 = 0;
    id v5 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __57__PHRecentsController_fetchContactForContactCardDisplay___block_invoke;
    block[3] = &unk_10027CBB8;
    id v10 = v4;
    uint64_t v11 = &v12;
    void block[4] = self;
    id v6 = v4;
    dispatch_sync(v5, block);

    id v7 = (void *)v13[5];
    if (!v7) {
      id v7 = v6;
    }
    id v4 = v7;

    _Block_object_dispose(&v12, 8);
  }

  return v4;
}

void __57__PHRecentsController_fetchContactForContactCardDisplay___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  id v4 = +[CNContactViewController descriptorForRequiredKeys];
  BOOL v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v6 = [v2 fetchUnifiedContactForID:v3 withDescriptors:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [(PHRecentsController *)self contactStore];
  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching unified contact for handle %@ using contact store %@", buf, 0x16u);
  }

  id v11 = v7;
  if (!v7)
  {
    if (_defaultContactsKeyDescriptors_onceToken != -1) {
      dispatch_once(&_defaultContactsKeyDescriptors_onceToken, &__block_literal_global_511);
    }
    id v11 = (id)_defaultContactsKeyDescriptors_keyDescriptors;
  }
  id v23 = 0;
  uint64_t v12 = [v9 unifiedContactWithIdentifier:v6 keysToFetch:v11 error:&v23];
  id v13 = v23;
  if (!v7) {

  }
  id v14 = objc_alloc((Class)TUOptionalObject);
  if (v13)
  {
    id v15 = [v14 initWithValue:0];
    int v16 = [(PHRecentsController *)self contactCache];
    [v16 setObject:v15 forKeyedSubscript:v6];

    id v17 = PHDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PHRecentsController fetchUnifiedContactForID:withDescriptors:]((uint64_t)v6, v17);
    }

    id v18 = 0;
  }
  else
  {
    id v19 = [v14 initWithValue:v12];
    long long v20 = [(PHRecentsController *)self contactCache];
    [v20 setObject:v19 forKeyedSubscript:v6];

    id v21 = PHDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found unified contact %@ for contact handle %@", buf, 0x16u);
    }

    id v18 = v12;
  }

  return v18;
}

void __51__PHRecentsController_fetchMetadataForRecentCalls___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featureFlags];
  unsigned int v3 = [v2 phoneRecentsAvatarsEnabled];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) serialQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __51__PHRecentsController_fetchMetadataForRecentCalls___block_invoke_2;
    v7[3] = &unk_10027C940;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

void __51__PHRecentsController_fetchMetadataForRecentCalls___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v8 = [v7 uniqueId];
          uint64_t v9 = [*(id *)(a1 + 40) itemCache];
          id v10 = [v9 objectForKeyedSubscript:v8];
          id v11 = [v10 mutableCopy];

          if (v11)
          {
            uint64_t v12 = [*(id *)(a1 + 40) localizedSubtitleForRecentCall:v7];
            [v11 setLocalizedSubtitle:v12];

            id v13 = [v11 copy];
            id v14 = [*(id *)(a1 + 40) itemCache];
            [v14 setObject:v13 forKeyedSubscript:v8];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    [*(id *)(a1 + 40) notifyDelegatesRecentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
  }
}

- (void)recentCallsWillShow
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  [v2 boostQualityOfService];
}

- (id)metadataItemsForRecentCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  uint64_t v6 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(PHRecentsController *)self metadataCache];
        id v13 = [v12 metadataForDestinationID:v11];

        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v14 = [v5 copy];

  return v14;
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__PHRecentsController_handleCNContactStoreDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

void __65__PHRecentsController_handleCNContactStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recentCalls];
  if ([v6 count])
  {
    id v2 = [*(id *)(a1 + 32) contactCache];
    [v2 removeAllObjects];

    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 recentCalls];
    [v3 fetchContactsForRecentCalls:v4];

    uint64_t v5 = [*(id *)(a1 + 32) itemCache];
    [v5 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v6];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __73__PHRecentsController_handleIDSServiceAvailabilityDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

id __73__PHRecentsController_handleIDSServiceAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__PHRecentsController_handleNSCurrentLocaleDidChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

void __66__PHRecentsController_handleNSCurrentLocaleDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  [*(id *)(a1 + 32) setContactFormatter:v2];

  id v3 = [*(id *)(a1 + 32) fetchNumberFormatter];
  [*(id *)(a1 + 32) setNumberFormatter:v3];

  id v8 = [*(id *)(a1 + 32) recentCalls];
  if ([v8 count])
  {
    id v4 = [*(id *)(a1 + 32) itemCache];
    [v4 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v8];
    uint64_t v5 = [*(id *)(a1 + 32) featureFlags];
    unsigned int v6 = [v5 phoneRecentsAvatarsEnabled];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 notifyDelegatesRecentsController:v7 didUpdateCalls:v8];
    }
    else {
      [v7 notifyDelegatesRecentsController:v7 didChangeCalls:v8];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  unsigned int v6 = [(PHRecentsController *)self callHistoryController];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [v4 name];
      int v14 = 138412802;
      __int16 v15 = v9;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = [v4 object];
    __int16 v13 = v12;
    if (v12) {
      -[PHRecentsController setUnreadCallCount:](self, "setUnreadCallCount:", [v12 unreadCallCount]);
    }
  }
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHRecentsController *)self featureFlags];
  unsigned __int8 v6 = [v5 phoneRecentsAvatarsEnabled];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      int v14 = v8;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    uint64_t v11 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __74__PHRecentsController_handleTUMetadataCacheDidFinishUpdatingNotification___block_invoke;
    block[3] = &unk_10027C670;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

void __74__PHRecentsController_handleTUMetadataCacheDidFinishUpdatingNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentCalls];
  if ([v2 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v16 = v2;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [v8 uniqueId];
          id v10 = [*(id *)(a1 + 32) itemCache];
          uint64_t v11 = [v10 objectForKeyedSubscript:v9];
          id v12 = [v11 mutableCopy];

          if (v12)
          {
            __int16 v13 = [*(id *)(a1 + 32) localizedSubtitleForRecentCall:v8];
            [v12 setLocalizedSubtitle:v13];

            id v14 = [v12 copy];
            __int16 v15 = [*(id *)(a1 + 32) itemCache];
            [v15 setObject:v14 forKeyedSubscript:v9];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v2 = v16;
  }
}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  id v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__PHRecentsController_handleUIApplicationSignificantTimeChangeNotification___block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v9, block);
}

void __76__PHRecentsController_handleUIApplicationSignificantTimeChangeNotification___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recentCalls];
  if ([v3 count])
  {
    id v2 = [*(id *)(a1 + 32) itemCache];
    [v2 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling providersChangedForProviderManager %@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [(PHRecentsController *)self recentCalls];
  if ([v8 count])
  {
    id v9 = [(PHRecentsController *)self itemCache];
    [v9 removeAllObjects];

    [(PHRecentsController *)self populateItemCacheForRecentCalls:v8];
    os_unfair_lock_lock(&self->_accessorLock);
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:v8];
    os_unfair_lock_unlock(&self->_accessorLock);
  }
}

- (id)subtitleForRecentEmergencyCall:(id)a3
{
  id v4 = [a3 callOccurrences];
  id v5 = [(PHRecentsController *)self localizedSubtitleForRecentEmergencyCall:v4];

  return v5;
}

- (id)localizedSubtitleForRecentEmergencyCall:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v3)
  {
LABEL_33:
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v19 = @"Emergency call";
    goto LABEL_34;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v25;
  uint64_t v8 = kCHCallOccurrenceEmergencyVideosCountKey;
  uint64_t v9 = kCHCallOccurrenceEmergencyImagesCountKey;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      __int16 v12 = [v11 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 += (unint64_t)[v12 integerValue];
      }
      __int16 v13 = [v11 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5 += (unint64_t)[v13 integerValue];
      }
    }
    id v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v4);
  if (v6 && !v5)
  {
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"Shared videos coalesced";
    CFStringRef v17 = @"Shared video coalesced";
    BOOL v18 = v6 == 1;
    goto LABEL_18;
  }
  if (v6 || !v5)
  {
    if (v6 == 1 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photo coalesced";
      goto LABEL_34;
    }
    if (v6 == 1 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photos coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photo coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photos coalesced";
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  __int16 v14 = +[NSBundle mainBundle];
  id v15 = v14;
  CFStringRef v16 = @"Shared photos coalesced";
  CFStringRef v17 = @"Shared photo coalesced";
  BOOL v18 = v5 == 1;
LABEL_18:
  if (v18) {
    CFStringRef v19 = v17;
  }
  else {
    CFStringRef v19 = v16;
  }
LABEL_34:
  long long v20 = [v14 localizedStringForKey:v19 value:&stru_100285990 table:0];
  id v21 = +[NSString stringWithFormat:v20];

  return v21;
}

- (id)unknownLabel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __35__PHRecentsController_unknownLabel__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  if (unknownLabel_onceToken != -1) {
    dispatch_once(&unknownLabel_onceToken, block);
  }
  return (id)unknownLabel_unknownLabel;
}

void __35__PHRecentsController_unknownLabel__block_invoke(uint64_t a1)
{
  id v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"UNKNOWN_LABEL" value:&stru_100285990 table:@"PHRecents"];
  id v4 = (void *)unknownLabel_unknownLabel;
  unknownLabel_unknownLabel = v3;

  unint64_t v5 = [*(id *)(a1 + 32) featureFlags];
  LODWORD(v2) = [v5 callHistorySearchEnabled];

  if (v2)
  {
    TUBundle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v8 localizedStringForKey:@"UNKNOWN_LABEL" value:&stru_100285990 table:@"TelephonyUtilities"];
    uint64_t v7 = (void *)unknownLabel_unknownLabel;
    unknownLabel_unknownLabel = v6;
  }
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (id)presentScreenTimeShield
{
  return self->_presentScreenTimeShield;
}

- (void)setPresentScreenTimeShield:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken
{
  return self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken;
}

- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3
{
  self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleProvider, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_presentScreenTimeShield, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callProviderCache, 0);

  objc_storeStrong((id *)&self->_callHistoryController, 0);
}

- (unint64_t)callHistoryControllerOptions
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  id v3 = [v2 options];

  return (unint64_t)v3;
}

- (unint64_t)callHistoryControllerCoalescingStrategy
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  id v3 = [v2 coalescingStrategy];

  return (unint64_t)v3;
}

- (void)cancelSearchFetchOperations
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  [v2 cancelSearchFetchOperations];
}

void __48__PHRecentsController_dialRequestForRecentCall___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a dial request for the recent call (%@).", (uint8_t *)&v3, 0xCu);
}

void __42__PHRecentsController_performDialRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error initiating dial request %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)fetchUnifiedContactForID:(uint64_t)a1 withDescriptors:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch unified contact for identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end