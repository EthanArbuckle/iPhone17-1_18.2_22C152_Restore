@interface AAMessagingContext
- (AAMessagingContext)initWithContext:(id)a3;
- (AAMessagingDestination)fromID;
- (AAMessagingDestination)toID;
- (BOOL)expectsPeerResponse;
- (NSString)incomingResponseIdentifier;
- (NSString)outgoingResponseIdentifier;
- (NSString)senderCorrelationIdentifier;
@end

@implementation AAMessagingContext

- (AAMessagingContext)initWithContext:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AAMessagingContext;
  v6 = [(AAMessagingContext *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_expectsPeerResponse = [(IDSMessageContext *)v7->_context expectsPeerResponse];
    uint64_t v8 = [(IDSMessageContext *)v7->_context outgoingResponseIdentifier];
    outgoingResponseIdentifier = v7->_outgoingResponseIdentifier;
    v7->_outgoingResponseIdentifier = (NSString *)v8;

    uint64_t v10 = [(IDSMessageContext *)v7->_context senderCorrelationIdentifier];
    senderCorrelationIdentifier = v7->_senderCorrelationIdentifier;
    v7->_senderCorrelationIdentifier = (NSString *)v10;

    uint64_t v12 = [(IDSMessageContext *)v7->_context incomingResponseIdentifier];
    incomingResponseIdentifier = v7->_incomingResponseIdentifier;
    v7->_incomingResponseIdentifier = (NSString *)v12;

    v14 = [(IDSMessageContext *)v7->_context fromID];

    if (v14)
    {
      v15 = [AAMessagingDestination alloc];
      v16 = [(IDSMessageContext *)v7->_context fromID];
      uint64_t v17 = [(AAMessagingDestination *)v15 initWithHandle:v16];
      fromID = v7->_fromID;
      v7->_fromID = (AAMessagingDestination *)v17;

      v19 = [AAMessagingDestination alloc];
      v20 = [(IDSMessageContext *)v7->_context toID];
      uint64_t v21 = [(AAMessagingDestination *)v19 initWithHandle:v20];
      toID = v7->_toID;
      v7->_toID = (AAMessagingDestination *)v21;
    }
  }

  return v7;
}

- (NSString)outgoingResponseIdentifier
{
  return self->_outgoingResponseIdentifier;
}

- (NSString)incomingResponseIdentifier
{
  return self->_incomingResponseIdentifier;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (AAMessagingDestination)fromID
{
  return self->_fromID;
}

- (AAMessagingDestination)toID
{
  return self->_toID;
}

- (BOOL)expectsPeerResponse
{
  return self->_expectsPeerResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toID, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end