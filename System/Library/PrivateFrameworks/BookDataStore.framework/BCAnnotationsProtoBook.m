@interface BCAnnotationsProtoBook
+ (Class)annotationType;
- (BOOL)hasAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)annotations;
- (NSString)appVersion;
- (NSString)assetID;
- (NSString)assetVersion;
- (id)annotationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (void)addAnnotation:(id)a3;
- (void)clearAnnotations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCAnnotationsProtoBook

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)clearAnnotations
{
  objc_msgSend_removeAllObjects(self->_annotations, a2, v2, v3, v4, v5, v6, v7);
}

- (void)addAnnotation:(id)a3
{
  uint64_t v4 = (const char *)a3;
  annotations = self->_annotations;
  v13 = (char *)v4;
  if (!annotations)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v12 = self->_annotations;
    self->_annotations = v11;

    uint64_t v4 = v13;
    annotations = self->_annotations;
  }
  objc_msgSend_addObject_(annotations, v4, (uint64_t)v4, v5, v6, v7, v8, v9);
}

- (unint64_t)annotationsCount
{
  return objc_msgSend_count(self->_annotations, a2, v2, v3, v4, v5, v6, v7);
}

- (id)annotationAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_annotations, a2, a3, v3, v4, v5, v6, v7);
}

+ (Class)annotationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)BCAnnotationsProtoBook;
  uint64_t v4 = [(BCAnnotationsProtoBook *)&v21 description];
  v12 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8, v9, v10, v11);
  v19 = objc_msgSend_stringWithFormat_(v3, v13, @"%@ %@", v14, v15, v16, v17, v18, v4, v12);

  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4, v5, v6, v7);
  uint64_t v16 = v9;
  assetID = self->_assetID;
  if (assetID) {
    objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)assetID, @"assetID", v12, v13, v14, v15);
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    objc_msgSend_setObject_forKey_(v16, v10, (uint64_t)appVersion, @"appVersion", v12, v13, v14, v15);
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    objc_msgSend_setObject_forKey_(v16, v10, (uint64_t)assetVersion, @"assetVersion", v12, v13, v14, v15);
  }
  if (objc_msgSend_count(self->_annotations, v10, (uint64_t)assetVersion, v11, v12, v13, v14, v15))
  {
    id v20 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v28 = objc_msgSend_count(self->_annotations, v21, v22, v23, v24, v25, v26, v27);
    v35 = objc_msgSend_initWithCapacity_(v20, v29, v28, v30, v31, v32, v33, v34);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v36 = self->_annotations;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v65, (uint64_t)v69, 16, v38, v39, v40);
    if (v41)
    {
      uint64_t v49 = v41;
      uint64_t v50 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v66 != v50) {
            objc_enumerationMutation(v36);
          }
          v52 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v65 + 1) + 8 * i), v42, v43, v44, v45, v46, v47, v48, (void)v65);
          objc_msgSend_addObject_(v35, v53, (uint64_t)v52, v54, v55, v56, v57, v58);
        }
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v42, (uint64_t)&v65, (uint64_t)v69, 16, v46, v47, v48);
      }
      while (v49);
    }

    objc_msgSend_setObject_forKey_(v16, v59, (uint64_t)v35, @"annotation", v60, v61, v62, v63);
  }
  return v16;
}

