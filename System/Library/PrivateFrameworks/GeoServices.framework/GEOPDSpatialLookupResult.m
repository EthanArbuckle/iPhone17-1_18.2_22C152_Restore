@interface GEOPDSpatialLookupResult
+ (id)spatialLookupResultForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSpatialLookupResult)init;
- (GEOPDSpatialLookupResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bounds;
- (id)center;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)mappedCategoryAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readBounds;
- (void)_readCenter;
- (void)_readMappedCategorys;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSpatialLookupResult

+ (id)spatialLookupResultForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__GEOPDSpatialLookupResult_PlaceDataExtras__spatialLookupResultForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:34 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __77__GEOPDSpatialLookupResult_PlaceDataExtras__spatialLookupResultForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue spatialLookupResult](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSpatialLookupResult _readBounds](result);
    if (-[GEOPDBounds hasGreenTeaWithValue:](*(void *)(v3 + 48), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDSpatialLookupResult _readCenter](v3);
      id v4 = *(void **)(v3 + 56);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (GEOPDSpatialLookupResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialLookupResult;
  v2 = [(GEOPDSpatialLookupResult *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialLookupResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialLookupResult;
  uint64_t v3 = [(GEOPDSpatialLookupResult *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSpatialLookupResult;
  [(GEOPDSpatialLookupResult *)&v3 dealloc];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8646);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)center
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSpatialLookupResult _readCenter]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBounds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBounds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)bounds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSpatialLookupResult _readBounds]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMappedCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMappedCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)mappedCategoryAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSpatialLookupResult _readMappedCategorys](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSpatialLookupResult;
  unint64_t v4 = [(GEOPDSpatialLookupResult *)&v8 description];
  uint64_t v5 = [(GEOPDSpatialLookupResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialLookupResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialLookupResult readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDSpatialLookupResult center]((id *)a1);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    objc_super v8 = -[GEOPDSpatialLookupResult bounds]((id *)a1);
    uint64_t v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"bounds"];
    }
    if (*(void *)(a1 + 32))
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      id v12 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 0x17)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53E4168[v14];
          }
          [v11 addObject:v15];

          ++v13;
          id v12 = (void *)(a1 + 24);
        }
        while (v13 < *(void *)(a1 + 32));
      }
      if (a2) {
        v16 = @"mappedCategory";
      }
      else {
        v16 = @"mapped_category";
      }
      [v4 setObject:v11 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __54__GEOPDSpatialLookupResult__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialLookupResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_8653_0;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_8654_0;
      }
      GEOPDSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 56) readAll:1];
      -[GEOPDBounds readAll:](*(void *)(a1 + 48), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __54__GEOPDSpatialLookupResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDSpatialLookupResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_3;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x18) != 0) {
    goto LABEL_3;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if (GEOPDBoundsIsDirty((os_unfair_lock_s *)self->_bounds)) {
      goto LABEL_3;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 2) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_11;
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialLookupResult readAll:]((uint64_t)self, 0);
  if (self->_center) {
    PBDataWriterWriteSubmessage();
  }
  id v6 = v10;
  if (self->_bounds)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v10;
  }
  if (self->_mappedCategorys.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v6 = v10;
      ++v7;
    }
    while (v7 < self->_mappedCategorys.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialLookupResult readAll:]((uint64_t)self, 0);
    id v8 = [(GEOLatLng *)self->_center copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    id v10 = [(GEOPDBounds *)self->_bounds copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    PBRepeatedInt32Copy();
    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSpatialLookupResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSpatialLookupResult readAll:]((uint64_t)self, 1),
         -[GEOPDSpatialLookupResult readAll:]((uint64_t)v4, 1),
         center = self->_center,
         !((unint64_t)center | v4[7]))
     || -[GEOLatLng isEqual:](center, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[6])) || -[GEOPDBounds isEqual:](bounds, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSpatialLookupResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  unint64_t v4 = [(GEOPDBounds *)self->_bounds hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end