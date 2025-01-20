@interface EDGroupedSender
+ (BOOL)supportsSecureCoding;
+ (id)log;
+ (int64_t)maxGroupedSenderMessageListItemsCount;
+ (int64_t)maxMessageCount;
- (BOOL)allowAuthenticationWarning;
- (BOOL)alwaysUseNewestItems;
- (BOOL)deleteMovesToTrash;
- (BOOL)displayNamesMatch;
- (BOOL)hasAttachments;
- (BOOL)hasUnflagged;
- (BOOL)isAuthenticated;
- (BOOL)isBlocked;
- (BOOL)isCCMe;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupedSender;
- (BOOL)isToMe;
- (BOOL)isVIP;
- (BOOL)shouldArchiveByDefault;
- (BOOL)supportsArchiving;
- (ECEmailAddressConvertible)emailAddress;
- (ECMessageFlags)flags;
- (ECSubject)subject;
- (EDBusinessCloudStorage)businessCloudStorage;
- (EDBusinessPersistence)businessPersistence;
- (EDGroupedSender)initWithBusinessID:(int64_t)a3 externalBusinessID:(id)a4 messages:(id)a5 originatingQuery:(id)a6 businessPersistence:(id)a7 messagePersistence:(id)a8 businessCloudStorage:(id)a9 unsubscribeDetector:(id)a10;
- (EDGroupedSender)initWithCoder:(id)a3;
- (EDGroupedSender)initWithObjectID:(id)a3 businessID:(int64_t)a4 externalBusinessID:(id)a5 messages:(id)a6 sortDescriptors:(id)a7 businessPersistence:(id)a8 messagePersistence:(id)a9 businessCloudStorage:(id)a10 unsubscribeDetector:(id)a11 unreadCount:(unint64_t)a12 unseenCount:(unint64_t)a13 alwaysUseNewestItems:(BOOL)a14;
- (EDMessagePersistence)messagePersistence;
- (EFFuture)displayMessage;
- (EMBusinessExternalID)externalBusinessID;
- (EMCategory)category;
- (EMCollectionItemID)displayMessageItemID;
- (EMCollectionItemID)itemID;
- (EMFollowUp)followUp;
- (EMGeneratedSummary)generatedSummary;
- (EMListUnsubscribeDetector)unsubscribeDetector;
- (EMMessage)newestMessage;
- (EMObjectID)displayMessageObjectID;
- (EMReadLater)readLater;
- (NSArray)ccList;
- (NSArray)groupedSenderMessageListItems;
- (NSArray)mailboxObjectIDs;
- (NSArray)mailboxes;
- (NSArray)mailboxesIfAvailable;
- (NSArray)messages;
- (NSArray)senderList;
- (NSArray)sortDescriptors;
- (NSArray)toList;
- (NSDate)date;
- (NSDate)displayDate;
- (NSDate)sendLaterDate;
- (NSIndexSet)flagColors;
- (NSString)businessDisplayName;
- (NSString)businessLogoID;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)summary;
- (NSURL)brandIndicatorLocation;
- (id)_newestMessageDescription;
- (id)_newestMessages:(int64_t)a3;
- (id)_persistedBusinessDisplayName;
- (id)_recalculateGroupedSenderMessageListItems;
- (id)_senderDisplayName;
- (id)_uiChangeFrom:(id)a3;
- (id)addMessages:(id)a3;
- (id)changeFrom:(id)a3;
- (id)changeKeyPaths:(id)a3 forMessages:(id)a4 messageProvider:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistedBusinessLogoID;
- (id)recalculateUnseenCount;
- (id)removeMessages:(id)a3 isGroupEmpty:(BOOL *)a4 messageProvider:(id)a5;
- (int64_t)businessID;
- (int64_t)conversationID;
- (int64_t)conversationNotificationLevel;
- (int64_t)unsubscribeType;
- (unint64_t)_authenticatedCountForMessages:(id)a3;
- (unint64_t)_flagCountForMessages:(id)a3;
- (unint64_t)_unreadCountForMessages:(id)a3;
- (unint64_t)_unseenCountForMessages:(id)a3;
- (unint64_t)_unseenCountForMessages:(id)a3 lastSeenDate:(id)a4 lastSeenDisplayDate:(id)a5;
- (unint64_t)authenticatedCount;
- (unint64_t)count;
- (unint64_t)flagCount;
- (unint64_t)unreadCount;
- (unint64_t)unseenCount;
- (void)_trimMessages;
- (void)_updateCachedMessagesIfNeededWithMessageProvider:(id)a3;
- (void)_updateGroupedSenderMessageListItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysUseNewestItems:(BOOL)a3;
- (void)setAuthenticatedCount:(unint64_t)a3;
- (void)setBusinessCloudStorage:(id)a3;
- (void)setBusinessID:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setBusinessPersistence:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFlagCount:(unint64_t)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)setUnseenCount:(unint64_t)a3;
@end

@implementation EDGroupedSender

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__EDGroupedSender_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_36 != -1) {
    dispatch_once(&log_onceToken_36, block);
  }
  v2 = (void *)log_log_36;

  return v2;
}

void __22__EDGroupedSender_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_36;
  log_log_36 = (uint64_t)v1;
}

