@interface APSMessageStore
+ (id)sharedInstance;
- (APSMessageStore)init;
- (id)_onQueueIncomingMessagesFromRecords:(__CFArray *)a3;
- (id)_onQueueSubscribedChannelsForRecord:(_APSChannelRecordStruct *)a3;
- (id)_onQueueSubscribedChannelsForRecords:(__CFArray *)a3;
- (id)allRegisteredChannels;
- (id)allRegisteredChannelsForEnvironment:(id)a3 userName:(id)a4;
- (id)allRegisteredChannelsForTopic:(id)a3 environment:(id)a4 userName:(id)a5;
- (id)incomingHighPriorityMessagesForEnvironment:(id)a3 pushTokens:(id)a4;
- (id)incomingMessagesForTopic:(id)a3 priority:(int64_t)a4 environment:(id)a5 pushTokens:(id)a6;
- (id)lookupChannelWithChannelID:(id)a3 andPushTopic:(id)a4 environment:(id)a5 userName:(id)a6;
- (id)pendingLowPriorityIncomingMessageTopicsForEnvironment:(id)a3 pushTokens:(id)a4;
- (id)storeOutgoingMessage:(id)a3 environment:(id)a4;
- (void)__closeDatabase;
- (void)_clearDatabaseCloseTimer;
- (void)_onQueueDeleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5;
- (void)_setDatabaseCloseTimer;
- (void)closeDatabase;
- (void)deleteChannelID:(id)a3 forTopic:(id)a4 environment:(id)a5 userName:(id)a6;
- (void)deleteIncomingMessageWithGUID:(id)a3;
- (void)deleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5;
- (void)deleteOutgoingMessageWithGUID:(id)a3;
- (void)deleteStaleIncomingLowPriorityMessagesForEnvironment:(id)a3;
- (void)markAllOutgoingMessagesAsUnsent;
- (void)markMessageWithGUID:(id)a3 asSent:(BOOL)a4;
- (void)openDatabase;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
- (void)storeChannel:(id)a3;
- (void)storeIncomingMessage:(id)a3 environment:(id)a4 completionBlock:(id)a5;
- (void)updateChannel:(id)a3;
@end

@implementation APSMessageStore

+ (id)sharedInstance
{
  if (qword_10015A988 != -1) {
    dispatch_once(&qword_10015A988, &stru_10012BF30);
  }
  v2 = (void *)qword_10015A990;
  return v2;
}

- (APSMessageStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)APSMessageStore;
  v2 = [(APSMessageStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(APSMessageStore *)v2 performBlock:&stru_10012BF50];
  }
  return v3;
}

- (void)__closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008E6A4;
  v2[3] = &unk_10012A5E0;
  v2[4] = self;
  sub_1000A6854(v2);
}

- (void)_clearDatabaseCloseTimer
{
  if (self->_pendingDatabaseClose)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__closeDatabase" object:0];
    self->_pendingDatabaseClose = 0;
  }
}

- (void)_setDatabaseCloseTimer
{
  if (self->_pendingDatabaseClose) {
    [(APSMessageStore *)self _clearDatabaseCloseTimer];
  }
  self->_pendingDatabaseClose = 1;
  [(APSMessageStore *)self performSelector:"__closeDatabase" withObject:0 afterDelay:600.0];
}

- (void)closeDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E884;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)openDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E914;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008E9D8;
    v6[3] = &unk_10012BE30;
    v6[4] = self;
    id v7 = v4;
    sub_1000A6854(v6);
  }
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008EB20;
    v7[3] = &unk_10012BE30;
    v7[4] = self;
    id v8 = v5;
    sub_1000A68C8(v7);
  }
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008EC68;
    v7[3] = &unk_10012BE30;
    v7[4] = self;
    id v8 = v5;
    sub_1000A6854(v7);
  }
}

