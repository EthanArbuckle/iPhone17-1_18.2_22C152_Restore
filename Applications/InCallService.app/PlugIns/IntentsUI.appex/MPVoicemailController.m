@interface MPVoicemailController
+ (id)_telephonyClient;
- (BOOL)isRestrictedMessage:(id)a3;
- (BOOL)isSetupRequired;
- (BOOL)shouldShowVerifiedBadge;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (MPVoicemailController)init;
- (MPVoicemailController)initWithVoicemailManager:(id)a3 accountManager:(id)a4 callProviderManager:(id)a5 contactStore:(id)a6 suggestedContactStore:(id)a7 metadataCache:(id)a8;
- (MPVoicemailManagerProtocol)voicemailManager;
- (NSArray)audioMessages;
- (NSArray)contactKeyDescriptors;
- (NSArray)messages;
- (NSCache)localizedDowntimeTitleCache;
- (NSCache)localizedSubtitleCache;
- (NSCache)localizedTitleCache;
- (NSMutableDictionary)contactCache;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialDispatchQueue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (VMVoicemailManager)accountManager;
- (id)attributedStringForDowntimeMessage:(id)a3;
- (id)audioMessagesPassingTest:(id)a3;
- (id)localizedAttributedDowntimeTitleForMessage:(id)a3;
- (id)localizedHandleTitleFromMessage:(id)a3;
- (id)localizedSubtitleForMessage:(id)a3;
- (id)localizedTitleForMessage:(id)a3;
- (id)messagesPassingTest:(id)a3;
- (id)mutableSenderContactForMessage:(id)a3;
- (id)senderContactForMessage:(id)a3;
- (unint64_t)unreadMessageCount;
- (void)audioMessagesPassingTest:(id)a3 withCompletion:(id)a4;
- (void)audioMessagesWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteMessages:(id)a3;
- (void)fetchContactsForMessages:(id)a3 keyDescriptors:(id)a4;
- (void)fetchLegacyVoicemailsCompletion:(id)a3;
- (void)fetchMessagesCompletion:(id)a3;
- (void)fetchMetadataForMessages:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleRecentsChangedNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3;
- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleVoicemailsChangedNotification:(id)a3;
- (void)loadLocalizedTitlesForMessages:(id)a3;
- (void)markMessagesAsRead:(id)a3;
- (void)messageForIdentifier:(id)a3 completionBlock:(id)a4;
- (void)messagesPassingTest:(id)a3 withCompletion:(id)a4;
- (void)moveMessagesToInbox:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)postMPVoicemailControllerMessagesDidChangeNotification;
- (void)postMPVoicemailControllerUnreadMessageCountDidChangeNotification;
- (void)providersChangedForProviderManager:(id)a3;
- (void)setAudioMessages:(id)a3;
- (void)setCompletionDispatchQueue:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setMessages:(id)a3;
- (void)setUnreadMessageCount:(unint64_t)a3;
- (void)trashMessages:(id)a3;
@end

@implementation MPVoicemailController

- (MPVoicemailController)init
{
  [(MPVoicemailController *)self doesNotRecognizeSelector:a2];
  id v2 = +[NSException exceptionWithName:@"doesNotRecognizeSelector" reason:@"init not implemented" userInfo:0];
  objc_exception_throw(v2);
}

- (MPVoicemailController)initWithVoicemailManager:(id)a3 accountManager:(id)a4 callProviderManager:(id)a5 contactStore:(id)a6 suggestedContactStore:(id)a7 metadataCache:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  v41.receiver = self;
  v41.super_class = (Class)MPVoicemailController;
  v17 = [(MPVoicemailController *)&v41 init];
  if (v17)
  {
    id v32 = v16;
    id v33 = v15;
    uint64_t v18 = +[MPVoicemailQueueManager serialQueue];
    serialDispatchQueue = v17->_serialDispatchQueue;
    v17->_serialDispatchQueue = (OS_dispatch_queue *)v18;

    v20 = v17->_serialDispatchQueue;
    v21 = off_1000A0AB8;
    specific = dispatch_queue_get_specific(v20, off_1000A0AB8);
    if (specific)
    {
      uint64_t v23 = (uint64_t)specific;
      v24 = PHDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_100061A70(v23, (uint64_t)v17, v24);
      }

      v20 = v17->_serialDispatchQueue;
      v21 = off_1000A0AB8;
    }
    dispatch_queue_set_specific(v20, v21, v17, 0);
    objc_storeStrong((id *)&v17->_callProviderManager, a5);
    objc_storeStrong((id *)&v17->_contactStore, a6);
    objc_storeStrong((id *)&v17->_suggestedContactStore, a7);
    objc_storeStrong((id *)&v17->_metadataCache, a8);
    objc_storeStrong((id *)&v17->_voicemailManager, a3);
    objc_storeStrong((id *)&v17->_accountManager, a4);
    v25 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v17->_featureFlags;
    v17->_featureFlags = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v17->_contactCache;
    v17->_contactCache = v27;

    v29 = PHDefaultLog();
    id v16 = v32;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager", buf, 2u);
    }

    v30 = v17->_serialDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021E84;
    block[3] = &unk_10008D758;
    v39 = v17;
    dispatch_async(v30, block);

    id v15 = v33;
  }

  return v17;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailController;
  [(MPVoicemailController *)&v4 dealloc];
}

