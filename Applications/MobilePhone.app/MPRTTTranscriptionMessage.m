@interface MPRTTTranscriptionMessage
- (MPRTTTranscriptionMessage)initWithCallUUID:(id)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (RTTConversation)conversation;
- (double)confidence;
- (id)makeTranscriptMessage;
- (unint64_t)confidenceRating;
- (void)fetchRTTConversationForCallUUID:(id)a3;
- (void)setConversation:(id)a3;
@end

@implementation MPRTTTranscriptionMessage

- (MPRTTTranscriptionMessage)initWithCallUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPRTTTranscriptionMessage;
  v5 = [(MPRTTTranscriptionMessage *)&v10 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobilephone.rttConversations", v6);
    rttConversationsQueue = v5->_rttConversationsQueue;
    v5->_rttConversationsQueue = (OS_dispatch_queue *)v7;

    [(MPRTTTranscriptionMessage *)v5 fetchRTTConversationForCallUUID:v4];
  }

  return v5;
}

- (void)fetchRTTConversationForCallUUID:(id)a3
{
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting fetchRTTConversationForCallUUID", (uint8_t *)buf, 2u);
  }

  id v6 = RTTUIUtilitiesClass();
  if (v6)
  {
    dispatch_queue_t v7 = v6;
    objc_initWeak(buf, self);
    rttConversationsQueue = self->_rttConversationsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __61__MPRTTTranscriptionMessage_fetchRTTConversationForCallUUID___block_invoke;
    block[3] = &unk_10027DF90;
    objc_copyWeak(v12, buf);
    v12[1] = v7;
    id v11 = v4;
    dispatch_async(rttConversationsQueue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(buf);
  }
  else
  {
    v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because we could not find RTTUIUtilities", (uint8_t *)buf, 2u);
    }
  }
}

void __61__MPRTTTranscriptionMessage_fetchRTTConversationForCallUUID___block_invoke(id *a1)
{
  v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    id v4 = [a1[6] sharedUtilityProvider];
    v5 = [a1[4] UUIDString];
    id v6 = [v4 conversationForCallUID:v5];

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __61__MPRTTTranscriptionMessage_fetchRTTConversationForCallUUID___block_invoke_41;
      block[3] = &unk_10027D448;
      objc_copyWeak(&v10, v2);
      id v6 = v6;
      v8 = v6;
      id v9 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    id v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void __61__MPRTTTranscriptionMessage_fetchRTTConversationForCallUUID___block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setConversation:*(void *)(a1 + 32)];
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v8, 2u);
    }

    v5 = +[NSNotificationCenter defaultCenter];
    CFStringRef v9 = @"MPVoicemailRTTTranscriptDidLoadCallIDKey";
    id v6 = [*(id *)(a1 + 40) UUIDString];
    id v10 = v6;
    dispatch_queue_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"MPVoicemailRTTTranscriptDidLoadNotification" object:0 userInfo:v7];
  }
  else
  {
    v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v8, 2u);
    }
  }
}

- (id)makeTranscriptMessage
{
  if (self->_conversation)
  {
    id v3 = +[NSMutableString string];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [(RTTConversation *)self->_conversation utterances];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          CFStringRef v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v9 isMe] & 1) == 0)
          {
            id v10 = [v9 text];
            if ([v9 isTranscription])
            {
              id v11 = ttyLocString();
              v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, &stru_100285990);

              uint64_t v13 = [v10 stringByReplacingOccurrencesOfString:v12 withString:&stru_100285990];

              id v10 = (void *)v13;
            }
            if ([(__CFString *)v3 length]) {
              [(__CFString *)v3 appendString:@" "];
            }
            [(__CFString *)v3 appendString:v10];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = &stru_100285990;
  }

  return v3;
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_storeStrong((id *)&self->_rttConversationsQueue, 0);
}

- (NSAttributedString)attributedText
{
  v2 = self;
  id v3 = [(MPRTTTranscriptionMessage *)v2 text];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v4 = objc_allocWithZone((Class)NSAttributedString);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithString:v5];

  return (NSAttributedString *)v6;
}

- (NSString)text
{
  v2 = self;
  id v3 = [(MPRTTTranscriptionMessage *)v2 makeTranscriptMessage];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (unint64_t)confidenceRating
{
  return 0;
}

- (double)confidence
{
  return 1.0;
}

@end