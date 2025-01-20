@interface GEOWiFiHarvestLabel
+ (BOOL)isValid:(id)a3;
- (BOOL)hasComment;
- (BOOL)hasInternalIdentifier;
- (BOOL)hasNetworkType;
- (BOOL)hasOriginator;
- (BOOL)hasVenueCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiHarvestLabel)init;
- (GEOWiFiHarvestLabel)initWithData:(id)a3;
- (GEOWiFiHarvestLabel)initWithDictionary:(id)a3;
- (GEOWiFiHarvestLabel)initWithJSON:(id)a3;
- (NSString)comment;
- (NSString)internalIdentifier;
- (NSString)venueCategory;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)networkTypeAsString:(int)a3;
- (id)originatorAsString:(int)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)StringAsOriginator:(id)a3;
- (int)networkType;
- (int)originator;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readComment;
- (void)_readInternalIdentifier;
- (void)_readVenueCategory;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComment:(id)a3;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasOriginator:(BOOL)a3;
- (void)setInternalIdentifier:(id)a3;
- (void)setNetworkType:(int)a3;
- (void)setOriginator:(int)a3;
- (void)setVenueCategory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiHarvestLabel

- (GEOWiFiHarvestLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiHarvestLabel;
  v2 = [(GEOWiFiHarvestLabel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiHarvestLabel)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiHarvestLabel;
  v3 = [(GEOWiFiHarvestLabel *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)originator
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_originator;
  }
  else {
    return 0;
  }
}

- (void)setOriginator:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_originator = a3;
}

- (void)setHasOriginator:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginator
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)originatorAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA070[a3];
  }

  return v3;
}

- (int)StringAsOriginator:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LABEL_ORIGINATOR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SETTINGS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readVenueCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasVenueCategory
{
  return self->_venueCategory != 0;
}

- (NSString)venueCategory
{
  -[GEOWiFiHarvestLabel _readVenueCategory]((uint64_t)self);
  venueCategory = self->_venueCategory;

  return venueCategory;
}

- (void)setVenueCategory:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_venueCategory, a3);
}

- (void)_readComment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComment_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (NSString)comment
{
  -[GEOWiFiHarvestLabel _readComment]((uint64_t)self);
  comment = self->_comment;

  return comment;
}

- (void)setComment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_comment, a3);
}

- (int)networkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasNetworkType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EA088[a3];
  }

  return v3;
}

- (int)StringAsNetworkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readInternalIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInternalIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasInternalIdentifier
{
  return self->_internalIdentifier != 0;
}

- (NSString)internalIdentifier
{
  -[GEOWiFiHarvestLabel _readInternalIdentifier]((uint64_t)self);
  internalIdentifier = self->_internalIdentifier;

  return internalIdentifier;
}

- (void)setInternalIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_internalIdentifier, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiHarvestLabel;
  int v4 = [(GEOWiFiHarvestLabel *)&v8 description];
  v5 = [(GEOWiFiHarvestLabel *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      uint64_t v3 = *(int *)(a1 + 56);
      if (v3 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v4 = off_1E53EA070[v3];
      }
      [v2 setObject:v4 forKey:@"originator"];
    }
    v5 = [(id)a1 venueCategory];
    if (v5) {
      [v2 setObject:v5 forKey:@"venueCategory"];
    }

    objc_super v6 = [(id)a1 comment];
    if (v6) {
      [v2 setObject:v6 forKey:@"comment"];
    }

    if (*(unsigned char *)(a1 + 60))
    {
      uint64_t v7 = *(int *)(a1 + 52);
      if (v7 >= 0x11)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53EA088[v7];
      }
      [v2 setObject:v8 forKey:@"networkType"];
    }
    v9 = [(id)a1 internalIdentifier];
    if (v9) {
      [v2 setObject:v9 forKey:@"internalIdentifier"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOWiFiHarvestLabel)initWithDictionary:(id)a3
{
  return (GEOWiFiHarvestLabel *)-[GEOWiFiHarvestLabel _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_62;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_62;
  }
  int v4 = [v3 objectForKeyedSubscript:@"originator"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"UNKNOWN_LABEL_ORIGINATOR"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"APP"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"SETTINGS"])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    uint64_t v6 = [v4 intValue];
  }
  [a1 setOriginator:v6];
LABEL_15:

  uint64_t v7 = [v3 objectForKeyedSubscript:@"venueCategory"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setVenueCategory:v8];
  }
  v9 = [v3 objectForKeyedSubscript:@"comment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)[v9 copy];
    [a1 setComment:v10];
  }
  v11 = [v3 objectForKeyedSubscript:@"networkType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
    {
      uint64_t v13 = 7;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
    {
      uint64_t v13 = 8;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
    {
      uint64_t v13 = 9;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
    {
      uint64_t v13 = 10;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
    {
      uint64_t v13 = 11;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
    {
      uint64_t v13 = 12;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
    {
      uint64_t v13 = 13;
    }
    else if ([v12 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
    {
      uint64_t v13 = 14;
    }
    else if ([v12 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
    {
      uint64_t v13 = 15;
    }
    else if ([v12 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
    {
      uint64_t v13 = 16;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_58:
    [a1 setNetworkType:v13];
  }

  v14 = [v3 objectForKeyedSubscript:@"internalIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setInternalIdentifier:v15];
  }
LABEL_62:

  return a1;
}

- (GEOWiFiHarvestLabel)initWithJSON:(id)a3
{
  return (GEOWiFiHarvestLabel *)-[GEOWiFiHarvestLabel _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_994_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_995_0;
    }
    GEOWiFiHarvestLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiHarvestLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiHarvestLabelReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiHarvestLabel *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_venueCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_comment) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_internalIdentifier) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOWiFiHarvestLabel *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_originator;
    *((unsigned char *)v5 + 60) |= 2u;
  }
  if (self->_venueCategory)
  {
    objc_msgSend(v5, "setVenueCategory:");
    int v4 = v5;
  }
  if (self->_comment)
  {
    objc_msgSend(v5, "setComment:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_networkType;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_internalIdentifier)
  {
    objc_msgSend(v5, "setInternalIdentifier:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiHarvestLabelReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiHarvestLabel *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_originator;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_venueCategory copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_comment copyWithZone:a3];
  id v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_networkType;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_internalIdentifier copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOWiFiHarvestLabel *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_originator != *((_DWORD *)v4 + 14)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  venueCategory = self->_venueCategory;
  if ((unint64_t)venueCategory | *((void *)v4 + 4)
    && !-[NSString isEqual:](venueCategory, "isEqual:"))
  {
    goto LABEL_18;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](comment, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_networkType != *((_DWORD *)v4 + 13)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_18;
  }
  internalIdentifier = self->_internalIdentifier;
  if ((unint64_t)internalIdentifier | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](internalIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOWiFiHarvestLabel *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_originator;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_venueCategory hash];
  NSUInteger v5 = [(NSString *)self->_comment hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_networkType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_internalIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if ((v5[15] & 2) != 0)
  {
    self->_originator = v5[14];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v5 + 4))
  {
    -[GEOWiFiHarvestLabel setVenueCategory:](self, "setVenueCategory:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[GEOWiFiHarvestLabel setComment:](self, "setComment:");
    NSUInteger v4 = v5;
  }
  if (v4[15])
  {
    self->_networkType = v4[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOWiFiHarvestLabel setInternalIdentifier:](self, "setInternalIdentifier:");
    NSUInteger v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueCategory, 0);
  objc_storeStrong((id *)&self->_internalIdentifier, 0);
  objc_storeStrong((id *)&self->_comment, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end