@interface CKDPThrottlingConfigRateLimit
- (BOOL)hasAllowedRequestCount;
- (BOOL)hasIntervalLengthSec;
- (BOOL)hasRepeatEverySec;
- (BOOL)hasStartTimeSecondsAfterLocalMidnight;
- (BOOL)hasStartTimeSecondsAfterUnixEpoch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)allowedRequestCount;
- (int)intervalLengthSec;
- (int)repeatEverySec;
- (int64_t)startTimeSecondsAfterLocalMidnight;
- (int64_t)startTimeSecondsAfterUnixEpoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowedRequestCount:(int)a3;
- (void)setHasAllowedRequestCount:(BOOL)a3;
- (void)setHasIntervalLengthSec:(BOOL)a3;
- (void)setHasRepeatEverySec:(BOOL)a3;
- (void)setHasStartTimeSecondsAfterLocalMidnight:(BOOL)a3;
- (void)setHasStartTimeSecondsAfterUnixEpoch:(BOOL)a3;
- (void)setIntervalLengthSec:(int)a3;
- (void)setRepeatEverySec:(int)a3;
- (void)setStartTimeSecondsAfterLocalMidnight:(int64_t)a3;
- (void)setStartTimeSecondsAfterUnixEpoch:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPThrottlingConfigRateLimit

- (void)setIntervalLengthSec:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_intervalLengthSec = a3;
}

- (void)setHasIntervalLengthSec:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntervalLengthSec
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAllowedRequestCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_allowedRequestCount = a3;
}

- (void)setHasAllowedRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowedRequestCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRepeatEverySec:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_repeatEverySec = a3;
}

- (void)setHasRepeatEverySec:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRepeatEverySec
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStartTimeSecondsAfterUnixEpoch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startTimeSecondsAfterUnixEpoch = a3;
}

- (void)setHasStartTimeSecondsAfterUnixEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTimeSecondsAfterUnixEpoch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartTimeSecondsAfterLocalMidnight:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTimeSecondsAfterLocalMidnight = a3;
}

- (void)setHasStartTimeSecondsAfterLocalMidnight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimeSecondsAfterLocalMidnight
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPThrottlingConfigRateLimit;
  v4 = [(CKDPThrottlingConfigRateLimit *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_intervalLengthSec);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"intervalLengthSec");

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v12 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_allowedRequestCount);
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, @"allowedRequestCount");

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v14 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_repeatEverySec);
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, @"repeatEverySec");

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v16 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_startTimeSecondsAfterUnixEpoch);
  objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, @"startTimeSecondsAfterUnixEpoch");

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_startTimeSecondsAfterLocalMidnight);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"startTimeSecondsAfterLocalMidnight");
  }
LABEL_7:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E85394((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteInt64Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_intervalLengthSec;
    *((unsigned char *)v4 + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_allowedRequestCount;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[8] = self->_repeatEverySec;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((void *)v4 + 2) = self->_startTimeSecondsAfterUnixEpoch;
  *((unsigned char *)v4 + 36) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = self->_startTimeSecondsAfterLocalMidnight;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 7) = self->_intervalLengthSec;
    *((unsigned char *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_allowedRequestCount;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 8) = self->_repeatEverySec;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 2) = self->_startTimeSecondsAfterUnixEpoch;
  *((unsigned char *)result + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 1) = self->_startTimeSecondsAfterLocalMidnight;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_intervalLengthSec != *((_DWORD *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_26:
    BOOL v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_allowedRequestCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_repeatEverySec != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_startTimeSecondsAfterUnixEpoch != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_startTimeSecondsAfterLocalMidnight != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
    BOOL v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_intervalLengthSec;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_allowedRequestCount;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_repeatEverySec;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_startTimeSecondsAfterUnixEpoch;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_startTimeSecondsAfterLocalMidnight;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_intervalLengthSec = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_allowedRequestCount = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_repeatEverySec = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_startTimeSecondsAfterUnixEpoch = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_6:
    self->_startTimeSecondsAfterLocalMidnight = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
}

- (int)intervalLengthSec
{
  return self->_intervalLengthSec;
}

- (int)allowedRequestCount
{
  return self->_allowedRequestCount;
}

- (int)repeatEverySec
{
  return self->_repeatEverySec;
}

- (int64_t)startTimeSecondsAfterUnixEpoch
{
  return self->_startTimeSecondsAfterUnixEpoch;
}

- (int64_t)startTimeSecondsAfterLocalMidnight
{
  return self->_startTimeSecondsAfterLocalMidnight;
}

@end