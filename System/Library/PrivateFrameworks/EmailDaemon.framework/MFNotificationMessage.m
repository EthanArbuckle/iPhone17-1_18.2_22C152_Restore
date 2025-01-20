@interface MFNotificationMessage
- (BOOL)_isInFavoriteMailbox;
- (BOOL)isFavoriteMailbox;
- (BOOL)isNotifiedThread;
- (BOOL)isPrimary;
- (BOOL)isRemindMe;
- (BOOL)isVIP;
- (CNContactStore)contactStore;
- (EMVIPReader)vipReader;
- (MFFavoritesReader)favoritesReader;
- (MFLibraryMessage)libraryMessage;
- (MFMailboxUid)mailbox;
- (MFNotificationMessage)initWithFavoritesReader:(id)a3 vipReader:(id)a4 libraryMessage:(id)a5 contactStore:(id)a6 remindMeDate:(id)a7;
- (MFNotificationMessage)initWithFavoritesReader:(id)a3 vipReader:(id)a4 libraryMessage:(id)a5 contactStore:(id)a6 suppressionContexts:(id)a7 summary:(id)a8;
- (MFNotificationMessage)initWithNotificationMessage:(id)a3 summary:(id)a4;
- (MailAccount)account;
- (NSDate)dateReceived;
- (NSDate)remindMeDate;
- (NSSet)suppressionContexts;
- (NSSet)topicIdentifiers;
- (NSString)accountID;
- (NSString)coalesceThreadID;
- (NSString)ef_publicDescription;
- (NSString)messageReference;
- (NSString)nanoMessageId;
- (NSString)notificationID;
- (NSString)senderAddress;
- (NSString)senderCommentedAddress;
- (NSString)senderFullAddress;
- (NSString)subject;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)title;
- (id)_displaySender;
- (id)_displaySubject;
- (id)_summaryForRemindMe;
- (int64_t)mailboxType;
- (unint64_t)status;
- (void)setAccount:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setFavoritesReader:(id)a3;
- (void)setMailbox:(id)a3;
- (void)setSenderFullAddress:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVipReader:(id)a3;
@end

@implementation MFNotificationMessage

