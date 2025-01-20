@interface GEOClientNetworkMetrics
+ (BOOL)isValid:(id)a3;
+ (Class)transactionMetricsType;
- (BOOL)hasHttpResponseCode;
- (BOOL)hasRedirectCount;
- (BOOL)hasRequestDataSize;
- (BOOL)hasRequestEnd;
- (BOOL)hasRequestStart;
- (BOOL)hasResponseDataSize;
- (BOOL)hasRnfTriggered;
- (BOOL)hasServiceIpAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)rnfTriggered;
- (GEOClientNetworkMetrics)init;
- (GEOClientNetworkMetrics)initWithData:(id)a3;
- (GEOClientNetworkMetrics)initWithDictionary:(id)a3;
- (GEOClientNetworkMetrics)initWithJSON:(id)a3;
- (NSMutableArray)transactionMetrics;
- (NSString)serviceIpAddress;
- (PBUnknownFields)unknownFields;
- (double)requestEnd;
- (double)requestStart;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transactionMetricsAtIndex:(unint64_t)a3;
- (int)httpResponseCode;
- (int)redirectCount;
- (int)requestDataSize;
- (int)responseDataSize;
- (unint64_t)hash;
- (unint64_t)transactionMetricsCount;
- (void)_addNoFlagsTransactionMetrics:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readServiceIpAddress;
- (void)_readTransactionMetrics;
- (void)addTransactionMetrics:(id)a3;
- (void)clearTransactionMetrics;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasHttpResponseCode:(BOOL)a3;
- (void)setHasRedirectCount:(BOOL)a3;
- (void)setHasRequestDataSize:(BOOL)a3;
- (void)setHasRequestEnd:(BOOL)a3;
- (void)setHasRequestStart:(BOOL)a3;
- (void)setHasResponseDataSize:(BOOL)a3;
- (void)setHasRnfTriggered:(BOOL)a3;
- (void)setHttpResponseCode:(int)a3;
- (void)setRedirectCount:(int)a3;
- (void)setRequestDataSize:(int)a3;
- (void)setRequestEnd:(double)a3;
- (void)setRequestStart:(double)a3;
- (void)setResponseDataSize:(int)a3;
- (void)setRnfTriggered:(BOOL)a3;
- (void)setServiceIpAddress:(id)a3;
- (void)setTransactionMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientNetworkMetrics

- (void)setRequestStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_requestStart = a3;
}

- (void)setServiceIpAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_serviceIpAddress, a3);
}

- (void)setRequestEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_requestEnd = a3;
}

- (void)setRedirectCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_redirectCount = a3;
}

- (GEOClientNetworkMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOClientNetworkMetrics;
  v2 = [(GEOClientNetworkMetrics *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addTransactionMetrics:(id)a3
{
  id v4 = a3;
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  -[GEOClientNetworkMetrics _addNoFlagsTransactionMetrics:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_readTransactionMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientNetworkMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionMetrics_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_addNoFlagsTransactionMetrics:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setHttpResponseCode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_httpResponseCode = a3;
}

- (NSMutableArray)transactionMetrics
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  transactionMetrics = self->_transactionMetrics;

  return transactionMetrics;
}

- (void)setRnfTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  self->_rnfTriggered = a3;
}

- (void)setResponseDataSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_responseDataSize = a3;
}

- (void)setRequestDataSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_requestDataSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionMetrics, 0);
  objc_storeStrong((id *)&self->_serviceIpAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOClientNetworkMetrics *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_serviceIpAddress) {
    PBDataWriterWriteStringField();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0) {
      goto LABEL_12;
    }
LABEL_26:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_26;
  }
