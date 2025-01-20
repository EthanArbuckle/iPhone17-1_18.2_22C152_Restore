@interface IMContactStore
+ (BOOL)_shouldAllowContactStoreLookup;
+ (BOOL)isCNContactAKnownContact:(id)a3;
+ (BOOL)shouldShowAbbreviatedNames;
+ (BOOL)shouldShowNickNames;
+ (Class)IMCNChangeHistoryFetchRequestClass;
+ (Class)IMCNContactFetchRequestClass;
+ (Class)IMCNContactFormatterClass;
+ (Class)IMCNGeminiManagerClass;
+ (Class)IMCNLabeledValueClass;
+ (Class)IMCNMeCardSharingPickerViewControllerClass;
+ (Class)IMCNMutableContactClass;
+ (Class)IMCNPhoneNumberClass;
+ (id)IDWithCurrentLocaleITUCode:(id)a3;
+ (id)IDsFromCNContact:(id)a3;
+ (id)IMContactStoreQueue;
+ (id)_sortContactsFor:(id)a3;
+ (id)_stringFromContact:(id)a3 withStyle:(int64_t)a4;
+ (id)abbreviatedNameForCNContact:(id)a3;
+ (id)companyNameForCNContact:(id)a3;
+ (id)createMutableContactWithID:(id)a3;
+ (id)createMutableContactWithMapURL:(id)a3 andLocalizedLocationString:(id)a4;
+ (id)descriptionForCNContact:(id)a3;
+ (id)dialingCodeForID:(id)a3;
+ (id)dialingForCurrentLocale;
+ (id)displayNameForContact:(id)a3;
+ (id)displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:(id)a3;
+ (id)displayNameWithPhoneNumberOrEmailForContact:(id)a3;
+ (id)emailsForCNContact:(id)a3;
+ (id)firstNameForCNContact:(id)a3;
+ (id)fullNameForCNContact:(id)a3;
+ (id)kIMCNContactCropRectKey;
+ (id)kIMCNContactEmailAddressesKey;
+ (id)kIMCNContactIdentifierKey;
+ (id)kIMCNContactImageBackgroundColorsDataKey;
+ (id)kIMCNContactImageDataAvailableKey;
+ (id)kIMCNContactImageDataKey;
+ (id)kIMCNContactLinkIdentifierKey;
+ (id)kIMCNContactPhoneNumbersKey;
+ (id)kIMCNContactSensitiveContentConfigurationKey;
+ (id)kIMCNContactThumbnailImageDataKey;
+ (id)kIMCNContactWallpaperKey;
+ (id)kIMCNContactWatchWallpaperImageDataKey;
+ (id)keysForCNContact;
+ (id)keysForMeContact;
+ (id)keysForNicknameHandling;
+ (id)lastNameForCNContact:(id)a3;
+ (id)mePredicate;
+ (id)nickNameForCNContact:(id)a3;
+ (id)phoneNumbersForCNContact:(id)a3;
+ (id)phoneticFirstNameForCNContact:(id)a3;
+ (id)phoneticFullNameForCNContact:(id)a3;
+ (id)phoneticLastNameForCNContact:(id)a3;
+ (id)predicateForID:(id)a3;
+ (id)sharedInstance;
+ (id)validateAndCleanupID:(id)a3;
+ (id)validateAndFilterIDsForContactsBatchFetch:(id)a3;
+ (void)_logArray:(id)a3 inBatchesOfSize:(int64_t)a4;
+ (void)_logDictionaryInformation:(id)a3 withSortedKeys:(id)a4 inRange:(_NSRange)a5;
+ (void)logCNContact:(id)a3;
+ (void)logCNContact:(id)a3 andID:(id)a4;
+ (void)logContactFetchRequestResults:(id)a3;
+ (void)logDictionary:(id)a3;
+ (void)logDictionary:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4;
+ (void)logDictionary:(id)a3 inBatchesOfSize:(int64_t)a4;
+ (void)logHandleID:(id)a3;
+ (void)logHandleIDs:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4;
+ (void)logHistoryToken:(id)a3;
- (BOOL)batchFetchingForLaunchCompleted;
- (BOOL)isBatchFetchingForLaunchCompleted;
- (BOOL)isContactWithIDAlreadyFetched:(id)a3;
- (BOOL)isIDAKnownContact:(id)a3;
- (BOOL)shouldSkipMeContactLookup;
- (CNContact)meContact;
- (CNContactStore)contactStore;
- (IMContactStore)init;
- (IMContactStore)initWithContactStore:(id)a3;
- (IMStateCaptureAssistant)stateCaptureAssistant;
- (NSArray)CNIDsForBatchFetch;
- (NSData)currentHistoryToken;
- (NSDictionary)handleIDToCNIDMap;
- (NSMutableDictionary)CNIDToHandleIDsMap;
- (NSMutableDictionary)IDToCNContactMap;
- (OS_dispatch_queue)changeHistoryFetchQueue;
- (double)lastContactStoreSync;
- (double)lastMeContactStoreSync;
- (id)batchFetchContactsWithoutCachingForIdentifiers:(id)a3;
- (id)cnContactIdentifierForID:(id)a3;
- (id)completedContact:(id)a3 withKeys:(id)a4;
- (id)fetchCNContactForHandleID:(id)a3 withKeys:(id)a4;
- (id)fetchCNContactForHandleWithID:(id)a3;
- (id)fetchCNContactWithIdentifier:(id)a3;
- (id)fetchMeContactWithKeys:(id)a3;
- (id)fetchMeContactWithKeys:(id)a3 withError:(id *)a4;
- (id)getAllKeysFromIDToCNContactMap;
- (id)getCNIDToHandleIDsMap;
- (id)getContactForID:(id)a3;
- (id)getContactStore;
- (id)getHandleIDToCNIDMap;
- (id)getIDToCNContactMap;
- (id)handleIDsForCNID:(id)a3;
- (id)stateDictionaryForDiagnosticsRequest;
- (void)_cacheBatchFetchResults:(id)a3 handleIDsWithoutCNID:(id)a4;
- (void)_fetchContactsWithIdentifiers:(id)a3 usingCNID:(BOOL)a4;
- (void)addContact:(id)a3 withID:(id)a4;
- (void)addEntriesToIDToCNContactMap:(id)a3;
- (void)addIDToCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4;
- (void)checkForContactStoreChanges;
- (void)contactStoreChanged:(id)a3;
- (void)dealloc;
- (void)fetchCNContactsForHandlesWithIDs:(id)a3 isFinalBatch:(BOOL)a4;
- (void)generateCNIDToHandleIDMap;
- (void)handleDropEverythingEvent;
- (void)meCardChanged:(id)a3;
- (void)removeContactWithID:(id)a3;
- (void)removeIDFromCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4;
- (void)replaceContact:(id)a3 withID:(id)a4;
- (void)replaceWithMutableContactForID:(id)a3;
- (void)resetMeCard;
- (void)setBatchFetchingCompleted;
- (void)setBatchFetchingForLaunchCompleted:(BOOL)a3;
- (void)setBatchFetchingIsCompleted:(BOOL)a3;
- (void)setCNIDToHandleIDsMap:(id)a3;
- (void)setCNIDsForBatchFetch:(id)a3;
- (void)setChangeHistoryFetchQueue:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentHistoryToken:(id)a3;
- (void)setHandleIDToCNIDMap:(id)a3;
- (void)setIDToCNContactMap:(id)a3;
- (void)setLastContactStoreSync:(double)a3;
- (void)setLastMeContactStoreSync:(double)a3;
- (void)setMeContact:(id)a3;
- (void)setShouldSkipMeContactLookup:(BOOL)a3;
- (void)setStateCaptureAssistant:(id)a3;
@end

@implementation IMContactStore

+ (id)sharedInstance
{
  if (qword_1EB4A6700 != -1) {
    dispatch_once(&qword_1EB4A6700, &unk_1EF2BF700);
  }
  v2 = (void *)qword_1EB4A6668;

  return v2;
}

+ (BOOL)shouldShowAbbreviatedNames
{
  if (qword_1EB4A5FF8 != -1) {
    dispatch_once(&qword_1EB4A5FF8, &unk_1EF2BE478);
  }
  v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  v3 = v2;
  if (byte_1E94FE750) {
    char v4 = 1;
  }
  else {
    char v4 = [v2 isShortNameFormatEnabled];
  }

  return v4;
}

