@interface CKDPZoneSignedCryptoRequirements
- (BOOL)hasSerializedRequirements;
- (BOOL)hasSignature;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serializedRequirements;
- (NSData)signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSerializedRequirements:(id)a3;
- (void)setSignature:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneSignedCryptoRequirements

- (int)version
{
  if (*(unsigned char *)&self->_has) {
    return self->_version;
  }
  else {
    return 1;
  }
}

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

- (BOOL)hasSerializedRequirements
{
  return self->_serializedRequirements != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneSignedCryptoRequirements;
  v4 = [(CKDPZoneSignedCryptoRequirements *)&v11 description];
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
  serializedRequirements = self->_serializedRequirements;
  if (serializedRequirements) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)serializedRequirements, @"serializedRequirements");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DED21C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_serializedRequirements)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  signature = self->_signature;
  v8 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    id v4 = v8;
  }
  serializedRequirements = self->_serializedRequirements;
  if (serializedRequirements)
  {
    objc_msgSend_setSerializedRequirements_(v8, v5, (uint64_t)serializedRequirements);
    id v4 = v8;
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
    *(_DWORD *)(v10 + 24) = self->_version;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_serializedRequirements, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  signature = self->_signature;
  uint64_t v9 = v4[2];
  if ((unint64_t)signature | v9 && !objc_msgSend_isEqual_(signature, v7, v9)) {
    goto LABEL_11;
  }
  serializedRequirements = self->_serializedRequirements;
  uint64_t v11 = v4[1];
  if ((unint64_t)serializedRequirements | v11) {
    char isEqual = objc_msgSend_isEqual_(serializedRequirements, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_signature, a2, v2) ^ v4;
  return v5 ^ objc_msgSend_hash(self->_serializedRequirements, v6, v7);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 28))
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
    objc_msgSend_setSerializedRequirements_(self, v5, v7);
    id v4 = v8;
  }
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSData)serializedRequirements
{
  return self->_serializedRequirements;
}

- (void)setSerializedRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_serializedRequirements, 0);
}

@end