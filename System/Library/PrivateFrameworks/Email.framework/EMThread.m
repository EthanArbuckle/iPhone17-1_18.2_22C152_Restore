@interface EMThread
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
- (BOOL)allowAuthenticationWarning;
- (BOOL)deleteMovesToTrash;
- (BOOL)hasAttachments;
- (BOOL)hasUnflagged;
- (BOOL)isAuthenticated;
- (BOOL)isBlocked;
- (BOOL)isCCMe;
- (BOOL)isEditable;
- (BOOL)isGroupedSender;
- (BOOL)isToMe;
- (BOOL)isVIP;
- (BOOL)objectIDBelongsToCollection:(id)a3;
- (BOOL)shouldArchiveByDefault;
- (BOOL)supportsArchiving;
- (ECMessageFlags)flags;
- (ECSubject)subject;
- (EFFuture)displayMessage;
- (EMCategory)category;
- (EMCollectionItemID)displayMessageItemID;
- (EMCollectionItemID)itemID;
- (EMFollowUp)followUp;
- (EMGeneratedSummary)generatedSummary;
- (EMMailboxScope)mailboxScope;
- (EMMailboxTypeResolver)mailboxTypeResolver;
- (EMMessageRepository)repository;
- (EMObjectID)displayMessageObjectID;
- (EMQuery)originatingQuery;
- (EMReadLater)readLater;
- (EMThread)initWithCoder:(id)a3;
- (EMThread)initWithObjectID:(id)a3 originatingQuery:(id)a4 builder:(id)a5;
- (NSArray)ccList;
- (NSArray)groupedSenderMessageListItems;
- (NSArray)mailboxObjectIDs;
- (NSArray)mailboxes;
- (NSArray)mailboxesIfAvailable;
- (NSArray)senderList;
- (NSArray)toList;
- (NSDate)date;
- (NSDate)displayDate;
- (NSDate)sendLaterDate;
- (NSIndexSet)flagColors;
- (NSString)businessLogoID;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)summary;
- (NSURL)brandIndicatorLocation;
- (id)changeFrom:(id)a3;
- (id)itemIDForObjectID:(id)a3;
- (id)objectIDForItemID:(id)a3;
- (id)query;
- (int64_t)businessID;
- (int64_t)conversationID;
- (int64_t)conversationNotificationLevel;
- (int64_t)unsubscribeType;
- (unint64_t)count;
- (void)_commonInitWithOriginatingQuery:(id)a3 builder:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4;
- (void)query;
- (void)setAllowAuthenticationWarning:(BOOL)a3;
- (void)setBrandIndicatorLocation:(id)a3;
- (void)setBusinessID:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCcList:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setConversationNotificationLevel:(int64_t)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDisplayMessageItemID:(id)a3;
- (void)setFlagColors:(id)a3;
- (void)setFlags:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setGeneratedSummary:(id)a3;
- (void)setGroupedSenderMessageListItems:(id)a3;
- (void)setHasAttachments:(BOOL)a3;
- (void)setHasUnflagged:(BOOL)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsCCMe:(BOOL)a3;
- (void)setIsToMe:(BOOL)a3;
- (void)setIsVIP:(BOOL)a3;
- (void)setMailboxObjectIDs:(id)a3;
- (void)setMailboxTypeResolver:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setReadLater:(id)a3;
- (void)setRepository:(id)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSummary:(id)a3;
- (void)setToList:(id)a3;
- (void)setUnsubscribeType:(int64_t)a3;
@end

@implementation EMThread

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingQuery, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayMessageItemID, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxTypeResolver, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
}