+ (id)displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    char v4 = 0;
    goto LABEL_14;
  }
  if (+[IMContactStore shouldShowNickNames])
  {
    char v4 = +[IMContactStore nickNameForCNContact:v3];
    if ([v4 length]) {
      goto LABEL_14;
    }
  }
  char v4 = +[IMContactStore fullNameForCNContact:v3];
  if (![v4 length])
  {
    v5 = +[IMContactStore companyNameForCNContact:v3];
    if ([v5 length])
    {
      id v6 = v5;
LABEL_13:

      char v4 = v6;
      goto LABEL_14;
    }
    if (!IMIsRunningInCarousel())
    {
      id v6 = +[IMContactStore abbreviatedNameForCNContact:v3];
      if ([v6 length]) {
        goto LABEL_13;
      }
    }
    id v6 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

+ (BOOL)shouldShowNickNames
{
  if (qword_1EB4A60F8 != -1) {
    dispatch_once(&qword_1EB4A60F8, &unk_1EF2BE458);
  }
  v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  id v3 = v2;
  if (byte_1E94FF728) {
    char v4 = 1;
  }
  else {
    char v4 = [v2 shortNameFormatPrefersNicknames];
  }

  return v4;
}

+ (id)nickNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 nickname];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)abbreviatedNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [(id)objc_opt_class() _stringFromContact:v3 withStyle:1000];

    if ([v4 length]) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)fullNameForCNContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() _stringFromContact:v3 withStyle:0];
    if ([v4 length])
    {
      id v5 = v4;
    }
    else
    {
      id v5 = +[IMContactStore firstNameForCNContact:v3];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_stringFromContact:(id)a3 withStyle:(int64_t)a4
{
  id v5 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1A077787C;
  v19 = sub_1A077772C;
  id v20 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A0776D90;
  aBlock[3] = &unk_1E5A13078;
  v13 = &v15;
  id v6 = v5;
  id v12 = v6;
  int64_t v14 = a4;
  v7 = _Block_copy(aBlock);
  v8 = +[IMContactStore IMContactStoreQueue];
  dispatch_sync(v8, v7);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (id)IMContactStoreQueue
{
  if (qword_1EB4A5F38 != -1) {
    dispatch_once(&qword_1EB4A5F38, &unk_1EF2BE438);
  }
  v2 = (void *)qword_1EB4A5F40;

  return v2;
}

+ (id)keysForMeContact
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = +[IMContactStore kIMCNContactIdentifierKey];
  id v4 = +[IMContactStore kIMCNContactPhoneNumbersKey];
  id v5 = +[IMContactStore kIMCNContactEmailAddressesKey];
  id v6 = objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, 0);

  if (+[IMContactStore IMCNContactFormatterClass])
  {
    v7 = [(objc_class *)+[IMContactStore IMCNContactFormatterClass] descriptorForRequiredKeysForStyle:0];
    [v6 addObject:v7];
  }
  v8 = (void *)[v6 copy];

  return v8;
}

+ (Class)IMCNContactFormatterClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  v2 = (void *)qword_1EB4A6518;

  return (Class)v2;
}

- (void)setCurrentHistoryToken:(id)a3
{
  id v5 = a3;
  id v6 = [(IMContactStore *)self currentHistoryToken];
  +[IMContactStore logHistoryToken:v6];

  if (v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Updating Current History token", buf, 2u);
      }
    }
    objc_storeStrong((id *)&v7->_currentHistoryToken, a3);
    objc_sync_exit(v7);

    id v9 = [(IMContactStore *)v7 currentHistoryToken];
    +[IMContactStore logHistoryToken:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "nil History token provided, not updating.", v11, 2u);
    }
  }
}

- (NSData)currentHistoryToken
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_currentHistoryToken;
  objc_sync_exit(v2);

  return v3;
}

+ (void)logHistoryToken:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Logging history token: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)fetchCNContactForHandleWithID:(id)a3
{
  return [(IMContactStore *)self fetchCNContactForHandleID:a3 withKeys:0];
}

- (void)_fetchContactsWithIdentifiers:(id)a3 usingCNID:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    v36 = +[IMContactStore keysForCNContact];
    v8 = objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v36);
    [v8 setUnifyResults:0];
    int v9 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v9)
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Fetching Contacts using CNIDs", buf, 2u);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v7];
    }
    else
    {
      if (v9)
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Fetching Contacts using Email & Phone", buf, 2u);
        }
      }
      uint64_t v11 = [(id)qword_1EB4A63E0 predicateForContactsMatchingHandleStrings:v7];
    }
    int64_t v14 = (void *)v11;
    [v8 setPredicate:v11];
    if ((IMIsRunningInUnitTesting() & v4) == 1) {
      objc_storeStrong((id *)&self->_CNIDsForBatchFetch, a3);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v15 startTimingForKey:@"Contacts Batch Fetch"];
    contactStore = self->_contactStore;
    id v37 = 0;
    uint64_t v17 = [(CNContactStore *)contactStore executeFetchRequest:v8 error:&v37];
    id v35 = v37;
    v18 = [v17 value];
    [v15 stopTimingForKey:@"Contacts Batch Fetch"];
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        [v15 totalTimeForKey:@"Contacts Batch Fetch"];
        *(_DWORD *)buf = 134217984;
        uint64_t v39 = v20;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Contacts batch fetch from Contact Store completed. Took %f seconds.", buf, 0xCu);
      }
    }
    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = [v18 count];
          uint64_t v23 = [v7 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v39 = v22;
          __int16 v40 = 2048;
          uint64_t v41 = v23;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Got results for %lu/%lu IDs from Contacts Batch Fetch", buf, 0x16u);
        }
      }
      +[IMContactStore logContactFetchRequestResults:v17];
      id v24 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      [v24 startTimingForKey:@"Contacts Caching"];
      v25 = [v17 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v27 = [v18 allValues];
        [(IMContactStore *)self _cacheBatchFetchResults:v27 handleIDsWithoutCNID:v7];
      }
      else
      {
        v28 = [v17 value];
        objc_opt_class();
        char v29 = objc_opt_isKindOfClass();

        if (v29) {
          [(IMContactStore *)self _cacheBatchFetchResults:v18 handleIDsWithoutCNID:v7];
        }
      }
      if (IMAdditionalContactsLoggingEnabled())
      {
        v30 = [(IMContactStore *)self getIDToCNContactMap];
        +[IMContactStore logDictionary:v30];
      }
      [v24 stopTimingForKey:@"Contacts Caching"];
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          [v24 totalTimeForKey:@"Contacts Caching"];
          *(_DWORD *)buf = 134217984;
          uint64_t v39 = v32;
          _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "IMContact Store caching completed. Took %f seconds", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = (uint64_t)v35;
        _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "No results obtained from the CN fetch request. Error: %@", buf, 0xCu);
      }
    }
    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      v34 = [v17 currentHistoryToken];
      [(IMContactStore *)self setCurrentHistoryToken:v34];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Passed in empty set of identifiers", buf, 2u);
    }
  }
}

- (IMContactStore)initWithContactStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMContactStore;
  id v6 = [(IMContactStore *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    currentHistoryToken = v7->_currentHistoryToken;
    v7->_currentHistoryToken = 0;

    int v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.private.IMSharedUtilities.IMContactStore", v9);
    changeHistoryFetchQueue = v7->_changeHistoryFetchQueue;
    v7->_changeHistoryFetchQueue = (OS_dispatch_queue *)v10;

    id v12 = [IMStateCaptureAssistant alloc];
    uint64_t v13 = [(IMStateCaptureAssistant *)v12 initWithObject:v7 title:@"IMContactStore" queue:MEMORY[0x1E4F14428]];
    stateCaptureAssistant = v7->_stateCaptureAssistant;
    v7->_stateCaptureAssistant = (IMStateCaptureAssistant *)v13;

    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel_contactStoreChanged_ name:*MEMORY[0x1E4F1AF80] object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel_meCardChanged_ name:*MEMORY[0x1E4F1AF88] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_1A081997C, @"CNMeCardSharingPickerViewControllerDidSaveNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v7;
}

- (void)fetchCNContactsForHandlesWithIDs:(id)a3 isFinalBatch:(BOOL)a4
{
  BOOL v28 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v30 startTimingForKey:@"Fetch CNContacts For HandleIDs"];
  char v29 = v5;
  v31 = +[IMContactStore validateAndFilterIDsForContactsBatchFetch:v5];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v38 = [v5 count];
      __int16 v39 = 2048;
      uint64_t v40 = [v31 count];
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "%lu handles passed in. %lu valid IDs for batch fetch", buf, 0x16u);
    }
  }
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  if ([v31 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v31;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          int64_t v14 = [(NSDictionary *)self->_handleIDToCNIDMap objectForKey:v13];
          id v15 = v14;
          if (v14 && ([v14 containsString:@"IMDCNPersonNotFound"] & 1) == 0) {
            [v7 addObject:v15];
          }
          else {
            [v8 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [v7 count];
      uint64_t v18 = [v8 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = v18;
      _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "%lu handles found in aliasCNID cache. Did not find %lu in cache.", buf, 0x16u);
    }
  }
  if ([v8 count])
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Handles without CNID in cache are:", buf, 2u);
      }
    }
    +[IMContactStore logHandleIDs:v8 checkAdditionalLoggingEnabled:0];
  }
  if ([v7 count])
  {
    if (![v7 count]
      || (unint64_t v20 = [v7 count],
          unint64_t v21 = [v7 count],
          (float)((float)v20 / (float)((float)v21 + (float)(unint64_t)[v8 count])) >= 0.1))
    {
      [(IMContactStore *)self _fetchContactsWithIdentifiers:v7 usingCNID:1];
      goto LABEL_41;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Refetching as we don't have anything in IMDP cache", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (uint64_t)v8;
      _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Refetching contacts from MobileSMS using handle IDs: %@", buf, 0xCu);
    }
  }
  [(IMContactStore *)self _fetchContactsWithIdentifiers:v8 usingCNID:0];
