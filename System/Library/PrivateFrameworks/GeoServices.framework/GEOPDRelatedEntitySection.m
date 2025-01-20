@interface GEOPDRelatedEntitySection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDRelatedEntitySection)init;
- (GEOPDRelatedEntitySection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)name;
- (id)relatedCollectionSection;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_readName;
- (void)_readRelatedCollectionSection;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDRelatedEntitySection

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection](result);
    uint64_t v4 = *(void *)(v3 + 32);
    return -[GEOPDRelatedCollectionSection hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDRelatedEntitySection readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 32);
      -[GEOPDRelatedCollectionSection clearUnknownFields:](v5, 1);
    }
  }
}

- (GEOPDRelatedEntitySection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDRelatedEntitySection;
  v2 = [(GEOPDRelatedEntitySection *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDRelatedEntitySection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDRelatedEntitySection;
  uint64_t v3 = [(GEOPDRelatedEntitySection *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedEntitySectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_11);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDRelatedEntitySection _readName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)sectionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 60);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 56);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readRelatedCollectionSection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDRelatedEntitySectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedCollectionSection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)relatedCollectionSection
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDRelatedEntitySection;
  uint64_t v4 = [(GEOPDRelatedEntitySection *)&v8 description];
  uint64_t v5 = [(GEOPDRelatedEntitySection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRelatedEntitySection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDRelatedEntitySection readAll:](a1, 1);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDRelatedEntitySection name]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    char v6 = *(unsigned char *)(a1 + 60);
    if (v6)
    {
      objc_super v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      [v4 setObject:v7 forKey:@"index"];

      char v6 = *(unsigned char *)(a1 + 60);
    }
    if ((v6 & 2) != 0)
    {
      int v8 = *(_DWORD *)(a1 + 56);
      if (v8)
      {
        if (v8 == 1)
        {
          v9 = @"RELATED_ENTITY_SECTION_TYPE_COLLECTION";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 56));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v9 = @"RELATED_ENTITY_SECTION_TYPE_UNKNOWN";
      }
      if (a2) {
        v10 = @"sectionType";
      }
      else {
        v10 = @"section_type";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOPDRelatedEntitySection relatedCollectionSection]((id *)a1);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"relatedCollectionSection";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"related_collection_section";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__GEOPDRelatedEntitySection__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRelatedEntitySection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        char v6 = (int *)&readAll__recursiveTag_366_1;
      }
      else {
        char v6 = (int *)&readAll__nonRecursiveTag_367_1;
      }
      GEOPDRelatedEntitySectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __55__GEOPDRelatedEntitySection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_45;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_45;
  }
  char v6 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    id v8 = v7;
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), v7);
  }
  v9 = [v5 objectForKeyedSubscript:@"index"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v9 unsignedIntValue];
    *(unsigned char *)(a1 + 60) |= 0x20u;
    *(unsigned char *)(a1 + 60) |= 1u;
    *(_DWORD *)(a1 + 52) = v10;
  }

  if (a3) {
    v11 = @"sectionType";
  }
  else {
    v11 = @"section_type";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_UNKNOWN"]) {
      int v14 = 0;
    }
    else {
      int v14 = [v13 isEqualToString:@"RELATED_ENTITY_SECTION_TYPE_COLLECTION"];
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [v12 intValue];
LABEL_17:
    *(unsigned char *)(a1 + 60) |= 0x20u;
    *(unsigned char *)(a1 + 60) |= 2u;
    *(_DWORD *)(a1 + 56) = v14;
  }

  if (a3) {
    v15 = @"relatedCollectionSection";
  }
  else {
    v15 = @"related_collection_section";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEOPDRelatedCollectionSection alloc];
    if (v17)
    {
      id v18 = v16;
      v17 = [(GEOPDRelatedCollectionSection *)v17 init];
      if (v17)
      {
        if (a3) {
          id v19 = @"collectionId";
        }
        else {
          id v19 = @"collection_id";
        }
        id v20 = [v18 objectForKeyedSubscript:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v33 = v16;
          id v34 = v5;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v32 = v20;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v36 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v27 = [GEOPDMapsIdentifier alloc];
                  if (a3) {
                    v28 = [(GEOPDMapsIdentifier *)v27 initWithJSON:v26];
                  }
                  else {
                    v28 = [(GEOPDMapsIdentifier *)v27 initWithDictionary:v26];
                  }
                  v29 = v28;
                  -[GEOPDRelatedCollectionSection addCollectionId:]((uint64_t)v17, v28);
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
            }
            while (v23);
          }

          v16 = v33;
          id v5 = v34;
          id v20 = v32;
        }
      }
    }
    v30 = v17;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    *(unsigned char *)(a1 + 60) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), v17);
  }
LABEL_45:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRelatedEntitySectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      id v6 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_relatedCollectionSection)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDRelatedEntitySectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  int v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_index;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_sectionType;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v12 = [(GEOPDRelatedCollectionSection *)self->_relatedCollectionSection copyWithZone:a3];
  id v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  int v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 1);
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_index != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 14)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  relatedCollectionSection = self->_relatedCollectionSection;
  if ((unint64_t)relatedCollectionSection | *((void *)v4 + 4)) {
    char v7 = -[GEOPDRelatedCollectionSection isEqual:](relatedCollectionSection, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_index;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(GEOPDRelatedCollectionSection *)self->_relatedCollectionSection hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_sectionType;
  return v4 ^ v3 ^ v5 ^ [(GEOPDRelatedCollectionSection *)self->_relatedCollectionSection hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedCollectionSection, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end