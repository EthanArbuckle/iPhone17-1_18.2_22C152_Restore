@interface CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions
+ (Class)contentRequestHeadersType;
- (BOOL)hasContentRequestAuthorizeGetOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentRequestHeaders;
- (id)contentRequestHeadersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contentRequestAuthorizeGetOptions;
- (unint64_t)contentRequestHeadersCount;
- (unint64_t)hash;
- (void)addContentRequestHeaders:(id)a3;
- (void)clearContentRequestHeaders;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentRequestAuthorizeGetOptions:(unint64_t)a3;
- (void)setContentRequestHeaders:(id)a3;
- (void)setHasContentRequestAuthorizeGetOptions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions

- (void)clearContentRequestHeaders
{
  objc_msgSend_removeAllObjects(self->_contentRequestHeaders, a2, v2);
}

- (void)addContentRequestHeaders:(id)a3
{
  v4 = (const char *)a3;
  contentRequestHeaders = self->_contentRequestHeaders;
  v8 = (char *)v4;
  if (!contentRequestHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contentRequestHeaders;
    self->_contentRequestHeaders = v6;

    v4 = v8;
    contentRequestHeaders = self->_contentRequestHeaders;
  }
  objc_msgSend_addObject_(contentRequestHeaders, v4, (uint64_t)v4);
}

- (unint64_t)contentRequestHeadersCount
{
  return objc_msgSend_count(self->_contentRequestHeaders, a2, v2);
}

- (id)contentRequestHeadersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_contentRequestHeaders, a2, a3);
}

+ (Class)contentRequestHeadersType
{
  return (Class)objc_opt_class();
}

- (void)setContentRequestAuthorizeGetOptions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentRequestAuthorizeGetOptions = a3;
}

- (void)setHasContentRequestAuthorizeGetOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentRequestAuthorizeGetOptions
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions;
  v4 = [(CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_contentRequestHeaders, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_contentRequestHeaders, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v14 = self->_contentRequestHeaders;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, v32, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v28 + 1) + 8 * i), v17, v18, (void)v28);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v28, v32, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"contentRequestHeaders");
  }
  if (*(unsigned char *)&self->_has)
  {
    v25 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v7, self->_contentRequestAuthorizeGetOptions);
    objc_msgSend_setObject_forKey_(v4, v26, (uint64_t)v25, @"contentRequestAuthorizeGetOptions");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F7B018((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_contentRequestHeaders;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (objc_msgSend_contentRequestHeadersCount(self, v4, v5))
  {
    objc_msgSend_clearContentRequestHeaders(v16, v6, v7);
    uint64_t v10 = objc_msgSend_contentRequestHeadersCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_contentRequestHeadersAtIndex_(self, v11, i);
        objc_msgSend_addContentRequestHeaders_(v16, v15, (uint64_t)v14);
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v16 + 1) = self->_contentRequestAuthorizeGetOptions;
    *((unsigned char *)v16 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = self->_contentRequestHeaders;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v21 + 1) + 8 * v17), v14, (uint64_t)a3, (void)v21);
        objc_msgSend_addContentRequestHeaders_((void *)v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v15);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v10 + 8) = self->_contentRequestAuthorizeGetOptions;
    *(unsigned char *)(v10 + 24) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  contentRequestHeaders = self->_contentRequestHeaders;
  uint64_t v9 = v4[2];
  if ((unint64_t)contentRequestHeaders | v9)
  {
    if (!objc_msgSend_isEqual_(contentRequestHeaders, v7, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v10 = (v4[3] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[3] & 1) != 0 && self->_contentRequestAuthorizeGetOptions == v4[1])
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_contentRequestHeaders, a2, v2);
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_contentRequestAuthorizeGetOptions;
  }
  else {
    unint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addContentRequestHeaders_(self, v8, *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v12, v16, 16);
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_contentRequestAuthorizeGetOptions = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)contentRequestHeaders
{
  return self->_contentRequestHeaders;
}

- (void)setContentRequestHeaders:(id)a3
{
}

- (unint64_t)contentRequestAuthorizeGetOptions
{
  return self->_contentRequestAuthorizeGetOptions;
}

- (void).cxx_destruct
{
}

@end