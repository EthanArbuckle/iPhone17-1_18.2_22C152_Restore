@interface EMBaseMessageListItem
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
- (BOOL)allowAuthenticationWarning;
- (BOOL)arePropertiesEqual:(id)a3;
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
- (BOOL)shouldArchiveByDefault;
- (BOOL)supportsArchiving;
- (ECEmailAddressConvertible)senderAddress;
- (ECMessageFlags)flags;
- (ECSubject)subject;
- (EFFuture)displayMessage;
- (EMBaseMessageListItem)initWithCoder:(id)a3;
- (EMBaseMessageListItem)initWithObjectID:(id)a3;
- (EMBaseMessageListItem)initWithObjectID:(id)a3 baseBuilder:(id)a4;
- (EMCategory)category;
- (EMCollectionItemID)itemID;
- (EMFollowUp)followUp;
- (EMGeneratedSummary)generatedSummary;
- (EMMessageRepository)repository;
- (EMReadLater)readLater;
- (NSArray)bccList;
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
- (id)flagDescription;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)businessID;
- (int64_t)conversationID;
- (int64_t)conversationNotificationLevel;
- (int64_t)unsubscribeType;
- (unint64_t)count;
- (void)_commonInitWithBaseBuilder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mailboxes;
- (void)mailboxesIfAvailable;
- (void)setAllowAuthenticationWarning:(BOOL)a3;
- (void)setBccList:(id)a3;
- (void)setBrandIndicatorLocation:(id)a3;
- (void)setBusinessID:(int64_t)a3;
- (void)setBusinessLogoID:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCcList:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setConversationNotificationLevel:(int64_t)a3;
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
- (void)setMailboxes:(id)a3;
- (void)setReadLater:(id)a3;
- (void)setRepository:(id)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSenderList:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSummary:(id)a3;
- (void)setToList:(id)a3;
- (void)setUnsubscribeType:(int64_t)a3;
@end

@implementation EMBaseMessageListItem

- (EMMessageRepository)repository
{
  v7.receiver = self;
  v7.super_class = (Class)EMBaseMessageListItem;
  v4 = [(EMRepositoryObject *)&v7 repository];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"EMBaseMessageListItem.m" lineNumber:34 description:@"Wrong repository type"];
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
      [v6 handleFailureInMethod:a2 object:self file:@"EMBaseMessageListItem.m" lineNumber:34 description:@"Wrong repository type"];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)EMBaseMessageListItem;
  [(EMRepositoryObject *)&v7 setRepository:v5];
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EMBaseMessageListItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

void __28__EMBaseMessageListItem_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

- (EMBaseMessageListItem)initWithObjectID:(id)a3
{
  id v5 = a3;
  [(EMBaseMessageListItem *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMBaseMessageListItem initWithObjectID:]", "EMBaseMessageListItem.m", 101, "0");
}

- (EMBaseMessageListItem)initWithObjectID:(id)a3 baseBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"EMBaseMessageListItem.m", 105, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)EMBaseMessageListItem;
  v9 = [(EMObject *)&v15 initWithObjectID:v7];
  v10 = v9;
  if (v9)
  {
    v13 = v9;
    id v14 = v8;
    ECAllowNetworkActivityButLog();
  }
  return v10;
}

uint64_t __54__EMBaseMessageListItem_initWithObjectID_baseBuilder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commonInitWithBaseBuilder:*(void *)(a1 + 40)];
}

- (void)_commonInitWithBaseBuilder:(id)a3
{
  id v4 = a3;
  self->_mailboxesLock._os_unfair_lock_opaque = 0;
  id v7 = v4;
  (*((void (**)(id, EMBaseMessageListItem *))v4 + 2))(v4, self);
  id v5 = [(EMBaseMessageListItem *)self displayDate];

  if (!v5)
  {
    v6 = [(EMBaseMessageListItem *)self date];
    [(EMBaseMessageListItem *)self setDisplayDate:v6];
  }
}

- (id)changeFrom:(id)a3
{
  id v3 = +[EMMessageListItemChange changeFrom:a3 to:self];
  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"readLaterDate"])
  {
    id v5 = [(EMBaseMessageListItem *)self readLater];
    v6 = [v5 date];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EMBaseMessageListItem;
    v6 = [(EMBaseMessageListItem *)&v8 valueForUndefinedKey:v4];
  }

  return v6;
}

