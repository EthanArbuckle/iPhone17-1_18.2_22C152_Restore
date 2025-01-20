@interface COMessageSessionManagementResponse
+ (BOOL)supportsSecureCoding;
- (COMessageSessionManagementResponse)initWithCoder:(id)a3;
- (COMessageSessionManagementResponse)initWithPayload:(id)a3 payloadType:(id)a4;
- (COMessageSessionManagementResponse)initWithRemoteError:(id)a3;
- (NSData)payload;
- (NSError)remoteError;
- (NSString)payloadType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMessageSessionManagementResponse

- (COMessageSessionManagementResponse)initWithPayload:(id)a3 payloadType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COMessageSessionManagementResponse;
  v9 = [(COMessageChannelResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeStrong((id *)&v10->_payloadType, a4);
  }

  return v10;
}

- (COMessageSessionManagementResponse)initWithRemoteError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMessageSessionManagementResponse;
  v6 = [(COMessageChannelResponse *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_remoteError, a3);
  }

  return v7;
}

- (COMessageSessionManagementResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COMessageSessionManagementResponse;
  id v5 = [(COMessageChannelResponse *)&v14 initWithCoder:v4];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  payload = v5->_payload;
  v5->_payload = (NSData *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadType"];
  payloadType = v5->_payloadType;
  v5->_payloadType = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteError"];
  remoteError = v5->_remoteError;
  v5->_remoteError = (NSError *)v10;

  if (v5->_payload)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (v5->_payloadType && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v5->_remoteError && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:
    objc_super v12 = 0;
  }
  else
  {
LABEL_8:
    objc_super v12 = v5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)COMessageSessionManagementResponse;
  id v4 = a3;
  [(COMessageChannelResponse *)&v8 encodeWithCoder:v4];
  id v5 = [(COMessageSessionManagementResponse *)self payload];
  [v4 encodeObject:v5 forKey:@"payload"];

  uint64_t v6 = [(COMessageSessionManagementResponse *)self payloadType];
  [v4 encodeObject:v6 forKey:@"payloadType"];

  id v7 = [(COMessageSessionManagementResponse *)self remoteError];
  [v4 encodeObject:v7 forKey:@"remoteError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteError, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end