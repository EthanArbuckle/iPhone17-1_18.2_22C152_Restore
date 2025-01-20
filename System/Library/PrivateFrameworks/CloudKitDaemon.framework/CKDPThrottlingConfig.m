@interface CKDPThrottlingConfig
- (BOOL)hasCriteria;
- (BOOL)hasLabel;
- (BOOL)hasRateLimit;
- (BOOL)hasTtlSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPThrottlingConfigCriteria)criteria;
- (CKDPThrottlingConfigRateLimit)rateLimit;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ttlSec;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setHasTtlSec:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setRateLimit:(id)a3;
- (void)setTtlSec:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPThrottlingConfig

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (BOOL)hasRateLimit
{
  return self->_rateLimit != 0;
}

- (void)setTtlSec:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ttlSec = a3;
}

- (void)setHasTtlSec:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTtlSec
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPThrottlingConfig;
  v4 = [(CKDPThrottlingConfig *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  label = self->_label;
  if (label) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)label, @"label");
  }
  criteria = self->_criteria;
  if (criteria)
  {
    v9 = objc_msgSend_dictionaryRepresentation(criteria, v5, (uint64_t)label);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"criteria");
  }
  rateLimit = self->_rateLimit;
  if (rateLimit)
  {
    v12 = objc_msgSend_dictionaryRepresentation(rateLimit, v5, (uint64_t)label);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"rateLimit");
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v5, self->_ttlSec);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"ttlSec");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E45444((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_criteria)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rateLimit)
  {
    PBDataWriterWriteSubmessage();
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
  label = self->_label;
  id v9 = v4;
  if (label)
  {
    objc_msgSend_setLabel_(v4, v5, (uint64_t)label);
    id v4 = v9;
  }
  criteria = self->_criteria;
  if (criteria)
  {
    objc_msgSend_setCriteria_(v9, v5, (uint64_t)criteria);
    id v4 = v9;
  }
  rateLimit = self->_rateLimit;
  if (rateLimit)
  {
    objc_msgSend_setRateLimit_(v9, v5, (uint64_t)rateLimit);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_ttlSec;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_label, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_criteria, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_rateLimit, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 32) = self->_ttlSec;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  label = self->_label;
  uint64_t v9 = v4[2];
  if ((unint64_t)label | v9)
  {
    if (!objc_msgSend_isEqual_(label, v7, v9)) {
      goto LABEL_12;
    }
  }
  criteria = self->_criteria;
  uint64_t v11 = v4[1];
  if ((unint64_t)criteria | v11)
  {
    if (!objc_msgSend_isEqual_(criteria, v7, v11)) {
      goto LABEL_12;
    }
  }
  rateLimit = self->_rateLimit;
  uint64_t v13 = v4[3];
  if ((unint64_t)rateLimit | v13)
  {
    if (!objc_msgSend_isEqual_(rateLimit, v7, v13)) {
      goto LABEL_12;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_ttlSec == *((_DWORD *)v4 + 8))
    {
      BOOL v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_label, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_criteria, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_rateLimit, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_ttlSec;
  }
  else {
    uint64_t v11 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 2);
  id v10 = v4;
  if (v5)
  {
    objc_msgSend_setLabel_(self, (const char *)v4, v5);
    id v4 = v10;
  }
  criteria = self->_criteria;
  uint64_t v7 = *((void *)v4 + 1);
  if (criteria)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(criteria, (const char *)v4, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setCriteria_(self, (const char *)v4, v7);
  }
  id v4 = v10;
LABEL_9:
  rateLimit = self->_rateLimit;
  uint64_t v9 = *((void *)v4 + 3);
  if (rateLimit)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(rateLimit, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setRateLimit_(self, (const char *)v4, v9);
  }
  id v4 = v10;
LABEL_15:
  if (*((unsigned char *)v4 + 36))
  {
    self->_ttlSec = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CKDPThrottlingConfigCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (CKDPThrottlingConfigRateLimit)rateLimit
{
  return self->_rateLimit;
}

- (void)setRateLimit:(id)a3
{
}

- (int)ttlSec
{
  return self->_ttlSec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimit, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

@end