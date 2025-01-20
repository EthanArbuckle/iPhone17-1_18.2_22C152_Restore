@interface ACRemoteDeviceMessage
+ (id)_whitelistedClasses;
+ (id)actionMessageWithCommand:(id)a3 account:(id)a4 options:(id)a5;
+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 result:(id)a5 error:(id)a6;
- (ACAccount)account;
- (ACRemoteDeviceMessage)init;
- (ACRemoteDeviceMessage)initWithData:(id)a3;
- (BOOL)isReply;
- (BOOL)needsReply;
- (BOOL)success;
- (NSData)data;
- (NSDictionary)options;
- (NSError)error;
- (NSSecureCoding)result;
- (NSString)command;
- (NSString)identifier;
- (NSString)sentMessageIdentifier;
- (id)_payloadObjectForKey:(id)a3;
- (id)description;
- (void)_invalidateCachedData;
- (void)_setPayloadObject:(id)a3 forKey:(id)a4;
- (void)setIsReply:(BOOL)a3;
- (void)setNeedsReply:(BOOL)a3;
@end

@implementation ACRemoteDeviceMessage

+ (id)_whitelistedClasses
{
  if (_whitelistedClasses_onceToken != -1) {
    dispatch_once(&_whitelistedClasses_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_whitelistedClasses_whitelistedClasses;

  return v2;
}

uint64_t __44__ACRemoteDeviceMessage__whitelistedClasses__block_invoke()
{
  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  _whitelistedClasses_whitelistedClasses = objc_msgSend(v12, "setWithObjects:", v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (ACRemoteDeviceMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACRemoteDeviceMessage;
  uint64_t v2 = [(ACRemoteDeviceMessage *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (ACRemoteDeviceMessage)initWithData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"ACRemoteDeviceMessage.m" lineNumber:62 description:@"No data was provided to initalize ACRemoteDeviceMessage!"];
  }
  v25.receiver = self;
  v25.super_class = (Class)ACRemoteDeviceMessage;
  uint64_t v6 = [(ACRemoteDeviceMessage *)&v25 init];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = [v5 copy];
  data = v6->_data;
  v6->_data = (NSData *)v7;

  uint64_t v9 = (void *)MEMORY[0x263F08928];
  v10 = +[ACRemoteDeviceMessage _whitelistedClasses];
  id v24 = 0;
  uint64_t v11 = [v9 unarchivedObjectOfClasses:v10 fromData:v5 error:&v24];
  id v12 = v24;

  if (v11)
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:@"idn"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    v15 = [v11 objectForKeyedSubscript:@"pld"];
    uint64_t v16 = [v15 mutableCopy];
    payload = v6->_payload;
    v6->_payload = (NSMutableDictionary *)v16;

    v18 = [v11 objectForKeyedSubscript:@"nrp"];
    v6->_needsReply = [v18 BOOLValue];

    v19 = [v11 objectForKeyedSubscript:@"irp"];
    v6->_isReply = [v19 BOOLValue];

LABEL_6:
    v20 = v6;
    goto LABEL_10;
  }
  v21 = _ACLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[ACRemoteDeviceMessage initWithData:]((uint64_t)v12, v21);
  }

  v20 = 0;
LABEL_10:

  return v20;
}

- (void)_setPayloadObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  payload = self->_payload;
  if (!payload)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
  }
  [(NSMutableDictionary *)payload setValue:v10 forKey:v6];
  [(ACRemoteDeviceMessage *)self _invalidateCachedData];
}

- (id)_payloadObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_payload objectForKeyedSubscript:a3];
}

- (void)setNeedsReply:(BOOL)a3
{
  if (self->_needsReply != a3)
  {
    self->_needsReply = a3;
    [(ACRemoteDeviceMessage *)self _invalidateCachedData];
  }
}

- (void)setIsReply:(BOOL)a3
{
  if (self->_isReply != a3)
  {
    self->_isReply = a3;
    [(ACRemoteDeviceMessage *)self _invalidateCachedData];
  }
}

- (void)_invalidateCachedData
{
  self->_data = 0;
  MEMORY[0x270F9A758]();
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v5 = v4;
    payload = self->_payload;
    if (payload) {
      [v4 setObject:payload forKeyedSubscript:@"pld"];
    }
    identifier = self->_identifier;
    if (identifier) {
      [v5 setObject:identifier forKeyedSubscript:@"idn"];
    }
    uint64_t v8 = [NSNumber numberWithBool:self->_needsReply];
    [v5 setObject:v8 forKeyedSubscript:@"nrp"];

    uint64_t v9 = [NSNumber numberWithBool:self->_isReply];
    [v5 setObject:v9 forKeyedSubscript:@"irp"];

    id v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    uint64_t v11 = self->_data;
    self->_data = v10;

    data = self->_data;
  }

  return data;
}

