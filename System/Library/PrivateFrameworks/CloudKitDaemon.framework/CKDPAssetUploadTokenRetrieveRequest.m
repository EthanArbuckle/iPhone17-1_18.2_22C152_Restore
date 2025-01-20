@interface CKDPAssetUploadTokenRetrieveRequest
+ (Class)assetsType;
+ (Class)contentRequestHeadersType;
+ (Class)uploadsType;
+ (id)options;
- (BOOL)hasAuthPutRequest;
- (BOOL)hasAuthPutType;
- (BOOL)hasField;
- (BOOL)hasOptions;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordFieldIdentifier)field;
- (CKDPRecordType)type;
- (Class)responseClass;
- (NSData)authPutRequest;
- (NSMutableArray)assets;
- (NSMutableArray)contentRequestHeaders;
- (NSMutableArray)uploads;
- (id)assetsAtIndex:(unint64_t)a3;
- (id)authPutTypeAsString:(int)a3;
- (id)contentRequestHeadersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)uploadsAtIndex:(unint64_t)a3;
- (int)StringAsAuthPutType:(id)a3;
- (int)authPutType;
- (unint64_t)assetsCount;
- (unint64_t)contentRequestHeadersCount;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)uploadsCount;
- (unsigned)requestTypeCode;
- (void)addAssets:(id)a3;
- (void)addContentRequestHeaders:(id)a3;
- (void)addUploads:(id)a3;
- (void)clearAssets;
- (void)clearContentRequestHeaders;
- (void)clearUploads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAuthPutRequest:(id)a3;
- (void)setAuthPutType:(int)a3;
- (void)setContentRequestHeaders:(id)a3;
- (void)setField:(id)a3;
- (void)setHasAuthPutType:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setUploads:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAssetUploadTokenRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDEE0 != -1) {
    dispatch_once(&qword_1EBBCDEE0, &unk_1F2044390);
  }
  v2 = (void *)qword_1EBBCDED8;
  return v2;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasField
{
  return self->_field != 0;
}

- (void)clearAssets
{
  objc_msgSend_removeAllObjects(self->_assets, a2, v2);
}

- (void)addAssets:(id)a3
{
  v4 = (const char *)a3;
  assets = self->_assets;
  v8 = (char *)v4;
  if (!assets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_assets;
    self->_assets = v6;

    v4 = v8;
    assets = self->_assets;
  }
  objc_msgSend_addObject_(assets, v4, (uint64_t)v4);
}

- (unint64_t)assetsCount
{
  return objc_msgSend_count(self->_assets, a2, v2);
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assets, a2, a3);
}

+ (Class)assetsType
{
  return (Class)objc_opt_class();
}

- (void)clearUploads
{
  objc_msgSend_removeAllObjects(self->_uploads, a2, v2);
}

- (void)addUploads:(id)a3
{
  v4 = (const char *)a3;
  uploads = self->_uploads;
  v8 = (char *)v4;
  if (!uploads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_uploads;
    self->_uploads = v6;

    v4 = v8;
    uploads = self->_uploads;
  }
  objc_msgSend_addObject_(uploads, v4, (uint64_t)v4);
}

- (unint64_t)uploadsCount
{
  return objc_msgSend_count(self->_uploads, a2, v2);
}

- (id)uploadsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_uploads, a2, a3);
}

+ (Class)uploadsType
{
  return (Class)objc_opt_class();
}

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

- (BOOL)hasAuthPutRequest
{
  return self->_authPutRequest != 0;
}

- (int)authPutType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_authPutType;
  }
  else {
    return 1;
  }
}

- (void)setAuthPutType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_authPutType = a3;
}

- (void)setHasAuthPutType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAuthPutType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)authPutTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F6A60[a3 - 1];
  }
  return v3;
}