void __26__EMThread_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v48 = a2;
  v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
  [v48 setDate:v3];

  v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayDate"];
  [v48 setDisplayDate:v4];

  v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_readLater"];
  [v48 setReadLater:v5];

  v6 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sendLaterDate"];
  [v48 setSendLaterDate:v6];

  v7 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_followUp"];
  [v48 setFollowUp:v7];

  v8 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_category"];
  [v48 setCategory:v8];

  v9 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_businessLogoID"];
  [v48 setBusinessLogoID:v9];

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v10 decodeObjectOfClasses:v13 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];
  [v48 setGroupedSenderMessageListItems:v14];

  v15 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
  [v48 setSubject:v15];

  v16 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_summary"];
  [v48 setSummary:v16];

  v17 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_generatedSummary"];
  [v48 setGeneratedSummary:v17];

  v18 = *(void **)(a1 + 32);
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v23 = [v18 decodeObjectOfClasses:v22 forKey:@"EFPropertyKey_senderList"];
  [v48 setSenderList:v23];

  v24 = *(void **)(a1 + 32);
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v29 = [v24 decodeObjectOfClasses:v28 forKey:@"EFPropertyKey_toList"];
  [v48 setToList:v29];

  v30 = *(void **)(a1 + 32);
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  v35 = [v30 decodeObjectOfClasses:v34 forKey:@"EFPropertyKey_ccList"];
  [v48 setCcList:v35];

  v36 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flags"];
  [v48 setFlags:v36];

  objc_msgSend(v48, "setHasUnflagged:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_hasUnflagged"));
  v37 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flagColors"];
  [v48 setFlagColors:v37];

  objc_msgSend(v48, "setIsVIP:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isVIP"));
  objc_msgSend(v48, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isBlocked"));
  objc_msgSend(v48, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_unsubscribeType"));
  objc_msgSend(v48, "setIsToMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isToMe"));
  objc_msgSend(v48, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isCCMe"));
  objc_msgSend(v48, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_hasAttachments"));
  objc_msgSend(v48, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isAuthenticated"));
  objc_msgSend(v48, "setAllowAuthenticationWarning:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_allowAuthenticationWarning"));
  v38 = *(void **)(a1 + 32);
  v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v40 = [v38 decodeObjectOfClasses:v39 forKey:@"EFPropertyKey_conversationNotificationLevel"];
  objc_msgSend(v48, "setConversationNotificationLevel:", objc_msgSend(v40, "integerValue"));

  v41 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_brandIndicatorLocation"];
  [v48 setBrandIndicatorLocation:v41];

  objc_msgSend(v48, "setCount:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_count"));
  v42 = *(void **)(a1 + 32);
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v46 = [v42 decodeObjectOfClasses:v45 forKey:@"EFPropertyKey_mailboxObjectIDs"];
  [v48 setMailboxObjectIDs:v46];

  v47 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayMessageItemID"];
  [v48 setDisplayMessageItemID:v47];
}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (void)setToList:(id)a3
{
}

- (void)setSummary:(id)a3
{
}

- (void)setSubject:(id)a3
{
}

- (void)setSenderList:(id)a3
{
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (void)setHasUnflagged:(BOOL)a3
{
  self->_hasUnflagged = a3;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (void)setFlags:(id)a3
{
}

- (void)setFlagColors:(id)a3
{
}

- (void)setDisplayMessageItemID:(id)a3
{
}

- (void)setDisplayDate:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (void)setCcList:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (void)setAllowAuthenticationWarning:(BOOL)a3
{
  self->_allowAuthenticationWarning = a3;
}

- (void)setSendLaterDate:(id)a3
{
}

- (void)setReadLater:(id)a3
{
}

- (void)setMailboxObjectIDs:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  if ((EFArraysAreEqual() & 1) == 0)
  {
    v4 = (NSArray *)[v7 copy];
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v4;

    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    self->_isEditable = 0;
  }
  os_unfair_lock_unlock(&self->_mailboxesLock);
}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
}

- (void)setGeneratedSummary:(id)a3
{
}

- (void)setFollowUp:(id)a3
{
}

- (void)setBrandIndicatorLocation:(id)a3
{
}

- (EMMessageRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMThread;
  v4 = [(EMRepositoryObject *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMThread.m" lineNumber:29 description:@"Wrong repository type"];
    }
  }
  return (EMMessageRepository *)v4;
}

- (void)setRepository:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMThread.m" lineNumber:29 description:@"Wrong repository type"];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMThread;
  [(EMRepositoryObject *)&v7 setRepository:v5];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EMThread;
  [(EMQueryingCollection *)&v26 encodeWithCoder:v4];
  id v5 = [(EMThread *)self originatingQuery];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_originatingQuery"];

  v6 = [(EMThread *)self date];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_date"];

  objc_super v7 = [(EMThread *)self displayDate];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_displayDate"];

  v8 = [(EMThread *)self readLater];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_readLater"];

  v9 = [(EMThread *)self sendLaterDate];
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_sendLaterDate"];

  v10 = [(EMThread *)self followUp];
  [v4 encodeObject:v10 forKey:@"EFPropertyKey_followUp"];

  v11 = [(EMThread *)self category];
  [v4 encodeObject:v11 forKey:@"EFPropertyKey_category"];

  uint64_t v12 = [(EMThread *)self businessLogoID];
  [v4 encodeObject:v12 forKey:@"EFPropertyKey_businessLogoID"];

  v13 = [(EMThread *)self groupedSenderMessageListItems];
  [v4 encodeObject:v13 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];

  v14 = [(EMThread *)self subject];
  [v4 encodeObject:v14 forKey:@"EFPropertyKey_subject"];

  v15 = [(EMThread *)self summary];
  [v4 encodeObject:v15 forKey:@"EFPropertyKey_summary"];

  v16 = [(EMThread *)self generatedSummary];
  [v4 encodeObject:v16 forKey:@"EFPropertyKey_generatedSummary"];

  v17 = [(EMThread *)self senderList];
  [v4 encodeObject:v17 forKey:@"EFPropertyKey_senderList"];

  v18 = [(EMThread *)self toList];
  [v4 encodeObject:v18 forKey:@"EFPropertyKey_toList"];

  v19 = [(EMThread *)self ccList];
  [v4 encodeObject:v19 forKey:@"EFPropertyKey_ccList"];

  uint64_t v20 = [(EMThread *)self flags];
  [v4 encodeObject:v20 forKey:@"EFPropertyKey_flags"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread hasUnflagged](self, "hasUnflagged"), @"EFPropertyKey_hasUnflagged");
  uint64_t v21 = [(EMThread *)self flagColors];
  [v4 encodeObject:v21 forKey:@"EFPropertyKey_flagColors"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isVIP](self, "isVIP"), @"EFPropertyKey_isVIP");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isBlocked](self, "isBlocked"), @"EFPropertyKey_isBlocked");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMThread unsubscribeType](self, "unsubscribeType"), @"EFPropertyKey_unsubscribeType");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isToMe](self, "isToMe"), @"EFPropertyKey_isToMe");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isCCMe](self, "isCCMe"), @"EFPropertyKey_isCCMe");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread hasAttachments](self, "hasAttachments"), @"EFPropertyKey_hasAttachments");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread isAuthenticated](self, "isAuthenticated"), @"EFPropertyKey_isAuthenticated");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMThread allowAuthenticationWarning](self, "allowAuthenticationWarning"), @"EFPropertyKey_allowAuthenticationWarning");
  v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[EMThread conversationNotificationLevel](self, "conversationNotificationLevel"));
  [v4 encodeObject:v22 forKey:@"EFPropertyKey_conversationNotificationLevel"];

  v23 = [(EMThread *)self brandIndicatorLocation];
  [v4 encodeObject:v23 forKey:@"EFPropertyKey_brandIndicatorLocation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMThread count](self, "count"), @"EFPropertyKey_count");
  v24 = [(EMThread *)self mailboxObjectIDs];
  [v4 encodeObject:v24 forKey:@"EFPropertyKey_mailboxObjectIDs"];

  v25 = [(EMThread *)self displayMessageItemID];
  [v4 encodeObject:v25 forKey:@"EFPropertyKey_displayMessageItemID"];
}

