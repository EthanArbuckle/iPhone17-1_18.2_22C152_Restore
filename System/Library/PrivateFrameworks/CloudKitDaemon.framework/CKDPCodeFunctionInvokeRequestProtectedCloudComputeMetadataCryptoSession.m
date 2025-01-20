@interface CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadataCryptoSession
- (BOOL)hasRoutingToken;
- (BOOL)hasWrappedInvocationKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)routingToken;
- (NSData)wrappedInvocationKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRoutingToken:(id)a3;
- (void)setWrappedInvocationKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadataCryptoSession

- (BOOL)hasWrappedInvocationKey
{
  return self->_wrappedInvocationKey != 0;
}

- (BOOL)hasRoutingToken
{
  return self->_routingToken != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadataCryptoSession;
  v4 = [(CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadataCryptoSession *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  wrappedInvocationKey = self->_wrappedInvocationKey;
  if (wrappedInvocationKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)wrappedInvocationKey, @"wrappedInvocationKey");
  }
  routingToken = self->_routingToken;
  if (routingToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)routingToken, @"routingToken");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EFA630((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_wrappedInvocationKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_routingToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  wrappedInvocationKey = self->_wrappedInvocationKey;
  id v8 = v4;
  if (wrappedInvocationKey)
  {
    objc_msgSend_setWrappedInvocationKey_(v4, v5, (uint64_t)wrappedInvocationKey);
    id v4 = v8;
  }
  routingToken = self->_routingToken;
  if (routingToken)
  {
    objc_msgSend_setRoutingToken_(v8, v5, (uint64_t)routingToken);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_wrappedInvocationKey, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_routingToken, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((wrappedInvocationKey = self->_wrappedInvocationKey, uint64_t v9 = v4[2], !((unint64_t)wrappedInvocationKey | v9))
     || objc_msgSend_isEqual_(wrappedInvocationKey, v7, v9)))
  {
    routingToken = self->_routingToken;
    uint64_t v11 = v4[1];
    if ((unint64_t)routingToken | v11) {
      char isEqual = objc_msgSend_isEqual_(routingToken, v7, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_wrappedInvocationKey, a2, v2);
  return objc_msgSend_hash(self->_routingToken, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setWrappedInvocationKey_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setRoutingToken_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSData)wrappedInvocationKey
{
  return self->_wrappedInvocationKey;
}

- (void)setWrappedInvocationKey:(id)a3
{
}

- (NSData)routingToken
{
  return self->_routingToken;
}

- (void)setRoutingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedInvocationKey, 0);
  objc_storeStrong((id *)&self->_routingToken, 0);
}

@end