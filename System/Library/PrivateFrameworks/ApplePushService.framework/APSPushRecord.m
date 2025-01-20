@interface APSPushRecord
- (APSPushRecord)initWithToken:(id)a3 timestamp:(id)a4 payloadHash:(id)a5;
- (NSData)payloadHash;
- (NSData)token;
- (NSNumber)timestamp;
- (void)setPayloadHash:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation APSPushRecord

- (APSPushRecord)initWithToken:(id)a3 timestamp:(id)a4 payloadHash:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)APSPushRecord;
  v12 = [(APSPushRecord *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_token, a3);
    objc_storeStrong((id *)&v13->_timestamp, a4);
    objc_storeStrong((id *)&v13->_payloadHash, a5);
  }

  return v13;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSData)payloadHash
{
  return self->_payloadHash;
}

- (void)setPayloadHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadHash, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end