- (void)audioMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022270;
  block[3] = &unk_10008DD08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSArray)audioMessages
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000223D4;
  id v9 = sub_1000223E4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000223EC;
  v4[3] = &unk_10008DA00;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (NSArray)messages
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000223D4;
  id v9 = sub_1000223E4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022500;
  v4[3] = &unk_10008DA00;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (unint64_t)unreadMessageCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000225D0;
  v4[3] = &unk_10008DA00;
  v4[4] = self;
  v4[5] = &v5;
  [(MPVoicemailController *)self performSynchronousBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)loadLocalizedTitlesForMessages:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(MPVoicemailController *)self localizedTitleForMessage:v9];
        id v11 = [(MPVoicemailController *)self localizedSubtitleForMessage:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)localizedSubtitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_1000223D4;
  long long v15 = sub_1000223E4;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022828;
  v7[3] = &unk_10008DB68;
  id v4 = a3;
  uint64_t v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (BOOL)isRestrictedMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 senderDestinationID];
  if ([v4 length])
  {
    id v5 = [v3 senderDestinationID];
  }
  else
  {
    id v5 = TUCallFilterUnknownCallerAddress;
  }
  id v6 = v5;

  uint64_t v7 = +[TUHandle normalizedHandleWithDestinationID:v6];
  id v8 = +[TUCallCenter sharedInstance];
  uint64_t v9 = [v8 callFilterController];
  unsigned __int8 v10 = [v9 containsRestrictedHandle:v7 forBundleIdentifier:TUBundleIdentifierMobilePhoneApplication];

  return v10;
}

- (id)localizedAttributedDowntimeTitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_1000223D4;
  long long v15 = sub_1000223E4;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022E3C;
  v7[3] = &unk_10008DB68;
  id v4 = a3;
  uint64_t v9 = self;
  unsigned __int8 v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (id)localizedTitleForMessage:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_1000223D4;
  long long v15 = sub_1000223E4;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023190;
  v7[3] = &unk_10008DB68;
  id v4 = a3;
  uint64_t v9 = self;
  unsigned __int8 v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (id)localizedHandleTitleFromMessage:(id)a3
{
  id v4 = [a3 senderHandle];
  id v5 = [v4 type];
  if (v5 == (id)2)
  {
LABEL_5:
    unsigned __int8 v10 = [v4 normalizedValue];
    uint64_t v11 = [v4 isoCountryCode];
    long long v12 = (void *)PNCreateFormattedStringWithCountry();

    goto LABEL_7;
  }
  if (v5 == (id)3)
  {
    id v6 = [(MPVoicemailController *)self featureFlags];
    unsigned int v7 = [v6 callScreeningEnabledM3];

    if (v7)
    {
      id v8 = [v4 normalizedValue];
      uint64_t v9 = +[CNLabeledValue localizedDisplayStringForLabel:v8 propertyName:CNContactEmailAddressesKey];
    }
    goto LABEL_5;
  }
  long long v12 = 0;
LABEL_7:
  if (![v12 length])
  {
    uint64_t v13 = [v4 value];

    long long v12 = (void *)v13;
  }

  return v12;
}

- (id)messagesPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(MPVoicemailController *)self messages];
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
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (void)messagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023700;
  v11[3] = &unk_10008DD30;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)audioMessagesPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(MPVoicemailController *)self audioMessages];
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
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (void)audioMessagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100023AF0;
  v11[3] = &unk_10008DD30;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)deleteMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023D3C;
  v9[3] = &unk_10008DA78;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)markMessagesAsRead:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023E20;
  v9[3] = &unk_10008DA78;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)trashMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023F04;
  v9[3] = &unk_10008DA78;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)moveMessagesToInbox:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self voicemailManager];
  id v6 = [(MPVoicemailController *)self serialDispatchQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023FE8;
  v9[3] = &unk_10008DA78;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)messageForIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MPVoicemailController *)self voicemailManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000240DC;
  v11[3] = &unk_10008DDA8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  [(MPVoicemailController *)self performSynchronousBlock:v11];
}