LABEL_41:
  [v30 stopTimingForKey:@"Fetch CNContacts For HandleIDs"];
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      [v30 totalTimeForKey:@"Fetch CNContacts For HandleIDs"];
      v26 = @"Initial";
      if (v28) {
        v26 = @"Final";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = (uint64_t)v26;
      __int16 v39 = 2048;
      uint64_t v40 = v25;
      _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "%@ Batch Fetch completed. Took %f seconds", buf, 0x16u);
    }
  }
  if (v28)
  {
    v27 = +[IMContactStore sharedInstance];
    [v27 setBatchFetchingCompleted];

    dispatch_async(MEMORY[0x1E4F14428], &unk_1EF2C0180);
  }
}

+ (id)validateAndFilterIDsForContactsBatchFetch:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if ([v10 length]) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_cacheBatchFetchResults:(id)a3 handleIDsWithoutCNID:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        [v42 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v7);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v35 = [v42 allKeys];
  uint64_t v38 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v54;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v54 != v37)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(v35);
          uint64_t v12 = v13;
        }
        uint64_t v41 = v12;
        uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * v12);
        long long v15 = [v42 objectForKey:v14];
        long long v16 = [(IMContactStore *)self handleIDsForCNID:v14];
        if (!v16)
        {
          uint64_t v17 = [v15 linkIdentifier];
          uint64_t v18 = [(IMContactStore *)self handleIDsForCNID:v17];

          long long v16 = (void *)v18;
        }
        if (v16) {
          BOOL v19 = v15 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v36 = v16;
          id v20 = v16;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v66 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v50 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * j);
                if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
                {
                  uint64_t v25 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v63 = v24;
                    __int16 v64 = 2112;
                    v65 = v15;
                    _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Adding to entriesToApp ID:%@, Contact:%@", buf, 0x16u);
                  }
                }
                [v6 setObject:v15 forKey:v24];
              }
              uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v66 count:16];
            }
            while (v21);
          }

          long long v16 = v36;
        }

        uint64_t v12 = v41 + 1;
      }
      while (v41 + 1 != v38);
      uint64_t v38 = [v35 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v38);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v26 = v34;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8 * k);
        v31 = +[IMContactStore createMutableContactWithID:v30];
        if (v31) {
          [v6 setObject:v31 forKey:v30];
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v27);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    long long v32 = (void *)[v6 copy];
    [(IMContactStore *)self addEntriesToIDToCNContactMap:v32];
  }
  else
  {
    long long v33 = +[IMContactStore IMContactStoreQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0819F3C;
    block[3] = &unk_1E5A10080;
    block[4] = self;
    id v44 = v6;
    dispatch_async(v33, block);
  }
}

- (id)handleIDsForCNID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = self;
    objc_sync_enter(v5);
    CNIDToHandleIDsMap = v5->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      [(IMContactStore *)v5 generateCNIDToHandleIDMap];
      CNIDToHandleIDsMap = v5->_CNIDToHandleIDsMap;
    }
    uint64_t v7 = [(NSMutableDictionary *)CNIDToHandleIDsMap objectForKey:v4];
    uint64_t v8 = (void *)[v7 copy];

    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fetchCNContactForHandleID:(id)a3 withKeys:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    uint64_t v10 = 0;
    goto LABEL_67;
  }
  uint64_t v8 = +[IMContactStore validateAndCleanupID:v6];
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Adding to validatedID:%@", buf, 0xCu);
    }
  }
  if ([v8 length] && (MEMORY[0x1A62278A0](v8) & 1) == 0)
  {
    uint64_t v11 = [(IMContactStore *)self getContactForID:v8];
    if ([v11 areKeysAvailable:v7])
    {
LABEL_12:
      uint64_t v11 = v11;
      uint64_t v10 = v11;
LABEL_65:

      goto LABEL_66;
    }
    if (IMIsRunningInMessages()
      && ![(IMContactStore *)self isBatchFetchingForLaunchCompleted])
    {
      int v20 = [v11 areKeysAvailable:v7];
      int v21 = IMOSLoggingEnabled();
      if (v20)
      {
        if (v21)
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v11;
            _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Batch fetching is still in process, returning: %@.", buf, 0xCu);
          }
        }
        goto LABEL_12;
      }
      if (v21)
      {
        BOOL v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v11;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Batch fetching is still in process, but our cached contact does not have the required keys: %@. Returning: nil.", buf, 0xCu);
        }
        goto LABEL_44;
      }
    }
    else
    {
      if (+[IMContactStore _shouldAllowContactStoreLookup])
      {
        long long v33 = +[IMContactStore predicateForID:v8];
        uint64_t v12 = +[IMContactStore keysForCNContact];
        long long v32 = [v7 arrayByExcludingObjectsInArray:v12];
        if (v7 && v32)
        {
          uint64_t v13 = objc_msgSend(v12, "arrayByAddingObjectsFromArray:");

          uint64_t v12 = (void *)v13;
        }
        if (!v33)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v8;
              _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Failed to fetch predicate for id: %@.", buf, 0xCu);
            }
          }
          uint64_t v10 = 0;
          int v18 = 1;
LABEL_64:

          if (v18) {
            goto LABEL_65;
          }
          goto LABEL_12;
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
        [v14 startTimingForKey:@"Contacts Singular Fetch"];
        contactStore = self->_contactStore;
        id v34 = 0;
        uint64_t v10 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v33 keysToFetch:v12 error:&v34];
        id v30 = v34;
        uint64_t v31 = [v10 firstObject];

        [v14 stopTimingForKey:@"Contacts Singular Fetch"];
        [v14 totalTimeForKey:@"Contacts Singular Fetch"];
        if (v16 > 0.1 && IMOSLoggingEnabled())
        {
          uint64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            [v14 totalTimeForKey:@"Contacts Singular Fetch"];
            *(_DWORD *)buf = 134217984;
            id v36 = v17;
            _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Contacts Store fetch completed. Took %f seconds", buf, 0xCu);
          }
        }
        if (v31)
        {
          +[IMContactStore logCNContact:](IMContactStore, "logCNContact:");
          [(IMContactStore *)self addContact:v31 withID:v8];
          int v18 = 0;
          goto LABEL_63;
        }
        int v24 = IMOSLoggingEnabled();
        if (v30)
        {
          if (v24)
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v36 = v8;
              __int16 v37 = 2112;
              id v38 = v30;
              _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Unified Fetch failed for ID: %@. Error: %@", buf, 0x16u);
            }
LABEL_54:
          }
        }
        else if (v24)
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v8;
            _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Did not find a contact with id: %@ in AddressBook.", buf, 0xCu);
          }
          goto LABEL_54;
        }
        uint64_t v10 = +[IMContactStore createMutableContactWithID:v8];
        if (v10)
        {
          id v26 = +[IMUnlockMonitor sharedInstance];
          char v27 = [v26 isUnderFirstDataProtectionLock];

          if ((v27 & 1) == 0)
          {
            [(IMContactStore *)self addContact:v10 withID:v8];
            int v18 = 1;
            goto LABEL_63;
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v8;
              _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Not caching contact with id: %@ because we are before first unlock.", buf, 0xCu);
            }
          }
        }

        int v18 = 0;
LABEL_63:

        uint64_t v11 = v31;
        goto LABEL_64;
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Contact fetch not allowed for this process/platform.", buf, 2u);
        }
