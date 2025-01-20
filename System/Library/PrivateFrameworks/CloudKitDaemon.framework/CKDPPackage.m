@interface CKDPPackage
+ (Class)sectionsType;
- (BOOL)hasManifest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAsset)manifest;
- (NSMutableArray)sections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sectionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sectionsCount;
- (void)addSections:(id)a3;
- (void)clearSections;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setManifest:(id)a3;
- (void)setSections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPPackage

- (BOOL)hasManifest
{
  return self->_manifest != 0;
}

- (void)clearSections
{
  objc_msgSend_removeAllObjects(self->_sections, a2, v2);
}

- (void)addSections:(id)a3
{
  v4 = (const char *)a3;
  sections = self->_sections;
  v8 = (char *)v4;
  if (!sections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sections;
    self->_sections = v6;

    v4 = v8;
    sections = self->_sections;
  }
  objc_msgSend_addObject_(sections, v4, (uint64_t)v4);
}

- (unint64_t)sectionsCount
{
  return objc_msgSend_count(self->_sections, a2, v2);
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sections, a2, a3);
}

+ (Class)sectionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPPackage;
  v4 = [(CKDPPackage *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  manifest = self->_manifest;
  if (manifest)
  {
    v8 = objc_msgSend_dictionaryRepresentation(manifest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"manifest");
  }
  if (objc_msgSend_count(self->_sections, v4, v5))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_sections, v11, v12);
    v15 = objc_msgSend_initWithCapacity_(v10, v14, v13);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = self->_sections;
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

    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v15, @"sections");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FD21F0((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_manifest) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_sections;
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
  manifest = self->_manifest;
  if (manifest) {
    objc_msgSend_setManifest_(v16, v4, (uint64_t)manifest);
  }
  if (objc_msgSend_sectionsCount(self, v4, (uint64_t)manifest))
  {
    objc_msgSend_clearSections(v16, v6, v7);
    uint64_t v10 = objc_msgSend_sectionsCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_sectionsAtIndex_(self, v11, i);
        objc_msgSend_addSections_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_manifest, v11, (uint64_t)a3);
  long long v13 = (void *)v10[1];
  v10[1] = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_sections;
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
        objc_msgSend_addSections_(v10, v22, (uint64_t)v21);

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
    && ((manifest = self->_manifest, uint64_t v9 = v4[1], !((unint64_t)manifest | v9))
     || objc_msgSend_isEqual_(manifest, v7, v9)))
  {
    sections = self->_sections;
    uint64_t v11 = v4[2];
    if ((unint64_t)sections | v11) {
      char isEqual = objc_msgSend_isEqual_(sections, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_manifest, a2, v2);
  return objc_msgSend_hash(self->_sections, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  manifest = self->_manifest;
  uint64_t v7 = *((void *)v5 + 1);
  if (manifest)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(manifest, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setManifest_(self, v4, v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addSections_(self, v11, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }
}

- (CKDPAsset)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end