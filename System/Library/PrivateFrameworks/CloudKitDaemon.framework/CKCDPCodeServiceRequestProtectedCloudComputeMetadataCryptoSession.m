@interface CKCDPCodeServiceRequestProtectedCloudComputeMetadataCryptoSession
- (BOOL)hasWrappedInvocationKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)wrappedInvocationKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setWrappedInvocationKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestProtectedCloudComputeMetadataCryptoSession

- (BOOL)hasWrappedInvocationKey
{
  return self->_wrappedInvocationKey != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestProtectedCloudComputeMetadataCryptoSession;
  v4 = [(CKCDPCodeServiceRequestProtectedCloudComputeMetadataCryptoSession *)&v11 description];
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
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FC0398((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_wrappedInvocationKey) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  wrappedInvocationKey = self->_wrappedInvocationKey;
  if (wrappedInvocationKey) {
    objc_msgSend_setWrappedInvocationKey_(a3, a2, (uint64_t)wrappedInvocationKey);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_wrappedInvocationKey, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    wrappedInvocationKey = self->_wrappedInvocationKey;
    uint64_t v9 = v4[1];
    if ((unint64_t)wrappedInvocationKey | v9) {
      char isEqual = objc_msgSend_isEqual_(wrappedInvocationKey, v7, v9);
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
  return objc_msgSend_hash(self->_wrappedInvocationKey, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    objc_msgSend_setWrappedInvocationKey_(self, a2, v3);
  }
}

- (NSData)wrappedInvocationKey
{
  return self->_wrappedInvocationKey;
}

- (void)setWrappedInvocationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end