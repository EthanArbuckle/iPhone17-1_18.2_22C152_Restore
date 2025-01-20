@interface GEOAttributionApp
+ (BOOL)isValid:(id)a3;
+ (Class)handledSchemesType;
- (BOOL)hasRestaurantReservationExtensionSupport;
- (BOOL)hasSupportsRestaurantQueueing;
- (BOOL)hasSupportsRestaurantReservations;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsRestaurantQueueing;
- (BOOL)supportsRestaurantReservations;
- (GEOAttributionApp)init;
- (GEOAttributionApp)initWithData:(id)a3;
- (GEOAttributionApp)initWithDictionary:(id)a3;
- (GEOAttributionApp)initWithJSON:(id)a3;
- (NSMutableArray)handledSchemes;
- (NSString)appBundleIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)handledSchemesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)restaurantReservationExtensionSupportAsString:(int)a3;
- (int)StringAsRestaurantReservationExtensionSupport:(id)a3;
- (int)restaurantReservationExtensionSupport;
- (unint64_t)handledSchemesCount;
- (unint64_t)hash;
- (void)_addNoFlagsHandledSchemes:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readHandledSchemes;
- (void)addHandledSchemes:(id)a3;
- (void)clearHandledSchemes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setHandledSchemes:(id)a3;
- (void)setHasRestaurantReservationExtensionSupport:(BOOL)a3;
- (void)setHasSupportsRestaurantQueueing:(BOOL)a3;
- (void)setHasSupportsRestaurantReservations:(BOOL)a3;
- (void)setRestaurantReservationExtensionSupport:(int)a3;
- (void)setSupportsRestaurantQueueing:(BOOL)a3;
- (void)setSupportsRestaurantReservations:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAttributionApp

- (void)_addNoFlagsHandledSchemes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOAttributionApp)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAttributionApp;
  v2 = [(GEOAttributionApp *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSMutableArray)handledSchemes
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  handledSchemes = self->_handledSchemes;

  return handledSchemes;
}

- (void)_readHandledSchemes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionAppReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHandledSchemes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEOAttributionApp)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAttributionApp;
  id v3 = [(GEOAttributionApp *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (NSString)appBundleIdentifier
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readAppBundleIdentifier_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  appBundleIdentifier = self->_appBundleIdentifier;

  return appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (void)setHandledSchemes:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  handledSchemes = self->_handledSchemes;
  self->_handledSchemes = v4;
}

- (void)clearHandledSchemes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  handledSchemes = self->_handledSchemes;

  [(NSMutableArray *)handledSchemes removeAllObjects];
}

- (void)addHandledSchemes:(id)a3
{
  id v4 = a3;
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  -[GEOAttributionApp _addNoFlagsHandledSchemes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (unint64_t)handledSchemesCount
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  handledSchemes = self->_handledSchemes;

  return [(NSMutableArray *)handledSchemes count];
}

- (id)handledSchemesAtIndex:(unint64_t)a3
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  handledSchemes = self->_handledSchemes;

  return (id)[(NSMutableArray *)handledSchemes objectAtIndex:a3];
}

+ (Class)handledSchemesType
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsRestaurantReservations
{
  return self->_supportsRestaurantReservations;
}

- (void)setSupportsRestaurantReservations:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_supportsRestaurantReservations = a3;
}

- (void)setHasSupportsRestaurantReservations:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSupportsRestaurantReservations
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)supportsRestaurantQueueing
{
  return self->_supportsRestaurantQueueing;
}

- (void)setSupportsRestaurantQueueing:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_supportsRestaurantQueueing = a3;
}

- (void)setHasSupportsRestaurantQueueing:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsRestaurantQueueing
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)restaurantReservationExtensionSupport
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_restaurantReservationExtensionSupport;
  }
  else {
    return 1;
  }
}

- (void)setRestaurantReservationExtensionSupport:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_restaurantReservationExtensionSupport = a3;
}

- (void)setHasRestaurantReservationExtensionSupport:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasRestaurantReservationExtensionSupport
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)restaurantReservationExtensionSupportAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E8040[a3 - 1];
  }

  return v3;
}

- (int)StringAsRestaurantReservationExtensionSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EXTENSION_SUPPORT_ALLOW_APP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTENSION_SUPPORT_OFFER_APP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EXTENSION_SUPPORT_BLACKLIST_APP"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAttributionApp;
  int v4 = [(GEOAttributionApp *)&v8 description];
  id v5 = [(GEOAttributionApp *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAttributionApp _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 appBundleIdentifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"appBundleIdentifier"];
  }

  if (*(void *)(a1 + 32))
  {
    objc_super v6 = [(id)a1 handledSchemes];
    [v4 setObject:v6 forKey:@"handledSchemes"];
  }
  char v7 = *(unsigned char *)(a1 + 60);
  if ((v7 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
    [v4 setObject:v8 forKey:@"supportsRestaurantReservations"];

    char v7 = *(unsigned char *)(a1 + 60);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)(a1 + 60) & 2) == 0)
  {
    goto LABEL_8;
  }
  v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [v4 setObject:v9 forKey:@"supportsRestaurantQueueing"];

  if ((*(unsigned char *)(a1 + 60) & 1) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  unsigned int v10 = *(_DWORD *)(a1 + 52) - 1;
  if (v10 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E53E8040[v10];
  }
  [v4 setObject:v11 forKey:@"restaurantReservationExtensionSupport"];

LABEL_16:
  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    v13 = [v12 dictionaryRepresentation];
    v14 = v13;
    if (a2)
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __47__GEOAttributionApp__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v16 = v15;
      id v20 = v16;
      [v14 enumerateKeysAndObjectsUsingBlock:v19];
      id v17 = v16;

      v14 = v17;
    }
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAttributionApp _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAttributionApp__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
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

