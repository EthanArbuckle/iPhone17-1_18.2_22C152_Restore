@interface ATLegacyMessage
+ (id)_messageTypeString:(unint64_t)a3;
+ (id)messageFromData:(id)a3;
+ (id)messageFromDictionary:(id)a3;
+ (id)messageFromHeader:(id)a3 withParams:(id)a4 andPayload:(id)a5;
+ (id)messageWithName:(id)a3 parameters:(id)a4;
+ (id)messageWithName:(id)a3 parameters:(id)a4 session:(unsigned int)a5;
+ (unsigned)currentSessionNumber;
+ (unsigned)nextSessionNumber;
+ (void)setSessionNumber:(unsigned int)a3;
- (ATLegacyMessage)initWithDictionary:(id)a3;
- (NSData)payload;
- (NSData)sig;
- (NSDictionary)parameters;
- (NSError)result;
- (NSString)dataClass;
- (NSString)name;
- (double)timestamp;
- (id)data;
- (id)description;
- (id)dictionary;
- (id)parameterForKey:(id)a3;
- (id)partialResponseWithParameters:(id)a3;
- (id)responseWithResultError:(id)a3 parameters:(id)a4;
- (unint64_t)messageType;
- (unsigned)messageId;
- (unsigned)sessionNumber;
- (void)setDataClass:(id)a3;
- (void)setMessageId:(unsigned int)a3;
- (void)setMessageType:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPayload:(id)a3;
- (void)setResult:(id)a3;
- (void)setSessionNumber:(unsigned int)a3;
- (void)setSig:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ATLegacyMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setSig:(id)a3
{
}

- (NSData)sig
{
  return self->_sig;
}

- (void)setSessionNumber:(unsigned int)a3
{
  self->_session = a3;
}

- (unsigned)sessionNumber
{
  return self->_session;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_params;
}

- (void)setResult:(id)a3
{
}

- (NSError)result
{
  return self->_result;
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setMessageId:(unsigned int)a3
{
  self->_messageId = a3;
}

- (unsigned)messageId
{
  return self->_messageId;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (id)description
{
  v3 = NSString;
  name = self->_name;
  v5 = +[ATLegacyMessage _messageTypeString:self->_messageType];
  v6 = [v3 stringWithFormat:@"[%@ %@. id=%u, Session=%u, params=%@]", name, v5, self->_messageId, self->_session, self->_params];

  return v6;
}

- (ATLegacyMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATLegacyMessage;
  v5 = [(ATLegacyMessage *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"Type"];
    -[ATLegacyMessage setMessageType:](v5, "setMessageType:", [v6 unsignedIntValue]);

    v7 = [v4 objectForKey:@"Session"];
    -[ATLegacyMessage setMessageId:](v5, "setMessageId:", [v7 unsignedIntValue]);

    v8 = [v4 objectForKey:@"Command"];
    [(ATLegacyMessage *)v5 setName:v8];

    v9 = [v4 objectForKey:@"Result"];
    [(ATLegacyMessage *)v5 setResult:v9];

    v10 = [v4 objectForKey:@"Params"];
    [(ATLegacyMessage *)v5 setParameters:v10];

    v11 = [v4 objectForKey:@"Payload"];
    [(ATLegacyMessage *)v5 setPayload:v11];

    v12 = [v4 objectForKey:@"Session"];
    v5->_session = [v12 unsignedIntValue];

    v13 = [v4 objectForKey:@"Sig"];
    [(ATLegacyMessage *)v5 setSig:v13];
  }
  return v5;
}

- (id)data
{
  v2 = (void *)MEMORY[0x263F08AC0];
  v3 = [(ATLegacyMessage *)self dictionary];
  id v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

- (id)dictionary
{
  v3 = objc_opt_new();
  id v4 = [NSNumber numberWithUnsignedInt:LODWORD(self->_messageType)];
  [v3 setObject:v4 forKey:@"Type"];

  v5 = [NSNumber numberWithUnsignedInt:self->_messageId];
  [v3 setObject:v5 forKey:@"Id"];

  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = &stru_26C70EB40;
  }
  [v3 setObject:name forKey:@"Command"];
  v7 = [NSNumber numberWithUnsignedInt:self->_session];
  [v3 setObject:v7 forKey:@"Session"];

  params = self->_params;
  if (params) {
    [v3 setObject:params forKey:@"Params"];
  }
  v9 = self->_result;
  if (v9) {
    [v3 setObject:v9 forKey:@"Result"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"Payload"];
  }
  sig = self->_sig;
  if (sig) {
    [v3 setObject:sig forKey:@"Sig"];
  }
  return v3;
}

- (id)partialResponseWithParameters:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ATLegacyMessage);
  [(ATLegacyMessage *)v5 setMessageId:[(ATLegacyMessage *)self messageId]];
  [(ATLegacyMessage *)v5 setMessageType:2];
  v6 = [(ATLegacyMessage *)self name];
  [(ATLegacyMessage *)v5 setName:v6];

  [(ATLegacyMessage *)v5 setParameters:v4];
  [(ATLegacyMessage *)v5 setSessionNumber:[(ATLegacyMessage *)self sessionNumber]];
  return v5;
}

