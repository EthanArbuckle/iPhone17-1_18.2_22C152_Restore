@interface GEOPBOfflineResponseMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPerformanceMetrics;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflinePerformanceMetrics)performanceMetrics;
- (GEOPBOfflineResponseMetadata)init;
- (GEOPBOfflineResponseMetadata)initWithData:(id)a3;
- (GEOPBOfflineResponseMetadata)initWithDictionary:(id)a3;
- (GEOPBOfflineResponseMetadata)initWithJSON:(id)a3;
- (NSString)requestIdentifier;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPerformanceMetrics;
- (void)_readRequestIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineResponseMetadata

- (GEOPBOfflineResponseMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineResponseMetadata;
  v2 = [(GEOPBOfflineResponseMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineResponseMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineResponseMetadata;
  v3 = [(GEOPBOfflineResponseMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRequestIdentifier
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
        GEOPBOfflineResponseMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRequestIdentifier_tags_197);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (NSString)requestIdentifier
{
  -[GEOPBOfflineResponseMetadata _readRequestIdentifier]((uint64_t)self);
  requestIdentifier = self->_requestIdentifier;

  return requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void)_readPerformanceMetrics
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
        GEOPBOfflineResponseMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPerformanceMetrics_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPerformanceMetrics
{
  return self->_performanceMetrics != 0;
}

- (GEOPBOfflinePerformanceMetrics)performanceMetrics
{
  -[GEOPBOfflineResponseMetadata _readPerformanceMetrics]((uint64_t)self);
  performanceMetrics = self->_performanceMetrics;

  return performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineResponseMetadata;
  v4 = [(GEOPBOfflineResponseMetadata *)&v8 description];
  v5 = [(GEOPBOfflineResponseMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineResponseMetadata _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 requestIdentifier];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"requestIdentifier";
      }
      else {
        objc_super v6 = @"request_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 performanceMetrics];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"performanceMetrics";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"performance_metrics";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOPBOfflineResponseMetadata _dictionaryRepresentation:](self, 1);
}

- (GEOPBOfflineResponseMetadata)initWithDictionary:(id)a3
{
  return (GEOPBOfflineResponseMetadata *)-[GEOPBOfflineResponseMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        objc_super v7 = @"requestIdentifier";
      }
      else {
        objc_super v7 = @"request_identifier";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      unint64_t v9 = 0x1E4F29000uLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[v8 copy];
        [v6 setRequestIdentifier:v10];
      }
      if (a3) {
        v11 = @"performanceMetrics";
      }
      else {
        v11 = @"performance_metrics";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPBOfflinePerformanceMetrics alloc];
        if (v13)
        {
          v14 = v13;
          id v15 = v12;
          v59 = [(GEOPBOfflinePerformanceMetrics *)v14 init];
          if (v59)
          {
            if (a3) {
              v16 = @"deviceModel";
            }
            else {
              v16 = @"device_model";
            }
            v17 = [v15 objectForKeyedSubscript:v16];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = (void *)[v17 copy];
              -[GEOPBOfflinePerformanceMetrics setDeviceModel:]((uint64_t)v59, v18);
            }
            if (a3) {
              v19 = @"osBuild";
            }
            else {
              v19 = @"os_build";
            }
            v20 = [v15 objectForKeyedSubscript:v19];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = (void *)[v20 copy];
              -[GEOPBOfflinePerformanceMetrics setOsBuild:]((uint64_t)v59, v21);
            }
            if (a3) {
              v22 = @"offlineVersion";
            }
            else {
              v22 = @"offline_version";
            }
            v23 = [v15 objectForKeyedSubscript:v22];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = (void *)[v23 copy];
              -[GEOPBOfflinePerformanceMetrics setOfflineVersion:]((uint64_t)v59, v24);
            }
            if (a3) {
              v25 = @"dataVersion";
            }
            else {
              v25 = @"data_version";
            }
            v26 = [v15 objectForKeyedSubscript:v25];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 = (void *)[v26 copy];
              -[GEOPBOfflinePerformanceMetrics setDataVersion:]((uint64_t)v59, v27);
            }
            if (a3) {
              v28 = @"serviceMetrics";
            }
            else {
              v28 = @"service_metrics";
            }
            v29 = [v15 objectForKeyedSubscript:v28];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v55 = v15;
              v56 = v12;
              v57 = v6;
              id v58 = v5;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              v54 = v29;
              id v30 = v29;
              uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v67 count:16];
              uint64_t v32 = (uint64_t)v59;
              if (!v31) {
                goto LABEL_84;
              }
              uint64_t v33 = v31;
              uint64_t v34 = *(void *)v64;
              if (a3) {
                v35 = @"startTimeMs";
              }
              else {
                v35 = @"start_time_ms";
              }
              v36 = @"stopTimeMs";
              if (!a3) {
                v36 = @"stop_time_ms";
              }
              v61 = v36;
              v62 = v35;
              v37 = @"service_id";
              if (a3) {
                v37 = @"serviceId";
              }
              v60 = v37;
              while (1)
              {
                uint64_t v38 = 0;
                do
                {
                  if (*(void *)v64 != v34) {
                    objc_enumerationMutation(v30);
                  }
                  v39 = *(void **)(*((void *)&v63 + 1) + 8 * v38);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v40 = [GEOPBOfflineServiceMetrics alloc];
                    if (v40)
                    {
                      v41 = v40;
                      id v42 = v39;
                      uint64_t v43 = [(GEOPBOfflineServiceMetrics *)v41 init];
                      if (v43)
                      {
                        v44 = [v42 objectForKeyedSubscript:v62];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v45 = [v44 unsignedLongLongValue];
                          *(unsigned char *)(v43 + 28) |= 1u;
                          *(void *)(v43 + 8) = v45;
                        }

                        v46 = [v42 objectForKeyedSubscript:v61];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v47 = [v46 unsignedLongLongValue];
                          *(unsigned char *)(v43 + 28) |= 2u;
                          *(void *)(v43 + 16) = v47;
                        }

                        v48 = [v42 objectForKeyedSubscript:v60];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          unint64_t v49 = v9;
                          id v50 = v48;
                          if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_UNKNOWN"])
                          {
                            int v51 = 0;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_DISPATCHER"])
                          {
                            int v51 = 1;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_SEARCH"])
                          {
                            int v51 = 2;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_PLACES"])
                          {
                            int v51 = 3;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_ROUTING"])
                          {
                            int v51 = 4;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_VECTOR_PARSEC"])
                          {
                            int v51 = 5;
                          }
                          else if ([v50 isEqualToString:@"OFFLINE_SERVICE_TYPE_REVGEO"])
                          {
                            int v51 = 6;
                          }
                          else
                          {
                            int v51 = 0;
                          }

                          unint64_t v9 = v49;
LABEL_76:
                          *(unsigned char *)(v43 + 28) |= 4u;
                          *(_DWORD *)(v43 + 24) = v51;
                          uint64_t v32 = (uint64_t)v59;
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v51 = [v48 intValue];
                            goto LABEL_76;
                          }
                        }
                      }
                    }
                    else
                    {
                      uint64_t v43 = 0;
                    }
                    -[GEOPBOfflinePerformanceMetrics addServiceMetrics:](v32, (void *)v43);
                  }
                  ++v38;
                }
                while (v33 != v38);
                uint64_t v52 = [v30 countByEnumeratingWithState:&v63 objects:v67 count:16];
                uint64_t v33 = v52;
                if (!v52)
                {
LABEL_84:

                  objc_super v6 = v57;
                  id v5 = v58;
                  id v15 = v55;
                  v12 = v56;
                  v29 = v54;
                  break;
                }
              }
            }
          }
        }
        else
        {
          v59 = 0;
        }
        [v6 setPerformanceMetrics:v59];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOPBOfflineResponseMetadata)initWithJSON:(id)a3
{
  return (GEOPBOfflineResponseMetadata *)-[GEOPBOfflineResponseMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_199;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_200;
    }
    GEOPBOfflineResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self->_performanceMetrics, 1);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBOfflineResponseMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineResponseMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBOfflineResponseMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBOfflineResponseMetadata *)self readAll:0];
    if (self->_requestIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_performanceMetrics) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOPBOfflineResponseMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_requestIdentifier) {
    objc_msgSend(v4, "setRequestIdentifier:");
  }
  if (self->_performanceMetrics) {
    objc_msgSend(v4, "setPerformanceMetrics:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBOfflineResponseMetadata *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
    unint64_t v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOPBOfflinePerformanceMetrics *)self->_performanceMetrics copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPBOfflineResponseMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPBOfflineResponseMetadata *)self readAll:1],
         [v4 readAll:1],
         requestIdentifier = self->_requestIdentifier,
         !((unint64_t)requestIdentifier | v4[3]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:")))
  {
    performanceMetrics = self->_performanceMetrics;
    if ((unint64_t)performanceMetrics | v4[2]) {
      char v7 = -[GEOPBOfflinePerformanceMetrics isEqual:](performanceMetrics, "isEqual:");
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
  [(GEOPBOfflineResponseMetadata *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  return [(GEOPBOfflinePerformanceMetrics *)self->_performanceMetrics hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16 = a3;
  [v16 readAll:0];
  if (v16[3]) {
    -[GEOPBOfflineResponseMetadata setRequestIdentifier:](self, "setRequestIdentifier:");
  }
  performanceMetrics = self->_performanceMetrics;
  id v5 = (void *)v16[2];
  if (performanceMetrics)
  {
    if (v5)
    {
      id v6 = v5;
      -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)v6, 0);
      char v7 = (void *)*((void *)v6 + 3);
      if (v7) {
        -[GEOPBOfflinePerformanceMetrics setDeviceModel:]((uint64_t)performanceMetrics, v7);
      }
      uint64_t v8 = (void *)*((void *)v6 + 5);
      if (v8) {
        -[GEOPBOfflinePerformanceMetrics setOsBuild:]((uint64_t)performanceMetrics, v8);
      }
      unint64_t v9 = (void *)*((void *)v6 + 4);
      if (v9) {
        -[GEOPBOfflinePerformanceMetrics setOfflineVersion:]((uint64_t)performanceMetrics, v9);
      }
      id v10 = (void *)*((void *)v6 + 2);
      if (v10) {
        -[GEOPBOfflinePerformanceMetrics setDataVersion:]((uint64_t)performanceMetrics, v10);
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v11 = *((id *)v6 + 6);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            -[GEOPBOfflinePerformanceMetrics addServiceMetrics:]((uint64_t)performanceMetrics, *(void **)(*((void *)&v17 + 1) + 8 * i));
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
  }
  else if (v5)
  {
    -[GEOPBOfflineResponseMetadata setPerformanceMetrics:](self, "setPerformanceMetrics:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end