- (EDGroupedSender)initWithBusinessID:(int64_t)a3 externalBusinessID:(id)a4 messages:(id)a5 originatingQuery:(id)a6 businessPersistence:(id)a7 messagePersistence:(id)a8 businessCloudStorage:(id)a9 unsubscribeDetector:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v39 = a7;
  id v38 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = (void *)MEMORY[0x1E4F60390];
  v42 = v18;
  v40 = v16;
  v37 = v19;
  v22 = [v18 predicate];
  v43 = [v21 threadScopeForPredicate:v22 withMailboxTypeResolver:0];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F602C0]) initWithBusinessID:a3 threadScope:v43];
  unint64_t v24 = [(EDGroupedSender *)self _unreadCountForMessages:v17];
  v25 = [v17 firstObject];
  v26 = [v25 category];

  v36 = v26;
  if (v26)
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "type"));
  }
  else
  {
    uint64_t v27 = 0;
  }
  v35 = (void *)v27;
  v41 = [v19 lastSeenDateForCategoryType:v27 businessWithExternalID:v16];
  v28 = [v19 lastSeenDisplayDateForCategoryType:v27 businessWithExternalID:v16];
  unint64_t v29 = [(EDGroupedSender *)self _unseenCountForMessages:v17 lastSeenDate:v41 lastSeenDisplayDate:v28];
  char v30 = [MEMORY[0x1E4F602E0] preferenceEnabled:47];
  v31 = [v42 sortDescriptors];
  LOBYTE(v34) = v30;
  v32 = [(EDGroupedSender *)self initWithObjectID:v23 businessID:a3 externalBusinessID:v40 messages:v17 sortDescriptors:v31 businessPersistence:v39 messagePersistence:v38 businessCloudStorage:v37 unsubscribeDetector:v20 unreadCount:v24 unseenCount:v29 alwaysUseNewestItems:v34];

  return v32;
}

- (EDGroupedSender)initWithObjectID:(id)a3 businessID:(int64_t)a4 externalBusinessID:(id)a5 messages:(id)a6 sortDescriptors:(id)a7 businessPersistence:(id)a8 messagePersistence:(id)a9 businessCloudStorage:(id)a10 unsubscribeDetector:(id)a11 unreadCount:(unint64_t)a12 unseenCount:(unint64_t)a13 alwaysUseNewestItems:(BOOL)a14
{
  id v20 = a3;
  id v37 = a5;
  id v21 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  v38.receiver = self;
  v38.super_class = (Class)EDGroupedSender;
  v22 = [(EMObject *)&v38 initWithObjectID:v20];
  v23 = v22;
  if (v22)
  {
    v22->_businessID = a4;
    uint64_t v24 = [v37 copy];
    externalBusinessID = v23->_externalBusinessID;
    v23->_externalBusinessID = (EMBusinessExternalID *)v24;

    objc_storeStrong((id *)&v23->_sortDescriptors, a7);
    objc_storeStrong((id *)&v23->_businessPersistence, a8);
    objc_storeStrong((id *)&v23->_messagePersistence, a9);
    objc_storeStrong((id *)&v23->_businessCloudStorage, a10);
    objc_storeStrong((id *)&v23->_unsubscribeDetector, a11);
    v26 = objc_msgSend(v21, "ef_filter:", &__block_literal_global_22);
    uint64_t v27 = [v26 mutableCopy];
    messages = v23->_messages;
    v23->_messages = (NSMutableArray *)v27;

    [(NSMutableArray *)v23->_messages sortUsingDescriptors:v36];
    uint64_t v29 = [MEMORY[0x1E4F60320] combinedFlagsForMessageListItems:v23->_messages];
    flags = v23->_flags;
    v23->_flags = (ECMessageFlags *)v29;

    v23->_unreadCount = a12;
    v23->_unseenCount = a13;
    v23->_flagCount = [(EDGroupedSender *)v23 _flagCountForMessages:v23->_messages];
    v23->_count = [v21 count];
    v23->_alwaysUseNewestItems = a14;
    v23->_authenticatedCount = [(EDGroupedSender *)v23 _authenticatedCountForMessages:v23->_messages];
    [(EDGroupedSender *)v23 _trimMessages];
  }

  return v23;
}