- (ECSubject)subject
{
  return (ECSubject *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)senderList
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (EMFollowUp)followUp
{
  return (EMFollowUp *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)objc_getProperty(self, a2, 240, 1);
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 296, 1);
}

- (EMQuery)originatingQuery
{
  return self->_originatingQuery;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (NSIndexSet)flagColors
{
  return (NSIndexSet *)objc_getProperty(self, a2, 248, 1);
}

- (EMCollectionItemID)displayMessageItemID
{
  return (EMCollectionItemID *)objc_getProperty(self, a2, 288, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (EMCategory)category
{
  return (EMCategory *)objc_getProperty(self, a2, 320, 1);
}

- (NSArray)toList
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (NSArray)mailboxObjectIDs
{
  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = self->_mailboxObjectIDs;
  os_unfair_lock_unlock(p_mailboxesLock);
  return v4;
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (BOOL)hasUnflagged
{
  return self->_hasUnflagged;
}

- (NSArray)groupedSenderMessageListItems
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (EMGeneratedSummary)generatedSummary
{
  return (EMGeneratedSummary *)objc_getProperty(self, a2, 208, 1);
}

- (NSArray)ccList
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)brandIndicatorLocation
{
  return self->_brandIndicatorLocation;
}

- (BOOL)allowAuthenticationWarning
{
  return self->_allowAuthenticationWarning;
}

- (BOOL)isGroupedSender
{
  return 0;
}

- (EMCollectionItemID)itemID
{
  v2 = [(EMObject *)self objectID];
  v3 = [v2 collectionItemID];

  return (EMCollectionItemID *)v3;
}

- (void)setMailboxTypeResolver:(id)a3
{
  id v4 = (EMMailboxTypeResolver *)a3;
  os_unfair_lock_lock(&self->_mailboxTypeResolverLock);
  mailboxTypeResolver = self->_mailboxTypeResolver;
  self->_mailboxTypeResolver = v4;

  os_unfair_lock_unlock(&self->_mailboxTypeResolverLock);
}

- (EMThread)initWithObjectID:(id)a3 originatingQuery:(id)a4 builder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EMThread.m", 103, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)EMThread;
  uint64_t v12 = [(EMQueryingCollection *)&v16 initWithObjectID:v9 query:0];
  v13 = v12;
  if (v12) {
    [(EMThread *)v12 _commonInitWithOriginatingQuery:v10 builder:v11];
  }

  return v13;
}

- (EMThread)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMThread;
  id v5 = [(EMQueryingCollection *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_originatingQuery"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __26__EMThread_initWithCoder___block_invoke;
    v8[3] = &unk_1E63E67C8;
    id v9 = v4;
    [(EMThread *)v5 _commonInitWithOriginatingQuery:v6 builder:v8];
  }
  return v5;
}

- (void)_commonInitWithOriginatingQuery:(id)a3 builder:(id)a4
{
  objc_storeStrong((id *)&self->_originatingQuery, a3);
  id v6 = a4;
  self->_mailboxScopeLock._os_unfair_lock_opaque = 0;
  self->_mailboxTypeResolverLock._os_unfair_lock_opaque = 0;
  self->_mailboxesLock._os_unfair_lock_opaque = 0;
  id v7 = v6;
  (*((void (**)(id, EMThread *))v6 + 2))(v6, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailboxTypeResolver)mailboxTypeResolver
{
  p_mailboxTypeResolverLock = &self->_mailboxTypeResolverLock;
  os_unfair_lock_lock(&self->_mailboxTypeResolverLock);
  id v4 = self->_mailboxTypeResolver;
  os_unfair_lock_unlock(p_mailboxTypeResolverLock);
  if (!v4)
  {
    id v5 = [(EMThread *)self repository];
    id v4 = [v5 mailboxRepository];
  }
  return v4;
}

- (EMObjectID)displayMessageObjectID
{
  id v4 = [(EMThread *)self displayMessageItemID];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EMThread.m" lineNumber:559 description:@"displayMessageItemID is not an EMMessageCollectionItemID"];
  }
  id v5 = [EMMessageObjectID alloc];
  id v6 = [(EMThread *)self mailboxScope];
  id v7 = [(EMMessageObjectID *)v5 initWithCollectionItemID:v4 mailboxScope:v6];

  return (EMObjectID *)v7;
}

- (EMMailboxScope)mailboxScope
{
  v3 = [(EMThread *)self mailboxTypeResolver];
  p_mailboxScopeLock = &self->_mailboxScopeLock;
  os_unfair_lock_lock(&self->_mailboxScopeLock);
  mailboxScope = self->_mailboxScope;
  if (mailboxScope) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    id v7 = [(EMThread *)self originatingQuery];
    v8 = [v7 predicate];
    id v9 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v8 withMailboxTypeResolver:v3];
    objc_super v10 = self->_mailboxScope;
    self->_mailboxScope = v9;

    mailboxScope = self->_mailboxScope;
  }
  id v11 = mailboxScope;
  os_unfair_lock_unlock(p_mailboxScopeLock);
  if (v11)
  {
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = +[EMMailboxScope noMailboxesScope];
  }
  v13 = v12;

  return v13;
}