- (int)StringAsAuthPutType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"authorizePut"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"reReference"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"authorizeClone"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)setOptions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOptions
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveRequest;
  v4 = [(CKDPAssetUploadTokenRetrieveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  type = self->_type;
  if (type)
  {
    v8 = objc_msgSend_dictionaryRepresentation(type, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"type");
  }
  field = self->_field;
  if (field)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(field, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"field");
  }
  if (objc_msgSend_count(self->_assets, v4, v5))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v18 = objc_msgSend_count(self->_assets, v16, v17);
    v20 = objc_msgSend_initWithCapacity_(v15, v19, v18);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v21 = self->_assets;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v84, v90, 16);
    if (v23)
    {
      uint64_t v26 = v23;
      uint64_t v27 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v85 != v27) {
            objc_enumerationMutation(v21);
          }
          v29 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v84 + 1) + 8 * i), v24, v25);
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v84, v90, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v20, @"assets");
  }
  if (objc_msgSend_count(self->_uploads, v13, v14))
  {
    id v34 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v37 = objc_msgSend_count(self->_uploads, v35, v36);
    v39 = objc_msgSend_initWithCapacity_(v34, v38, v37);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v40 = self->_uploads;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v80, v89, 16);
    if (v42)
    {
      uint64_t v45 = v42;
      uint64_t v46 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v81 != v46) {
            objc_enumerationMutation(v40);
          }
          v48 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v80 + 1) + 8 * j), v43, v44);
          objc_msgSend_addObject_(v39, v49, (uint64_t)v48);
        }
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v80, v89, 16);
      }
      while (v45);
    }

    objc_msgSend_setObject_forKey_(v6, v50, (uint64_t)v39, @"uploads");
  }
  if (objc_msgSend_count(self->_contentRequestHeaders, v32, v33))
  {
    id v52 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v55 = objc_msgSend_count(self->_contentRequestHeaders, v53, v54);
    v57 = objc_msgSend_initWithCapacity_(v52, v56, v55);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v58 = self->_contentRequestHeaders;
    uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v76, v88, 16);
    if (v60)
    {
      uint64_t v63 = v60;
      uint64_t v64 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v77 != v64) {
            objc_enumerationMutation(v58);
          }
          v66 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v76 + 1) + 8 * k), v61, v62);
          objc_msgSend_addObject_(v57, v67, (uint64_t)v66);
        }
        uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v76, v88, 16);
      }
      while (v63);
    }

    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v57, @"contentRequestHeaders");
  }
  authPutRequest = self->_authPutRequest;
  if (authPutRequest) {
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)authPutRequest, @"authPutRequest");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v71 = self->_authPutType - 1;
    if (v71 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v51, @"(unknown: %i)", self->_authPutType);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = off_1E64F6A60[v71];
    }
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v72, @"authPutType");

    char has = (char)self->_has;
  }
  if (has)
  {
    v73 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v51, self->_options);
    objc_msgSend_setObject_forKey_(v6, v74, (uint64_t)v73, @"options");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F4A1CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_type) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_field) {
    PBDataWriterWriteSubmessage();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = self->_assets;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v35, v41, 16);
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v12 = self->_uploads;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v31, v40, 16);
    }
    while (v15);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = self->_contentRequestHeaders;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v27, v39, 16);
    }
    while (v22);
  }

  if (self->_authPutRequest) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (unsigned)requestTypeCode
{
  return 12;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v36 = a3;
  type = self->_type;
  if (type) {
    objc_msgSend_setType_(v36, v4, (uint64_t)type);
  }
  field = self->_field;
  if (field) {
    objc_msgSend_setField_(v36, v4, (uint64_t)field);
  }
  if (objc_msgSend_assetsCount(self, v4, (uint64_t)field))
  {
    objc_msgSend_clearAssets(v36, v7, v8);
    uint64_t v11 = objc_msgSend_assetsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_assetsAtIndex_(self, v7, i);
        objc_msgSend_addAssets_(v36, v15, (uint64_t)v14);
      }
    }
  }
  if (objc_msgSend_uploadsCount(self, v7, v8))
  {
    objc_msgSend_clearUploads(v36, v16, v17);
    uint64_t v20 = objc_msgSend_uploadsCount(self, v18, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      for (uint64_t j = 0; j != v21; ++j)
      {
        uint64_t v23 = objc_msgSend_uploadsAtIndex_(self, v16, j);
        objc_msgSend_addUploads_(v36, v24, (uint64_t)v23);
      }
    }
  }
  if (objc_msgSend_contentRequestHeadersCount(self, v16, v17))
  {
    objc_msgSend_clearContentRequestHeaders(v36, v25, v26);
    uint64_t v29 = objc_msgSend_contentRequestHeadersCount(self, v27, v28);
    if (v29)
    {
      uint64_t v30 = v29;
      for (uint64_t k = 0; k != v30; ++k)
      {
        long long v32 = objc_msgSend_contentRequestHeadersAtIndex_(self, v25, k);
        objc_msgSend_addContentRequestHeaders_(v36, v33, (uint64_t)v32);
      }
    }
  }
  authPutRequest = self->_authPutRequest;
  if (authPutRequest) {
    objc_msgSend_setAuthPutRequest_(v36, v25, (uint64_t)authPutRequest);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v36 + 8) = self->_authPutType;
    *((unsigned char *)v36 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v36 + 1) = self->_options;
    *((unsigned char *)v36 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_type, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_field, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v15;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v17 = self->_assets;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v57, v63, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v17);
        }
        v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v57 + 1) + 8 * i), v20, (uint64_t)a3);
        objc_msgSend_addAssets_((void *)v10, v25, (uint64_t)v24);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v57, v63, 16);
    }
    while (v21);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v26 = self->_uploads;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v53, v62, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v26);
        }
        long long v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v53 + 1) + 8 * j), v29, (uint64_t)a3);
        objc_msgSend_addUploads_((void *)v10, v34, (uint64_t)v33);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v53, v62, 16);
    }
    while (v30);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v35 = self->_contentRequestHeaders;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v49, v61, 16);
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v35);
        }
        uint64_t v42 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v49 + 1) + 8 * k), v38, (uint64_t)a3, (void)v49);
        objc_msgSend_addContentRequestHeaders_((void *)v10, v43, (uint64_t)v42);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v49, v61, 16);
    }
    while (v39);
  }

  uint64_t v45 = objc_msgSend_copyWithZone_(self->_authPutRequest, v44, (uint64_t)a3);
  uint64_t v46 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v45;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_authPutType;
    *(unsigned char *)(v10 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v10 + 8) = self->_options;
    *(unsigned char *)(v10 + 72) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_23;
  }
  type = self->_type;
  uint64_t v9 = v4[7];
  if ((unint64_t)type | v9)
  {
    if (!objc_msgSend_isEqual_(type, v7, v9)) {
      goto LABEL_23;
    }
  }
  field = self->_field;
  uint64_t v11 = v4[6];
  if ((unint64_t)field | v11)
  {
    if (!objc_msgSend_isEqual_(field, v7, v11)) {
      goto LABEL_23;
    }
  }
  assets = self->_assets;
  uint64_t v13 = v4[2];
  if ((unint64_t)assets | v13)
  {
    if (!objc_msgSend_isEqual_(assets, v7, v13)) {
      goto LABEL_23;
    }
  }
  uploads = self->_uploads;
  uint64_t v15 = v4[8];
  if ((unint64_t)uploads | v15)
  {
    if (!objc_msgSend_isEqual_(uploads, v7, v15)) {
      goto LABEL_23;
    }
  }
  contentRequestHeaders = self->_contentRequestHeaders;
  uint64_t v17 = v4[5];
  if ((unint64_t)contentRequestHeaders | v17)
  {
    if (!objc_msgSend_isEqual_(contentRequestHeaders, v7, v17)) {
      goto LABEL_23;
    }
  }
  authPutRequest = self->_authPutRequest;
  uint64_t v19 = v4[3];
  if ((unint64_t)authPutRequest | v19)
  {
    if (!objc_msgSend_isEqual_(authPutRequest, v7, v19)) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_authPutType != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((v4[9] & 2) != 0)
  {
LABEL_23:
    BOOL v20 = 0;
    goto LABEL_24;
  }
  BOOL v20 = (v4[9] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[9] & 1) == 0 || self->_options != v4[1]) {
      goto LABEL_23;
    }
    BOOL v20 = 1;
  }