LABEL_44:
      }
    }
    uint64_t v10 = 0;
    goto LABEL_65;
  }
  uint64_t v10 = 0;
LABEL_66:

LABEL_67:

  return v10;
}

- (BOOL)isBatchFetchingForLaunchCompleted
{
  return self->_batchFetchingForLaunchCompleted;
}

- (id)completedContact:(id)a3 withKeys:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
LABEL_13:
    id v8 = 0;
    goto LABEL_20;
  }
  if ([v6 areKeysAvailable:v7])
  {
    id v8 = v6;
    goto LABEL_20;
  }
  if (!+[IMContactStore _shouldAllowContactStoreLookup])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Contact fetch not allowed in non Messages processes", buf, 2u);
      }
    }
    goto LABEL_13;
  }
  id v9 = [v6 availableKeyDescriptor];
  v36[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];

  if (v7)
  {
    uint64_t v11 = [v10 arrayByAddingObjectsFromArray:v7];

    uint64_t v10 = (void *)v11;
  }
  uint64_t v12 = objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v10);
  [v12 setUnifyResults:0];
  uint64_t v13 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v14 = [v6 identifier];
  uint64_t v35 = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  double v16 = [v13 predicateForContactsWithIdentifiers:v15];
  [v12 setPredicate:v16];

  *(void *)buf = 0;
  id v26 = buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1A077787C;
  char v29 = sub_1A077772C;
  id v30 = 0;
  contactStore = self->_contactStore;
  v23[5] = buf;
  id v24 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1A081A15C;
  v23[3] = &unk_1E5A13050;
  v23[4] = self;
  LOBYTE(v14) = [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v12 error:&v24 usingBlock:v23];
  id v18 = v24;
  if (v14)
  {
    id v8 = *((id *)v26 + 5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v6 identifier];
        *(_DWORD *)uint64_t v31 = 138412546;
        long long v32 = v21;
        __int16 v33 = 2112;
        id v34 = v18;
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "Failed to complete contact for contact id: %@, error: %@", v31, 0x16u);
      }
    }
    id v8 = 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_20:

  return v8;
}

- (BOOL)isIDAKnownContact:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = +[IMContactStore validateAndCleanupID:v4];
    id v6 = [(IMContactStore *)self getHandleIDToCNIDMap];
    id v7 = [v6 objectForKey:v5];

    if (v7 && [v7 length])
    {
      int v8 = [v7 containsString:@"IMDCNPersonNotFound"] ^ 1;
    }
    else
    {
      id v9 = [(IMContactStore *)self getContactForID:v5];
      if (v9) {
        LOBYTE(v8) = +[IMContactStore isCNContactAKnownContact:v9];
      }
      else {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)validateAndCleanupID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)MEMORY[0x1A6228190]();
    id v5 = MEMORY[0x1A62278F0](v3);
    id v6 = IMStripFormattingFromAddress();

    if ([v6 length])
    {
      if (MEMORY[0x1A62278C0](v6) & 1) != 0 || (IMStringIsEmail()) {
        char v7 = 0;
      }
      else {
        char v7 = MEMORY[0x1A62278A0](v6) ^ 1;
      }
      id v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v10 = [v3 stringByTrimmingCharactersInSet:v9];
      uint64_t v11 = [v10 length];

      id v8 = 0;
      if ((v7 & 1) == 0 && v11) {
        id v8 = v6;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)getHandleIDToCNIDMap
{
  v2 = (void *)[(NSDictionary *)self->_handleIDToCNIDMap copy];

  return v2;
}

- (id)getContactForID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length] && IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Invalid ID, cannot fetch CNContact from Map.ID: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v6 = +[IMContactStore validateAndCleanupID:v4];
  if ([v6 length])
  {
    char v7 = self->_IDToCNContactMap;
    objc_sync_enter(v7);
    id v8 = [(NSMutableDictionary *)self->_IDToCNContactMap objectForKey:v6];
    if (!v8)
    {
      if (MEMORY[0x1A62278C0](v4) && ([v4 hasPrefix:@"+"] & 1) == 0)
      {
        id v9 = +[IMContactStore dialingCodeForID:v4];
        if ([v9 length])
        {
          uint64_t v10 = [v4 stringByReplacingOccurrencesOfString:v9 withString:&stru_1EF2CAD28];
          uint64_t v11 = MEMORY[0x1A62278F0]();

          if ([v11 length])
          {
            id v8 = [(NSMutableDictionary *)self->_IDToCNContactMap objectForKey:v11];
          }
          else
          {
            id v8 = 0;
          }
          id v6 = v11;
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    objc_sync_exit(v7);
  }
  else
  {
    id v8 = 0;
  }
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Returning Contact:%@ for ID:%@", (uint8_t *)&v14, 0x16u);
    }
  }

  return v8;
}

+ (id)createMutableContactWithID:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length] || (MEMORY[0x1A62278A0](v3) & 1) != 0)
  {
    id v4 = 0;
    goto LABEL_11;
  }
  id v5 = MEMORY[0x1A62278F0](v3);
  if ([v5 _appearsToBeEmail])
  {
    id v4 = objc_alloc_init(+[IMContactStore IMCNMutableContactClass]);
    id v6 = [(objc_class *)+[IMContactStore IMCNLabeledValueClass] labeledValueWithLabel:0 value:v5];
    v12[0] = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 setEmailAddresses:v7];
  }
  else
  {
    if (![v5 _appearsToBePhoneNumber])
    {
      id v4 = 0;
      goto LABEL_10;
    }
    id v4 = objc_alloc_init(+[IMContactStore IMCNMutableContactClass]);
    id v8 = +[IMContactStore IMCNLabeledValueClass];
    id v9 = [(objc_class *)+[IMContactStore IMCNPhoneNumberClass] phoneNumberWithStringValue:v5];
    id v6 = [(objc_class *)v8 labeledValueWithLabel:0 value:v9];

    uint64_t v11 = v6;
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v4 setPhoneNumbers:v7];
  }

LABEL_10:
LABEL_11:

  return v4;
}

- (void)setHandleIDToCNIDMap:(id)a3
{
  id v5 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "handleIDToCNIDMap before update", buf, 2u);
      }
    }
    char v7 = [(IMContactStore *)self getHandleIDToCNIDMap];
    +[IMContactStore logDictionary:v7];
  }
  int v8 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Updating the handleIDToCNIDMap", v14, 2u);
      }
    }
    objc_storeStrong((id *)&self->_handleIDToCNIDMap, a3);
    if (IMAdditionalContactsLoggingEnabled())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "handleIDToCNIDMap after update", v13, 2u);
        }
      }
      uint64_t v11 = [(IMContactStore *)self getHandleIDToCNIDMap];
      +[IMContactStore logDictionary:v11];
LABEL_21:
    }
  }
  else if (v8)
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Error updating handleIDToCNIDMap", v12, 2u);
    }
    goto LABEL_21;
  }
}

- (IMContactStore)init
{
  qword_1EB4A63E0 = MEMORY[0x1A6227910](@"CNContact", @"Contacts");
  qword_1EB4A65A0 = MEMORY[0x1A6227910](@"CNContactStore", @"Contacts");
  if (+[IMContactStore _shouldAllowContactStoreLookup]
    && (id v3 = objc_alloc_init(MEMORY[0x1E4F1B990]),
        [v3 setUseInProcessMapperExclusively:1],
        id v4 = (void *)[objc_alloc((Class)qword_1EB4A65A0) initWithConfiguration:v3],
        v3,
        v4))
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "CNContactStore setup completed!", v9, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Failed to setup CNContactStore", buf, 2u);
      }
    }
    id v4 = 0;
  }
  char v7 = [(IMContactStore *)self initWithContactStore:v4];

  return v7;
}

- (NSDictionary)handleIDToCNIDMap
{
  return self->_handleIDToCNIDMap;
}

- (id)getContactStore
{
  return self->_contactStore;
}

- (void)generateCNIDToHandleIDMap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
  self->_CNIDToHandleIDsMap = v3;

  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(NSMutableDictionary *)self->_CNIDToHandleIDsMap allKeys];
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = [v6 count];
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "CNIDToHandleIDsMap before update. Number of entries %lu", buf, 0xCu);
      }
    }
    char v7 = [(IMContactStore *)self getCNIDToHandleIDsMap];
    +[IMContactStore logDictionary:v7];
  }
  int v8 = [(IMContactStore *)self handleIDToCNIDMap];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A078B6FC;
  v13[3] = &unk_1E5A10A30;
  v13[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];

  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [(NSMutableDictionary *)self->_CNIDToHandleIDsMap allKeys];
        uint64_t v11 = [v10 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "CNIDToHandleIDsMap after update. Number of entries %lu", buf, 0xCu);
      }
    }
    uint64_t v12 = [(IMContactStore *)self getCNIDToHandleIDsMap];
    +[IMContactStore logDictionary:v12];
  }
}

