@interface CKDPSignedZoneUsage
- (BOOL)hasSignature;
- (BOOL)hasVersion;
- (BOOL)hasZoneUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSData)zoneUsage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setVersion:(int)a3;
- (void)setZoneUsage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSignedZoneUsage

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

- (BOOL)hasZoneUsage
{
  return self->_zoneUsage != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSignedZoneUsage;
  v4 = [(CKDPSignedZoneUsage *)&v11 description];
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
  zoneUsage = self->_zoneUsage;
  if (zoneUsage) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)zoneUsage, @"zoneUsage");
  }
  return v5;
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
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        PBReaderReadData();
        v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = 24;
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            char v19 = 0;
            unsigned int v20 = 0;
            uint64_t v21 = 0;
            *(unsigned char *)&self->_has |= 1u;
            while (1)
            {
              uint64_t v22 = *v4;
              unint64_t v23 = *(void *)((char *)a3 + v22);
              if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v5)) {
                break;
              }
              char v24 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
              *(void *)((char *)a3 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if ((v24 & 0x80) == 0) {
                goto LABEL_34;
              }
              v19 += 7;
              BOOL v15 = v20++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_36;
              }
            }
            *((unsigned char *)a3 + *v6) = 1;
LABEL_34:
            if (*((unsigned char *)a3 + *v6)) {
              LODWORD(v21) = 0;
            }
LABEL_36:
            self->_version = v21;
          }
          else
          {
            int v28 = PBReaderSkipValueWithTag();
            if (!v28) {
              return v28;
            }
          }
          continue;
        }
        PBReaderReadData();
        v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = 8;
      }
      v27 = *(Class *)((char *)&self->super.super.isa + v26);
      *(Class *)((char *)&self->super.super.isa + v26) = v25;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v28) = *((unsigned char *)a3 + *v6) == 0;
  return v28;
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
  if (self->_zoneUsage)
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
    v4[4] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  signature = self->_signature;
  v8 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    id v4 = v8;
  }
  zoneUsage = self->_zoneUsage;
  if (zoneUsage)
  {
    objc_msgSend_setZoneUsage_(v8, v5, (uint64_t)zoneUsage);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_version;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  char v14 = (void *)v12[1];
  v12[1] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_zoneUsage, v15, (uint64_t)a3);
  v17 = (void *)v12[3];
  v12[3] = v16;

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
    if ((v4[4] & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (v4[4])
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  signature = self->_signature;
  uint64_t v9 = v4[1];
  if ((unint64_t)signature | v9 && !objc_msgSend_isEqual_(signature, v7, v9)) {
    goto LABEL_11;
  }
  zoneUsage = self->_zoneUsage;
  uint64_t v11 = v4[3];
  if ((unint64_t)zoneUsage | v11) {
    char isEqual = objc_msgSend_isEqual_(zoneUsage, v7, v11);
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
  return v5 ^ objc_msgSend_hash(self->_zoneUsage, v6, v7);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 32))
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v6 = *((void *)v4 + 1);
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    id v4 = v8;
  }
  uint64_t v7 = *((void *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setZoneUsage_(self, v5, v7);
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

- (NSData)zoneUsage
{
  return self->_zoneUsage;
}

- (void)setZoneUsage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUsage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end