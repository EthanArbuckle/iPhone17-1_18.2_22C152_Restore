@interface CKDPSubscriptionNotification
+ (Class)additionalFieldsType;
- (BOOL)hasAlert;
- (BOOL)hasCollapseIdKey;
- (BOOL)hasShouldBadge;
- (BOOL)hasShouldSendContentAvailable;
- (BOOL)hasShouldSendMutableContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldBadge;
- (BOOL)shouldSendContentAvailable;
- (BOOL)shouldSendMutableContent;
- (CKDPSubscriptionNotificationAlert)alert;
- (NSMutableArray)additionalFields;
- (NSString)collapseIdKey;
- (id)additionalFieldsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)additionalFieldsCount;
- (unint64_t)hash;
- (void)addAdditionalFields:(id)a3;
- (void)clearAdditionalFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalFields:(id)a3;
- (void)setAlert:(id)a3;
- (void)setCollapseIdKey:(id)a3;
- (void)setHasShouldBadge:(BOOL)a3;
- (void)setHasShouldSendContentAvailable:(BOOL)a3;
- (void)setHasShouldSendMutableContent:(BOOL)a3;
- (void)setShouldBadge:(BOOL)a3;
- (void)setShouldSendContentAvailable:(BOOL)a3;
- (void)setShouldSendMutableContent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSubscriptionNotification

- (BOOL)hasAlert
{
  return self->_alert != 0;
}

- (void)setShouldBadge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldBadge = a3;
}

- (void)setHasShouldBadge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldBadge
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAdditionalFields
{
  objc_msgSend_removeAllObjects(self->_additionalFields, a2, v2);
}

- (void)addAdditionalFields:(id)a3
{
  v4 = (const char *)a3;
  additionalFields = self->_additionalFields;
  v8 = (char *)v4;
  if (!additionalFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_additionalFields;
    self->_additionalFields = v6;

    v4 = v8;
    additionalFields = self->_additionalFields;
  }
  objc_msgSend_addObject_(additionalFields, v4, (uint64_t)v4);
}

- (unint64_t)additionalFieldsCount
{
  return objc_msgSend_count(self->_additionalFields, a2, v2);
}

- (id)additionalFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_additionalFields, a2, a3);
}

+ (Class)additionalFieldsType
{
  return (Class)objc_opt_class();
}

- (void)setShouldSendContentAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldSendContentAvailable = a3;
}

- (void)setHasShouldSendContentAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldSendContentAvailable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldSendMutableContent:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shouldSendMutableContent = a3;
}

