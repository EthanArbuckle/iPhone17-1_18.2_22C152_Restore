@interface MFMailboxMessageBodyProcessor
- (BOOL)_shouldContinueProcessing;
- (BOOL)_shouldDownloadMessage:(id)a3;
- (BOOL)_shouldTryToDownloadMessage:(id)a3;
- (MFDeviceStorage)deviceStorage;
- (MFMailMessageLibrary)library;
- (MFMailboxMessageBodyProcessor)initWithMailbox:(id)a3 batchSize:(unint64_t)a4 deviceStorage:(id)a5;
- (MFMailboxMessageBodyProcessorDelegate)delegate;
- (MFMailboxUid)mailbox;
- (MessageBodyLoader)messageBodyLoader;
- (int64_t)_freeSpaceGuidanceForSpaceIncreaseForMessage:(id)a3;
- (int64_t)_spaceIncreaseUrgencyForMessage:(id)a3;
- (unint64_t)batchSize;
- (void)_enumerateMessagesToDownload:(id)a3;
- (void)runSynchronously;
- (void)setDelegate:(id)a3;
@end

@implementation MFMailboxMessageBodyProcessor

- (MFMailboxMessageBodyProcessor)initWithMailbox:(id)a3 batchSize:(unint64_t)a4 deviceStorage:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MFMailboxMessageBodyProcessor.m", 153, @"Invalid parameter not satisfying: %@", @"mailbox" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = +[NSAssertionHandler currentHandler];
  [v20 handleFailureInMethod:a2, self, @"MFMailboxMessageBodyProcessor.m", 153, @"Invalid parameter not satisfying: %@", @"deviceStorage" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)MFMailboxMessageBodyProcessor;
  v13 = [(MFMailboxMessageBodyProcessor *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mailbox, a3);
    v14->_batchSize = a4;
    objc_storeStrong((id *)&v14->_deviceStorage, a5);
    v15 = [v10 representedAccount];
    uint64_t v16 = +[MessageBodyLoader loaderForAccount:v15];
    messageBodyLoader = v14->_messageBodyLoader;
    v14->_messageBodyLoader = (MessageBodyLoader *)v16;
  }
  return v14;
}

- (void)runSynchronously
{
  v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MFMailboxMessageBodyProcessor *)self mailbox];
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    __int16 v10 = 2048;
    unint64_t v11 = [(MFMailboxMessageBodyProcessor *)self batchSize];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Starting body download for mailbox %@ (batch size: %lu)", buf, 0x16u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000735B0;
  v7[3] = &unk_10013C570;
  v7[4] = self;
  [(MFMailboxMessageBodyProcessor *)self _enumerateMessagesToDownload:v7];
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MFMailboxMessageBodyProcessor *)self mailbox];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Finished body download for mailbox %@", buf, 0xCu);
  }
}

- (MFMailMessageLibrary)library
{
  return +[MFMailMessageLibrary defaultInstance];
}

- (void)_enumerateMessagesToDownload:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MFMailboxMessageBodyProcessor.m", 199, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = [(MFMailboxMessageBodyProcessor *)self mailbox];
  v7 = +[MFMessageCriterion criterionForMailbox:v6];

  v8 = +[MFMessageCriterion messageIsDeletedCriterion:0];
  v23[0] = v7;
  v23[1] = v8;
  v9 = +[NSArray arrayWithObjects:v23 count:2];
  __int16 v10 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v9];

  unint64_t v11 = [_MFBatchedMessageConsumer alloc];
  unint64_t v12 = [(MFMailboxMessageBodyProcessor *)self batchSize];
  v13 = [(MFMailboxMessageBodyProcessor *)self mailbox];
  v14 = [v13 store];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100073B04;
  v22[3] = &unk_10013C598;
  v22[4] = self;
  v15 = [(_MFBatchedMessageConsumer *)v11 initWithBatchSize:v12 messageStore:v14 filter:v22];

  uint64_t v16 = [(MFMailboxMessageBodyProcessor *)self library];
  [v16 sendMessagesMatchingCriterion:v10 to:v15 options:128];

  v17 = [(_MFBatchedMessageConsumer *)v15 messages];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100073C0C;
  v20[3] = &unk_10013C5C0;
  v20[4] = self;
  id v18 = v5;
  id v21 = v18;
  [v17 enumerateObjectsUsingBlock:v20];
}

- (BOOL)_shouldContinueProcessing
{
  v3 = [(MFMailboxMessageBodyProcessor *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 mailboxMessageBodyProcessorShouldContinueProcessing:self];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)_shouldTryToDownloadMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailboxMessageBodyProcessor *)self messageBodyLoader];
  unsigned __int8 v6 = [v5 isProcessingMessage:v4];

  if (v6) {
    LOBYTE(v7) = 0;
  }
  else {
    unsigned int v7 = [v4 isMessageContentsLocallyAvailable] ^ 1;
  }

  return v7;
}

- (BOOL)_shouldDownloadMessage:(id)a3
{
  return [(MFMailboxMessageBodyProcessor *)self _freeSpaceGuidanceForSpaceIncreaseForMessage:a3] == 0;
}

- (int64_t)_freeSpaceGuidanceForSpaceIncreaseForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messageSize];
  int64_t v6 = [(MFMailboxMessageBodyProcessor *)self _spaceIncreaseUrgencyForMessage:v4];
  unsigned int v7 = [(MFMailboxMessageBodyProcessor *)self deviceStorage];
  id v8 = [v7 freeSpaceGuidanceForSpaceIncrease:v5 urgency:v6];

  return (int64_t)v8;
}

- (int64_t)_spaceIncreaseUrgencyForMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [v3 dateReceived];
  int64_t v6 = +[NSDate date];
  unsigned int v7 = [v4 components:16 fromDate:v5 toDate:v6 options:0];

  uint64_t v8 = (uint64_t)[v7 day];
  uint64_t v9 = 1;
  if (v8 < 14) {
    uint64_t v9 = 2;
  }
  if (v8 >= 7) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 3;
  }

  return v10;
}

- (MFMailboxMessageBodyProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailboxMessageBodyProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (MFDeviceStorage)deviceStorage
{
  return self->_deviceStorage;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (MessageBodyLoader)messageBodyLoader
{
  return self->_messageBodyLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBodyLoader, 0);
  objc_storeStrong((id *)&self->_deviceStorage, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end