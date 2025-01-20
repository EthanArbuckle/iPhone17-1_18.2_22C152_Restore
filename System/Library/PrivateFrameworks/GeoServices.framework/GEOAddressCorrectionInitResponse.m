@interface GEOAddressCorrectionInitResponse
+ (BOOL)isValid:(id)a3;
+ (Class)addressType;
- (BOOL)hasAddressID;
- (BOOL)hasAddressLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNumberOfVisitsBucketSize;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddressCorrectionInitResponse)init;
- (GEOAddressCorrectionInitResponse)initWithData:(id)a3;
- (GEOAddressCorrectionInitResponse)initWithDictionary:(id)a3;
- (GEOAddressCorrectionInitResponse)initWithJSON:(id)a3;
- (GEOLocation)addressLocation;
- (NSMutableArray)address;
- (NSString)addressID;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)addressCount;
- (unint64_t)hash;
- (unsigned)numberOfVisitsBucketSize;
- (void)_addNoFlagsAddress:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddress;
- (void)_readAddressID;
- (void)_readAddressLocation;
- (void)addAddress:(id)a3;
- (void)clearAddress;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddress:(id)a3;
- (void)setAddressID:(id)a3;
- (void)setAddressLocation:(id)a3;
- (void)setHasNumberOfVisitsBucketSize:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setNumberOfVisitsBucketSize:(unsigned int)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionInitResponse

- (GEOAddressCorrectionInitResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionInitResponse;
  v2 = [(GEOAddressCorrectionInitResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionInitResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionInitResponse;
  v3 = [(GEOAddressCorrectionInitResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)statusCode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatusCode
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAddressLocation
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
        GEOAddressCorrectionInitResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressLocation_tags_142);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressLocation
{
  return self->_addressLocation != 0;
}

- (GEOLocation)addressLocation
{
  -[GEOAddressCorrectionInitResponse _readAddressLocation]((uint64_t)self);
  addressLocation = self->_addressLocation;

  return addressLocation;
}

- (void)setAddressLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_addressLocation, a3);
}

- (void)_readAddressID
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
        GEOAddressCorrectionInitResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressID_tags_143);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressID
{
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionInitResponse _readAddressID]((uint64_t)self);
  addressID = self->_addressID;

  return addressID;
}

- (void)setAddressID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (unsigned)numberOfVisitsBucketSize
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_numberOfVisitsBucketSize;
  }
  else {
    return 10;
  }
}

- (void)setNumberOfVisitsBucketSize:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_numberOfVisitsBucketSize = a3;
}

- (void)setHasNumberOfVisitsBucketSize:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasNumberOfVisitsBucketSize
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAddress
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
        GEOAddressCorrectionInitResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)address
{
  -[GEOAddressCorrectionInitResponse _readAddress]((uint64_t)self);
  address = self->_address;

  return address;
}

- (void)setAddress:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  address = self->_address;
  self->_address = v4;
}

- (void)clearAddress
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  address = self->_address;

  [(NSMutableArray *)address removeAllObjects];
}

- (void)addAddress:(id)a3
{
  id v4 = a3;
  -[GEOAddressCorrectionInitResponse _readAddress]((uint64_t)self);
  -[GEOAddressCorrectionInitResponse _addNoFlagsAddress:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)addressCount
{
  -[GEOAddressCorrectionInitResponse _readAddress]((uint64_t)self);
  address = self->_address;

  return [(NSMutableArray *)address count];
}

- (id)addressAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionInitResponse _readAddress]((uint64_t)self);
  address = self->_address;

  return (id)[(NSMutableArray *)address objectAtIndex:a3];
}

