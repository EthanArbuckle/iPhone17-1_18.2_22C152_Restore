@interface CKDPStorageExpiration
- (BOOL)hasDuration;
- (BOOL)hasExpirationTime;
- (BOOL)hasOperationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)expirationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationTypeAsString:(int)a3;
- (int)StringAsOperationType:(id)a3;
- (int)operationType;
- (unint64_t)duration;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setExpirationTime:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasExpirationTime:(BOOL)a3;
- (void)setHasOperationType:(BOOL)a3;
- (void)setOperationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPStorageExpiration

- (int)operationType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_operationType;
  }
  else {
    return 1;
  }
}

- (void)setOperationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOperationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F88D0[a3 - 1];
  }
  return v3;
}

- (int)StringAsOperationType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unset"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"setDuration"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"setExpiration"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpirationTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expirationTime = a3;
}

- (void)setHasExpirationTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPStorageExpiration;
  v4 = [(CKDPStorageExpiration *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v8 = self->_operationType - 1;
    if (v8 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_operationType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E64F88D0[v8];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v9, @"operationType");

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v4, self->_duration);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"duration");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v4, v5, self->_expirationTime);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"expirationTime");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C50191C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[6] = self->_operationType;
    *((unsigned char *)v4 + 28) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = self->_duration;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((void *)v4 + 2) = *(void *)&self->_expirationTime;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_operationType;
    *((unsigned char *)result + 28) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_duration;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = *(void *)&self->_expirationTime;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_operationType != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_duration != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_expirationTime != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  uint64_t v2 = 2654435761 * self->_operationType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_duration;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double expirationTime = self->_expirationTime;
  double v5 = -expirationTime;
  if (expirationTime >= 0.0) {
    double v5 = self->_expirationTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_operationType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_4:
    self->_double expirationTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unint64_t)duration
{
  return self->_duration;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

@end