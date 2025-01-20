@interface GEOPDPublisher
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPublisher)init;
- (GEOPDPublisher)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)publisherDescription;
- (id)publisherDescriptions;
- (id)publisherId;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)errorState;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsCollectionId:(uint64_t)a1;
- (void)_addNoFlagsPublisherDescription:(uint64_t)a1;
- (void)_readCollectionIds;
- (void)_readPublisherDescriptions;
- (void)_readPublisherId;
- (void)addCollectionId:(uint64_t)a1;
- (void)addPublisherDescription:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setName:(uint64_t)a1;
- (void)setPhoto:(uint64_t)a1;
- (void)setPublisherId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPublisher

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_7889;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_7890;
      }
      GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDPublisherCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)publisherDescription
{
  v2 = -[GEOPDPublisher publisherDescriptions]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPublisher _readCollectionIds](result);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 24);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (void)v9))
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDPublisher _readPublisherId](v3);
    return [*(id *)(v3 + 56) hasGreenTeaWithValue:a2];
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDPublisher readAll:](a1, 0);
    [*(id *)(a1 + 56) clearUnknownFields:1];
    -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(a1 + 40));
    [*(id *)(a1 + 32) clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (GEOPDPublisher)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPublisher;
  v2 = [(GEOPDPublisher *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDPublisher)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPublisher;
  id v3 = [(GEOPDPublisher *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readPublisherId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherId_tags_7874);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)publisherId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisher _readPublisherId]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPublisherId:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x80u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setPhoto:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x20u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setName:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x10u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readCollectionIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCollectionIds_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addCollectionId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPublisher _readCollectionIds](a1);
    -[GEOPDPublisher _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsCollectionId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readPublisherDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)publisherDescriptions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisher _readPublisherDescriptions]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPublisherDescription:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPublisher _readPublisherDescriptions](a1);
    -[GEOPDPublisher _addNoFlagsPublisherDescription:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsPublisherDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)errorState
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
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
  v8.super_class = (Class)GEOPDPublisher;
  id v4 = [(GEOPDPublisher *)&v8 description];
  id v5 = [(GEOPDPublisher *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisher _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDPublisher readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDPublisher publisherId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"publisherId";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"publisher_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_7875);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      long long v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"photo"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      long long v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDPublisherReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_7876);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v16 = *(id *)(a1 + 32);
    long long v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      long long v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"name"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v20 = *(id *)(a1 + 24);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (a2) {
              [v24 jsonRepresentation];
            }
            else {
            v25 = [v24 dictionaryRepresentation];
            }
            [v19 addObject:v25];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v21);
      }

      if (a2) {
        v26 = @"collectionId";
      }
      else {
        v26 = @"collection_id";
      }
      [v4 setObject:v19 forKey:v26];
    }
    if ((*(_WORD *)(a1 + 84) & 2) != 0)
    {
      v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
      if (a2) {
        v28 = @"numCollections";
      }
      else {
        v28 = @"num_collections";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v30 = *(id *)(a1 + 48);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v50 != v32) {
              objc_enumerationMutation(v30);
            }
            v34 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            v35 = [v34 dictionaryRepresentation];
            }
            [v29 addObject:v35];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v31);
      }

      if (a2) {
        v36 = @"publisherDescription";
      }
      else {
        v36 = @"publisher_description";
      }
      [v4 setObject:v29 forKey:v36];
    }
    if (*(_WORD *)(a1 + 84))
    {
      uint64_t v37 = *(int *)(a1 + 76);
      if (v37 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = off_1E53E3F90[v37];
      }
      if (a2) {
        v39 = @"errorState";
      }
      else {
        v39 = @"error_state";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __44__GEOPDPublisher__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;
      }
      else
      {
        id v45 = v41;
      }
      [v4 setObject:v45 forKey:@"Unknown Fields"];
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
  return -[GEOPDPublisher _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDPublisher__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"publisherId";
    }
    else {
      id v7 = @"publisher_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [GEOPDMapsIdentifier alloc];
      if (a3) {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
      }
      else {
        id v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
      }
      id v11 = v10;
      -[GEOPDPublisher setPublisherId:](v6, v10);
    }
    uint64_t v12 = [v5 objectForKeyedSubscript:@"photo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = [GEOPDCaptionedPhoto alloc];
      if (v13) {
        long long v14 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v13, v12, a3);
      }
      else {
        long long v14 = 0;
      }
      -[GEOPDPublisher setPhoto:](v6, v14);
    }
    id v15 = [v5 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [GEOLocalizedString alloc];
      if (a3) {
        long long v17 = [(GEOLocalizedString *)v16 initWithJSON:v15];
      }
      else {
        long long v17 = [(GEOLocalizedString *)v16 initWithDictionary:v15];
      }
      long long v18 = v17;
      -[GEOPDPublisher setName:](v6, v17);
    }
    if (a3) {
      long long v19 = @"collectionId";
    }
    else {
      long long v19 = @"collection_id";
    }
    id v20 = [v5 objectForKeyedSubscript:v19];
    objc_opt_class();
    id v49 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v55 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * i);
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
              -[GEOPDPublisher addCollectionId:](v6, v28);
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v23);
      }

      id v5 = v49;
    }

    if (a3) {
      id v30 = @"numCollections";
    }
    else {
      id v30 = @"num_collections";
    }
    uint64_t v31 = [v5 objectForKeyedSubscript:v30];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v32 = [v31 unsignedIntValue];
      *(_WORD *)(v6 + 84) |= 0x100u;
      *(_WORD *)(v6 + 84) |= 2u;
      *(_DWORD *)(v6 + 80) = v32;
    }

    if (a3) {
      v33 = @"publisherDescription";
    }
    else {
      v33 = @"publisher_description";
    }
    v34 = [v5 objectForKeyedSubscript:v33];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v51 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v41 = [GEOLocalizedString alloc];
              if (a3) {
                v42 = [(GEOLocalizedString *)v41 initWithJSON:v40];
              }
              else {
                v42 = [(GEOLocalizedString *)v41 initWithDictionary:v40];
              }
              v43 = v42;
              -[GEOPDPublisher addPublisherDescription:](v6, v42);
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v37);
      }

      id v5 = v49;
    }

    if (a3) {
      id v44 = @"errorState";
    }
    else {
      id v44 = @"error_state";
    }
    id v45 = [v5 objectForKeyedSubscript:v44];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v46 = v45;
      if ([v46 isEqualToString:@"BROOKLYN_ERROR_STATE_UNKNOWN"])
      {
        int v47 = 0;
      }
      else if ([v46 isEqualToString:@"BROOKLYN_ERROR_STATE_SUPPRESSED"])
      {
        int v47 = 1;
      }
      else if ([v46 isEqualToString:@"BROOKLYN_ERROR_STATE_BLOCKED"])
      {
        int v47 = 2;
      }
      else
      {
        int v47 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_73:

        goto LABEL_74;
      }
      int v47 = [v45 intValue];
    }
    *(_WORD *)(v6 + 84) |= 0x100u;
    *(_WORD *)(v6 + 84) |= 1u;
    *(_DWORD *)(v6 + 76) = v47;
    goto LABEL_73;
  }
