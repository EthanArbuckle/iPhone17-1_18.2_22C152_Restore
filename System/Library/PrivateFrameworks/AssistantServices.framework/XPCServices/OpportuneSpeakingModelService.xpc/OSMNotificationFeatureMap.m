@interface OSMNotificationFeatureMap
- (BOOL)isGroupMessage;
- (BOOL)isMessageSenderFavorite;
- (BOOL)isMessageSenderInContacts;
- (OSMNotificationFeatureMap)initWithNotification:(id)a3;
- (double)senderScore;
- (double)timeSinceMostRecentInteractionWithSender;
- (id)_messageSender;
- (id)_messageSenderCNContact;
- (id)_recent;
- (id)contactId;
- (id)recentInteractionsWithSender;
- (unint64_t)numberOfInteractionsBetweenDate:(id)a3 andDate:(id)a4;
- (unint64_t)numberOfRecentInteractionsWithSender;
@end

@implementation OSMNotificationFeatureMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentContactRecord, 0);
  objc_storeStrong((id *)&self->_contactFavorites, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (id)_recent
{
  recentContactRecord = self->_recentContactRecord;
  if (!recentContactRecord)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v5 = [(OSMNotificationFeatureMap *)self _messageSender];
    v6 = [v5 displayName];
    v16[0] = CRAddressKindPhoneNumber;
    v16[1] = CRAddressKindEmail;
    v16[2] = CRAddressKindInstantMessage;
    v16[3] = CRAddressKindGroup;
    v7 = +[NSArray arrayWithObjects:v16 count:4];
    v8 = +[CRSearchQuery searchQueryForSearchTerm:v6 preferredKinds:v7 sendingAddress:0 recentsDomain:CRRecentsDomainMessages];

    v9 = +[CRRecentContactsLibrary defaultInstance];
    backgroundQueue = self->_backgroundQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000A350;
    v14[3] = &unk_1000105D0;
    v14[4] = self;
    dispatch_semaphore_t v15 = v4;
    v11 = v4;
    [v9 performRecentsSearch:v8 queue:backgroundQueue completion:v14];

    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);

    recentContactRecord = self->_recentContactRecord;
  }
  return recentContactRecord;
}

- (id)_messageSender
{
  sender = self->_sender;
  if (!sender)
  {
    dispatch_semaphore_t v4 = [(UNNotification *)self->_notification request];
    v5 = [v4 content];
    v6 = [v5 title];

    contactStore = self->_contactStore;
    v8 = +[CNContact predicateForContactsMatchingName:v6];
    v25 = CNContactIdentifierKey;
    v9 = +[NSArray arrayWithObjects:&v25 count:1];
    v10 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v8 keysToFetch:v9 error:0];

    v11 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315650;
      v20 = "-[OSMNotificationFeatureMap _messageSender]";
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Found matching contacts for %@: %@", (uint8_t *)&v19, 0x20u);
    }
    id v12 = [objc_alloc((Class)INPersonHandle) initWithValue:v6 type:0];
    id v13 = objc_alloc((Class)INPerson);
    v14 = [v10 firstObject];
    dispatch_semaphore_t v15 = [v14 identifier];
    v16 = (INPerson *)[v13 initWithPersonHandle:v12 nameComponents:0 displayName:v6 image:0 contactIdentifier:v15 customIdentifier:0];
    v17 = self->_sender;
    self->_sender = v16;

    sender = self->_sender;
  }
  return sender;
}

- (id)contactId
{
  v2 = [(OSMNotificationFeatureMap *)self _messageSender];
  v3 = [v2 contactIdentifier];

  return v3;
}

- (double)senderScore
{
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v3 = objc_alloc_init((Class)PPContactStore);
  id v4 = objc_alloc((Class)NSSet);
  v5 = [(OSMNotificationFeatureMap *)self _messageSender];
  v6 = [v5 displayName];
  v7 = [v6 componentsSeparatedByString:@" "];
  id v8 = [v4 initWithArray:v7];

  id v16 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A84C;
  v13[3] = &unk_1000105A8;
  id v9 = v8;
  id v14 = v9;
  dispatch_semaphore_t v15 = &v17;
  [v3 iterContactNameRecordsForClient:@"OpportuneSpeakingModule" error:&v16 block:v13];
  id v10 = v16;
  double v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (unint64_t)numberOfInteractionsBetweenDate:(id)a3 andDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(OSMNotificationFeatureMap *)self _recent];
  id v9 = [v8 recentDates];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v16, "compare:", v6, (void)v18) == (id)1 && objc_msgSend(v16, "compare:", v7) == (id)-1) {
          ++v13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (double)timeSinceMostRecentInteractionWithSender
{
  v2 = [(OSMNotificationFeatureMap *)self recentInteractionsWithSender];
  id v3 = [v2 count];
  id v4 = +[NSDate date];
  v5 = v4;
  if ((unint64_t)v3 < 2)
  {
    [v4 timeIntervalSince1970];
    double v8 = v9;
  }
  else
  {
    id v6 = [v2 objectAtIndex:1];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;
  }
  return v8;
}

- (unint64_t)numberOfRecentInteractionsWithSender
{
  v2 = [(OSMNotificationFeatureMap *)self _recent];
  id v3 = [v2 countOfRecents];

  return (unint64_t)v3;
}

- (id)recentInteractionsWithSender
{
  v2 = [(OSMNotificationFeatureMap *)self _recent];
  uint64_t v3 = [v2 recentDates];

  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  return v4;
}

- (BOOL)isGroupMessage
{
  v2 = [(UNNotification *)self->_notification request];
  uint64_t v3 = [v2 content];
  id v4 = [v3 subtitle];

  LOBYTE(v2) = [v4 length] != 0;
  return (char)v2;
}

- (id)_messageSenderCNContact
{
  uint64_t v3 = [(OSMNotificationFeatureMap *)self _messageSender];
  id v4 = [v3 contactIdentifier];

  if (v4)
  {
    contactStore = self->_contactStore;
    double v9 = CNContactIdentifierKey;
    id v6 = +[NSArray arrayWithObjects:&v9 count:1];
    double v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v4 keysToFetch:v6 error:0];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)isMessageSenderFavorite
{
  uint64_t v3 = [(OSMNotificationFeatureMap *)self _messageSenderCNContact];
  if (v3)
  {
    id v4 = [(CNFavorites *)self->_contactFavorites entriesForContact:v3];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isMessageSenderInContacts
{
  v2 = [(OSMNotificationFeatureMap *)self _messageSenderCNContact];
  BOOL v3 = v2 != 0;

  return v3;
}

- (OSMNotificationFeatureMap)initWithNotification:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)OSMNotificationFeatureMap;
  id v6 = [(OSMNotificationFeatureMap *)&v16 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notification, a3);
    double v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("OSMNotificationFeatureMapBackgroundQueue", v8);
    backgroundQueue = v7->_backgroundQueue;
    v7->_backgroundQueue = (OS_dispatch_queue *)v9;

    id v11 = (CNContactStore *)objc_alloc_init((Class)CNContactStore);
    contactStore = v7->_contactStore;
    v7->_contactStore = v11;

    unint64_t v13 = (CNFavorites *)[objc_alloc((Class)CNFavorites) initWithContactStore:v7->_contactStore];
    contactFavorites = v7->_contactFavorites;
    v7->_contactFavorites = v13;
  }
  return v7;
}

@end