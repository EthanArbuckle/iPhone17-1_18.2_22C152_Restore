@interface GEOPDSCategorySearchResultSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSCategorySearchResultSection)init;
- (GEOPDSCategorySearchResultSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sectionHeaderDisplayName;
- (id)sectionSubHeaderDisplayName;
- (id)styleAttributes;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)categorySearchResultSectionCellType;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readSectionHeaderDisplayName;
- (void)_readSectionSubHeaderDisplayName;
- (void)_readStyleAttributes;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setSectionHeaderDisplayName:(uint64_t)a1;
- (void)setSectionSubHeaderDisplayName:(uint64_t)a1;
- (void)setSectionSubHeaderDisplayNameWithEnrichment:(uint64_t)a1;
- (void)setStyleAttributes:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSCategorySearchResultSection

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7C) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 0);
    if (self->_sectionHeaderDisplayName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_sectionSubHeaderDisplayName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_sectionSubHeaderDisplayNameWithEnrichment)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_13;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_13;
      }
      GEOPDSCategorySearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 48) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setSectionSubHeaderDisplayNameWithEnrichment:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 72) |= 8u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_38;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_38;
  }
  if (a3) {
    v6 = @"sectionHeaderDisplayName";
  }
  else {
    v6 = @"section_header_display_name";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (void *)[v7 copy];
    -[GEOPDSCategorySearchResultSection setSectionHeaderDisplayName:](a1, v8);
  }
  if (a3) {
    v9 = @"sectionSubHeaderDisplayName";
  }
  else {
    v9 = @"section_sub_header_display_name";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayName:](a1, v11);
  }
  if (a3) {
    v12 = @"categorySearchResultSectionCellType";
  }
  else {
    v12 = @"category_search_result_section_cell_type";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    if ([v14 isEqualToString:@"CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT"]) {
      int v15 = 0;
    }
    else {
      int v15 = [v14 isEqualToString:@"CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NAME"];
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v13 intValue];
LABEL_23:
    *(unsigned char *)(a1 + 72) |= 0x40u;
    *(unsigned char *)(a1 + 72) |= 1u;
    *(_DWORD *)(a1 + 68) = v15;
  }

  if (a3) {
    v16 = @"styleAttributes";
  }
  else {
    v16 = @"style_attributes";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOStyleAttributes alloc];
    if (a3) {
      v19 = [(GEOStyleAttributes *)v18 initWithJSON:v17];
    }
    else {
      v19 = [(GEOStyleAttributes *)v18 initWithDictionary:v17];
    }
    v20 = v19;
    -[GEOPDSCategorySearchResultSection setStyleAttributes:](a1, v19);
  }
  if (a3) {
    v21 = @"sectionSubHeaderDisplayNameWithEnrichment";
  }
  else {
    v21 = @"section_sub_header_display_name_with_enrichment";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[v22 copy];
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayNameWithEnrichment:](a1, v23);
  }