- (void)storeIncomingMessage:(id)a3 environment:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = sub_100091740();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to store incoming message %@ with guid %@ environment %@", buf, 0x2Au);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008EEB4;
  v15[3] = &unk_10012B7C0;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v8;
  [(APSMessageStore *)self performBlock:v15 waitUntilDone:1];
  v10[2](v10, v12);
}

- (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008F154;
    v6[3] = &unk_10012A5E0;
    id v7 = v4;
    [(APSMessageStore *)self performBlock:v6];
  }
}

- (void)_onQueueDeleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 name];
    *(_DWORD *)buf = 138412802;
    id v23 = self;
    __int16 v24 = 2112;
    v25 = v8;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ deleting older low-priority incoming messages for topic %@ environment %@ if needed to maintain queue of one", buf, 0x20u);
  }
  sub_1000A6804();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        sub_1000AB35C(v8, 1, (const __CFString *)objc_msgSend(v9, "name", (void)v17), *(void *)(*((void *)&v17 + 1) + 8 * (void)v16));
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)deleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F3F4;
    v11[3] = &unk_10012B7C0;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(APSMessageStore *)self performBlock:v11];
  }
}

- (void)deleteStaleIncomingLowPriorityMessagesForEnvironment:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008F498;
  v5[3] = &unk_10012A5E0;
  id v6 = a3;
  id v4 = v6;
  [(APSMessageStore *)self performBlock:v5];
}

- (id)pendingLowPriorityIncomingMessageTopicsForEnvironment:(id)a3 pushTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_10008F668;
  long long v18 = sub_10008F678;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008F680;
    v10[3] = &unk_10012BF98;
    id v11 = v7;
    id v12 = v6;
    id v13 = &v14;
    [(APSMessageStore *)self performBlock:v10 waitUntilDone:1];
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)_onQueueIncomingMessagesFromRecords:(__CFArray *)a3
{
  if (a3 && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    uint64_t v5 = Count;
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:CFArrayGetCount(a3)];
    if (v5 >= 1)
    {
      for (CFIndex i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        CFTypeRef v27 = 0;
        CFTypeRef v28 = 0;
        uint64_t v26 = 0;
        CFTypeRef v24 = 0;
        CFTypeRef cf = 0;
        CFTypeRef v23 = 0;
        __int16 v22 = 0;
        unsigned __int8 v21 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unsigned int v16 = 0;
        sub_1000AC054((uint64_t)ValueAtIndex, 0, (uint64_t)&v28, (uint64_t)&cf, (uint64_t)&v27, 0, (uint64_t)&v26, (uint64_t)&v23, (uint64_t)&v22 + 1, (uint64_t)&v22, (uint64_t)&v20, (uint64_t)&v19, (uint64_t)&v18, (uint64_t)&v21, (uint64_t)&v24, (uint64_t)&v17, (uint64_t)&v16);
        id v10 = APSDecodeDictionary();
        if (v10 && v27)
        {
          id v11 = [APSIncomingMessage alloc];
          id v12 = [(APSIncomingMessage *)v11 initWithTopic:v27 userInfo:v10];
          [(APSIncomingMessage *)v12 setToken:cf];
          [(APSIncomingMessage *)v12 setCorrelationIdentifier:v26];
          [(APSIncomingMessage *)v12 setFromStorage:HIBYTE(v22)];
          [(APSIncomingMessage *)v12 setLastMessageFromStorage:v22];
          [(APSIncomingMessage *)v12 setIdentifier:v20];
          [(APSIncomingMessage *)v12 setPriority:v19];
          id v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v18];
          [(APSIncomingMessage *)v12 setTimestamp:v13];

          [(APSIncomingMessage *)v12 setTracingEnabled:v21];
          [(APSIncomingMessage *)v12 setTracingUUID:v24];
          [(APSIncomingMessage *)v12 setPushType:v17];
          [(APSIncomingMessage *)v12 setPushFlags:v16];
          if (v28) {
            -[APSIncomingMessage setGuid:](v12, "setGuid:");
          }
          [v6 addObject:v12];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v30 = self;
          __int16 v31 = 2112;
          v32 = v10;
          __int16 v33 = 2112;
          CFTypeRef v34 = v27;
          __int16 v35 = 2112;
          CFTypeRef v36 = v23;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ could not create userInfo %@ or topic %@ from payload %@", buf, 0x2Au);
        }
        if (v28) {
          CFRelease(v28);
        }
        if (v27) {
          CFRelease(v27);
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v23) {
          CFRelease(v23);
        }
        if (v24) {
          CFRelease(v24);
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)incomingMessagesForTopic:(id)a3 priority:(int64_t)a4 environment:(id)a5 pushTokens:(id)a6
{
  id v21 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = sub_10008F668;
  CFTypeRef v36 = sub_10008F678;
  id v37 = 0;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  if (v10)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008FD84;
    v26[3] = &unk_10012BFC0;
    int64_t v31 = a4;
    id v27 = v21;
    v29 = self;
    v30 = &v32;
    id v28 = v10;
    [(APSMessageStore *)self performBlock:v26 waitUntilDone:1];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = (id)v33[5];
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (CFIndex i = 0; i != v14; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (v11)
        {
          uint64_t v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) token];
          unsigned int v19 = [v11 containsObject:v18];

          if (!v19) {
            continue;
          }
        }
        [v12 addObject:v17];
      }
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v38 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v32, 8);
  return v12;
}

