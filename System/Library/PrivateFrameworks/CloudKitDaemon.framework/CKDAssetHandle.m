@interface CKDAssetHandle
+ (id)descriptionWithStatus:(int64_t)a3;
- (BOOL)isEqualRevisionOfAssetHandle:(id)a3 differencesDescription:(id *)a4;
- (BOOL)isEqualToAssetHandle:(id)a3 keys:(id)a4 optionalKeys:(id)a5 differencesDescription:(id *)a6;
- (BOOL)mayBeEvicted;
- (BOOL)mayHaveAssetCacheManagedFile;
- (BOOL)shouldBeUnregisteredBeforeDeleted;
- (CKDAssetHandle)initWithItemID:(id)a3 UUID:(id)a4 path:(id)a5;
- (CKDAssetHandle)initWithPropertyDictionary:(id)a3;
- (NSData)boundaryKeyHash;
- (NSData)fileSignature;
- (NSDate)lastUsedTime;
- (NSDate)modTime;
- (NSNumber)chunkCount;
- (NSNumber)fileID;
- (NSNumber)fileSize;
- (NSNumber)generationID;
- (NSNumber)isCloned;
- (NSNumber)itemID;
- (NSNumber)status;
- (NSNumber)usesMMCSVersion2;
- (NSNumber)volumeIndex;
- (NSString)path;
- (NSUUID)UUID;
- (id)CKPropertiesDescription;
- (id)description;
- (id)dictionaryPropertyEncoding;
- (id)statusDescription;
- (void)setBoundaryKeyHash:(id)a3;
- (void)setBoundaryKeyHashUsingBoundaryKey:(id)a3;
- (void)setChunkCount:(id)a3;
- (void)setFileID:(id)a3;
- (void)setFileSignature:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setGenerationID:(id)a3;
- (void)setIsCloned:(id)a3;
- (void)setItemID:(id)a3;
- (void)setLastUsedTime:(id)a3;
- (void)setModTime:(id)a3;
- (void)setPath:(id)a3;
- (void)setStatus:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVolumeIndex:(id)a3;
@end

@implementation CKDAssetHandle

- (id)dictionaryPropertyEncoding
{
  v3 = objc_opt_new();
  v6 = objc_msgSend_UUID(self, v4, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"UUID");

  v10 = objc_msgSend_itemID(self, v8, v9);

  if (v10)
  {
    v13 = objc_msgSend_itemID(self, v11, v12);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"itemID");
  }
  v15 = objc_msgSend_path(self, v11, v12);

  if (v15)
  {
    v18 = objc_msgSend_path(self, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, @"path");
  }
  v20 = objc_msgSend_volumeIndex(self, v16, v17);

  if (v20)
  {
    v23 = objc_msgSend_volumeIndex(self, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, @"volumeIndex");
  }
  v25 = objc_msgSend_fileID(self, v21, v22);

  if (v25)
  {
    v28 = objc_msgSend_fileID(self, v26, v27);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, @"fileID");
  }
  v30 = objc_msgSend_generationID(self, v26, v27);

  if (v30)
  {
    v33 = objc_msgSend_generationID(self, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v34, (uint64_t)v33, @"generationID");
  }
  v35 = objc_msgSend_lastUsedTime(self, v31, v32);

  if (v35)
  {
    v38 = objc_msgSend_lastUsedTime(self, v36, v37);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v39, (uint64_t)v38, @"lastUsedTime");
  }
  v40 = objc_msgSend_fileSignature(self, v36, v37);

  if (v40)
  {
    v43 = objc_msgSend_fileSignature(self, v41, v42);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v43, @"fileSignature");
  }
  v45 = objc_msgSend_status(self, v41, v42);

  if (v45)
  {
    v48 = objc_msgSend_status(self, v46, v47);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v49, (uint64_t)v48, @"status");
  }
  v50 = objc_msgSend_modTime(self, v46, v47);

  if (v50)
  {
    v53 = objc_msgSend_modTime(self, v51, v52);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v54, (uint64_t)v53, @"modTime");
  }
  v55 = objc_msgSend_fileSize(self, v51, v52);

  if (v55)
  {
    v58 = objc_msgSend_fileSize(self, v56, v57);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, @"fileSize");
  }
  v60 = objc_msgSend_chunkCount(self, v56, v57);

  if (v60)
  {
    v63 = objc_msgSend_chunkCount(self, v61, v62);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v64, (uint64_t)v63, @"chunkCount");
  }
  return v3;
}