LABEL_12:
  if ((flags & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_transactionMetrics;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_29:
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
      uint64_t v8 = (int *)&readAll__recursiveTag_369;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_370;
    }
    GEOClientNetworkMetricsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOClientNetworkMetricsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOClientNetworkMetrics)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOClientNetworkMetrics;
  BOOL v3 = [(GEOClientNetworkMetrics *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (int)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHttpResponseCode
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readServiceIpAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientNetworkMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceIpAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasServiceIpAddress
{
  return self->_serviceIpAddress != 0;
}

- (NSString)serviceIpAddress
{
  -[GEOClientNetworkMetrics _readServiceIpAddress]((uint64_t)self);
  serviceIpAddress = self->_serviceIpAddress;

  return serviceIpAddress;
}

- (int)requestDataSize
{
  return self->_requestDataSize;
}

- (void)setHasRequestDataSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1040;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasRequestDataSize
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)responseDataSize
{
  return self->_responseDataSize;
}

- (void)setHasResponseDataSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1056;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasResponseDataSize
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)rnfTriggered
{
  return self->_rnfTriggered;
}

- (void)setHasRnfTriggered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1088;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRnfTriggered
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setHasRequestStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasRequestEnd
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)redirectCount
{
  return self->_redirectCount;
}

- (void)setHasRedirectCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRedirectCount
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)setTransactionMetrics:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  transactionMetrics = self->_transactionMetrics;
  self->_transactionMetrics = v4;
}

- (void)clearTransactionMetrics
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  transactionMetrics = self->_transactionMetrics;

  [(NSMutableArray *)transactionMetrics removeAllObjects];
}

- (unint64_t)transactionMetricsCount
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  transactionMetrics = self->_transactionMetrics;

  return [(NSMutableArray *)transactionMetrics count];
}

- (id)transactionMetricsAtIndex:(unint64_t)a3
{
  -[GEOClientNetworkMetrics _readTransactionMetrics]((uint64_t)self);
  transactionMetrics = self->_transactionMetrics;

  return (id)[(NSMutableArray *)transactionMetrics objectAtIndex:a3];
}

