@interface COMessagingResponse
+ (BOOL)supportsSecureCoding;
- (COMessagingResponse)initWithCoder:(id)a3;
- (NSData)payload;
- (NSString)payloadType;
- (void)encodeWithCoder:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadType:(id)a3;
@end

@implementation COMessagingResponse

- (COMessagingResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)COMessagingResponse;
  v5 = [(COMeshResponse *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadType"];
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
LABEL_7:
  }
    v10 = 0;
  else {
LABEL_6:
  }
    v10 = v5;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COMessagingResponse;
  id v4 = a3;
  [(COMeshResponse *)&v7 encodeWithCoder:v4];
  v5 = [(COMessagingResponse *)self payload];
  [v4 encodeObject:v5 forKey:@"payload"];

  uint64_t v6 = [(COMessagingResponse *)self payloadType];
  [v4 encodeObject:v6 forKey:@"payloadType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end