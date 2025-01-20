@interface CKDPZoneUsageSaveRequest
+ (id)options;
- (BOOL)hasSignedZoneUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPSignedVersionedBlob)signedZoneUsage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSignedZoneUsage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneUsageSaveRequest

+ (id)options
{
  if (qword_1EBBCFCA0 != -1) {
    dispatch_once(&qword_1EBBCFCA0, &unk_1F2043670);
  }
  v2 = (void *)qword_1EBBCFC98;
  return v2;
}

- (BOOL)hasSignedZoneUsage
{
  return self->_signedZoneUsage != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneUsageSaveRequest;
  v4 = [(CKDPZoneUsageSaveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  signedZoneUsage = self->_signedZoneUsage;
  if (signedZoneUsage)
  {
    v8 = objc_msgSend_dictionaryRepresentation(signedZoneUsage, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"signedZoneUsage");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E7383C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_signedZoneUsage) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  signedZoneUsage = self->_signedZoneUsage;
  if (signedZoneUsage) {
    objc_msgSend_setSignedZoneUsage_(a3, a2, (uint64_t)signedZoneUsage);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_signedZoneUsage, v11, (uint64_t)a3);
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
    signedZoneUsage = self->_signedZoneUsage;
    uint64_t v9 = v4[1];
    if ((unint64_t)signedZoneUsage | v9) {
      char isEqual = objc_msgSend_isEqual_(signedZoneUsage, v7, v9);
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
  return objc_msgSend_hash(self->_signedZoneUsage, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  v4 = (const char *)a3;
  signedZoneUsage = self->_signedZoneUsage;
  uint64_t v6 = *((void *)v4 + 1);
  if (signedZoneUsage)
  {
    if (v6) {
      objc_msgSend_mergeFrom_(signedZoneUsage, v4, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend_setSignedZoneUsage_(self, v4, v6);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPSignedVersionedBlob)signedZoneUsage
{
  return self->_signedZoneUsage;
}

- (void)setSignedZoneUsage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end