- (BOOL)arePropertiesEqual:(id)a3
{
  id v4 = (EMBaseMessageListItem *)a3;
  if (v4 == self)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(EMObject *)self objectID];
      v6 = [(EMObject *)v4 objectID];
      if (EFObjectsAreEqual())
      {
        id v7 = [(EMBaseMessageListItem *)self subject];
        objc_super v8 = [(EMBaseMessageListItem *)v4 subject];
        if (EFObjectsAreEqual())
        {
          v9 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
          v10 = [(EMBaseMessageListItem *)v4 mailboxObjectIDs];
          if (EFObjectsAreEqual())
          {
            v53 = [(EMBaseMessageListItem *)self senderAddress];
            v11 = [(EMBaseMessageListItem *)v4 senderAddress];
            if (EFObjectsAreEqual())
            {
              v52 = [(EMBaseMessageListItem *)self flags];
              v51 = [(EMBaseMessageListItem *)v4 flags];
              if (!EFObjectsAreEqual()) {
                goto LABEL_34;
              }
              BOOL v12 = [(EMBaseMessageListItem *)self isVIP];
              if (v12 != [(EMBaseMessageListItem *)v4 isVIP]) {
                goto LABEL_34;
              }
              BOOL v13 = [(EMBaseMessageListItem *)self isBlocked];
              if (v13 != [(EMBaseMessageListItem *)v4 isBlocked]) {
                goto LABEL_34;
              }
              int64_t v14 = [(EMBaseMessageListItem *)self unsubscribeType];
              if (v14 == [(EMBaseMessageListItem *)v4 unsubscribeType]
                && (BOOL v15 = [(EMBaseMessageListItem *)self isToMe],
                    v15 == [(EMBaseMessageListItem *)v4 isToMe])
                && (BOOL v16 = [(EMBaseMessageListItem *)self isCCMe],
                    v16 == [(EMBaseMessageListItem *)v4 isCCMe])
                && (BOOL v17 = [(EMBaseMessageListItem *)self hasAttachments],
                    v17 == [(EMBaseMessageListItem *)v4 hasAttachments])
                && (BOOL v18 = [(EMBaseMessageListItem *)self isAuthenticated],
                    v18 == [(EMBaseMessageListItem *)v4 isAuthenticated])
                && (BOOL v19 = [(EMBaseMessageListItem *)self allowAuthenticationWarning],
                    v19 == [(EMBaseMessageListItem *)v4 allowAuthenticationWarning])
                && (int64_t v20 = [(EMBaseMessageListItem *)self conversationNotificationLevel],
                    v20 == [(EMBaseMessageListItem *)v4 conversationNotificationLevel]))
              {
                v50 = [(EMBaseMessageListItem *)self brandIndicatorLocation];
                v49 = [(EMBaseMessageListItem *)v4 brandIndicatorLocation];
                if (EFObjectsAreEqual())
                {
                  v48 = [(EMBaseMessageListItem *)self date];
                  v47 = [(EMBaseMessageListItem *)v4 date];
                  if (EFObjectsAreEqual())
                  {
                    v46 = [(EMBaseMessageListItem *)self displayDate];
                    v45 = [(EMBaseMessageListItem *)v4 displayDate];
                    if (EFObjectsAreEqual())
                    {
                      v44 = [(EMBaseMessageListItem *)self readLater];
                      v43 = [(EMBaseMessageListItem *)v4 readLater];
                      if (EFObjectsAreEqual())
                      {
                        v42 = [(EMBaseMessageListItem *)self sendLaterDate];
                        v41 = [(EMBaseMessageListItem *)v4 sendLaterDate];
                        if (EFObjectsAreEqual())
                        {
                          v40 = [(EMBaseMessageListItem *)self followUp];
                          v39 = [(EMBaseMessageListItem *)v4 followUp];
                          if (EFObjectsAreEqual())
                          {
                            v38 = [(EMBaseMessageListItem *)self category];
                            v37 = [(EMBaseMessageListItem *)v4 category];
                            if (EFObjectsAreEqual())
                            {
                              v36 = [(EMBaseMessageListItem *)self groupedSenderMessageListItems];
                              v35 = [(EMBaseMessageListItem *)v4 groupedSenderMessageListItems];
                              if (EFArraysAreEqual()
                                && (int64_t v21 = [(EMBaseMessageListItem *)self businessID],
                                    v21 == [(EMBaseMessageListItem *)v4 businessID]))
                              {
                                v34 = [(EMBaseMessageListItem *)self businessLogoID];
                                v33 = [(EMBaseMessageListItem *)v4 businessLogoID];
                                if (v34 == v33)
                                {
                                  v32 = [(EMBaseMessageListItem *)self summary];
                                  v31 = [(EMBaseMessageListItem *)v4 summary];
                                  if (EFObjectsAreEqual()
                                    && (int64_t v24 = [(EMBaseMessageListItem *)self conversationID],
                                        v24 == [(EMBaseMessageListItem *)v4 conversationID]))
                                  {
                                    v25 = [(EMBaseMessageListItem *)self toList];
                                    v30 = [(EMBaseMessageListItem *)v4 toList];
                                    if (EFArraysAreEqual())
                                    {
                                      v29 = [(EMBaseMessageListItem *)self ccList];
                                      v28 = [(EMBaseMessageListItem *)v4 ccList];
                                      if (EFArraysAreEqual())
                                      {
                                        v27 = [(EMBaseMessageListItem *)self bccList];
                                        v26 = [(EMBaseMessageListItem *)v4 bccList];
                                        char v22 = EFArraysAreEqual();
                                      }
                                      else
                                      {
                                        char v22 = 0;
                                      }
                                    }
                                    else
                                    {
                                      char v22 = 0;
                                    }
                                  }
                                  else
                                  {
                                    char v22 = 0;
                                  }
                                }
                                else
                                {
                                  char v22 = 0;
                                }
                              }
                              else
                              {
                                char v22 = 0;
                              }
                            }
                            else
                            {
                              char v22 = 0;
                            }
                          }
                          else
                          {
                            char v22 = 0;
                          }
                        }
                        else
                        {
                          char v22 = 0;
                        }
                      }
                      else
                      {
                        char v22 = 0;
                      }
                    }
                    else
                    {
                      char v22 = 0;
                    }
                  }
                  else
                  {
                    char v22 = 0;
                  }
                }
                else
                {
                  char v22 = 0;
                }
              }
              else
              {
LABEL_34:
                char v22 = 0;
              }
            }
            else
            {
              char v22 = 0;
            }
          }
          else
          {
            char v22 = 0;
          }
        }
        else
        {
          char v22 = 0;
        }
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

- (NSString)debugDescription
{
  char v22 = NSString;
  v37.receiver = self;
  v37.super_class = (Class)EMBaseMessageListItem;
  v36 = [(EMObject *)&v37 debugDescription];
  v33 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
  v35 = [v33 debugDescription];
  v32 = [(EMBaseMessageListItem *)self senderAddress];
  v34 = [v32 debugDescription];
  v31 = [(EMBaseMessageListItem *)self subject];
  v30 = [v31 debugDescription];
  v29 = [(EMBaseMessageListItem *)self category];
  id v3 = [v29 debugDescription];
  int64_t v19 = [(EMBaseMessageListItem *)self businessID];
  v28 = [(EMBaseMessageListItem *)self businessLogoID];
  if ([(EMBaseMessageListItem *)self isAuthenticated]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  BOOL v18 = v4;
  v27 = [(EMBaseMessageListItem *)self toList];
  v26 = [v27 debugDescription];
  v25 = [(EMBaseMessageListItem *)self ccList];
  int64_t v24 = [v25 debugDescription];
  int64_t v21 = [(EMBaseMessageListItem *)self bccList];
  int64_t v20 = [v21 debugDescription];
  id v5 = [(EMBaseMessageListItem *)self flags];
  int64_t v17 = [(EMBaseMessageListItem *)self conversationNotificationLevel];
  if ([(EMBaseMessageListItem *)self isVIP]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(EMBaseMessageListItem *)self isBlocked]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  BOOL v15 = v7;
  int64_t v8 = [(EMBaseMessageListItem *)self unsubscribeType];
  [(EMBaseMessageListItem *)self conversationID];
  v9 = EFStringWithInt64();
  v10 = [(EMBaseMessageListItem *)self date];
  BOOL v16 = [(EMBaseMessageListItem *)self displayDate];
  int64_t v14 = [(EMBaseMessageListItem *)self summary];
  v11 = [(EMBaseMessageListItem *)self generatedSummary];
  BOOL v12 = [v11 debugDescription];
  objc_msgSend(v22, "stringWithFormat:", @"%@\n\tMailboxes:%@\n\tSenderAddress:%@\n\tSubject:%@ \n\tCategory:%@\n\tBusinessID:%llu\n\tBusinessLogoID:%@\n\tisAuthenticated:%@\n\tToList:%@ \n\tCCList:%@ \n\tBCCList:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsVIP:%@ \n\tIsBlocked:%@ \n\tUnsubscribeType:%ld \n\tConversationID:%@ \n\tDate:%@ \n\tDisplayDate:%@ \n\tSummary:%@\tGenerated Summary:%@", v36, v35, v34, v30, v3, v19, v28, v18, v26, v24, v20, v5, v17, v6, v15, v8,
    v9,
    v10,
    v16,
    v14,
  v23 = v12);

  return (NSString *)v23;
}

- (NSString)ef_publicDescription
{
  v56 = [(EMBaseMessageListItem *)self mailboxesIfAvailable];
  uint64_t v3 = [v56 count];
  id v4 = [v56 firstObject];
  id v5 = [v4 accountIfAvailable];

  if (v3)
  {
    [(EMBaseMessageListItem *)self supportsArchiving];
    NSStringFromBOOL();
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      [(EMBaseMessageListItem *)self shouldArchiveByDefault];
      NSStringFromBOOL();
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v60 = @"?";
    if (v5) {
      goto LABEL_3;
    }
  }
  v59 = @"?";
LABEL_6:
  v6 = [MEMORY[0x1E4F60D58] currentDevice];
  int v7 = [v6 isInternal];

  if (v7)
  {
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:2];
    v44 = NSString;
    v63.receiver = self;
    v63.super_class = (Class)EMBaseMessageListItem;
    uint64_t v55 = [(EMObject *)&v63 ef_publicDescription];
    uint64_t v54 = [(EMObject *)self objectID];
    v57 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
    v58 = [(EMBaseMessageListItem *)self senderAddress];
    uint64_t v53 = [v58 emailAddressValue];
    v51 = [(EMBaseMessageListItem *)self subject];
    v50 = [(EMBaseMessageListItem *)self category];
    v49 = EMShortStringForCategory(v50);
    int64_t v43 = [(EMBaseMessageListItem *)self businessID];
    int64_t v8 = [(EMBaseMessageListItem *)self businessLogoID];
    if ([(EMBaseMessageListItem *)self isAuthenticated]) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    v48 = [(EMBaseMessageListItem *)self toList];
    v52 = [v61 stringFromEmailAddressList:v48];
    v47 = [(EMBaseMessageListItem *)self ccList];
    uint64_t v10 = [v61 stringFromEmailAddressList:v47];
    v46 = [(EMBaseMessageListItem *)self bccList];
    v11 = [v61 stringFromEmailAddressList:v46];
    v45 = [(EMBaseMessageListItem *)self flags];
    int64_t v39 = [(EMBaseMessageListItem *)self conversationNotificationLevel];
    if ([(EMBaseMessageListItem *)self isVIP]) {
      BOOL v12 = @"YES";
    }
    else {
      BOOL v12 = @"NO";
    }
    objc_super v37 = v12;
    if ([(EMBaseMessageListItem *)self isBlocked]) {
      BOOL v13 = @"YES";
    }
    else {
      BOOL v13 = @"NO";
    }
    int64_t v35 = [(EMBaseMessageListItem *)self unsubscribeType];
    [(EMBaseMessageListItem *)self conversationID];
    v42 = EFStringWithInt64();
    v41 = [(EMBaseMessageListItem *)self date];
    v40 = [(EMBaseMessageListItem *)self displayDate];
    v38 = [(EMBaseMessageListItem *)self readLater];
    v36 = objc_msgSend(v38, "ef_publicDescription");
    v34 = [(EMBaseMessageListItem *)self followUp];
    int64_t v14 = objc_msgSend(v34, "ef_publicDescription");
    BOOL v15 = (void *)MEMORY[0x1E4F60E00];
    v33 = [(EMBaseMessageListItem *)self summary];
    BOOL v16 = objc_msgSend(v15, "ec_partiallyRedactedStringForSubjectOrSummary:", v33);
    v32 = [(EMBaseMessageListItem *)self generatedSummary];
    int64_t v17 = objc_msgSend(v32, "ef_publicDescription");
    v31 = (void *)v10;
    objc_msgSend(v44, "stringWithFormat:", @"%@\n\tObjectID:%@\n\tMailboxes:%@\n\tSenderAddress:%@\n\tSubject:%@ \n\tCategory:%@\n\tBusinessID:%llu\n\tBusinessLogoID:%@\n\tisAuthenticated:%@\n\tToList:%@ \n\tCCList:%@ \n\tBCCList:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsVIP:%@ \n\tIsBlocked:%@ \n\tUnsubscribeType:%ld \n\tConversationID:%@ \n\tDate:%@ \n\tDisplayDate:%@ \n\tRemind Me:%@ \n\tFollow Up:%@ \n\tSummary:%@ \n\tGenerated Summary:%@ \n\tSupportsArchiving:%@ \n\tShouldArchive:%@", v55, v54, v57, v53, v51, v49, v43, v8, v9, v52, v10, v11, v45, v39, v37, v13,
      v35,
      v42,
      v41,
      v40,
      v36,
      v14,
      v16,
      v17,
      v60,
    BOOL v18 = v59);

    int64_t v20 = (void *)v54;
    int64_t v19 = (void *)v55;
    int64_t v21 = (void *)v53;
  }
  else
  {
    v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60F40]), "initWithHash:", -[EMBaseMessageListItem conversationID](self, "conversationID"));
    char v22 = NSString;
    v62.receiver = self;
    v62.super_class = (Class)EMBaseMessageListItem;
    uint64_t v23 = [(EMObject *)&v62 ef_publicDescription];
    uint64_t v24 = objc_msgSend(v61, "ef_publicDescription");
    v57 = [(EMBaseMessageListItem *)self flags];
    v58 = objc_msgSend(v57, "ef_publicDescription");
    int64_t v25 = [(EMBaseMessageListItem *)self conversationNotificationLevel];
    if ([(EMBaseMessageListItem *)self isBlocked]) {
      v26 = @"YES";
    }
    else {
      v26 = @"NO";
    }
    int64_t v27 = [(EMBaseMessageListItem *)self unsubscribeType];
    int64_t v21 = [(EMBaseMessageListItem *)self date];
    int64_t v30 = v27;
    int64_t v29 = v25;
    int64_t v20 = (void *)v24;
    int64_t v19 = (void *)v23;
    BOOL v18 = [v22 stringWithFormat:@"%@ \n\tConversationID:%@ \n\tFlags:%@ \n\tConversationNotificationLevel:%ld \n\tIsBlocked:%@ \n\tunsubscribeType:%ld \n\tDate:%@ \n\tSupports Archiving:%@ \n\tShould Archive By Default:%@", v23, v24, v58, v29, v26, v30, v21, v60, v59];
  }

  return (NSString *)v18;
}