uint64_t __216__EDGroupedSender_initWithObjectID_businessID_externalBusinessID_messages_sortDescriptors_businessPersistence_messagePersistence_businessCloudStorage_unsubscribeDetector_unreadCount_unseenCount_alwaysUseNewestItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (EDGroupedSender)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EDGroupedSender;
  v5 = [(EMObject *)&v26 initWithCoder:v4];
  if (v5)
  {
    v5->_businessID = [v4 decodeInt64ForKey:@"EFPropertyKey_businessID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_businessLogoID"];
    businessLogoID = v5->_businessLogoID;
    v5->_businessLogoID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_externalBusinessID"];
    externalBusinessID = v5->_externalBusinessID;
    v5->_externalBusinessID = (EMBusinessExternalID *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (ECEmailAddressConvertible *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"EFPropertyKey_sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"EFPropertyKey_messages"];
    messages = v5->_messages;
    v5->_messages = (NSMutableArray *)v23;

    v5->_unreadCount = [v4 decodeIntegerForKey:@"EFPropertyKey_unreadCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDGroupedSender;
  [(EMObject *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[EDGroupedSender businessID](self, "businessID"), @"EFPropertyKey_businessID");
  v5 = [(EDGroupedSender *)self businessLogoID];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_businessLogoID"];

  uint64_t v6 = [(EDGroupedSender *)self businessDisplayName];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_businessDisplayName"];

  v7 = [(EDGroupedSender *)self externalBusinessID];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_externalBusinessID"];

  uint64_t v8 = [(EDGroupedSender *)self emailAddress];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_emailAddress"];

  v9 = [(EDGroupedSender *)self sortDescriptors];
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_sortDescriptors"];

  [v4 encodeObject:self->_messages forKey:@"EFPropertyKey_messages"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[EDGroupedSender unreadCount](self, "unreadCount"), @"EFPropertyKey_unreadCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v19 = [(EMObject *)self objectID];
  v22 = (void *)[v19 copy];
  int64_t v5 = [(EDGroupedSender *)self businessID];
  uint64_t v21 = [(EDGroupedSender *)self externalBusinessID];
  uint64_t v18 = [(EDGroupedSender *)self messages];
  id v20 = (void *)[v18 copy];
  id v17 = [(EDGroupedSender *)self sortDescriptors];
  uint64_t v6 = (void *)[v17 copy];
  v7 = [(EDGroupedSender *)self businessPersistence];
  uint64_t v8 = [(EDGroupedSender *)self messagePersistence];
  v9 = [(EDGroupedSender *)self businessCloudStorage];
  objc_super v10 = v4;
  uint64_t v11 = [(EDGroupedSender *)self unsubscribeDetector];
  unint64_t v12 = [(EDGroupedSender *)self unreadCount];
  unint64_t v13 = [(EDGroupedSender *)self unseenCount];
  LOBYTE(v16) = [(EDGroupedSender *)self alwaysUseNewestItems];
  v14 = (void *)[v10 initWithObjectID:v22 businessID:v5 externalBusinessID:v21 messages:v20 sortDescriptors:v6 businessPersistence:v7 messagePersistence:v8 businessCloudStorage:v9 unsubscribeDetector:v11 unreadCount:v12 unseenCount:v13 alwaysUseNewestItems:v16];

  return v14;
}

- (EMMessage)newestMessage
{
  v2 = [(EDGroupedSender *)self _newestMessages:1];
  uint64_t v3 = [v2 firstObject];

  return (EMMessage *)v3;
}

- (id)_newestMessages:(int64_t)a3
{
  if (a3)
  {
    int64_t v5 = [(EDGroupedSender *)self sortDescriptors];
    uint64_t v6 = [v5 firstObject];
    int v7 = [v6 ascending];

    unint64_t v8 = [(NSMutableArray *)self->_messages count];
    if (v8 >= a3) {
      int64_t v9 = a3;
    }
    else {
      int64_t v9 = v8;
    }
    if (v7) {
      uint64_t v10 = [(NSMutableArray *)self->_messages count] - v9;
    }
    else {
      uint64_t v10 = 0;
    }
    unint64_t v12 = -[NSMutableArray subarrayWithRange:](self->_messages, "subarrayWithRange:", v10, v9);
    unint64_t v13 = v12;
    if (v7)
    {
      objc_msgSend(v12, "ef_reverse");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = v12;
    }
    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_unreadCountForMessages:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "flags", (void)v11);
        int v9 = [v8 read];

        v4 += v9 ^ 1u;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v4;
}

- (unint64_t)_flagCountForMessages:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  unint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "flags", (void)v11);
        unsigned int v9 = [v8 flagged];

        v4 += v9;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v4;
}

- (unint64_t)_unseenCountForMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDGroupedSender *)self category];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(EDGroupedSender *)self businessCloudStorage];
  unsigned int v9 = [(EDGroupedSender *)self externalBusinessID];
  uint64_t v10 = [v8 lastSeenDateForCategoryType:v7 businessWithExternalID:v9];

  long long v11 = [(EDGroupedSender *)self businessCloudStorage];
  long long v12 = [(EDGroupedSender *)self externalBusinessID];
  long long v13 = [v11 lastSeenDisplayDateForCategoryType:v7 businessWithExternalID:v12];

  unint64_t v14 = [(EDGroupedSender *)self _unseenCountForMessages:v4 lastSeenDate:v10 lastSeenDisplayDate:v13];
  return v14;
}

- (unint64_t)_unseenCountForMessages:(id)a3 lastSeenDate:(id)a4 lastSeenDisplayDate:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  unint64_t v11 = 0;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "flags", (void)v23);
        char v17 = [v16 read];

        if ((v17 & 1) == 0)
        {
          if (v8)
          {
            uint64_t v18 = [v15 date];
            int v19 = objc_msgSend(v8, "ef_isEarlierThanDate:", v18) ^ 1;
            if (!v9) {
              LOBYTE(v19) = 0;
            }
            if (v19)
            {
              id v20 = [v15 displayDate];
              int v21 = objc_msgSend(v9, "ef_isEarlierThanDate:", v20);

              if (!v21) {
                continue;
              }
            }
            else
            {
            }
          }
          ++v11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EDGroupedSender;
  return [(EMObject *)&v4 isEqual:a3];
}

- (id)addMessages:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v19 = (void *)[(EDGroupedSender *)self copy];
  uint64_t v5 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_42_1);

  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
  id v7 = [(EDGroupedSender *)self sortDescriptors];
  id v8 = EFComparatorFromSortDescriptors();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (-[NSMutableArray ef_insertObjectIfAbsent:usingComparator:](self->_messages, "ef_insertObjectIfAbsent:usingComparator:", v13, v8) != 0x7FFFFFFFFFFFFFFFLL)[v6 addObject:v13]; {
      }
        }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }

  [(EDGroupedSender *)self _trimMessages];
  [(EDGroupedSender *)self setAuthenticatedCount:[(EDGroupedSender *)self authenticatedCount]+ [(EDGroupedSender *)self _authenticatedCountForMessages:v6]];
  [(EDGroupedSender *)self setUnreadCount:[(EDGroupedSender *)self unreadCount]+ [(EDGroupedSender *)self _unreadCountForMessages:v6]];
  [(EDGroupedSender *)self setUnseenCount:[(EDGroupedSender *)self unseenCount]+ [(EDGroupedSender *)self _unseenCountForMessages:v6]];
  unint64_t v14 = [(EDGroupedSender *)self _flagCountForMessages:v6];
  if (v14)
  {
    v15 = +[EDGroupedSender log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(EMObject *)self objectID];
      *(_DWORD *)buf = 134218242;
      unint64_t v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "Incrementing flagCount by %lld for sender %@", buf, 0x16u);
    }
  }
  [(EDGroupedSender *)self setFlagCount:[(EDGroupedSender *)self flagCount] + v14];
  self->_count += [v6 count];
  char v17 = [(EDGroupedSender *)self _uiChangeFrom:v19];

  return v17;
}

uint64_t __31__EDGroupedSender_addMessages___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 flags];
  uint64_t v3 = [v2 deleted] ^ 1;

  return v3;
}

