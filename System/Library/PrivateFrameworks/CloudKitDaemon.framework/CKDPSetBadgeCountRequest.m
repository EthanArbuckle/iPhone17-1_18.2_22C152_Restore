@interface CKDPSetBadgeCountRequest
+ (id)options;
- (BOOL)forDevice;
- (BOOL)hasBadgeCount;
- (BOOL)hasForDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)badgeCount;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBadgeCount:(unsigned int)a3;
- (void)setForDevice:(BOOL)a3;
- (void)setHasBadgeCount:(BOOL)a3;
- (void)setHasForDevice:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSetBadgeCountRequest

+ (id)options
{
  if (qword_1EBBCDD10 != -1) {
    dispatch_once(&qword_1EBBCDD10, &unk_1F2043070);
  }
  v2 = (void *)qword_1EBBCDD08;
  return v2;
}

- (void)setBadgeCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_badgeCount = a3;
}

- (void)setHasBadgeCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBadgeCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setForDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_forDevice = a3;
}

- (void)setHasForDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasForDevice
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSetBadgeCountRequest;
  v4 = [(CKDPSetBadgeCountRequest *)&v11 description];
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
    v7 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v4, self->_badgeCount);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"badgeCount");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_forDevice);
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, @"forDevice");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DC47A0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (unsigned)requestTypeCode
{
  return 64;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_badgeCount;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 12) = self->_forDevice;
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
    *((_DWORD *)result + 2) = self->_badgeCount;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_forDevice;
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_badgeCount != *((_DWORD *)v4 + 2)) {
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
    if (self->_forDevice)
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
    uint64_t v2 = 2654435761 * self->_badgeCount;
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
  uint64_t v3 = 2654435761 * self->_forDevice;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_badgeCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_forDevice = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)badgeCount
{
  return self->_badgeCount;
}

- (BOOL)forDevice
{
  return self->_forDevice;
}

@end