- (MFNotificationMessage)initWithFavoritesReader:(id)a3 vipReader:(id)a4 libraryMessage:(id)a5 contactStore:(id)a6 suppressionContexts:(id)a7 summary:(id)a8
{
  id v62 = a3;
  id v61 = a4;
  id v15 = a5;
  id v60 = a6;
  id v59 = a7;
  id v58 = a8;
  v63.receiver = self;
  v63.super_class = (Class)MFNotificationMessage;
  v16 = [(MFNotificationMessage *)&v63 init];
  p_isa = (id *)&v16->super.isa;
  v18 = v16;
  if (!v16)
  {
LABEL_14:
    v35 = v18;
    goto LABEL_15;
  }
  p_libraryMessage = (id *)&v16->_libraryMessage;
  objc_storeStrong((id *)&v16->_libraryMessage, a5);
  uint64_t v20 = [v15 account];
  account = v18->_account;
  v18->_account = (MailAccount *)v20;

  objc_storeStrong(p_isa + 19, a6);
  if (v18->_account)
  {
    objc_storeStrong(p_isa + 14, a3);
    objc_storeStrong(p_isa + 15, a4);
    objc_storeStrong(p_isa + 7, a8);
    objc_storeStrong(p_isa + 9, a7);
    uint64_t v22 = [(MFLibraryMessage *)v18->_libraryMessage mailbox];
    mailbox = v18->_mailbox;
    v18->_mailbox = (MFMailboxUid *)v22;

    v24 = [(MFLibraryMessage *)v18->_libraryMessage subject];
    uint64_t v25 = [v24 subjectString];
    subject = v18->_subject;
    v18->_subject = (NSString *)v25;

    v27 = [(MFLibraryMessage *)v18->_libraryMessage senders];
    uint64_t v28 = [v27 firstObject];
    senderFullAddress = v18->_senderFullAddress;
    v18->_senderFullAddress = (NSString *)v28;

    v30 = v18->_senderFullAddress;
    v31 = [(NSString *)v30 emailAddressValue];
    v32 = [v31 simpleAddress];
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      v34 = [(NSString *)v30 stringValue];
    }
    v36 = v34;

    senderAddress = v18->_senderAddress;
    v18->_senderAddress = v36;

    uint64_t v38 = [(MailAccount *)v18->_account uniqueID];
    accountID = v18->_accountID;
    v18->_accountID = (NSString *)v38;

    uint64_t v40 = [(MFNotificationMessage *)v18 _displaySubject];
    subtitle = v18->_subtitle;
    v18->_subtitle = (NSString *)v40;

    uint64_t v42 = [(MFLibraryMessage *)v18->_libraryMessage dateReceived];
    dateReceived = v18->_dateReceived;
    v18->_dateReceived = (NSDate *)v42;

    id v44 = [(MFLibraryMessage *)v18->_libraryMessage senderAddressComment];
    v45 = [v44 emailAddressValue];
    v46 = [v45 displayName];
    v47 = v46;
    if (v46)
    {
      v48 = v46;
    }
    else
    {
      v48 = [v44 stringValue];
    }
    v49 = v48;

    senderCommentedAddress = v18->_senderCommentedAddress;
    v18->_senderCommentedAddress = v49;

    v18->_isVIP = [(EMVIPReader *)v18->_vipReader isVIPAddress:v18->_senderFullAddress];
    v18->_isFavoriteMailbox = [(MFNotificationMessage *)v18 _isInFavoriteMailbox];
    v51 = [(MFLibraryMessage *)v18->_libraryMessage nanoLocalMessageId];
    v52 = v51;
    if (v51)
    {
      v53 = v51;
      nanoMessageId = v18->_nanoMessageId;
      v18->_nanoMessageId = v53;
    }
    else
    {
      nanoMessageId = objc_msgSend(*p_libraryMessage, "mf_externalReference");
      uint64_t v55 = [nanoMessageId absoluteString];
      v56 = v18->_nanoMessageId;
      v18->_nanoMessageId = (NSString *)v55;
    }
    goto LABEL_14;
  }
  v35 = 0;
LABEL_15:

  return v35;
}