+ (Class)addressType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionInitResponse;
  id v4 = [(GEOAddressCorrectionInitResponse *)&v8 description];
  id v5 = [(GEOAddressCorrectionInitResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionInitResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_42;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 60) & 2) != 0)
  {
    int v5 = *(_DWORD *)(a1 + 56);
    if (v5 <= 29)
    {
      objc_super v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          objc_super v6 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          objc_super v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          objc_super v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        objc_super v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        objc_super v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        objc_super v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v6 forKey:@"statusCode"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 56));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  id v7 = [(id)a1 addressLocation];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    v9 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v9 forKey:@"addressLocation"];
  }
  v10 = [(id)a1 addressID];
  if (v10) {
    [v4 setObject:v10 forKey:@"addressID"];
  }

  if (*(unsigned char *)(a1 + 60))
  {
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
    [v4 setObject:v11 forKey:@"numberOfVisitsBucketSize"];
  }
  if ([*(id *)(a1 + 32) count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (a2) {
            [v18 jsonRepresentation];
          }
          else {
          v19 = [v18 dictionaryRepresentation];
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKey:@"address"];
  }
LABEL_42:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddressCorrectionInitResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAddressCorrectionInitResponse)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionInitResponse *)-[GEOAddressCorrectionInitResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_51;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_51;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"statusCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v8 = 60;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_26:
    [a1 setStatusCode:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"addressLocation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOLocation alloc];
    if (a3) {
      uint64_t v11 = [(GEOLocation *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOLocation *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setAddressLocation:v11];
  }
  id v13 = [v5 objectForKeyedSubscript:@"addressID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = (void *)[v13 copy];
    [a1 setAddressID:v14];
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:@"numberOfVisitsBucketSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setNumberOfVisitsBucketSize:", objc_msgSend(v15, "unsignedIntValue"));
  }

  uint64_t v16 = [v5 objectForKeyedSubscript:@"address"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v23 = [GEOAddressCorrectionAddress alloc];
            if (a3) {
              uint64_t v24 = [(GEOAddressCorrectionAddress *)v23 initWithJSON:v22];
            }
            else {
              uint64_t v24 = [(GEOAddressCorrectionAddress *)v23 initWithDictionary:v22];
            }
            v25 = (void *)v24;
            [a1 addAddress:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }

    id v5 = v27;
  }

LABEL_51:
  return a1;
}

- (GEOAddressCorrectionInitResponse)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionInitResponse *)-[GEOAddressCorrectionInitResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_156;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_157;
    }
    GEOAddressCorrectionInitResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAddressCorrectionInitResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionInitResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionInitResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddressCorrectionInitResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddressCorrectionInitResponse *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_addressLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressID) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_address;
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

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOAddressCorrectionInitResponse _readAddress]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_address;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOAddressCorrectionInitResponse _readAddressLocation]((uint64_t)self);
  return [(GEOLocation *)self->_addressLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOAddressCorrectionInitResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 14) = self->_statusCode;
    *((unsigned char *)v8 + 60) |= 2u;
  }
  if (self->_addressLocation) {
    objc_msgSend(v8, "setAddressLocation:");
  }
  if (self->_addressID) {
    objc_msgSend(v8, "setAddressID:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 13) = self->_numberOfVisitsBucketSize;
    *((unsigned char *)v8 + 60) |= 1u;
  }
  if ([(GEOAddressCorrectionInitResponse *)self addressCount])
  {
    [v8 clearAddress];
    unint64_t v4 = [(GEOAddressCorrectionInitResponse *)self addressCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOAddressCorrectionInitResponse *)self addressAtIndex:i];
        [v8 addAddress:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAddressCorrectionInitResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddressCorrectionInitResponse *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_statusCode;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v9 = [(GEOLocation *)self->_addressLocation copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_addressID copyWithZone:a3];
  long long v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_numberOfVisitsBucketSize;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_address;
  uint64_t v13 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addAddress:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOAddressCorrectionInitResponse *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 14)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  addressLocation = self->_addressLocation;
  if ((unint64_t)addressLocation | *((void *)v4 + 3) && !-[GEOLocation isEqual:](addressLocation, "isEqual:")) {
    goto LABEL_18;
  }
  addressID = self->_addressID;
  if ((unint64_t)addressID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](addressID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_numberOfVisitsBucketSize != *((_DWORD *)v4 + 13)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_18;
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](address, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOAddressCorrectionInitResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOLocation *)self->_addressLocation hash];
  NSUInteger v5 = [(NSString *)self->_addressID hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_numberOfVisitsBucketSize;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_address hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
  addressLocation = self->_addressLocation;
  uint64_t v6 = *((void *)v4 + 3);
  if (addressLocation)
  {
    if (v6) {
      -[GEOLocation mergeFrom:](addressLocation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOAddressCorrectionInitResponse setAddressLocation:](self, "setAddressLocation:");
  }
  if (*((void *)v4 + 2)) {
    -[GEOAddressCorrectionInitResponse setAddressID:](self, "setAddressID:");
  }
  if (*((unsigned char *)v4 + 60))
  {
    self->_numberOfVisitsBucketSize = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOAddressCorrectionInitResponse addAddress:](self, "addAddress:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_addressLocation, 0);
  objc_storeStrong((id *)&self->_addressID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end