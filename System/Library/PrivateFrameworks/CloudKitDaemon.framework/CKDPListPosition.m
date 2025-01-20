@interface CKDPListPosition
- (BOOL)hasIndex;
- (BOOL)hasIsReversed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReversed;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)index;
- (unint64_t)hash;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasIsReversed:(BOOL)a3;
- (void)setIndex:(int)a3;
- (void)setIsReversed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPListPosition

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v17 = a3;
  if (objc_msgSend_hasIndex(self, v5, v6))
  {
    v9 = NSString;
    if (objc_msgSend_isReversed(self, v7, v8)) {
      v12 = @"R";
    }
    else {
      v12 = &stru_1F2044F30;
    }
    uint64_t v13 = objc_msgSend_index(self, v10, v11);
    v15 = objc_msgSend_stringWithFormat_(v9, v14, @"%@%d", v12, v13);
    objc_msgSend_writeString_(v17, v16, (uint64_t)v15);
  }
}

- (void)setIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_index = a3;
}

- (void)setHasIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsReversed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isReversed = a3;
}

- (void)setHasIsReversed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsReversed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPListPosition;
  v4 = [(CKDPListPosition *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if (has)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_index);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"index");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isReversed);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"is_reversed");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F2ACAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_index;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 12) = self->_isReversed;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_index;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_isReversed;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_index != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_9;
  }
  BOOL v7 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v7 = 0;
      goto LABEL_10;
    }
    if (self->_isReversed)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_9;
    }
    BOOL v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_index;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isReversed;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_index = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_isReversed = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)index
{
  return self->_index;
}

- (BOOL)isReversed
{
  return self->_isReversed;
}

@end