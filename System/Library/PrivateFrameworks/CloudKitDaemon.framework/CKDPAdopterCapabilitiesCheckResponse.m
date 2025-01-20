@interface CKDPAdopterCapabilitiesCheckResponse
- (BOOL)hasIsSupported;
- (BOOL)hasSignedShareUsage;
- (BOOL)hasSignedSupportedAdopterCapabilities;
- (BOOL)hasSignedZoneUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (BOOL)readFrom:(id)a3;
- (CKDPSignedVersionedBlob)signedShareUsage;
- (CKDPSignedVersionedBlob)signedSupportedAdopterCapabilities;
- (CKDPSignedVersionedBlob)signedZoneUsage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsSupported:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setSignedShareUsage:(id)a3;
- (void)setSignedSupportedAdopterCapabilities:(id)a3;
- (void)setSignedZoneUsage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAdopterCapabilitiesCheckResponse

- (void)setIsSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isSupported = a3;
}

- (void)setHasIsSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSupported
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSignedSupportedAdopterCapabilities
{
  return self->_signedSupportedAdopterCapabilities != 0;
}

- (BOOL)hasSignedShareUsage
{
  return self->_signedShareUsage != 0;
}

- (BOOL)hasSignedZoneUsage
{
  return self->_signedZoneUsage != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAdopterCapabilitiesCheckResponse;
  v4 = [(CKDPAdopterCapabilitiesCheckResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isSupported);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"isSupported");
  }
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  if (signedSupportedAdopterCapabilities)
  {
    v10 = objc_msgSend_dictionaryRepresentation(signedSupportedAdopterCapabilities, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"signedSupportedAdopterCapabilities");
  }
  signedShareUsage = self->_signedShareUsage;
  if (signedShareUsage)
  {
    v13 = objc_msgSend_dictionaryRepresentation(signedShareUsage, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"signedShareUsage");
  }
  signedZoneUsage = self->_signedZoneUsage;
  if (signedZoneUsage)
  {
    v16 = objc_msgSend_dictionaryRepresentation(signedZoneUsage, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"signedZoneUsage");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FFE540((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_signedSupportedAdopterCapabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_signedShareUsage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_signedZoneUsage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_isSupported;
    v4[36] |= 1u;
  }
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  v9 = v4;
  if (signedSupportedAdopterCapabilities)
  {
    objc_msgSend_setSignedSupportedAdopterCapabilities_(v4, v5, (uint64_t)signedSupportedAdopterCapabilities);
    id v4 = v9;
  }
  signedShareUsage = self->_signedShareUsage;
  if (signedShareUsage)
  {
    objc_msgSend_setSignedShareUsage_(v9, v5, (uint64_t)signedShareUsage);
    id v4 = v9;
  }
  signedZoneUsage = self->_signedZoneUsage;
  if (signedZoneUsage)
  {
    objc_msgSend_setSignedZoneUsage_(v9, v5, (uint64_t)signedZoneUsage);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 32) = self->_isSupported;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_signedSupportedAdopterCapabilities, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_signedShareUsage, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_signedZoneUsage, v18, (uint64_t)a3);
  v20 = (void *)v12[3];
  v12[3] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_isSupported)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    char isEqual = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_10:
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  uint64_t v9 = v4[2];
  if ((unint64_t)signedSupportedAdopterCapabilities | v9
    && !objc_msgSend_isEqual_(signedSupportedAdopterCapabilities, v7, v9))
  {
    goto LABEL_16;
  }
  signedShareUsage = self->_signedShareUsage;
  uint64_t v11 = v4[1];
  if ((unint64_t)signedShareUsage | v11)
  {
    if (!objc_msgSend_isEqual_(signedShareUsage, v7, v11)) {
      goto LABEL_16;
    }
  }
  signedZoneUsage = self->_signedZoneUsage;
  uint64_t v13 = v4[3];
  if ((unint64_t)signedZoneUsage | v13) {
    char isEqual = objc_msgSend_isEqual_(signedZoneUsage, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_17:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isSupported;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_signedSupportedAdopterCapabilities, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_signedShareUsage, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_signedZoneUsage, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[36])
  {
    self->_isSupported = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
  signedSupportedAdopterCapabilities = self->_signedSupportedAdopterCapabilities;
  uint64_t v7 = v5[2];
  v12 = v5;
  if (signedSupportedAdopterCapabilities)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(signedSupportedAdopterCapabilities, (const char *)v5, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setSignedSupportedAdopterCapabilities_(self, (const char *)v5, v7);
  }
  uint64_t v5 = v12;
LABEL_9:
  signedShareUsage = self->_signedShareUsage;
  uint64_t v9 = v5[1];
  if (signedShareUsage)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(signedShareUsage, (const char *)v5, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setSignedShareUsage_(self, (const char *)v5, v9);
  }
  uint64_t v5 = v12;
LABEL_15:
  signedZoneUsage = self->_signedZoneUsage;
  uint64_t v11 = v5[3];
  if (signedZoneUsage)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(signedZoneUsage, (const char *)v5, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setSignedZoneUsage_(self, (const char *)v5, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (CKDPSignedVersionedBlob)signedSupportedAdopterCapabilities
{
  return self->_signedSupportedAdopterCapabilities;
}

- (void)setSignedSupportedAdopterCapabilities:(id)a3
{
}

- (CKDPSignedVersionedBlob)signedShareUsage
{
  return self->_signedShareUsage;
}

- (void)setSignedShareUsage:(id)a3
{
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
  objc_storeStrong((id *)&self->_signedZoneUsage, 0);
  objc_storeStrong((id *)&self->_signedSupportedAdopterCapabilities, 0);
  objc_storeStrong((id *)&self->_signedShareUsage, 0);
}

@end