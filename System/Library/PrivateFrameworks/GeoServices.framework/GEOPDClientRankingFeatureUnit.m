@interface GEOPDClientRankingFeatureUnit
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDClientRankingFeatureUnit)init;
- (GEOPDClientRankingFeatureUnit)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)functionTypeDiscrete;
- (id)functionTypeLinear;
- (id)jsonRepresentation;
- (uint64_t)functionType;
- (unint64_t)hash;
- (void)_readFunctionTypeDiscrete;
- (void)_readFunctionTypeLinear;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDClientRankingFeatureUnit

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDClientRankingFeatureUnitReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_featureType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v9 = [(GEOPDClientRankingFeatureTypeSource *)self->_featureTypeSource copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOPDClientRankingFeatureTypeResult *)self->_featureTypeResult copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_functionType;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v13 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)self->_functionTypeLinear copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  id v15 = [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)self->_functionTypeDiscrete copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 1);
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  featureTypeSource = self->_featureTypeSource;
  if ((unint64_t)featureTypeSource | *((void *)v4 + 4)
    && !-[GEOPDClientRankingFeatureTypeSource isEqual:](featureTypeSource, "isEqual:"))
  {
    goto LABEL_20;
  }
  featureTypeResult = self->_featureTypeResult;
  if ((unint64_t)featureTypeResult | *((void *)v4 + 3))
  {
    if (!-[GEOPDClientRankingFeatureTypeResult isEqual:](featureTypeResult, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_functionType != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  functionTypeLinear = self->_functionTypeLinear;
  if ((unint64_t)functionTypeLinear | *((void *)v4 + 6)
    && !-[GEOPDClientRankingFeatureFunctionTypeLinear isEqual:](functionTypeLinear, "isEqual:"))
  {
    goto LABEL_20;
  }
  functionTypeDiscrete = self->_functionTypeDiscrete;
  if ((unint64_t)functionTypeDiscrete | *((void *)v4 + 5)) {
    char v9 = -[GEOPDClientRankingFeatureFunctionTypeDiscrete isEqual:](functionTypeDiscrete, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

void __59__GEOPDClientRankingFeatureUnit__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDClientRankingFeatureUnit readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD950[v5];
      }
      if (a2) {
        v7 = @"featureType";
      }
      else {
        v7 = @"feature_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      id v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureTypeSource_tags_1045);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v10 = *(id *)(a1 + 32);
    id v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        id v13 = @"featureTypeSource";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        id v13 = @"feature_type_source";
      }
      [v4 setObject:v12 forKey:v13];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureTypeResult_tags_1046);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v16 = *(id *)(a1 + 24);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"featureTypeResult";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"feature_type_result";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      uint64_t v20 = *(int *)(a1 + 72);
      if (v20 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E53DD970[v20];
      }
      if (a2) {
        v22 = @"functionType";
      }
      else {
        v22 = @"function_type";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = -[GEOPDClientRankingFeatureUnit functionTypeLinear]((id *)a1);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"functionTypeLinear";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"function_type_linear";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDClientRankingFeatureUnit functionTypeDiscrete]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"functionTypeDiscrete";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"function_type_discrete";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __59__GEOPDClientRankingFeatureUnit__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionTypeLinear, 0);
  objc_storeStrong((id *)&self->_functionTypeDiscrete, 0);
  objc_storeStrong((id *)&self->_featureTypeSource, 0);
  objc_storeStrong((id *)&self->_featureTypeResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_featureTypeSource)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_featureTypeResult)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_functionTypeLinear)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_functionTypeDiscrete)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
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
        v6 = (int *)&readAll__recursiveTag_1049;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_1050;
      }
      GEOPDClientRankingFeatureUnitReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDClientRankingFeatureUnit)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientRankingFeatureUnit;
  v2 = [(GEOPDClientRankingFeatureUnit *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDClientRankingFeatureUnit)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientRankingFeatureUnit;
  v3 = [(GEOPDClientRankingFeatureUnit *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)functionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readFunctionTypeLinear
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFunctionTypeLinear_tags_1047);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)functionTypeLinear
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDClientRankingFeatureUnit _readFunctionTypeLinear]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFunctionTypeDiscrete
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientRankingFeatureUnitReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFunctionTypeDiscrete_tags_1048);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)functionTypeDiscrete
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDClientRankingFeatureUnit _readFunctionTypeDiscrete]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureUnit;
  id v4 = [(GEOPDClientRankingFeatureUnit *)&v8 description];
  id v5 = [(GEOPDClientRankingFeatureUnit *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureUnit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureUnit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureUnitReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOPDClientRankingFeatureUnit readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_featureType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDClientRankingFeatureTypeSource *)self->_featureTypeSource hash];
  unint64_t v5 = [(GEOPDClientRankingFeatureTypeResult *)self->_featureTypeResult hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_functionType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)self->_functionTypeLinear hash];
  return v7 ^ v8 ^ [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)self->_functionTypeDiscrete hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    *(unsigned char *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDClientRankingFeatureUnit readAll:](a1, 0);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      uint64_t v7 = *(void *)(a1 + 24);
      if (v7)
      {
        unint64_t v8 = *(void **)(v7 + 8);
        *(void *)(v7 + 8) = 0;
      }
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9)
      {
        id v10 = *(void **)(v9 + 8);
        *(void *)(v9 + 8) = 0;
      }
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11)
      {
        v12 = *(void **)(v11 + 8);
        *(void *)(v11 + 8) = 0;
      }
    }
  }
}

@end