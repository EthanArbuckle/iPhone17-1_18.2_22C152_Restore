@interface MTRMessagesClusterMessageStruct
- (MTRMessagesClusterMessageStruct)init;
- (NSArray)responses;
- (NSData)messageID;
- (NSNumber)duration;
- (NSNumber)messageControl;
- (NSNumber)priority;
- (NSNumber)startTime;
- (NSString)messageText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setMessageControl:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setPriority:(id)a3;
- (void)setResponses:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MTRMessagesClusterMessageStruct

- (MTRMessagesClusterMessageStruct)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRMessagesClusterMessageStruct;
  v4 = [(MTRMessagesClusterMessageStruct *)&v14 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    priority = v4->_priority;
    v4->_priority = (NSNumber *)&unk_26F9C8620;

    messageControl = v4->_messageControl;
    v4->_messageControl = (NSNumber *)&unk_26F9C8620;

    startTime = v4->_startTime;
    v4->_startTime = 0;

    duration = v4->_duration;
    v4->_duration = 0;

    messageText = v4->_messageText;
    v4->_messageText = (NSString *)&stru_26F969DC8;

    responses = v4->_responses;
    v4->_responses = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMessagesClusterMessageStruct);
  v7 = objc_msgSend_messageID(self, v5, v6);
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_priority(self, v9, v10);
  objc_msgSend_setPriority_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_messageControl(self, v13, v14);
  objc_msgSend_setMessageControl_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_startTime(self, v17, v18);
  objc_msgSend_setStartTime_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_duration(self, v21, v22);
  objc_msgSend_setDuration_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_messageText(self, v25, v26);
  objc_msgSend_setMessageText_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_responses(self, v29, v30);
  objc_msgSend_setResponses_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: messageID:%@; priority:%@; messageControl:%@; startTime:%@; duration:%@; messageText:%@; responses:%@; >",
    v5,
    v7,
    self->_priority,
    self->_messageControl,
    self->_startTime,
    self->_duration,
    self->_messageText,
  v9 = self->_responses);

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSNumber)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
}

- (NSNumber)messageControl
{
  return self->_messageControl;
}

- (void)setMessageControl:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_messageControl, 0);
  objc_storeStrong((id *)&self->_priority, 0);

  objc_storeStrong((id *)&self->_messageID, 0);
}

@end