- (id)fetchMeContactWithKeys:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[IMContactStore _shouldAllowContactStoreLookup])
  {
    if (!self->_shouldSkipMeContactLookup)
    {
      meContact = self->_meContact;
      if (!meContact || ![(CNContact *)meContact areKeysAvailable:v6])
      {
        if (![v6 count])
        {
          uint64_t v8 = +[IMContactStore keysForMeContact];

          id v6 = (id)v8;
        }
        id v9 = objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v6);
        uint64_t v10 = +[IMContactStore mePredicate];
        [v9 setPredicate:v10];
        contactStore = self->_contactStore;
        id v24 = 0;
        uint64_t v12 = [(CNContactStore *)contactStore executeFetchRequest:v9 error:&v24];
        id v13 = v24;
        int v14 = [v12 value];
        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v13;
              _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Could not fetch MeCard from CNContactStore:%@", buf, 0xCu);
            }
          }
          if (a4) {
            *a4 = v13;
          }
        }
        else
        {
          uint64_t v18 = [v12 currentHistoryToken];
          [(IMContactStore *)self setCurrentHistoryToken:v18];
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        self->_lastMeContactStoreSync = v19;
        int v20 = [v14 firstObject];
        int v21 = self->_meContact;
        self->_meContact = v20;

        BOOL v22 = v13 != 0;
        if (self->_meContact) {
          BOOL v22 = 1;
        }
        if (!v22) {
          self->_shouldSkipMeContactLookup = 1;
        }
      }
    }
    id v17 = self->_meContact;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Me Contact fetch not allowed in non Messages processes", buf, 2u);
      }
    }
    id v17 = 0;
  }

  return v17;
}

- (id)fetchMeContactWithKeys:(id)a3
{
  uint64_t v5 = 0;
  id v3 = [(IMContactStore *)self fetchMeContactWithKeys:a3 withError:&v5];

  return v3;
}

- (void)addEntriesToIDToCNContactMap:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    IDToCNContactMap = self->_IDToCNContactMap;
    if (!IDToCNContactMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      char v7 = self->_IDToCNContactMap;
      self->_IDToCNContactMap = Mutable;

      IDToCNContactMap = self->_IDToCNContactMap;
    }
    uint64_t v8 = IDToCNContactMap;
    objc_sync_enter(v8);
    [(NSMutableDictionary *)self->_IDToCNContactMap addEntriesFromDictionary:v9];
    objc_sync_exit(v8);

    id v4 = v9;
  }
}

+ (void)logContactFetchRequestResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [v3 value];
        int v19 = 134217984;
        uint64_t v20 = [v5 count];
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Logging Contact Store fetch result. Obtained (%lu) results from Contacts Store.", (uint8_t *)&v19, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "The results are:", (uint8_t *)&v19, 2u);
      }
    }
    char v7 = [v3 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "fetchResult is a Dictionary", (uint8_t *)&v19, 2u);
        }
      }
      uint64_t v10 = [v3 value];
      +[IMContactStore logDictionary:v10 inBatchesOfSize:10];
    }
    else
    {
      uint64_t v11 = [v3 value];
      objc_opt_class();
      char v12 = objc_opt_isKindOfClass();

      int v13 = IMOSLoggingEnabled();
      if (v12)
      {
        if (v13)
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "fetchResult is an Array", (uint8_t *)&v19, 2u);
          }
        }
        uint64_t v15 = [v3 value];
        +[IMContactStore _logArray:v15 inBatchesOfSize:10];
      }
      else if (v13)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = objc_opt_class();
          int v19 = 138412290;
          uint64_t v20 = (uint64_t)v17;
          id v18 = v17;
          _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Unable to log CNFetchResult. Class: %@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
  }
}

+ (id)mePredicate
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F1B8F8], sel_predicateForMeContact);
}

+ (id)keysForCNContact
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v2 = +[IMContactStore kIMCNContactIdentifierKey];
  v12[0] = v2;
  id v3 = +[IMContactStore kIMCNContactEmailAddressesKey];
  v12[1] = v3;
  id v4 = +[IMContactStore kIMCNContactPhoneNumbersKey];
  void v12[2] = v4;
  uint64_t v5 = +[IMContactStore kIMCNContactLinkIdentifierKey];
  v12[3] = v5;
  id v6 = [(objc_class *)+[IMContactStore IMCNContactFormatterClass] descriptorForRequiredKeysForStyle:0];
  v12[4] = v6;
  char v7 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
  v12[5] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];

  if (IMSharedHelperDeviceHasMultipleSubscriptions()
    && [(objc_class *)+[IMContactStore IMCNGeminiManagerClass] deviceSupportsGemini])
  {
    id v9 = [(objc_class *)+[IMContactStore IMCNGeminiManagerClass] descriptorForRequiredKeys];
    uint64_t v10 = [v8 arrayByAddingObject:v9];

    uint64_t v8 = (void *)v10;
  }

  return v8;
}

+ (id)kIMCNContactPhoneNumbersKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  v2 = (void *)qword_1EB4A64F0;

  return v2;
}

+ (id)kIMCNContactLinkIdentifierKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  v2 = (void *)qword_1EB4A64E8;

  return v2;
}

+ (id)kIMCNContactIdentifierKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  v2 = (void *)qword_1EB4A64D0;

  return v2;
}

+ (id)kIMCNContactEmailAddressesKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  v2 = (void *)qword_1EB4A64C8;

  return v2;
}

+ (BOOL)_shouldAllowContactStoreLookup
{
  if ((IMIsRunningInFaceTime() & 1) != 0
    || (IMIsRunningInSafari() & 1) != 0
    || (IMIsRunningInSOSBuddy() & 1) != 0
    || IMIsRunningInSafariSandboxBroker())
  {
    int v2 = IMOSLoggingEnabled();
    if (v2)
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Contacts fetch NOT allowed", v5, 2u);
      }

      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

+ (Class)IMCNContactFetchRequestClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6510;

  return (Class)v2;
}

+ (void)logDictionary:(id)a3
{
}

+ (void)logDictionary:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v4 || IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v7 = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Logging Dictionary", v7, 2u);
      }
    }
    +[IMContactStore logDictionary:v5 inBatchesOfSize:20];
  }
}

+ (void)logDictionary:(id)a3 inBatchesOfSize:(int64_t)a4
{
  id v12 = a3;
  id v5 = [v12 allKeys];
  uint64_t v6 = [v5 count];

  int64_t v7 = v6 / a4;
  int64_t v8 = v6 % a4;
  id v9 = +[IMContactStore _sortContactsFor:v12];
  if (v7 >= 1)
  {
    uint64_t v10 = 0;
    int64_t v11 = v7;
    do
    {
      +[IMContactStore _logDictionaryInformation:withSortedKeys:inRange:](IMContactStore, "_logDictionaryInformation:withSortedKeys:inRange:", v12, v9, v10, a4);
      v10 += a4;
      --v11;
    }
    while (v11);
  }
  if (v8 > 0) {
    +[IMContactStore _logDictionaryInformation:withSortedKeys:inRange:](IMContactStore, "_logDictionaryInformation:withSortedKeys:inRange:", v12, v9, v7 * a4, v8);
  }
}

+ (void)logHandleIDs:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v4 || IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 134217984;
        uint64_t v8 = [v5 count];
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Logging %lu IDs", (uint8_t *)&v7, 0xCu);
      }
    }
    +[IMContactStore _logArray:v5 inBatchesOfSize:20];
  }
}

+ (void)logCNContact:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [v3 description];
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Logging additional details about CNContact: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (void)logCNContact:(id)a3 andID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v5 description];
        int v9 = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        id v12 = v8;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "ID: %@ and CNContact: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    +[IMContactStore logCNContact:v5];
  }
}

+ (void)logHandleID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    BOOL v4 = +[IMContactStore sharedInstance];
    id v5 = [v4 fetchCNContactForHandleWithID:v3];

    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = [v5 description];
        int v8 = 138412546;
        id v9 = v3;
        __int16 v10 = 2112;
        __int16 v11 = v7;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "For ID %@ found an entry in cache: %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

