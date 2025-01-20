@interface CKDPSignedVersionedBlob
- (BOOL)canValidateWithKT;
- (BOOL)hasCanValidateWithKT;
- (BOOL)hasSerializedObject;
- (BOOL)hasSignature;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedObject;
- (NSData)signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanValidateWithKT:(BOOL)a3;
- (void)setHasCanValidateWithKT:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSerializedObject:(id)a3;
- (void)setSignature:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSignedVersionedBlob

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasSerializedObject
{
  return self->_serializedObject != 0;
}

- (void)setCanValidateWithKT:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_canValidateWithKT = a3;
}

- (void)setHasCanValidateWithKT:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanValidateWithKT
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSignedVersionedBlob;
  v4 = [(CKDPSignedVersionedBlob *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_version);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"version");
  }
  signature = self->_signature;
  if (signature) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)signature, @"signature");
  }
  serializedObject = self->_serializedObject;
  if (serializedObject) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)serializedObject, @"serializedObject");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_canValidateWithKT);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"canValidateWithKT");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E9180C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
  if (self->_serializedObject) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  signature = self->_signature;
  v8 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    id v4 = v8;
  }
  serializedObject = self->_serializedObject;
  if (serializedObject)
  {
    objc_msgSend_setSerializedObject_(v8, v5, (uint64_t)serializedObject);
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_canValidateWithKT;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_version;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_serializedObject, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v16;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v12 + 28) = self->_canValidateWithKT;
    *(unsigned char *)(v12 + 32) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (v4[4])
  {
    goto LABEL_13;
  }
  signature = self->_signature;
  uint64_t v9 = v4[2];
  if ((unint64_t)signature | v9 && !objc_msgSend_isEqual_(signature, v7, v9)) {
    goto LABEL_13;
  }
  serializedObject = self->_serializedObject;
  uint64_t v11 = v4[1];
  if ((unint64_t)serializedObject | v11)
  {
    if (!objc_msgSend_isEqual_(serializedObject, v7, v11)) {
      goto LABEL_13;
    }
  }
  BOOL v12 = (v4[4] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0)
    {
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
    if (self->_canValidateWithKT)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_13;
    }
    BOOL v12 = 1;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_signature, a2, v2);
  uint64_t v8 = objc_msgSend_hash(self->_serializedObject, v6, v7);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_canValidateWithKT;
  }
  else {
    uint64_t v9 = 0;
  }
  return v5 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 32))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = *((void *)v4 + 2);
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    id v4 = v8;
  }
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setSerializedObject_(self, v5, v7);
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_canValidateWithKT = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)version
{
  return self->_version;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSData)serializedObject
{
  return self->_serializedObject;
}

- (void)setSerializedObject:(id)a3
{
}

- (BOOL)canValidateWithKT
{
  return self->_canValidateWithKT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_serializedObject, 0);
}

@end