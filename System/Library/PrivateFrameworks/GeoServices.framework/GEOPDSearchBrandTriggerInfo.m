@interface GEOPDSearchBrandTriggerInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchBrandTriggerInfo)init;
- (GEOPDSearchBrandTriggerInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsTrigger:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrandTriggerInfo

- (GEOPDSearchBrandTriggerInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBrandTriggerInfo;
  v2 = [(GEOPDSearchBrandTriggerInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBrandTriggerInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBrandTriggerInfo;
  v3 = [(GEOPDSearchBrandTriggerInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsTrigger:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandTriggerInfo;
  v4 = [(GEOPDSearchBrandTriggerInfo *)&v8 description];
  id v5 = [(GEOPDSearchBrandTriggerInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrandTriggerInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchBrandTriggerInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchBrandTriggerInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandKey_tags_124);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
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

    if ([*(id *)(a1 + 40) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v21);
            }
            objc_msgSend(v9, "addObject:", v15, (void)v21);
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }

      [v4 setObject:v9 forKey:@"trigger"];
    }
    char v16 = *(unsigned char *)(a1 + 60);
    if (v16)
    {
      v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v17 forKey:@"muid"];

      char v16 = *(unsigned char *)(a1 + 60);
    }
    if ((v16 & 2) != 0)
    {
      v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v19 = @"parentMuid";
      }
      else {
        v19 = @"parent_muid";
      }
      objc_msgSend(v4, "setObject:forKey:", v18, v19, (void)v21);
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
  return -[GEOPDSearchBrandTriggerInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_126;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_127;
      }
      GEOPDSearchBrandTriggerInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v11;
        while (1)
        {
          if (*(void *)v11 != v9) {
            objc_enumerationMutation(v7);
          }
          if (!--v8)
          {
            uint64_t v8 = [v7 countByEnumeratingWithState:&v10 objects:v14 count:16];
            if (!v8) {
              break;
            }
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandTriggerInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    long long v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchBrandTriggerInfo readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_triggers;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchBrandTriggerInfoReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBrandTriggerInfo readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_brandKey copyWithZone:a3];
  long long v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v20 = self;
  obj = self->_triggers;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    long long v13 = (os_unfair_lock_s *)(v5 + 56);
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        id v15 = (id)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, v20);
        os_unfair_lock_lock(v13);
        if ((*(unsigned char *)(v5 + 60) & 8) == 0)
        {
          long long v16 = *(void **)(v5 + 8);
          if (v16)
          {
            id v17 = v16;
            objc_sync_enter(v17);
            GEOPDSearchBrandTriggerInfoReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readTriggers_tags);
            objc_sync_exit(v17);
          }
        }
        os_unfair_lock_unlock(v13);
        -[GEOPDSearchBrandTriggerInfo _addNoFlagsTrigger:](v5, v15);

        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v5 + 60) |= 8u;
        os_unfair_lock_unlock(v13);
        *(unsigned char *)(v5 + 60) |= 0x10u;
      }
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  char flags = (char)v20->_flags;
  if (flags)
  {
    *(void *)(v5 + 24) = v20->_muid;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)v20->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = v20->_parentMuid;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDSearchBrandTriggerInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBrandTriggerInfo readAll:]((uint64_t)v4, 1);
  brandKey = self->_brandKey;
  if ((unint64_t)brandKey | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](brandKey, "isEqual:")) {
      goto LABEL_15;
    }
  }
  triggers = self->_triggers;
  if ((unint64_t)triggers | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](triggers, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_muid != *((void *)v4 + 3)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_parentMuid != *((void *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchBrandTriggerInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_brandKey hash];
  uint64_t v4 = [(NSMutableArray *)self->_triggers hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v5 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_parentMuid;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_brandKey, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end