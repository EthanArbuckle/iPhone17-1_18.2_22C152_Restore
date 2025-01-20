@interface CKCodeRecordTransport
- (BOOL)hasContents;
- (BOOL)hasEncryptedMasterKey;
- (BOOL)hasLocalSerialization;
- (BOOL)hasWireSerialization;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCodeRecordTransport)initWithRecord:(id)a3;
- (NSData)encryptedMasterKey;
- (NSData)localSerialization;
- (NSData)wireSerialization;
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
- (void)setEncryptedMasterKey:(id)a3;
- (void)setHasContents:(BOOL)a3;
- (void)setLocalSerialization:(id)a3;
- (void)setWireSerialization:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCodeRecordTransport

- (CKCodeRecordTransport)initWithRecord:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKCodeRecordTransport;
  v9 = [(CKCodeRecordTransport *)&v33 init];
  if (v9)
  {
    v10 = objc_msgSend_valueStore(v5, v6, v7, v8);
    v34[0] = objc_opt_class();
    v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v34, 1);
    int v14 = objc_msgSend_containsValueOfClasses_options_passingTest_(v10, v13, (uint64_t)v12, 1, &unk_1ED7EEEF8);

    if (v14)
    {
      v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16, v17);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)v9, @"CKRecord_CodeExtensions.m", 23, @"CKRecords sent via Inverness cannot container in-memory asset content");
    }
    id v18 = objc_alloc(MEMORY[0x1E4F28DB0]);
    inited = objc_msgSend_initRequiringSecureCoding_(v18, v19, 1, v20);
    objc_msgSend_encodeWithCoder_(v5, v22, (uint64_t)inited, v23);
    v27 = objc_msgSend_encodedData(inited, v24, v25, v26);
    objc_msgSend_setLocalSerialization_(v9, v28, (uint64_t)v27, v29);
  }
  return v9;
}

- (BOOL)hasLocalSerialization
{
  return self->_localSerialization != 0;
}

- (void)setLocalSerialization:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 1u;
  self->_contents = 1;
  localSerialization = self->_localSerialization;
  self->_localSerialization = v4;
}

- (BOOL)hasWireSerialization
{
  return self->_wireSerialization != 0;
}

- (void)setWireSerialization:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForContents(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 1u;
  self->_contents = 2;
  wireSerialization = self->_wireSerialization;
  self->_wireSerialization = v4;
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
    v4 = off_1E5464A28[a3];
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
  else if (objc_msgSend_isEqualToString_(v3, v6, @"localSerialization", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"wireSerialization", v10))
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
  localSerialization = self->_localSerialization;
  self->_localSerialization = 0;

  wireSerialization = self->_wireSerialization;
  self->_wireSerialization = 0;
}

- (BOOL)hasEncryptedMasterKey
{
  return self->_encryptedMasterKey != 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKCodeRecordTransport;
  v4 = [(CKCodeRecordTransport *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = v5;
  localSerialization = self->_localSerialization;
  if (localSerialization) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)localSerialization, @"localSerialization");
  }
  wireSerialization = self->_wireSerialization;
  if (wireSerialization) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)wireSerialization, @"wireSerialization");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t contents = self->_contents;
    if (contents >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v7, self->_contents);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5464A28[contents];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v12, @"contents");
  }
  encryptedMasterKey = self->_encryptedMasterKey;
  if (encryptedMasterKey) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)encryptedMasterKey, @"encryptedMasterKey");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKCodeRecordTransportReadFrom((uint64_t)self, (uint64_t)a3, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localSerialization)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_wireSerialization)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedMasterKey)
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
    v4[2] = self->_contents;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  localSerialization = self->_localSerialization;
  uint64_t v10 = v4;
  if (localSerialization)
  {
    objc_msgSend_setLocalSerialization_(v4, v5, (uint64_t)localSerialization, v6);
    id v4 = v10;
  }
  wireSerialization = self->_wireSerialization;
  if (wireSerialization)
  {
    objc_msgSend_setWireSerialization_(v10, v5, (uint64_t)wireSerialization, v6);
    id v4 = v10;
  }
  encryptedMasterKey = self->_encryptedMasterKey;
  if (encryptedMasterKey)
  {
    objc_msgSend_setEncryptedMasterKey_(v10, v5, (uint64_t)encryptedMasterKey, v6);
    id v4 = v10;
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
    *(unsigned char *)(v12 + 40) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_localSerialization, v13, (uint64_t)a3, v14);
  uint64_t v17 = (void *)v15[3];
  v15[3] = v16;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_wireSerialization, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[4];
  v15[4] = v20;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_encryptedMasterKey, v22, (uint64_t)a3, v23);
  uint64_t v25 = (void *)v15[2];
  v15[2] = v24;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) == 0 || self->_contents != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (v4[5])
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  localSerialization = self->_localSerialization;
  uint64_t v11 = v4[3];
  if ((unint64_t)localSerialization | v11
    && !objc_msgSend_isEqual_(localSerialization, v8, v11, v9))
  {
    goto LABEL_13;
  }
  wireSerialization = self->_wireSerialization;
  uint64_t v13 = v4[4];
  if ((unint64_t)wireSerialization | v13)
  {
    if (!objc_msgSend_isEqual_(wireSerialization, v8, v13, v9)) {
      goto LABEL_13;
    }
  }
  encryptedMasterKey = self->_encryptedMasterKey;
  uint64_t v15 = v4[2];
  if ((unint64_t)encryptedMasterKey | v15) {
    char isEqual = objc_msgSend_isEqual_(encryptedMasterKey, v8, v15, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

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
  uint64_t v6 = objc_msgSend_hash(self->_localSerialization, a2, v2, v3) ^ v5;
  uint64_t v10 = objc_msgSend_hash(self->_wireSerialization, v7, v8, v9);
  return v6 ^ v10 ^ objc_msgSend_hash(self->_encryptedMasterKey, v11, v12, v13);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 40))
  {
    self->_uint64_t contents = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 3);
  id v10 = v4;
  if (v7)
  {
    objc_msgSend_setLocalSerialization_(self, v5, v7, v6);
    id v4 = v10;
  }
  uint64_t v8 = *((void *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setWireSerialization_(self, v5, v8, v6);
    id v4 = v10;
  }
  uint64_t v9 = *((void *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setEncryptedMasterKey_(self, v5, v9, v6);
    id v4 = v10;
  }
}

- (NSData)localSerialization
{
  return self->_localSerialization;
}

- (NSData)wireSerialization
{
  return self->_wireSerialization;
}

- (NSData)encryptedMasterKey
{
  return self->_encryptedMasterKey;
}

- (void)setEncryptedMasterKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wireSerialization, 0);
  objc_storeStrong((id *)&self->_localSerialization, 0);

  objc_storeStrong((id *)&self->_encryptedMasterKey, 0);
}

@end