- (id)incomingHighPriorityMessagesForEnvironment:(id)a3 pushTokens:(id)a4
{
  return [(APSMessageStore *)self incomingMessagesForTopic:0 priority:10 environment:a3 pushTokens:a4];
}

- (id)storeOutgoingMessage:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100091740();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    long long v24 = v8;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to store outgoing message %@ with guid %@ environment %@", buf, 0x2Au);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008FFBC;
  v15[3] = &unk_100129B68;
  id v16 = v6;
  id v9 = v8;
  id v17 = v9;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  [(APSMessageStore *)self performBlock:v15];
  id v12 = v18;
  id v13 = v9;

  return v13;
}

- (void)deleteOutgoingMessageWithGUID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Removing outgoing message with guid %@", buf, 0x16u);
  }
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000902C8;
    v5[3] = &unk_10012A5E0;
    id v6 = v4;
    [(APSMessageStore *)self performBlock:v5];
  }
}

- (void)markMessageWithGUID:(id)a3 asSent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    id v14 = v6;
    __int16 v15 = 2112;
    CFStringRef v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ markMessageWithGUID: %@ asSent: %@", buf, 0x20u);
  }
  if ([v6 length])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100090424;
    v8[3] = &unk_10012BE08;
    id v9 = v6;
    BOOL v10 = v4;
    [(APSMessageStore *)self performBlock:v8];
  }
}

- (void)markAllOutgoingMessagesAsUnsent
{
}

- (void)storeChannel:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ asked to store global channel %@", buf, 0x16u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000905DC;
  v6[3] = &unk_10012A5E0;
  id v7 = v4;
  id v5 = v4;
  [(APSMessageStore *)self performBlock:v6 waitUntilDone:1];
}

- (void)deleteChannelID:(id)a3 forTopic:(id)a4 environment:(id)a5 userName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    long long v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Removing channelID %@ channelTopic %@ environment %@ tokenName %@", buf, 0x34u);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000908BC;
  v18[3] = &unk_10012B7C0;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(APSMessageStore *)self performBlock:v18 waitUntilDone:1];
}

- (void)updateChannel:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    id v4 = [v8 channelID];
    id v5 = [v8 channelTopic];
    id v6 = [v8 environment];
    id v7 = [v8 tokenName];
    [(APSMessageStore *)self deleteChannelID:v4 forTopic:v5 environment:v6 userName:v7];

    [(APSMessageStore *)self storeChannel:v8];
  }
}