LABEL_74:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPublisherIsDirty((uint64_t)self) & 1) == 0)
  {
    long long v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPublisher readAll:]((uint64_t)self, 0);
    if (self->_publisherId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_photo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_name) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_collectionIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_publisherDescriptions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPublisherReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPublisher readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_publisherId copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  id v11 = [(GEOPDCaptionedPhoto *)self->_photo copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOLocalizedString *)self->_name copyWithZone:a3];
  long long v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = self->_collectionIds;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDPublisher addCollectionId:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_numCollections;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v20 = self->_publisherDescriptions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        -[GEOPDPublisher addPublisherDescription:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_errorState;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDPublisher readAll:]((uint64_t)self, 1);
  -[GEOPDPublisher readAll:]((uint64_t)v4, 1);
  publisherId = self->_publisherId;
  if ((unint64_t)publisherId | *((void *)v4 + 7))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](publisherId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 5))
  {
    if (!-[GEOPDCaptionedPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_22;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[GEOLocalizedString isEqual:](name, "isEqual:")) {
      goto LABEL_22;
    }
  }
  collectionIds = self->_collectionIds;
  if ((unint64_t)collectionIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](collectionIds, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_numCollections != *((_DWORD *)v4 + 20)) {
      goto LABEL_22;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_22;
  }
  publisherDescriptions = self->_publisherDescriptions;
  if ((unint64_t)publisherDescriptions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](publisherDescriptions, "isEqual:"))
    {
LABEL_22:
      BOOL v12 = 0;
      goto LABEL_23;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v10 = *((_WORD *)v4 + 42);
  }
  BOOL v12 = (v10 & 1) == 0;
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_errorState != *((_DWORD *)v4 + 19)) {
      goto LABEL_22;
    }
    BOOL v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDPublisher readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_publisherId hash];
  unint64_t v4 = [(GEOPDCaptionedPhoto *)self->_photo hash];
  unint64_t v5 = [(GEOLocalizedString *)self->_name hash];
  uint64_t v6 = [(NSMutableArray *)self->_collectionIds hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_numCollections;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_publisherDescriptions hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v9 = 2654435761 * self->_errorState;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_publisherDescriptions, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end