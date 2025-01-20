@interface PKPeerPaymentIntentHandler
+ (void)connectToIMDaemonController;
- (BOOL)hasAccountResolution;
- (CNContactStore)contactStore;
- (OS_dispatch_queue)intentQueue;
- (PKIntentHandlerDelegate)delegate;
- (PKPeerPaymentController)peerPaymentController;
- (PKPeerPaymentIntentHandler)initWithDelegate:(id)a3 intentQueue:(id)a4;
- (PKPeerPaymentService)peerPaymentService;
- (id)_allHandlesForContact:(id)a3;
- (id)_canonicalizedMessagesHandleForContactHandle:(id)a3;
- (id)_contactsForPersons:(id)a3;
- (id)_mostRecentlyUsedHandle:(id)a3;
- (id)_personForContact:(id)a3 handle:(id)a4 otherAliases:(id)a5 customIdentifier:(id)a6;
- (id)_personForContactUsingMostRecentlyUsedHandle:(id)a3;
- (id)_personForDictatedPhoneNumberOrEmail:(id)a3;
- (id)_personsForContactsUsingMostRecentlyUsedHandle:(id)a3;
- (id)_personsForHandlesOnContactPreferringMostRecentlyUsed:(id)a3;
- (id)_siriMatchResult:(id)a3;
- (id)inCurrencyAmountFromPKAmount:(id)a3;
- (id)pkCurrencyAmountFromIntentAmount:(id)a3;
- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3;
- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3;
- (id)resolveSiriMatchesForPerson:(id)a3;
- (id)siriLocale;
- (unint64_t)accountResolution;
- (unint64_t)registrationStatus;
- (void)_sendComposition:(id)a3 toRecipient:(id)a4;
- (void)peerPaymentRegistrationStatusWithCompletion:(id)a3;
- (void)sendMessage:(id)a3 toRecipient:(id)a4;
- (void)setAccountResolution:(unint64_t)a3;
- (void)setContactStore:(id)a3;
- (void)setHasAccountResolution:(BOOL)a3;
- (void)setRegistrationStatus:(unint64_t)a3;
- (void)validateCurrencyAmount:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentIntentHandler

+ (void)connectToIMDaemonController
{
  if (qword_100019BE0 != -1) {
    dispatch_once(&qword_100019BE0, &stru_100014A98);
  }
}

- (PKPeerPaymentIntentHandler)initWithDelegate:(id)a3 intentQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentIntentHandler;
  v8 = [(PKPeerPaymentIntentHandler *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_intentQueue, a4);
    v10 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    contactStore = v9->_contactStore;
    v9->_contactStore = v10;

    v12 = (PKPeerPaymentService *)objc_alloc_init((Class)PKPeerPaymentService);
    peerPaymentService = v9->_peerPaymentService;
    v9->_peerPaymentService = v12;

    v14 = +[PKPeerPaymentWebService sharedService];
    v15 = (PKPeerPaymentController *)[objc_alloc((Class)PKPeerPaymentController) initWithPeerPaymentWebService:v14];
    peerPaymentController = v9->_peerPaymentController;
    v9->_peerPaymentController = v15;

    [(PKPeerPaymentController *)v9->_peerPaymentController setDelegate:v9];
    if (PKUseMockSURFServer()) {
      v9->_registrationStatus = 1;
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100014AB8);
  }
  return v9;
}

- (id)pkCurrencyAmountFromIntentAmount:(id)a3
{
  id v3 = a3;
  v4 = [v3 amount];
  v5 = [v3 currencyCode];

  if (v4
    && [v5 length]
    && (+[NSDecimalNumber notANumber],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v4 isEqualToNumber:v6],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v4 currency:v5 exponent:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)inCurrencyAmountFromPKAmount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)INCurrencyAmount);
  v5 = [v3 amount];
  id v6 = [v3 currency];

  id v7 = [v4 initWithAmount:v5 currencyCode:v6];

  return v7;
}

