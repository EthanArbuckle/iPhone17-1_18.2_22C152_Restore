@interface GEODataSetURLOverride
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODataSetURLOverride)init;
- (GEODataSetURLOverride)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEODataSetURLOverride

- (GEODataSetURLOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODataSetURLOverride;
  v2 = [(GEODataSetURLOverride *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODataSetURLOverride)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODataSetURLOverride;
  v3 = [(GEODataSetURLOverride *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODataSetURLOverride;
  v4 = [(GEODataSetURLOverride *)&v8 description];
  v5 = [(GEODataSetURLOverride *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODataSetURLOverride _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEODataSetURLOverride readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 160))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 156)];
      [v4 setObject:v5 forKey:@"dataSet"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 0x80) == 0)
    {
      objc_super v6 = *(void **)(a1 + 8);
      if (v6)
      {
        id v7 = v6;
        objc_sync_enter(v7);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsURL_tags);
        objc_sync_exit(v7);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v8 = *(id *)(a1 + 64);
    if (v8) {
      [v4 setObject:v8 forKey:@"directionsURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 2) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaURL_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v11 = *(id *)(a1 + 80);
    if (v11) {
      [v4 setObject:v11 forKey:@"etaURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 0x20) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v14 = *(id *)(a1 + 48);
    if (v14) {
      [v4 setObject:v14 forKey:@"batchReverseGeocoderURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 0x80) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSimpleETAURL_tags);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v17 = *(id *)(a1 + 128);
    if (v17) {
      [v4 setObject:v17 forKey:@"simpleETAURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 4) == 0)
    {
      v18 = *(void **)(a1 + 8);
      if (v18)
      {
        id v19 = v18;
        objc_sync_enter(v19);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags);
        objc_sync_exit(v19);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v20 = *(id *)(a1 + 24);
    if (v20) {
      [v4 setObject:v20 forKey:@"addressCorrectionInitURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 8) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v23 = *(id *)(a1 + 32);
    if (v23) {
      [v4 setObject:v23 forKey:@"addressCorrectionUpdateURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 0x40) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v26 = *(id *)(a1 + 120);
    if (v26) {
      [v4 setObject:v26 forKey:@"problemSubmissionURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 0x20) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemStatusURL_tags);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v29 = *(id *)(a1 + 112);
    if (v29) {
      [v4 setObject:v29 forKey:@"problemStatusURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 8) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = v30;
        objc_sync_enter(v31);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v32 = *(id *)(a1 + 96);
    if (v32) {
      [v4 setObject:v32 forKey:@"problemCategoriesURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 0x10) == 0)
    {
      v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnnouncementsURL_tags);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v35 = *(id *)(a1 + 40);
    if (v35) {
      [v4 setObject:v35 forKey:@"announcementsURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 1) == 0)
    {
      v36 = *(void **)(a1 + 8);
      if (v36)
      {
        id v37 = v36;
        objc_sync_enter(v37);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDispatcherURL_tags);
        objc_sync_exit(v37);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v38 = *(id *)(a1 + 72);
    if (v38) {
      [v4 setObject:v38 forKey:@"dispatcherURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 0x10) == 0)
    {
      v39 = *(void **)(a1 + 8);
      if (v39)
      {
        id v40 = v39;
        objc_sync_enter(v40);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProblemOptInURL_tags);
        objc_sync_exit(v40);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v41 = *(id *)(a1 + 104);
    if (v41) {
      [v4 setObject:v41 forKey:@"problemOptInURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 160) & 0x40) == 0)
    {
      v42 = *(void **)(a1 + 8);
      if (v42)
      {
        id v43 = v42;
        objc_sync_enter(v43);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags);
        objc_sync_exit(v43);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v44 = *(id *)(a1 + 56);
    if (v44) {
      [v4 setObject:v44 forKey:@"businessPortalBaseURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 161) & 4) == 0)
    {
      v45 = *(void **)(a1 + 8);
      if (v45)
      {
        id v46 = v45;
        objc_sync_enter(v46);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags);
        objc_sync_exit(v46);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v47 = *(id *)(a1 + 88);
    if (v47) {
      [v4 setObject:v47 forKey:@"logMessageUsageURL"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 162) & 1) == 0)
    {
      v48 = *(void **)(a1 + 8);
      if (v48)
      {
        id v49 = v48;
        objc_sync_enter(v49);
        GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialLookupURL_tags);
        objc_sync_exit(v49);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
    id v50 = *(id *)(a1 + 136);
    if (v50) {
      [v4 setObject:v50 forKey:@"spatialLookupURL"];
    }

    v51 = *(void **)(a1 + 16);
    if (v51)
    {
      v52 = [v51 dictionaryRepresentation];
      v53 = v52;
      if (a2)
      {
        v54 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __51__GEODataSetURLOverride__dictionaryRepresentation___block_invoke;
        v58[3] = &unk_1E53D8860;
        id v55 = v54;
        id v59 = v55;
        [v53 enumerateKeysAndObjectsUsingBlock:v58];
        id v56 = v55;

        v53 = v56;
      }
      [v4 setObject:v53 forKey:@"Unknown Fields"];
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
  return -[GEODataSetURLOverride _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_354;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_355;
      }
      GEODataSetURLOverrideReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

void __51__GEODataSetURLOverride__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEODataSetURLOverrideReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x3FFFC) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODataSetURLOverride readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v8;
    if (self->_directionsURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_etaURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_batchReverseGeocoderURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_simpleETAURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_addressCorrectionInitURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_addressCorrectionUpdateURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_problemSubmissionURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_problemStatusURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_problemCategoriesURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_announcementsURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_dispatcherURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_problemOptInURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_businessPortalBaseURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_logMessageUsageURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_spatialLookupURL)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODataSetURLOverrideReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODataSetURLOverride readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 156) = self->_dataSet;
    *(_DWORD *)(v5 + 160) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_directionsURL copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_etaURL copyWithZone:a3];
  v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  uint64_t v13 = [(NSString *)self->_batchReverseGeocoderURL copyWithZone:a3];
  id v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  uint64_t v15 = [(NSString *)self->_simpleETAURL copyWithZone:a3];
  id v16 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v15;

  uint64_t v17 = [(NSString *)self->_addressCorrectionInitURL copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  uint64_t v19 = [(NSString *)self->_addressCorrectionUpdateURL copyWithZone:a3];
  id v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  uint64_t v21 = [(NSString *)self->_problemSubmissionURL copyWithZone:a3];
  id v22 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v21;

  uint64_t v23 = [(NSString *)self->_problemStatusURL copyWithZone:a3];
  v24 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v23;

  uint64_t v25 = [(NSString *)self->_problemCategoriesURL copyWithZone:a3];
  id v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  uint64_t v27 = [(NSString *)self->_announcementsURL copyWithZone:a3];
  id v28 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v27;

  uint64_t v29 = [(NSString *)self->_dispatcherURL copyWithZone:a3];
  v30 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v29;

  uint64_t v31 = [(NSString *)self->_problemOptInURL copyWithZone:a3];
  id v32 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v31;

  uint64_t v33 = [(NSString *)self->_businessPortalBaseURL copyWithZone:a3];
  id v34 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v33;

  uint64_t v35 = [(NSString *)self->_logMessageUsageURL copyWithZone:a3];
  v36 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v35;

  uint64_t v37 = [(NSString *)self->_spatialLookupURL copyWithZone:a3];
  id v38 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v37;

  v39 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v39;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  -[GEODataSetURLOverride readAll:]((uint64_t)self, 1);
  -[GEODataSetURLOverride readAll:]((uint64_t)v4, 1);
  int v5 = *((_DWORD *)v4 + 40);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 39)) {
      goto LABEL_37;
    }
  }
  else if (v5)
  {
LABEL_37:
    char v21 = 0;
    goto LABEL_38;
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((void *)v4 + 8)
    && !-[NSString isEqual:](directionsURL, "isEqual:"))
  {
    goto LABEL_37;
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](etaURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](simpleETAURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](addressCorrectionInitURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](problemSubmissionURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](problemStatusURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](problemCategoriesURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](announcementsURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](dispatcherURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](problemOptInURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](businessPortalBaseURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](logMessageUsageURL, "isEqual:")) {
      goto LABEL_37;
    }
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((void *)v4 + 17)) {
    char v21 = -[NSString isEqual:](spatialLookupURL, "isEqual:");
  }
  else {
    char v21 = 1;
  }
LABEL_38:

  return v21;
}

- (unint64_t)hash
{
  -[GEODataSetURLOverride readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_dataSet;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_directionsURL hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_etaURL hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_batchReverseGeocoderURL hash];
  NSUInteger v7 = [(NSString *)self->_simpleETAURL hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_addressCorrectionInitURL hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_addressCorrectionUpdateURL hash];
  NSUInteger v10 = [(NSString *)self->_problemSubmissionURL hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_problemStatusURL hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_problemCategoriesURL hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_announcementsURL hash];
  NSUInteger v14 = [(NSString *)self->_dispatcherURL hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_problemOptInURL hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_businessPortalBaseURL hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_logMessageUsageURL hash];
  return v13 ^ v17 ^ [(NSString *)self->_spatialLookupURL hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end