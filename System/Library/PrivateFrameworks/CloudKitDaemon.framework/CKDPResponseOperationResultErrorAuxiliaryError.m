@interface CKDPResponseOperationResultErrorAuxiliaryError
+ (Class)userInfoType;
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userInfos;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userInfoAtIndex:(unint64_t)a3;
- (int)code;
- (unint64_t)hash;
- (unint64_t)userInfosCount;
- (void)addUserInfo:(id)a3;
- (void)clearUserInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setUserInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultErrorAuxiliaryError

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearUserInfos
{
  objc_msgSend_removeAllObjects(self->_userInfos, a2, v2);
}

- (void)addUserInfo:(id)a3
{
  v4 = (const char *)a3;
  userInfos = self->_userInfos;
  v8 = (char *)v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    v4 = v8;
    userInfos = self->_userInfos;
  }
  objc_msgSend_addObject_(userInfos, v4, (uint64_t)v4);
}

- (unint64_t)userInfosCount
{
  return objc_msgSend_count(self->_userInfos, a2, v2);
}

- (id)userInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_userInfos, a2, a3);
}

+ (Class)userInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorAuxiliaryError;
  v4 = [(CKDPResponseOperationResultErrorAuxiliaryError *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  domain = self->_domain;
  if (domain) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)domain, @"domain");
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v5, self->_code);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"code");
  }
  if (objc_msgSend_count(self->_userInfos, v5, (uint64_t)domain))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_userInfos, v11, v12);
    v15 = objc_msgSend_initWithCapacity_(v10, v14, v13);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = self->_userInfos;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, v32, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v16);
          }
          v24 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v28 + 1) + 8 * i), v19, v20, (void)v28);
          objc_msgSend_addObject_(v15, v25, (uint64_t)v24);
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v28, v32, 16);
      }
      while (v21);
    }

    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v15, @"userInfo");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorAuxiliaryErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_userInfos;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  domain = self->_domain;
  id v17 = v4;
  if (domain)
  {
    objc_msgSend_setDomain_(v4, v5, (uint64_t)domain);
    id v4 = v17;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_code;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (objc_msgSend_userInfosCount(self, v5, (uint64_t)domain))
  {
    objc_msgSend_clearUserInfos(v17, v7, v8);
    uint64_t v11 = objc_msgSend_userInfosCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_userInfoAtIndex_(self, v12, i);
        objc_msgSend_addUserInfo_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_domain, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 8) = self->_code;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_userInfos;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addUserInfo_((void *)v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
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
  domain = self->_domain;
  uint64_t v9 = v4[2];
  if ((unint64_t)domain | v9)
  {
    if (!objc_msgSend_isEqual_(domain, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (v4[4])
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  userInfos = self->_userInfos;
  uint64_t v11 = v4[3];
  if ((unint64_t)userInfos | v11) {
    char isEqual = objc_msgSend_isEqual_(userInfos, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_domain, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_code;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ v4 ^ objc_msgSend_hash(self->_userInfos, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 2);
  if (v6) {
    objc_msgSend_setDomain_(self, v4, v6);
  }
  if (*((unsigned char *)v5 + 32))
  {
    self->_code = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v5 + 3);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_addUserInfo_(self, v10, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int)code
{
  return self->_code;
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end