- (id)changeKeyPaths:(id)a3 forMessages:(id)a4 messageProvider:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v47 = a5;
  v48 = (void *)[(EDGroupedSender *)self copy];
  id v8 = objc_msgSend(v7, "ef_filter:", &__block_literal_global_46);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v9)
  {
    uint64_t v50 = *(void *)v52;
    uint64_t v10 = *MEMORY[0x1E4F60CE8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        messages = self->_messages;
        unint64_t v14 = [v12 second];
        [(NSMutableArray *)messages removeObject:v14];

        v15 = [v12 first];
        LODWORD(messages) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v15);

        if (!messages) {
          continue;
        }
        uint64_t v16 = [v12 first];
        char v17 = [v16 flags];
        if ([v17 read])
        {
        }
        else
        {
          uint64_t v18 = [v12 second];
          int v19 = [v18 flags];
          int v20 = [v19 read];

          if (v20)
          {
            unint64_t v21 = [(EDGroupedSender *)self unreadCount] - 1;
LABEL_14:
            [(EDGroupedSender *)self setUnreadCount:v21];
            goto LABEL_16;
          }
        }
        long long v22 = [v12 first];
        long long v23 = [v22 flags];
        if ([v23 read])
        {
          long long v24 = [v12 second];
          unint64_t v25 = [v24 flags];
          char v26 = [v25 read];

          if (v26) {
            goto LABEL_16;
          }
          unint64_t v21 = [(EDGroupedSender *)self unreadCount] + 1;
          goto LABEL_14;
        }

LABEL_16:
        uint64_t v27 = [v12 second];
        if ([v27 isAuthenticated])
        {
        }
        else
        {
          uint64_t v28 = [v12 first];
          int v29 = [v28 isAuthenticated];

          if (v29)
          {
            unint64_t v30 = [(EDGroupedSender *)self authenticatedCount] + 1;
LABEL_23:
            [(EDGroupedSender *)self setAuthenticatedCount:v30];
            goto LABEL_25;
          }
        }
        v31 = [v12 second];
        if (([v31 isAuthenticated] & 1) == 0)
        {

          goto LABEL_25;
        }
        id v32 = [v12 first];
        char v33 = [v32 isAuthenticated];

        if ((v33 & 1) == 0)
        {
          unint64_t v30 = [(EDGroupedSender *)self authenticatedCount] - 1;
          goto LABEL_23;
        }
LABEL_25:
        id v34 = [v12 second];
        id v35 = [v34 flags];
        if ([v35 flagged])
        {
        }
        else
        {
          id v36 = [v12 first];
          id v37 = [v36 flags];
          int v38 = [v37 flagged];

          if (v38)
          {
            unint64_t v39 = [(EDGroupedSender *)self flagCount] + 1;
LABEL_32:
            [(EDGroupedSender *)self setFlagCount:v39];
            continue;
          }
        }
        v40 = [v12 second];
        v41 = [v40 flags];
        if ([v41 flagged])
        {
          v42 = [v12 first];
          v43 = [v42 flags];
          char v44 = [v43 flagged];

          if (v44) {
            continue;
          }
          unint64_t v39 = [(EDGroupedSender *)self flagCount] - 1;
          goto LABEL_32;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v9);
  }

  [(EDGroupedSender *)self _updateCachedMessagesIfNeededWithMessageProvider:v47];
  v45 = [(EDGroupedSender *)self _uiChangeFrom:v48];

  return v45;
}

uint64_t __62__EDGroupedSender_changeKeyPaths_forMessages_messageProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 second];
  uint64_t v3 = [v2 flags];
  uint64_t v4 = [v3 deleted] ^ 1;

  return v4;
}

- (id)removeMessages:(id)a3 isGroupEmpty:(BOOL *)a4 messageProvider:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[(EDGroupedSender *)self copy];
  if ([v8 count]) {
    [(NSMutableArray *)self->_messages removeObjectsInArray:v8];
  }
  [(EDGroupedSender *)self _updateCachedMessagesIfNeededWithMessageProvider:v9];
  uint64_t v11 = [(NSMutableArray *)self->_messages count];
  if (a4) {
    *a4 = v11 == 0;
  }
  if (v11)
  {
    [(EDGroupedSender *)self setUnreadCount:[(EDGroupedSender *)self unreadCount]- [(EDGroupedSender *)self _unreadCountForMessages:v8]];
    [(EDGroupedSender *)self setUnseenCount:[(EDGroupedSender *)self unseenCount]- [(EDGroupedSender *)self _unseenCountForMessages:v8]];
    [(EDGroupedSender *)self setAuthenticatedCount:[(EDGroupedSender *)self authenticatedCount]- [(EDGroupedSender *)self _authenticatedCountForMessages:v8]];
    unint64_t v12 = [(EDGroupedSender *)self _flagCountForMessages:v8];
    if (v12)
    {
      uint64_t v13 = +[EDGroupedSender log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v14 = [(EMObject *)self objectID];
        int v17 = 134218242;
        unint64_t v18 = v12;
        __int16 v19 = 2112;
        int v20 = v14;
        _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Decrementing flagCount by %lld for sender %@", (uint8_t *)&v17, 0x16u);
      }
    }
    [(EDGroupedSender *)self setFlagCount:[(EDGroupedSender *)self flagCount] - v12];
    self->_count -= [v8 count];
    v15 = [(EDGroupedSender *)self _uiChangeFrom:v10];
  }
  else
  {
    [(EDGroupedSender *)self setUnreadCount:0];
    [(EDGroupedSender *)self setUnseenCount:0];
    [(EDGroupedSender *)self setAuthenticatedCount:0];
    [(EDGroupedSender *)self setFlagCount:0];
    v15 = 0;
    self->_count = 0;
  }

  return v15;
}