- (BOOL)shouldShowVerifiedBadge
{
  unint64_t v2 = PHPreferencesGetValue(@"showVerifiedBadge");
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)attributedStringForDowntimeMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableAttributedString);
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:NSFontAttributeName];
  }
  id v7 = objc_alloc_init((Class)NSTextAttachment);
  id v8 = +[UIImage tpImageForSymbolType:41 textStyle:UIFontTextStyleCallout scale:3 isStaticSize:0];
  id v9 = [v8 imageWithRenderingMode:2];
  [v7 setImage:v9];

  if ([UIApp userInterfaceLayoutDirection] == (id)1)
  {
    id v10 = objc_alloc((Class)NSAttributedString);
    id v11 = [v3 stringByAppendingString:@" "];
    id v12 = [v10 initWithString:v11 attributes:v5];
    [v4 appendAttributedString:v12];

    id v13 = +[NSAttributedString attributedStringWithAttachment:v7];
    [v4 appendAttributedString:v13];
  }
  else
  {
    id v14 = +[NSAttributedString attributedStringWithAttachment:v7];
    [v4 appendAttributedString:v14];

    id v15 = objc_alloc((Class)NSAttributedString);
    id v13 = [@" " stringByAppendingString:v3];
    id v16 = [v15 initWithString:v13 attributes:v5];
    [v4 appendAttributedString:v16];
  }
  long long v17 = +[UIColor secondaryLabelColor];
  [v4 addAttribute:NSForegroundColorAttributeName value:v17 range:0, [v4 length]];

  return v4;
}

- (CNContactFormatter)contactFormatter
{
  id v3 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;
  if (!contactFormatter)
  {
    id v5 = (CNContactFormatter *)objc_alloc_init((Class)CNContactFormatter);
    [(CNContactFormatter *)v5 setStyle:0];
    id v6 = self->_contactFormatter;
    self->_contactFormatter = v5;

    contactFormatter = self->_contactFormatter;
  }

  return contactFormatter;
}

- (NSArray)contactKeyDescriptors
{
  id v3 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  contactKeyDescriptors = self->_contactKeyDescriptors;
  if (!contactKeyDescriptors)
  {
    id v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    v9[0] = v5;
    v9[1] = CNContactPhoneNumbersKey;
    v9[2] = CNContactEmailAddressesKey;
    id v6 = +[NSArray arrayWithObjects:v9 count:3];
    id v7 = self->_contactKeyDescriptors;
    self->_contactKeyDescriptors = v6;

    contactKeyDescriptors = self->_contactKeyDescriptors;
  }

  return contactKeyDescriptors;
}

- (void)setMessages:(id)a3
{
  id v10 = (NSArray *)a3;
  id v4 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = v10;
  if (self->_messages != v10)
  {
    id v6 = (NSArray *)[(NSArray *)v10 copy];
    messages = self->_messages;
    self->_messages = v6;

    id v8 = +[NSPredicate predicateWithBlock:&stru_10008DDE8];
    id v9 = [(NSArray *)v10 filteredArrayUsingPredicate:v8];

    if (self->_audioMessages != v9) {
      objc_storeStrong((id *)&self->_audioMessages, v9);
    }
    [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];

    id v5 = v10;
  }
}

