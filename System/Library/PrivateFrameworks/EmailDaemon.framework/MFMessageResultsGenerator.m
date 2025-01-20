@interface MFMessageResultsGenerator
- (MFAttachmentManager)attachmentManager;
- (MFLibraryMessage)message;
- (MFMessageResultsGenerator)initWithKeys:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_accountReference:(id)a3;
- (id)_attachmentValueForKey:(id)a3;
- (id)_bestAlternativePart:(id)a3;
- (id)_bodySummary:(id)a3;
- (id)_conversationReference:(id)a3;
- (id)_convertEmailAddress:(id)a3;
- (id)_convertEmailAddresses:(id)a3;
- (id)_copyPredictiveModelSummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)_dateReceived:(id)a3;
- (id)_dateSent:(id)a3;
- (id)_defaultAttachmentManager;
- (id)_headerData:(id)a3;
- (id)_headerValueForKey:(id)a3;
- (id)_isLocalDraft:(id)a3;
- (id)_knownAttachmentLimiterTests;
- (id)_localMessageReference:(id)a3;
- (id)_mailboxType:(id)a3;
- (id)_mailboxURL:(id)a3;
- (id)_messageIDHash:(id)a3;
- (id)_messageLibraryID:(id)a3;
- (id)_messageReference:(id)a3;
- (id)_outgoing:(id)a3;
- (id)_predictiveModelSummary:(id)a3;
- (id)_publisherBulletinID:(id)a3;
- (id)_receivingAddresses:(id)a3;
- (id)_recipientBcc:(id)a3;
- (id)_recipientCc:(id)a3;
- (id)_recipientTo:(id)a3;
- (id)_rfc822Data:(id)a3;
- (id)_sender:(id)a3;
- (id)_status:(id)a3;
- (id)_subject:(id)a3;
- (id)_suppressionContexts:(id)a3;
- (id)_testForAttachmentLimiterType:(id)a3;
- (id)blockForKey:(id)a3;
- (void)_addressBook;
- (void)dealloc;
- (void)setAttachmentManager:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation MFMessageResultsGenerator

- (MFMessageResultsGenerator)initWithKeys:(id)a3 downloadIfNecessary:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MFMessageResultsGenerator;
  v5 = [(_MFResultsGenerator *)&v9 initWithKeys:a3];
  v6 = v5;
  if (v5)
  {
    v5->_shouldDownload = a4;
    v7 = v5;
  }

  return v6;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFMessageResultsGenerator;
  [(MFMessageResultsGenerator *)&v4 dealloc];
}

- (id)blockForKey:(id)a3
{
  id v3 = a3;
  if (qword_10016BBE0 != -1) {
    dispatch_once(&qword_10016BBE0, &stru_10013C960);
  }
  objc_super v4 = [(id)qword_10016BBD8 objectForKeyedSubscript:v3];
  if (!v4)
  {
    if ([v3 hasPrefix:@"MSResultsKeyAttachments"]) {
      objc_super v4 = &stru_10013CCE0;
    }
    else {
      objc_super v4 = &stru_10013CD00;
    }
  }
  v5 = objc_retainBlock(v4);

  return v5;
}

- (id)_messageLibraryID:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:[(MFLibraryMessage *)self->_message libraryID]];

  return v3;
}

- (id)_messageReference:(id)a3
{
  objc_super v4 = [(MFLibraryMessage *)self->_message globalMessageURL];
  if (!v4)
  {
    objc_super v4 = [(MFLibraryMessage *)self->_message mf_externalReference];
  }
  v5 = [v4 absoluteString];

  return v5;
}

- (id)_localMessageReference:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mf_externalReference];
  objc_super v4 = [v3 absoluteString];

  return v4;
}

- (id)_publisherBulletinID:(id)a3
{
  objc_super v4 = [(MFLibraryMessage *)self->_message account];
  v5 = [v4 uniqueServerIdForMessage:self->_message];

  if (!v5)
  {
    v6 = [(MFLibraryMessage *)self->_message mf_externalReference];
    v5 = [v6 absoluteString];
  }

  return v5;
}

