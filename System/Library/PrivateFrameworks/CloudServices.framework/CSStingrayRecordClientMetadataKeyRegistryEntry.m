@interface CSStingrayRecordClientMetadataKeyRegistryEntry
+ (Class)publicKeysType;
- (BOOL)hasPcsService;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)publicKeys;
- (NSString)pcsService;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)publicKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)publicKeysCount;
- (void)addPublicKeys:(id)a3;
- (void)clearPublicKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPcsService:(id)a3;
- (void)setPublicKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecordClientMetadataKeyRegistryEntry

- (BOOL)hasPcsService
{
  return self->_pcsService != 0;
}

- (void)clearPublicKeys
{
}

- (void)addPublicKeys:(id)a3
{
  v4 = (const char *)a3;
  publicKeys = self->_publicKeys;
  v8 = (char *)v4;
  if (!publicKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
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
  return (id)MEMORY[0x270F9A6D0](self->_publicKeys, sel_objectAtIndex_, a3);
}

+ (Class)publicKeysType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecordClientMetadataKeyRegistryEntry;
  v4 = [(CSStingrayRecordClientMetadataKeyRegistryEntry *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  uint64_t v6 = v4;
  pcsService = self->_pcsService;
  if (pcsService) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)pcsService, @"pcsService");
  }
  publicKeys = self->_publicKeys;
  if (publicKeys) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)publicKeys, @"publicKeys");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordClientMetadataKeyRegistryEntryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_pcsService) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_publicKeys;
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
        PBDataWriterWriteDataField();
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
  id v16 = a3;
  pcsService = self->_pcsService;
  if (pcsService) {
    objc_msgSend_setPcsService_(v16, v4, (uint64_t)pcsService);
  }
  if (objc_msgSend_publicKeysCount(self, v4, (uint64_t)pcsService))
  {
    objc_msgSend_clearPublicKeys(v16, v6, v7);
    uint64_t v10 = objc_msgSend_publicKeysCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_publicKeysAtIndex_(self, v11, i);
        objc_msgSend_addPublicKeys_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_pcsService, v11, (uint64_t)a3);
  long long v13 = (void *)v10[1];
  v10[1] = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_publicKeys;
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
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addPublicKeys_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((pcsService = self->_pcsService, uint64_t v9 = v4[1], !((unint64_t)pcsService | v9))
     || objc_msgSend_isEqual_(pcsService, v7, v9)))
  {
    publicKeys = self->_publicKeys;
    uint64_t v11 = v4[2];
    if ((unint64_t)publicKeys | v11) {
      char isEqual = objc_msgSend_isEqual_(publicKeys, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_pcsService, a2, v2);
  return objc_msgSend_hash(self->_publicKeys, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 1);
  if (v6) {
    objc_msgSend_setPcsService_(self, v4, v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v5 + 2);
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
        objc_msgSend_addPublicKeys_(self, v10, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }
}

- (NSString)pcsService
{
  return self->_pcsService;
}

- (void)setPcsService:(id)a3
{
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
  objc_storeStrong((id *)&self->_publicKeys, 0);

  objc_storeStrong((id *)&self->_pcsService, 0);
}

@end