- (MFNotificationMessage)initWithFavoritesReader:(id)a3 vipReader:(id)a4 libraryMessage:(id)a5 contactStore:(id)a6 remindMeDate:(id)a7
{
  id v60 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v61.receiver = self;
  v61.super_class = (Class)MFNotificationMessage;
  id v15 = [(MFNotificationMessage *)&v61 init];
  p_isa = (id *)&v15->super.isa;
  v17 = v15;
  if (!v15)
  {
LABEL_17:
    v34 = v17;
    goto LABEL_18;
  }
  p_libraryMessage = (id *)&v15->_libraryMessage;
  objc_storeStrong((id *)&v15->_libraryMessage, a5);
  uint64_t v19 = [v13 account];
  account = v17->_account;
  v17->_account = (MailAccount *)v19;

  if (v17->_account)
  {
    objc_storeStrong(p_isa + 14, a3);
    objc_storeStrong(p_isa + 15, a4);
    v17->_isRemindMe = 1;
    objc_storeStrong(p_isa + 13, a7);
    uint64_t v21 = [(MFLibraryMessage *)v17->_libraryMessage mailbox];
    mailbox = v17->_mailbox;
    v17->_mailbox = (MFMailboxUid *)v21;

    v23 = [(MFLibraryMessage *)v17->_libraryMessage subject];
    uint64_t v24 = [v23 subjectString];
    subject = v17->_subject;
    v17->_subject = (NSString *)v24;

    v26 = [(MFLibraryMessage *)v17->_libraryMessage senders];
    uint64_t v27 = [v26 firstObject];
    senderFullAddress = v17->_senderFullAddress;
    v17->_senderFullAddress = (NSString *)v27;

    v29 = v17->_senderFullAddress;
    v30 = [(NSString *)v29 emailAddressValue];
    v31 = [v30 simpleAddress];
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      v33 = [(NSString *)v29 stringValue];
    }
    v35 = v33;

    senderAddress = v17->_senderAddress;
    v17->_senderAddress = v35;

    uint64_t v37 = [(MailAccount *)v17->_account uniqueID];
    accountID = v17->_accountID;
    v17->_accountID = (NSString *)v37;

    subtitle = v17->_subtitle;
    v17->_subtitle = 0;

    uint64_t v40 = [(MFLibraryMessage *)v17->_libraryMessage dateReceived];
    dateReceived = v17->_dateReceived;
    v17->_dateReceived = (NSDate *)v40;

    id v42 = [(MFLibraryMessage *)v17->_libraryMessage senderAddressComment];
    v43 = [v42 emailAddressValue];
    id v44 = [v43 displayName];
    v45 = v44;
    if (v44)
    {
      v46 = v44;
    }
    else
    {
      v46 = [v42 stringValue];
    }
    v47 = v46;

    senderCommentedAddress = v17->_senderCommentedAddress;
    v17->_senderCommentedAddress = v47;

    v17->_isVIP = [(EMVIPReader *)v17->_vipReader isVIPAddress:v17->_senderFullAddress];
    v17->_isFavoriteMailbox = [(MFNotificationMessage *)v17 _isInFavoriteMailbox];
    v49 = [(MFLibraryMessage *)v17->_libraryMessage nanoLocalMessageId];
    v50 = v49;
    if (v49)
    {
      v51 = v49;
      nanoMessageId = v17->_nanoMessageId;
      v17->_nanoMessageId = v51;
    }
    else
    {
      nanoMessageId = objc_msgSend(*p_libraryMessage, "mf_externalReference");
      uint64_t v53 = [nanoMessageId absoluteString];
      v54 = v17->_nanoMessageId;
      v17->_nanoMessageId = (NSString *)v53;
    }
    uint64_t v55 = [(MFNotificationMessage *)v17 _summaryForRemindMe];
    summary = v17->_summary;
    v17->_summary = (NSString *)v55;

    if (v17->_summary) {
      +[EDRemindMeNotificationController localizedRemindMeNotificationTitle];
    }
    else {
    uint64_t v57 = +[EDRemindMeNotificationController localizedRemindMeNotificationTitleNoSender];
    }
    title = v17->_title;
    v17->_title = (NSString *)v57;

    goto LABEL_17;
  }
  v34 = 0;
LABEL_18:

  return v34;
}