- (id)flagDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(EMObject *)self objectID];
  [(EMBaseMessageListItem *)self conversationID];
  int v7 = EFStringWithInt64();
  int64_t v8 = [(EMBaseMessageListItem *)self flags];
  v9 = [v3 stringWithFormat:@"<%@: %p> ObjectID:%@, ConversationID:%@, Flags:%@", v5, self, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMBaseMessageListItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMBaseMessageListItem;
  id v5 = [(EMObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__EMBaseMessageListItem_initWithCoder___block_invoke;
    v7[3] = &unk_1E63E28B8;
    id v8 = v4;
    [(EMBaseMessageListItem *)v5 _commonInitWithBaseBuilder:v7];
  }
  return v5;
}

void __39__EMBaseMessageListItem_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v51 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
  [v51 setSubject:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  int v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"EFPropertyKey_mailboxObjectIDs"];
  [v51 setMailboxObjectIDs:v8];

  objc_super v9 = *(void **)(a1 + 32);
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  BOOL v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  BOOL v13 = [v9 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_senderAddress"];
  [v51 setSenderAddress:v13];

  int64_t v14 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flags"];
  [v51 setFlags:v14];

  objc_msgSend(v51, "setIsVIP:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isVIP"));
  objc_msgSend(v51, "setIsBlocked:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isBlocked"));
  objc_msgSend(v51, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", @"EFPropertyKey_unsubscribeType"));
  objc_msgSend(v51, "setIsToMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isToMe"));
  objc_msgSend(v51, "setIsCCMe:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isCCMe"));
  objc_msgSend(v51, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_hasAttachments"));
  objc_msgSend(v51, "setIsAuthenticated:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isAuthenticated"));
  objc_msgSend(v51, "setAllowAuthenticationWarning:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_allowAuthenticationWarning"));
  BOOL v15 = *(void **)(a1 + 32);
  BOOL v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  int64_t v17 = [v15 decodeObjectOfClasses:v16 forKey:@"EFPropertyKey_conversationNotificationLevel"];
  objc_msgSend(v51, "setConversationNotificationLevel:", objc_msgSend(v17, "integerValue"));

  BOOL v18 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_brandIndicatorLocation"];
  [v51 setBrandIndicatorLocation:v18];

  int64_t v19 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
  [v51 setDate:v19];

  int64_t v20 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayDate"];
  [v51 setDisplayDate:v20];

  int64_t v21 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_readLater"];
  [v51 setReadLater:v21];

  char v22 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sendLaterDate"];
  [v51 setSendLaterDate:v22];

  uint64_t v23 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_followUp"];
  [v51 setFollowUp:v23];

  uint64_t v24 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_category"];
  [v51 setCategory:v24];

  int64_t v25 = *(void **)(a1 + 32);
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  int64_t v29 = [v25 decodeObjectOfClasses:v28 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];
  [v51 setGroupedSenderMessageListItems:v29];

  objc_msgSend(v51, "setBusinessID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"EFPropertyKey_businessID"));
  int64_t v30 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_businessLogoID"];
  [v51 setBusinessLogoID:v30];

  v31 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_summary"];
  [v51 setSummary:v31];

  v32 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_generatedSummary"];
  [v51 setGeneratedSummary:v32];

  objc_msgSend(v51, "setConversationID:", objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", @"EFPropertyKey_conversationID"));
  v33 = *(void **)(a1 + 32);
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  objc_super v37 = objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
  v38 = [v33 decodeObjectOfClasses:v37 forKey:@"EFPropertyKey_toList"];
  [v51 setToList:v38];

  int64_t v39 = *(void **)(a1 + 32);
  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  int64_t v43 = objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
  v44 = [v39 decodeObjectOfClasses:v43 forKey:@"EFPropertyKey_ccList"];
  [v51 setCcList:v44];

  v45 = *(void **)(a1 + 32);
  v46 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
  v50 = [v45 decodeObjectOfClasses:v49 forKey:@"EFPropertyKey_bccList"];
  [v51 setBccList:v50];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)EMBaseMessageListItem;
  [(EMObject *)&v24 encodeWithCoder:v4];
  id v5 = [(EMBaseMessageListItem *)self subject];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_subject"];

  uint64_t v6 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_mailboxObjectIDs"];

  int v7 = [(EMBaseMessageListItem *)self senderAddress];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_senderAddress"];

  id v8 = [(EMBaseMessageListItem *)self flags];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_flags"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isVIP](self, "isVIP"), @"EFPropertyKey_isVIP");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isBlocked](self, "isBlocked"), @"EFPropertyKey_isBlocked");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMBaseMessageListItem unsubscribeType](self, "unsubscribeType"), @"EFPropertyKey_unsubscribeType");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isToMe](self, "isToMe"), @"EFPropertyKey_isToMe");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isCCMe](self, "isCCMe"), @"EFPropertyKey_isCCMe");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem hasAttachments](self, "hasAttachments"), @"EFPropertyKey_hasAttachments");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem isAuthenticated](self, "isAuthenticated"), @"EFPropertyKey_isAuthenticated");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMBaseMessageListItem allowAuthenticationWarning](self, "allowAuthenticationWarning"), @"EFPropertyKey_allowAuthenticationWarning");
  objc_super v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[EMBaseMessageListItem conversationNotificationLevel](self, "conversationNotificationLevel"));
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_conversationNotificationLevel"];

  uint64_t v10 = [(EMBaseMessageListItem *)self brandIndicatorLocation];
  [v4 encodeObject:v10 forKey:@"EFPropertyKey_brandIndicatorLocation"];

  uint64_t v11 = [(EMBaseMessageListItem *)self date];
  [v4 encodeObject:v11 forKey:@"EFPropertyKey_date"];

  BOOL v12 = [(EMBaseMessageListItem *)self displayDate];
  [v4 encodeObject:v12 forKey:@"EFPropertyKey_displayDate"];

  BOOL v13 = [(EMBaseMessageListItem *)self readLater];
  [v4 encodeObject:v13 forKey:@"EFPropertyKey_readLater"];

  int64_t v14 = [(EMBaseMessageListItem *)self sendLaterDate];
  [v4 encodeObject:v14 forKey:@"EFPropertyKey_sendLaterDate"];

  BOOL v15 = [(EMBaseMessageListItem *)self followUp];
  [v4 encodeObject:v15 forKey:@"EFPropertyKey_followUp"];

  BOOL v16 = [(EMBaseMessageListItem *)self category];
  [v4 encodeObject:v16 forKey:@"EFPropertyKey_category"];

  int64_t v17 = [(EMBaseMessageListItem *)self groupedSenderMessageListItems];
  [v4 encodeObject:v17 forKey:@"EFPropertyKey_groupedSenderMessageListItems"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[EMBaseMessageListItem businessID](self, "businessID"), @"EFPropertyKey_businessID");
  BOOL v18 = [(EMBaseMessageListItem *)self businessLogoID];
  [v4 encodeObject:v18 forKey:@"EFPropertyKey_businessLogoID"];

  int64_t v19 = [(EMBaseMessageListItem *)self summary];
  [v4 encodeObject:v19 forKey:@"EFPropertyKey_summary"];

  int64_t v20 = [(EMBaseMessageListItem *)self generatedSummary];
  [v4 encodeObject:v20 forKey:@"EFPropertyKey_generatedSummary"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[EMBaseMessageListItem conversationID](self, "conversationID"), @"EFPropertyKey_conversationID");
  int64_t v21 = [(EMBaseMessageListItem *)self toList];
  [v4 encodeObject:v21 forKey:@"EFPropertyKey_toList"];

  char v22 = [(EMBaseMessageListItem *)self ccList];
  [v4 encodeObject:v22 forKey:@"EFPropertyKey_ccList"];

  uint64_t v23 = [(EMBaseMessageListItem *)self bccList];
  [v4 encodeObject:v23 forKey:@"EFPropertyKey_bccList"];
}

