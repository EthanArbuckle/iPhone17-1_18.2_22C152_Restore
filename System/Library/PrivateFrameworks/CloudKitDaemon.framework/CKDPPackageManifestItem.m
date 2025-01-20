@interface CKDPPackageManifestItem
- (BOOL)hasLastItem;
- (BOOL)hasSignature;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastItem;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)size;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLastItem:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setLastItem:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPPackageManifestItem

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

- (void)setLastItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastItem = a3;
}

- (void)setHasLastItem:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastItem
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPPackageManifestItem;
  v4 = [(CKDPPackageManifestItem *)&v11 description];
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
    objc_super v11 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_lastItem);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"lastItem");
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
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          uint64_t v24 = *v4;
          unint64_t v25 = *(void *)((char *)a3 + v24);
          if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
          *(void *)((char *)a3 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_39;
          }
          v21 += 7;
          BOOL v15 = v22++ >= 9;
          if (v15)
          {
            uint64_t v23 = 0;
            goto LABEL_41;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_39:
        if (*((unsigned char *)a3 + *v6)) {
          uint64_t v23 = 0;
        }
LABEL_41:
        self->_lastItem = v23 != 0;
      }
      else if (v18 == 2)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        int64_t v29 = 0;
        *(unsigned char *)&self->_has |= 1u;
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
            int64_t v29 = 0;
            goto LABEL_45;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_43:
        if (*((unsigned char *)a3 + *v6)) {
          int64_t v29 = 0;
        }
LABEL_45:
        self->_size = v29;
      }
      else if (v18 == 1)
      {
        PBReaderReadData();
        v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        signature = self->_signature;
        self->_signature = v19;
      }
      else
      {
        int v33 = PBReaderSkipValueWithTag();
        if (!v33) {
          return v33;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v33) = *((unsigned char *)a3 + *v6) == 0;
  return v33;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  signature = self->_signature;
  if (signature)
  {
    id v8 = v4;
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_size;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_lastItem;
    *((unsigned char *)v4 + 28) |= 2u;
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
    *(unsigned char *)(v10 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 24) = self->_lastItem;
    *(unsigned char *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_11;
  }
  signature = self->_signature;
  uint64_t v9 = v4[2];
  if ((unint64_t)signature | v9)
  {
    if (!objc_msgSend_isEqual_(signature, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_size != v4[1]) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_11;
  }
  BOOL v10 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0)
    {
LABEL_11:
      BOOL v10 = 0;
      goto LABEL_12;
    }
    if (self->_lastItem)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_11;
    }
    BOOL v10 = 1;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_signature, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_size;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_lastItem;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 2);
  if (v6)
  {
    id v8 = v4;
    objc_msgSend_setSignature_(self, v5, v6);
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_size = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_lastItem = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
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

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void).cxx_destruct
{
}

@end