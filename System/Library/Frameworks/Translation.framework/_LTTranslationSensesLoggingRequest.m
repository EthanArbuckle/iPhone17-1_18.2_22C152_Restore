@interface _LTTranslationSensesLoggingRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)senses;
- (NSArray)userInteractedSenses;
- (NSString)conversationID;
- (NSString)requestID;
- (_LTTranslationSensesLoggingRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setSenses:(id)a3;
- (void)setUserInteractedSenses:(id)a3;
@end

@implementation _LTTranslationSensesLoggingRequest

- (void)encodeWithCoder:(id)a3
{
  conversationID = self->_conversationID;
  id v5 = a3;
  [v5 encodeObject:conversationID forKey:@"conversationID"];
  [v5 encodeObject:self->_requestID forKey:@"requestID"];
  [v5 encodeObject:self->_senses forKey:@"senses"];
  [v5 encodeObject:self->_userInteractedSenses forKey:@"userInteractedSenses"];
}

- (_LTTranslationSensesLoggingRequest)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_LTTranslationSensesLoggingRequest;
  id v5 = [(_LTTranslationSensesLoggingRequest *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationID"];
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"senses"];
    senses = v5->_senses;
    v5->_senses = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v12 forKey:@"userInteractedSenses"];
    userInteractedSenses = v5->_userInteractedSenses;
    v5->_userInteractedSenses = (NSArray *)v15;

    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSArray)senses
{
  return self->_senses;
}

- (void)setSenses:(id)a3
{
}

- (NSArray)userInteractedSenses
{
  return self->_userInteractedSenses;
}

- (void)setUserInteractedSenses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractedSenses, 0);
  objc_storeStrong((id *)&self->_senses, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_conversationID, 0);
}

@end