- (EMCollectionItemID)itemID
{
}

- (unint64_t)count
{
  return 1;
}

- (NSArray)mailboxObjectIDs
{
  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = self->_mailboxObjectIDs;
  os_unfair_lock_unlock(p_mailboxesLock);
  return v4;
}

- (void)setMailboxObjectIDs:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  if ((EFArraysAreEqual() & 1) == 0)
  {
    id v4 = (NSArray *)[v7 copy];
    mailboxObjectIDs = self->_mailboxObjectIDs;
    self->_mailboxObjectIDs = v4;

    mailboxes = self->_mailboxes;
    self->_mailboxes = 0;

    self->_isEditable = 0;
  }
  os_unfair_lock_unlock(&self->_mailboxesLock);
}

- (NSArray)mailboxes
{
  p_mailboxesLock = &self->_mailboxesLock;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = self->_mailboxes;
  os_unfair_lock_unlock(p_mailboxesLock);
  if (!v4)
  {
    id v5 = [(EMBaseMessageListItem *)self repository];
    uint64_t v6 = [v5 mailboxRepository];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F60D70];
      id v8 = [(EMBaseMessageListItem *)self repository];
      objc_super v9 = [v8 mailboxRepository];
      uint64_t v10 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
      uint64_t v11 = [v9 mailboxesForObjectIDs:v10];
      BOOL v12 = [v7 combine:v11];
      BOOL v13 = [v12 result:0];
      objc_msgSend(v13, "ef_filter:", *MEMORY[0x1E4F60CE8]);
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v14 = +[EMBaseMessageListItem log];
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
    id v5 = [(EMBaseMessageListItem *)self repository];
    uint64_t v6 = [v5 mailboxRepository];

    if (v6)
    {
      id v7 = [(EMBaseMessageListItem *)self mailboxObjectIDs];
      id v4 = [v6 mailboxesIfAvailableForObjectIDs:v7];
    }
    else
    {
      id v8 = +[EMBaseMessageListItem log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[EMBaseMessageListItem mailboxesIfAvailable](v8);
      }

      id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v4;
}

- (void)setMailboxes:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_mailboxesLock);
  id v4 = (NSArray *)[v8 copy];
  mailboxes = self->_mailboxes;
  self->_mailboxes = v4;

  objc_msgSend(v8, "ef_mapSelector:", sel_objectID);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mailboxObjectIDs = self->_mailboxObjectIDs;
  self->_mailboxObjectIDs = v6;

  self->_isEditable = 0;
  os_unfair_lock_unlock(&self->_mailboxesLock);
}

