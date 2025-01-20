@interface CKDPPackageManifestSection
- (BOOL)hasLastSection;
- (BOOL)hasSignature;
- (BOOL)hasSize;
- (BOOL)hasVerificationKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastSection;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSData)verificationKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)size;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLastSection:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setLastSection:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setVerificationKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPPackageManifestSection

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLastSection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastSection = a3;
}

- (void)setHasLastSection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastSection
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasVerificationKey
{
  return self->_verificationKey != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPPackageManifestSection;
  v4 = [(CKDPPackageManifestSection *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  signature = self->_signature;
  if (signature) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)signature, @"signature");
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v5, self->_size);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"size");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v11 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_lastSection);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"lastSection");
  }
  verificationKey = self->_verificationKey;
  if (verificationKey) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)verificationKey, @"verificationKey");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 16;
          goto LABEL_37;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          int64_t v23 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v24 = *v4;
            unint64_t v25 = *(void *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
              *(void *)((char *)a3 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  int64_t v23 = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            int64_t v23 = 0;
          }
LABEL_41:
          self->_size = v23;
          continue;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)&self->_has |= 2u;
          break;
        case 4u:
          PBReaderReadData();
          v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = 24;
LABEL_37:
          v33 = *(Class *)((char *)&self->super.super.isa + v19);
          *(Class *)((char *)&self->super.super.isa + v19) = v18;

          continue;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v4;
        unint64_t v31 = *(void *)((char *)a3 + v30);
        if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v31);
        *(void *)((char *)a3 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_43;
        }
        v27 += 7;
        BOOL v15 = v28++ >= 9;
        if (v15)
        {
          uint64_t v29 = 0;
          goto LABEL_45;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_43:
      if (*((unsigned char *)a3 + *v6)) {
        uint64_t v29 = 0;
      }
LABEL_45:
      self->_lastSection = v29 != 0;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_verificationKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  signature = self->_signature;
  id v9 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_size;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_lastSection;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  verificationKey = self->_verificationKey;
  if (verificationKey)
  {
    objc_msgSend_setVerificationKey_(v9, v5, (uint64_t)verificationKey);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  unint64_t v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_size;
    *(unsigned char *)(v10 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 32) = self->_lastSection;
    *(unsigned char *)(v10 + 36) |= 2u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_verificationKey, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v16;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  signature = self->_signature;
  uint64_t v9 = v4[2];
  if ((unint64_t)signature | v9)
  {
    if (!objc_msgSend_isEqual_(signature, v7, v9)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_size != v4[1]) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_19;
    }
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  if ((*((unsigned char *)v4 + 36) & 2) == 0) {
    goto LABEL_13;
  }
  if (!self->_lastSection)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_13;
  }
LABEL_19:
  verificationKey = self->_verificationKey;
  uint64_t v13 = v4[3];
  if ((unint64_t)verificationKey | v13) {
    char isEqual = objc_msgSend_isEqual_(verificationKey, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_signature, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_size;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_verificationKey, v5, v6);
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_lastSection;
  return v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_verificationKey, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    id v4 = v9;
  }
  char v7 = *((unsigned char *)v4 + 36);
  if (v7)
  {
    self->_size = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 36);
  }
  if ((v7 & 2) != 0)
  {
    self->_lastSection = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v8 = *((void *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setVerificationKey_(self, v5, v8);
    id v4 = v9;
  }
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (BOOL)lastSection
{
  return self->_lastSection;
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end