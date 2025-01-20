@interface CKCDPError
+ (Class)auxiliaryUserInfoType;
- (BOOL)hasAuxiliaryCode;
- (BOOL)hasAuxiliaryDomain;
- (BOOL)hasCode;
- (BOOL)hasMessage;
- (BOOL)hasTargetPartition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)auxiliaryUserInfos;
- (NSString)auxiliaryDomain;
- (NSString)message;
- (id)auxiliaryUserInfoAtIndex:(unint64_t)a3;
- (id)codeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCode:(id)a3;
- (int)auxiliaryCode;
- (int)code;
- (int)targetPartition;
- (unint64_t)auxiliaryUserInfosCount;
- (unint64_t)hash;
- (void)addAuxiliaryUserInfo:(id)a3;
- (void)clearAuxiliaryUserInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryCode:(int)a3;
- (void)setAuxiliaryDomain:(id)a3;
- (void)setAuxiliaryUserInfos:(id)a3;
- (void)setCode:(int)a3;
- (void)setHasAuxiliaryCode:(BOOL)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasTargetPartition:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setTargetPartition:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPError

- (int)code
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_code;
  }
  else {
    return 1;
  }
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)codeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F8090[a3 - 1];
  }
  return v3;
}

- (int)StringAsCode:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"FUNCTION_TIMEOUT"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"FUNCTION_ERROR"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"INTERNAL_ERROR"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"INVALID_PARTITION"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasAuxiliaryDomain
{
  return self->_auxiliaryDomain != 0;
}

- (void)setAuxiliaryCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_auxiliaryCode = a3;
}

- (void)setHasAuxiliaryCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuxiliaryCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAuxiliaryUserInfos
{
  objc_msgSend_removeAllObjects(self->_auxiliaryUserInfos, a2, v2);
}

- (void)addAuxiliaryUserInfo:(id)a3
{
  v4 = (const char *)a3;
  auxiliaryUserInfos = self->_auxiliaryUserInfos;
  v8 = (char *)v4;
  if (!auxiliaryUserInfos)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_auxiliaryUserInfos;
    self->_auxiliaryUserInfos = v6;

    v4 = v8;
    auxiliaryUserInfos = self->_auxiliaryUserInfos;
  }
  objc_msgSend_addObject_(auxiliaryUserInfos, v4, (uint64_t)v4);
}

- (unint64_t)auxiliaryUserInfosCount
{
  return objc_msgSend_count(self->_auxiliaryUserInfos, a2, v2);
}

- (id)auxiliaryUserInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_auxiliaryUserInfos, a2, a3);
}

+ (Class)auxiliaryUserInfoType
{
  return (Class)objc_opt_class();
}

- (void)setTargetPartition:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_targetPartition = a3;
}