LABEL_38:

  return a1;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSCategorySearchResultSection readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDSCategorySearchResultSection sectionHeaderDisplayName]((id *)a1);
    if (v5)
    {
      if (a2) {
        v6 = @"sectionHeaderDisplayName";
      }
      else {
        v6 = @"section_header_display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    v7 = -[GEOPDSCategorySearchResultSection sectionSubHeaderDisplayName]((id *)a1);
    if (v7)
    {
      if (a2) {
        id v8 = @"sectionSubHeaderDisplayName";
      }
      else {
        id v8 = @"section_sub_header_display_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(unsigned char *)(a1 + 72))
    {
      int v9 = *(_DWORD *)(a1 + 68);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NAME";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT";
      }
      if (a2) {
        v11 = @"categorySearchResultSectionCellType";
      }
      else {
        v11 = @"category_search_result_section_cell_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = -[GEOPDSCategorySearchResultSection styleAttributes]((id *)a1);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        id v14 = [v12 jsonRepresentation];
        int v15 = @"styleAttributes";
      }
      else
      {
        id v14 = [v12 dictionaryRepresentation];
        int v15 = @"style_attributes";
      }
      [v4 setObject:v14 forKey:v15];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayNameWithEnrichment_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v18 = *(id *)(a1 + 32);
    if (v18)
    {
      if (a2) {
        v19 = @"sectionSubHeaderDisplayNameWithEnrichment";
      }
      else {
        v19 = @"section_sub_header_display_name_with_enrichment";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __63__GEOPDSCategorySearchResultSection__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSCategorySearchResultSection;
  id v4 = [(GEOPDSCategorySearchResultSection *)&v8 description];
  id v5 = [(GEOPDSCategorySearchResultSection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (GEOPDSCategorySearchResultSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSCategorySearchResultSection;
  v2 = [(GEOPDSCategorySearchResultSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSCategorySearchResultSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSCategorySearchResultSection;
  v3 = [(GEOPDSCategorySearchResultSection *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readSectionHeaderDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionHeaderDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionHeaderDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSCategorySearchResultSection _readSectionHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSectionHeaderDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 72) |= 4u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readSectionSubHeaderDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionSubHeaderDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSCategorySearchResultSection _readSectionSubHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSectionSubHeaderDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 72) |= 0x10u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (uint64_t)categorySearchResultSectionCellType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)styleAttributes
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDSCategorySearchResultSection _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setStyleAttributes:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 72) |= 0x20u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSCategorySearchResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDSCategorySearchResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDSCategorySearchResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSCategorySearchResultSectionReadAllFrom((uint64_t)self, a3, 0);
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSCategorySearchResultSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_sectionHeaderDisplayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_sectionSubHeaderDisplayName copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_categorySearchResultSectionCellType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v13 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  id v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_sectionSubHeaderDisplayNameWithEnrichment copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  id v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)v4, 1);
  sectionHeaderDisplayName = self->_sectionHeaderDisplayName;
  if ((unint64_t)sectionHeaderDisplayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sectionHeaderDisplayName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sectionSubHeaderDisplayName = self->_sectionSubHeaderDisplayName;
  if ((unint64_t)sectionSubHeaderDisplayName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sectionSubHeaderDisplayName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_categorySearchResultSectionCellType != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((void *)v4 + 6)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_15;
  }
  sectionSubHeaderDisplayNameWithEnrichment = self->_sectionSubHeaderDisplayNameWithEnrichment;
  if ((unint64_t)sectionSubHeaderDisplayNameWithEnrichment | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](sectionSubHeaderDisplayNameWithEnrichment, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_sectionHeaderDisplayName hash];
  NSUInteger v4 = [(NSString *)self->_sectionSubHeaderDisplayName hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_categorySearchResultSectionCellType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOStyleAttributes *)self->_styleAttributes hash];
  return v6 ^ [(NSString *)self->_sectionSubHeaderDisplayNameWithEnrichment hash];
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (!a1) {
    goto LABEL_16;
  }
  uint64_t v11 = v3;
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)v3, 0);
  NSUInteger v4 = v11;
  uint64_t v5 = (void *)v11[3];
  if (v5)
  {
    -[GEOPDSCategorySearchResultSection setSectionHeaderDisplayName:](a1, v5);
    NSUInteger v4 = v11;
  }
  unint64_t v6 = (void *)v4[5];
  if (v6)
  {
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayName:](a1, v6);
    NSUInteger v4 = v11;
  }
  if (v4[9])
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(unsigned char *)(a1 + 72) |= 1u;
  }
  objc_super v7 = *(void **)(a1 + 48);
  uint64_t v8 = v4[6];
  if (v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[GEOPDSCategorySearchResultSection setStyleAttributes:](a1, (void *)v4[6]);
  }
  NSUInteger v4 = v11;
LABEL_14:
  char v9 = (void *)v4[4];
  if (v9) {
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayNameWithEnrichment:](a1, v9);
  }
LABEL_16:

  return MEMORY[0x1F4181870]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 2u;
    *(unsigned char *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    NSUInteger v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSCategorySearchResultSection readAll:](a1, 0);
      uint64_t v5 = *(void **)(a1 + 48);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayNameWithEnrichment, 0);
  objc_storeStrong((id *)&self->_sectionHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end