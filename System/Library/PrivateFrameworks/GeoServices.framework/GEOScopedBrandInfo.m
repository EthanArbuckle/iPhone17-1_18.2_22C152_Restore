@interface GEOScopedBrandInfo
+ (BOOL)isValid:(id)a3;
+ (Class)localizedNameType;
- (BOOL)hasIsoCountryCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOScopedBrandInfo)init;
- (GEOScopedBrandInfo)initWithData:(id)a3;
- (GEOScopedBrandInfo)initWithDictionary:(id)a3;
- (GEOScopedBrandInfo)initWithJSON:(id)a3;
- (NSMutableArray)localizedNames;
- (NSString)isoCountryCode;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedNameAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)localizedNamesCount;
- (void)_addNoFlagsLocalizedName:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIsoCountryCode;
- (void)_readLocalizedNames;
- (void)addLocalizedName:(id)a3;
- (void)clearLocalizedNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocalizedNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOScopedBrandInfo

- (GEOScopedBrandInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOScopedBrandInfo;
  v2 = [(GEOScopedBrandInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOScopedBrandInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOScopedBrandInfo;
  v3 = [(GEOScopedBrandInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIsoCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOScopedBrandInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIsoCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (NSString)isoCountryCode
{
  -[GEOScopedBrandInfo _readIsoCountryCode]((uint64_t)self);
  isoCountryCode = self->_isoCountryCode;

  return isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (void)_readLocalizedNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOScopedBrandInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)localizedNames
{
  -[GEOScopedBrandInfo _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return localizedNames;
}

- (void)setLocalizedNames:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  localizedNames = self->_localizedNames;
  self->_localizedNames = v4;
}

- (void)clearLocalizedNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  localizedNames = self->_localizedNames;

  [(NSMutableArray *)localizedNames removeAllObjects];
}

- (void)addLocalizedName:(id)a3
{
  id v4 = a3;
  -[GEOScopedBrandInfo _readLocalizedNames]((uint64_t)self);
  -[GEOScopedBrandInfo _addNoFlagsLocalizedName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsLocalizedName:(uint64_t)a1
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

- (unint64_t)localizedNamesCount
{
  -[GEOScopedBrandInfo _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return [(NSMutableArray *)localizedNames count];
}

- (id)localizedNameAtIndex:(unint64_t)a3
{
  -[GEOScopedBrandInfo _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return (id)[(NSMutableArray *)localizedNames objectAtIndex:a3];
}

+ (Class)localizedNameType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOScopedBrandInfo;
  id v4 = [(GEOScopedBrandInfo *)&v8 description];
  id v5 = [(GEOScopedBrandInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOScopedBrandInfo _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 isoCountryCode];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"isoCountryCode";
      }
      else {
        objc_super v6 = @"iso_country_code";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([a1[3] count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = a1[3];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"localizedName";
      }
      else {
        v15 = @"localized_name";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v17);
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
  return -[GEOScopedBrandInfo _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOScopedBrandInfo)initWithDictionary:(id)a3
{
  return (GEOScopedBrandInfo *)-[GEOScopedBrandInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"isoCountryCode";
      }
      else {
        objc_super v6 = @"iso_country_code";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setIsoCountryCode:v8];
      }
      if (a3) {
        uint64_t v9 = @"localizedName";
      }
      else {
        uint64_t v9 = @"localized_name";
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v18 = [(GEOLocalizedString *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOLocalizedString *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addLocalizedName:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        uint64_t v10 = v21;
      }
    }
  }

  return a1;
}

- (GEOScopedBrandInfo)initWithJSON:(id)a3
{
  return (GEOScopedBrandInfo *)-[GEOScopedBrandInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_154;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_155;
    }
    GEOScopedBrandInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOScopedBrandInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOScopedBrandInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOScopedBrandInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOScopedBrandInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOScopedBrandInfo *)self readAll:0];
    if (self->_isoCountryCode) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_localizedNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOScopedBrandInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_isoCountryCode) {
    objc_msgSend(v8, "setIsoCountryCode:");
  }
  if ([(GEOScopedBrandInfo *)self localizedNamesCount])
  {
    [v8 clearLocalizedNames];
    unint64_t v4 = [(GEOScopedBrandInfo *)self localizedNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOScopedBrandInfo *)self localizedNameAtIndex:i];
        [v8 addLocalizedName:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOScopedBrandInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOScopedBrandInfo *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_localizedNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addLocalizedName:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOScopedBrandInfo *)self readAll:1],
         [v4 readAll:1],
         isoCountryCode = self->_isoCountryCode,
         !((unint64_t)isoCountryCode | v4[2]))
     || -[NSString isEqual:](isoCountryCode, "isEqual:")))
  {
    localizedNames = self->_localizedNames;
    if ((unint64_t)localizedNames | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](localizedNames, "isEqual:");
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
  [(GEOScopedBrandInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_isoCountryCode hash];
  return [(NSMutableArray *)self->_localizedNames hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOScopedBrandInfo setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOScopedBrandInfo addLocalizedName:](self, "addLocalizedName:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end