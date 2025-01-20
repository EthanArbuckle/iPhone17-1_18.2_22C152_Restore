@interface GEOPDMapsHomeSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsHomeSection)init;
- (GEOPDMapsHomeSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)collectionSuggestionResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)name;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_readCollectionSuggestionResult;
- (void)_readExploreGuidesEntry;
- (void)_readName;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsHomeSection

- (uint64_t)sectionType
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

- (id)name
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDMapsHomeSection _readName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (GEOPDMapsHomeSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsHomeSection;
  char v2 = [(GEOPDMapsHomeSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)collectionSuggestionResult
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDMapsHomeSection _readCollectionSuggestionResult]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readName
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
        GEOPDMapsHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3691);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readCollectionSuggestionResult
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_exploreImageUrlTemplate, 0);
  objc_storeStrong((id *)&self->_exploreGuidesEntry, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDMapsHomeSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsHomeSection;
  id v3 = [(GEOPDMapsHomeSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readExploreGuidesEntry
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 72) & 8) == 0)
  {
    char v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreGuidesEntry_tags_3692);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsHomeSection;
  v4 = [(GEOPDMapsHomeSection *)&v8 description];
  v5 = [(GEOPDMapsHomeSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsHomeSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMapsHomeSection readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      int v5 = *(_DWORD *)(a1 + 68);
      if (v5)
      {
        if (v5 == 1)
        {
          objc_super v6 = @"CURATED_GUIDES";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v6 = @"UNKNOWN";
      }
      if (a2) {
        objc_super v7 = @"sectionType";
      }
      else {
        objc_super v7 = @"section_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDMapsHomeSection name]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"name"];
    }

    v9 = -[GEOPDMapsHomeSection collectionSuggestionResult]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"collectionSuggestionResult";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"collection_suggestion_result";
      }
      [v4 setObject:v11 forKey:v12];
    }
    -[GEOPDMapsHomeSection _readExploreGuidesEntry](a1);
    id v13 = *(id *)(a1 + 32);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"exploreGuidesEntry";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"explore_guides_entry";
      }
      [v4 setObject:v15 forKey:v16];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDMapsHomeSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreImageUrlTemplate_tags_3693);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 40);
    if (v19)
    {
      if (a2) {
        v20 = @"exploreImageUrlTemplate";
      }
      else {
        v20 = @"explore_image_url_template";
      }
      [v4 setObject:v19 forKey:v20];
    }

    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __50__GEOPDMapsHomeSection__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsHomeSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_3701;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3702;
      }
      GEOPDMapsHomeSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDCollectionSuggestionResult readAll:](*(void *)(a1 + 24), 1);
      -[GEOPDGuidesLocationEntry readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __50__GEOPDMapsHomeSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
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
  return GEOPDMapsHomeSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_3;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x60) != 0) {
    goto LABEL_3;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if (GEOPDCollectionSuggestionResultIsDirty((os_unfair_lock_s *)self->_collectionSuggestionResult)) {
      goto LABEL_3;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    if (GEOPDGuidesLocationEntryIsDirty((os_unfair_lock_s *)self->_exploreGuidesEntry)) {
      goto LABEL_3;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x10) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_14;
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = v9;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_collectionSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_exploreGuidesEntry)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_exploreImageUrlTemplate)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_14:
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
      GEOPDMapsHomeSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_sectionType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOPDGuidesLocationEntry *)self->_exploreGuidesEntry copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  uint64_t v15 = [(NSString *)self->_exploreImageUrlTemplate copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
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
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 1);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_15;
  }
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | *((void *)v4 + 3))
  {
    if (!-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:")) {
      goto LABEL_15;
    }
  }
  exploreGuidesEntry = self->_exploreGuidesEntry;
  if ((unint64_t)exploreGuidesEntry | *((void *)v4 + 4))
  {
    if (!-[GEOPDGuidesLocationEntry isEqual:](exploreGuidesEntry, "isEqual:")) {
      goto LABEL_15;
    }
  }
  exploreImageUrlTemplate = self->_exploreImageUrlTemplate;
  if ((unint64_t)exploreImageUrlTemplate | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](exploreImageUrlTemplate, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  unint64_t v5 = v4 ^ [(GEOPDCollectionSuggestionResult *)self->_collectionSuggestionResult hash];
  unint64_t v6 = [(GEOPDGuidesLocationEntry *)self->_exploreGuidesEntry hash];
  return v5 ^ v6 ^ [(NSString *)self->_exploreImageUrlTemplate hash];
}

@end