- (CKDAssetHandle)initWithPropertyDictionary:(id)a3
{
  id v4 = a3;
  v8 = (CKDAssetHandle *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"UUID");
    objc_msgSend_setUUID_(v8, v10, (uint64_t)v9);

    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"itemID");
    objc_msgSend_setItemID_(v8, v13, (uint64_t)v12);

    v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"path");
    objc_msgSend_setPath_(v8, v16, (uint64_t)v15);

    v18 = objc_msgSend_objectForKeyedSubscript_(v4, v17, @"volumeIndex");
    objc_msgSend_setVolumeIndex_(v8, v19, (uint64_t)v18);

    v21 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"fileID");
    objc_msgSend_setFileID_(v8, v22, (uint64_t)v21);

    v24 = objc_msgSend_objectForKeyedSubscript_(v4, v23, @"generationID");
    objc_msgSend_setGenerationID_(v8, v25, (uint64_t)v24);

    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v4, v26, @"lastUsedTime");
    objc_msgSend_setLastUsedTime_(v8, v28, (uint64_t)v27);

    v30 = objc_msgSend_objectForKeyedSubscript_(v4, v29, @"fileSignature");
    objc_msgSend_setFileSignature_(v8, v31, (uint64_t)v30);

    v33 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"status");
    objc_msgSend_setStatus_(v8, v34, (uint64_t)v33);

    v36 = objc_msgSend_objectForKeyedSubscript_(v4, v35, @"modTime");
    objc_msgSend_setModTime_(v8, v37, (uint64_t)v36);

    v39 = objc_msgSend_objectForKeyedSubscript_(v4, v38, @"fileSize");
    objc_msgSend_setFileSize_(v8, v40, (uint64_t)v39);

    uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v4, v41, @"chunkCount");
    objc_msgSend_setChunkCount_(v8, v43, (uint64_t)v42);

    v46 = objc_msgSend_UUID(v8, v44, v45);

    if (!v46)
    {
      v49 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v47, v48);
      objc_msgSend_setUUID_(v8, v50, (uint64_t)v49);
    }
    v51 = objc_msgSend_status(v8, v47, v48);

    if (!v51) {
      objc_msgSend_setStatus_(v8, v52, (uint64_t)&unk_1F20AD020);
    }
    v54 = objc_msgSend_lastUsedTime(v8, v52, v53);

    if (!v54)
    {
      uint64_t v57 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v55, v56);
      objc_msgSend_setLastUsedTime_(v8, v58, (uint64_t)v57);
    }
  }

  return v8;
}

+ (id)descriptionWithStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return @"UnDefInEd";
  }
  else {
    return off_1E64F8B60[a3];
  }
}

