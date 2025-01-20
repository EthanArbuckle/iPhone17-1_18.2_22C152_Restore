@interface CKDPResponseOperationResultErrorExtension
- (BOOL)hasExtensionName;
- (BOOL)hasExtensionPayload;
- (BOOL)hasTypeCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)extensionPayload;
- (NSString)extensionName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)typeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExtensionName:(id)a3;
- (void)setExtensionPayload:(id)a3;
- (void)setHasTypeCode:(BOOL)a3;
- (void)setTypeCode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultErrorExtension

- (BOOL)hasExtensionName
{
  return self->_extensionName != 0;
}

- (void)setTypeCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_typeCode = a3;
}

- (void)setHasTypeCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTypeCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExtensionPayload
{
  return self->_extensionPayload != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorExtension;
  v4 = [(CKDPResponseOperationResultErrorExtension *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  extensionName = self->_extensionName;
  if (extensionName) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)extensionName, @"extensionName");
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v5, self->_typeCode);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"typeCode");
  }
  extensionPayload = self->_extensionPayload;
  if (extensionPayload) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)extensionPayload, @"extensionPayload");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorExtensionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_extensionName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_extensionPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  extensionName = self->_extensionName;
  id v8 = v4;
  if (extensionName)
  {
    objc_msgSend_setExtensionName_(v4, v5, (uint64_t)extensionName);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_typeCode;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  extensionPayload = self->_extensionPayload;
  if (extensionPayload)
  {
    objc_msgSend_setExtensionPayload_(v8, v5, (uint64_t)extensionPayload);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_extensionName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_typeCode;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_extensionPayload, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_11;
  }
  extensionName = self->_extensionName;
  uint64_t v9 = v4[1];
  if ((unint64_t)extensionName | v9)
  {
    if (!objc_msgSend_isEqual_(extensionName, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_typeCode != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  extensionPayload = self->_extensionPayload;
  uint64_t v11 = v4[2];
  if ((unint64_t)extensionPayload | v11) {
    char isEqual = objc_msgSend_isEqual_(extensionPayload, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_extensionName, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_typeCode;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ v4 ^ objc_msgSend_hash(self->_extensionPayload, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 1);
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setExtensionName_(self, v5, v6);
    id v4 = v8;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_typeCode = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setExtensionPayload_(self, v5, v7);
    id v4 = v8;
  }
}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void)setExtensionName:(id)a3
{
}

- (unsigned)typeCode
{
  return self->_typeCode;
}

- (NSData)extensionPayload
{
  return self->_extensionPayload;
}

- (void)setExtensionPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end