@interface GEOPBCompanionSubscription
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDataType;
- (BOOL)hasDisplayName;
- (BOOL)hasDownloadedDataBytes;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasOriginatingBundleIdentifier;
- (BOOL)hasPolicy;
- (BOOL)hasRegion;
- (BOOL)hasSyncToWatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)syncToWatch;
- (GEOMapRegion)region;
- (GEOPBCompanionSubscription)init;
- (GEOPBCompanionSubscription)initWithData:(id)a3;
- (GEOPBCompanionSubscription)initWithDictionary:(id)a3;
- (GEOPBCompanionSubscription)initWithJSON:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)originatingBundleIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)dataType;
- (unint64_t)downloadedDataBytes;
- (unint64_t)hash;
- (unsigned)policy;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayName;
- (void)_readIdentifier;
- (void)_readOriginatingBundleIdentifier;
- (void)_readRegion;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDataType:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setDownloadedDataBytes:(unint64_t)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasDownloadedDataBytes:(BOOL)a3;
- (void)setHasPolicy:(BOOL)a3;
- (void)setHasSyncToWatch:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginatingBundleIdentifier:(id)a3;
- (void)setPolicy:(unsigned int)a3;
- (void)setRegion:(id)a3;
- (void)setSyncToWatch:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBCompanionSubscription

- (GEOPBCompanionSubscription)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBCompanionSubscription;
  v2 = [(GEOPBCompanionSubscription *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBCompanionSubscription)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBCompanionSubscription;
  v3 = [(GEOPBCompanionSubscription *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPBCompanionSubscription _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (GEOMapRegion)region
{
  -[GEOPBCompanionSubscription _readRegion]((uint64_t)self);
  region = self->_region;

  return region;
}

- (void)setRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_region, a3);
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDataType
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)policy
{
  return self->_policy;
}

- (void)setPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_policy = a3;
}

- (void)setHasPolicy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPolicy
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readOriginatingBundleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginatingBundleIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOriginatingBundleIdentifier
{
  return self->_originatingBundleIdentifier != 0;
}

- (NSString)originatingBundleIdentifier
{
  -[GEOPBCompanionSubscription _readOriginatingBundleIdentifier]((uint64_t)self);
  originatingBundleIdentifier = self->_originatingBundleIdentifier;

  return originatingBundleIdentifier;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, a3);
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (NSString)displayName
{
  -[GEOPBCompanionSubscription _readDisplayName]((uint64_t)self);
  displayName = self->_displayName;

  return displayName;
}

- (void)setDisplayName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)syncToWatch
{
  return self->_syncToWatch;
}

- (void)setSyncToWatch:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_syncToWatch = a3;
}

- (void)setHasSyncToWatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSyncToWatch
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)downloadedDataBytes
{
  return self->_downloadedDataBytes;
}

- (void)setDownloadedDataBytes:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_downloadedDataBytes = a3;
}

