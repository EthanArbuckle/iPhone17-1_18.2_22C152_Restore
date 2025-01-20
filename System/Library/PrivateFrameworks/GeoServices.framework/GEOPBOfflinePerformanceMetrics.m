@interface GEOPBOfflinePerformanceMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBOfflinePerformanceMetrics)init;
- (GEOPBOfflinePerformanceMetrics)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsServiceMetrics:(uint64_t)a1;
- (void)addServiceMetrics:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDataVersion:(uint64_t)a1;
- (void)setDeviceModel:(uint64_t)a1;
- (void)setOfflineVersion:(uint64_t)a1;
- (void)setOsBuild:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflinePerformanceMetrics

- (GEOPBOfflinePerformanceMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  v2 = [(GEOPBOfflinePerformanceMetrics *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflinePerformanceMetrics)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  v3 = [(GEOPBOfflinePerformanceMetrics *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setDeviceModel:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 2u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setOsBuild:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 8u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setOfflineVersion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 4u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setDataVersion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 1u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)addServiceMetrics:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      id v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceMetrics_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOPBOfflinePerformanceMetrics _addNoFlagsServiceMetrics:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsServiceMetrics:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflinePerformanceMetrics;
  id v4 = [(GEOPBOfflinePerformanceMetrics *)&v8 description];
  id v5 = [(GEOPBOfflinePerformanceMetrics *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflinePerformanceMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPBOfflinePerformanceMetrics readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceModel_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"deviceModel";
      }
      else {
        objc_super v8 = @"device_model";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOsBuild_tags_0);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        v12 = @"osBuild";
      }
      else {
        v12 = @"os_build";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineVersion_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v15 = *(id *)(a1 + 32);
    if (v15)
    {
      if (a2) {
        v16 = @"offlineVersion";
      }
      else {
        v16 = @"offline_version";
      }
      [v4 setObject:v15 forKey:v16];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataVersion_tags_0);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 16);
    if (v19)
    {
      if (a2) {
        v20 = @"dataVersion";
      }
      else {
        v20 = @"data_version";
      }
      [v4 setObject:v19 forKey:v20];
    }

    if ([*(id *)(a1 + 48) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v22 = *(id *)(a1 + 48);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = objc_msgSend(v26, "dictionaryRepresentation", (void)v30);
            }
            objc_msgSend(v21, "addObject:", v27, (void)v30);
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"serviceMetrics";
      }
      else {
        v28 = @"service_metrics";
      }
      objc_msgSend(v4, "setObject:forKey:", v21, v28, (void)v30);
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
  return -[GEOPBOfflinePerformanceMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_81;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_81;
      }
      GEOPBOfflinePerformanceMetricsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPBOfflinePerformanceMetricsCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflinePerformanceMetricsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3F) == 0))
  {
    id v10 = self->_reader;
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
    -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 0);
    if (self->_deviceModel) {
      PBDataWriterWriteStringField();
    }
    if (self->_osBuild) {
      PBDataWriterWriteStringField();
    }
    if (self->_offlineVersion) {
      PBDataWriterWriteStringField();
    }
    if (self->_dataVersion) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_serviceMetrics;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPBOfflinePerformanceMetricsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_osBuild copyWithZone:a3];
  id v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_offlineVersion copyWithZone:a3];
  long long v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_dataVersion copyWithZone:a3];
  long long v15 = (void *)v5[2];
  v5[2] = v14;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = self->_serviceMetrics;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        -[GEOPBOfflinePerformanceMetrics addServiceMetrics:]((uint64_t)v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 1),
         -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)v4, 1),
         deviceModel = self->_deviceModel,
         !((unint64_t)deviceModel | v4[3]))
     || -[NSString isEqual:](deviceModel, "isEqual:"))
    && ((osBuild = self->_osBuild, !((unint64_t)osBuild | v4[5]))
     || -[NSString isEqual:](osBuild, "isEqual:"))
    && ((offlineVersion = self->_offlineVersion, !((unint64_t)offlineVersion | v4[4]))
     || -[NSString isEqual:](offlineVersion, "isEqual:"))
    && ((dataVersion = self->_dataVersion, !((unint64_t)dataVersion | v4[2]))
     || -[NSString isEqual:](dataVersion, "isEqual:")))
  {
    serviceMetrics = self->_serviceMetrics;
    if ((unint64_t)serviceMetrics | v4[6]) {
      char v10 = -[NSMutableArray isEqual:](serviceMetrics, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  -[GEOPBOfflinePerformanceMetrics readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_deviceModel hash];
  NSUInteger v4 = [(NSString *)self->_osBuild hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_offlineVersion hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_dataVersion hash];
  return v6 ^ [(NSMutableArray *)self->_serviceMetrics hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceMetrics, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_offlineVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end