- (void)setMailboxes:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = (NSArray *)[v8 copy];
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  BOOL v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;

  self->_isEditable = 0;
  os_unfair_lock_unlock(&self->_mailboxesLock);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __15__EMThread_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_40 != -1) {
    dispatch_once(&log_onceToken_40, block);
  }
  v2 = (void *)log_log_40;
  return (OS_os_log *)v2;
}

void __15__EMThread_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_40;
  log_log_40 = (uint64_t)v1;
}

- (id)changeFrom:(id)a3
{
  id v3 = +[EMMessageListItemChange changeFrom:a3 to:self];
  return v3;
}

- (NSString)debugDescription
{
  v18 = NSString;
  v33.receiver = self;
  v33.super_class = (Class)EMThread;
  uint64_t v32 = [(EMObject *)&v33 debugDescription];
  [(EMThread *)self conversationID];
  v31 = EFStringWithInt64();
  uint64_t v27 = [(EMThread *)self subject];
  v30 = [v27 debugDescription];
  objc_super v26 = [(EMThread *)self senderList];
  v29 = [v26 debugDescription];
  v25 = [(EMThread *)self toList];
  v28 = [v25 debugDescription];
  v23 = [(EMThread *)self ccList];
  v24 = [v23 debugDescription];
  v22 = [(EMThread *)self summary];
  uint64_t v20 = [(EMThread *)self generatedSummary];
  uint64_t v21 = [v20 debugDescription];
  v17 = [(EMThread *)self flags];
  int64_t v3 = [(EMThread *)self conversationNotificationLevel];
  objc_super v16 = [(EMThread *)self category];
  int64_t v13 = v3;
  v15 = [(EMThread *)self businessLogoID];
  if ([(EMThread *)self isVIP]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v11 = v4;
  if ([(EMThread *)self isBlocked]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  objc_super v10 = v5;
  int64_t v9 = [(EMThread *)self unsubscribeType];
  v14 = [(EMThread *)self date];
  uint64_t v12 = [(EMThread *)self displayDate];
  BOOL v6 = [(EMThread *)self mailboxObjectIDs];
  id v7 = [v6 debugDescription];
  objc_msgSend(v18, "stringWithFormat:", @"%@\n\tConversationID:%@\n\tSubject:%@\n\tSenderList:%@\n\tToList:%@\n\tCCList:%@\n\tSummary:%@\n\tGenerated Summary:%@\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tCategory:%@\n\tBusinessLogoID:%@\n\tIsVIP:%@\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tDisplayDate:%@\n\tMailboxes:%@\n\tCount:%lu", v32, v31, v30, v29, v28, v24, v22, v21, v17, v13, v16, v15, v11, v10, v9, v14,
    v12,
    v7,
  v19 = [(EMThread *)self count]);

  return (NSString *)v19;
}

- (NSString)ef_publicDescription
{
  v41 = [(EMThread *)self mailboxesIfAvailable];
  uint64_t v3 = [v41 count];
  id v4 = [v41 firstObject];
  id v5 = [v4 accountIfAvailable];

  if (v3)
  {
    [(EMThread *)self supportsArchiving];
    NSStringFromBOOL();
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      [(EMThread *)self shouldArchiveByDefault];
      NSStringFromBOOL();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v46 = @"?";
    if (v5) {
      goto LABEL_3;
    }
  }
  v45 = @"?";
LABEL_6:
  BOOL v6 = [MEMORY[0x1E4F60D58] currentDevice];
  int v7 = [v6 isInternal];

  if (v7)
  {
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:2];
    id v8 = NSString;
    v49.receiver = self;
    v49.super_class = (Class)EMThread;
    v42 = [(EMObject *)&v49 ef_publicDescription];
    [(EMThread *)self conversationID];
    uint64_t v44 = EFStringWithInt64();
    v43 = [(EMThread *)self subject];
    v39 = [(EMThread *)self senderList];
    v40 = [v47 stringFromEmailAddressList:v39];
    v38 = [(EMThread *)self toList];
    v37 = [v47 stringFromEmailAddressList:v38];
    v36 = [(EMThread *)self ccList];
    v35 = [v47 stringFromEmailAddressList:v36];
    int64_t v9 = (void *)MEMORY[0x1E4F60E00];
    v34 = [(EMThread *)self summary];
    objc_super v33 = objc_msgSend(v9, "ec_partiallyRedactedStringForSubjectOrSummary:", v34);
    uint64_t v32 = [(EMThread *)self generatedSummary];
    v31 = objc_msgSend(v32, "ef_publicDescription");
    v30 = [(EMThread *)self flags];
    int64_t v10 = [(EMThread *)self conversationNotificationLevel];
    v28 = [(EMThread *)self category];
    id v11 = EMShortStringForCategory(v28);
    v29 = [(EMThread *)self businessLogoID];
    if ([(EMThread *)self isVIP]) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    if ([(EMThread *)self isBlocked]) {
      int64_t v13 = @"YES";
    }
    else {
      int64_t v13 = @"NO";
    }
    int64_t v14 = [(EMThread *)self unsubscribeType];
    uint64_t v27 = [(EMThread *)self date];
    v15 = [(EMThread *)self displayDate];
    objc_super v26 = [(EMThread *)self mailboxObjectIDs];
    unint64_t v16 = [(EMThread *)self count];
    v17 = [(EMThread *)self displayMessageItemID];
    objc_msgSend(v8, "stringWithFormat:", @"%@\n\tConversationID:%@\n\tSubject:%@\n\tSenderList:%@\n\tToList:%@\n\tCCList:%@\n\tSummary:%@\n\tGenerated Summary:%@\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tCategory:%@\n\tBusinessLogoID:%@\n\tIsVIP:%@\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tDisplayDate:%@\n\tMailboxes:%@\n\tCount:%lu\n\tSupportsArchiving:%@ \n\tShouldArchive:%@\n\tdisplayMessageItemID:%@", v42, v44, v43, v40, v37, v35, v33, v31, v30, v10, v11, v29, v12, v13, v14, v27,
      v15,
      v26,
      v16,
      v46,
      v45,
    uint64_t v25 = v17);

    v18 = (void *)v25;
  }
  else
  {
    v19 = NSString;
    v48.receiver = self;
    v48.super_class = (Class)EMThread;
    v47 = [(EMObject *)&v48 ef_publicDescription];
    int64_t v20 = [(EMThread *)self conversationID];
    v42 = [(EMThread *)self flags];
    uint64_t v44 = objc_msgSend(v42, "ef_publicDescription");
    int64_t v21 = [(EMThread *)self conversationNotificationLevel];
    if ([(EMThread *)self isBlocked]) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    int64_t v23 = [(EMThread *)self unsubscribeType];
    v43 = [(EMThread *)self date];
    v18 = [v19 stringWithFormat:@"%@\n\tConversationID:%lld\n\tFlags:%@\n\tConversationNotificationLevel:%ld\n\tIsBlocked:%@\n\tUnsubscribeType:%ld\n\tDate:%@\n\tCount:%lu\n\tSupportsArchiving:%@ \n\tShouldArchive:%@", v47, v20, v44, v21, v22, v23, v43, -[EMThread count](self, "count"), v46, v45];
  }

  return (NSString *)v18;
}

- (id)query
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[EMMessageListItemPredicates predicateForMessagesInConversation:[(EMThread *)self conversationID]];
  id v4 = objc_alloc(MEMORY[0x1E4F28BA0]);
  id v5 = [(EMQuery *)self->_originatingQuery predicate];
  v13[0] = v5;
  v13[1] = v3;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  int v7 = (void *)[v4 initWithType:1 subpredicates:v6];

  id v8 = +[EMThread log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int64_t v9 = [(EMObject *)self objectID];
    [(EMThread *)v9 query];
  }

  int64_t v10 = [(EMQuery *)self->_originatingQuery queryWithTargetClass:objc_opt_class() predicate:v7];

  return v10;
}