- (id)_conversationReference:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mf_conversationReference];
  objc_super v4 = [v3 absoluteString];

  return v4;
}

- (id)_accountReference:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message account];
  objc_super v4 = [v3 uniqueID];

  return v4;
}

- (id)_mailboxURL:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mailbox];
  objc_super v4 = [v3 URLString];

  return v4;
}

- (id)_messageIDHash:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:[(MFLibraryMessage *)self->_message messageIDHash]];
  objc_super v4 = [v3 stringValue];

  return v4;
}

- (id)_subject:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message subject];
  objc_super v4 = [v3 subjectString];

  return v4;
}

- (id)_bodySummary:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message summary];
  if (!v4) {
    id v4 = +[MessageBodyLoader copySummaryForMessage:self->_message downloadIfNecessary:self->_shouldDownload];
  }

  return v4;
}

- (id)_predictiveModelSummary:(id)a3
{
  id v3 = [(MFMessageResultsGenerator *)self _copyPredictiveModelSummaryForMessage:self->_message downloadIfNecessary:self->_shouldDownload];

  return v3;
}

- (id)_defaultAttachmentManager
{
  v2 = +[DaemonAppController sharedController];
  id v3 = [v2 defaultAttachmentManager];

  return v3;
}

- (id)_copyPredictiveModelSummaryForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)MFMessageLoadingContext);
  v8 = [(MFMessageResultsGenerator *)self _defaultAttachmentManager];
  id v9 = [v7 initWithMessage:v6 attachmentManager:v8];

  v10 = +[EFScheduler immediateScheduler];
  [v9 load:0 scheduler:v10 shouldDownload:v4];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10007BE70;
  v19 = sub_10007BE80;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007BE88;
  v14[3] = &unk_10013CD28;
  v14[4] = &v15;
  id v11 = [v9 addLoadObserver:v14];
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (void)_addressBook
{
  result = self->_addressBook;
  if (!result)
  {
    result = (void *)ABAddressBookCreateWithOptions(0, 0);
    self->_addressBook = result;
  }
  return result;
}

- (id)_convertEmailAddress:(id)a3
{
  id v4 = a3;
  if ([(MFMessageResultsGenerator *)self _addressBook])
  {
    id v5 = v4;
    id v6 = [v5 emailAddressValue];
    id v7 = [v6 displayName];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 stringValue];
    }
    id v11 = v9;

    id v12 = v5;
    v13 = [v12 emailAddressValue];
    v14 = [v13 simpleAddress];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v12 stringValue];
    }
    uint64_t v17 = v16;

    v18 = MFPreferredCompositeNameForAddressAndDisplayName();
    v19 = v18;
    if (v18 && ([v18 isEqualToString:v11] & 1) == 0)
    {
      id v20 = objc_alloc_init((Class)ECEmailAddressFormatter);
      [v20 setShouldIncludeDisplayName:1];
      v21 = +[ECEmailAddressComponents componentsWithString:v17];
      [v21 setDisplayName:v19];
      uint64_t v22 = [v21 emailAddressValue];
      v23 = (void *)v22;
      if (v22) {
        v24 = (void *)v22;
      }
      else {
        v24 = v17;
      }
      v10 = [v20 stringFromEmailAddressConvertible:v24];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v10) {
    v25 = v10;
  }
  else {
    v25 = v4;
  }
  id v26 = v25;

  return v26;
}

- (id)_convertEmailAddresses:(id)a3
{
  id v4 = a3;
  if ([(MFMessageResultsGenerator *)self _addressBook])
  {
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = -[MFMessageResultsGenerator _convertEmailAddress:](self, "_convertEmailAddress:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)_sender:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message firstSender];
  id v5 = [(MFMessageResultsGenerator *)self _convertEmailAddress:v4];

  return v5;
}

- (id)_recipientBcc:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message bcc];
  id v5 = [(MFMessageResultsGenerator *)self _convertEmailAddresses:v4];

  return v5;
}