+ (void)_logArray:(id)a3 inBatchesOfSize:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  uint64_t v14 = v6;
  int64_t v7 = v6 / a4;
  if (v6 / a4 >= 1)
  {
    uint64_t v8 = 0;
    int64_t v9 = v6 / a4;
    do
    {
      __int16 v10 = objc_msgSend(v5, "subarrayWithRange:", v8, a4);
      if (IMOSLoggingEnabled())
      {
        __int16 v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v10;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      v8 += a4;
      --v9;
    }
    while (v9);
  }
  if (v14 - v7 * a4 > 0)
  {
    uint64_t v12 = [v5 subarrayWithRange:v7 * a4];
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
  }
}

+ (id)_sortContactsFor:(id)a3
{
  return (id)MEMORY[0x1F4181798](a3, sel_keysSortedByValueUsingComparator_);
}

+ (void)_logDictionaryInformation:(id)a3 withSortedKeys:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v16 = a4;
  objc_msgSend(v16, "subarrayWithRange:", location, length);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v22 = v13;
            __int16 v23 = 2112;
            id v24 = v14;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Handle ID: %@, CNID:%@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  BOOL v4 = [(IMContactStore *)self stateCaptureAssistant];
  [v4 deregister];

  [(IMContactStore *)self setStateCaptureAssistant:0];
  v5.receiver = self;
  v5.super_class = (Class)IMContactStore;
  [(IMContactStore *)&v5 dealloc];
}

+ (Class)IMCNMutableContactClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6538;

  return (Class)v2;
}

+ (Class)IMCNLabeledValueClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6528;

  return (Class)v2;
}

+ (Class)IMCNPhoneNumberClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6540;

  return (Class)v2;
}

+ (Class)IMCNChangeHistoryFetchRequestClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6508;

  return (Class)v2;
}

+ (Class)IMCNMeCardSharingPickerViewControllerClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6530;

  return (Class)v2;
}

+ (Class)IMCNGeminiManagerClass
{
  if (qword_1EB4A6548 != -1) {
    dispatch_once(&qword_1EB4A6548, &unk_1EF2BFD00);
  }
  int v2 = (void *)qword_1EB4A6520;

  return (Class)v2;
}

+ (id)kIMCNContactImageDataAvailableKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A64D8;

  return v2;
}

+ (id)kIMCNContactImageDataKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A64E0;

  return v2;
}

+ (id)kIMCNContactThumbnailImageDataKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A64F8;

  return v2;
}

+ (id)kIMCNContactCropRectKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A64C0;

  return v2;
}

+ (id)kIMCNContactWallpaperKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A6408;

  return v2;
}

+ (id)kIMCNContactWatchWallpaperImageDataKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A6410;

  return v2;
}

+ (id)kIMCNContactImageBackgroundColorsDataKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A6400;

  return v2;
}

+ (id)kIMCNContactSensitiveContentConfigurationKey
{
  if (qword_1EB4A64B8 != -1) {
    dispatch_once(&qword_1EB4A64B8, &unk_1EF2BFF40);
  }
  int v2 = (void *)qword_1EB4A63E8;

  return v2;
}

- (id)batchFetchContactsWithoutCachingForIdentifiers:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[IMContactStore keysForCNContact];
  uint64_t v6 = objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v5);
  [v6 setUnifyResults:1];
  int64_t v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsWithIdentifiers:v4];

  [v6 setPredicate:v7];
  contactStore = self->_contactStore;
  uint64_t v15 = 0;
  id v9 = [(CNContactStore *)contactStore executeFetchRequest:v6 error:&v15];
  uint64_t v10 = [v9 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v10 allValues];
LABEL_5:
    uint64_t v12 = v11;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    goto LABEL_5;
  }
  uint64_t v13 = IMLogHandleForCategory("Contacts");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1A09F0FBC(v13);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_9:

  return v12;
}

- (id)fetchCNContactWithIdentifier:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length])
  {
LABEL_17:
    id v11 = 0;
    goto LABEL_18;
  }
  if (!+[IMContactStore _shouldAllowContactStoreLookup])
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Contact fetch not allowed in non Messages processes", buf, 2u);
      }
    }
    goto LABEL_17;
  }
  objc_super v5 = +[IMContactStore keysForCNContact];
  uint64_t v6 = (void *)MEMORY[0x1E4F1B8F8];
  v23[0] = v4;
  int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v8 = [v6 predicateForContactsWithIdentifiers:v7];

  id v9 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v9 startTimingForKey:@"Contacts Identifier Fetch"];
  contactStore = self->_contactStore;
  id v18 = 0;
  id v11 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v8 keysToFetch:v5 error:&v18];
  id v12 = v18;
  [v9 stopTimingForKey:@"Contacts Batch Fetch"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      [v9 totalTimeForKey:@"Contacts Identifier Fetch"];
      *(_DWORD *)buf = 134217984;
      id v20 = v14;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Contacts fetch based on identifier from Contact Store completed. Took %f seconds.", buf, 0xCu);
    }
  }
  if (v12 && IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Identifier based Fetch failed for identifier: %@. Error: %@", buf, 0x16u);
    }
  }
LABEL_18:

  return v11;
}

- (void)setBatchFetchingCompleted
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Contacts batch fetching completed", v4, 2u);
    }
  }
  self->_batchFetchingForLaunchCompleted = 1;
}

- (void)setBatchFetchingIsCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = IMIsRunningInUnitTesting();
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      int64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        if (v3) {
          id v8 = @"YES";
        }
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Set Contacts batch fetching completed: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    self->_batchFetchingForLaunchCompleted = v3;
  }
  else if (v6)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Not updating the Batch Fetching completed state since this interface is for Unit Testing only.", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)removeIDFromCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v12 length] && objc_msgSend(v6, "length"))
  {
    CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      [(IMContactStore *)self generateCNIDToHandleIDMap];
      CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    }
    id v8 = [(NSMutableDictionary *)CNIDToHandleIDsMap objectForKey:v6];
    id v9 = +[IMContactStore validateAndCleanupID:v12];
    if ([v8 count] && objc_msgSend(v8, "containsObject:", v9)) {
      [v8 removeObject:v9];
    }
    uint64_t v10 = [v8 count];
    id v11 = self->_CNIDToHandleIDsMap;
    if (v10) {
      [(NSMutableDictionary *)v11 setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)v11 removeObjectForKey:v6];
    }
  }
}

- (void)addIDToCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 length] && objc_msgSend(v6, "length"))
  {
    CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      [(IMContactStore *)self generateCNIDToHandleIDMap];
      CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    }
    id v8 = [(NSMutableDictionary *)CNIDToHandleIDsMap objectForKey:v6];
    id v9 = +[IMContactStore validateAndCleanupID:v11];
    if (![v8 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

      id v8 = v10;
    }
    if ([v9 length]) {
      [v8 addObject:v9];
    }
    if (v8) {
      [(NSMutableDictionary *)self->_CNIDToHandleIDsMap setObject:v8 forKey:v6];
    }
  }
}

- (id)cnContactIdentifierForID:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    id v9 = 0;
    goto LABEL_14;
  }
  int v5 = +[IMContactStore validateAndCleanupID:v4];
  id v6 = [(IMContactStore *)self getHandleIDToCNIDMap];
  int64_t v7 = [v6 objectForKey:v5];

  if (v7 && [v7 length]) {
    goto LABEL_9;
  }
  id v8 = [(IMContactStore *)self getContactForID:v5];
  if (!v8
    || !+[IMContactStore isCNContactAKnownContact:v8])
  {

LABEL_9:
    if ([v7 containsString:@"IMDCNPersonNotFound"]) {
      id v10 = 0;
    }
    else {
      id v10 = v7;
    }
    id v9 = v10;
    goto LABEL_13;
  }
  id v9 = [v8 identifier];

LABEL_13:
LABEL_14:

  return v9;
}