- (void)setAudioMessages:(id)a3
{
  id v8 = (NSArray *)a3;
  id v4 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = v8;
  if (self->_audioMessages != v8)
  {
    id v6 = (NSArray *)[(NSArray *)v8 copy];
    audioMessages = self->_audioMessages;
    self->_audioMessages = v6;

    [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
    id v5 = v8;
  }
}

- (void)setUnreadMessageCount:(unint64_t)a3
{
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024868;
  v6[3] = &unk_10008DE10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (id)mutableSenderContactForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self metadataCache];
  id v7 = [v4 senderDestinationID];
  if ([v7 length])
  {
    id v8 = +[TUHandle normalizedHandleWithDestinationID:v7];
    id v9 = [v4 senderISOCountryCode];
    id v10 = +[CNMutableContact contactForHandle:v8 isoCountryCode:v9 metadataCache:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)senderContactForMessage:(id)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000223D4;
  id v15 = sub_1000223E4;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024AA8;
  v7[3] = &unk_10008DB68;
  id v4 = a3;
  id v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(MPVoicemailController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)fetchContactsForMessages:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)v14) senderDestinationID];
        if (v15)
        {
          id v16 = [(MPVoicemailController *)self contactCache];
          long long v17 = [v16 objectForKeyedSubscript:v15];

          if (!v17) {
            [v9 addObject:v15];
          }
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v12);
  }

  uint64_t v18 = PHDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v9 count];
    id v20 = [v10 count];
    *(_DWORD *)buf = 134218240;
    id v51 = v19;
    __int16 v52 = 2048;
    id v53 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu contact handles in %lu messages", buf, 0x16u);
  }

  if ([v9 count])
  {
    v21 = [(MPVoicemailController *)self contactStore];
    v22 = PHDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v9 count];
      *(_DWORD *)buf = 134218242;
      id v51 = v23;
      __int16 v52 = 2112;
      id v53 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    v24 = [v9 allObjects];
    v25 = [v21 contactsForHandles:v24 keyDescriptors:v7];

    if (v25)
    {
      id v36 = v21;
      id v37 = v10;
      id v38 = v9;
      id v39 = v7;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v9;
      id v26 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v42;
        do
        {
          v29 = 0;
          do
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v29);
            id v31 = objc_alloc((Class)TUOptionalObject);
            id v32 = [v25 objectForKeyedSubscript:v30];
            id v33 = [v32 firstObject];
            id v34 = [v31 initWithValue:v33];
            id v35 = [(MPVoicemailController *)self contactCache];
            [v35 setObject:v34 forKeyedSubscript:v30];

            v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          id v27 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v27);
      }

      id v9 = v38;
      id v7 = v39;
      v21 = v36;
      id v10 = v37;
    }
  }
}

- (void)fetchMessagesCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self voicemailManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024FD0;
  v8[3] = &unk_10008DE60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchMessagesWithCompletion:v8];
}

- (void)fetchMetadataForMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MPVoicemailController *)self metadataCache];

  if (v6)
  {
    id v7 = +[TUMetadataDestinationID metadataDestinationIDsForVMVoicemails:v4];
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      id v11 = [v4 count];
      __int16 v12 = 2048;
      id v13 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu voicemail messages using %lu handles", (uint8_t *)&v10, 0x16u);
    }

    id v9 = [(MPVoicemailController *)self metadataCache];
    [v9 updateCacheWithDestinationIDs:v7];
  }
}

+ (id)_telephonyClient
{
  if (qword_1000A21B8 != -1) {
    dispatch_once(&qword_1000A21B8, &stru_10008DE80);
  }
  unint64_t v2 = (void *)qword_1000A21B0;

  return v2;
}

- (void)fetchLegacyVoicemailsCompletion:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _telephonyClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000253D8;
  v7[3] = &unk_10008DEF8;
  void v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 getActiveContextsWithCallback:v7];
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025B68;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleRecentsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025D74;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025F34;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  id v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026104;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v10 = 138412546;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v10, 0x16u);
  }
  int v9 = [(MPVoicemailController *)self voicemailManager];
  [v9 requestInitialStateIfNecessaryAndSendNotifications:1];
}

- (void)handleVoicemailsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412546;
    __int16 v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  int v9 = [(MPVoicemailController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000264F0;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)postMPVoicemailControllerMessagesDidChangeNotification
{
  id v3 = [(MPVoicemailController *)self completionDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000265F4;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)postMPVoicemailControllerUnreadMessageCountDidChangeNotification
{
  id v3 = [(MPVoicemailController *)self completionDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000266DC;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000A0AB8) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(MPVoicemailController *)self serialDispatchQueue];
    dispatch_sync(v7, v5);
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = [(MPVoicemailController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling providersChangedForProviderManager %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [(MPVoicemailController *)self localizedSubtitleCache];
  [v7 removeAllObjects];

  id v8 = [(MPVoicemailController *)self localizedTitleCache];
  [v8 removeAllObjects];

  [(MPVoicemailController *)self postMPVoicemailControllerMessagesDidChangeNotification];
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContactStore)suggestedContactStore
{
  return self->_suggestedContactStore;
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  return self->_voicemailManager;
}

- (VMVoicemailManager)accountManager
{
  return self->_accountManager;
}

- (BOOL)isSetupRequired
{
  return self->_setupRequired;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (void)setCompletionDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (NSMutableDictionary)contactCache
{
  return self->_contactCache;
}

- (NSCache)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (NSCache)localizedTitleCache
{
  return self->_localizedTitleCache;
}

- (NSCache)localizedDowntimeTitleCache
{
  return self->_localizedDowntimeTitleCache;
}

- (void)setContactFormatter:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_localizedDowntimeTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_audioMessages, 0);

  objc_storeStrong((id *)&self->_contactKeyDescriptors, 0);
}

@end