@interface NMSOutgoingRequest
+ (id)requestWithMessageID:(unsigned __int16)a3;
- (BOOL)shouldEncrypt;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingRequest)init;
- (NSData)data;
- (NSDictionary)extraIDSOptions;
- (NSDictionary)persistentUserInfo;
- (NSSet)targetDeviceIDs;
- (NSString)description;
- (NSString)idsIdentifier;
- (double)responseTimeout;
- (double)sendTimeout;
- (id)CPObfuscatedDescriptionObject;
- (id)pbRequest;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)setData:(id)a3;
- (void)setExtraIDSOptions:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setResponseTimeout:(double)a3;
- (void)setSendTimeout:(double)a3;
- (void)setShouldEncrypt:(BOOL)a3;
- (void)setTargetDeviceIDs:(id)a3;
@end

@implementation NMSOutgoingRequest

+ (id)requestWithMessageID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = objc_opt_new();
  [v4 setMessageID:v3];
  return v4;
}

- (NMSOutgoingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NMSOutgoingRequest;
  result = [(NMSOutgoingRequest *)&v3 init];
  if (result) {
    result->_priority = 1;
  }
  return result;
}

- (void)setPbRequest:(id)a3
{
  objc_storeStrong(&self->_pbRequest, a3);
  id v7 = a3;
  v5 = [self->_pbRequest data];
  data = self->_data;
  self->_data = v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)NMSOutgoingRequest;
  v4 = [(NMSOutgoingRequest *)&v11 description];
  v5 = NMSPriorityString([(NMSOutgoingRequest *)self priority]);
  unsigned int v6 = [(NMSOutgoingRequest *)self messageID];
  id v7 = [(NMSOutgoingRequest *)self idsIdentifier];
  v8 = [(NMSOutgoingRequest *)self data];
  v9 = (void *)[v3 initWithFormat:@"%@ {%@ priority, messageID=%hu, idsID=%@, data=%lu bytes}", v4, v5, v6, v7, objc_msgSend(v8, "length")];

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  [(NMSOutgoingRequest *)self sendTimeout];
  [v3 setSecond:vcvtmd_s64_f64(v4)];
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [(NMSOutgoingRequest *)self responseTimeout];
  [v5 setSecond:vcvtmd_s64_f64(v6)];
  id v7 = objc_alloc_init(NMSObfuscatableDescription);
  v20.receiver = self;
  v20.super_class = (Class)NMSOutgoingRequest;
  v8 = [(NMSOutgoingRequest *)&v20 description];
  [(NMSObfuscatableDescription *)v7 setPrefixString:v8];

  v9 = NMSPriorityString([(NMSOutgoingRequest *)self priority]);
  [(NMSObfuscatableDescription *)v7 addDescription:@"Priority" value:v9];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[NMSOutgoingRequest messageID](self, "messageID"));
  [(NMSObfuscatableDescription *)v7 addDescription:@"MessageID" value:v10];

  if (self->_pbRequest)
  {
    objc_super v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [(NMSObfuscatableDescription *)v7 addDescription:@"Protobuf class" value:v12];
  }
  else
  {
    [(NMSObfuscatableDescription *)v7 addDescription:@"Protobuf class" value:@"none"];
  }
  v13 = [(NMSOutgoingRequest *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v7 addDescription:@"IDS ID" value:v13];

  v14 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v3 unitsStyle:3];
  [(NMSObfuscatableDescription *)v7 addDescription:@"Send timeout" value:v14];

  v15 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v5 unitsStyle:3];
  [(NMSObfuscatableDescription *)v7 addDescription:@"Response timeout" value:v15];

  if ([(NMSOutgoingRequest *)self shouldEncrypt]) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  [(NMSObfuscatableDescription *)v7 addDescription:@"Should encrypt" value:v16];
  v17 = [(NMSOutgoingRequest *)self data];
  [(NMSObfuscatableDescription *)v7 addObfuscatedDescription:@"Data" value:v17];

  v18 = [(NMSOutgoingRequest *)self persistentUserInfo];
  [(NMSObfuscatableDescription *)v7 addDescription:@"User info" value:v18];

  return v7;
}

- (NSSet)targetDeviceIDs
{
  return self->targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
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

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (NSDictionary)extraIDSOptions
{
  return self->_extraIDSOptions;
}

- (void)setExtraIDSOptions:(id)a3
{
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->_extraIDSOptions, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->targetDeviceIDs, 0);
}

@end