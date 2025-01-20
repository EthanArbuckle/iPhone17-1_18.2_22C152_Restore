@interface CKDPNotificationSyncRequest
+ (id)options;
- (BOOL)hasMaxChanges;
- (BOOL)hasServerChangeToken;
- (BOOL)hasWantsChanges;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wantsChanges;
- (Class)responseClass;
- (NSData)serverChangeToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)maxChanges;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxChanges:(BOOL)a3;
- (void)setHasWantsChanges:(BOOL)a3;
- (void)setMaxChanges:(unsigned int)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setWantsChanges:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPNotificationSyncRequest

+ (id)options
{
  if (qword_1EBBCDDF0 != -1) {
    dispatch_once(&qword_1EBBCDDF0, &unk_1F2043750);
  }
  v2 = (void *)qword_1EBBCDDE8;
  return v2;
}

- (BOOL)hasServerChangeToken
{
  return self->_serverChangeToken != 0;
}

- (void)setMaxChanges:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxChanges = a3;
}

- (void)setHasMaxChanges:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxChanges
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWantsChanges:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wantsChanges = a3;
}

- (void)setHasWantsChanges:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWantsChanges
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationSyncRequest;
  v4 = [(CKDPNotificationSyncRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  serverChangeToken = self->_serverChangeToken;
  if (serverChangeToken) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serverChangeToken, @"serverChangeToken");
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v5, self->_maxChanges);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"maxChanges");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v11 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_wantsChanges);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"wantsChanges");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E86890((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_serverChangeToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
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
  return 65;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  serverChangeToken = self->_serverChangeToken;
  if (serverChangeToken)
  {
    id v8 = v4;
    objc_msgSend_setServerChangeToken_(v4, v5, (uint64_t)serverChangeToken);
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_maxChanges;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_wantsChanges;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_serverChangeToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 8) = self->_maxChanges;
    *(unsigned char *)(v10 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 24) = self->_wantsChanges;
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
  serverChangeToken = self->_serverChangeToken;
  uint64_t v9 = v4[2];
  if ((unint64_t)serverChangeToken | v9)
  {
    if (!objc_msgSend_isEqual_(serverChangeToken, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_maxChanges != *((_DWORD *)v4 + 2)) {
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
    if (self->_wantsChanges)
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
  uint64_t v4 = objc_msgSend_hash(self->_serverChangeToken, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_maxChanges;
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
  uint64_t v6 = 2654435761 * self->_wantsChanges;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 2);
  if (v6)
  {
    id v8 = v4;
    objc_msgSend_setServerChangeToken_(self, v5, v6);
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_maxChanges = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_wantsChanges = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (unsigned)maxChanges
{
  return self->_maxChanges;
}

- (BOOL)wantsChanges
{
  return self->_wantsChanges;
}

- (void).cxx_destruct
{
}

@end