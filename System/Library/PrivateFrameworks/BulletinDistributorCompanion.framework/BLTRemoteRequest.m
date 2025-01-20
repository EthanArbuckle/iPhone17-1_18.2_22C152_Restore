@interface BLTRemoteRequest
+ (id)remoteRequestWithProtobuf:(id)a3 type:(unsigned __int16)a4;
- (BLTRemoteRequest)initWithProtobuf:(id)a3 type:(unsigned __int16)a4;
- (BOOL)allowCloudDelivery;
- (BOOL)nonWaking;
- (IDSProtobuf)responseToRequest;
- (NSNumber)timeout;
- (NSString)requestDescription;
- (NSString)uniqueID;
- (PBCodable)protobuf;
- (id)description;
- (id)didQueue;
- (id)didSend;
- (id)responseCompletion;
- (unsigned)type;
- (void)setAllowCloudDelivery:(BOOL)a3;
- (void)setDidQueue:(id)a3;
- (void)setDidSend:(id)a3;
- (void)setNonWaking:(BOOL)a3;
- (void)setProtobuf:(id)a3;
- (void)setRequestDescription:(id)a3;
- (void)setResponseCompletion:(id)a3;
- (void)setResponseToRequest:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setType:(unsigned __int16)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation BLTRemoteRequest

+ (id)remoteRequestWithProtobuf:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithProtobuf:v6 type:v4];

  return v7;
}

- (BLTRemoteRequest)initWithProtobuf:(id)a3 type:(unsigned __int16)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTRemoteRequest;
  v8 = [(BLTRemoteRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protobuf, a3);
    v9->_type = a4;
    v9->_allowCloudDelivery = 1;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(BLTRemoteRequest *)self protobuf];
  id v5 = (id)[v3 appendObject:v4 withName:@"protobuf" skipIfNil:0];

  id v6 = (id)objc_msgSend(v3, "appendUnsignedInt:withName:", -[BLTRemoteRequest type](self, "type"), @"type");
  id v7 = [(BLTRemoteRequest *)self didSend];
  id v8 = (id)[v3 appendObject:v7 withName:@"didSend" skipIfNil:1];

  v9 = [(BLTRemoteRequest *)self timeout];
  id v10 = (id)[v3 appendObject:v9 withName:@"timeout" skipIfNil:1];

  objc_super v11 = [(BLTRemoteRequest *)self didQueue];
  id v12 = (id)[v3 appendObject:v11 withName:@"didQueue" skipIfNil:1];

  v13 = [(BLTRemoteRequest *)self requestDescription];
  id v14 = (id)[v3 appendObject:v13 withName:@"requestDescription" skipIfNil:1];

  id v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLTRemoteRequest allowCloudDelivery](self, "allowCloudDelivery"), @"allowCloudDelivery");
  v16 = [(BLTRemoteRequest *)self uniqueID];
  id v17 = (id)[v3 appendObject:v16 withName:@"uniqueID" skipIfNil:1];

  v18 = [(BLTRemoteRequest *)self responseCompletion];
  id v19 = (id)[v3 appendObject:v18 withName:@"responseCompletion" skipIfNil:1];

  v20 = [(BLTRemoteRequest *)self responseToRequest];
  id v21 = (id)[v3 appendObject:v20 withName:@"responseToRequest" skipIfNil:1];

  v22 = [v3 build];

  return v22;
}

- (PBCodable)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (id)didSend
{
  return self->_didSend;
}

- (void)setDidSend:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (id)didQueue
{
  return self->_didQueue;
}

- (void)setDidQueue:(id)a3
{
}

- (NSString)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
}

- (BOOL)allowCloudDelivery
{
  return self->_allowCloudDelivery;
}

- (void)setAllowCloudDelivery:(BOOL)a3
{
  self->_allowCloudDelivery = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (id)responseCompletion
{
  return self->_responseCompletion;
}

- (void)setResponseCompletion:(id)a3
{
}

- (BOOL)nonWaking
{
  return self->_nonWaking;
}

- (void)setNonWaking:(BOOL)a3
{
  self->_nonWaking = a3;
}

- (IDSProtobuf)responseToRequest
{
  return self->_responseToRequest;
}

- (void)setResponseToRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseToRequest, 0);
  objc_storeStrong(&self->_responseCompletion, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong(&self->_didQueue, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_didSend, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end