+ (Class)transactionMetricsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientNetworkMetrics;
  id v4 = [(GEOClientNetworkMetrics *)&v8 description];
  id v5 = [(GEOClientNetworkMetrics *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientNetworkMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_41;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 88) & 4) != 0)
  {
    id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
    if (a2) {
      objc_super v6 = @"httpResponseCode";
    }
    else {
      objc_super v6 = @"http_response_code";
    }
    [v4 setObject:v5 forKey:v6];
  }
  objc_super v7 = [(id)a1 serviceIpAddress];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"serviceIpAddress";
    }
    else {
      objc_super v8 = @"service_ip_address";
    }
    [v4 setObject:v7 forKey:v8];
  }

  __int16 v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 0x10) != 0)
  {
    v28 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 76)];
    if (a2) {
      v29 = @"requestDataSize";
    }
    else {
      v29 = @"request_data_size";
    }
    [v4 setObject:v28 forKey:v29];

    __int16 v9 = *(_WORD *)(a1 + 88);
    if ((v9 & 0x20) == 0)
    {
LABEL_14:
      if ((v9 & 0x40) == 0) {
        goto LABEL_15;
      }
      goto LABEL_52;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_14;
  }
  v30 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  if (a2) {
    v31 = @"responseDataSize";
  }
  else {
    v31 = @"response_data_size";
  }
  [v4 setObject:v30 forKey:v31];

  __int16 v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 0x40) == 0)
  {
LABEL_15:
    if ((v9 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_56;
  }
LABEL_52:
  v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 84)];
  if (a2) {
    v33 = @"rnfTriggered";
  }
  else {
    v33 = @"rnf_triggered";
  }
  [v4 setObject:v32 forKey:v33];

  __int16 v9 = *(_WORD *)(a1 + 88);
  if ((v9 & 2) == 0)
  {
LABEL_16:
    if ((v9 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_60:
    v36 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v37 = @"requestEnd";
    }
    else {
      v37 = @"request_end";
    }
    [v4 setObject:v36 forKey:v37];

    if ((*(_WORD *)(a1 + 88) & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
LABEL_56:
  v34 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v35 = @"requestStart";
  }
  else {
    v35 = @"request_start";
  }
  [v4 setObject:v34 forKey:v35];

  __int16 v9 = *(_WORD *)(a1 + 88);
  if (v9) {
    goto LABEL_60;
  }
LABEL_17:
  if ((v9 & 8) != 0)
  {
LABEL_18:
    v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    if (a2) {
      v11 = @"redirectCount";
    }
    else {
      v11 = @"redirect_count";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_22:
  if ([*(id *)(a1 + 48) count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (a2) {
            [v18 jsonRepresentation];
          }
          else {
          v19 = [v18 dictionaryRepresentation];
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    if (a2) {
      v20 = @"transactionMetrics";
    }
    else {
      v20 = @"transaction_metrics";
    }
    [v4 setObject:v12 forKey:v20];
  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    v22 = [v21 dictionaryRepresentation];
    v23 = v22;
    if (a2)
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __53__GEOClientNetworkMetrics__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E53D8860;
      id v25 = v24;
      id v39 = v25;
      [v23 enumerateKeysAndObjectsUsingBlock:v38];
      id v26 = v25;

      v23 = v26;
    }
    [v4 setObject:v23 forKey:@"Unknown Fields"];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientNetworkMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOClientNetworkMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOClientNetworkMetrics)initWithDictionary:(id)a3
{
  return (GEOClientNetworkMetrics *)-[GEOClientNetworkMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"httpResponseCode";
      }
      else {
        objc_super v6 = @"http_response_code";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"serviceIpAddress";
      }
      else {
        objc_super v8 = @"service_ip_address";
      }
      __int16 v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setServiceIpAddress:v10];
      }
      if (a3) {
        v11 = @"requestDataSize";
      }
      else {
        v11 = @"request_data_size";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRequestDataSize:", objc_msgSend(v12, "intValue"));
      }

      if (a3) {
        id v13 = @"responseDataSize";
      }
      else {
        id v13 = @"response_data_size";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResponseDataSize:", objc_msgSend(v14, "intValue"));
      }

      if (a3) {
        uint64_t v15 = @"rnfTriggered";
      }
      else {
        uint64_t v15 = @"rnf_triggered";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRnfTriggered:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"requestStart";
      }
      else {
        v17 = @"request_start";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setRequestStart:");
      }

      if (a3) {
        v19 = @"requestEnd";
      }
      else {
        v19 = @"request_end";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v20 doubleValue];
        objc_msgSend(a1, "setRequestEnd:");
      }

      if (a3) {
        v21 = @"redirectCount";
      }
      else {
        v21 = @"redirect_count";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRedirectCount:", objc_msgSend(v22, "intValue"));
      }

      if (a3) {
        v23 = @"transactionMetrics";
      }
      else {
        v23 = @"transaction_metrics";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v35 = v24;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v31 = [GEOClientNetworkTransactionMetrics alloc];
                if (a3) {
                  uint64_t v32 = [(GEOClientNetworkTransactionMetrics *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEOClientNetworkTransactionMetrics *)v31 initWithDictionary:v30];
                }
                v33 = (void *)v32;
                [a1 addTransactionMetrics:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v27);
        }

        v24 = v35;
      }
    }
  }

  return a1;
}

- (GEOClientNetworkMetrics)initWithJSON:(id)a3
{
  return (GEOClientNetworkMetrics *)-[GEOClientNetworkMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientNetworkMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientNetworkMetricsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOClientNetworkMetrics *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 14) = self->_readerMarkPos;
  *((_DWORD *)v10 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v10 + 17) = self->_httpResponseCode;
    *((_WORD *)v10 + 44) |= 4u;
  }
  if (self->_serviceIpAddress)
  {
    objc_msgSend(v10, "setServiceIpAddress:");
    id v4 = v10;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_requestDataSize;
    *((_WORD *)v4 + 44) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 20) = self->_responseDataSize;
  *((_WORD *)v4 + 44) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 84) = self->_rnfTriggered;
  *((_WORD *)v4 + 44) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0) {
      goto LABEL_10;
    }
LABEL_23:
    v4[3] = *(id *)&self->_requestEnd;
    *((_WORD *)v4 + 44) |= 1u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_22:
  v4[4] = *(id *)&self->_requestStart;
  *((_WORD *)v4 + 44) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_23;
  }
