@interface LIGHTHOUSE_BITACORA_PROTOScheduleStatus
- (BOOL)hasScheduled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)scheduled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasScheduled:(BOOL)a3;
- (void)setScheduled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOScheduleStatus

- (void)setScheduled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_scheduled = a3;
}

- (void)setHasScheduled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScheduled
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOScheduleStatus;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOScheduleStatus *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_scheduled, v7, v8);
    objc_msgSend_setObject_forKey_(v9, v11, (uint64_t)v10, @"scheduled", v12);
  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOScheduleStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_scheduled;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  id result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_scheduled;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)) {
    goto LABEL_4;
  }
  BOOL v9 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v9 = 0;
      goto LABEL_5;
    }
    if (self->_scheduled)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v9 = 1;
  }
LABEL_5:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_scheduled;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_scheduled = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

@end