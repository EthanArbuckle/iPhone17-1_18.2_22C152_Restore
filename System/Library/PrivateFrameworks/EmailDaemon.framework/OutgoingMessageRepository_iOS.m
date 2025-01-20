@interface OutgoingMessageRepository_iOS
+ (id)log;
+ (id)signpostLog;
- (BOOL)hasDelayedMessages;
- (EFScheduler)observationScheduler;
- (NSMutableDictionary)observers;
- (OutgoingMessageRepository_iOS)initWithMessagePersistence:(id)a3 messageChangeManager:(id)a4;
- (id)messagesForDocumentID:(id)a3 mailboxID:(id)a4;
- (id)outgoingMessageFromPersistedMessage:(id)a3;
- (id)urlForSendLaterFolder;
- (unint64_t)pendingMessages;
- (unint64_t)signpostID;
- (void)cancelLastDelayedMessage:(id)a3;
- (void)cancelObservation:(id)a3;
- (void)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5 completion:(id)a6;
- (void)hasDelayedMessagesDidChange:(BOOL)a3;
- (void)isProcessingWithCompletion:(id)a3;
- (void)numberOfPendingMessagesChanged:(unint64_t)a3;
- (void)numberOfPendingMessagesWithCompletion:(id)a3;
- (void)outboxContainsMessageFromAccountObjectID:(id)a3 completion:(id)a4;
- (void)processAllQueuedMessages;
- (void)resumeDeliveryQueue;
- (void)setHasDelayedMessages:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setPendingMessages:(unint64_t)a3;
- (void)startObservingPendingMessageChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4;
- (void)suspendDeliveryQueue;
@end

@implementation OutgoingMessageRepository_iOS

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4A5C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BE18 != -1) {
    dispatch_once(&qword_10016BE18, block);
  }
  v2 = (void *)qword_10016BE10;

  return v2;
}

+ (id)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B4B80;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BE28 != -1) {
    dispatch_once(&qword_10016BE28, block);
  }
  v2 = (void *)qword_10016BE20;

  return v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (OutgoingMessageRepository_iOS)initWithMessagePersistence:(id)a3 messageChangeManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)OutgoingMessageRepository_iOS;
  v8 = [(OutgoingMessageRepository_iOS *)&v18 initWithMessagePersistence:v6 messageChangeManager:v7];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observers = v8->_observers;
    v8->_observers = v9;

    uint64_t v11 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.MobileMail.OutgoingMessageRepository_iOS.observationScheduler"];
    observationScheduler = v8->_observationScheduler;
    v8->_observationScheduler = (EFScheduler *)v11;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v13 = v8->_observationScheduler;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B4DF0;
    v15[3] = &unk_10013A038;
    objc_copyWeak(&v16, &location);
    [(EFScheduler *)v13 performBlock:v15];
    v8->_hasDelayedMessages = 0;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)outgoingMessageFromPersistedMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)MFMutableMessageHeaders);
  v5 = [v3 headerData];
  id v6 = objc_msgSend(v4, "initWithHeaderData:encoding:", v5, objc_msgSend(v3, "preferredEncoding"));

  id v7 = +[NSDate now];
  v8 = objc_msgSend(v7, "ec_descriptionForMimeHeaders");

  [v6 setHeader:v8 forKey:ECMessageHeaderKeyDate];
  v9 = [v3 messageBody];
  v10 = [v9 rawData];

  uint64_t v11 = [v6 encodedHeaders];
  v12 = +[MFDataHolder dataHolderWithData:v11];

  if (v10) {
    [v12 addData:v10];
  }
  id v13 = objc_alloc((Class)EMOutgoingMessage);
  v14 = [v12 data];
  id v15 = [v13 initWithMessageData:v14];

  return v15;
}

- (void)deliverMessage:(id)a3 usingMailDrop:(BOOL)a4 isCancelable:(BOOL)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B5174;
  v10[3] = &unk_10013DFE0;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v11 = a3;
  id v12 = a6;
  id v8 = v12;
  id v9 = v11;
  [(OutgoingMessageRepository_iOS *)self performBlock:v10];
}

- (void)cancelLastDelayedMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B58F0;
  v5[3] = &unk_10013D240;
  id v6 = a3;
  id v4 = v6;
  [(OutgoingMessageRepository_iOS *)self performBlock:v5];
}

- (void)isProcessingWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v3 = +[MFDeliveryQueue sharedDeliveryQueue];
  v4[2](v4, [v3 isProcessing]);
}

- (id)urlForSendLaterFolder
{
  v2 = +[LocalAccount localAccount];
  id v3 = [v2 sendLaterFolder];
  id v4 = [v3 URL];

  return v4;
}

- (void)numberOfPendingMessagesWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B5B2C;
  v5[3] = &unk_10013D240;
  id v6 = a3;
  id v4 = v6;
  [(OutgoingMessageRepository_iOS *)self performBlock:v5];
}

- (void)outboxContainsMessageFromAccountObjectID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5D0C;
  v8[3] = &unk_10013AED8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(OutgoingMessageRepository_iOS *)self performBlock:v8];
}

- (void)processAllQueuedMessages
{
  v2 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Start processing queued messages for delivery.", v4, 2u);
  }

  id v3 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v3 processQueueAndPlaySoundOnSuccess:0 forceAll:1 isUserRequested:1];
}

- (void)resumeDeliveryQueue
{
  v2 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resume processing queued messages for delivery.", v4, 2u);
  }

  id v3 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v3 resume];
}

- (void)suspendDeliveryQueue
{
  v2 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Suspend processing queued messages for delivery", v4, 2u);
  }

  id v3 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v3 suspend];
}

- (id)messagesForDocumentID:(id)a3 mailboxID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 url];
  id v8 = [v7 absoluteString];
  id v9 = +[MailAccount mailboxUidFromActiveAccountsForURL:v8];

  id v10 = [v9 account];
  id v11 = [v10 storeForMailboxUid:v9];

  id v12 = +[MFMessageCriterion criterionForDocumentID:v5];
  id v13 = [v11 copyMessagesMatchingCriterion:v12 options:0];

  BOOL v14 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v13 count];
    id v16 = objc_msgSend(v6, "ef_publicDescription");
    int v18 = 134218498;
    id v19 = v15;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found %ld messages for documentID: %{public}@ in mailboxID: %{public}@", (uint8_t *)&v18, 0x20u);
  }

  return v13;
}

- (void)startObservingPendingMessageChangesWithChangeObserver:(id)a3 observationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = [(OutgoingMessageRepository_iOS *)self observationScheduler];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B6430;
  v11[3] = &unk_10013E008;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 performBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancelObservation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(OutgoingMessageRepository_iOS *)self observationScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B6604;
  v7[3] = &unk_10013DD10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)numberOfPendingMessagesChanged:(unint64_t)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(OutgoingMessageRepository_iOS *)self observationScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B6778;
  v6[3] = &unk_100139F00;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  [v5 performBlock:v6];

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(OutgoingMessageRepository_iOS *)self observationScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B6A14;
  v6[3] = &unk_10013E030;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  [v5 performBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (EFScheduler)observationScheduler
{
  return self->_observationScheduler;
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(unint64_t)a3
{
  self->_pendingMessages = a3;
}

- (BOOL)hasDelayedMessages
{
  return self->_hasDelayedMessages;
}

- (void)setHasDelayedMessages:(BOOL)a3
{
  self->_hasDelayedMessages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_observationScheduler, 0);
}

@end