LABEL_10:
  if ((flags & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 18) = self->_redirectCount;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_12:
  if ([(GEOClientNetworkMetrics *)self transactionMetricsCount])
  {
    [v10 clearTransactionMetrics];
    unint64_t v6 = [(GEOClientNetworkMetrics *)self transactionMetricsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        __int16 v9 = [(GEOClientNetworkMetrics *)self transactionMetricsAtIndex:i];
        [v10 addTransactionMetrics:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOClientNetworkMetricsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOClientNetworkMetrics *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_httpResponseCode;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_serviceIpAddress copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_requestDataSize;
    *(_WORD *)(v5 + 88) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 80) = self->_responseDataSize;
  *(_WORD *)(v5 + 88) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 84) = self->_rnfTriggered;
  *(_WORD *)(v5 + 88) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0) {
      goto LABEL_12;
    }
LABEL_27:
    *(double *)(v5 + 24) = self->_requestEnd;
    *(_WORD *)(v5 + 88) |= 1u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  *(double *)(v5 + 32) = self->_requestStart;
  *(_WORD *)(v5 + 88) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_27;
  }
LABEL_12:
  if ((flags & 8) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 72) = self->_redirectCount;
    *(_WORD *)(v5 + 88) |= 8u;
  }
LABEL_14:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_transactionMetrics;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addTransactionMetrics:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  [(GEOClientNetworkMetrics *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 17)) {
      goto LABEL_45;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_45;
  }
  serviceIpAddress = self->_serviceIpAddress;
  if ((unint64_t)serviceIpAddress | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](serviceIpAddress, "isEqual:")) {
      goto LABEL_45;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_requestDataSize != *((_DWORD *)v4 + 19)) {
      goto LABEL_45;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_responseDataSize != *((_DWORD *)v4 + 20)) {
      goto LABEL_45;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_45;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_rnfTriggered)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_45;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_28;
      }
    }
LABEL_45:
    char v9 = 0;
    goto LABEL_46;
  }
  if ((v6 & 0x40) != 0) {
    goto LABEL_45;
  }
LABEL_28:
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestStart != *((double *)v4 + 4)) {
      goto LABEL_45;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_45;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_requestEnd != *((double *)v4 + 3)) {
      goto LABEL_45;
    }
  }
  else if (v6)
  {
    goto LABEL_45;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_redirectCount != *((_DWORD *)v4 + 18)) {
      goto LABEL_45;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_45;
  }
  transactionMetrics = self->_transactionMetrics;
  if ((unint64_t)transactionMetrics | *((void *)v4 + 6)) {
    char v9 = -[NSMutableArray isEqual:](transactionMetrics, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_46:

  return v9;
}

- (unint64_t)hash
{
  [(GEOClientNetworkMetrics *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_httpResponseCode;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_serviceIpAddress hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_requestDataSize;
    if ((flags & 0x20) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_responseDataSize;
      if ((flags & 0x40) != 0) {
        goto LABEL_7;
      }
LABEL_14:
      uint64_t v8 = 0;
      if ((flags & 2) != 0) {
        goto LABEL_8;
      }
LABEL_15:
      unint64_t v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((flags & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_rnfTriggered;
  if ((flags & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  double requestStart = self->_requestStart;
  double v10 = -requestStart;
  if (requestStart >= 0.0) {
    double v10 = self->_requestStart;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_18:
  if (flags)
  {
    double requestEnd = self->_requestEnd;
    double v16 = -requestEnd;
    if (requestEnd >= 0.0) {
      double v16 = self->_requestEnd;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_redirectCount;
  }
  else {
    uint64_t v19 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v19 ^ [(NSMutableArray *)self->_transactionMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 44) & 4) != 0)
  {
    self->_httpResponseCode = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 5)) {
    -[GEOClientNetworkMetrics setServiceIpAddress:](self, "setServiceIpAddress:");
  }
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_requestDataSize = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_responseDataSize = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_rnfTriggered = *((unsigned char *)v4 + 84);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double requestStart = *((double *)v4 + 4);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_24:
  self->_double requestEnd = *((double *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
LABEL_11:
    self->_redirectCount = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_12:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOClientNetworkMetrics addTransactionMetrics:](self, "addTransactionMetrics:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOClientNetworkMetricsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_374);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x480u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOClientNetworkMetrics *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_transactionMetrics;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

@end