- (id)resolveSiriMatchesForPerson:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    uint64_t v8 = +[INPersonResolutionResult needsValue];
LABEL_7:
    v9 = (void *)v8;
    v10 = [(PKPeerPaymentIntentHandler *)self _siriMatchResult:v8];
    goto LABEL_33;
  }
  id v6 = [v4 customIdentifier];

  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User resolved disambiguation of aliases by selecting person: %@", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v8 = +[INPersonResolutionResult successWithResolvedPerson:v5];
    goto LABEL_7;
  }
  v9 = [v5 siriMatches];
  v11 = [(PKPeerPaymentIntentHandler *)self _contactsForPersons:v9];
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134217984;
    id v28 = [v11 count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found %lu matching contacts", (uint8_t *)&v27, 0xCu);
  }

  if ([v11 count])
  {
    if ([v11 count] == (id)1)
    {
      v13 = [v11 firstObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138412290;
        id v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolved contact: %@", (uint8_t *)&v27, 0xCu);
      }

      v14 = [(PKPeerPaymentIntentHandler *)self _personsForHandlesOnContactPreferringMostRecentlyUsed:v13];
      if ([v14 count] == (id)1)
      {
        v15 = [v14 firstObject];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412290;
          id v28 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolved alias: %@", (uint8_t *)&v27, 0xCu);
        }

        v16 = +[INPersonResolutionResult successWithResolvedPerson:v15];
        v10 = [(PKPeerPaymentIntentHandler *)self _siriMatchResult:v16];

        goto LABEL_32;
      }
      id v21 = [v14 count];
      BOOL v22 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v21)
      {
        if (v22)
        {
          LOWORD(v27) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Contact has no phone numbers or email addresses", (uint8_t *)&v27, 2u);
        }

        v26 = +[INPersonResolutionResult unsupported];
        v10 = [(PKPeerPaymentIntentHandler *)self _siriMatchResult:v26];

        [v10 setIsPersonWithNoHandle:1];
        goto LABEL_32;
      }
      if (v22)
      {
        id v23 = [v14 count];
        int v27 = 134217984;
        id v28 = v23;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asking user to disambiguate among %lu aliases for contact", (uint8_t *)&v27, 0xCu);
      }

      uint64_t v18 = +[INPersonResolutionResult disambiguationWithPeopleToDisambiguate:v14];
      goto LABEL_29;
    }
    v13 = [(PKPeerPaymentIntentHandler *)self _personsForContactsUsingMostRecentlyUsedHandle:v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v13 count];
      int v27 = 134217984;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asking user to disambiguate among %lu contacts", (uint8_t *)&v27, 0xCu);
    }

    uint64_t v20 = +[INPersonResolutionResult disambiguationWithPeopleToDisambiguate:v13];
LABEL_31:
    v14 = (void *)v20;
    v10 = [(PKPeerPaymentIntentHandler *)self _siriMatchResult:v20];
    goto LABEL_32;
  }
  v17 = [v5 personHandle];
  v13 = [v17 value];

  if (![v13 length])
  {
    uint64_t v20 = +[INPersonResolutionResult unsupported];
    goto LABEL_31;
  }
  v14 = [(PKPeerPaymentIntentHandler *)self _personForDictatedPhoneNumberOrEmail:v13];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resolved person from dictated phone number or email: %@", (uint8_t *)&v27, 0xCu);
  }

  uint64_t v18 = +[INPersonResolutionResult successWithResolvedPerson:v14];
LABEL_29:
  v24 = (void *)v18;
  v10 = [(PKPeerPaymentIntentHandler *)self _siriMatchResult:v18];

LABEL_32:
LABEL_33:

  return v10;
}

- (id)_siriMatchResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKSiriMatchesPersonResolutionResult);
  [(PKSiriMatchesPersonResolutionResult *)v4 setPersonResolutionResult:v3];

  return v4;
}

- (void)validateCurrencyAmount:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(PKPeerPaymentIntentHandler *)self peerPaymentService];
  if (!v20 || !v7)
  {
    (*((void (**)(id, void, void, void, uint64_t))v6 + 2))(v6, 0, 0, 0, 1);
    goto LABEL_12;
  }
  uint64_t v8 = [v20 currency];
  v9 = [v20 amount];
  v10 = [v7 account];
  v11 = [v10 currentBalance];
  v12 = [v11 currency];

  v13 = [v10 sendToUserFeatureDescriptor];
  v14 = [v13 minimumAmount];
  v15 = [v13 maximumAmount];
  id v19 = (void *)v8;
  if (v12)
  {
    BOOL v16 = objc_msgSend(v12, "caseInsensitiveCompare:", v8, v8) != 0;
    if (v14) {
      goto LABEL_5;
    }
LABEL_9:
    BOOL v17 = 0;
    if (v15) {
      goto LABEL_6;
    }
LABEL_10:
    BOOL v18 = 0;
    goto LABEL_11;
  }
  BOOL v16 = 0;
  if (!v14) {
    goto LABEL_9;
  }