- (id)_uiChangeFrom:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F602B8] changeFrom:a3 to:self];
  uint64_t v4 = [v3 groupedSenderMessageListItems];
  if (v4
    || ([v3 isAuthenticated], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v3 count], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_5:
    id v5 = v3;
    goto LABEL_6;
  }
  id v5 = [v3 unreadCount];

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (id)changeFrom:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F602B8] changeFrom:a3 to:self];

  return v3;
}

- (void)_trimMessages
{
  [(EDGroupedSender *)self _updateGroupedSenderMessageListItems];
  id v10 = [(NSMutableArray *)self->_messages firstObject];
  uint64_t v4 = (NSMutableArray *)[(NSArray *)self->_groupedSenderMessageListItems mutableCopy];
  messages = self->_messages;
  self->_messages = v4;

  if (v10) {
    [(NSMutableArray *)self->_messages ef_addObjectIfAbsent:v10];
  }
  uint64_t v6 = self->_messages;
  id v7 = [(EDGroupedSender *)self sortDescriptors];
  [(NSMutableArray *)v6 sortUsingDescriptors:v7];

  unint64_t v8 = [(id)objc_opt_class() maxMessageCount];
  if ([(NSMutableArray *)self->_messages count] > v8)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EDGroupedSender-BlackPearlUI.m" lineNumber:350 description:@"too many items in _messages"];
  }
}

- (void)_updateCachedMessagesIfNeededWithMessageProvider:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_messages count];
  if (v5 <= [(id)objc_opt_class() maxMessageCount])
  {
    uint64_t v6 = [v4 messagesForGroupedSender:self limit:0x7FFFFFFFFFFFFFFFLL];
    if ([v6 count] || (EFProtectedDataAvailable() & 1) != 0)
    {
      id v7 = (NSMutableArray *)[v6 mutableCopy];
      messages = self->_messages;
      self->_messages = v7;

      [(EDGroupedSender *)self _trimMessages];
    }
    else
    {
      id v9 = +[EDGroupedSender log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (id)objc_opt_class();
        uint64_t v11 = [(EDGroupedSender *)self ef_publicDescription];
        int v12 = 138412802;
        id v13 = v10;
        __int16 v14 = 2048;
        v15 = self;
        __int16 v16 = 2114;
        int v17 = v11;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "<%@ %p> Unable to fetch messages for %{public}@, as the protected database is unavailable. Skipping updating cached messages", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (id)recalculateUnseenCount
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(EDGroupedSender *)self unseenCount];
  id v4 = [(EDGroupedSender *)self messages];
  [(EDGroupedSender *)self setUnseenCount:[(EDGroupedSender *)self _unseenCountForMessages:v4]];

  if (v3 == [(EDGroupedSender *)self unseenCount])
  {
    unint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F602B8];
    v9[0] = *MEMORY[0x1E4F5FCF8];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    unint64_t v5 = [v6 changeForKeyPaths:v7 ofItem:self];
  }

  return v5;
}

- (unint64_t)_authenticatedCountForMessages:(id)a3
{
  return objc_msgSend(a3, "ef_countObjectsPassingTest:", &__block_literal_global_56);
}

uint64_t __50__EDGroupedSender__authenticatedCountForMessages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAuthenticated];
}

- (EMCollectionItemID)itemID
{
  v2 = [(EMObject *)self objectID];
  unint64_t v3 = [v2 collectionItemID];

  return (EMCollectionItemID *)v3;
}

- (int64_t)conversationID
{
  return *MEMORY[0x1E4F5FCC8];
}

- (NSArray)mailboxObjectIDs
{
  v2 = [(EDGroupedSender *)self newestMessage];
  unint64_t v3 = [v2 mailboxObjectIDs];

  return (NSArray *)v3;
}

- (NSArray)mailboxes
{
  v2 = [(EDGroupedSender *)self newestMessage];
  unint64_t v3 = [v2 mailboxes];

  return (NSArray *)v3;
}

- (NSArray)mailboxesIfAvailable
{
  v2 = [(EDGroupedSender *)self newestMessage];
  unint64_t v3 = [v2 mailboxesIfAvailable];

  return (NSArray *)v3;
}

- (EFFuture)displayMessage
{
  v2 = (void *)MEMORY[0x1E4F60D70];
  unint64_t v3 = [(EDGroupedSender *)self groupedSenderMessageListItems];
  id v4 = [v3 firstObject];
  unint64_t v5 = [v2 futureWithResult:v4];

  return (EFFuture *)v5;
}

- (EMCollectionItemID)displayMessageItemID
{
  v2 = [(EDGroupedSender *)self groupedSenderMessageListItems];
  unint64_t v3 = [v2 firstObject];
  id v4 = [v3 displayMessageItemID];

  return (EMCollectionItemID *)v4;
}

- (EMObjectID)displayMessageObjectID
{
  v2 = [(EDGroupedSender *)self groupedSenderMessageListItems];
  unint64_t v3 = [v2 firstObject];
  id v4 = [v3 displayMessageObjectID];

  return (EMObjectID *)v4;
}

- (BOOL)deleteMovesToTrash
{
  v2 = (void *)MEMORY[0x1E4F60308];
  unint64_t v3 = [(EDGroupedSender *)self mailboxes];
  LOBYTE(v2) = [v2 deleteMovesToTrashForMailboxes:v3];

  return (char)v2;
}

- (BOOL)supportsArchiving
{
  v2 = (void *)MEMORY[0x1E4F60308];
  unint64_t v3 = [(EDGroupedSender *)self mailboxes];
  LOBYTE(v2) = [v2 supportsArchivingForMailboxes:v3];

  return (char)v2;
}

- (BOOL)shouldArchiveByDefault
{
  if (![(EDGroupedSender *)self supportsArchiving]) {
    return 0;
  }
  unint64_t v3 = (void *)MEMORY[0x1E4F60308];
  id v4 = [(EDGroupedSender *)self mailboxes];
  char v5 = [v3 shouldArchiveByDefaultForMailboxes:v4];

  return v5;
}

