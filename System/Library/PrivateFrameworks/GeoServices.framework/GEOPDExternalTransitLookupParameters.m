@interface GEOPDExternalTransitLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDExternalTransitLookupParameters)init;
- (GEOPDExternalTransitLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)externalTransitStationCodes;
- (id)jsonRepresentation;
- (id)transactionLocation;
- (unint64_t)hash;
- (void)_addNoFlagsExternalTransitStationCode:(uint64_t)a1;
- (void)_readExternalTransitStationCodes;
- (void)_readTransactionLocation;
- (void)addExternalTransitStationCode:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setExternalTransitStationCodes:(uint64_t)a1;
- (void)setSourceId:(uint64_t)a1;
- (void)setTransactionLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExternalTransitLookupParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_2953;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2954;
      }
      GEOPDExternalTransitLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDExternalTransitLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDExternalTransitLookupParameters;
  v2 = [(GEOPDExternalTransitLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExternalTransitLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDExternalTransitLookupParameters;
  v3 = [(GEOPDExternalTransitLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readTransactionLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExternalTransitLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)transactionLocation
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExternalTransitLookupParameters _readTransactionLocation]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTransactionLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 0x10u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setSourceId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 8u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readExternalTransitStationCodes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDExternalTransitLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalTransitStationCodes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)externalTransitStationCodes
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDExternalTransitLookupParameters _readExternalTransitStationCodes]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setExternalTransitStationCodes:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)addExternalTransitStationCode:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDExternalTransitLookupParameters _readExternalTransitStationCodes](a1);
    -[GEOPDExternalTransitLookupParameters _addNoFlagsExternalTransitStationCode:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsExternalTransitStationCode:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExternalTransitLookupParameters;
  id v4 = [(GEOPDExternalTransitLookupParameters *)&v8 description];
  id v5 = [(GEOPDExternalTransitLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalTransitLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDExternalTransitLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        objc_super v6 = @"transactionTimestamp";
      }
      else {
        objc_super v6 = @"transaction_timestamp";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = -[GEOPDExternalTransitLookupParameters transactionLocation]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"transactionLocation";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"transaction_location";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDExternalTransitLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceId_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v13 = *(id *)(a1 + 32);
    if (v13)
    {
      if (a2) {
        v14 = @"sourceId";
      }
      else {
        v14 = @"source_id";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if (*(void *)(a1 + 24))
    {
      if (a2)
      {
        v15 = (void *)MEMORY[0x1E4F1CA48];
        v16 = -[GEOPDExternalTransitLookupParameters externalTransitStationCodes]((id *)a1);
        v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v18 = -[GEOPDExternalTransitLookupParameters externalTransitStationCodes]((id *)a1);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              v22 = [*(id *)(*((void *)&v33 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v17 addObject:v22];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v19);
        }

        [v4 setObject:v17 forKey:@"externalTransitStationCode"];
      }
      else
      {
        v23 = -[GEOPDExternalTransitLookupParameters externalTransitStationCodes]((id *)a1);
        [v4 setObject:v23 forKey:@"external_transit_station_code"];
      }
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __66__GEOPDExternalTransitLookupParameters__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;
      }
      else
      {
        id v29 = v25;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOPDExternalTransitLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDExternalTransitLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDExternalTransitLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDExternalTransitLookupParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_transactionLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_sourceId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_externalTransitStationCodes;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteDataField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      GEOPDExternalTransitLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_transactionTimestamp;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v9 = [(GEOLocation *)self->_transactionLocation copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_sourceId copyWithZone:a3];
  long long v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_externalTransitStationCodes;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[GEOPDExternalTransitLookupParameters addExternalTransitStationCode:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_transactionTimestamp != *((double *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  transactionLocation = self->_transactionLocation;
  if ((unint64_t)transactionLocation | *((void *)v4 + 5)
    && !-[GEOLocation isEqual:](transactionLocation, "isEqual:"))
  {
    goto LABEL_13;
  }
  sourceId = self->_sourceId;
  if ((unint64_t)sourceId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  externalTransitStationCodes = self->_externalTransitStationCodes;
  if ((unint64_t)externalTransitStationCodes | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](externalTransitStationCodes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags)
  {
    double transactionTimestamp = self->_transactionTimestamp;
    double v5 = -transactionTimestamp;
    if (transactionTimestamp >= 0.0) {
      double v5 = self->_transactionTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(GEOLocation *)self->_transactionLocation hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_sourceId hash];
  return v8 ^ v9 ^ [(NSMutableArray *)self->_externalTransitStationCodes hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_externalTransitStationCodes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end