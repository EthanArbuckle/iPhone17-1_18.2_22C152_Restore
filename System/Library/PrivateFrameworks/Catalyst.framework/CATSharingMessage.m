@interface CATSharingMessage
+ (id)instanceWithDictionary:(id)a3;
- (CATSharingMessage)initWithContentMessage:(id)a3;
- (CATSharingMessage)initWithMessageType:(int64_t)a3 contentDictionary:(id)a4;
- (NSDictionary)contentDictionaryValue;
- (NSDictionary)dictionaryValue;
- (int64_t)messageType;
@end

@implementation CATSharingMessage

- (CATSharingMessage)initWithContentMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 messageType];
  v6 = [v4 dictionaryValue];

  v7 = [(CATSharingMessage *)self initWithMessageType:v5 contentDictionary:v6];
  return v7;
}

- (CATSharingMessage)initWithMessageType:(int64_t)a3 contentDictionary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATSharingMessage;
  v7 = [(CATSharingMessage *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_messageType = a3;
    uint64_t v9 = [v6 copy];
    contentDictionaryValue = v8->_contentDictionaryValue;
    v8->_contentDictionaryValue = (NSDictionary *)v9;
  }
  return v8;
}

- (NSDictionary)dictionaryValue
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"SharingMessageType";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATSharingMessage messageType](self, "messageType"));
  v7[1] = @"SharingMessageContent";
  v8[0] = v3;
  id v4 = [(CATSharingMessage *)self contentDictionaryValue];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"SharingMessageType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 integerValue];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"SharingMessageContent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    objc_super v12 = (void *)[objc_alloc((Class)a1) initWithMessageType:v8 contentDictionary:v11];
  }
  else
  {
    if (_CATLogGeneral_onceToken_18 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_18, &__block_literal_global_27);
    }
    v13 = (void *)_CATLogGeneral_logObj_18;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_18, OS_LOG_TYPE_ERROR)) {
      +[CATSharingMessage instanceWithDictionary:(uint64_t)v4];
    }
    objc_super v12 = 0;
  }

  return v12;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSDictionary)contentDictionaryValue
{
  return self->_contentDictionaryValue;
}

- (void).cxx_destruct
{
}

+ (void)instanceWithDictionary:(uint64_t)a3 .cold.1(void *a1, objc_class *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  id v6 = NSStringFromClass(a2);
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_213B7F000, v5, OS_LOG_TYPE_ERROR, "%{public}@ is unable to decode contentDictionary from parent: %{public}@.", (uint8_t *)&v7, 0x16u);
}

@end