- (BOOL)mayBeEvicted
{
  status = self->_status;
  if (status && (unint64_t v4 = objc_msgSend_integerValue(status, a2, v2), v4 <= 6)) {
    return (0x29u >> v4) & 1;
  }
  else {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)shouldBeUnregisteredBeforeDeleted
{
  status = self->_status;
  return !status || objc_msgSend_integerValue(status, a2, v2) != 8;
}

- (BOOL)mayHaveAssetCacheManagedFile
{
  status = self->_status;
  if (status)
  {
    uint64_t v4 = objc_msgSend_integerValue(status, a2, v2);
    LOBYTE(status) = v4 == 3 || v4 == 8;
  }
  return (char)status;
}

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 9);
  uint64_t v4 = NSString;
  v7 = objc_msgSend_UUID(self, v5, v6);
  v10 = objc_msgSend_UUIDString(v7, v8, v9);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v4, v11, @"UUID=%@", v10);
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v16 = objc_msgSend_itemID(self, v14, v15);

  if (v16)
  {
    v19 = NSString;
    v20 = objc_msgSend_itemID(self, v17, v18);
    uint64_t v23 = objc_msgSend_unsignedLongLongValue(v20, v21, v22);
    v25 = objc_msgSend_stringWithFormat_(v19, v24, @"itemID=%llu", v23);
    objc_msgSend_addObject_(v3, v26, (uint64_t)v25);
  }
  uint64_t v27 = objc_msgSend_path(self, v17, v18);

  if (v27)
  {
    v30 = NSString;
    v31 = objc_msgSend_path(self, v28, v29);
    v34 = objc_msgSend_CKSanitizedPath(v31, v32, v33);
    v36 = objc_msgSend_stringWithFormat_(v30, v35, @"path=\"%@\"", v34);
    objc_msgSend_addObject_(v3, v37, (uint64_t)v36);
  }
  v38 = objc_msgSend_volumeIndex(self, v28, v29);

  if (v38)
  {
    v41 = NSString;
    uint64_t v42 = objc_msgSend_volumeIndex(self, v39, v40);
    v44 = objc_msgSend_stringWithFormat_(v41, v43, @"volumeIndex=%@", v42);
    objc_msgSend_addObject_(v3, v45, (uint64_t)v44);
  }
  v46 = objc_msgSend_fileID(self, v39, v40);

  if (v46)
  {
    v49 = NSString;
    v50 = objc_msgSend_fileID(self, v47, v48);
    uint64_t v52 = objc_msgSend_stringWithFormat_(v49, v51, @"fileID=%@", v50);
    objc_msgSend_addObject_(v3, v53, (uint64_t)v52);
  }
  v54 = objc_msgSend_generationID(self, v47, v48);

  if (v54)
  {
    uint64_t v57 = NSString;
    v58 = objc_msgSend_generationID(self, v55, v56);
    v60 = objc_msgSend_stringWithFormat_(v57, v59, @"generationID=%@", v58);
    objc_msgSend_addObject_(v3, v61, (uint64_t)v60);
  }
  uint64_t v62 = objc_msgSend_lastUsedTime(self, v55, v56);

  if (v62)
  {
    v65 = NSString;
    v66 = objc_msgSend_lastUsedTime(self, v63, v64);
    v68 = objc_msgSend_stringWithFormat_(v65, v67, @"lastUsedTime=%@", v66);
    objc_msgSend_addObject_(v3, v69, (uint64_t)v68);
  }
  v70 = objc_msgSend_fileSignature(self, v63, v64);

  if (v70)
  {
    v73 = NSString;
    v74 = objc_msgSend_fileSignature(self, v71, v72);
    v77 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v74, v75, v76);
    v79 = objc_msgSend_stringWithFormat_(v73, v78, @"fileSignature=%@", v77);
    objc_msgSend_addObject_(v3, v80, (uint64_t)v79);
  }
  v81 = objc_msgSend_status(self, v71, v72);

  if (v81)
  {
    v84 = NSString;
    v85 = objc_msgSend_statusDescription(self, v82, v83);
    v87 = objc_msgSend_stringWithFormat_(v84, v86, @"status=%@", v85);
    objc_msgSend_addObject_(v3, v88, (uint64_t)v87);
  }
  v89 = objc_msgSend_modTime(self, v82, v83);

  if (v89)
  {
    v92 = NSString;
    v93 = objc_msgSend_modTime(self, v90, v91);
    v95 = objc_msgSend_stringWithFormat_(v92, v94, @"modTime=%@", v93);
    objc_msgSend_addObject_(v3, v96, (uint64_t)v95);
  }
  v97 = objc_msgSend_fileSize(self, v90, v91);

  if (v97)
  {
    v100 = NSString;
    v101 = objc_msgSend_fileSize(self, v98, v99);
    uint64_t v104 = objc_msgSend_longLongValue(v101, v102, v103);
    v106 = objc_msgSend_stringWithFormat_(v100, v105, @"fileSize=%lld", v104);
    objc_msgSend_addObject_(v3, v107, (uint64_t)v106);
  }
  v108 = objc_msgSend_chunkCount(self, v98, v99);

  if (v108)
  {
    v111 = NSString;
    v112 = objc_msgSend_chunkCount(self, v109, v110);
    uint64_t v115 = objc_msgSend_unsignedIntValue(v112, v113, v114);
    v117 = objc_msgSend_stringWithFormat_(v111, v116, @"chunkCount=%u", v115);
    objc_msgSend_addObject_(v3, v118, (uint64_t)v117);
  }
  v119 = objc_msgSend_componentsJoinedByString_(v3, v109, @", ");

  return v119;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetHandle *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)statusDescription
{
  v3 = objc_opt_class();
  uint64_t v6 = objc_msgSend_status(self, v4, v5);
  uint64_t v9 = objc_msgSend_integerValue(v6, v7, v8);
  v11 = objc_msgSend_descriptionWithStatus_(v3, v10, v9);

  return v11;
}

- (CKDAssetHandle)initWithItemID:(id)a3 UUID:(id)a4 path:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKDAssetHandle;
  uint64_t v12 = [(CKDAssetHandle *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemID, a3);
    v16 = v10;
    if (!v10)
    {
      v16 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v14, v15);
    }
    objc_storeStrong((id *)&v13->_UUID, v16);
    if (!v10) {

    }
    objc_storeStrong((id *)&v13->_path, a5);
    status = v13->_status;
    v13->_status = (NSNumber *)&unk_1F20AD020;

    uint64_t v20 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19);
    lastUsedTime = v13->_lastUsedTime;
    v13->_lastUsedTime = (NSDate *)v20;
  }
  return v13;
}