- (BOOL)isEditable
{
  unint64_t isEditable = self->_isEditable;
  if (!isEditable)
  {
    id v4 = [(EDGroupedSender *)self mailboxes];
    int v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_61);

    unint64_t isEditable = 1;
    if (v5) {
      unint64_t isEditable = 2;
    }
    self->_unint64_t isEditable = isEditable;
  }
  return isEditable == 2;
}

BOOL __29__EDGroupedSender_isEditable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 5 || objc_msgSend(v2, "type") == 6;

  return v3;
}

- (NSDate)date
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  BOOL v3 = [v2 date];

  return (NSDate *)v3;
}

- (NSDate)displayDate
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  BOOL v3 = [v2 displayDate];

  return (NSDate *)v3;
}

- (NSString)businessDisplayName
{
  BOOL v3 = [(EDGroupedSender *)self _persistedBusinessDisplayName];
  if ([(EDGroupedSender *)self displayNamesMatch]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  int v5 = v4;

  return v5;
}

- (id)_persistedBusinessDisplayName
{
  BOOL v3 = [(EDGroupedSender *)self businessPersistence];
  id v4 = objc_msgSend(v3, "businessDisplayNameForBusinessID:", -[EDGroupedSender businessID](self, "businessID"));

  return v4;
}

- (NSString)businessLogoID
{
  uint64_t v3 = [(EDGroupedSender *)self persistedBusinessLogoID];
  if (v3)
  {
    id v4 = (void *)v3;
    if ([(EDGroupedSender *)self displayNamesMatch])
    {
      int v5 = [(EDGroupedSender *)self persistedBusinessLogoID];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return (NSString *)v5;
}

- (id)persistedBusinessLogoID
{
  id v2 = [(NSMutableArray *)self->_messages firstObject];
  uint64_t v3 = [v2 businessLogoID];

  return v3;
}

- (id)_senderDisplayName
{
  id v2 = [(EDGroupedSender *)self senderList];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 emailAddressValue];
  int v5 = [v4 emailAddressValue];
  uint64_t v6 = [v5 displayName];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  id v9 = v8;

  return v9;
}

- (BOOL)displayNamesMatch
{
  uint64_t v3 = [(EDGroupedSender *)self _persistedBusinessDisplayName];
  id v4 = [v3 lowercaseString];

  int v5 = [(EDGroupedSender *)self _senderDisplayName];
  uint64_t v6 = [v5 lowercaseString];

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__EDGroupedSender_displayNamesMatch__block_invoke;
    aBlock[3] = &unk_1E6C01048;
    aBlock[4] = self;
    id v7 = v4;
    id v36 = v7;
    id v8 = v6;
    id v37 = v8;
    id v9 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
    id v10 = [(EDGroupedSender *)self persistedBusinessLogoID];

    if (v10)
    {
      unint64_t v11 = [v7 length];
      unint64_t v12 = [v8 length];
      if (v11 >= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13 >= 4) {
        unint64_t v13 = 4;
      }
      BOOL v14 = v13 != 0;
      unint64_t v15 = v13 - 1;
      if (v14) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = 0;
      }
      if ([v7 length])
      {
        int v17 = [v7 substringToIndex:v16];
      }
      else
      {
        int v17 = &stru_1F3583658;
      }
      if ([v8 length])
      {
        int v20 = [v8 substringToIndex:v16];
      }
      else
      {
        int v20 = &stru_1F3583658;
      }
      char v18 = [(__CFString *)v17 isEqualToString:v20];
      if ((v18 & 1) == 0) {
        v9[2](v9, @"First 3 characters do not match");
      }
    }
    else
    {
      unint64_t v19 = [v7 length];
      if (v19 > [v8 length])
      {
        v9[2](v9, @"persisted display name is longer");
        char v18 = 0;
LABEL_27:

        goto LABEL_28;
      }
      id v34 = 0;
      objc_msgSend(v7, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", 0, 0, 50, &v34);
      int v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v17 = (__CFString *)v34;
      id v33 = 0;
      uint64_t v21 = objc_msgSend(v8, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", 0, 0, 50, &v33);
      id v22 = v33;
      unint64_t v23 = [(__CFString *)v20 count];
      if (v23 <= [v21 count])
      {
        uint64_t v29 = 0;
        unint64_t v30 = &v29;
        uint64_t v31 = 0x2020000000;
        char v32 = 1;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __36__EDGroupedSender_displayNamesMatch__block_invoke_70;
        v25[3] = &unk_1E6C01070;
        id v26 = v21;
        uint64_t v28 = &v29;
        uint64_t v27 = v9;
        [(__CFString *)v20 enumerateObjectsUsingBlock:v25];
        char v18 = *((unsigned char *)v30 + 24) != 0;

        _Block_object_dispose(&v29, 8);
      }
      else
      {
        v9[2](v9, @"persisted display name has more tokens");
        char v18 = 0;
      }
    }
    goto LABEL_27;
  }
  char v18 = 1;
LABEL_28:

  return v18;
}

void __36__EDGroupedSender_displayNamesMatch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 40) <= 1uLL)
  {
    id v4 = +[EDGroupedSender log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) businessID];
      uint64_t v6 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 40)];
      id v7 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:*(void *)(a1 + 48)];
      int v8 = 134349826;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      unint64_t v11 = v6;
      __int16 v12 = 2114;
      unint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_fault_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_FAULT, "Found a business with an invalid display name: %{public}lld, businessName: %{public}@, messageName: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x2Au);
    }
    ++*(void *)(*(void *)(a1 + 32) + 40);
  }
}

