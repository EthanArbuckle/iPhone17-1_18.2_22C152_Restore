@interface GEOPDSearchChainInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchChainInfo)init;
- (GEOPDSearchChainInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchChainInfo

- (GEOPDSearchChainInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchChainInfo;
  v2 = [(GEOPDSearchChainInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchChainInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchChainInfo;
  v3 = [(GEOPDSearchChainInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchChainInfo;
  [(GEOPDSearchChainInfo *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchChainInfo;
  v4 = [(GEOPDSearchChainInfo *)&v8 description];
  v5 = [(GEOPDSearchChainInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchChainInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    [v4 setObject:v5 forKey:@"muid"];

    if (*(void *)(a1 + 24))
    {
      objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v7 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v8 = 0;
        do
        {
          uint64_t v9 = *(unsigned int *)(*v7 + 4 * v8);
          if ((v9 - 1) >= 9)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = off_1E53E25D0[(int)v9 - 1];
          }
          [v6 addObject:v10];

          ++v8;
          objc_super v7 = (void *)(a1 + 16);
        }
        while (v8 < *(void *)(a1 + 24));
      }
      if (a2) {
        v11 = @"relationshipType";
      }
      else {
        v11 = @"relationship_type";
      }
      [v4 setObject:v6 forKey:v11];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandDisplayName_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v14 = *(id *)(a1 + 48);
    if (v14)
    {
      if (a2) {
        v15 = @"brandDisplayName";
      }
      else {
        v15 = @"brand_display_name";
      }
      [v4 setObject:v14 forKey:v15];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandDensity_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"brandDensity";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"brand_density";
      }
      [v4 setObject:v20 forKey:v21];
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
  return -[GEOPDSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

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
        objc_super v6 = (int *)&readAll__recursiveTag_515;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_516;
      }
      GEOPDSearchChainInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = [a1 init];
  if (v5)
  {
    v30 = v4;
    objc_super v6 = [v4 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 unsignedLongLongValue];
      *(unsigned char *)(v5 + 76) |= 8u;
      *(void *)(v5 + 56) = v7;
    }

    if (a3) {
      unint64_t v8 = @"relationshipType";
    }
    else {
      unint64_t v8 = @"relationship_type";
    }
    v28 = [v30 objectForKeyedSubscript:v8];
    objc_opt_class();
    uint64_t v9 = v28;
    if (objc_opt_isKindOfClass())
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = v28;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v11) {
        goto LABEL_33;
      }
      uint64_t v12 = *(void *)v32;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if (([v15 isEqualToString:@"DIFFERENT_FROM"] & 1) == 0
              && ([v15 isEqualToString:@"PARENT_OF"] & 1) == 0
              && ([v15 isEqualToString:@"CHILD_OF"] & 1) == 0
              && ([v15 isEqualToString:@"VARIANT_OF"] & 1) == 0
              && ([v15 isEqualToString:@"BEFORE"] & 1) == 0
              && ([v15 isEqualToString:@"AFTER"] & 1) == 0
              && ([v15 isEqualToString:@"ABSTRACT_OF"] & 1) == 0
              && ([v15 isEqualToString:@"SPECIFIC_OF"] & 1) == 0)
            {
              [v15 isEqualToString:@"PARTNERSHIP_WITH"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v14 intValue];
          }
          os_unfair_lock_lock((os_unfair_lock_t)(v5 + 72));
          if ((*(unsigned char *)(v5 + 76) & 1) == 0)
          {
            v16 = *(void **)(v5 + 8);
            if (v16)
            {
              id v17 = v16;
              objc_sync_enter(v17);
              GEOPDSearchChainInfoReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readRelationshipTypes_tags);
              objc_sync_exit(v17);
            }
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 76) |= 1u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          *(unsigned char *)(v5 + 76) |= 8u;
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (!v11)
        {
LABEL_33:

          uint64_t v9 = v28;
          break;
        }
      }
    }

    if (a3) {
      id v18 = @"brandDisplayName";
    }
    else {
      id v18 = @"brand_display_name";
    }
    v19 = [v30 objectForKeyedSubscript:v18];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[v19 copy];
      id v21 = v20;
      *(unsigned char *)(v5 + 76) |= 4u;
      *(unsigned char *)(v5 + 76) |= 8u;
      objc_storeStrong((id *)(v5 + 48), v20);
    }
    if (a3) {
      v22 = @"brandDensity";
    }
    else {
      v22 = @"brand_density";
    }
    v23 = [v30 objectForKeyedSubscript:v22];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [GEOPDSearchBrandDensity alloc];
      if (v24) {
        v25 = (void *)-[GEOPDSearchBrandDensity _initWithDictionary:isJSON:](v24, v23);
      }
      else {
        v25 = 0;
      }
      id v26 = v25;
      *(unsigned char *)(v5 + 76) |= 2u;
      *(unsigned char *)(v5 + 76) |= 8u;
      objc_storeStrong((id *)(v5 + 40), v25);
    }
    id v4 = v30;
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchChainInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0xF) == 0)
    {
      uint64_t v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      unint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 0);
  PBDataWriterWriteUint64Field();
  if (self->_relationshipTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_relationshipTypes.count);
  }
  if (self->_brandDisplayName) {
    PBDataWriterWriteStringField();
  }
  objc_super v6 = v9;
  if (self->_brandDensity)
  {
    PBDataWriterWriteSubmessage();
LABEL_11:
    objc_super v6 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 0);
    v5[7] = self->_muid;
    PBRepeatedInt32Copy();
    uint64_t v8 = [(NSString *)self->_brandDisplayName copyWithZone:a3];
    id v9 = (void *)v5[6];
    v5[6] = v8;

    id v10 = [(GEOPDSearchBrandDensity *)self->_brandDensity copyWithZone:a3];
    uint64_t v7 = (PBDataReader *)v5[5];
    v5[5] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchChainInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDSearchChainInfo readAll:]((uint64_t)self, 1),
        -[GEOPDSearchChainInfo readAll:]((uint64_t)v4, 1),
        self->_muid == v4[7])
    && PBRepeatedInt32IsEqual()
    && ((brandDisplayName = self->_brandDisplayName, !((unint64_t)brandDisplayName | v4[6]))
     || -[NSString isEqual:](brandDisplayName, "isEqual:")))
  {
    brandDensity = self->_brandDensity;
    if ((unint64_t)brandDensity | v4[5]) {
      char v7 = -[GEOPDSearchBrandDensity isEqual:](brandDensity, "isEqual:");
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
  -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 1);
  unint64_t v3 = 2654435761u * self->_muid;
  uint64_t v4 = PBRepeatedInt32Hash();
  NSUInteger v5 = v4 ^ [(NSString *)self->_brandDisplayName hash];
  return v5 ^ [(GEOPDSearchBrandDensity *)self->_brandDensity hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandDisplayName, 0);
  objc_storeStrong((id *)&self->_brandDensity, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end