- (NSNumber)usesMMCSVersion2
{
  uint64_t v6 = objc_msgSend_fileSignature(self, a2, v2);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1A3B8];
    uint64_t v8 = objc_msgSend_fileSignature(self, v4, v5);
    int isValidV2Signature = objc_msgSend_isValidV2Signature_(v7, v9, (uint64_t)v8);
    id v11 = (void *)MEMORY[0x1E4F1CC28];
    if (isValidV2Signature) {
      id v11 = (void *)MEMORY[0x1E4F1CC38];
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return (NSNumber *)v12;
}

- (BOOL)isEqualToAssetHandle:(id)a3 keys:(id)a4 optionalKeys:(id)a5 differencesDescription:(id *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v47 = a5;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 1;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  uint64_t v62 = sub_1C50355D0;
  v63 = sub_1C50355E0;
  id v64 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C50355E8;
  aBlock[3] = &unk_1E64F8B40;
  aBlock[4] = &v59;
  aBlock[5] = &v65;
  id v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v54, v70, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_valueForKey_(self, v13, v17);
        uint64_t v20 = objc_msgSend_valueForKey_(v9, v19, v17);
        unint64_t v21 = v18;
        uint64_t v22 = v20;
        v24 = (void *)v22;
        if (v21 | v22)
        {
          if (v21) {
            BOOL v25 = v22 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {

LABEL_14:
            v28 = objc_msgSend_stringWithFormat_(NSString, v27, @"%@: %@ != %@", v17, v21, v24);
            v11[2](v11, v28);

            goto LABEL_15;
          }
          char isEqual = objc_msgSend_isEqual_((void *)v21, v23, v22);

          if ((isEqual & 1) == 0) {
            goto LABEL_14;
          }
        }
LABEL_15:
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v54, v70, 16);
    }
    while (v14);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v29 = v47;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v50, v69, 16);
  if (v32)
  {
    uint64_t v33 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        v36 = objc_msgSend_valueForKey_(self, v31, v35);
        uint64_t v38 = objc_msgSend_valueForKey_(v9, v37, v35);
        uint64_t v40 = (void *)v38;
        if (v36) {
          BOOL v41 = v38 == 0;
        }
        else {
          BOOL v41 = 1;
        }
        if (!v41 && (objc_msgSend_isEqual_(v36, v39, v38) & 1) == 0)
        {
          v43 = objc_msgSend_stringWithFormat_(NSString, v42, @"%@: %@ != %@", v35, v36, v40);
          v11[2](v11, v43);
        }
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v50, v69, 16);
    }
    while (v32);
  }

  v44 = v66;
  if (a6)
  {
    if (*((unsigned char *)v66 + 24))
    {
      *a6 = 0;
    }
    else
    {
      *a6 = (id) v60[5];
      v44 = v66;
    }
  }
  BOOL v45 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v45;
}

- (BOOL)isEqualRevisionOfAssetHandle:(id)a3 differencesDescription:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_isEqualToAssetHandle_keys_optionalKeys_differencesDescription_, a3);
}

- (void)setBoundaryKeyHashUsingBoundaryKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v9 = (const void *)objc_msgSend_bytes(v6, v7, v8);
    CC_LONG v12 = objc_msgSend_length(v6, v10, v11);
    CC_SHA256(v9, v12, md);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v13, (uint64_t)md, 32);
    uint64_t v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    boundaryKeyHash = self->_boundaryKeyHash;
    self->_boundaryKeyHash = v14;
  }
  else
  {
    boundaryKeyHash = self->_boundaryKeyHash;
    self->_boundaryKeyHash = 0;
  }
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSNumber)volumeIndex
{
  return self->_volumeIndex;
}

- (void)setVolumeIndex:(id)a3
{
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (void)setFileSignature:(id)a3
{
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSDate)modTime
{
  return self->_modTime;
}

- (void)setModTime:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
}

- (NSNumber)chunkCount
{
  return self->_chunkCount;
}

- (void)setChunkCount:(id)a3
{
}

- (NSNumber)isCloned
{
  return self->_isCloned;
}

- (void)setIsCloned:(id)a3
{
}

- (NSData)boundaryKeyHash
{
  return self->_boundaryKeyHash;
}

- (void)setBoundaryKeyHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKeyHash, 0);
  objc_storeStrong((id *)&self->_isCloned, 0);
  objc_storeStrong((id *)&self->_chunkCount, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modTime, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_volumeIndex, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end