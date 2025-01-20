@interface GEOPDBatchReverseGeocodingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBatchReverseGeocodingParameters)init;
- (GEOPDBatchReverseGeocodingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)assetLocations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAssetLocation:(uint64_t)a1;
- (void)_readAdditionalPlaceTypes;
- (void)_readAssetLocations;
- (void)addAdditionalPlaceType:(uint64_t)a1;
- (void)addAssetLocation:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setAssetLocations:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBatchReverseGeocodingParameters

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
        v6 = (int *)&readAll__recursiveTag_2155;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2156;
      }
      GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDBatchReverseGeocodingParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 1),
         -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)v4, 1),
         assetLocations = self->_assetLocations,
         !((unint64_t)assetLocations | v4[6]))
     || -[NSMutableArray isEqual:](assetLocations, "isEqual:")))
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
  -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_assetLocations hash];
  return PBRepeatedInt32Hash() ^ v3;
}

- (GEOPDBatchReverseGeocodingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  v2 = [(GEOPDBatchReverseGeocodingParameters *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBatchReverseGeocodingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  uint64_t v3 = [(GEOPDBatchReverseGeocodingParameters *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  [(GEOPDBatchReverseGeocodingParameters *)&v3 dealloc];
}

- (void)_readAssetLocations
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
        GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAssetLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)assetLocations
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDBatchReverseGeocodingParameters _readAssetLocations]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAssetLocations:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 8u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)addAssetLocation:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBatchReverseGeocodingParameters _readAssetLocations](a1);
    -[GEOPDBatchReverseGeocodingParameters _addNoFlagsAssetLocation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 8u;
  }
}

- (void)_addNoFlagsAssetLocation:(uint64_t)a1
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

- (void)_readAdditionalPlaceTypes
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
        GEOPDBatchReverseGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addAdditionalPlaceType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 8u;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBatchReverseGeocodingParameters;
  id v4 = [(GEOPDBatchReverseGeocodingParameters *)&v8 description];
  id v5 = [(GEOPDBatchReverseGeocodingParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBatchReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDBatchReverseGeocodingParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"assetLocation";
      }
      else {
        v13 = @"asset_location";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if (*(void *)(a1 + 32))
    {
      v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v15 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = *(unsigned int *)(*v15 + 4 * v16);
          switch((int)v17)
          {
            case '#':
              v18 = @"TIME_ZONE";
              break;
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '4':
            case '5':
            case '8':
            case ':':
            case ';':
            case '<':
            case '>':
LABEL_26:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
            case '+':
              v18 = @"SUB_LOCALITY";
              break;
            case ',':
              v18 = @"OCEAN";
              break;
            case '-':
              v18 = @"AOI";
              break;
            case '.':
              v18 = @"INLAND_WATER";
              break;
            case '/':
              v18 = @"BUSINESS";
              break;
            case '0':
              v18 = @"ISLAND";
              break;
            case '1':
              v18 = @"STREET";
              break;
            case '2':
              v18 = @"ADMIN";
              break;
            case '3':
              v18 = @"POSTAL";
              break;
            case '6':
              v18 = @"INTERSECTION";
              break;
            case '7':
              v18 = @"BUILDING";
              break;
            case '9':
              v18 = @"ADDRESS";
              break;
            case '=':
              v18 = @"CONTINENT";
              break;
            case '?':
              v18 = @"REGION";
              break;
            case '@':
              v18 = @"DIVISION";
              break;
            case 'A':
              v18 = @"PHYSICAL_FEATURE";
              break;
            default:
              v18 = @"UNKNOWN_PLACE_TYPE";
              switch((int)v17)
              {
                case 0:
                  goto LABEL_45;
                case 1:
                  v18 = @"COUNTRY";
                  break;
                case 2:
                  v18 = @"ADMINISTRATIVE_AREA";
                  break;
                case 3:
                  goto LABEL_26;
                case 4:
                  v18 = @"SUB_ADMINISTRATIVE_AREA";
                  break;
                default:
                  if (v17 != 16) {
                    goto LABEL_26;
                  }
                  v18 = @"LOCALITY";
                  break;
              }
              break;
          }
LABEL_45:
          [v14 addObject:v18];

          ++v16;
          v15 = (void *)(a1 + 24);
        }
        while (v16 < *(void *)(a1 + 32));
      }
      if (a2) {
        v19 = @"additionalPlaceType";
      }
      else {
        v19 = @"additional_place_type";
      }
      [v4 setObject:v14 forKey:v19];
    }
    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__GEOPDBatchReverseGeocodingParameters__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
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
  return -[GEOPDBatchReverseGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDBatchReverseGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  return GEOPDBatchReverseGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_assetLocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_additionalPlaceTypes.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_additionalPlaceTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDBatchReverseGeocodingParametersReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)self, 0);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_assetLocations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        -[GEOPDBatchReverseGeocodingParameters addAssetLocation:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end