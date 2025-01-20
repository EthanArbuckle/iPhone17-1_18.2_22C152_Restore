@interface SGTextMessageItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToConversationTurn:(id)a3;
- (NSArray)detectedData;
- (NSArray)features;
- (NSDate)timestamp;
- (NSString)language;
- (NSString)senderID;
- (NSString)text;
- (SGTextMessage)message;
- (SGTextMessageItem)initWithCoder:(id)a3;
- (SGTextMessageItem)initWithTextMessage:(id)a3;
- (SGTextMessageItem)initWithTextMessage:(id)a3 detectedData:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatures:(id)a3;
@end

@implementation SGTextMessageItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_detectedData, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)detectedData
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSString)text
{
  return self->_text;
}

- (SGTextMessage)message
{
  return (SGTextMessage *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualToConversationTurn:(id)a3
{
  v5 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SGTextMessageConversationTracker.m", 143, @"Invalid parameter not satisfying: %@", @"[otherItem isKindOfClass:[SGTextMessageItem class]]" object file lineNumber description];
  }
  text = self->_text;
  v7 = (NSString *)v5[2];
  if (text == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = text;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
  }
  senderID = self->_senderID;
  v12 = (NSString *)v5[3];
  if (senderID == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = senderID;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_9:
      char v16 = 0;
      goto LABEL_15;
    }
  }
  v17 = self->_timestamp;
  v18 = v17;
  if (v17 == v5[4]) {
    char v16 = 1;
  }
  else {
    char v16 = -[NSDate isEqual:](v17, "isEqual:");
  }

LABEL_15:
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SGTextMessageItem)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"message"];
  v6 = [v5 textContent];

  if (v6)
  {
    self = [(SGTextMessageItem *)self initWithTextMessage:v5];
    v7 = self;
  }
  else
  {
    v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_fault_impl(&dword_1CA650000, v8, OS_LOG_TYPE_FAULT, "Error decoding null message.textContent in %@:", (uint8_t *)&v10, 0xCu);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    v7 = 0;
  }

  return v7;
}

- (SGTextMessageItem)initWithTextMessage:(id)a3
{
  return [(SGTextMessageItem *)self initWithTextMessage:a3 detectedData:0];
}

- (SGTextMessageItem)initWithTextMessage:(id)a3 detectedData:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SGTextMessageItem;
  int v10 = [(SGTextMessageItem *)&v24 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_message, a3);
    uint64_t v12 = [(SGMessage *)v11->_message textContent];
    text = v11->_text;
    v11->_text = (NSString *)v12;

    if (!v11->_text)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v11, @"SGTextMessageConversationTracker.m", 110, @"Invalid parameter not satisfying: %@", @"_text" object file lineNumber description];
    }
    uint64_t v14 = [v8 conversationIdentifier];
    senderID = v11->_senderID;
    v11->_senderID = (NSString *)v14;

    uint64_t v16 = [v8 date];
    timestamp = v11->_timestamp;
    v11->_timestamp = (NSDate *)v16;

    uint64_t v18 = [MEMORY[0x1E4F89D60] detectLanguageFromText:v11->_text];
    language = v11->_language;
    v11->_language = (NSString *)v18;

    uint64_t v20 = [v9 copy];
    detectedData = v11->_detectedData;
    v11->_detectedData = (NSArray *)v20;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end