- (MFNotificationMessage)initWithNotificationMessage:(id)a3 summary:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFNotificationMessage;
    v8 = [(MFNotificationMessage *)&v13 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_libraryMessage, v6[2]);
      objc_storeStrong((id *)&v9->_account, v6[3]);
      objc_storeStrong((id *)&v9->_contactStore, v6[19]);
      objc_storeStrong((id *)&v9->_favoritesReader, v6[14]);
      objc_storeStrong((id *)&v9->_vipReader, v6[15]);
      id v10 = v7;
      if (!v7) {
        id v10 = v6[7];
      }
      objc_storeStrong((id *)&v9->_summary, v10);
      objc_storeStrong((id *)&v9->_suppressionContexts, v6[9]);
      objc_storeStrong((id *)&v9->_mailbox, v6[16]);
      objc_storeStrong((id *)&v9->_subject, v6[17]);
      objc_storeStrong((id *)&v9->_senderFullAddress, v6[20]);
      objc_storeStrong((id *)&v9->_senderAddress, v6[8]);
      objc_storeStrong((id *)&v9->_accountID, v6[10]);
      objc_storeStrong((id *)&v9->_subtitle, v6[6]);
      objc_storeStrong((id *)&v9->_dateReceived, v6[4]);
      objc_storeStrong((id *)&v9->_senderCommentedAddress, v6[18]);
      v9->_isVIP = *((unsigned char *)v6 + 8);
      v9->_isFavoriteMailbox = *((unsigned char *)v6 + 9);
      objc_storeStrong((id *)&v9->_nanoMessageId, v6[11]);
    }
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_summaryForRemindMe
{
  v3 = [(MFNotificationMessage *)self _displaySender];
  if ([v3 length])
  {
    v4 = [(MFNotificationMessage *)self _displaySubject];
    v5 = +[NSString stringWithFormat:@"%@\n%@", v3, v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)title
{
  title = self->_title;
  if (!title)
  {
    v4 = [(MFNotificationMessage *)self _displaySender];
    v5 = self->_title;
    self->_title = v4;

    title = self->_title;
  }

  return title;
}

- (id)_displaySender
{
  v3 = [(MFNotificationMessage *)self senderFullAddress];
  id v4 = [(MFNotificationMessage *)self senderFullAddress];
  v5 = [v4 emailAddressValue];
  v6 = [v5 simpleAddress];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  v9 = v8;

  if (!v9
    || ([(MFNotificationMessage *)self contactStore],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
LABEL_10:
    id v18 = v3;
    uint64_t v19 = [v18 emailAddressValue];
    uint64_t v20 = [v19 displayName];
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [v18 stringValue];
    }
    v23 = v22;

    if ([v23 isEqualToString:v18])
    {
      id v24 = [(MFNotificationMessage *)self senderCommentedAddress];
    }
    else
    {
      id v24 = v23;
    }
    v17 = v24;

    goto LABEL_17;
  }
  v11 = +[CNContact predicateForContactsMatchingEmailAddress:v9];
  id v12 = [(MFNotificationMessage *)self contactStore];
  objc_super v13 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v26[0] = v13;
  v26[1] = CNContactEmailAddressesKey;
  id v14 = +[NSArray arrayWithObjects:v26 count:2];
  id v15 = [v12 unifiedContactsMatchingPredicate:v11 keysToFetch:v14 error:0];

  if (![v15 count])
  {

    goto LABEL_10;
  }
  v16 = [v15 firstObject];
  v17 = +[CNContactFormatter stringFromContact:v16 style:0];

  if (!v17) {
    goto LABEL_10;
  }
LABEL_17:

  return v17;
}

- (id)_displaySubject
{
  v2 = [(MFLibraryMessage *)self->_libraryMessage subject];
  v3 = [v2 subjectString];

  if (v3)
  {
    id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    objc_msgSend(v3, "ef_stringByTrimmingLeadingCharactersInSet:", v4);
  }
  else
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    [v4 localizedStringForKey:@"NO_SUBJECT" value:&stru_10013ED08 table:0];
  v5 = };

  return v5;
}

- (BOOL)_isInFavoriteMailbox
{
  v2 = self;
  favoritesReader = self->_favoritesReader;
  id v4 = [(MFNotificationMessage *)self account];
  v5 = [(MFFavoritesReader *)favoritesReader favoriteMailboxesForAccount:v4];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009B6CC;
  v7[3] = &unk_10013AA18;
  v7[4] = v2;
  LOBYTE(v2) = objc_msgSend(v5, "ef_any:", v7);

  return (char)v2;
}

- (NSString)messageReference
{
  v3 = [(MFLibraryMessage *)self->_libraryMessage globalMessageURL];
  if (!v3)
  {
    v3 = [(MFLibraryMessage *)self->_libraryMessage mf_externalReference];
  }
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NSString)notificationID
{
  return (NSString *)[(MFLibraryMessage *)self->_libraryMessage notificationID];
}

- (NSSet)topicIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  if ([(MFNotificationMessage *)self isVIP]) {
    [v3 addObject:MSUserNotificationCenterTopicVIP];
  }
  if ([(MFNotificationMessage *)self isNotifiedThread]) {
    [v3 addObject:MSUserNotificationCenterTopicNotifiedThreads];
  }
  if ([(MFNotificationMessage *)self isRemindMe]) {
    [v3 addObject:MSUserNotificationCenterTopicRemindMe];
  }
  if ([(MFNotificationMessage *)self isPrimary]) {
    [v3 addObject:MSUserNotificationCenterTopicPrimary];
  }
  if ([(MFNotificationMessage *)self isFavoriteMailbox]) {
    [v3 addObject:MSUserNotificationCenterTopicFavoriteMailboxes];
  }
  if (![(MFNotificationMessage *)self isFavoriteMailbox])
  {
    id v4 = [(MFNotificationMessage *)self accountID];
    [v3 addObject:v4];
  }

  return (NSSet *)v3;
}