- (id)lookupChannelWithChannelID:(id)a3 andPushTopic:(id)a4 environment:(id)a5 userName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v12;
    __int16 v42 = 2112;
    id v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Looking for a channel subscription with channelID %@ push topic %@ environment %@ userName %@", buf, 0x34u);
  }
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = sub_10008F668;
  id v32 = sub_10008F678;
  id v33 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100090C70;
  v21[3] = &unk_10012C008;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  id v17 = v13;
  id v26 = self;
  __int16 v27 = &v28;
  id v25 = v17;
  [(APSMessageStore *)self performBlock:v21 waitUntilDone:1];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)v29[5];
    *(_DWORD *)buf = 138413570;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v14;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2112;
    id v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Found channel %@ for chanelID %@ push topic %@ environment %@ userName %@", buf, 0x3Eu);
  }
  id v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (id)allRegisteredChannelsForTopic:(id)a3 environment:(id)a4 userName:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v30 = v9;
    LOWORD(v31) = 2112;
    *(void *)((char *)&v31 + 2) = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Getting channels for topic %@ environment %@ userName %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v30 = sub_10008F668;
  *(void *)&long long v31 = sub_10008F678;
  *((void *)&v31 + 1) = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100090F74;
  v17[3] = &unk_10012C030;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v21 = self;
  id v22 = buf;
  id v20 = v13;
  [(APSMessageStore *)self performBlock:v17 waitUntilDone:1];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)id v23 = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Found channels for topic %@: %@", v23, 0x20u);
  }
  id v15 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v15;
}

- (id)allRegisteredChannelsForEnvironment:(id)a3 userName:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Getting all pubsub subscriptions for environment %@ userName %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v18 = sub_10008F668;
  id v19 = sub_10008F678;
  id v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000911D8;
  v12[3] = &unk_10012C058;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v15 = self;
  id v16 = buf;
  uint64_t v14 = v9;
  [(APSMessageStore *)self performBlock:v12 waitUntilDone:1];
  id v10 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

- (id)allRegisteredChannels
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Getting all pubsub subscriptions", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10008F668;
  id v9 = sub_10008F678;
  id v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000913DC;
  v5[3] = &unk_10012C080;
  void v5[4] = self;
  v5[5] = &buf;
  [(APSMessageStore *)self performBlock:v5 waitUntilDone:1];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v3;
}

- (id)_onQueueSubscribedChannelsForRecord:(_APSChannelRecordStruct *)a3
{
  if (a3)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    Mutable = CFArrayCreateMutable(Default, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, a3);
    uint64_t v7 = [(APSMessageStore *)self _onQueueSubscribedChannelsForRecords:Mutable];
    id v8 = [v7 firstObject];
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_onQueueSubscribedChannelsForRecords:(__CFArray *)a3
{
  if (a3 && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    uint64_t v5 = Count;
    id v23 = +[NSMutableArray arrayWithCapacity:Count];
    if (v5 >= 1)
    {
      for (CFIndex i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        CFTypeRef cf = 0;
        CFTypeRef v28 = 0;
        CFTypeRef v25 = 0;
        CFTypeRef v26 = 0;
        CFTypeRef v24 = 0;
        sub_10000A66C((uint64_t)ValueAtIndex, (uint64_t)&cf, (uint64_t)&v28, (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24);
        id v9 = (void *)cf;
        id v10 = (void *)v28;
        if (v28) {
          BOOL v11 = cf == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11 || v24 == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v30 = self;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ could not create PKGlobalChannel from mesage store", buf, 0xCu);
          }
        }
        else
        {
          id v13 = (void *)v25;
          uint64_t v14 = (void *)v26;
          id v15 = (id)v24;
          id v16 = v13;
          id v17 = v14;
          id v18 = v10;
          id v19 = v9;
          id v20 = objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", v19, v18, v17, v16, objc_msgSend(v15, "unsignedLongLongValue"));

          [v23 addObject:v20];
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v28) {
          CFRelease(v28);
        }
        if (v26) {
          CFRelease(v26);
        }
        if (v25) {
          CFRelease(v25);
        }
        if (v24) {
          CFRelease(v24);
        }
      }
    }
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

@end