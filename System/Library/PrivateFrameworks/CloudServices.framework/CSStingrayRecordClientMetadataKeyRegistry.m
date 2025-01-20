@interface CSStingrayRecordClientMetadataKeyRegistry
+ (Class)serviceEntryType;
+ (id)parseFromKeyRegistryPlist:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)serviceEntrys;
- (id)convertToPList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serviceEntryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)serviceEntrysCount;
- (void)addServiceEntry:(id)a3;
- (void)clearServiceEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServiceEntrys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecordClientMetadataKeyRegistry

+ (id)parseFromKeyRegistryPlist:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26 = objc_alloc_init(CSStingrayRecordClientMetadataKeyRegistry);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v7 = objc_msgSend_allKeys(v4, v5, v6);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, v31, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v15 = objc_msgSend_objectForKeyedSubscript_(v4, v10, v14);
        v17 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"PublicIdentities");
        if (v17)
        {
          v18 = objc_alloc_init(CSStingrayRecordClientMetadataKeyRegistryEntry);
          objc_msgSend_setPcsService_(v18, v19, v14);
          v22 = objc_msgSend_mutableCopy(v17, v20, v21);
          objc_msgSend_setPublicKeys_(v18, v23, (uint64_t)v22);

          objc_msgSend_addServiceEntry_(v26, v24, (uint64_t)v18);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, v31, 16);
    }
    while (v11);
  }

  return v26;
}

- (id)convertToPList
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = objc_msgSend_serviceEntrys(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v35, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16 = objc_msgSend_pcsService(v15, v10, v11);
        if (objc_msgSend_length(v16, v17, v18))
        {
          uint64_t v21 = objc_msgSend_publicKeys(v15, v19, v20);

          if (!v21) {
            continue;
          }
          v33 = @"PublicIdentities";
          v16 = objc_msgSend_publicKeys(v15, v10, v11);
          v34 = v16;
          v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)&v34, &v33, 1);
          v26 = objc_msgSend_pcsService(v15, v24, v25);
          objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v23, v26);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v29, v35, 16);
    }
    while (v12);
  }

  return v4;
}

- (void)clearServiceEntrys
{
}

- (void)addServiceEntry:(id)a3
{
  id v4 = (const char *)a3;
  serviceEntrys = self->_serviceEntrys;
  v8 = (char *)v4;
  if (!serviceEntrys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_serviceEntrys;
    self->_serviceEntrys = v6;

    id v4 = v8;
    serviceEntrys = self->_serviceEntrys;
  }
  objc_msgSend_addObject_(serviceEntrys, v4, (uint64_t)v4);
}

- (unint64_t)serviceEntrysCount
{
  return objc_msgSend_count(self->_serviceEntrys, a2, v2);
}

- (id)serviceEntryAtIndex:(unint64_t)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_serviceEntrys, sel_objectAtIndex_, a3);
}

+ (Class)serviceEntryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecordClientMetadataKeyRegistry;
  id v4 = [(CSStingrayRecordClientMetadataKeyRegistry *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  if (objc_msgSend_count(self->_serviceEntrys, v5, v6))
  {
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v10 = objc_msgSend_count(self->_serviceEntrys, v8, v9);
    uint64_t v12 = objc_msgSend_initWithCapacity_(v7, v11, v10);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v13 = self->_serviceEntrys;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v25, v29, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v25 + 1) + 8 * i), v16, v17, (void)v25);
          objc_msgSend_addObject_(v12, v22, (uint64_t)v21);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v25, v29, 16);
      }
      while (v18);
    }

    objc_msgSend_setObject_forKey_(v4, v23, (uint64_t)v12, @"serviceEntry");
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordClientMetadataKeyRegistryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_serviceEntrys;
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
  id v16 = a3;
  if (objc_msgSend_serviceEntrysCount(self, v4, v5))
  {
    objc_msgSend_clearServiceEntrys(v16, v6, v7);
    uint64_t v10 = objc_msgSend_serviceEntrysCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_serviceEntryAtIndex_(self, v11, i);
        objc_msgSend_addServiceEntry_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v11 = self->_serviceEntrys;
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
        objc_msgSend_addServiceEntry_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v15);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    serviceEntrys = self->_serviceEntrys;
    uint64_t v9 = v4[1];
    if ((unint64_t)serviceEntrys | v9) {
      char isEqual = objc_msgSend_isEqual_(serviceEntrys, v7, v9);
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
  return objc_msgSend_hash(self->_serviceEntrys, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_addServiceEntry_(self, v7, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }
}

- (NSMutableArray)serviceEntrys
{
  return self->_serviceEntrys;
}

- (void)setServiceEntrys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end