LABEL_5:
  BOOL v17 = objc_msgSend(v9, "compare:", v14, v19) == (id)-1;
  if (!v15) {
    goto LABEL_10;
  }
LABEL_6:
  BOOL v18 = objc_msgSend(v9, "compare:", v15, v19) == (id)1;
LABEL_11:
  (*((void (**)(id, BOOL, BOOL, BOOL, void))v6 + 2))(v6, v16, v17, v18, 0);

LABEL_12:
}

- (id)presentationSceneIdentifierForPeerPaymentController:(id)a3
{
  return 0;
}

- (id)presentationSceneBundleIdentifierForPeerPaymentController:(id)a3
{
  return 0;
}

- (id)_contactsForPersons:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) contactIdentifier];
          [v5 safelyAddObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
    v13 = +[CNContact predicateForContactsWithIdentifiers:v12];

    v27[0] = CNContactNamePrefixKey;
    v27[1] = CNContactGivenNameKey;
    v27[2] = CNContactMiddleNameKey;
    v27[3] = CNContactFamilyNameKey;
    v27[4] = CNContactNameSuffixKey;
    v27[5] = CNContactNicknameKey;
    v27[6] = CNContactPhoneNumbersKey;
    v27[7] = CNContactEmailAddressesKey;
    v14 = +[NSArray arrayWithObjects:v27 count:8];
    contactStore = self->_contactStore;
    id v20 = 0;
    BOOL v16 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v13 keysToFetch:v14 error:&v20];
    id v17 = v20;
    if (v17)
    {
      BOOL v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error fetching contacts: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)_personsForContactsUsingMostRecentlyUsedHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
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
        v11 = -[PKPeerPaymentIntentHandler _personForContactUsingMostRecentlyUsedHandle:](self, "_personForContactUsingMostRecentlyUsedHandle:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 safelyAddObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (id)_personsForHandlesOnContactPreferringMostRecentlyUsed:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentIntentHandler *)self _allHandlesForContact:v4];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found %lu handles for contact", buf, 0xCu);
  }

  id v7 = [(PKPeerPaymentIntentHandler *)self _mostRecentlyUsedHandle:v5];
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User has most recently interacted with handle: %@", buf, 0xCu);
    }

    [v5 removeObject:v7];
    id v9 = [v4 identifier];
    v10 = [(PKPeerPaymentIntentHandler *)self _personForContact:v4 handle:v7 otherAliases:v5 customIdentifier:v9];
    int v27 = v10;
    id v11 = +[NSArray arrayWithObjects:&v27 count:1];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User has not recently interacted with any of the handles", buf, 2u);
    }

    id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v21 = v5;
    id v12 = v5;
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          BOOL v18 = [v4 identifier];
          id v19 = [(PKPeerPaymentIntentHandler *)self _personForContact:v4 handle:v17 otherAliases:0 customIdentifier:v18];
          [v9 addObject:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    id v11 = [v9 copy];
    id v5 = v21;
  }

  return v11;
}

- (id)_allHandlesForContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v27 = v3;
  id v5 = [v3 phoneNumbers];
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = INPersonHandleLabelForCNLabeledValue();
        id v12 = objc_alloc((Class)INPersonHandle);
        id v13 = [v10 value];
        id v14 = [v13 stringValue];
        id v15 = [v12 initWithValue:v14 type:2 label:v11];

        [v4 addObject:v15];
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v16 = [v27 emailAddresses];
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        long long v22 = INPersonHandleLabelForCNLabeledValue();
        id v23 = objc_alloc((Class)INPersonHandle);
        long long v24 = [v21 value];
        id v25 = [v23 initWithValue:v24 type:1 label:v22];

        [v4 addObject:v25];
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  return v4;
}

