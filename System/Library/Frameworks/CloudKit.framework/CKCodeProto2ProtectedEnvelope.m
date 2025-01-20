@interface CKCodeProto2ProtectedEnvelope
- (BOOL)hasContents;
- (BOOL)hasEncrypted;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCodeProto2Any)value;
- (NSData)encrypted;
- (id)contentsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContents:(id)a3;
- (int)contents;
- (unint64_t)hash;
- (void)clearOneofValuesForContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(int)a3;
- (void)setEncrypted:(id)a3;
- (void)setHasContents:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCodeProto2ProtectedEnvelope

- (BOOL)hasEncrypted
{
  return self->_encrypted != 0;
}

- (void)setEncrypted:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 1u;
  self->_contents = 1;
  encrypted = self->_encrypted;
  self->_encrypted = v4;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
  v4 = (CKCodeProto2Any *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 1u;
  self->_contents = 2;
  value = self->_value;
  self->_value = v4;
}

- (int)contents
{
  if (*(unsigned char *)&self->_has) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setContents:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contents = a3;
}

- (void)setHasContents:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContents
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)contentsAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5462AB0[a3];
  }

  return v4;
}

- (int)StringAsContents:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"encrypted", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"value", v10))
  {
    int v8 = 2;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForContents
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_contents = 0;
  encrypted = self->_encrypted;
  self->_encrypted = 0;

  value = self->_value;
  self->_value = 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKCodeProto2ProtectedEnvelope;
  v4 = [(CKCodeProto2ProtectedEnvelope *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = v5;
  encrypted = self->_encrypted;
  if (encrypted) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)encrypted, @"encrypted");
  }
  value = self->_value;
  if (value)
  {
    v11 = objc_msgSend_dictionaryRepresentation(value, v6, (uint64_t)encrypted, v7);
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, @"value");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t contents = self->_contents;
    if (contents >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v7, self->_contents);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E5462AB0[contents];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v14, @"contents");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKCodeProto2ProtectedEnvelopeReadFrom((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encrypted)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_value)
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
    v4[2] = self->_contents;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  encrypted = self->_encrypted;
  v9 = v4;
  if (encrypted)
  {
    objc_msgSend_setEncrypted_(v4, v5, (uint64_t)encrypted, v6);
    id v4 = v9;
  }
  value = self->_value;
  if (value)
  {
    objc_msgSend_setValue_(v9, v5, (uint64_t)value, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  int v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 8) = self->_contents;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_encrypted, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[2];
  v15[2] = v16;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_value, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[3];
  v15[3] = v20;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_contents != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (v4[4])
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  encrypted = self->_encrypted;
  uint64_t v11 = v4[2];
  if ((unint64_t)encrypted | v11 && !objc_msgSend_isEqual_(encrypted, v8, v11, v9)) {
    goto LABEL_11;
  }
  value = self->_value;
  uint64_t v13 = v4[3];
  if ((unint64_t)value | v13) {
    char isEqual = objc_msgSend_isEqual_(value, v8, v13, v9);
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
    uint64_t v5 = 2654435761 * self->_contents;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend_hash(self->_encrypted, a2, v2, v3) ^ v5;
  return v6 ^ objc_msgSend_hash(self->_value, v7, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = (const char *)v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_uint64_t contents = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 2);
  uint64_t v10 = (const char *)v4;
  if (v7)
  {
    objc_msgSend_setEncrypted_(self, (const char *)v4, v7, v5);
    uint64_t v6 = v10;
  }
  value = self->_value;
  uint64_t v9 = *((void *)v6 + 3);
  if (value)
  {
    if (!v9) {
      goto LABEL_11;
    }
    value = objc_msgSend_mergeFrom_(value, v6, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_11;
    }
    value = objc_msgSend_setValue_(self, v6, v9, v5);
  }
  uint64_t v6 = v10;
LABEL_11:

  MEMORY[0x1F41817F8](value, v6);
}

- (NSData)encrypted
{
  return self->_encrypted;
}

- (CKCodeProto2Any)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_encrypted, 0);
}

@end