- (BOOL)hasUnflagged
{
  v2 = [(EMBaseMessageListItem *)self flags];
  char v3 = [v2 flagged] ^ 1;

  return v3;
}

- (void)setHasUnflagged:(BOOL)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F608B8]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__EMBaseMessageListItem_setHasUnflagged___block_invoke;
  v9[3] = &__block_descriptor_33_e38_v16__0___ECMessageFlagChangeBuilder__8l;
  BOOL v10 = a3;
  uint64_t v6 = (void *)[v5 initWithBuilder:v9];
  id v7 = [(EMBaseMessageListItem *)self flags];
  id v8 = [v6 flagsAfterChangingFlags:v7 flagsWereChanged:0];
  [(EMBaseMessageListItem *)self setFlags:v8];
}

uint64_t __41__EMBaseMessageListItem_setHasUnflagged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesFlaggedTo:*(unsigned char *)(a1 + 32) == 0];
}

- (NSIndexSet)flagColors
{
  char v3 = [(EMBaseMessageListItem *)self flags];
  int v4 = [v3 flagged];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28D60]);
    uint64_t v6 = [(EMBaseMessageListItem *)self flags];
    id v7 = objc_msgSend(v5, "initWithIndex:", objc_msgSend(v6, "flagColor"));
  }
  else
  {
    id v7 = 0;
  }
  return (NSIndexSet *)v7;
}