- (id)_personForContactUsingMostRecentlyUsedHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentIntentHandler *)self _allHandlesForContact:v4];
  uint64_t v6 = [(PKPeerPaymentIntentHandler *)self _mostRecentlyUsedHandle:v5];
  if (v6)
  {
    id v7 = (id)v6;
    [v5 removeObject:v6];
  }
  else if ([v5 count])
  {
    id v7 = [v5 firstObject];
    [v5 removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Contact %@ has no phone numbers or email addresses, using an empty person handle", (uint8_t *)&v12, 0xCu);
    }

    id v7 = [objc_alloc((Class)INPersonHandle) initWithValue:0 type:0];
  }
  if (![v5 count])
  {

    id v5 = 0;
  }
  id v9 = [v4 identifier];
  v10 = [(PKPeerPaymentIntentHandler *)self _personForContact:v4 handle:v7 otherAliases:v5 customIdentifier:v9];

  return v10;
}

- (id)_personForContact:(id)a3 handle:(id)a4 otherAliases:(id)a5 customIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 nameComponents];
  id v14 = [v12 pkFullyQualifiedName];
  id v15 = objc_alloc((Class)INPerson);
  long long v16 = [v12 identifier];

  id v17 = [v15 initWithPersonHandle:v11 nameComponents:v13 displayName:v14 image:0 contactIdentifier:v16 customIdentifier:v9 aliases:v10 suggestionType:1];

  return v17;
}

- (id)_personForDictatedPhoneNumberOrEmail:(id)a3
{
  id v3 = a3;
  id v4 = +[PKPeerPaymentCounterpartHandleFormatter formatCounterpartHandle:v3];
  if ([v3 containsString:@"@"]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [objc_alloc((Class)INPersonHandle) initWithValue:v3 type:v5];

  id v7 = [objc_alloc((Class)INPerson) initWithPersonHandle:v6 nameComponents:0 displayName:v4 image:0 contactIdentifier:0 customIdentifier:0];

  return v7;
}

- (void)sendMessage:(id)a3 toRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v8 = [v6 underlyingMessage];
  id v9 = [v6 memo];
  id v10 = +[CKComposition compositionWithMSMessage:v8 appExtensionIdentifier:PKPeerPaymentMessagesExtensionBundleIdentifier];
  if ([v9 length])
  {
    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v9];
    uint64_t v12 = [v10 compositionByAppendingText:v11];

    id v10 = (void *)v12;
  }
  id v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v14)
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending composition: %@", (uint8_t *)&v15, 0xCu);
    }

    [(PKPeerPaymentIntentHandler *)self _sendComposition:v10 toRecipient:v7];
  }
  else
  {
    if (v14)
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not construct composition for peer payment message: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_sendComposition:(id)a3 toRecipient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v5;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending composition %@ to recipient %@", buf, 0x16u);
  }

  [(id)objc_opt_class() connectToIMDaemonController];
  id v31 = v6;
  uint64_t v8 = +[NSArray arrayWithObjects:&v31 count:1];
  id v9 = CKMakeHandlesFromRecipients();
  id v10 = [v9 firstObject];

  BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resolved recipient IMHandle: %@", buf, 0xCu);
    }

    uint64_t v12 = +[IMChatRegistry sharedRegistry];
    id v13 = [v12 chatWithHandle:v10];

    [v13 join];
    id v14 = [objc_alloc((Class)CKConversation) initWithChat:v13];
    [v14 refreshServiceForSending];
    int v15 = [v14 messagesFromComposition:v5];
    if ([v15 count])
    {
      id v23 = v10;
      id v24 = v6;
      id v25 = v5;
      id v16 = +[IMService iMessageService];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v22;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending IMMessage: %@", buf, 0xCu);
            }

            [v14 sendMessage:v22 onService:v16 newComposition:0];
          }
          id v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v19);
      }

      id v6 = v24;
      id v5 = v25;
      id v10 = v23;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v33 = v5;
        __int16 v34 = 2112;
        id v35 = v14;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not create IMMessages with composition: %@ conversation %@", buf, 0x16u);
      }
      id v16 = v7;
    }

    id v7 = v13;
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not resolve IMHandle for recipient %@", buf, 0xCu);
  }
}

