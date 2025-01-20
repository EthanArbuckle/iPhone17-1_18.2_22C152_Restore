@interface CKDPRecordDeleteRequest
+ (Class)pluginFieldsType;
+ (Class)publicKeysType;
+ (id)options;
- (BOOL)hasEtag;
- (BOOL)hasParticipantKeyLost;
- (BOOL)hasRecordIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)participantKeyLost;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordIdentifier)recordIdentifier;
- (Class)responseClass;
- (NSMutableArray)pluginFields;
- (NSMutableArray)publicKeys;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pluginFieldsAtIndex:(unint64_t)a3;
- (id)publicKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pluginFieldsCount;
- (unint64_t)publicKeysCount;
- (unsigned)requestTypeCode;
- (void)addPluginFields:(id)a3;
- (void)addPublicKeys:(id)a3;
- (void)clearPluginFields;
- (void)clearPublicKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasParticipantKeyLost:(BOOL)a3;
- (void)setParticipantKeyLost:(BOOL)a3;
- (void)setPluginFields:(id)a3;
- (void)setPublicKeys:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordDeleteRequest

+ (id)options
{
  if (qword_1EBBCDE20 != -1) {
    dispatch_once(&qword_1EBBCDE20, &unk_1F2043890);
  }
  v2 = (void *)qword_1EBBCDE18;
  return v2;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (void)clearPluginFields
{
  objc_msgSend_removeAllObjects(self->_pluginFields, a2, v2);
}

- (void)addPluginFields:(id)a3
{
  v4 = (const char *)a3;
  pluginFields = self->_pluginFields;
  v8 = (char *)v4;
  if (!pluginFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pluginFields;
    self->_pluginFields = v6;

    v4 = v8;
    pluginFields = self->_pluginFields;
  }
  objc_msgSend_addObject_(pluginFields, v4, (uint64_t)v4);
}

- (unint64_t)pluginFieldsCount
{
  return objc_msgSend_count(self->_pluginFields, a2, v2);
}

- (id)pluginFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_pluginFields, a2, a3);
}

+ (Class)pluginFieldsType
{
  return (Class)objc_opt_class();
}

- (void)setParticipantKeyLost:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantKeyLost = a3;
}

- (void)setHasParticipantKeyLost:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantKeyLost
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearPublicKeys
{
  objc_msgSend_removeAllObjects(self->_publicKeys, a2, v2);
}

- (void)addPublicKeys:(id)a3
{
  v4 = (const char *)a3;
  publicKeys = self->_publicKeys;
  v8 = (char *)v4;
  if (!publicKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_publicKeys;
    self->_publicKeys = v6;

    v4 = v8;
    publicKeys = self->_publicKeys;
  }
  objc_msgSend_addObject_(publicKeys, v4, (uint64_t)v4);
}

- (unint64_t)publicKeysCount
{
  return objc_msgSend_count(self->_publicKeys, a2, v2);
}

- (id)publicKeysAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_publicKeys, a2, a3);
}

+ (Class)publicKeysType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordDeleteRequest;
  v4 = [(CKDPRecordDeleteRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"recordIdentifier");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  if (objc_msgSend_count(self->_pluginFields, v4, (uint64_t)etag))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(self->_pluginFields, v13, v14);
    v17 = objc_msgSend_initWithCapacity_(v12, v16, v15);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = self->_pluginFields;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v37, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v18);
          }
          v26 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v33 + 1) + 8 * i), v21, v22, (void)v33);
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, v37, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, @"pluginFields");
  }
  if (*(unsigned char *)&self->_has)
  {
    v29 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v11, self->_participantKeyLost);
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, @"participantKeyLost");
  }
  publicKeys = self->_publicKeys;
  if (publicKeys) {
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)publicKeys, @"publicKeys");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E9BC5C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_recordIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_pluginFields;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_publicKeys;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteDataField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }
}