- (void)setHasShouldSendMutableContent:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldSendMutableContent
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasCollapseIdKey
{
  return self->_collapseIdKey != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSubscriptionNotification;
  v4 = [(CKDPSubscriptionNotification *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  alert = self->_alert;
  if (alert)
  {
    v8 = objc_msgSend_dictionaryRepresentation(alert, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"alert");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_shouldBadge);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"shouldBadge");
  }
  additionalFields = self->_additionalFields;
  if (additionalFields) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)additionalFields, @"additionalFields");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v14 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_shouldSendContentAvailable);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"shouldSendContentAvailable");

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v16 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_shouldSendMutableContent);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"shouldSendMutableContent");
  }
  collapseIdKey = self->_collapseIdKey;
  if (collapseIdKey) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)collapseIdKey, @"collapseIdKey");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5048700((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_alert) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_additionalFields;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, v17, 16);
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_collapseIdKey) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  alert = self->_alert;
  v19 = v4;
  if (alert)
  {
    objc_msgSend_setAlert_(v4, v5, (uint64_t)alert);
    id v4 = v19;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_shouldBadge;
    v4[36] |= 1u;
  }
  if (objc_msgSend_additionalFieldsCount(self, v5, (uint64_t)alert))
  {
    objc_msgSend_clearAdditionalFields(v19, v7, v8);
    uint64_t v11 = objc_msgSend_additionalFieldsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_additionalFieldsAtIndex_(self, v7, i);
        objc_msgSend_addAdditionalFields_(v19, v15, (uint64_t)v14);
      }
    }
  }
  char has = (char)self->_has;
  v17 = v19;
  if ((has & 2) != 0)
  {
    v19[33] = self->_shouldSendContentAvailable;
    v19[36] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v19[34] = self->_shouldSendMutableContent;
    v19[36] |= 4u;
  }
  collapseIdKey = self->_collapseIdKey;
  if (collapseIdKey)
  {
    objc_msgSend_setCollapseIdKey_(v19, v7, (uint64_t)collapseIdKey);
    v17 = v19;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_alert, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 32) = self->_shouldBadge;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v14 = self->_additionalFields;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, v32, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v28 + 1) + 8 * i), v17, (uint64_t)a3, (void)v28);
        objc_msgSend_addAdditionalFields_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v28, v32, 16);
    }
    while (v18);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 33) = self->_shouldSendContentAvailable;
    *(unsigned char *)(v10 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v10 + 34) = self->_shouldSendMutableContent;
    *(unsigned char *)(v10 + 36) |= 4u;
  }
  uint64_t v25 = objc_msgSend_copyWithZone_(self->_collapseIdKey, v23, (uint64_t)a3, (void)v28);
  v26 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_27;
  }
  alert = self->_alert;
  uint64_t v9 = v4[2];
  if ((unint64_t)alert | v9)
  {
    if (!objc_msgSend_isEqual_(alert, v7, v9)) {
      goto LABEL_27;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_27;
    }
    if (self->_shouldBadge)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_27;
  }
  additionalFields = self->_additionalFields;
  uint64_t v13 = v4[1];
  if ((unint64_t)additionalFields | v13)
  {
    if (!objc_msgSend_isEqual_(additionalFields, v7, v13)) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 36);
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_27;
    }
    if (self->_shouldSendContentAvailable)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_27;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) == 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_33;
    }
LABEL_27:
    char isEqual = 0;
    goto LABEL_28;
  }
  if ((v11 & 4) == 0) {
    goto LABEL_27;
  }
  if (!self->_shouldSendMutableContent)
  {
    if (!*((unsigned char *)v4 + 34)) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  if (!*((unsigned char *)v4 + 34)) {
    goto LABEL_27;
  }
LABEL_33:
  collapseIdKey = self->_collapseIdKey;
  uint64_t v17 = v4[3];
  if ((unint64_t)collapseIdKey | v17) {
    char isEqual = objc_msgSend_isEqual_(collapseIdKey, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_28:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_alert, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_shouldBadge;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend_hash(self->_additionalFields, v4, v5);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_shouldSendContentAvailable;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v12 = 0;
    return v7 ^ v6 ^ v8 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_collapseIdKey, v9, v10);
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = 2654435761 * self->_shouldSendMutableContent;
  return v7 ^ v6 ^ v8 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_collapseIdKey, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  alert = self->_alert;
  uint64_t v7 = *((void *)v5 + 2);
  if (alert)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(alert, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setAlert_(self, v4, v7);
  }
  if (*((unsigned char *)v5 + 36))
  {
    self->_shouldBadge = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = *((id *)v5 + 1);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addAdditionalFields_(self, v11, *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v22, 16);
    }
    while (v12);
  }

  char v16 = *((unsigned char *)v5 + 36);
  if ((v16 & 2) != 0)
  {
    self->_shouldSendContentAvailable = *((unsigned char *)v5 + 33);
    *(unsigned char *)&self->_has |= 2u;
    char v16 = *((unsigned char *)v5 + 36);
  }
  if ((v16 & 4) != 0)
  {
    self->_shouldSendMutableContent = *((unsigned char *)v5 + 34);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v17 = *((void *)v5 + 3);
  if (v17) {
    objc_msgSend_setCollapseIdKey_(self, v15, v17);
  }
}

- (CKDPSubscriptionNotificationAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (NSMutableArray)additionalFields
{
  return self->_additionalFields;
}

- (void)setAdditionalFields:(id)a3
{
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (BOOL)shouldSendMutableContent
{
  return self->_shouldSendMutableContent;
}

- (NSString)collapseIdKey
{
  return self->_collapseIdKey;
}

- (void)setCollapseIdKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseIdKey, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_additionalFields, 0);
}

@end