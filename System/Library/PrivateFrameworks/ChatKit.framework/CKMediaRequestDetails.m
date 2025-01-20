@interface CKMediaRequestDetails
- (CKMediaRequestDetails)initWithRequestID:(int64_t)a3 transferGUID:(id)a4 resultHandler:(id)a5;
- (NSString)transferGUID;
- (id)resultHandler;
- (int64_t)requestID;
@end

@implementation CKMediaRequestDetails

- (CKMediaRequestDetails)initWithRequestID:(int64_t)a3 transferGUID:(id)a4 resultHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKMediaRequestDetails;
  v11 = [(CKMediaRequestDetails *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_requestID = a3;
    v13 = _Block_copy(v10);
    id resultHandler = v12->_resultHandler;
    v12->_id resultHandler = v13;

    objc_storeStrong((id *)&v12->_transferGUID, a4);
  }

  return v12;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferGUID, 0);

  objc_storeStrong(&self->_resultHandler, 0);
}

@end