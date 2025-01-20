@interface GEOPDGuidesHomeRepeatableSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesHomeRepeatableSection)init;
- (GEOPDGuidesHomeRepeatableSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)carouselGuideIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)guidesLocationEntrys;
- (id)jsonRepresentation;
- (id)name;
- (id)publisherIds;
- (uint64_t)contentType;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_addNoFlagsCarouselGuideId:(uint64_t)a1;
- (void)_addNoFlagsGuidesLocationEntry:(uint64_t)a1;
- (void)_addNoFlagsPublisherId:(uint64_t)a1;
- (void)_readCarouselGuideIds;
- (void)_readGuidesLocationEntrys;
- (void)_readName;
- (void)_readPublisherIds;
- (void)addCarouselGuideId:(uint64_t)a1;
- (void)addGuidesLocationEntry:(uint64_t)a1;
- (void)addPublisherId:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesHomeRepeatableSection

- (GEOPDGuidesHomeRepeatableSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  v2 = [(GEOPDGuidesHomeRepeatableSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeRepeatableSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  v3 = [(GEOPDGuidesHomeRepeatableSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_3176);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCarouselGuideIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCarouselGuideIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)carouselGuideIds
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addCarouselGuideId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsCarouselGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsCarouselGuideId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPublisherIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherIds_tags_3177);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)publisherIds
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readPublisherIds]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPublisherId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readPublisherIds](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsPublisherId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsPublisherId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readGuidesLocationEntrys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidesLocationEntrys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)guidesLocationEntrys
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addGuidesLocationEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsGuidesLocationEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsGuidesLocationEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)contentType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  v4 = [(GEOPDGuidesHomeRepeatableSection *)&v8 description];
  id v5 = [(GEOPDGuidesHomeRepeatableSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeRepeatableSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGuidesHomeRepeatableSection readAll:](a1, 1);
    unint64_t v4 = 0x1E4F1C000uLL;
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 72);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = off_1E53DCB00[v6];
      }
      if (a2) {
        objc_super v8 = @"sectionType";
      }
      else {
        objc_super v8 = @"section_type";
      }
      [v5 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDGuidesHomeRepeatableSection name]((id *)a1);
    if (v9) {
      [v5 setObject:v9 forKey:@"name"];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v11 = *(id *)(a1 + 24);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v58 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"carouselGuideId";
      }
      else {
        v18 = @"carousel_guide_id";
      }
      [v5 setObject:v10 forKey:v18];

      unint64_t v4 = 0x1E4F1C000;
    }
    if ([*(id *)(a1 + 48) count])
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v20 = *(id *)(a1 + 48);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v54 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = [v25 dictionaryRepresentation];
            }
            [v19 addObject:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"publisherId";
      }
      else {
        v27 = @"publisher_id";
      }
      [v5 setObject:v19 forKey:v27];

      unint64_t v4 = 0x1E4F1C000uLL;
    }
    if ([*(id *)(a1 + 32) count])
    {
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v29 = *(id *)(a1 + 32);
      uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v50;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v50 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v49 + 1) + 8 * k);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            v35 = [v34 dictionaryRepresentation];
            }
            [v28 addObject:v35];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v31);
      }

      if (a2) {
        v36 = @"guidesLocationEntry";
      }
      else {
        v36 = @"guides_location_entry";
      }
      [v5 setObject:v28 forKey:v36];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v37 = *(int *)(a1 + 68);
      if (v37 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = off_1E53DCB28[v37];
      }
      if (a2) {
        v39 = @"contentType";
      }
      else {
        v39 = @"content_type";
      }
      [v5 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(*(id *)(v4 + 2656), "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __62__GEOPDGuidesHomeRepeatableSection__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v5 setObject:v42 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeRepeatableSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_3184;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_3185;
      }
      GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesHomeRepeatableSectionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDGuidesHomeRepeatableSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDGuidesHomeRepeatableSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 0);
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = self->_carouselGuideIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_publisherIds;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_guidesLocationEntrys;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGuidesHomeRepeatableSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_sectionType;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = self->_carouselGuideIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDGuidesHomeRepeatableSection addCarouselGuideId:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v16 = self->_publisherIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDGuidesHomeRepeatableSection addPublisherId:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v21 = self->_guidesLocationEntrys;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (void)v28);
        -[GEOPDGuidesHomeRepeatableSection addGuidesLocationEntry:](v5, v25);
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v22);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_contentType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 18)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_19;
  }
  carouselGuideIds = self->_carouselGuideIds;
  if ((unint64_t)carouselGuideIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](carouselGuideIds, "isEqual:")) {
      goto LABEL_19;
    }
  }
  publisherIds = self->_publisherIds;
  if ((unint64_t)publisherIds | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](publisherIds, "isEqual:")) {
      goto LABEL_19;
    }
  }
  guidesLocationEntrys = self->_guidesLocationEntrys;
  if ((unint64_t)guidesLocationEntrys | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](guidesLocationEntrys, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 17)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  uint64_t v5 = [(NSMutableArray *)self->_carouselGuideIds hash];
  uint64_t v6 = [(NSMutableArray *)self->_publisherIds hash];
  uint64_t v7 = [(NSMutableArray *)self->_guidesLocationEntrys hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIds, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guidesLocationEntrys, 0);
  objc_storeStrong((id *)&self->_carouselGuideIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end