- (NSString)coalesceThreadID
{
  v2 = [(MFNotificationMessage *)self account];
  id v3 = [v2 displayName];
  id v4 = v3;
  if (!v3) {
    id v3 = &stru_10013ED08;
  }
  v5 = v3;

  return v5;
}

- (BOOL)isNotifiedThread
{
  v2 = [(MFNotificationMessage *)self libraryMessage];
  BOOL v3 = [v2 conversationFlags] & 1;

  return v3;
}

- (NSString)ef_publicDescription
{
  BOOL v3 = [(MFNotificationMessage *)self notificationID];
  id v4 = [(MFNotificationMessage *)self libraryMessage];
  id v5 = [v4 libraryID];
  v6 = [(MFNotificationMessage *)self libraryMessage];
  id v7 = [v6 globalMessageID];
  id v8 = [(MFNotificationMessage *)self accountID];
  v9 = [(MFNotificationMessage *)self topicIdentifiers];
  id v10 = +[NSString stringWithFormat:@"notificationID %@, libraryID:%ld, globalMessageID:%ld, Account:%@, Topics:%@", v3, v5, v7, v8, v9];

  return (NSString *)v10;
}

- (unint64_t)status
{
  BOOL v3 = [[MFMessageResultsGenerator alloc] initWithKeys:&__NSArray0__struct downloadIfNecessary:0];
  [(MFMessageResultsGenerator *)v3 setMessage:self->_libraryMessage];
  id v4 = [(_MFResultsGenerator *)v3 valueForKey:@"MSResultsKeyStatus"];

  return (unint64_t)v4;
}

- (BOOL)isPrimary
{
  v2 = [(MFNotificationMessage *)self libraryMessage];
  BOOL v3 = [v2 category];

  if ([v3 state]) {
    unsigned __int8 v4 = [v3 isPrimary];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSSet)suppressionContexts
{
  return self->_suppressionContexts;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)nanoMessageId
{
  return self->_nanoMessageId;
}

- (int64_t)mailboxType
{
  return self->_mailboxType;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isFavoriteMailbox
{
  return self->_isFavoriteMailbox;
}

- (BOOL)isRemindMe
{
  return self->_isRemindMe;
}

- (NSDate)remindMeDate
{
  return self->_remindMeDate;
}

- (MFFavoritesReader)favoritesReader
{
  return self->_favoritesReader;
}

- (void)setFavoritesReader:(id)a3
{
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (void)setVipReader:(id)a3
{
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)senderCommentedAddress
{
  return self->_senderCommentedAddress;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSString)senderFullAddress
{
  return self->_senderFullAddress;
}

- (void)setSenderFullAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderFullAddress, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_senderCommentedAddress, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_favoritesReader, 0);
  objc_storeStrong((id *)&self->_remindMeDate, 0);
  objc_storeStrong((id *)&self->_nanoMessageId, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_suppressionContexts, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_libraryMessage, 0);
}

@end