- (void)setHasDownloadedDataBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDownloadedDataBytes
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBCompanionSubscription;
  v4 = [(GEOPBCompanionSubscription *)&v8 description];
  v5 = [(GEOPBCompanionSubscription *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBCompanionSubscription _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    objc_super v6 = [(id)a1 region];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"region"];
    }
    __int16 v9 = *(_WORD *)(a1 + 92);
    if (v9)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v11 = @"dataType";
      }
      else {
        v11 = @"data_type";
      }
      [v4 setObject:v10 forKey:v11];

      __int16 v9 = *(_WORD *)(a1 + 92);
    }
    if ((v9 & 4) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      [v4 setObject:v12 forKey:@"policy"];
    }
    v13 = [(id)a1 originatingBundleIdentifier];
    if (v13)
    {
      if (a2) {
        v14 = @"originatingBundleIdentifier";
      }
      else {
        v14 = @"originating_bundle_identifier";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [(id)a1 displayName];
    if (v15)
    {
      if (a2) {
        v16 = @"displayName";
      }
      else {
        v16 = @"display_name";
      }
      [v4 setObject:v15 forKey:v16];
    }

    __int16 v17 = *(_WORD *)(a1 + 92);
    if ((v17 & 8) != 0)
    {
      v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
      if (a2) {
        v19 = @"syncToWatch";
      }
      else {
        v19 = @"sync_to_watch";
      }
      [v4 setObject:v18 forKey:v19];

      __int16 v17 = *(_WORD *)(a1 + 92);
    }
    if ((v17 & 2) != 0)
    {
      v20 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v21 = @"downloadedDataBytes";
      }
      else {
        v21 = @"downloaded_data_bytes";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __56__GEOPBCompanionSubscription__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEOPBCompanionSubscription _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPBCompanionSubscription__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    __int16 v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBCompanionSubscription)initWithDictionary:(id)a3
{
  return (GEOPBCompanionSubscription *)-[GEOPBCompanionSubscription _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"region"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v9 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v10 = [(GEOMapRegion *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOMapRegion *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setRegion:v10];
      }
      if (a3) {
        v12 = @"dataType";
      }
      else {
        v12 = @"data_type";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDataType:", objc_msgSend(v13, "unsignedLongLongValue"));
      }

      v14 = [v5 objectForKeyedSubscript:@"policy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPolicy:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        v15 = @"originatingBundleIdentifier";
      }
      else {
        v15 = @"originating_bundle_identifier";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v17 = (void *)[v16 copy];
        [a1 setOriginatingBundleIdentifier:v17];
      }
      if (a3) {
        v18 = @"displayName";
      }
      else {
        v18 = @"display_name";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setDisplayName:v20];
      }
      if (a3) {
        v21 = @"syncToWatch";
      }
      else {
        v21 = @"sync_to_watch";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSyncToWatch:", objc_msgSend(v22, "BOOLValue"));
      }

      if (a3) {
        v23 = @"downloadedDataBytes";
      }
      else {
        v23 = @"downloaded_data_bytes";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDownloadedDataBytes:", objc_msgSend(v24, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOPBCompanionSubscription)initWithJSON:(id)a3
{
  return (GEOPBCompanionSubscription *)-[GEOPBCompanionSubscription _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_24;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_24;
    }
    GEOPBCompanionSubscriptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOMapRegion *)self->_region readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBCompanionSubscriptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBCompanionSubscriptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3E0) == 0))
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    __int16 v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBCompanionSubscription *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    id v5 = v10;
    if (self->_region)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v10;
    }
    if (self->_originatingBundleIdentifier)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_displayName)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    __int16 v7 = (__int16)self->_flags;
    if ((v7 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
      __int16 v7 = (__int16)self->_flags;
    }
    if ((v7 & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBCompanionSubscription _readRegion]((uint64_t)self);
  region = self->_region;

  return [(GEOMapRegion *)region hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  __int16 v7 = (id *)a3;
  [(GEOPBCompanionSubscription *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 18) = self->_readerMarkPos;
  *((_DWORD *)v7 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v7, "setIdentifier:");
  }
  if (self->_region) {
    objc_msgSend(v7, "setRegion:");
  }
  __int16 flags = (__int16)self->_flags;
  id v5 = v7;
  if (flags)
  {
    v7[3] = self->_dataType;
    *((_WORD *)v7 + 46) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v7 + 21) = self->_policy;
    *((_WORD *)v7 + 46) |= 4u;
  }
  if (self->_originatingBundleIdentifier)
  {
    objc_msgSend(v7, "setOriginatingBundleIdentifier:");
    id v5 = v7;
  }
  if (self->_displayName)
  {
    objc_msgSend(v7, "setDisplayName:");
    id v5 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v5 + 88) = self->_syncToWatch;
    *((_WORD *)v5 + 46) |= 8u;
    __int16 v6 = (__int16)self->_flags;
  }
  if ((v6 & 2) != 0)
  {
    v5[5] = self->_downloadedDataBytes;
    *((_WORD *)v5 + 46) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    __int16 v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBCompanionSubscriptionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBCompanionSubscription *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOMapRegion *)self->_region copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 24) = self->_dataType;
    *(_WORD *)(v5 + 92) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_policy;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_originatingBundleIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(NSString *)self->_displayName copyWithZone:a3];
  __int16 v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  __int16 v18 = (__int16)self->_flags;
  if ((v18 & 8) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_syncToWatch;
    *(_WORD *)(v5 + 92) |= 8u;
    __int16 v18 = (__int16)self->_flags;
  }
  if ((v18 & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_downloadedDataBytes;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  [(GEOPBCompanionSubscription *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_32;
    }
  }
  region = self->_region;
  if ((unint64_t)region | *((void *)v4 + 8))
  {
    if (!-[GEOMapRegion isEqual:](region, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 46);
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_dataType != *((void *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if (v8)
  {
    goto LABEL_32;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_policy != *((_DWORD *)v4 + 21)) {
      goto LABEL_32;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_32;
  }
  originatingBundleIdentifier = self->_originatingBundleIdentifier;
  if ((unint64_t)originatingBundleIdentifier | *((void *)v4 + 7)
    && !-[NSString isEqual:](originatingBundleIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 46);
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) != 0)
    {
      if (self->_syncToWatch)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_28;
      }
    }
LABEL_32:
    BOOL v13 = 0;
    goto LABEL_33;
  }
  if ((v12 & 8) != 0) {
    goto LABEL_32;
  }
LABEL_28:
  BOOL v13 = (v12 & 2) == 0;
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_downloadedDataBytes != *((void *)v4 + 5)) {
      goto LABEL_32;
    }
    BOOL v13 = 1;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPBCompanionSubscription *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(GEOMapRegion *)self->_region hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    unint64_t v6 = 2654435761u * self->_dataType;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((flags & 4) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_policy;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  NSUInteger v8 = [(NSString *)self->_originatingBundleIdentifier hash];
  NSUInteger v9 = [(NSString *)self->_displayName hash];
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_syncToWatch;
    if ((v10 & 2) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((v10 & 2) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v12 = 2654435761u * self->_downloadedDataBytes;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[6])
  {
    -[GEOPBCompanionSubscription setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v9;
  }
  region = self->_region;
  uint64_t v6 = v4[8];
  if (region)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPBCompanionSubscription setRegion:](self, "setRegion:");
  }
  unint64_t v4 = v9;
LABEL_9:
  __int16 v7 = *((_WORD *)v4 + 46);
  if (v7)
  {
    self->_dataType = v4[3];
    *(_WORD *)&self->_flags |= 1u;
    __int16 v7 = *((_WORD *)v4 + 46);
  }
  if ((v7 & 4) != 0)
  {
    self->_policy = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (v4[7])
  {
    -[GEOPBCompanionSubscription setOriginatingBundleIdentifier:](self, "setOriginatingBundleIdentifier:");
    unint64_t v4 = v9;
  }
  if (v4[4])
  {
    -[GEOPBCompanionSubscription setDisplayName:](self, "setDisplayName:");
    unint64_t v4 = v9;
  }
  __int16 v8 = *((_WORD *)v4 + 46);
  if ((v8 & 8) != 0)
  {
    self->_syncToWatch = *((unsigned char *)v4 + 88);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v8 = *((_WORD *)v4 + 46);
  }
  if ((v8 & 2) != 0)
  {
    self->_downloadedDataBytes = v4[5];
    *(_WORD *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBCompanionSubscriptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x210u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBCompanionSubscription *)self readAll:0];
    region = self->_region;
    [(GEOMapRegion *)region clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end