- (id)objectIDForItemID:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [EMMessageObjectID alloc];
    BOOL v6 = [(EMThread *)self mailboxScope];
    int v7 = [(EMMessageObjectID *)v5 initWithCollectionItemID:v4 mailboxScope:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)itemIDForObjectID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v5 collectionItemID];
      goto LABEL_6;
    }
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMThread.m" lineNumber:470 description:@"Object ID of unrecognized type"];
  }
  BOOL v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)objectIDBelongsToCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(EMThread *)self mailboxScope];
    int v7 = [v5 mailboxScope];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)conversationID
{
  v2 = [(EMObject *)self objectID];
  int64_t v3 = [v2 conversationID];

  return v3;
}

- (void)setConversationID:(int64_t)a3
{
}

- (NSArray)mailboxes
{
  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    id v5 = [(EMThread *)self repository];
    BOOL v6 = [v5 mailboxRepository];

    if (v6)
    {
      int v7 = (void *)MEMORY[0x1E4F60D70];
      char v8 = [(EMThread *)self repository];
      int64_t v9 = [v8 mailboxRepository];
      int64_t v10 = [(EMThread *)self mailboxObjectIDs];
      id v11 = [v9 mailboxesForObjectIDs:v10];
      uint64_t v12 = [v7 combine:v11];
      int64_t v13 = [v12 result:0];
      objc_msgSend(v13, "ef_filter:", *MEMORY[0x1E4F60CE8]);
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v14 = +[EMThread log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[EMBaseMessageListItem mailboxes](v14);
      }

      id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v4;
}

- (NSArray)mailboxesIfAvailable
{
  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    id v5 = [(EMThread *)self repository];
    BOOL v6 = [v5 mailboxRepository];

    if (v6)
    {
      int v7 = [(EMThread *)self mailboxObjectIDs];
      id v4 = [v6 mailboxesIfAvailableForObjectIDs:v7];
    }
    else
    {
      char v8 = +[EMThread log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[EMBaseMessageListItem mailboxesIfAvailable](v8);
      }

      id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v4;
}

- (EFFuture)displayMessage
{
  int64_t v3 = [(EMThread *)self displayMessageObjectID];
  id v4 = [(EMThread *)self repository];
  id v5 = [v4 messageForObjectID:v3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __26__EMThread_displayMessage__block_invoke;
  void v13[3] = &unk_1E63E3560;
  v13[4] = self;
  id v6 = v3;
  id v14 = v6;
  int v7 = [v5 recover:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26__EMThread_displayMessage__block_invoke_179;
  v11[3] = &unk_1E63E3588;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  int64_t v9 = [v7 then:v11];

  return (EFFuture *)v9;
}

id __26__EMThread_displayMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) displayMessageObjectID];
  if (!objc_msgSend(v3, "em_isItemNotFoundError") || *(void **)(a1 + 40) == v4)
  {
    int64_t v10 = +[EMThread log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int64_t v13 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      id v14 = [*(id *)(a1 + 32) displayMessageObjectID];
      v15 = [*(id *)(a1 + 32) displayMessageItemID];
      unint64_t v16 = objc_msgSend(v3, "ef_publicDescription");
      int v17 = 138544130;
      v18 = v13;
      __int16 v19 = 2114;
      int64_t v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_error_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v9 = [MEMORY[0x1E4F60D70] futureWithError:v3];
  }
  else
  {
    id v5 = +[EMThread log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int v7 = *(void **)(a1 + 40);
      id v8 = objc_msgSend(v3, "ef_publicDescription");
      int v17 = 138544130;
      v18 = v6;
      __int16 v19 = 2114;
      int64_t v20 = v7;
      __int16 v21 = 2114;
      v22 = v4;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@\nre-trying request for displayMessage: objectID: %{public}@, updatedObjectID: %{public}@, error: %{public}@", (uint8_t *)&v17, 0x2Au);
    }
    uint64_t v9 = [*(id *)(a1 + 32) displayMessage];
  }
  id v11 = (void *)v9;

  return v11;
}

id __26__EMThread_displayMessage__block_invoke_179(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v7 = [MEMORY[0x1E4F60D70] futureWithResult:v3];
  }
  else
  {
    id v4 = +[EMThread log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int64_t v10 = [*(id *)(a1 + 32) displayMessageObjectID];
      id v11 = [*(id *)(a1 + 32) displayMessageItemID];
      int v12 = 138543874;
      int64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      int v17 = v11;
      _os_log_error_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_ERROR, "%{public}@\ndisplayMessageObjectID: %{public}@, displayMessageItemID: %{public}@, message isNull", (uint8_t *)&v12, 0x20u);
    }
    id v5 = (void *)MEMORY[0x1E4F60D70];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", *(void *)(a1 + 40));
    int v7 = [v5 futureWithError:v6];
  }
  return v7;
}

