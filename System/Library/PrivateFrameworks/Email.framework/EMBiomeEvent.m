@interface EMBiomeEvent
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (EMBiomeEvent)initWithCoder:(id)a3;
- (EMBiomeEvent)initWithEventName:(id)a3 messageId:(id)a4 payload:(id)a5;
- (NSDictionary)payload;
- (NSString)eventName;
- (NSString)messageId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
- (void)serialize;
@end

@implementation EMBiomeEvent

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__EMBiomeEvent_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return (OS_os_log *)v2;
}

void __19__EMBiomeEvent_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (EMBiomeEvent)initWithEventName:(id)a3 messageId:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMBiomeEvent;
  v11 = [(EMBiomeEvent *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    eventName = v11->_eventName;
    v11->_eventName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    messageId = v11->_messageId;
    v11->_messageId = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v16;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(EMBiomeEvent *)self eventName];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_eventName"];

  v5 = [(EMBiomeEvent *)self messageId];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_messageId"];

  v6 = [(EMBiomeEvent *)self payload];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_payload"];
}

- (EMBiomeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMBiomeEvent;
  v5 = [(EMBiomeEvent *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_eventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_messageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"EFPropertyKey_payload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4 = a3;
  id v16 = 0;
  v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v16];
  id v6 = v16;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = +[EMBiomeEvent log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[EMBiomeEvent eventWithData:dataVersion:]((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v5;
}

- (id)serialize
{
  id v13 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v13];
  id v3 = v13;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = +[EMBiomeEvent log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(EMBiomeEvent *)(uint64_t)v3 serialize];
    }
  }
  return v2;
}

- (id)json
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v21[0] = @"eventName";
  id v3 = [(EMBiomeEvent *)self eventName];
  v22[0] = v3;
  v21[1] = @"messageId";
  id v4 = [(EMBiomeEvent *)self messageId];
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[1] = v5;
  v21[2] = @"payload";
  uint64_t v6 = [(EMBiomeEvent *)self payload];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  if (!v6) {

  }
  if (!v4) {
  id v20 = 0;
  }
  uint64_t v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:1 error:&v20];
  id v10 = v20;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = +[EMBiomeEvent log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(EMBiomeEvent *)(uint64_t)v10 json];
    }
  }
  return v9;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)serialize
{
}

- (void)json
{
}

@end