@interface NMSOutgoingResponse
- (BOOL)isSent;
- (IDSMessageContext)idsContext;
- (NMSIncomingRequest)request;
- (NMSOutgoingResponse)init;
- (NSData)data;
- (NSDictionary)extraIDSOptions;
- (NSDictionary)persistentUserInfo;
- (NSSet)targetDeviceIDs;
- (NSString)description;
- (NSString)idsIdentifier;
- (OS_os_transaction)transaction;
- (double)sendTimeout;
- (id)CPObfuscatedDescriptionObject;
- (id)_makePBResponse;
- (id)pbResponse;
- (unint64_t)priority;
- (void)dealloc;
- (void)send;
- (void)setData:(id)a3;
- (void)setExtraIDSOptions:(id)a3;
- (void)setIdsContext:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setPbResponse:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setSendTimeout:(double)a3;
- (void)setSent:(BOOL)a3;
- (void)setTargetDeviceIDs:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation NMSOutgoingResponse

- (NMSOutgoingResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)NMSOutgoingResponse;
  v2 = [(NMSOutgoingResponse *)&v5 init];
  if (v2)
  {
    v3 = (void *)os_transaction_create();
    [(NMSOutgoingResponse *)v2 setTransaction:v3];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NMSOutgoingResponse;
  [(NMSOutgoingResponse *)&v2 dealloc];
}

- (void)send
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  id v4 = [WeakRetained messageCenter];

  [v4 _sendResponse:self];
}

- (void)setPbResponse:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  objc_super v5 = [WeakRetained messageCenter];
  v6 = objc_msgSend(v5, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  id pbResponse = self->_pbResponse;
  self->_id pbResponse = v4;
  id v8 = v4;

  v9 = [self->_pbResponse data];
  data = self->_data;
  self->_data = v9;
}

- (id)_makePBResponse
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  v3 = [WeakRetained messageCenter];
  id v4 = objc_msgSend(v3, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  [v4 responseClass];
  objc_super v5 = objc_opt_new();

  return v5;
}

- (NSString)description
{
  v3 = [(NMSOutgoingResponse *)self request];
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)NMSOutgoingResponse;
  objc_super v5 = [(NMSOutgoingResponse *)&v13 description];
  v6 = NMSPriorityString([(NMSOutgoingResponse *)self priority]);
  unsigned int v7 = [v3 messageID];
  id v8 = [(NMSOutgoingResponse *)self idsIdentifier];
  v9 = [v3 idsIdentifier];
  v10 = [(NMSOutgoingResponse *)self data];
  v11 = (void *)[v4 initWithFormat:@"%@ {%@ priority, messageID=%hu, idsID=%@, requestID=%@, data=%lu bytes}", v5, v6, v7, v8, v9, objc_msgSend(v10, "length")];

  return (NSString *)v11;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  [(NMSOutgoingResponse *)self sendTimeout];
  [v3 setSecond:vcvtmd_s64_f64(v4)];
  objc_super v5 = objc_alloc_init(NMSObfuscatableDescription);
  v18.receiver = self;
  v18.super_class = (Class)NMSOutgoingResponse;
  v6 = [(NMSOutgoingResponse *)&v18 debugDescription];
  [(NMSObfuscatableDescription *)v5 setPrefixString:v6];

  unsigned int v7 = [(NMSOutgoingResponse *)self request];
  id v8 = NMSPriorityString([(NMSOutgoingResponse *)self priority]);
  [(NMSObfuscatableDescription *)v5 addDescription:@"Priority" value:v8];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v7, "messageID"));
  [(NMSObfuscatableDescription *)v5 addDescription:@"Request messageID" value:v9];

  if (self->_pbResponse)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [(NMSObfuscatableDescription *)v5 addDescription:@"Protobuf class" value:v11];
  }
  else
  {
    [(NMSObfuscatableDescription *)v5 addDescription:@"Protobuf class" value:@"none"];
  }
  v12 = [(NMSOutgoingResponse *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v5 addDescription:@"IDS ID" value:v12];

  objc_super v13 = [v7 idsIdentifier];
  [(NMSObfuscatableDescription *)v5 addDescription:@"Request IDS ID" value:v13];

  v14 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v3 unitsStyle:3];
  [(NMSObfuscatableDescription *)v5 addDescription:@"Send timeout" value:v14];

  v15 = [(NMSOutgoingResponse *)self data];
  [(NMSObfuscatableDescription *)v5 addObfuscatedDescription:@"Data" value:v15];

  v16 = [(NMSOutgoingResponse *)self persistentUserInfo];
  [(NMSObfuscatableDescription *)v5 addDescription:@"User info" value:v16];

  return v5;
}

- (NSSet)targetDeviceIDs
{
  return self->targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
}

- (NMSIncomingRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (NMSIncomingRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
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

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)isSent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (id)pbResponse
{
  return self->_pbResponse;
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
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_extraIDSOptions, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->targetDeviceIDs, 0);
}

@end