@interface CKDPAnonymousShareRemoveRequest
+ (id)options;
- (BOOL)hasAnonymousShareTupleHash;
- (BOOL)hasEncryptedShareTuple;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSData)encryptedShareTuple;
- (NSString)anonymousShareTupleHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousShareTupleHash:(id)a3;
- (void)setEncryptedShareTuple:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAnonymousShareRemoveRequest

+ (id)options
{
  if (qword_1EBBCDD00 != -1) {
    dispatch_once(&qword_1EBBCDD00, &unk_1F2042E90);
  }
  v2 = (void *)qword_1EBBCDCF8;
  return v2;
}

- (BOOL)hasAnonymousShareTupleHash
{
  return self->_anonymousShareTupleHash != 0;
}

- (BOOL)hasEncryptedShareTuple
{
  return self->_encryptedShareTuple != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAnonymousShareRemoveRequest;
  v4 = [(CKDPAnonymousShareRemoveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  anonymousShareTupleHash = self->_anonymousShareTupleHash;
  if (anonymousShareTupleHash) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)anonymousShareTupleHash, @"anonymousShareTupleHash");
  }
  encryptedShareTuple = self->_encryptedShareTuple;
  if (encryptedShareTuple) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedShareTuple, @"encryptedShareTuple");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DAAD8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_anonymousShareTupleHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_encryptedShareTuple)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 82;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  anonymousShareTupleHash = self->_anonymousShareTupleHash;
  id v8 = v4;
  if (anonymousShareTupleHash)
  {
    objc_msgSend_setAnonymousShareTupleHash_(v4, v5, (uint64_t)anonymousShareTupleHash);
    id v4 = v8;
  }
  encryptedShareTuple = self->_encryptedShareTuple;
  if (encryptedShareTuple)
  {
    objc_msgSend_setEncryptedShareTuple_(v8, v5, (uint64_t)encryptedShareTuple);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_anonymousShareTupleHash, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_encryptedShareTuple, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((anonymousShareTupleHash = self->_anonymousShareTupleHash,
         uint64_t v9 = v4[1],
         !((unint64_t)anonymousShareTupleHash | v9))
     || objc_msgSend_isEqual_(anonymousShareTupleHash, v7, v9)))
  {
    encryptedShareTuple = self->_encryptedShareTuple;
    uint64_t v11 = v4[2];
    if ((unint64_t)encryptedShareTuple | v11) {
      char isEqual = objc_msgSend_isEqual_(encryptedShareTuple, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_anonymousShareTupleHash, a2, v2);
  return objc_msgSend_hash(self->_encryptedShareTuple, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[1];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setAnonymousShareTupleHash_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setEncryptedShareTuple_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)anonymousShareTupleHash
{
  return self->_anonymousShareTupleHash;
}

- (void)setAnonymousShareTupleHash:(id)a3
{
}

- (NSData)encryptedShareTuple
{
  return self->_encryptedShareTuple;
}

- (void)setEncryptedShareTuple:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedShareTuple, 0);
  objc_storeStrong((id *)&self->_anonymousShareTupleHash, 0);
}

@end