- (id)description
{
  if (self->_isReply)
  {
    BOOL v3 = [(ACRemoteDeviceMessage *)self success];
    id v4 = @"FAIL ";
    if (v3) {
      id v4 = @"SUCCESS";
    }
    id v5 = v4;
    id v6 = [(ACRemoteDeviceMessage *)self error];
    if (v6)
    {
      uint64_t v7 = [(ACRemoteDeviceMessage *)self error];
      uint64_t v8 = [v7 description];
    }
    else
    {
      uint64_t v8 = &stru_26C990120;
    }

    v14 = [NSString stringWithFormat:@"%@%@", v5, v8];

    v17 = NSString;
    v15 = [(ACRemoteDeviceMessage *)self sentMessageIdentifier];
    uint64_t v16 = [v17 stringWithFormat:@"{Reply to %@: %@}", v15, v14];
  }
  else
  {
    BOOL v9 = [(ACRemoteDeviceMessage *)self needsReply];
    id v10 = &stru_26C990120;
    if (v9) {
      id v10 = @"(RSVP!) ";
    }
    uint64_t v11 = NSString;
    identifier = self->_identifier;
    uint64_t v13 = v10;
    uint64_t v8 = [(ACRemoteDeviceMessage *)self command];
    v14 = [(ACRemoteDeviceMessage *)self account];
    v15 = [v14 identifier];
    uint64_t v16 = [v11 stringWithFormat:@"{%@Internal ID: %@. Command: %@. Account ID: %@.}", v13, identifier, v8, v15];
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)needsReply
{
  return self->_needsReply;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)actionMessageWithCommand:(id)a3 account:(id)a4 options:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"ACRemoteDeviceMessage.m" lineNumber:162 description:@"No command was provided to initialize action ACRemoteDeviceMessage!"];
  }
  id v12 = objc_alloc_init(ACRemoteDeviceMessage);
  [v10 _loadAllCachedProperties];
  [(ACRemoteDeviceMessage *)v12 _setPayloadObject:v9 forKey:@"cmd"];
  uint64_t v13 = _ACDLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v10 internalCredential];
    int v17 = 138413058;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    v22 = v15;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_debug_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEBUG, "@\"Creating action message with command '%@', account '%@ [credential:%@]', options '%@'\"", (uint8_t *)&v17, 0x2Au);
  }
  if (v10) {
    [(ACRemoteDeviceMessage *)v12 _setPayloadObject:v10 forKey:@"acc"];
  }
  if (v11) {
    [(ACRemoteDeviceMessage *)v12 _setPayloadObject:v11 forKey:@"opt"];
  }

  return v12;
}

- (NSString)command
{
  return (NSString *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"cmd"];
}

- (ACAccount)account
{
  return (ACAccount *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"acc"];
}

- (NSDictionary)options
{
  return (NSDictionary *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"opt"];
}

+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 result:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"ACRemoteDeviceMessage.m" lineNumber:204 description:@"No message was provided to initalize reply ACRemoteDeviceMessage!"];
  }
  v14 = objc_alloc_init(ACRemoteDeviceMessage);
  [(ACRemoteDeviceMessage *)v14 setIsReply:1];
  v15 = [NSNumber numberWithBool:v8];
  [(ACRemoteDeviceMessage *)v14 _setPayloadObject:v15 forKey:@"suc"];

  [(ACRemoteDeviceMessage *)v14 _setPayloadObject:v13 forKey:@"err"];
  uint64_t v16 = [v11 identifier];
  [(ACRemoteDeviceMessage *)v14 _setPayloadObject:v16 forKey:@"sid"];

  if (v12) {
    [(ACRemoteDeviceMessage *)v14 _setPayloadObject:v12 forKey:@"res"];
  }

  return v14;
}

+ (id)replyForMessage:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  return (id)[a1 replyForMessage:a3 withSuccess:a4 result:0 error:a5];
}

- (NSString)sentMessageIdentifier
{
  return (NSString *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"sid"];
}

- (BOOL)success
{
  uint64_t v2 = [(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"suc"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSError)error
{
  return (NSError *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"err"];
}

- (NSSecureCoding)result
{
  return (NSSecureCoding *)[(ACRemoteDeviceMessage *)self _payloadObjectForKey:@"res"];
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to decode message data, error: %@\"", (uint8_t *)&v2, 0xCu);
}

@end