- (id)_recipientCc:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message cc];
  id v5 = [(MFMessageResultsGenerator *)self _convertEmailAddresses:v4];

  return v5;
}

- (id)_recipientTo:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message to];
  id v5 = [(MFMessageResultsGenerator *)self _convertEmailAddresses:v4];

  return v5;
}

- (id)_receivingAddresses:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message account];
  id v4 = [v3 emailAddressesAndAliasesList];

  return v4;
}

- (id)_dateSent:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message dateSent];

  return v3;
}

- (id)_dateReceived:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message dateReceived];

  return v3;
}

- (id)_status:(id)a3
{
  unint64_t v4 = (unint64_t)[(MFLibraryMessage *)self->_message messageFlags];
  unsigned __int8 v5 = [(MFLibraryMessage *)self->_message conversationFlags];
  unsigned int v6 = [(MFLibraryMessage *)self->_message conversationFlags];
  if ((unsigned __int16)v4 >> 10) {
    BOOL v7 = (unsigned __int16)v4 >> 10 == 63;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = ((v4 >> 1) & 8 | v4 & 1 | (v4 >> 6) & 4 | (v4 >> 1) & 2) ^ 1;
  if (!v7) {
    v8 |= 0x10uLL;
  }
  if ((v4 & 0x18000000000) != 0) {
    unint64_t v9 = (v4 >> 15) & 0x40 | (v4 >> 19) & 0x20 | ((unint64_t)(v5 & 1) << 7) | (v6 << 6) & 0x100 | v8 | 0x200;
  }
  else {
    unint64_t v9 = (v4 >> 15) & 0x40 | (v4 >> 19) & 0x20 | ((unint64_t)(v5 & 1) << 7) | (v6 << 6) & 0x100 | v8;
  }
  v10 = +[NSNumber numberWithUnsignedInteger:v9];

  return v10;
}

- (id)_isLocalDraft:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mailbox];
  unint64_t v4 = +[LocalAccount localAccount];
  unsigned __int8 v5 = [v4 transientDraftsFolder];
  unsigned int v6 = [v3 isEqual:v5];

  if (v6) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }

  return (id)v7;
}

- (id)_outgoing:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mailbox];
  unint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isOutgoingMailboxUid]);

  return v4;
}

- (id)_mailboxType:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message mailbox];
  unint64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 mailboxType]);

  return v4;
}

- (id)_suppressionContexts:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  unsigned __int8 v5 = [(MFLibraryMessage *)self->_message mf_externalReference];
  unsigned int v6 = [v5 absoluteString];

  if (v6) {
    [v4 addObject:v6];
  }
  CFStringRef v7 = [(MFLibraryMessage *)self->_message mf_conversationReference];
  uint64_t v8 = [v7 absoluteString];

  if (v8) {
    [v4 addObject:v8];
  }
  unint64_t v9 = [(MFLibraryMessage *)self->_message mailbox];
  v10 = [v9 URLString];
  if (v10) {
    [v4 addObject:v10];
  }
  if ([v9 mailboxType] == (id)7) {
    [v4 addObject:@"com.apple.mobilemail.context.AllInbox"];
  }
  unint64_t v11 = (unint64_t)[(MFLibraryMessage *)self->_message messageFlags];
  if ((v11 & 0x1000000) != 0) {
    [v4 addObject:MSUserNotificationCenterTopicVIP];
  }
  if ((v11 & 0x10) != 0) {
    [v4 addObject:@"com.apple.mobilemail.context.flagged"];
  }
  if ((v11 & 0x18000000000) != 0) {
    [v4 addObject:@"com.apple.mobilemail.context.toMe"];
  }
  if ((unsigned __int16)v11 >> 10 && (unsigned __int16)v11 >> 10 != 63) {
    [v4 addObject:@"com.apple.mobilemail.context.hasAttachments"];
  }
  if ([(MFLibraryMessage *)self->_message conversationFlags]) {
    [v4 addObject:MSUserNotificationCenterTopicNotifiedThreads];
  }
  long long v12 = [(MFLibraryMessage *)self->_message readLater];

  if (v12) {
    [v4 addObject:MSUserNotificationCenterTopicRemindMe];
  }
  long long v13 = [(MFLibraryMessage *)self->_message category];
  if ([v13 state] && objc_msgSend(v13, "isPrimary")) {
    [v4 addObject:MSUserNotificationCenterTopicPrimary];
  }

  return v4;
}