- (void)peerPaymentRegistrationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_registrationStatus && self->_hasAccountResolution)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    id v6 = [(PKPeerPaymentController *)self->_peerPaymentController peerPaymentPass];
    id v7 = [(PKPeerPaymentController *)self->_peerPaymentController account];
    unint64_t v8 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    self->_accountResolution = v8;
    self->_hasAccountResolution = 1;
    peerPaymentService = self->_peerPaymentService;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000D0CC;
    v10[3] = &unk_100014B08;
    v10[4] = self;
    id v11 = v5;
    unint64_t v12 = v8;
    [(PKPeerPaymentService *)peerPaymentService registrationStatusWithCompletion:v10];
  }
}

- (id)_mostRecentlyUsedHandle:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v45;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "value", v26);
          unint64_t v12 = [(PKPeerPaymentIntentHandler *)self _canonicalizedMessagesHandleForContactHandle:v11];
          if (v12) {
            [v5 setObject:v10 forKeyedSubscript:v12];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v7);
    }

    long long v27 = [v5 allKeys];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_10000D62C;
    v42 = sub_10000D63C;
    id v43 = 0;
    if ([v27 count])
    {
      long long v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      __int16 v34 = sub_10000D644;
      id v35 = &unk_100014B30;
      v37 = &v38;
      id v36 = v27;
      IMDPersistencePerformBlock();
    }
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(id)v39[5] count];
      uint64_t v15 = v39[5];
      *(_DWORD *)buf = 134218242;
      id v50 = v14;
      __int16 v51 = 2112;
      uint64_t v52 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found recent chats with %lu handles for contact: %@", buf, 0x16u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = (id)v39[5];
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v29;
LABEL_17:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
        long long v21 = PKPeerPaymentExistingiMessageChatForRecipientAddress();
        BOOL v22 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v21) {
          break;
        }
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v20;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Chat with %@ was NOT on an iMessage thread", buf, 0xCu);
        }

        if (v17 == (id)++v19)
        {
          id v17 = [v16 countByEnumeratingWithState:&v28 objects:v48 count:16];
          if (v17) {
            goto LABEL_17;
          }
          goto LABEL_25;
        }
      }
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v20;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Chat with %@ was on an iMessage thread", buf, 0xCu);
      }

      id v24 = v20;
      if (v24)
      {
        id v23 = [v5 objectForKeyedSubscript:v24];
        id v16 = v24;
        goto LABEL_30;
      }
      id v23 = 0;
    }
    else
    {
LABEL_25:
      id v23 = 0;
LABEL_30:
    }
    _Block_object_dispose(&v38, 8);

    id v4 = v26;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)_canonicalizedMessagesHandleForContactHandle:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  if (![v3 hasPrefix:@"+"])
  {
    if (![v4 _appearsToBePhoneNumber])
    {
      [v4 _appearsToBeEmail];
      uint64_t v5 = IMNormalizeFormattedString();
      goto LABEL_9;
    }
    uint64_t v6 = IMPhoneNumberRefCopyForPhoneNumber();
    if (v6)
    {
      id v7 = (const void *)v6;
      uint64_t v8 = IMNormalizedPhoneNumberForCFPhoneNumberRef();
      CFRelease(v7);
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = IMCanonicalizeFormattedString();
LABEL_9:
  uint64_t v8 = (void *)v5;
LABEL_10:

  return v8;
}

- (id)siriLocale
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 languageCode];

  id v4 = [v3 length];
  uint64_t v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using Siri language code: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = +[NSLocale localeWithLocaleIdentifier:v3];
  }
  else
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Siri language code could not be determined, using device locale instead.", (uint8_t *)&v10, 2u);
    }

    uint64_t v7 = +[NSLocale pk_preferredLocale];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPeerPaymentController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (OS_dispatch_queue)intentQueue
{
  return self->_intentQueue;
}

- (PKIntentHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKIntentHandlerDelegate *)WeakRetained;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (unint64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (void)setRegistrationStatus:(unint64_t)a3
{
  self->_registrationStatus = a3;
}

- (unint64_t)accountResolution
{
  return self->_accountResolution;
}

- (void)setAccountResolution:(unint64_t)a3
{
  self->_accountResolution = a3;
}

- (BOOL)hasAccountResolution
{
  return self->_hasAccountResolution;
}

- (void)setHasAccountResolution:(BOOL)a3
{
  self->_hasAccountResolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intentQueue, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);

  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end