@interface MTRCommissionerControlClusterCommissioningRequestResultEvent
- (MTRCommissionerControlClusterCommissioningRequestResultEvent)init;
- (NSNumber)clientNodeID;
- (NSNumber)fabricIndex;
- (NSNumber)requestID;
- (NSNumber)statusCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setClientNodeID:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStatusCode:(id)a3;
@end

@implementation MTRCommissionerControlClusterCommissioningRequestResultEvent

- (MTRCommissionerControlClusterCommissioningRequestResultEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRCommissionerControlClusterCommissioningRequestResultEvent;
  v2 = [(MTRCommissionerControlClusterCommissioningRequestResultEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    requestID = v2->_requestID;
    v2->_requestID = (NSNumber *)&unk_26F9C8620;

    clientNodeID = v3->_clientNodeID;
    v3->_clientNodeID = (NSNumber *)&unk_26F9C8620;

    statusCode = v3->_statusCode;
    v3->_statusCode = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCommissionerControlClusterCommissioningRequestResultEvent);
  v7 = objc_msgSend_requestID(self, v5, v6);
  objc_msgSend_setRequestID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_clientNodeID(self, v9, v10);
  objc_msgSend_setClientNodeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_statusCode(self, v13, v14);
  objc_msgSend_setStatusCode_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: requestID:%@; clientNodeID:%@; statusCode:%@; fabricIndex:%@; >",
    v5,
    self->_requestID,
    self->_clientNodeID,
    self->_statusCode,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSNumber)clientNodeID
{
  return self->_clientNodeID;
}

- (void)setClientNodeID:(id)a3
{
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_clientNodeID, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end