- (unsigned)requestTypeCode
{
  return 6;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v26 = a3;
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier) {
    objc_msgSend_setRecordIdentifier_(v26, v4, (uint64_t)recordIdentifier);
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setEtag_(v26, v4, (uint64_t)etag);
  }
  if (objc_msgSend_pluginFieldsCount(self, v4, (uint64_t)etag))
  {
    objc_msgSend_clearPluginFields(v26, v7, v8);
    uint64_t v11 = objc_msgSend_pluginFieldsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_pluginFieldsAtIndex_(self, v7, i);
        objc_msgSend_addPluginFields_(v26, v15, (uint64_t)v14);
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v26[40] = self->_participantKeyLost;
    v26[44] |= 1u;
  }
  if (objc_msgSend_publicKeysCount(self, v7, v8))
  {
    objc_msgSend_clearPublicKeys(v26, v16, v17);
    uint64_t v20 = objc_msgSend_publicKeysCount(self, v18, v19);
    if (v20)
    {
      uint64_t v22 = v20;
      for (uint64_t j = 0; j != v22; ++j)
      {
        long long v24 = objc_msgSend_publicKeysAtIndex_(self, v21, j);
        objc_msgSend_addPublicKeys_(v26, v25, (uint64_t)v24);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v17 = self->_pluginFields;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v40, v45, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v41;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v17);
        }
        long long v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * v23), v20, (uint64_t)a3);
        objc_msgSend_addPluginFields_((void *)v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v40, v45, 16);
    }
    while (v21);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 40) = self->_participantKeyLost;
    *(unsigned char *)(v10 + 44) |= 1u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v26 = self->_publicKeys;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v36, v44, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v37;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v26);
        }
        long long v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v36 + 1) + 8 * v32), v29, (uint64_t)a3, (void)v36);
        objc_msgSend_addPublicKeys_((void *)v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v36, v44, 16);
    }
    while (v30);
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
  recordIdentifier = self->_recordIdentifier;
  uint64_t v9 = v4[4];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9)) {
      goto LABEL_12;
    }
  }
  etag = self->_etag;
  uint64_t v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11)) {
      goto LABEL_12;
    }
  }
  pluginFields = self->_pluginFields;
  uint64_t v13 = v4[2];
  if ((unint64_t)pluginFields | v13)
  {
    if (!objc_msgSend_isEqual_(pluginFields, v7, v13)) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_participantKeyLost)
      {
        if (*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
      }
      else if (!*((unsigned char *)v4 + 40))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    char isEqual = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_12;
  }
LABEL_18:
  publicKeys = self->_publicKeys;
  uint64_t v17 = v4[3];
  if ((unint64_t)publicKeys | v17) {
    char isEqual = objc_msgSend_isEqual_(publicKeys, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_13:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_etag, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_pluginFields, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_participantKeyLost;
  }
  else {
    uint64_t v13 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ objc_msgSend_hash(self->_publicKeys, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  recordIdentifier = self->_recordIdentifier;
  uint64_t v7 = *((void *)v5 + 4);
  if (recordIdentifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v7);
  }
  uint64_t v8 = *((void *)v5 + 1);
  if (v8) {
    objc_msgSend_setEtag_(self, v4, v8);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = *((id *)v5 + 2);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, v32, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addPluginFields_(self, v12, *(void *)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v27, v32, 16);
    }
    while (v13);
  }

  if (*((unsigned char *)v5 + 44))
  {
    self->_participantKeyLost = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v5 + 3);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, v31, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addPublicKeys_(self, v19, *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v23, v31, 16);
    }
    while (v20);
  }
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSMutableArray)pluginFields
{
  return self->_pluginFields;
}

- (void)setPluginFields:(id)a3
{
}

- (BOOL)participantKeyLost
{
  return self->_participantKeyLost;
}

- (NSMutableArray)publicKeys
{
  return self->_publicKeys;
}

- (void)setPublicKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeys, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end