- (id)_knownAttachmentLimiterTests
{
  if (qword_10016BBF0 != -1) {
    dispatch_once(&qword_10016BBF0, &stru_10013CDA8);
  }
  v2 = (void *)qword_10016BBE8;

  return v2;
}

- (id)_testForAttachmentLimiterType:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MFMessageResultsGenerator *)self _knownAttachmentLimiterTests];
  unsigned int v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_attachmentValueForKey:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MFLibraryMessage *)self->_message messageBodyIfAvailable];
  unsigned int v6 = [v5 topLevelPart];
  CFStringRef v7 = [v6 attachmentURLs];
  attachmentManager = self->_attachmentManager;
  id v22 = 0;
  unint64_t v9 = [(MFAttachmentManager *)attachmentManager attachmentsForURLs:v7 error:&v22];
  id v10 = v22;
  if (!v9)
  {
    long long v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Warning couldn't convert attachment URLs to attachment objects: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (![v9 count])
  {
LABEL_9:
    id v13 = 0;
    goto LABEL_10;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D1D0;
  block[3] = &unk_100139C48;
  block[4] = self;
  if (qword_10016BC00 != -1) {
    dispatch_once(&qword_10016BC00, block);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10007BE70;
  id v26 = sub_10007BE80;
  id v27 = 0;
  id v11 = [v4 length];
  long long v12 = (void *)qword_10016BBF8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007D2E0;
  v16[3] = &unk_10013CDD0;
  id v17 = v4;
  v18 = self;
  id v19 = v9;
  p_long long buf = &buf;
  objc_msgSend(v12, "enumerateMatchesInString:options:range:usingBlock:", v17, 4, 0, v11, v16);
  id v13 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
LABEL_10:

  return v13;
}

- (id)_rfc822Data:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message mailbox];
  unsigned __int8 v5 = [v4 store];

  id v6 = objc_alloc_init((Class)MFMutableData);
  CFStringRef v7 = [v5 headerDataForMessage:self->_message downloadIfNecessary:0];
  if (v7) {
    [v6 appendData:v7];
  }
  uint64_t v8 = [v5 fullBodyDataForMessage:self->_message andHeaderDataIfReadilyAvailable:0 isComplete:0 downloadIfNecessary:0 didDownload:0];

  if (v8) {
    [v6 appendData:v8];
  }

  return v6;
}

- (id)_bestAlternativePart:(id)a3
{
  id v3 = [(MFLibraryMessage *)self->_message bestAlternativePart];

  return v3;
}

- (id)_headerData:(id)a3
{
  id v4 = [(MFLibraryMessage *)self->_message mailbox];
  unsigned __int8 v5 = [v4 store];

  id v6 = [v5 headerDataForMessage:self->_message downloadIfNecessary:0];

  return v6;
}

- (id)_headerValueForKey:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MFLibraryMessage *)self->_message messageBodyIfAvailable];
  id v6 = [v5 topLevelPart];

  CFStringRef v7 = [(MFLibraryMessage *)self->_message bestAlternativeInPart:v6];
  uint64_t v8 = [(MFLibraryMessage *)self->_message defaultAlternativeInPart:v6];
  if (v7 != v8)
  {
    unint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning Exchange message was not fully loaded.  We won't be able to get custom headers for it.", v13, 2u);
    }
  }
  id v10 = [(MFLibraryMessage *)self->_message headers];
  id v11 = [v10 headersForKey:v4];

  return v11;
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
}

- (MFLibraryMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

@end