- (void)setFlagColors:(id)a3
{
  id v4 = a3;
  id v5 = [(EMBaseMessageListItem *)self flags];
  int v6 = [v5 flagged];

  if (v6)
  {
    unint64_t v7 = [v4 firstIndex];
    if (v7 <= 6)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F608B8]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __39__EMBaseMessageListItem_setFlagColors___block_invoke;
      v12[3] = &__block_descriptor_40_e38_v16__0___ECMessageFlagChangeBuilder__8l;
      v12[4] = v7;
      objc_super v9 = (void *)[v8 initWithBuilder:v12];
      BOOL v10 = [(EMBaseMessageListItem *)self flags];
      uint64_t v11 = [v9 flagsAfterChangingFlags:v10 flagsWereChanged:0];
      [(EMBaseMessageListItem *)self setFlags:v11];
    }
  }
}

uint64_t __39__EMBaseMessageListItem_setFlagColors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 changesFlagColorTo:*(void *)(a1 + 32)];
}

- (NSArray)senderList
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(EMBaseMessageListItem *)self senderAddress];
  char v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (void)setSenderList:(id)a3
{
  id v4 = [a3 firstObject];
  -[EMBaseMessageListItem setSenderAddress:](self, "setSenderAddress:");
}

- (void)setDisplayMessageItemID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"EMBaseMessageListItem.m" lineNumber:590 description:@"displayMessageItemID cannot be set on EMMessage"];
}

