@interface LIGHTHOUSE_BITACORA_PROTOTaskEvent
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasSucceeded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)succeeded;
- (NSString)errorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSucceeded:(BOOL)a3;
- (void)setSucceeded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOTaskEvent

- (void)setSucceeded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_succeeded = a3;
}

- (void)setHasSucceeded:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSucceeded
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOTaskEvent;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOTaskEvent *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_succeeded, v7, v8);
    objc_msgSend_setObject_forKey_(v9, v11, (uint64_t)v10, @"succeeded", v12);
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    objc_msgSend_setObject_forKey_(v9, v6, (uint64_t)errorDomain, @"errorDomain", v8);
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend_numberWithInt_(NSNumber, v6, self->_errorCode, v7, v8);
    objc_msgSend_setObject_forKey_(v9, v15, (uint64_t)v14, @"errorCode", v16);
  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[24] = self->_succeeded;
    v4[28] |= 2u;
  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
  {
    v9 = v4;
    objc_msgSend_setErrorDomain_(v4, v5, (uint64_t)errorDomain, v6, v7);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_errorCode;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = v14;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v14 + 24) = self->_succeeded;
    *(unsigned char *)(v14 + 28) |= 2u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_errorDomain, v15, (uint64_t)a3, v16, v17);
  v20 = *(void **)(v18 + 16);
  *(void *)(v18 + 16) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v18 + 8) = self->_errorCode;
    *(unsigned char *)(v18 + 28) |= 1u;
  }
  return (id)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_succeeded)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  errorDomain = self->_errorDomain;
  uint64_t v14 = v4[2];
  if (!((unint64_t)errorDomain | v14)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_isEqual_(errorDomain, v9, v14, v10, v11))
  {
LABEL_17:
    BOOL v15 = 0;
    goto LABEL_18;
  }
  char has = (char)self->_has;
LABEL_13:
  BOOL v15 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
    BOOL v15 = 1;
  }
LABEL_18:

  return v15;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_succeeded;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend_hash(self->_errorDomain, a2, v2, v3, v4);
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v8 = 0;
  }
  return v7 ^ v6 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_succeeded = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v8 = *((void *)v4 + 2);
  if (v8)
  {
    id v9 = v4;
    objc_msgSend_setErrorDomain_(self, v5, v8, v6, v7);
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end