- (BOOL)isContactWithIDAlreadyFetched:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    int v5 = [(IMContactStore *)self getContactForID:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)addContact:(id)a3 withID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 length])
  {
    if (IMAdditionalContactsLoggingEnabled()) {
      +[IMContactStore logCNContact:v6 andID:v8];
    }
    id v9 = +[IMContactStore validateAndCleanupID:v8];
    if ([v9 length])
    {
      IDToCNContactMap = self->_IDToCNContactMap;
      if (!IDToCNContactMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        id v12 = self->_IDToCNContactMap;
        self->_IDToCNContactMap = Mutable;

        IDToCNContactMap = self->_IDToCNContactMap;
      }
      uint64_t v13 = IDToCNContactMap;
      objc_sync_enter(v13);
      +[IMContactStore logCNContact:v6 andID:v8];
      [(NSMutableDictionary *)self->_IDToCNContactMap setObject:v6 forKey:v9];
      uint64_t v14 = [v6 identifier];
      [(IMContactStore *)self addIDToCNIDToHandleIDsMap:v9 withCNID:v14];

      +[IMContactStore logCNContact:v6 andID:v8];
      objc_sync_exit(v13);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      long long v17 = v8;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Not adding Contact with ID:%@ to Map", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)removeContactWithID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length] && IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Invalid ID, cannot remove CNContact from Map.ID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  +[IMContactStore logHandleID:v4];
  id v6 = [(IMContactStore *)self getContactForID:v4];
  if (v6)
  {
    id v7 = +[IMContactStore validateAndCleanupID:v4];
    if ([v7 length])
    {
      id v8 = self->_IDToCNContactMap;
      objc_sync_enter(v8);
      [(NSMutableDictionary *)self->_IDToCNContactMap removeObjectForKey:v7];
      id v9 = [v6 identifier];
      [(IMContactStore *)self removeIDFromCNIDToHandleIDsMap:v7 withCNID:v9];

      +[IMContactStore logHandleID:v4];
      objc_sync_exit(v8);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "No contact in map with ID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)replaceContact:(id)a3 withID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 length] && IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Invalid ID, cannot replace CNContact from Map.ID: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  if (!v6 && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Invalid contact: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  +[IMContactStore logCNContact:v6 andID:v7];
  id v10 = +[IMContactStore validateAndCleanupID:v7];
  int v11 = +[IMContactStore sharedInstance];
  id v12 = [v11 getContactForID:v10];

  if (v6 && [v10 length])
  {
    uint64_t v13 = self->_IDToCNContactMap;
    objc_sync_enter(v13);
    [(NSMutableDictionary *)self->_IDToCNContactMap removeObjectForKey:v10];
    uint64_t v14 = [v12 identifier];
    [(IMContactStore *)self removeIDFromCNIDToHandleIDsMap:v10 withCNID:v14];

    [(NSMutableDictionary *)self->_IDToCNContactMap setObject:v6 forKey:v10];
    uint64_t v15 = [v6 identifier];
    [(IMContactStore *)self addIDToCNIDToHandleIDsMap:v10 withCNID:v15];

    +[IMContactStore logCNContact:v6 andID:v7];
    objc_sync_exit(v13);
  }
}

- (void)replaceWithMutableContactForID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    +[IMContactStore logHandleID:v4];
    int v5 = +[IMContactStore validateAndCleanupID:v4];
    if ([v5 length])
    {
      id v6 = [(id)objc_opt_class() createMutableContactWithID:v5];
      if (v6)
      {
        id v7 = self->_IDToCNContactMap;
        objc_sync_enter(v7);
        [(NSMutableDictionary *)self->_IDToCNContactMap removeObjectForKey:v5];
        [(NSMutableDictionary *)self->_IDToCNContactMap setObject:v6 forKey:v5];
        +[IMContactStore logHandleID:v4];
        objc_sync_exit(v7);
      }
      else
      {
        id v9 = IMLogHandleForCategory("Contacts");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1A09F1000((uint64_t)v4, v9);
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Invalid ID, cannot replace CNContact from Map.ID: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)getAllKeysFromIDToCNContactMap
{
  BOOL v3 = self->_IDToCNContactMap;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_IDToCNContactMap allKeys];
  int v5 = (void *)[v4 copy];

  objc_sync_exit(v3);

  return v5;
}

- (void)contactStoreChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!IMIsRunningInMessages()
    || [(IMContactStore *)self isBatchFetchingForLaunchCompleted]
    || (IMIsRunningInMessagesExtension() & 1) != 0)
  {
    int v5 = [v4 userInfo];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v5;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Received ContactStore change notification. User Info:%@", (uint8_t *)&v8, 0xCu);
      }
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
    [(IMContactStore *)self performSelector:sel_checkForContactStoreChanges withObject:0 afterDelay:0.0];
  }
  else if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Dropping Contact Store notification since Contact's cache is not populated.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)resetMeCard
{
  [(IMContactStore *)self setMeContact:0];

  MEMORY[0x1F4181798](self, sel_setShouldSkipMeContactLookup_);
}

- (void)meCardChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[IMContactStore _shouldAllowContactStoreLookup];
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "MeCard ContactStore change notification", (uint8_t *)&v15, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "MeCard ContactStore change notification", (uint8_t *)&v15, 2u);
      }
    }
    id v9 = [v4 userInfo];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v10 - self->_lastMeContactStoreSync >= 0.0)
    {
      [(IMContactStore *)self resetMeCard];
      uint64_t v13 = +[IMContactStore keysForNicknameHandling];
      id v14 = [(IMContactStore *)self fetchMeContactWithKeys:v13];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          int v16 = v9;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Ignoring MeCard ContactStore change notification. userinfo:%@", (uint8_t *)&v15, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          int v16 = v9;
          _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Ignoring MeCard ContactStore change notification. userinfo:%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v6)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Not handling me card change notification in non Messages processes", (uint8_t *)&v15, 2u);
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (void)handleDropEverythingEvent
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Dropping everything in cache.", v7, 2u);
    }
  }
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_IDToCNContactMap removeAllObjects];
  [(NSMutableDictionary *)v4->_CNIDToHandleIDsMap removeAllObjects];
  [(IMContactStore *)v4 setCurrentHistoryToken:0];
  objc_sync_exit(v4);

  BOOL v5 = [(IMContactStore *)v4 getIDToCNContactMap];
  +[IMContactStore logDictionary:v5];

  int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:IMContactStoreChangedNotification object:0];
}

- (void)checkForContactStoreChanges
{
  id v3 = objc_alloc_init(+[IMContactStore IMCNChangeHistoryFetchRequestClass]);
  id v4 = [(IMContactStore *)self currentHistoryToken];
  [v3 setStartingToken:v4];

  [v3 setShouldUnifyResults:0];
  BOOL v5 = +[IMContactStore keysForCNContact];
  [v3 setAdditionalContactKeyDescriptors:v5];

  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Performing a Contact Store History Fetch request", buf, 2u);
    }
  }
  id v7 = [(IMContactStore *)self getIDToCNContactMap];
  +[IMContactStore logDictionary:v7];

  int v8 = [(IMContactStore *)self currentHistoryToken];
  +[IMContactStore logHistoryToken:v8];

  changeHistoryFetchQueue = self->_changeHistoryFetchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A081BBB4;
  v11[3] = &unk_1E5A10080;
  v11[4] = self;
  id v12 = v3;
  id v10 = v3;
  dispatch_async(changeHistoryFetchQueue, v11);
}

+ (id)displayNameWithPhoneNumberOrEmailForContact:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 phoneNumbers];
    if ([v5 count])
    {
      int v6 = [v5 firstObject];
      id v7 = [v6 value];
      int v8 = [v7 stringValue];

      id v9 = IMFormattedDisplayStringForNumber();
    }
    else
    {
      int v8 = [v4 emailAddresses];
      if ([v8 count])
      {
        id v10 = [v8 firstObject];
        id v11 = [v10 value];

        id v9 = IMFormattedDisplayStringForNumber();
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)displayNameForContact:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [0 description];
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Invalid contact:%@", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_11;
    }
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = [a1 displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:v4];
  if (!v5)
  {
    BOOL v5 = [a1 displayNameWithPhoneNumberOrEmailForContact:v4];
    if (!v5)
    {
      if (IMOSLoggingEnabled())
      {
        int v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "A display name for the given contact could not be generated for :%@", (uint8_t *)&v9, 0xCu);
        }
LABEL_11:

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v5;
}

