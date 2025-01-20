@interface GEOPDSearchACHintMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchACHintMetadata)init;
- (GEOPDSearchACHintMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)brooklynEntrys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsAddressEntry:(uint64_t)a1;
- (void)_addNoFlagsBrooklynEntry:(uint64_t)a1;
- (void)_addNoFlagsBusinessEntry:(uint64_t)a1;
- (void)_addNoFlagsFeature:(uint64_t)a1;
- (void)_readAddressEntrys;
- (void)_readBrooklynEntrys;
- (void)addAddressEntry:(uint64_t)a1;
- (void)addBrooklynEntry:(uint64_t)a1;
- (void)addBusinessEntry:(uint64_t)a1;
- (void)addFeature:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchACHintMetadata

- (GEOPDSearchACHintMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchACHintMetadata;
  v2 = [(GEOPDSearchACHintMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchACHintMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchACHintMetadata;
  v3 = [(GEOPDSearchACHintMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addFeature:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchACHintMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatures_tags_0);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchACHintMetadata _addNoFlagsFeature:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsFeature:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readBrooklynEntrys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchACHintMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrooklynEntrys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)brooklynEntrys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchACHintMetadata _readBrooklynEntrys]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addBrooklynEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchACHintMetadata _readBrooklynEntrys](a1);
    -[GEOPDSearchACHintMetadata _addNoFlagsBrooklynEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsBrooklynEntry:(uint64_t)a1
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

- (void)_readAddressEntrys
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchACHintMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressEntrys_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addAddressEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchACHintMetadata _readAddressEntrys](a1);
    -[GEOPDSearchACHintMetadata _addNoFlagsAddressEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsAddressEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addBusinessEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchACHintMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessEntrys_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchACHintMetadata _addNoFlagsBusinessEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsBusinessEntry:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchACHintMetadata;
  v4 = [(GEOPDSearchACHintMetadata *)&v8 description];
  id v5 = [(GEOPDSearchACHintMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchACHintMetadata _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchACHintMetadata readAll:]((uint64_t)a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[5] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v6 = a1[5];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v54 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v53 objects:v60 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"feature"];
    }
    if ([a1[3] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v14 = a1[3];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v50 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"brooklynEntry";
      }
      else {
        v21 = @"brooklyn_entry";
      }
      [v4 setObject:v13 forKey:v21];
    }
    if ([a1[2] count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v23 = a1[2];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v45 + 1) + 8 * k);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v58 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"addressEntry";
      }
      else {
        v30 = @"address_entry";
      }
      [v4 setObject:v22 forKey:v30];
    }
    if ([a1[4] count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v32 = a1[4];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v42;
        do
        {
          for (uint64_t m = 0; m != v34; ++m)
          {
            if (*(void *)v42 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v41 + 1) + 8 * m);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            v38 = objc_msgSend(v37, "dictionaryRepresentation", (void)v41);
            }
            objc_msgSend(v31, "addObject:", v38, (void)v41);
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v57 count:16];
        }
        while (v34);
      }

      if (a2) {
        v39 = @"businessEntry";
      }
      else {
        v39 = @"business_entry";
      }
      objc_msgSend(v4, "setObject:forKey:", v31, v39, (void)v41);
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
  return -[GEOPDSearchACHintMetadata _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_34;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_34;
      }
      GEOPDSearchACHintMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchACHintMetadataCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchACHintMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchACHintMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v22 = self->_reader;
    objc_sync_enter(v22);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v23 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v23];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchACHintMetadata readAll:]((uint64_t)self, 0);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = self->_features;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v10 = self->_brooklynEntrys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = self->_addressEntrys;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v18 = self->_businessEntrys;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t m = 0; m != v19; ++m)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v19);
    }
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDSearchACHintMetadata _readAddressEntrys](a1);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = *(id *)(a1 + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    uint64_t v7 = &OBJC_IVAR___GEOSpokenGuidance__priority;
    uint64_t v23 = *(void *)v30;
LABEL_4:
    uint64_t v8 = 0;
    uint64_t v24 = v5;
    while (1)
    {
      if (*(void *)v30 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
      if (v9)
      {
        -[GEOPDSearchAddressEntry _readCandidates](*(void *)(*((void *)&v29 + 1) + 8 * v8));
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = *(id *)(v9 + v7[465]);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if (v15 && ([*(id *)(v15 + 8) hasGreenTeaWithValue:a2] & 1) != 0)
              {

                goto LABEL_31;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        -[GEOPDSearchAddressEntry _readTopResult](v9);
        uint64_t v16 = *(void *)(v9 + 24);
        uint64_t v7 = &OBJC_IVAR___GEOSpokenGuidance__priority;
        if (v16)
        {
          if ([*(id *)(v16 + 8) hasGreenTeaWithValue:a2]) {
            goto LABEL_31;
          }
        }
      }
      ++v8;
      uint64_t v6 = v23;
      if (v8 == v24)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v5) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOPDSearchACHintMetadata _readBrooklynEntrys](a1);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(a1 + 24);
  uint64_t v17 = [v4 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
LABEL_23:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v26 != v19) {
        objc_enumerationMutation(v4);
      }
      if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v20), "hasGreenTeaWithValue:", a2, v23)) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v4 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v18) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
    }
LABEL_31:
    uint64_t v21 = 1;
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v21 = 0;
LABEL_32:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchACHintMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchACHintMetadata readAll:]((uint64_t)self, 0);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v8 = self->_features;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchACHintMetadata addFeature:]((uint64_t)v5, v12);
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v9);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v13 = self->_brooklynEntrys;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDSearchACHintMetadata addBrooklynEntry:]((uint64_t)v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v14);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v18 = self->_addressEntrys;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDSearchACHintMetadata addAddressEntry:]((uint64_t)v5, v22);
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v23 = self->_businessEntrys;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * m), "copyWithZone:", a3, (void)v29);
        -[GEOPDSearchACHintMetadata addBusinessEntry:]((uint64_t)v5, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v24);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchACHintMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchACHintMetadata readAll:]((uint64_t)v4, 1),
         features = self->_features,
         !((unint64_t)features | v4[5]))
     || -[NSMutableArray isEqual:](features, "isEqual:"))
    && ((brooklynEntrys = self->_brooklynEntrys, !((unint64_t)brooklynEntrys | v4[3]))
     || -[NSMutableArray isEqual:](brooklynEntrys, "isEqual:"))
    && ((addressEntrys = self->_addressEntrys, !((unint64_t)addressEntrys | v4[2]))
     || -[NSMutableArray isEqual:](addressEntrys, "isEqual:")))
  {
    businessEntrys = self->_businessEntrys;
    if ((unint64_t)businessEntrys | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](businessEntrys, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchACHintMetadata readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_features hash];
  uint64_t v4 = [(NSMutableArray *)self->_brooklynEntrys hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_addressEntrys hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_businessEntrys hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_businessEntrys, 0);
  objc_storeStrong((id *)&self->_brooklynEntrys, 0);
  objc_storeStrong((id *)&self->_addressEntrys, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end