- (BOOL)readFrom:(id)a3
{
  return BCAnnotationsProtoBookReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_assetID) {
    sub_2361FC65C();
  }
  uint64_t v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_appVersion) {
    sub_2361FC688();
  }
  PBDataWriterWriteStringField();
  if (self->_assetVersion) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_annotations;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v19, (uint64_t)v23, 16, v16, v17, v18);
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v53 = a3;
  objc_msgSend_setAssetID_(v53, v4, (uint64_t)self->_assetID, v5, v6, v7, v8, v9);
  objc_msgSend_setAppVersion_(v53, v10, (uint64_t)self->_appVersion, v11, v12, v13, v14, v15);
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    objc_msgSend_setAssetVersion_(v53, v16, (uint64_t)assetVersion, v17, v18, v19, v20, v21);
  }
  if (objc_msgSend_annotationsCount(self, v16, (uint64_t)assetVersion, v17, v18, v19, v20, v21))
  {
    objc_msgSend_clearAnnotations(v53, v23, v24, v25, v26, v27, v28, v29);
    uint64_t v37 = objc_msgSend_annotationsCount(self, v30, v31, v32, v33, v34, v35, v36);
    if (v37)
    {
      uint64_t v44 = v37;
      for (uint64_t i = 0; i != v44; ++i)
      {
        uint64_t v46 = objc_msgSend_annotationAtIndex_(self, v38, i, v39, v40, v41, v42, v43);
        objc_msgSend_addAnnotation_(v53, v47, (uint64_t)v46, v48, v49, v50, v51, v52);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v12 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_init(v12, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v27 = objc_msgSend_copyWithZone_(self->_assetID, v21, (uint64_t)a3, v22, v23, v24, v25, v26);
  uint64_t v28 = (void *)v20[3];
  v20[3] = v27;

  uint64_t v35 = objc_msgSend_copyWithZone_(self->_appVersion, v29, (uint64_t)a3, v30, v31, v32, v33, v34);
  uint64_t v36 = (void *)v20[2];
  v20[2] = v35;

  uint64_t v43 = objc_msgSend_copyWithZone_(self->_assetVersion, v37, (uint64_t)a3, v38, v39, v40, v41, v42);
  uint64_t v44 = (void *)v20[4];
  v20[4] = v43;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v45 = self->_annotations;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v68, (uint64_t)v72, 16, v47, v48, v49);
  if (v50)
  {
    uint64_t v57 = v50;
    uint64_t v58 = *(void *)v69;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v69 != v58) {
          objc_enumerationMutation(v45);
        }
        uint64_t v60 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v68 + 1) + 8 * v59), v51, (uint64_t)a3, v52, v53, v54, v55, v56, (void)v68);
        objc_msgSend_addAnnotation_(v20, v61, (uint64_t)v60, v62, v63, v64, v65, v66);

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v51, (uint64_t)&v68, (uint64_t)v72, 16, v54, v55, v56);
    }
    while (v57);
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9, v10, v11)
    && ((assetID = self->_assetID, uint64_t v19 = v4[3], !((unint64_t)assetID | v19))
     || objc_msgSend_isEqual_(assetID, v12, v19, v13, v14, v15, v16, v17))
    && ((appVersion = self->_appVersion, uint64_t v21 = v4[2], !((unint64_t)appVersion | v21))
     || objc_msgSend_isEqual_(appVersion, v12, v21, v13, v14, v15, v16, v17))
    && ((assetVersion = self->_assetVersion, uint64_t v23 = v4[4], !((unint64_t)assetVersion | v23))
     || objc_msgSend_isEqual_(assetVersion, v12, v23, v13, v14, v15, v16, v17)))
  {
    annotations = self->_annotations;
    uint64_t v25 = v4[1];
    if ((unint64_t)annotations | v25) {
      char isEqual = objc_msgSend_isEqual_(annotations, v12, v25, v13, v14, v15, v16, v17);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v9 = objc_msgSend_hash(self->_assetID, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_hash(self->_appVersion, v10, v11, v12, v13, v14, v15, v16) ^ v9;
  uint64_t v25 = objc_msgSend_hash(self->_assetVersion, v18, v19, v20, v21, v22, v23, v24);
  return v17 ^ v25 ^ objc_msgSend_hash(self->_annotations, v26, v27, v28, v29, v30, v31, v32);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = *((void *)v10 + 3);
  if (v11) {
    objc_msgSend_setAssetID_(self, v4, v11, v5, v6, v7, v8, v9);
  }
  uint64_t v12 = *((void *)v10 + 2);
  if (v12) {
    objc_msgSend_setAppVersion_(self, v4, v12, v5, v6, v7, v8, v9);
  }
  uint64_t v13 = *((void *)v10 + 4);
  if (v13) {
    objc_msgSend_setAssetVersion_(self, v4, v13, v5, v6, v7, v8, v9);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = *((id *)v10 + 1);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v29, (uint64_t)v33, 16, v16, v17, v18);
  if (v19)
  {
    uint64_t v26 = v19;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_addAnnotation_(self, v20, *(void *)(*((void *)&v29 + 1) + 8 * i), v21, v22, v23, v24, v25, (void)v29);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v20, (uint64_t)&v29, (uint64_t)v33, 16, v23, v24, v25);
    }
    while (v26);
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSMutableArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end