+ (id)firstNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 givenName];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)lastNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 familyName];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)phoneticFirstNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 phoneticGivenName];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)phoneticLastNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 phoneticFamilyName];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)phoneticFullNameForCNContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() _stringFromContact:v3 withStyle:1];
    if ([v4 length])
    {
      id v5 = v4;
    }
    else
    {
      id v5 = +[IMContactStore phoneticFirstNameForCNContact:v3];
    }
    int v6 = v5;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (id)companyNameForCNContact:(id)a3
{
  if (a3)
  {
    id v3 = [a3 organizationName];
    if ([v3 length]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)IDsFromCNContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = +[IMContactStore phoneNumbersForCNContact:v3];
    if ([v5 count]) {
      [v4 addObjectsFromArray:v5];
    }
    int v6 = +[IMContactStore emailsForCNContact:v3];
    if ([v6 count]) {
      [v4 addObjectsFromArray:v6];
    }
    id v7 = (void *)[v4 copy];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)emailsForCNContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [v3 emailAddresses];
    if ([v5 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "value", (void)v14);
            if ([v11 length]) {
              [v4 addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
    }
    id v12 = objc_msgSend(v4, "copy", (void)v14);
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (id)phoneNumbersForCNContact:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [v3 phoneNumbers];
    if ([v5 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "value", (void)v16);
            id v12 = [v11 stringValue];

            if ([v12 length])
            {
              uint64_t v13 = +[IMContactStore validateAndCleanupID:v12];
              if ([v13 length]) {
                [v4 addObject:v13];
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }
    }
    long long v14 = objc_msgSend(v4, "copy", (void)v16);
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (id)getCNIDToHandleIDsMap
{
  if (!self->_CNIDToHandleIDsMap && IMIsRunningInUnitTesting()) {
    [(IMContactStore *)self generateCNIDToHandleIDMap];
  }
  id v3 = (void *)[(NSMutableDictionary *)self->_CNIDToHandleIDsMap copy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  id v6 = v5;

  return v6;
}

- (id)getIDToCNContactMap
{
  id v3 = self->_IDToCNContactMap;
  objc_sync_enter(v3);
  id v4 = (void *)[(NSMutableDictionary *)self->_IDToCNContactMap copy];
  objc_sync_exit(v3);

  return v4;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(IMContactStore *)self getIDToCNContactMap];
  +[IMContactStore logDictionary:v3 checkAdditionalLoggingEnabled:0];

  id v4 = [(IMContactStore *)self getHandleIDToCNIDMap];
  +[IMContactStore logDictionary:v4 checkAdditionalLoggingEnabled:0];

  v14[0] = @"debugDescription";
  id v5 = [(IMContactStore *)self debugDescription];
  v15[0] = v5;
  v14[1] = @"IDsObtainedFromDaemon";
  id v6 = NSNumber;
  uint64_t v7 = [(IMContactStore *)self getHandleIDToCNIDMap];
  uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v15[1] = v8;
  v14[2] = @"ContactCache";
  uint64_t v9 = NSNumber;
  id v10 = [(IMContactStore *)self getIDToCNContactMap];
  uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v15[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

+ (id)createMutableContactWithMapURL:(id)a3 andLocalizedLocationString:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    uint64_t v8 = [(objc_class *)+[IMContactStore IMCNLabeledValueClass] labeledValueWithLabel:&stru_1EF2CAD28 value:v5];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 setUrlAddresses:v9];

    [v7 setGivenName:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)predicateForID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = MEMORY[0x1A62278F0](v3);
    if (MEMORY[0x1A62278C0]())
    {
      id v5 = (void *)MEMORY[0x1E4F1B8F8];
      id v6 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
      id v7 = [v5 predicateForContactsMatchingPhoneNumber:v6];
    }
    else if (IMStringIsEmail())
    {
      id v7 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v4];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          uint64_t v11 = v4;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Failed to determine handle type for ID %@.", (uint8_t *)&v10, 0xCu);
        }
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)keysForNicknameHandling
{
  long long v16 = (void *)MEMORY[0x1E4F1CA48];
  long long v18 = +[IMContactStore kIMCNContactIdentifierKey];
  long long v17 = +[IMContactStore kIMCNContactPhoneNumbersKey];
  long long v15 = +[IMContactStore kIMCNContactEmailAddressesKey];
  int v2 = +[IMContactStore kIMCNContactImageDataAvailableKey];
  id v3 = +[IMContactStore kIMCNContactImageDataKey];
  id v4 = +[IMContactStore kIMCNContactThumbnailImageDataKey];
  id v5 = +[IMContactStore kIMCNContactCropRectKey];
  id v6 = +[IMContactStore kIMCNContactWallpaperKey];
  id v7 = +[IMContactStore kIMCNContactWatchWallpaperImageDataKey];
  uint64_t v8 = +[IMContactStore kIMCNContactImageBackgroundColorsDataKey];
  uint64_t v9 = +[IMContactStore kIMCNContactSensitiveContentConfigurationKey];
  int v10 = objc_msgSend(v16, "arrayWithObjects:", v18, v17, v15, v2, v3, v4, v5, v6, v7, v8, v9, 0);

  if (+[IMContactStore IMCNContactFormatterClass])
  {
    uint64_t v11 = [(objc_class *)+[IMContactStore IMCNContactFormatterClass] descriptorForRequiredKeysForStyle:0];
    [v10 addObject:v11];
  }
  if (+[IMContactStore IMCNMeCardSharingPickerViewControllerClass])
  {
    uint64_t v12 = [(objc_class *)+[IMContactStore IMCNMeCardSharingPickerViewControllerClass] descriptorForRequiredKeys];
    [v10 addObject:v12];
  }
  uint64_t v13 = (void *)[v10 copy];

  return v13;
}

+ (id)dialingCodeForID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length] || !objc_msgSend(v3, "hasPrefix:", @"+"))
  {
    id v7 = 0;
    goto LABEL_13;
  }
  id v4 = IMCountryCodeForNumber();
  if ([v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] ITUCountryCodeForISOCountryCode:v4];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v5;
      uint64_t v9 = [NSString stringWithFormat:@"+"];
      int v10 = [NSNumber numberWithInteger:v8];
      uint64_t v11 = [v10 stringValue];
      id v7 = [v9 stringByAppendingString:v11];

      goto LABEL_12;
    }
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v3;
        __int16 v15 = 2112;
        long long v16 = v4;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Could not identify an ITU Country code for ID:%@ Country Code:%@.", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  id v7 = 0;
LABEL_12:

LABEL_13:

  return v7;
}

+ (id)dialingForCurrentLocale
{
  int v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  uint64_t v4 = [MEMORY[0x1E4F1CA20] ITUCountryCodeForISOCountryCode:v3];
  uint64_t v5 = [NSString stringWithFormat:@"+"];
  id v6 = [NSNumber numberWithInteger:v4];
  id v7 = [v6 stringValue];
  uint64_t v8 = [v5 stringByAppendingString:v7];

  return v8;
}

+ (id)IDWithCurrentLocaleITUCode:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = IMStripFormattingFromAddress();
    uint64_t v5 = +[IMContactStore dialingForCurrentLocale];
    id v6 = [NSString stringWithFormat:@"%@%@", v5, v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)isCNContactAKnownContact:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v5 = isKindOfClass ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

+ (id)descriptionForCNContact:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v5 = +[IMContactStore fullNameForCNContact:v3];
    id v6 = NSString;
    id v7 = [v3 identifier];
    uint64_t v4 = [v6 stringWithFormat:@"%@ : %@", v5, v7];
  }
  else
  {
    uint64_t v4 = @"Failed to fetch a CNContact from ContactStore. Using placeholder";
  }

  return v4;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSMutableDictionary)CNIDToHandleIDsMap
{
  return self->_CNIDToHandleIDsMap;
}

- (void)setCNIDToHandleIDsMap:(id)a3
{
}

- (NSMutableDictionary)IDToCNContactMap
{
  return self->_IDToCNContactMap;
}

- (void)setIDToCNContactMap:(id)a3
{
}

- (BOOL)batchFetchingForLaunchCompleted
{
  return self->_batchFetchingForLaunchCompleted;
}

- (void)setBatchFetchingForLaunchCompleted:(BOOL)a3
{
  self->_batchFetchingForLaunchCompleted = a3;
}

- (double)lastContactStoreSync
{
  return self->_lastContactStoreSync;
}

- (void)setLastContactStoreSync:(double)a3
{
  self->_lastContactStoreSync = a3;
}

- (double)lastMeContactStoreSync
{
  return self->_lastMeContactStoreSync;
}

- (void)setLastMeContactStoreSync:(double)a3
{
  self->_lastMeContactStoreSync = a3;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
}

- (BOOL)shouldSkipMeContactLookup
{
  return self->_shouldSkipMeContactLookup;
}

- (void)setShouldSkipMeContactLookup:(BOOL)a3
{
  self->_shouldSkipMeContactLookup = a3;
}

- (OS_dispatch_queue)changeHistoryFetchQueue
{
  return self->_changeHistoryFetchQueue;
}

- (void)setChangeHistoryFetchQueue:(id)a3
{
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
}

- (NSArray)CNIDsForBatchFetch
{
  return self->_CNIDsForBatchFetch;
}

- (void)setCNIDsForBatchFetch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNIDsForBatchFetch, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_changeHistoryFetchQueue, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_IDToCNContactMap, 0);
  objc_storeStrong((id *)&self->_CNIDToHandleIDsMap, 0);
  objc_storeStrong((id *)&self->_handleIDToCNIDMap, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

@end