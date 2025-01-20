@interface GEOPDPopularNearbyResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPopularNearbyResult)init;
- (GEOPDPopularNearbyResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sectionHeader;
- (uint64_t)_reserveLitePlaceResults:(uint64_t)result;
- (uint64_t)litePlaceResultAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readLitePlaceResults;
- (void)_readSectionHeader;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPopularNearbyResult

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
        v6 = (int *)&readAll__recursiveTag_6149;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_6150;
      }
      GEOPDPopularNearbyResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDPopularNearbyResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPopularNearbyResult;
  v2 = [(GEOPDPopularNearbyResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPopularNearbyResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPopularNearbyResult;
  v3 = [(GEOPDPopularNearbyResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(unsigned char *)&self->_flags |= 8u;
    self->_litePlaceResultsSpace = 0;
    self->_litePlaceResultsCount = 0;
    free(self->_litePlaceResults);
    self->_litePlaceResults = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPopularNearbyResult;
  [(GEOPDPopularNearbyResult *)&v3 dealloc];
}

- (void)_readSectionHeader
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
        GEOPDPopularNearbyResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionHeader_tags_6142);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionHeader
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPopularNearbyResult _readSectionHeader]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLitePlaceResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPopularNearbyResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLitePlaceResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_reserveLitePlaceResults:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 32);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 40);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (16 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 16 * v8, 0x109E87CCuLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 16 * v2[4]), 16 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)litePlaceResultAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPopularNearbyResult _readLitePlaceResults](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      unint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 24) + 16 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPopularNearbyResult;
  unint64_t v4 = [(GEOPDPopularNearbyResult *)&v8 description];
  unint64_t v5 = [(GEOPDPopularNearbyResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPopularNearbyResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPopularNearbyResult readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v5 = -[GEOPDPopularNearbyResult sectionHeader]((id *)a1);
    if (v5)
    {
      if (a2) {
        uint64_t v6 = @"sectionHeader";
      }
      else {
        uint64_t v6 = @"section_header";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(void *)(a1 + 32))
    {
      int v25 = a2;
      v24 = v4;
      unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        v10 = @"result_provider_id";
        if (v25) {
          v10 = @"resultProviderId";
        }
        v26 = v10;
        do
        {
          uint64_t v11 = *(void *)(a1 + 24);
          v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v24);
          char v13 = *(unsigned char *)(v11 + v8 + 12);
          if (v13)
          {
            v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(v11 + v8)];
            [v12 setObject:v14 forKey:@"muid"];

            char v13 = *(unsigned char *)(v11 + v8 + 12);
          }
          if ((v13 & 2) != 0)
          {
            v15 = [NSNumber numberWithInt:*(unsigned int *)(v11 + v8 + 8)];
            [v12 setObject:v15 forKey:v26];
          }
          [v7 addObject:v12];

          ++v9;
          v8 += 16;
        }
        while (v9 < *(void *)(a1 + 32));
      }
      a2 = v25;
      if (v25) {
        v16 = @"litePlaceResult";
      }
      else {
        v16 = @"lite_place_result";
      }
      unint64_t v4 = v24;
      objc_msgSend(v24, "setObject:forKey:", v7, v16, v24);
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __54__GEOPDPopularNearbyResult__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v21 = v20;
        id v28 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v27];
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
  return -[GEOPDPopularNearbyResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDPopularNearbyResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPopularNearbyResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    id v10 = self->_reader;
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
    -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 0);
    if (self->_sectionHeader) {
      PBDataWriterWriteStringField();
    }
    if (self->_litePlaceResultsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        litePlaceResults = self->_litePlaceResults;
        char var2 = (char)litePlaceResults[v6].var2;
        if (var2)
        {
          PBDataWriterWriteUint64Field();
          char var2 = (char)litePlaceResults[v6].var2;
        }
        if ((var2 & 2) != 0) {
          PBDataWriterWriteInt32Field();
        }
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_litePlaceResultsCount);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPopularNearbyResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_sectionHeader copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  unint64_t litePlaceResultsCount = self->_litePlaceResultsCount;
  if (litePlaceResultsCount)
  {
    -[GEOPDPopularNearbyResult _reserveLitePlaceResults:](v5, litePlaceResultsCount);
    memcpy(*(void **)(v5 + 24), self->_litePlaceResults, 16 * self->_litePlaceResultsCount);
    *(void *)(v5 + 32) = self->_litePlaceResultsCount;
  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 1),
         -[GEOPDPopularNearbyResult readAll:]((uint64_t)v4, 1),
         sectionHeader = self->_sectionHeader,
         !((unint64_t)sectionHeader | (unint64_t)v4[6]))
     || -[NSString isEqual:](sectionHeader, "isEqual:"))
    && (unint64_t litePlaceResultsCount = self->_litePlaceResultsCount, (const void *)litePlaceResultsCount == v4[4])
    && memcmp(self->_litePlaceResults, v4[3], 16 * litePlaceResultsCount) == 0;

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_sectionHeader hash];
  return PBHashBytes() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end