@interface CKDPMergeableDeltaRetrieveRequest
+ (id)options;
- (BOOL)hasContinuation;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPMergeableValueIdentifier)identifier;
- (Class)responseClass;
- (NSData)continuation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContinuation:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPMergeableDeltaRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDE70 != -1) {
    dispatch_once(&qword_1EBBCDE70, &unk_1F2043EB0);
  }
  v2 = (void *)qword_1EBBCDE68;
  return v2;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasContinuation
{
  return self->_continuation != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPMergeableDeltaRetrieveRequest;
  v4 = [(CKDPMergeableDeltaRetrieveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  continuation = self->_continuation;
  if (continuation) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)continuation, @"continuation");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EEAA78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_continuation)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 77;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v8 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    id v4 = v8;
  }
  continuation = self->_continuation;
  if (continuation)
  {
    objc_msgSend_setContinuation_(v8, v5, (uint64_t)continuation);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_continuation, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((identifier = self->_identifier, uint64_t v9 = v4[2], !((unint64_t)identifier | v9))
     || objc_msgSend_isEqual_(identifier, v7, v9)))
  {
    continuation = self->_continuation;
    uint64_t v11 = v4[1];
    if ((unint64_t)continuation | v11) {
      char isEqual = objc_msgSend_isEqual_(continuation, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  return objc_msgSend_hash(self->_continuation, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (identifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v8;
LABEL_7:
  uint64_t v7 = v4[1];
  if (v7) {
    objc_msgSend_setContinuation_(self, (const char *)v4, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_continuation, 0);
}

@end