- (BOOL)deleteMovesToTrash
{
  v2 = [(EMThread *)self mailboxes];
  BOOL v3 = +[EMMailbox deleteMovesToTrashForMailboxes:v2];

  return v3;
}

- (BOOL)supportsArchiving
{
  v2 = [(EMThread *)self mailboxes];
  BOOL v3 = +[EMMailbox supportsArchivingForMailboxes:v2];

  return v3;
}

- (BOOL)shouldArchiveByDefault
{
  if (![(EMThread *)self supportsArchiving]) {
    return 0;
  }
  BOOL v3 = [(EMThread *)self mailboxes];
  BOOL v4 = +[EMMailbox shouldArchiveByDefaultForMailboxes:v3];

  return v4;
}

- (BOOL)isEditable
{
  unint64_t isEditable = self->_isEditable;
  if (!isEditable)
  {
    BOOL v4 = [(EMThread *)self mailboxes];
    int v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_54);

    unint64_t isEditable = 1;
    if (v5) {
      unint64_t isEditable = 2;
    }
    self->_unint64_t isEditable = isEditable;
  }
  return isEditable == 2;
}

BOOL __22__EMThread_isEditable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 5 || objc_msgSend(v2, "type") == 6;

  return v3;
}

- (void)notifyChangeObserversAboutChangedItemIDs:(id)a3 extraInfo:(id)a4
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

- (NSString)businessLogoID
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBusinessLogoID:(id)a3
{
}

- (void)query
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_DEBUG, "Predicate for Thread ObjectID %@: %@", buf, 0x16u);
}

@end