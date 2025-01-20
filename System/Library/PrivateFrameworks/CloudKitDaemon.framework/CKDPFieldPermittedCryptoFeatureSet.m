@interface CKDPFieldPermittedCryptoFeatureSet
- (BOOL)hasMinimumSchemaVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)assetKeyEncryptionTypeAtIndex:(unint64_t)a3;
- (int)assetKeyEncryptionTypes;
- (int)encryptedFieldContextTypeAtIndex:(unint64_t)a3;
- (int)encryptedFieldContextTypes;
- (int)minimumSchemaVersion;
- (int)mmcsVersionAtIndex:(unint64_t)a3;
- (int)mmcsVersions;
- (unint64_t)assetKeyEncryptionTypesCount;
- (unint64_t)encryptedFieldContextTypesCount;
- (unint64_t)hash;
- (unint64_t)mmcsVersionsCount;
- (void)addAssetKeyEncryptionType:(int)a3;
- (void)addEncryptedFieldContextType:(int)a3;
- (void)addMmcsVersion:(int)a3;
- (void)clearAssetKeyEncryptionTypes;
- (void)clearEncryptedFieldContextTypes;
- (void)clearMmcsVersions;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssetKeyEncryptionTypes:(int *)a3 count:(unint64_t)a4;
- (void)setEncryptedFieldContextTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasMinimumSchemaVersion:(BOOL)a3;
- (void)setMinimumSchemaVersion:(int)a3;
- (void)setMmcsVersions:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CKDPFieldPermittedCryptoFeatureSet

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPFieldPermittedCryptoFeatureSet;
  [(CKDPFieldPermittedCryptoFeatureSet *)&v3 dealloc];
}

- (int)minimumSchemaVersion
{
  if (*(unsigned char *)&self->_has) {
    return self->_minimumSchemaVersion;
  }
  else {
    return 1;
  }
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)mmcsVersionsCount
{
  return self->_mmcsVersions.count;
}

- (int)mmcsVersions
{
  return self->_mmcsVersions.list;
}

- (void)clearMmcsVersions
{
}

- (void)addMmcsVersion:(int)a3
{
}

- (int)mmcsVersionAtIndex:(unint64_t)a3
{
  p_mmcsVersions = &self->_mmcsVersions;
  unint64_t count = self->_mmcsVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_mmcsVersions->list[a3];
}

- (void)setMmcsVersions:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)encryptedFieldContextTypesCount
{
  return self->_encryptedFieldContextTypes.count;
}

- (int)encryptedFieldContextTypes
{
  return self->_encryptedFieldContextTypes.list;
}

- (void)clearEncryptedFieldContextTypes
{
}

- (void)addEncryptedFieldContextType:(int)a3
{
}

- (int)encryptedFieldContextTypeAtIndex:(unint64_t)a3
{
  p_encryptedFieldContextTypes = &self->_encryptedFieldContextTypes;
  unint64_t count = self->_encryptedFieldContextTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_encryptedFieldContextTypes->list[a3];
}

- (void)setEncryptedFieldContextTypes:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)assetKeyEncryptionTypesCount
{
  return self->_assetKeyEncryptionTypes.count;
}

- (int)assetKeyEncryptionTypes
{
  return self->_assetKeyEncryptionTypes.list;
}

- (void)clearAssetKeyEncryptionTypes
{
}

- (void)addAssetKeyEncryptionType:(int)a3
{
}

- (int)assetKeyEncryptionTypeAtIndex:(unint64_t)a3
{
  p_assetKeyEncryptionTypes = &self->_assetKeyEncryptionTypes;
  unint64_t count = self->_assetKeyEncryptionTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_assetKeyEncryptionTypes->list[a3];
}

- (void)setAssetKeyEncryptionTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPFieldPermittedCryptoFeatureSet;
  v4 = [(CKDPFieldPermittedCryptoFeatureSet *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_minimumSchemaVersion);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"minimumSchemaVersion");
  }
  v8 = PBRepeatedInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, @"mmcsVersion");

  v10 = PBRepeatedInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"encryptedFieldContextType");

  uint64_t v12 = PBRepeatedInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, @"assetKeyEncryptionType");

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F51474((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_mmcsVersions.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v9;
      ++v5;
    }
    while (v5 < self->_mmcsVersions.count);
  }
  if (self->_encryptedFieldContextTypes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_encryptedFieldContextTypes.count);
  }
  p_assetKeyEncryptionTypes = &self->_assetKeyEncryptionTypes;
  if (p_assetKeyEncryptionTypes->count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v9;
      ++v8;
    }
    while (v8 < p_assetKeyEncryptionTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[20] = self->_minimumSchemaVersion;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  id v35 = v4;
  if (objc_msgSend_mmcsVersionsCount(self, v5, v6))
  {
    objc_msgSend_clearMmcsVersions(v35, v7, v8);
    uint64_t v11 = objc_msgSend_mmcsVersionsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_mmcsVersionAtIndex_(self, v7, i);
        objc_msgSend_addMmcsVersion_(v35, v15, v14);
      }
    }
  }
  if (objc_msgSend_encryptedFieldContextTypesCount(self, v7, v8))
  {
    objc_msgSend_clearEncryptedFieldContextTypes(v35, v16, v17);
    uint64_t v20 = objc_msgSend_encryptedFieldContextTypesCount(self, v18, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      for (uint64_t j = 0; j != v21; ++j)
      {
        uint64_t v23 = objc_msgSend_encryptedFieldContextTypeAtIndex_(self, v16, j);
        objc_msgSend_addEncryptedFieldContextType_(v35, v24, v23);
      }
    }
  }
  if (objc_msgSend_assetKeyEncryptionTypesCount(self, v16, v17))
  {
    objc_msgSend_clearAssetKeyEncryptionTypes(v35, v25, v26);
    uint64_t v29 = objc_msgSend_assetKeyEncryptionTypesCount(self, v27, v28);
    if (v29)
    {
      uint64_t v31 = v29;
      for (uint64_t k = 0; k != v31; ++k)
      {
        uint64_t v33 = objc_msgSend_assetKeyEncryptionTypeAtIndex_(self, v30, k);
        objc_msgSend_addAssetKeyEncryptionType_(v35, v34, v33);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v11 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 80) = self->_minimumSchemaVersion;
    *(unsigned char *)(v10 + 84) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 20)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
LABEL_10:
    char IsEqual = 0;
    goto LABEL_11;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_10;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_minimumSchemaVersion;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = PBRepeatedInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedInt32Hash();
  return v3 ^ v4 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[21])
  {
    self->_minimumSchemaVersion = v4[20];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v27 = v4;
  uint64_t v7 = objc_msgSend_mmcsVersionsCount(v4, v5, v6);
  if (v7)
  {
    uint64_t v10 = v7;
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = objc_msgSend_mmcsVersionAtIndex_(v27, v8, i);
      objc_msgSend_addMmcsVersion_(self, v13, v12);
    }
  }
  uint64_t v14 = objc_msgSend_encryptedFieldContextTypesCount(v27, v8, v9);
  if (v14)
  {
    uint64_t v17 = v14;
    for (uint64_t j = 0; j != v17; ++j)
    {
      uint64_t v19 = objc_msgSend_encryptedFieldContextTypeAtIndex_(v27, v15, j);
      objc_msgSend_addEncryptedFieldContextType_(self, v20, v19);
    }
  }
  uint64_t v21 = objc_msgSend_assetKeyEncryptionTypesCount(v27, v15, v16);
  if (v21)
  {
    uint64_t v23 = v21;
    for (uint64_t k = 0; k != v23; ++k)
    {
      uint64_t v25 = objc_msgSend_assetKeyEncryptionTypeAtIndex_(v27, v22, k);
      objc_msgSend_addAssetKeyEncryptionType_(self, v26, v25);
    }
  }
}

@end