@interface GEOPDVenueFeatureValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVenueFeatureValue)init;
- (GEOPDVenueFeatureValue)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVenueFeatureValue

- (GEOPDVenueFeatureValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueFeatureValue;
  v2 = [(GEOPDVenueFeatureValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueFeatureValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueFeatureValue;
  v3 = [(GEOPDVenueFeatureValue *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDVenueFeatureValue;
  v4 = [(GEOPDVenueFeatureValue *)&v8 description];
  v5 = [(GEOPDVenueFeatureValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueFeatureValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVenueFeatureValue readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDVenueFeatureValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureVenue_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 40);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"featureVenue";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"feature_venue";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDVenueFeatureValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureBuilding_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"featureBuilding";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"feature_building";
      }
      [v4 setObject:v15 forKey:v16];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDVenueFeatureValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeaturePoi_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v19 = *(id *)(a1 + 32);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"featurePoi";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"feature_poi";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __52__GEOPDVenueFeatureValue__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOPDVenueFeatureValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_255;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_256;
      }
      GEOPDVenueFeatureValueReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDFeatureVenue readAll:](*(void *)(a1 + 40), 1);
      -[GEOPDFeatureBuilding readAll:](*(void *)(a1 + 24), 1);
      -[GEOPDFeaturePOI readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __52__GEOPDVenueFeatureValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueFeatureValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_14;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    featureVenue = self->_featureVenue;
    if (featureVenue)
    {
      os_unfair_lock_lock_with_options();
      char IsDirty = _GEOPDFeatureVenueIsDirty((uint64_t)featureVenue);
      os_unfair_lock_unlock(&featureVenue->_readerLock);
      if (IsDirty) {
        goto LABEL_14;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 2) != 0)
  {
    featureBuilding = self->_featureBuilding;
    if (featureBuilding)
    {
      os_unfair_lock_lock_with_options();
      char v9 = _GEOPDFeatureBuildingIsDirty((uint64_t)featureBuilding);
      os_unfair_lock_unlock(&featureBuilding->_readerLock);
      if (v9) {
        goto LABEL_14;
      }
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 4) == 0
    || (featurePoi = self->_featurePoi) == 0
    || (os_unfair_lock_lock_with_options(),
        char v11 = _GEOPDFeaturePOIIsDirty((uint64_t)featurePoi),
        os_unfair_lock_unlock(&featurePoi->_readerLock),
        (v11 & 1) == 0))
  {
    id v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v15 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_21;
  }
LABEL_14:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 0);
  if (self->_featureVenue) {
    PBDataWriterWriteSubmessage();
  }
  id v12 = v15;
  if (self->_featureBuilding)
  {
    PBDataWriterWriteSubmessage();
    id v12 = v15;
  }
  if (self->_featurePoi)
  {
    PBDataWriterWriteSubmessage();
    id v12 = v15;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v12];
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDFeatureVenue *)self->_featureVenue copyWithZone:a3];
    char v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    id v10 = [(GEOPDFeatureBuilding *)self->_featureBuilding copyWithZone:a3];
    char v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEOPDFeaturePOI *)self->_featurePoi copyWithZone:a3];
    id v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDVenueFeatureValueReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 1),
         -[GEOPDVenueFeatureValue readAll:]((uint64_t)v4, 1),
         featureVenue = self->_featureVenue,
         !((unint64_t)featureVenue | v4[5]))
     || -[GEOPDFeatureVenue isEqual:](featureVenue, "isEqual:"))
    && ((featureBuilding = self->_featureBuilding, !((unint64_t)featureBuilding | v4[3]))
     || -[GEOPDFeatureBuilding isEqual:](featureBuilding, "isEqual:")))
  {
    featurePoi = self->_featurePoi;
    if ((unint64_t)featurePoi | v4[4]) {
      char v8 = -[GEOPDFeaturePOI isEqual:](featurePoi, "isEqual:");
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
  -[GEOPDVenueFeatureValue readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDFeatureVenue *)self->_featureVenue hash];
  unint64_t v4 = [(GEOPDFeatureBuilding *)self->_featureBuilding hash] ^ v3;
  return v4 ^ [(GEOPDFeaturePOI *)self->_featurePoi hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVenue, 0);
  objc_storeStrong((id *)&self->_featurePoi, 0);
  objc_storeStrong((id *)&self->_featureBuilding, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end