- (EFFuture)displayMessage
{
  return (EFFuture *)[MEMORY[0x1E4F60D70] futureWithResult:self];
}

- (NSArray)groupedSenderMessageListItems
{
  return self->_groupedSenderMessageListItems;
}

- (BOOL)isGroupedSender
{
  return 0;
}

- (BOOL)deleteMovesToTrash
{
  uint64_t v2 = [(EMBaseMessageListItem *)self mailboxes];
  BOOL v3 = +[EMMailbox deleteMovesToTrashForMailboxes:v2];

  return v3;
}

- (BOOL)supportsArchiving
{
  uint64_t v2 = [(EMBaseMessageListItem *)self mailboxes];
  BOOL v3 = +[EMMailbox supportsArchivingForMailboxes:v2];

  return v3;
}

- (BOOL)shouldArchiveByDefault
{
  uint64_t v2 = [(EMBaseMessageListItem *)self mailboxes];
  if (+[EMMailbox supportsArchivingForMailboxes:v2]) {
    BOOL v3 = +[EMMailbox shouldArchiveByDefaultForMailboxes:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isEditable
{
  unint64_t isEditable = self->_isEditable;
  if (!isEditable)
  {
    id v4 = [(EMBaseMessageListItem *)self mailboxes];
    int v5 = objc_msgSend(v4, "ef_any:", &__block_literal_global_1);

    unint64_t isEditable = 1;
    if (v5) {
      unint64_t isEditable = 2;
    }
    self->_unint64_t isEditable = isEditable;
  }
  return isEditable == 2;
}

BOOL __35__EMBaseMessageListItem_isEditable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 5 || objc_msgSend(v2, "type") == 6;

  return v3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDate:(id)a3
{
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayDate:(id)a3
{
}

- (ECSubject)subject
{
  return (ECSubject *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubject:(id)a3
{
}

- (void)setGroupedSenderMessageListItems:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSummary:(id)a3
{
}

- (EMGeneratedSummary)generatedSummary
{
  return (EMGeneratedSummary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGeneratedSummary:(id)a3
{
}

- (ECMessageFlags)flags
{
  return (ECMessageFlags *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFlags:(id)a3
{
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)allowAuthenticationWarning
{
  return self->allowAuthenticationWarning;
}

- (void)setAllowAuthenticationWarning:(BOOL)a3
{
  self->allowAuthenticationWarning = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (NSURL)brandIndicatorLocation
{
  return self->_brandIndicatorLocation;
}

- (void)setBrandIndicatorLocation:(id)a3
{
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (NSArray)toList
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setToList:(id)a3
{
}

- (NSArray)ccList
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCcList:(id)a3
{
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 168, 1);
}

- (void)setReadLater:(id)a3
{
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSendLaterDate:(id)a3
{
}

- (EMFollowUp)followUp
{
  return (EMFollowUp *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFollowUp:(id)a3
{
}

- (EMCategory)category
{
  return (EMCategory *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCategory:(id)a3
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
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBusinessLogoID:(id)a3
{
}

- (BOOL)isToMe
{
  return self->_isToMe;
}

- (void)setIsToMe:(BOOL)a3
{
  self->_isToMe = a3;
}

- (BOOL)isCCMe
{
  return self->_isCCMe;
}

- (void)setIsCCMe:(BOOL)a3
{
  self->_isCCMe = a3;
}

- (ECEmailAddressConvertible)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSArray)bccList
{
  return self->_bccList;
}

- (void)setBccList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_brandIndicatorLocation, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_groupedSenderMessageListItems, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (void)mailboxes
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_FAULT, "No mailboxes or mailbox repository set", v1, 2u);
}

- (void)mailboxesIfAvailable
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "No mailboxes or mailbox repository set", v1, 2u);
}

@end