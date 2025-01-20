@interface NMSIncomingRequest
+ (BOOL)allowsUnrepliedRequestsForUnitTesting;
+ (void)setAllowsUnrepliedRequestsForUnitTesting:(BOOL)a3;
- (BOOL)expectsResponse;
- (IDSMessageContext)idsContext;
- (NMSIncomingRequest)init;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingResponse)response;
- (NSData)data;
- (NSString)description;
- (NSString)idsIdentifier;
- (NSString)sourceDeviceID;
- (OS_os_transaction)transaction;
- (id)CPObfuscatedDescriptionObject;
- (id)pbRequest;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)configureResponse;
- (void)dealloc;
- (void)setData:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setIdsContext:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setResponse:(id)a3;
- (void)setSourceDeviceID:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation NMSIncomingRequest

+ (BOOL)allowsUnrepliedRequestsForUnitTesting
{
  return _allowUnrepliedRequestsForUnitTesting;
}

+ (void)setAllowsUnrepliedRequestsForUnitTesting:(BOOL)a3
{
  _allowUnrepliedRequestsForUnitTesting = a3;
}

- (NMSIncomingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSIncomingRequest;
  v2 = [(NMSIncomingRequest *)&v6 init];
  if (v2)
  {
    v3 = (void *)os_transaction_create();
    [(NMSIncomingRequest *)v2 setTransaction:v3];

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_5() pbRequest];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v1, (os_log_type_t)0x90u, "Must not forget about an NMSIncomingRequest without first responding to it. Request is an %{public}@", v6, 0xCu);
}

- (void)configureResponse
{
  v3 = objc_alloc_init(NMSOutgoingResponse);
  [(NMSOutgoingResponse *)v3 setPriority:self->_priority];
  [(NMSOutgoingResponse *)v3 setRequest:self];
  if (self->sourceDeviceID)
  {
    v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    [(NMSOutgoingResponse *)v3 setTargetDeviceIDs:v4];
  }
  v5 = [(NMSIncomingRequest *)self idsContext];
  [(NMSOutgoingResponse *)v3 setIdsContext:v5];

  response = self->_response;
  self->_response = v3;
}

- (void)setData:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_data, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  p_messageID = &self->_messageID;
  v8 = [WeakRetained _pbMappingForMessageID:self->_messageID];

  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "requestClass")), "initWithData:", self->_data);
    id pbRequest = self->_pbRequest;
    self->_id pbRequest = v9;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v11 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[NMSIncomingRequest setData:](p_messageID, v11);
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)NMSIncomingRequest;
  v4 = [(NMSIncomingRequest *)&v11 description];
  id v5 = NMSPriorityString([(NMSIncomingRequest *)self priority]);
  unsigned int v6 = [(NMSIncomingRequest *)self messageID];
  uint64_t v7 = [(NMSIncomingRequest *)self idsIdentifier];
  v8 = [(NMSIncomingRequest *)self data];
  v9 = (void *)[v3 initWithFormat:@"%@ {%@ priority, messageID=%hu, idsID=%@, data=%lu bytes}", v4, v5, v6, v7, objc_msgSend(v8, "length")];

  return (NSString *)v9;
}

- (id)CPObfuscatedDescriptionObject
{
  id v3 = objc_alloc_init(NMSObfuscatableDescription);
  v14.receiver = self;
  v14.super_class = (Class)NMSIncomingRequest;
  v4 = [(NMSIncomingRequest *)&v14 debugDescription];
  [(NMSObfuscatableDescription *)v3 setPrefixString:v4];

  id v5 = NMSPriorityString([(NMSIncomingRequest *)self priority]);
  [(NMSObfuscatableDescription *)v3 addDescription:@"Priority" value:v5];

  unsigned int v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[NMSIncomingRequest messageID](self, "messageID"));
  [(NMSObfuscatableDescription *)v3 addDescription:@"MessageID" value:v6];

  if (self->_pbRequest)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(NMSObfuscatableDescription *)v3 addDescription:@"Protobuf class" value:v8];
  }
  else
  {
    [(NMSObfuscatableDescription *)v3 addDescription:@"Protobuf class" value:@"none"];
  }
  v9 = [(NMSIncomingRequest *)self idsIdentifier];
  [(NMSObfuscatableDescription *)v3 addDescription:@"IDS ID" value:v9];

  if ([(NMSIncomingRequest *)self expectsResponse]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [(NMSObfuscatableDescription *)v3 addDescription:@"Expects response" value:v10];
  objc_super v11 = [(NMSIncomingRequest *)self data];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"Data" value:v11];

  v12 = [(NMSIncomingRequest *)self response];
  [(NMSObfuscatableDescription *)v3 addObfuscatedDescription:@"Response message" value:v12];

  return v3;
}

- (NSString)sourceDeviceID
{
  return self->sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
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

- (NSData)data
{
  return self->_data;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NMSOutgoingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void)setPbRequest:(id)a3
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
  objc_storeStrong(&self->_pbRequest, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong((id *)&self->sourceDeviceID, 0);
}

- (void)setData:(unsigned __int16 *)a1 .cold.1(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "No Protobuf class mappings for message ID %{companionsync:SYMessageID}hu", (uint8_t *)v3, 8u);
}

@end