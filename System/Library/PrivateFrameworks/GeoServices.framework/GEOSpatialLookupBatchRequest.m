@interface GEOSpatialLookupBatchRequest
+ (BOOL)isValid:(id)a3;
+ (Class)requestType;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceSku;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOSpatialLookupBatchRequest)init;
- (GEOSpatialLookupBatchRequest)initWithData:(id)a3;
- (GEOSpatialLookupBatchRequest)initWithDictionary:(id)a3;
- (GEOSpatialLookupBatchRequest)initWithJSON:(id)a3;
- (NSMutableArray)requests;
- (NSString)deviceCountryCode;
- (NSString)deviceSku;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)requestsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsRequest:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDeviceCountryCode;
- (void)_readDeviceSku;
- (void)_readRequests;
- (void)addRequest:(id)a3;
- (void)clearRequests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceSku:(id)a3;
- (void)setRequests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSpatialLookupBatchRequest

- (GEOSpatialLookupBatchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSpatialLookupBatchRequest;
  v2 = [(GEOSpatialLookupBatchRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpatialLookupBatchRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSpatialLookupBatchRequest;
  v3 = [(GEOSpatialLookupBatchRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequests
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequests_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)requests
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  requests = self->_requests;

  return requests;
}

- (void)setRequests:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  requests = self->_requests;
  self->_requests = v4;
}

- (void)clearRequests
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  requests = self->_requests;

  [(NSMutableArray *)requests removeAllObjects];
}

- (void)addRequest:(id)a3
{
  id v4 = a3;
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  -[GEOSpatialLookupBatchRequest _addNoFlagsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRequest:(uint64_t)a1
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

- (unint64_t)requestsCount
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  requests = self->_requests;

  return [(NSMutableArray *)requests count];
}

- (id)requestAtIndex:(unint64_t)a3
{
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  requests = self->_requests;

  return (id)[(NSMutableArray *)requests objectAtIndex:a3];
}

+ (Class)requestType
{
  return (Class)objc_opt_class();
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOSpatialLookupBatchRequest _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDeviceSku
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupBatchRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSku_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDeviceSku
{
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOSpatialLookupBatchRequest _readDeviceSku]((uint64_t)self);
  deviceSku = self->_deviceSku;

  return deviceSku;
}

- (void)setDeviceSku:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSpatialLookupBatchRequest;
  id v4 = [(GEOSpatialLookupBatchRequest *)&v8 description];
  id v5 = [(GEOSpatialLookupBatchRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpatialLookupBatchRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[4] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = a1[4];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v18);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"request"];
    }
    v13 = objc_msgSend(a1, "deviceCountryCode", (void)v18);
    if (v13)
    {
      if (a2) {
        v14 = @"deviceCountryCode";
      }
      else {
        v14 = @"device_country_code";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [a1 deviceSku];
    if (v15)
    {
      if (a2) {
        v16 = @"deviceSku";
      }
      else {
        v16 = @"device_sku";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEOSpatialLookupBatchRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEOSpatialLookupBatchRequest)initWithDictionary:(id)a3
{
  return (GEOSpatialLookupBatchRequest *)-[GEOSpatialLookupBatchRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"request"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v23 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOSpatialLookupRequest alloc];
                if (a3) {
                  uint64_t v14 = [(GEOSpatialLookupRequest *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOSpatialLookupRequest *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addRequest:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v9);
        }

        id v6 = v23;
      }

      if (a3) {
        v16 = @"deviceCountryCode";
      }
      else {
        v16 = @"device_country_code";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = (void *)[v17 copy];
        [a1 setDeviceCountryCode:v18];
      }
      if (a3) {
        long long v19 = @"deviceSku";
      }
      else {
        long long v19 = @"device_sku";
      }
      long long v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = (void *)[v20 copy];
        [a1 setDeviceSku:v21];
      }
    }
  }

  return a1;
}

- (GEOSpatialLookupBatchRequest)initWithJSON:(id)a3
{
  return (GEOSpatialLookupBatchRequest *)-[GEOSpatialLookupBatchRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_41;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_41;
    }
    GEOSpatialLookupBatchRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_requests;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "readAll:", 1, (void)v13);
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_30;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        goto LABEL_30;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        if (v16 != 2) {
          goto LABEL_31;
        }
LABEL_28:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_29;
      }
      if (v18 != 1) {
        goto LABEL_28;
      }
      if (v16 != 2 || !PBReaderPlaceMark() || !GEOSpatialLookupRequestIsValid((char *)a3))
      {
LABEL_31:
        PBReaderRecallMark();
        return 0;
      }
      PBReaderRecallMark();
LABEL_29:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_30;
      }
    }
    if (v16 != 2) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_30:
  BOOL v19 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v19;
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpatialLookupBatchRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    unint64_t v10 = self->_reader;
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
    [(GEOSpatialLookupBatchRequest *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_requests;
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

    if (self->_deviceCountryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceSku) {
      PBDataWriterWriteStringField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOSpatialLookupBatchRequest _readRequests]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_requests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1021;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unsigned int v9 = (id *)a3;
  [(GEOSpatialLookupBatchRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOSpatialLookupBatchRequest *)self requestsCount])
  {
    [v9 clearRequests];
    unint64_t v4 = [(GEOSpatialLookupBatchRequest *)self requestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSpatialLookupBatchRequest *)self requestAtIndex:i];
        [v9 addRequest:v7];
      }
    }
  }
  if (self->_deviceCountryCode) {
    objc_msgSend(v9, "setDeviceCountryCode:");
  }
  uint64_t v8 = v9;
  if (self->_deviceSku)
  {
    objc_msgSend(v9, "setDeviceSku:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSpatialLookupBatchRequestReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSpatialLookupBatchRequest *)self readAll:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_requests;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [v5 addRequest:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_deviceCountryCode copyWithZone:a3];
  long long v14 = (void *)v5[2];
  v5[2] = v13;

  uint64_t v15 = [(NSString *)self->_deviceSku copyWithZone:a3];
  int v16 = (void *)v5[3];
  v5[3] = v15;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSpatialLookupBatchRequest *)self readAll:1],
         [v4 readAll:1],
         requests = self->_requests,
         !((unint64_t)requests | v4[4]))
     || -[NSMutableArray isEqual:](requests, "isEqual:"))
    && ((deviceCountryCode = self->_deviceCountryCode, !((unint64_t)deviceCountryCode | v4[2]))
     || -[NSString isEqual:](deviceCountryCode, "isEqual:")))
  {
    deviceSku = self->_deviceSku;
    if ((unint64_t)deviceSku | v4[3]) {
      char v8 = -[NSString isEqual:](deviceSku, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOSpatialLookupBatchRequest *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_requests hash];
  NSUInteger v4 = [(NSString *)self->_deviceCountryCode hash] ^ v3;
  return v4 ^ [(NSString *)self->_deviceSku hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[4];
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
        -[GEOSpatialLookupBatchRequest addRequest:](self, "addRequest:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[GEOSpatialLookupBatchRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  }
  if (v4[3]) {
    -[GEOSpatialLookupBatchRequest setDeviceSku:](self, "setDeviceSku:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end