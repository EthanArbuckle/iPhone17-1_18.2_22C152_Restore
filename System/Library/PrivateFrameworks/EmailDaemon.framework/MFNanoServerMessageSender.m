@interface MFNanoServerMessageSender
- (MFNanoServerMessageSender)init;
- (id)_libraryMessageForMessageId:(id)a3;
- (id)_messageToSendWithCompositionContext:(id)a3;
- (id)_sendComposedMessage:(id)a3;
- (void)_didReceiveMessageDeliveryNotification:(id)a3;
- (void)sendMessage:(id)a3 progressHandler:(id)a4;
@end

@implementation MFNanoServerMessageSender

- (MFNanoServerMessageSender)init
{
  v17.receiver = self;
  v17.super_class = (Class)MFNanoServerMessageSender;
  v2 = [(MFNanoServerMessageSender *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MFNanoServerMessageSender", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    messagesDeliveredSemaphore = v2->_messagesDeliveredSemaphore;
    v2->_messagesDeliveredSemaphore = (OS_dispatch_semaphore *)v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingMessageReferences = v2->_pendingMessageReferences;
    v2->_pendingMessageReferences = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sentMessageReferences = v2->_sentMessageReferences;
    v2->_sentMessageReferences = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingDelegateReferences = v2->_pendingDelegateReferences;
    v2->_pendingDelegateReferences = v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"_didReceiveMessageDeliveryNotification:" name:@"MFDeliveryQueueProcessingFinishedNotification" object:0];
  }
  return v2;
}

- (void)sendMessage:(id)a3 progressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096D10;
  block[3] = &unk_10013D558;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_didReceiveMessageDeliveryNotification:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"sent"];

  id v7 = [v4 userInfo];
  v8 = [v7 objectForKey:@"failed"];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100098300;
  v15[3] = &unk_10013D580;
  v15[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100098434;
  v13[3] = &unk_10013D5A8;
  id v9 = objc_retainBlock(v15);
  id v14 = v9;
  [v6 enumerateObjectsUsingBlock:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098448;
  v11[3] = &unk_10013D5A8;
  id v10 = v9;
  id v12 = v10;
  [v8 enumerateObjectsUsingBlock:v11];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_messagesDeliveredSemaphore);
}

- (id)_sendComposedMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[MailAccount accountThatMessageIsFrom:v3 includingInactive:1];
  if ([v4 restrictedFromSendingExternally])
  {
    dispatch_queue_t v5 = 0;
  }
  else
  {
    [v3 markAsViewed];
    id v6 = +[MFDeliveryQueue sharedDeliveryQueue];
    id v7 = [v6 append:v3];
    if (v7)
    {
      [v6 processQueueAndPlaySoundOnSuccess:0 forceAll:0];
      v8 = [(objc_class *)off_10016AC98() defaultInstance];
      id v9 = [v3 headers];
      [v8 recordContactEventsForHeaders:v9 recentsDomain:kMFMobileMailBundleIdentifier];

      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@://%lld", @"x-last-sent-message", [v7 libraryID]);
      dispatch_queue_t v5 = +[NSURL URLWithString:v10];
    }
    else
    {
      dispatch_queue_t v5 = 0;
    }
  }

  return v5;
}

- (id)_messageToSendWithCompositionContext:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10009761C;
  v13 = sub_10009762C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100098740;
  v6[3] = &unk_10013D5D0;
  id v7 = a3;
  v8 = &v9;
  id v3 = v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)_libraryMessageForMessageId:(id)a3
{
  id v3 = +[NSURL URLWithString:a3];
  id v4 = objc_msgSend(v3, "mf_messageCriterion");
  dispatch_queue_t v5 = +[MFMailMessageLibrary defaultInstance];
  id v6 = [v5 messagesMatchingCriterion:v4 options:6144];

  id v7 = [v6 firstObject];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDelegateReferences, 0);
  objc_storeStrong((id *)&self->_sentMessageReferences, 0);
  objc_storeStrong((id *)&self->_pendingMessageReferences, 0);
  objc_storeStrong((id *)&self->_messagesDeliveredSemaphore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end