- (GEOAttributionApp)initWithDictionary:(id)a3
{
  return (GEOAttributionApp *)-[GEOAttributionApp _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"appBundleIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setAppBundleIdentifier:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"handledSchemes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = objc_msgSend(v12, "copy", (void)v20);
                [a1 addHandledSchemes:v13];
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
        }
      }
      v14 = [v3 objectForKeyedSubscript:@"supportsRestaurantReservations"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsRestaurantReservations:", objc_msgSend(v14, "BOOLValue"));
      }

      v15 = [v3 objectForKeyedSubscript:@"supportsRestaurantQueueing"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsRestaurantQueueing:", objc_msgSend(v15, "BOOLValue"));
      }

      id v16 = [v3 objectForKeyedSubscript:@"restaurantReservationExtensionSupport"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if ([v17 isEqualToString:@"EXTENSION_SUPPORT_ALLOW_APP"])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:@"EXTENSION_SUPPORT_OFFER_APP"])
        {
          uint64_t v18 = 2;
        }
        else if ([v17 isEqualToString:@"EXTENSION_SUPPORT_BLACKLIST_APP"])
        {
          uint64_t v18 = 3;
        }
        else
        {
          uint64_t v18 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_32:

          goto LABEL_33;
        }
        uint64_t v18 = [v16 intValue];
      }
      objc_msgSend(a1, "setRestaurantReservationExtensionSupport:", v18, (void)v20);
      goto LABEL_32;
    }
  }
LABEL_33:

  return a1;
}

- (GEOAttributionApp)initWithJSON:(id)a3
{
  return (GEOAttributionApp *)-[GEOAttributionApp _initWithDictionary:isJSON:](self, a3);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_55;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_55;
    }
    GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAttributionAppIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAttributionAppReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAttributionApp *)self readAll:0];
    PBDataWriterWriteStringField();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_handledSchemes;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOAttributionApp *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v9 setAppBundleIdentifier:self->_appBundleIdentifier];
  if ([(GEOAttributionApp *)self handledSchemesCount])
  {
    [v9 clearHandledSchemes];
    unint64_t v4 = [(GEOAttributionApp *)self handledSchemesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOAttributionApp *)self handledSchemesAtIndex:i];
        [v9 addHandledSchemes:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v9 + 57) = self->_supportsRestaurantReservations;
    *((unsigned char *)v9 + 60) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v9 + 56) = self->_supportsRestaurantQueueing;
  *((unsigned char *)v9 + 60) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((_DWORD *)v9 + 13) = self->_restaurantReservationExtensionSupport;
    *((unsigned char *)v9 + 60) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAttributionApp *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
    uint64_t v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = self->_handledSchemes;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
          [(id)v5 addHandledSchemes:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(unsigned char *)(v5 + 57) = self->_supportsRestaurantReservations;
      *(unsigned char *)(v5 + 60) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 1) == 0)
        {
LABEL_16:
          id v17 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v17;
          goto LABEL_17;
        }
LABEL_15:
        *(_DWORD *)(v5 + 52) = self->_restaurantReservationExtensionSupport;
        *(unsigned char *)(v5 + 60) |= 1u;
        goto LABEL_16;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(unsigned char *)(v5 + 56) = self->_supportsRestaurantQueueing;
    *(unsigned char *)(v5 + 60) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAttributionAppReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOAttributionApp *)self readAll:1];
  [v4 readAll:1];
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_26;
    }
  }
  handledSchemes = self->_handledSchemes;
  if ((unint64_t)handledSchemes | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](handledSchemes, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_26;
    }
    if (self->_supportsRestaurantReservations)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_supportsRestaurantQueueing)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_22;
      }
    }
LABEL_26:
    BOOL v7 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_restaurantReservationExtensionSupport != *((_DWORD *)v4 + 13)) {
      goto LABEL_26;
    }
    BOOL v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAttributionApp *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_appBundleIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_handledSchemes hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_supportsRestaurantReservations;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_supportsRestaurantQueueing;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_restaurantReservationExtensionSupport;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOAttributionApp setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOAttributionApp addHandledSchemes:](self, "addHandledSchemes:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 60);
  if ((v10 & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    self->_supportsRestaurantQueueing = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_flags |= 2u;
    if ((*((unsigned char *)v4 + 60) & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_supportsRestaurantReservations = *((unsigned char *)v4 + 57);
  *(unsigned char *)&self->_flags |= 4u;
  char v10 = *((unsigned char *)v4 + 60);
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (v10)
  {
LABEL_13:
    self->_restaurantReservationExtensionSupport = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_14:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_12);
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
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAttributionApp *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledSchemes, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end