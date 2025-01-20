@interface GEOPDSearchBrandCountInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchBrandCountInfo)init;
- (GEOPDSearchBrandCountInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBrandRelationship:(uint64_t)a1;
- (void)_addNoFlagsCountryOccurrence:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrandCountInfo

- (GEOPDSearchBrandCountInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBrandCountInfo;
  v2 = [(GEOPDSearchBrandCountInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBrandCountInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBrandCountInfo;
  v3 = [(GEOPDSearchBrandCountInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsCountryOccurrence:(uint64_t)a1
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

- (void)_addNoFlagsBrandRelationship:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandCountInfo;
  v4 = [(GEOPDSearchBrandCountInfo *)&v8 description];
  id v5 = [(GEOPDSearchBrandCountInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrandCountInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchBrandCountInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchBrandCountInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandKey_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v7 = *(id *)(a1 + 16);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"brandKey";
      }
      else {
        objc_super v8 = @"brand_key";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchBrandCountInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLegacyBrandName_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        v12 = @"legacyBrandName";
      }
      else {
        v12 = @"legacy_brand_name";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if ((*(unsigned char *)(a1 + 84) & 4) != 0)
    {
      v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      [v4 setObject:v13 forKey:@"total"];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v14 addObject:v20];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"countryOccurrence";
      }
      else {
        v21 = @"country_occurrence";
      }
      [v4 setObject:v14 forKey:v21];
    }
    char v22 = *(unsigned char *)(a1 + 84);
    if (v22)
    {
      v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      [v4 setObject:v23 forKey:@"muid"];

      char v22 = *(unsigned char *)(a1 + 84);
    }
    if ((v22 & 2) != 0)
    {
      v24 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v25 = @"parentMuid";
      }
      else {
        v25 = @"parent_muid";
      }
      [v4 setObject:v24 forKey:v25];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v27 = *(id *)(a1 + 24);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = objc_msgSend(v31, "dictionaryRepresentation", (void)v35);
            }
            objc_msgSend(v26, "addObject:", v32, (void)v35);
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v28);
      }

      if (a2) {
        v33 = @"brandRelationship";
      }
      else {
        v33 = @"brand_relationship";
      }
      objc_msgSend(v4, "setObject:forKey:", v26, v33, (void)v35);
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
  return -[GEOPDSearchBrandCountInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_76;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_76;
      }
      GEOPDSearchBrandCountInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v18;
        while (1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          if (!--v8)
          {
            uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (!v8) {
              break;
            }
          }
        }
      }

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v10 = *(id *)(a1 + 24);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v14;
        while (1)
        {
          if (*(void *)v14 != v12) {
            objc_enumerationMutation(v10);
          }
          if (!--v11)
          {
            uint64_t v11 = [v10 countByEnumeratingWithState:&v13 objects:v21 count:16];
            if (!v11) {
              break;
            }
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandCountInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    long long v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 0);
    if (self->_brandKey) {
      PBDataWriterWriteStringField();
    }
    if (self->_legacyBrandName) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint64Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_countryOccurrences;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_brandRelationships;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    uint64_t v9 = reader;
    objc_sync_enter(v9);
    if ((*(unsigned char *)&v8->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOPDSearchBrandCountInfoReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      id v10 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v9);

      goto LABEL_33;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 0);
  uint64_t v11 = [(NSString *)self->_brandKey copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_legacyBrandName copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(void *)(v5 + 64) = self->_total;
    *(unsigned char *)(v5 + 84) |= 4u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v32 = self;
  obuint64_t j = self->_countryOccurrences;
  uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v40;
    long long v17 = (os_unfair_lock_s *)(v5 + 80);
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = (id)objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "copyWithZone:", a3, v32);
        os_unfair_lock_lock(v17);
        if ((*(unsigned char *)(v5 + 84) & 0x20) == 0)
        {
          long long v20 = *(void **)(v5 + 8);
          if (v20)
          {
            id v21 = v20;
            objc_sync_enter(v21);
            GEOPDSearchBrandCountInfoReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readCountryOccurrences_tags);
            objc_sync_exit(v21);
          }
        }
        os_unfair_lock_unlock(v17);
        -[GEOPDSearchBrandCountInfo _addNoFlagsCountryOccurrence:](v5, v19);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 84) |= 0x20u;
        os_unfair_lock_unlock(v17);
        *(unsigned char *)(v5 + 84) |= 0x80u;
      }
      uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }

  char flags = (char)v32->_flags;
  if (flags)
  {
    *(void *)(v5 + 48) = v32->_muid;
    *(unsigned char *)(v5 + 84) |= 1u;
    char flags = (char)v32->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 56) = v32->_parentMuid;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v32->_brandRelationships;
  id obja = (id)[(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (obja)
  {
    uint64_t v23 = *(void *)v36;
    long long v24 = (os_unfair_lock_s *)(v5 + 80);
    do
    {
      for (uint64_t j = 0; j != obja; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v10);
        }
        v26 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * (void)j) copyWithZone:a3];
        uint64_t v27 = v26;
        if (v5)
        {
          id v28 = v26;
          os_unfair_lock_lock(v24);
          if ((*(unsigned char *)(v5 + 84) & 0x10) == 0)
          {
            uint64_t v29 = *(void **)(v5 + 8);
            if (v29)
            {
              id v30 = v29;
              objc_sync_enter(v30);
              GEOPDSearchBrandCountInfoReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readBrandRelationships_tags);
              objc_sync_exit(v30);
            }
          }
          os_unfair_lock_unlock(v24);
          -[GEOPDSearchBrandCountInfo _addNoFlagsBrandRelationship:](v5, v28);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 84) |= 0x10u;
          os_unfair_lock_unlock(v24);
          *(unsigned char *)(v5 + 84) |= 0x80u;
        }
      }
      id obja = (id)[(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (obja);
  }
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)v4, 1);
  brandKey = self->_brandKey;
  if ((unint64_t)brandKey | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](brandKey, "isEqual:")) {
      goto LABEL_26;
    }
  }
  legacyBrandName = self->_legacyBrandName;
  if ((unint64_t)legacyBrandName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](legacyBrandName, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 84);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_total != *((void *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_26;
  }
  countryOccurrences = self->_countryOccurrences;
  if ((unint64_t)countryOccurrences | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](countryOccurrences, "isEqual:"))
    {
LABEL_26:
      char v11 = 0;
      goto LABEL_27;
    }
    char flags = (char)self->_flags;
    char v8 = *((unsigned char *)v4 + 84);
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_muid != *((void *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if (v8)
  {
    goto LABEL_26;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_parentMuid != *((void *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_26;
  }
  brandRelationships = self->_brandRelationships;
  if ((unint64_t)brandRelationships | *((void *)v4 + 3)) {
    char v11 = -[NSMutableArray isEqual:](brandRelationships, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_brandKey hash];
  NSUInteger v4 = [(NSString *)self->_legacyBrandName hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    unint64_t v5 = 2654435761u * self->_total;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_countryOccurrences hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v7 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_brandRelationships hash];
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_parentMuid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_brandRelationships hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyBrandName, 0);
  objc_storeStrong((id *)&self->_countryOccurrences, 0);
  objc_storeStrong((id *)&self->_brandRelationships, 0);
  objc_storeStrong((id *)&self->_brandKey, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end