- (id)responseWithResultError:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(ATLegacyMessage);
  [(ATLegacyMessage *)v8 setMessageId:[(ATLegacyMessage *)self messageId]];
  [(ATLegacyMessage *)v8 setMessageType:1];
  v9 = [(ATLegacyMessage *)self name];
  [(ATLegacyMessage *)v8 setName:v9];

  [(ATLegacyMessage *)v8 setResult:v7];
  [(ATLegacyMessage *)v8 setParameters:v6];

  [(ATLegacyMessage *)v8 setSessionNumber:[(ATLegacyMessage *)self sessionNumber]];
  return v8;
}

- (id)parameterForKey:(id)a3
{
  return [(NSDictionary *)self->_params objectForKey:a3];
}

+ (id)_messageTypeString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"<unknown type!>";
  }
  else {
    return off_2642812D0[a3];
  }
}

+ (id)messageFromData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08AC0] propertyListWithData:v3 options:0 format:0 error:0];
  if (v4)
  {
    v5 = +[ATLegacyMessage messageFromDictionary:v4];
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.AirTraffic", "iTunesSync");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_ERROR, "Couldn't create message, data %{public}@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)messageFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[ATLegacyMessage alloc] initWithDictionary:v3];

  return v4;
}

+ (id)messageFromHeader:(id)a3 withParams:(id)a4 andPayload:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[ATLegacyMessage messageFromDictionary:a3];
  [v9 setParameters:v8];

  [v9 setPayload:v7];
  return v9;
}

+ (id)messageWithName:(id)a3 parameters:(id)a4 session:(unsigned int)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(ATLegacyMessage);
  v9->_session = a5;
  [(ATLegacyMessage *)v9 setName:v8];

  [(ATLegacyMessage *)v9 setParameters:v7];
  [(ATLegacyMessage *)v9 setMessageId:atomic_fetch_add_explicit(&__nextMessageId, 1u, memory_order_relaxed) + 1];
  [(ATLegacyMessage *)v9 setMessageType:0];
  return v9;
}

+ (id)messageWithName:(id)a3 parameters:(id)a4
{
  return +[ATLegacyMessage messageWithName:a3 parameters:a4 session:__sessionNumber];
}

+ (void)setSessionNumber:(unsigned int)a3
{
  __sessionNumber = a3;
}

+ (unsigned)currentSessionNumber
{
  return __sessionNumber;
}

+ (unsigned)nextSessionNumber
{
  return atomic_fetch_add_explicit(&__sessionNumber, 1u, memory_order_relaxed) + 1;
}

@end