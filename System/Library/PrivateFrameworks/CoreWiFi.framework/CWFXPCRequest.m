@interface CWFXPCRequest
- (BOOL)didSendResponse;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isSubrequest;
- (CWFRequestParameters)requestParameters;
- (CWFXPCRequest)init;
- (NSDate)receivedAt;
- (NSDictionary)info;
- (NSUUID)UUID;
- (id)description;
- (id)response;
- (int64_t)type;
- (void)setDidSendResponse:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setIsSubrequest:(BOOL)a3;
- (void)setReceivedAt:(id)a3;
- (void)setRequestParameters:(id)a3;
- (void)setResponse:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFXPCRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_receivedAt, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)description
{
  v6 = NSString;
  v7 = sub_1B4F43CD0(self->_type, a2, v2, v3, v4);
  v12 = objc_msgSend_description(self->_requestParameters, v8, v9, v10, v11);
  v16 = objc_msgSend_stringWithFormat_(v6, v13, @"[%@] %@", v14, v15, v7, v12);

  return v16;
}

- (BOOL)isExecuting
{
  v10.receiver = self;
  v10.super_class = (Class)CWFXPCRequest;
  if ([(CWFXPCRequest *)&v10 isExecuting])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CWFXPCRequest;
    unsigned int v3 = [(CWFXPCRequest *)&v9 isFinished];
    if (v3) {
      LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7) ^ 1;
    }
  }
  return v3;
}

- (BOOL)isFinished
{
  v9.receiver = self;
  v9.super_class = (Class)CWFXPCRequest;
  unsigned int v3 = [(CWFXPCRequest *)&v9 isFinished];
  if (v3) {
    LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7);
  }
  return v3;
}

- (BOOL)didSendResponse
{
  return self->_didSendResponse;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setResponse:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4F4908C;
  v8[3] = &unk_1E60BC040;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1BA995F60](v8);
  id response = self->_response;
  self->_id response = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setRequestParameters:(id)a3
{
}

- (void)setReceivedAt:(id)a3
{
}

- (void)setIsSubrequest:(BOOL)a3
{
  self->_isSubrequest = a3;
}

- (void)setInfo:(id)a3
{
}

- (CWFXPCRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)CWFXPCRequest;
  uint64_t v6 = [(NSBlockOperation *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }
  return v6;
}

- (id)response
{
  return self->_response;
}

- (void)setDidSendResponse:(BOOL)a3
{
  self->_didSendResponse = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setUUID:(id)a3
{
}

- (NSDate)receivedAt
{
  return self->_receivedAt;
}

- (BOOL)isSubrequest
{
  return self->_isSubrequest;
}

@end