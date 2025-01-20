@interface IDSMMLMessage
- (BOOL)addAggregateMessage:(id)a3;
- (BOOL)expectingMoreResponses;
- (BOOL)hasSpaceForAggregateMessage:(id)a3;
- (BOOL)isMMLMessage;
- (BOOL)wantsMultipleResponses;
- (BOOL)wantsResponse;
- (BOOL)wantsUserAgentInHeaders;
- (IDSMMLMessage)initWithSendMode:(id)a3 topic:(id)a4 maxSize:(unint64_t)a5;
- (NSMutableOrderedSet)aggregateMessages;
- (NSNumber)chunkNumber;
- (NSNumber)sendMode;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)currentSize;
- (int64_t)maxSize;
- (void)noteResponseForToken:(id)a3;
- (void)setAggregateMessages:(id)a3;
- (void)setChunkNumber:(id)a3;
- (void)setCurrentSize:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaxSize:(int64_t)a3;
- (void)setSendMode:(id)a3;
@end

@implementation IDSMMLMessage

- (IDSMMLMessage)initWithSendMode:(id)a3 topic:(id)a4 maxSize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSMMLMessage;
  v10 = [(IDSMMLMessage *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(IDSMMLMessage *)v10 setSendMode:v8];
    [(IDSMMLMessage *)v11 setTopic:v9];
    [(IDSMMLMessage *)v11 setMaxSize:a5];
  }

  return v11;
}

- (BOOL)hasSpaceForAggregateMessage:(id)a3
{
  int64_t currentSize = self->_currentSize;
  return (unint64_t)[a3 sizeOfKeysWithValues] + currentSize <= self->_maxSize;
}

- (BOOL)addAggregateMessage:(id)a3
{
  id v4 = a3;
  aggregateMessages = self->_aggregateMessages;
  if (!aggregateMessages)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v7 = self->_aggregateMessages;
    self->_aggregateMessages = v6;

    aggregateMessages = self->_aggregateMessages;
  }
  [(NSMutableOrderedSet *)aggregateMessages addObject:v4];
  int64_t currentSize = self->_currentSize;
  self->_int64_t currentSize = (int64_t)[v4 sizeOfKeysWithValues] + currentSize;

  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IDSMMLMessage;
  id v4 = [(IDSMMLMessage *)&v10 copyWithZone:a3];
  v5 = [(IDSMMLMessage *)self sendMode];
  [v4 setSendMode:v5];

  objc_msgSend(v4, "setMaxSize:", -[IDSMMLMessage maxSize](self, "maxSize"));
  objc_msgSend(v4, "setCurrentSize:", -[IDSMMLMessage currentSize](self, "currentSize"));
  v6 = [(IDSMMLMessage *)self chunkNumber];
  [v4 setChunkNumber:v6];

  v7 = [(IDSMMLMessage *)self identifier];
  [v4 setIdentifier:v7];

  id v8 = [(IDSMMLMessage *)self aggregateMessages];
  [v4 setAggregateMessages:v8];

  return v4;
}

- (int64_t)command
{
  return 254;
}

- (BOOL)wantsUserAgentInHeaders
{
  return 0;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (BOOL)wantsMultipleResponses
{
  return 1;
}

- (BOOL)isMMLMessage
{
  return 1;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  v18.receiver = self;
  v18.super_class = (Class)IDSMMLMessage;
  v3 = [(IDSMMLMessage *)&v18 messageBody];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_aggregateMessages;
  id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "messageBody", (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = [(IDSMMLMessage *)self sendMode];
  if (v12) {
    CFDictionarySetValue(v4, IDSDeliverySendModeKey, v12);
  }

  if (v5) {
    CFDictionarySetValue(v4, IDSMadridMessageListKey, v5);
  }

  return v4;
}

- (void)noteResponseForToken:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_aggregateMessages;
  id v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "noteResponseForToken:", v4, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)expectingMoreResponses
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_aggregateMessages;
  id v3 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "expectingMoreResponses", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (NSMutableOrderedSet)aggregateMessages
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAggregateMessages:(id)a3
{
}

- (NSNumber)sendMode
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSendMode:(id)a3
{
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(int64_t)a3
{
  self->_int64_t currentSize = a3;
}

- (NSNumber)chunkNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setChunkNumber:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkNumber, 0);
  objc_storeStrong((id *)&self->_sendMode, 0);

  objc_storeStrong((id *)&self->_aggregateMessages, 0);
}

@end