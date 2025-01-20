@interface GEOPDExploreGuides
+ (id)exploreGuideComponentFromPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDExploreGuides)init;
- (GEOPDExploreGuides)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exploreImageUrlTemplate;
- (id)guidesLocationEntry;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readExploreImageUrlTemplate;
- (void)_readGuidesLocationEntry;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setExploreImageUrlTemplate:(uint64_t)a1;
- (void)setGuidesLocationEntry:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExploreGuides

- (id)exploreImageUrlTemplate
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExploreGuides _readExploreImageUrlTemplate]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readExploreImageUrlTemplate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExploreGuidesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExploreImageUrlTemplate_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_readGuidesLocationEntry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExploreGuidesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesLocationEntry_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOPDExploreGuides)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDExploreGuides;
  v2 = [(GEOPDExploreGuides *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidesLocationEntry, 0);
  objc_storeStrong((id *)&self->_exploreImageUrlTemplate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)exploreGuideComponentFromPlaceData:(id)a3
{
  return (id)[a3 successfulComponentWithValuesOfType:85];
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDExploreGuides _readGuidesLocationEntry](result);
    uint64_t v4 = *(void *)(v3 + 32);
    return -[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](v4, a2);
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    v7 = v3;
    -[GEOPDExploreGuides readAll:]((uint64_t)v3, 0);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = (void *)v7[4];
    if (v4)
    {
      if (v5) {
        -[GEOPDGuidesLocationEntry mergeFrom:](v4, v5);
      }
    }
    else if (v5)
    {
      -[GEOPDExploreGuides setGuidesLocationEntry:](a1, v5);
    }
    uint64_t v3 = v7;
    objc_super v6 = (void *)v7[3];
    if (v6)
    {
      -[GEOPDExploreGuides setExploreImageUrlTemplate:](a1, v6);
      uint64_t v3 = v7;
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 52) |= 1u;
    *(unsigned char *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDExploreGuides readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 32);
      -[GEOPDGuidesLocationEntry clearUnknownFields:](v5, 1);
    }
  }
}

- (GEOPDExploreGuides)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDExploreGuides;
  uint64_t v3 = [(GEOPDExploreGuides *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (id)guidesLocationEntry
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExploreGuides _readGuidesLocationEntry]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setGuidesLocationEntry:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 4u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setExploreImageUrlTemplate:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 52) |= 2u;
    *(unsigned char *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExploreGuides;
  id v4 = [(GEOPDExploreGuides *)&v8 description];
  uint64_t v5 = [(GEOPDExploreGuides *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExploreGuides _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDExploreGuides readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDExploreGuides guidesLocationEntry]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"guidesLocationEntry";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"guides_location_entry";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDExploreGuides exploreImageUrlTemplate]((id *)a1);
    if (v9)
    {
      if (a2) {
        v10 = @"exploreImageUrlTemplate";
      }
      else {
        v10 = @"explore_image_url_template";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__GEOPDExploreGuides__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExploreGuides _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5021;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5022;
      }
      GEOPDExploreGuidesReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDGuidesLocationEntry readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDExploreGuides__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"guidesLocationEntry";
      }
      else {
        objc_super v6 = @"guides_location_entry";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDGuidesLocationEntry alloc];
        if (v8) {
          v9 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v8, v7, a3);
        }
        else {
          v9 = 0;
        }
        -[GEOPDExploreGuides setGuidesLocationEntry:]((uint64_t)a1, v9);
      }
      if (a3) {
        id v10 = @"exploreImageUrlTemplate";
      }
      else {
        id v10 = @"explore_image_url_template";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        -[GEOPDExploreGuides setExploreImageUrlTemplate:]((uint64_t)a1, v12);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDExploreGuidesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDExploreGuidesIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExploreGuides readAll:]((uint64_t)self, 0);
    if (self->_guidesLocationEntry) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_exploreImageUrlTemplate)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExploreGuides readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDGuidesLocationEntry *)self->_guidesLocationEntry copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_exploreImageUrlTemplate copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDExploreGuidesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDExploreGuides readAll:]((uint64_t)self, 1),
         -[GEOPDExploreGuides readAll:]((uint64_t)v4, 1),
         guidesLocationEntry = self->_guidesLocationEntry,
         !((unint64_t)guidesLocationEntry | v4[4]))
     || -[GEOPDGuidesLocationEntry isEqual:](guidesLocationEntry, "isEqual:")))
  {
    exploreImageUrlTemplate = self->_exploreImageUrlTemplate;
    if ((unint64_t)exploreImageUrlTemplate | v4[3]) {
      char v7 = -[NSString isEqual:](exploreImageUrlTemplate, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDExploreGuides readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDGuidesLocationEntry *)self->_guidesLocationEntry hash];
  return [(NSString *)self->_exploreImageUrlTemplate hash] ^ v3;
}

@end