- (void)setHasTargetPartition:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTargetPartition
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPError;
  v4 = [(CKCDPError *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v6 = self->_code - 1;
    if (v6 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_code);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E64F8090[v6];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, @"code");
  }
  message = self->_message;
  if (message) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)message, @"message");
  }
  auxiliaryDomain = self->_auxiliaryDomain;
  if (auxiliaryDomain) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)auxiliaryDomain, @"auxiliaryDomain");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_auxiliaryCode);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"auxiliaryCode");
  }
  if (objc_msgSend_count(self->_auxiliaryUserInfos, v4, (uint64_t)auxiliaryDomain))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_auxiliaryUserInfos, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v19 = self->_auxiliaryUserInfos;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, v37, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v33 + 1) + 8 * i), v22, v23);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v33, v37, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v29, (uint64_t)v18, @"auxiliaryUserInfo");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v30 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v12, self->_targetPartition);
    objc_msgSend_setObject_forKey_(v5, v31, (uint64_t)v30, @"targetPartition");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FC0D34(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
  if (self->_auxiliaryDomain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_auxiliaryUserInfos;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_code;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  message = self->_message;
  v18 = v4;
  if (message)
  {
    objc_msgSend_setMessage_(v4, v5, (uint64_t)message);
    id v4 = v18;
  }
  auxiliaryDomain = self->_auxiliaryDomain;
  if (auxiliaryDomain)
  {
    objc_msgSend_setAuxiliaryDomain_(v18, v5, (uint64_t)auxiliaryDomain);
    id v4 = v18;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_auxiliaryCode;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (objc_msgSend_auxiliaryUserInfosCount(self, v5, (uint64_t)auxiliaryDomain))
  {
    objc_msgSend_clearAuxiliaryUserInfos(v18, v8, v9);
    uint64_t v12 = objc_msgSend_auxiliaryUserInfosCount(self, v10, v11);
    if (v12)
    {
      uint64_t v14 = v12;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_auxiliaryUserInfoAtIndex_(self, v13, i);
        objc_msgSend_addAuxiliaryUserInfo_(v18, v17, (uint64_t)v16);
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v18[12] = self->_targetPartition;
    *((unsigned char *)v18 + 52) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_code;
    *(unsigned char *)(v10 + 52) |= 2u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_message, v11, (uint64_t)a3);
  uint64_t v14 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_auxiliaryDomain, v15, (uint64_t)a3);
  uint64_t v17 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 8) = self->_auxiliaryCode;
    *(unsigned char *)(v12 + 52) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v18 = self->_auxiliaryUserInfos;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v28 + 1) + 8 * i), v21, (uint64_t)a3, (void)v28);
        objc_msgSend_addAuxiliaryUserInfo_((void *)v12, v26, (uint64_t)v25);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v12 + 48) = self->_targetPartition;
    *(unsigned char *)(v12 + 52) |= 4u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_code != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_23;
  }
  message = self->_message;
  uint64_t v9 = v4[5];
  if ((unint64_t)message | v9 && !objc_msgSend_isEqual_(message, v7, v9)) {
    goto LABEL_23;
  }
  auxiliaryDomain = self->_auxiliaryDomain;
  uint64_t v11 = v4[2];
  if ((unint64_t)auxiliaryDomain | v11)
  {
    if (!objc_msgSend_isEqual_(auxiliaryDomain, v7, v11)) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  char v13 = *((unsigned char *)v4 + 52);
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_auxiliaryCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_23;
  }
  auxiliaryUserInfos = self->_auxiliaryUserInfos;
  uint64_t v15 = v4[3];
  if ((unint64_t)auxiliaryUserInfos | v15)
  {
    if (!objc_msgSend_isEqual_(auxiliaryUserInfos, v7, v15))
    {
LABEL_23:
      BOOL v16 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
    char v13 = *((unsigned char *)v4 + 52);
  }
  BOOL v16 = (v13 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_targetPartition != *((_DWORD *)v4 + 12)) {
      goto LABEL_23;
    }
    BOOL v16 = 1;
  }
LABEL_24:

  return v16;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_message, a2, v2);
  uint64_t v10 = objc_msgSend_hash(self->_auxiliaryDomain, v6, v7);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_auxiliaryCode;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = objc_msgSend_hash(self->_auxiliaryUserInfos, v8, v9);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_targetPartition;
  }
  else {
    uint64_t v13 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = v4;
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_code = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v7 = *((void *)v4 + 5);
  if (v7) {
    objc_msgSend_setMessage_(self, v5, v7);
  }
  uint64_t v8 = *((void *)v6 + 2);
  if (v8) {
    objc_msgSend_setAuxiliaryDomain_(self, v5, v8);
  }
  if (*((unsigned char *)v6 + 52))
  {
    self->_auxiliaryCode = *((_DWORD *)v6 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *((id *)v6 + 3);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v16, v20, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addAuxiliaryUserInfo_(self, v12, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v16, v20, 16);
    }
    while (v13);
  }

  if ((*((unsigned char *)v6 + 52) & 4) != 0)
  {
    self->_targetPartition = *((_DWORD *)v6 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)auxiliaryDomain
{
  return self->_auxiliaryDomain;
}

- (void)setAuxiliaryDomain:(id)a3
{
}

- (int)auxiliaryCode
{
  return self->_auxiliaryCode;
}

- (NSMutableArray)auxiliaryUserInfos
{
  return self->_auxiliaryUserInfos;
}

- (void)setAuxiliaryUserInfos:(id)a3
{
}

- (int)targetPartition
{
  return self->_targetPartition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_auxiliaryUserInfos, 0);
  objc_storeStrong((id *)&self->_auxiliaryDomain, 0);
}

@end