void __36__EDGroupedSender_displayNamesMatch__block_invoke_70(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) count] <= a3
    || ([*(id *)(a1 + 32) objectAtIndexedSubscript:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:v11],
        v7,
        (v8 & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v9 = *(void *)(a1 + 40);
    __int16 v10 = objc_msgSend(NSString, "stringWithFormat:", @"token %ld desn't match", a3);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    *a4 = 1;
  }
}

- (ECSubject)subject
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  id v3 = [v2 subject];

  return (ECSubject *)v3;
}

+ (int64_t)maxMessageCount
{
  return [a1 maxGroupedSenderMessageListItemsCount] + 1;
}

+ (int64_t)maxGroupedSenderMessageListItemsCount
{
  if (maxGroupedSenderMessageListItemsCount_onceToken != -1) {
    dispatch_once(&maxGroupedSenderMessageListItemsCount_onceToken, &__block_literal_global_82);
  }
  return maxGroupedSenderMessageListItemsCount_maxGroupedSenderMessageListItemsCount;
}

void __56__EDGroupedSender_maxGroupedSenderMessageListItemsCount__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = objc_msgSend(v2, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", *MEMORY[0x1E4F60130], 5, 1, &__block_literal_global_86);
  os_log_t v1 = (void *)maxGroupedSenderMessageListItemsCount__observationToken;
  maxGroupedSenderMessageListItemsCount__observationToken = v0;
}

uint64_t __56__EDGroupedSender_maxGroupedSenderMessageListItemsCount__block_invoke_2()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F1CB18], "em_linesOfPreview");
  if (result <= 1) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = result;
  }
  maxGroupedSenderMessageListItemsCount_maxGroupedSenderMessageListItemsCount = v1;
  return result;
}

- (NSArray)groupedSenderMessageListItems
{
  groupedSenderMessageListItems = self->_groupedSenderMessageListItems;
  if (!groupedSenderMessageListItems)
  {
    [(EDGroupedSender *)self _updateGroupedSenderMessageListItems];
    groupedSenderMessageListItems = self->_groupedSenderMessageListItems;
  }

  return groupedSenderMessageListItems;
}

- (void)_updateGroupedSenderMessageListItems
{
  id v3 = [(EDGroupedSender *)self _recalculateGroupedSenderMessageListItems];
  groupedSenderMessageListItems = self->_groupedSenderMessageListItems;
  self->_groupedSenderMessageListItems = v3;
}

- (id)_recalculateGroupedSenderMessageListItems
{
  unint64_t v4 = +[EDGroupedSender maxGroupedSenderMessageListItemsCount];
  unint64_t v5 = [(NSMutableArray *)self->_messages count];
  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  if ([(EDGroupedSender *)self alwaysUseNewestItems])
  {
    id v7 = [(NSMutableArray *)self->_messages ef_prefix:v6];
  }
  else
  {
    char v8 = [(EDGroupedSender *)self sortDescriptors];
    uint64_t v9 = [v8 firstObject];
    int v10 = [v9 ascending];

    if (v10)
    {
      char v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"EDGroupedSender-BlackPearlUI.m" lineNumber:590 description:@"Only ascending is supported"];
    }
    uint64_t v11 = [(NSMutableArray *)self->_messages indexOfObjectPassingTest:&__block_literal_global_92];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v12 = -[NSMutableArray subarrayWithRange:](self->_messages, "subarrayWithRange:", [(NSMutableArray *)self->_messages count] - v6, v6);
      id v7 = objc_msgSend(v12, "ef_reverse");
    }
    else
    {
      uint64_t v13 = v11;
      __int16 v14 = -[NSMutableArray subarrayWithRange:](self->_messages, "subarrayWithRange:", 0, v11);
      __int16 v12 = objc_msgSend(v14, "ef_reverse");

      if ([v12 count] > v6)
      {
        uint64_t v15 = objc_msgSend(v12, "ef_prefix:", v6);

        __int16 v12 = (void *)v15;
      }
      id v7 = (void *)[v12 mutableCopy];
      uint64_t v16 = -[NSMutableArray subarrayWithRange:](self->_messages, "subarrayWithRange:", v13, v6 - [v7 count]);
      [v7 addObjectsFromArray:v16];
    }
  }

  return v7;
}

uint64_t __60__EDGroupedSender__recalculateGroupedSenderMessageListItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 flags];
  uint64_t v3 = [v2 read];

  return v3;
}

- (NSString)summary
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 summary];

  return (NSString *)v3;
}

- (EMGeneratedSummary)generatedSummary
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 generatedSummary];

  return (EMGeneratedSummary *)v3;
}

- (NSArray)senderList
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 senderList];

  return (NSArray *)v3;
}

- (NSArray)toList
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 toList];

  return (NSArray *)v3;
}

- (NSArray)ccList
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 ccList];

  return (NSArray *)v3;
}

- (BOOL)hasUnflagged
{
  return [(EDGroupedSender *)self flagCount] < self->_count;
}

- (NSIndexSet)flagColors
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  uint64_t v3 = [v2 flagColors];

  return (NSIndexSet *)v3;
}

- (BOOL)isVIP
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  char v3 = [v2 isVIP];

  return v3;
}

- (BOOL)isBlocked
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  char v3 = [v2 isBlocked];

  return v3;
}

- (int64_t)unsubscribeType
{
  return 0;
}

- (BOOL)hasAttachments
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  char v3 = [v2 hasAttachments];

  return v3;
}

- (int64_t)conversationNotificationLevel
{
  return 0;
}

- (NSURL)brandIndicatorLocation
{
  id v2 = [(EDGroupedSender *)self messages];
  char v3 = objc_msgSend(v2, "ef_firstObjectPassingTest:", &__block_literal_global_94_1);
  unint64_t v4 = [v3 brandIndicatorLocation];

  return (NSURL *)v4;
}

BOOL __41__EDGroupedSender_brandIndicatorLocation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 brandIndicatorLocation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (EMReadLater)readLater
{
  return 0;
}

