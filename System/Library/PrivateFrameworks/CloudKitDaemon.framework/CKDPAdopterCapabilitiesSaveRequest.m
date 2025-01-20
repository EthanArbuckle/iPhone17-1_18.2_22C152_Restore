@interface CKDPAdopterCapabilitiesSaveRequest
+ (id)options;
- (BOOL)hasSignedSupportedAdopterCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPSignedVersionedBlob)signedSupportedAdopterCapabilities;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSignedSupportedAdopterCapabilities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAdopterCapabilitiesSaveRequest

+ (id)options
{
  if (qword_1EBBCFFD0 != -1) {
    dispatch_once(&qword_1EBBCFFD0, &unk_1F2044490);
  }
  v2 = (void *)qword_1EBBCFFC8;
  return v2;
}

- (BOOL)hasSignedSupportedAdopterCapabilities
{
  return self->_signedSupportedAdopterCapabilities != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAdopterCapabilitiesSaveRequest;
  v4 = [(CKDPAdopterCapabilitiesSaveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  if (signedSupportedAdopterCapabilities)
  {
    v8 = objc_msgSend_dictionaryRepresentation(signedSupportedAdopterCapabilities, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"signedSupportedAdopterCapabilities");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F6FF10((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_signedSupportedAdopterCapabilities) {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 92;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  if (signedSupportedAdopterCapabilities) {
    objc_msgSend_setSignedSupportedAdopterCapabilities_(a3, a2, (uint64_t)signedSupportedAdopterCapabilities);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_signedSupportedAdopterCapabilities, v11, (uint64_t)a3);
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
    signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
    uint64_t v9 = v4[1];
    if ((unint64_t)signedSupportedAdopterCapabilities | v9) {
      char isEqual = objc_msgSend_isEqual_(signedSupportedAdopterCapabilities, v7, v9);
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
  return objc_msgSend_hash(self->_signedSupportedAdopterCapabilities, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  v4 = (const char *)a3;
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  uint64_t v6 = *((void *)v4 + 1);
  if (signedSupportedAdopterCapabilities)
  {
    if (v6) {
      objc_msgSend_mergeFrom_(signedSupportedAdopterCapabilities, v4, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend_setSignedSupportedAdopterCapabilities_(self, v4, v6);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPSignedVersionedBlob)signedSupportedAdopterCapabilities
{
  return self->_signedSupportedAdopterCapabilities;
}

- (void)setSignedSupportedAdopterCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end