LABEL_24:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_type, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_field, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_assets, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_uploads, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_contentRequestHeaders, v14, v15);
  uint64_t v19 = objc_msgSend_hash(self->_authPutRequest, v17, v18);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_authPutType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v21 = 2654435761u * self->_options;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  type = self->_type;
  uint64_t v7 = *((void *)v5 + 7);
  if (type)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(type, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setType_(self, v4, v7);
  }
  field = self->_field;
  uint64_t v9 = *((void *)v5 + 6);
  if (field)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(field, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setField_(self, v4, v9);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = *((id *)v5 + 2);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v42, v48, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addAssets_(self, v13, *(void *)(*((void *)&v42 + 1) + 8 * i));
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v42, v48, 16);
    }
    while (v14);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = *((id *)v5 + 8);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, v47, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_addUploads_(self, v20, *(void *)(*((void *)&v38 + 1) + 8 * j));
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v38, v47, 16);
    }
    while (v21);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = *((id *)v5 + 5);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v34, v46, 16);
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_addContentRequestHeaders_(self, v27, *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v34, v46, 16);
    }
    while (v28);
  }

  uint64_t v32 = *((void *)v5 + 3);
  if (v32) {
    objc_msgSend_setAuthPutRequest_(self, v31, v32);
  }
  char v33 = *((unsigned char *)v5 + 72);
  if ((v33 & 2) != 0)
  {
    self->_authPutType = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v33 = *((unsigned char *)v5 + 72);
  }
  if (v33)
  {
    self->_options = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (CKDPRecordFieldIdentifier)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSMutableArray)uploads
{
  return self->_uploads;
}

- (void)setUploads:(id)a3
{
}

- (NSMutableArray)contentRequestHeaders
{
  return self->_contentRequestHeaders;
}

- (void)setContentRequestHeaders:(id)a3
{
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_contentRequestHeaders, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end