- (EMFollowUp)followUp
{
  return 0;
}

- (NSDate)sendLaterDate
{
  return 0;
}

- (EMCategory)category
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  BOOL v3 = [v2 category];

  return (EMCategory *)v3;
}

- (BOOL)isGroupedSender
{
  return 1;
}

- (NSArray)messages
{
  id v2 = (void *)[(NSMutableArray *)self->_messages copy];

  return (NSArray *)v2;
}

- (void)setUnreadCount:(unint64_t)a3
{
  unint64_t unreadCount = self->_unreadCount;
  if (unreadCount != a3)
  {
    if (a3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = unreadCount == 0;
    }
    int v7 = v6;
    if (v6) {
      char v8 = &__block_literal_global_99;
    }
    else {
      char v8 = &__block_literal_global_97;
    }
    if (v7 != 1 || unreadCount == 0)
    {
      int v10 = [(ECMessageFlags *)self->_flags updatedFlagsWithBuilder:v8];
      flags = self->_flags;
      self->_flags = v10;
    }
    self->_unint64_t unreadCount = a3;
  }
}

uint64_t __34__EDGroupedSender_setUnreadCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRead:1];
}

uint64_t __34__EDGroupedSender_setUnreadCount___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setRead:0];
}

- (id)_newestMessageDescription
{
  id v2 = [(EDGroupedSender *)self newestMessage];
  BOOL v3 = NSString;
  unint64_t v4 = [v2 objectID];
  uint64_t v5 = [v4 globalMessageID];
  BOOL v6 = [v2 subject];
  int v7 = objc_msgSend(v6, "ef_publicDescription");
  char v8 = [v2 flags];
  uint64_t v9 = objc_msgSend(v8, "ef_publicDescription");
  int v10 = [v3 stringWithFormat:@"<Newest Message Info - GlobalMessageID:%lld Subject:%@ Flags:%@>", v5, v7, v9];

  return v10;
}

- (BOOL)isAuthenticated
{
  return [(EDGroupedSender *)self authenticatedCount] != 0;
}

- (BOOL)allowAuthenticationWarning
{
  return 0;
}

- (NSString)debugDescription
{
  uint64_t v15 = NSString;
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = [(EDGroupedSender *)self businessDisplayName];
  int64_t v3 = [(EDGroupedSender *)self businessID];
  unint64_t v4 = [(EDGroupedSender *)self businessLogoID];
  uint64_t v5 = [(EDGroupedSender *)self messages];
  uint64_t v6 = [v5 count];
  unint64_t v7 = [(EDGroupedSender *)self unreadCount];
  unint64_t v8 = [(EDGroupedSender *)self unseenCount];
  unint64_t v9 = [(EDGroupedSender *)self flagCount];
  int v10 = [(EDGroupedSender *)self category];
  uint64_t v11 = [(EDGroupedSender *)self _newestMessageDescription];
  __int16 v12 = [v15 stringWithFormat:@"<%@: %p> %@ (%lld, %@) messages:%lu, unread count:%lu, unseen count:%lu, flagCount:%lu, Category:%@ %@", v14, self, v16, v3, v4, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSString)ef_publicDescription
{
  uint64_t v16 = NSString;
  uint64_t v15 = objc_opt_class();
  int64_t v3 = (void *)MEMORY[0x1E4F60E00];
  char v18 = [(EDGroupedSender *)self businessDisplayName];
  int v17 = objc_msgSend(v3, "fullyOrPartiallyRedactedStringForString:");
  int64_t v4 = [(EDGroupedSender *)self businessID];
  uint64_t v5 = [(EDGroupedSender *)self businessLogoID];
  uint64_t v6 = [(EDGroupedSender *)self messages];
  uint64_t v7 = [v6 count];
  unint64_t v8 = [(EDGroupedSender *)self unreadCount];
  unint64_t v9 = [(EDGroupedSender *)self unseenCount];
  unint64_t v10 = [(EDGroupedSender *)self flagCount];
  uint64_t v11 = [(EDGroupedSender *)self category];
  __int16 v12 = [(EDGroupedSender *)self _newestMessageDescription];
  uint64_t v13 = [v16 stringWithFormat:@"<%@: %p> %@ (%lld, %@) messages:%lu, unread count:%lu, unseen count:%lu, flagCount:%lu, Category:%@ %@", v15, self, v17, v4, v5, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (unint64_t)count
{
  return self->_count;
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)objc_getProperty(self, a2, 64, 1);
}

- (EMBusinessExternalID)externalBusinessID
{
  return self->_externalBusinessID;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (unint64_t)unseenCount
{
  return self->_unseenCount;
}

- (void)setUnseenCount:(unint64_t)a3
{
  self->_unseenCount = a3;
}

- (unint64_t)authenticatedCount
{
  return self->_authenticatedCount;
}

- (void)setAuthenticatedCount:(unint64_t)a3
{
  self->_authenticatedCount = a3;
}

- (ECEmailAddressConvertible)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (int64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(int64_t)a3
{
  self->_businessID = a3;
}

- (void)setBusinessLogoID:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (EMListUnsubscribeDetector)unsubscribeDetector
{
  return self->_unsubscribeDetector;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDBusinessPersistence)businessPersistence
{
  return self->_businessPersistence;
}

- (void)setBusinessPersistence:(id)a3
{
}

- (EDBusinessCloudStorage)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (void)setBusinessCloudStorage:(id)a3
{
}

- (unint64_t)flagCount
{
  return self->_flagCount;
}

- (void)setFlagCount:(unint64_t)a3
{
  self->_flagCount = a3;
}

- (BOOL)alwaysUseNewestItems
{
  return self->_alwaysUseNewestItems;
}

- (void)setAlwaysUseNewestItems:(BOOL)a3
{
  self->_alwaysUseNewestItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_unsubscribeDetector, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_externalBusinessID, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_flags, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

@end