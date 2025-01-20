@interface NMSIncomingResponse
- (IDSMessageContext)idsContext;
- (NSData)data;
- (NSDate)requestSent;
- (NSDictionary)requestPersistentUserInfo;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)requestIDSIdentifier;
- (NSString)sourceDeviceID;
- (id)CPObfuscatedDescriptionObject;
- (id)pbResponse;
- (unsigned)messageID;
- (void)setData:(id)a3;
- (void)setIdsContext:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbResponse:(id)a3;
- (void)setRequestIDSIdentifier:(id)a3;
- (void)setRequestPersistentUserInfo:(id)a3;
- (void)setRequestSent:(id)a3;
- (void)setSourceDeviceID:(id)a3;
@end

@implementation NMSIncomingResponse

- (NSString)description
{
  id v3 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)NMSIncomingResponse;
  v4 = [(NMSIncomingResponse *)&v13 description];
  uint64_t v5 = [(NMSIncomingResponse *)self messageID];
  id pbResponse = self->_pbResponse;
  if (pbResponse)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = @"none";
  }
  v9 = [(NMSIncomingResponse *)self idsIdentifier];
  v10 = [(NMSIncomingResponse *)self data];
  v11 = (void *)[v3 initWithFormat:@"%@ {messageID=%hu, protobuf class=%@, idsID=%@, data=%lu bytes}", v4, v5, v8, v9, objc_msgSend(v10, "length")];

  if (pbResponse) {
  return (NSString *)v11;
  }
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(NMSObfuscatableDescription);
  v14.receiver = self;
  v14.super_class = (Class)NMSIncomingResponse;
  v4 = [(NMSIncomingResponse *)&v14 debugDescription];
  [(NMSObfuscatableDescription *)v3 setPrefixString:v4];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[NMSIncomingResponse messageID](self, "messageID"));
  [(NMSObfuscatableDescription *)v3 addDescription:@"MessageID" value:v5];

  if (self->_pbResponse)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(NMSObfuscatableDescription *)v3 addDescription:@"Protobuf class" value:v7];
  }
  else
  {
    [(NMSObfuscatableDescription *)v3 addDescription:@"Protobuf class" value:@"none"];
  }
  v8 = [(NMSIncomingResponse *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v3 addDescription:@"IDS ID" value:v8];

  v9 = [(NMSIncomingResponse *)self requestIDSIdentifier];
  [(NMSObfuscatableDescription *)v3 addDescription:@"Request IDS ID" value:v9];

  v10 = [(NMSIncomingResponse *)self requestSent];
  [(NMSObfuscatableDescription *)v3 addDescription:@"Request sent" value:v10];

  v11 = [(NMSIncomingResponse *)self data];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"Data" value:v11];

  v12 = [(NMSIncomingResponse *)self requestPersistentUserInfo];
  [(NMSObfuscatableDescription *)v3 addDescription:@"Request user info" value:v12];

  return v3;
}

- (NSString)sourceDeviceID
{
  return self->sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)requestIDSIdentifier
{
  return self->_requestIDSIdentifier;
}

- (void)setRequestIDSIdentifier:(id)a3
{
}

- (NSDate)requestSent
{
  return self->_requestSent;
}

- (void)setRequestSent:(id)a3
{
}

- (NSDictionary)requestPersistentUserInfo
{
  return self->_requestPersistentUserInfo;
}

- (void)setRequestPersistentUserInfo:(id)a3
{
}

- (id)pbResponse
{
  return self->_pbResponse;
}

- (void)setPbResponse:(id)a3
{
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (void)setIdsContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsContext, 0);
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_requestPersistentUserInfo, 0);
  objc_storeStrong((id *)&self->_requestSent, 0);
  objc_storeStrong((id *)&self->_requestIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

@end