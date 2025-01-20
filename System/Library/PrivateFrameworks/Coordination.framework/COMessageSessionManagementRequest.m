@interface COMessageSessionManagementRequest
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (COMessageSessionManagementRequest)initWithCoder:(id)a3;
- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 error:(id)a4 topic:(id)a5 subTopic:(id)a6;
- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 payload:(id)a4 payloadType:(id)a5 topic:(id)a6 subTopic:(id)a7;
- (NSData)payload;
- (NSError)remoteError;
- (NSString)payloadType;
- (NSString)subTopic;
- (NSString)topic;
- (int64_t)commandType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMessageSessionManagementRequest

- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 payload:(id)a4 payloadType:(id)a5 topic:(id)a6 subTopic:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)COMessageSessionManagementRequest;
  v17 = [(COMessageChannelRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_commandType = a3;
    objc_storeStrong((id *)&v17->_payload, a4);
    objc_storeStrong((id *)&v18->_payloadType, a5);
    objc_storeStrong((id *)&v18->_topic, a6);
    objc_storeStrong((id *)&v18->_subTopic, a7);
  }

  return v18;
}

- (COMessageSessionManagementRequest)initWithCommandType:(int64_t)a3 error:(id)a4 topic:(id)a5 subTopic:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)COMessageSessionManagementRequest;
  id v14 = [(COMessageChannelRequest *)&v17 init];
  id v15 = v14;
  if (v14)
  {
    v14->_commandType = a3;
    objc_storeStrong((id *)&v14->_remoteError, a4);
    objc_storeStrong((id *)&v15->_topic, a5);
    objc_storeStrong((id *)&v15->_subTopic, a6);
  }

  return v15;
}

- (COMessageSessionManagementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)COMessageSessionManagementRequest;
  v5 = [(COMessageChannelRequest *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_9;
  }
  v5->_commandType = [v4 decodeIntegerForKey:@"requestCommandType"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadType"];
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  topic = v5->_topic;
  v5->_topic = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTopic"];
  subTopic = v5->_subTopic;
  v5->_subTopic = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteError"];
  remoteError = v5->_remoteError;
  v5->_remoteError = (NSError *)v14;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v5->_remoteError && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_10:
    id v16 = 0;
  }
  else
  {
LABEL_9:
    id v16 = v5;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COMessageSessionManagementRequest;
  id v4 = a3;
  [(COMessageChannelRequest *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[COMessageSessionManagementRequest commandType](self, "commandType", v10.receiver, v10.super_class), @"requestCommandType");
  v5 = [(COMessageSessionManagementRequest *)self payload];
  [v4 encodeObject:v5 forKey:@"payload"];

  uint64_t v6 = [(COMessageSessionManagementRequest *)self payloadType];
  [v4 encodeObject:v6 forKey:@"payloadType"];

  v7 = [(COMessageSessionManagementRequest *)self topic];
  [v4 encodeObject:v7 forKey:@"topic"];

  uint64_t v8 = [(COMessageSessionManagementRequest *)self subTopic];
  [v4 encodeObject:v8 forKey:@"subTopic"];

  v9 = [(COMessageSessionManagementRequest *)self remoteError];
  [v4 encodeObject:v9 forKey:@"remoteError"];
}

+ (id)acceptableResponses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSError)remoteError
{
  return self->_remoteError;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTopic, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_remoteError, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end