@interface COMessagingRequest
+ (BOOL)supportsSecureCoding;
+ (id)acceptableResponses;
- (COMessagingRequest)initWithCoder:(id)a3;
- (COMessagingRequest)initWithRequestID:(unsigned int)a3 requestType:(int64_t)a4 payload:(id)a5 payloadType:(id)a6 topic:(id)a7;
- (NSData)payload;
- (NSString)payloadType;
- (NSString)topic;
- (id)description;
- (int64_t)requestType;
- (unsigned)requestID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMessagingRequest

- (COMessagingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COMessagingRequest;
  v5 = [(COMeshCommand *)&v16 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
  v5->_requestID = [v6 unsignedIntValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestType"];
  v5->_requestType = [v7 integerValue];

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  payload = v5->_payload;
  v5->_payload = (NSData *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadType"];
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  topic = v5->_topic;
  v5->_topic = (NSString *)v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
LABEL_5:
  }
    v14 = v5;
  else {
LABEL_6:
  }
    v14 = 0;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)COMessagingRequest;
  id v4 = a3;
  [(COMeshCommand *)&v10 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[COMessagingRequest requestID](self, "requestID", v10.receiver, v10.super_class));
  [v4 encodeObject:v5 forKey:@"requestID"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[COMessagingRequest requestType](self, "requestType"));
  [v4 encodeObject:v6 forKey:@"requestType"];

  v7 = [(COMessagingRequest *)self payload];
  [v4 encodeObject:v7 forKey:@"payload"];

  uint64_t v8 = [(COMessagingRequest *)self payloadType];
  [v4 encodeObject:v8 forKey:@"payloadType"];

  v9 = [(COMessagingRequest *)self topic];
  [v4 encodeObject:v9 forKey:@"topic"];
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

- (COMessagingRequest)initWithRequestID:(unsigned int)a3 requestType:(int64_t)a4 payload:(id)a5 payloadType:(id)a6 topic:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)COMessagingRequest;
  objc_super v16 = [(COMeshCommand *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_requestID = a3;
    v16->_requestType = a4;
    objc_storeStrong((id *)&v16->_payload, a5);
    objc_storeStrong((id *)&v17->_payloadType, a6);
    objc_storeStrong((id *)&v17->_topic, a7);
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, id = %u>", v5, self, -[COMessagingRequest requestID](self, "requestID")];

  return v6;
}

- (unsigned)requestID
{
  return self->_requestID;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end