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
    block[2] = sub_10001CA9C;
    block[3] = &unk_10008DCB8;
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

- (id)makeTranscriptMessage
{
  if (self->_conversation)
  {
    v3 = +[NSMutableString string];
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
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v9 isMe] & 1) == 0)
          {
            objc_super v10 = [v9 text];
            if ([v9 isTranscription])
            {
              id v11 = ttyLocString();
              v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, &stru_10008F308);

              uint64_t v13 = [v10 stringByReplacingOccurrencesOfString:v12 withString:&stru_10008F308];

              objc_super v10 = (void *)v13;
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
    v3 = &stru_10008F308;
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
  v3 = [(MPRTTTranscriptionMessage *)v2 text];
  sub_100062300();

  id v4 = objc_allocWithZone((Class)NSAttributedString);
  NSString v5 = sub_1000622D0();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithString:v5];

  return (NSAttributedString *)v6;
}

- (NSString)text
{
  v2 = self;
  id v3 = [(MPRTTTranscriptionMessage *)v2 makeTranscriptMessage];
  sub_100062300();

  NSString v4 = sub_1000622D0();
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