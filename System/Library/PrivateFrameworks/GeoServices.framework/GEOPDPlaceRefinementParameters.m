@interface GEOPDPlaceRefinementParameters
- (BOOL)_hasRequiredFields;
- (BOOL)_routeHypothesisPlaceRefinementParametersIsEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceRefinementParameters)init;
- (GEOPDPlaceRefinementParameters)initWithData:(id)a3;
- (GEOPDPlaceRefinementParameters)initWithIdentifier:(id)a3 placeNameHint:(id)a4 locationHint:(id)a5;
- (GEOPDPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4;
- (GEOPDPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressHint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedAddressLineHints;
- (id)jsonRepresentation;
- (id)locationHint;
- (id)placeNameHint;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearFormattedAddressLineHints;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)_routeHypothesisPlaceRefinementParametersHash;
- (unint64_t)hash;
- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1;
- (void)_readAddressHint;
- (void)_readFormattedAddressLineHints;
- (void)_readLocationHint;
- (void)_readMapsId;
- (void)_readPlaceNameHint;
- (void)addFormattedAddressLineHint:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddressHint:(uint64_t)a1;
- (void)setAddressObjectHint:(uint64_t)a1;
- (void)setFormattedAddressLineHints:(uint64_t)a1;
- (void)setLocationHint:(uint64_t)a1;
- (void)setMapsId:(uint64_t)a1;
- (void)setPlaceNameHint:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceRefinementParameters

- (GEOPDPlaceRefinementParameters)initWithIdentifier:(id)a3 placeNameHint:(id)a4 locationHint:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRefinementParameters;
  v11 = [(GEOPDPlaceRefinementParameters *)&v19 init];
  if (v11)
  {
    if (v9)
    {
      v12 = [v9 mapsIdentifier];
      -[GEOPDPlaceRefinementParameters setMapsId:]((uint64_t)v11, v12);

      if ([v9 muid])
      {
        uint64_t v13 = [v9 muid];
        *(_WORD *)&v11->_flags |= 0x1000u;
        *(_WORD *)&v11->_flags |= 1u;
        v11->_muid = v13;
      }
      int v14 = [v9 resultProviderID];
      if (!v14)
      {
        v15 = +[GEOMapService sharedService];
        int v14 = [v15 localSearchProviderID];
      }
      *(_WORD *)&v11->_flags |= 0x1000u;
      *(_WORD *)&v11->_flags |= 8u;
      v11->_resultProviderId = v14;
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v16 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDPlaceRefinementParameters setLocationHint:]((uint64_t)v11, v16);
    }
    if ([v10 length]) {
      -[GEOPDPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v11, v10);
    }
    v17 = v11;
  }

  return v11;
}

- (void)setPlaceNameHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x800u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setLocationHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x200u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setMapsId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x400u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_addressObjectHint, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)formattedAddressLineHints
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRefinementParameters _readFormattedAddressLineHints]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readFormattedAddressLineHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setAddressObjectHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)placeNameHint
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRefinementParameters _readPlaceNameHint]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)locationHint
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRefinementParameters _readLocationHint]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)addressHint
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPlaceRefinementParameters _readAddressHint]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceNameHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceNameHint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)_readLocationHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationHint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)_readAddressHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressHint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (GEOPDPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  v8 = [v7 _identifier];
  id v9 = [v7 name];
  id v10 = -[GEOPDPlaceRefinementParameters initWithIdentifier:placeNameHint:locationHint:](self, "initWithIdentifier:placeNameHint:locationHint:", v8, v9, var0, var1);

  if (!v10) {
    goto LABEL_15;
  }
  v11 = [v7 geoAddress];
  if ([v11 hasStructuredAddress])
  {
    v12 = [v11 structuredAddress];
    -[GEOPDPlaceRefinementParameters setAddressHint:]((uint64_t)v10, v12);
  }
  if ([v11 formattedAddressLinesCount])
  {
    uint64_t v13 = [v11 formattedAddressLines];
    -[GEOPDPlaceRefinementParameters setFormattedAddressLineHints:]((uint64_t)v10, v13);
  }
  int v14 = [v7 addressObject];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 rawBytes];
    if ([v16 length]) {
      -[GEOPDPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v10, v16);
    }
  }
  unsigned int v17 = [v7 _addressGeocodeAccuracy];
  if (v17 >= 6)
  {
    if (v17 == -1) {
      goto LABEL_12;
    }
    unsigned int v17 = -1;
  }
  *(_WORD *)&v10->_flags |= 0x1000u;
  *(_WORD *)&v10->_flags |= 2u;
  v10->_addressGeocodeAccuracyHint = v17;
LABEL_12:
  int v18 = [v7 _placeType];
  if (v18)
  {
    int v19 = _PDPlaceTypeForMapItemPlaceType(v18);
    *(_WORD *)&v10->_flags |= 0x1000u;
    *(_WORD *)&v10->_flags |= 4u;
    v10->_placeTypeHint = v19;
  }
  *(_WORD *)&v10->_flags |= 0x1000u;
  *(_WORD *)&v10->_flags |= 0x10u;
  v10->_supportCoordinatesOnlyRefinement = 1;
  v20 = v10;

LABEL_15:
  return v10;
}

- (void)setFormattedAddressLineHints:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setAddressHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x40u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDPlaceRefinementParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRefinementParameters;
  v2 = [(GEOPDPlaceRefinementParameters *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FC0) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 0);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_locationHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeNameHint) {
      PBDataWriterWriteStringField();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_formattedAddressLineHints;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_addressObjectHint) {
      PBDataWriterWriteDataField();
    }
    if ((*(_WORD *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (unint64_t)hash
{
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v15 = 2654435761 * self->_resultProviderId;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (flags)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOLatLng *)self->_locationHint hash];
  unint64_t v6 = [(GEOStructuredAddress *)self->_addressHint hash];
  NSUInteger v7 = [(NSString *)self->_placeNameHint hash];
  uint64_t v8 = [(NSMutableArray *)self->_formattedAddressLineHints hash];
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_placeTypeHint;
    if ((v9 & 2) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 2) != 0)
    {
LABEL_8:
      uint64_t v11 = 2654435761 * self->_addressGeocodeAccuracyHint;
      goto LABEL_11;
    }
  }
  uint64_t v11 = 0;
LABEL_11:
  uint64_t v12 = [(NSData *)self->_addressObjectHint hash];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    uint64_t v13 = 2654435761 * self->_supportCoordinatesOnlyRefinement;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(GEOPDMapsIdentifier *)self->_mapsId hash];
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        unint64_t v6 = (int *)&readAll__recursiveTag_5169;
      }
      else {
        unint64_t v6 = (int *)&readAll__nonRecursiveTag_5170;
      }
      GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 48) readAll:1];
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (GEOPDPlaceRefinementParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRefinementParameters;
  id v3 = [(GEOPDPlaceRefinementParameters *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)clearFormattedAddressLineHints
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 88));
    *(_WORD *)(v1 + 108) |= 0x1000u;
    v2 = *(void **)(v1 + 40);
    return [v2 removeAllObjects];
  }
  return result;
}

- (void)addFormattedAddressLineHint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPlaceRefinementParameters _readFormattedAddressLineHints](a1);
    -[GEOPDPlaceRefinementParameters _addNoFlagsFormattedAddressLineHint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 108) |= 0x1000u;
  }
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceRefinementParameters;
  unint64_t v4 = [(GEOPDPlaceRefinementParameters *)&v8 description];
  id v5 = [(GEOPDPlaceRefinementParameters *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceRefinementParameters readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 108);
    if ((v5 & 8) != 0)
    {
      unint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
      if (a2) {
        objc_super v7 = @"resultProviderId";
      }
      else {
        objc_super v7 = @"result_provider_id";
      }
      [v4 setObject:v6 forKey:v7];

      __int16 v5 = *(_WORD *)(a1 + 108);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    __int16 v9 = -[GEOPDPlaceRefinementParameters locationHint]((id *)a1);
    uint64_t v10 = v9;
    if (v9)
    {
      if (a2)
      {
        uint64_t v11 = [v9 jsonRepresentation];
        uint64_t v12 = @"locationHint";
      }
      else
      {
        uint64_t v11 = [v9 dictionaryRepresentation];
        uint64_t v12 = @"location_hint";
      }
      [v4 setObject:v11 forKey:v12];
    }
    uint64_t v13 = -[GEOPDPlaceRefinementParameters addressHint]((id *)a1);
    long long v14 = v13;
    if (v13)
    {
      if (a2)
      {
        uint64_t v15 = [v13 jsonRepresentation];
        long long v16 = @"addressHint";
      }
      else
      {
        uint64_t v15 = [v13 dictionaryRepresentation];
        long long v16 = @"address_hint";
      }
      [v4 setObject:v15 forKey:v16];
    }
    long long v17 = -[GEOPDPlaceRefinementParameters placeNameHint]((id *)a1);
    if (v17)
    {
      if (a2) {
        int v18 = @"placeNameHint";
      }
      else {
        int v18 = @"place_name_hint";
      }
      [v4 setObject:v17 forKey:v18];
    }

    if (*(void *)(a1 + 40))
    {
      uint64_t v19 = -[GEOPDPlaceRefinementParameters formattedAddressLineHints]((id *)a1);
      if (a2) {
        v20 = @"formattedAddressLineHint";
      }
      else {
        v20 = @"formatted_address_line_hint";
      }
      [v4 setObject:v19 forKey:v20];
    }
    __int16 v21 = *(_WORD *)(a1 + 108);
    if ((v21 & 4) != 0)
    {
      int v22 = *(_DWORD *)(a1 + 96);
      switch(v22)
      {
        case '#':
          v23 = @"TIME_ZONE";
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
LABEL_36:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 96));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          v23 = @"SUB_LOCALITY";
          break;
        case ',':
          v23 = @"OCEAN";
          break;
        case '-':
          v23 = @"AOI";
          break;
        case '.':
          v23 = @"INLAND_WATER";
          break;
        case '/':
          v23 = @"BUSINESS";
          break;
        case '0':
          v23 = @"ISLAND";
          break;
        case '1':
          v23 = @"STREET";
          break;
        case '2':
          v23 = @"ADMIN";
          break;
        case '3':
          v23 = @"POSTAL";
          break;
        case '6':
          v23 = @"INTERSECTION";
          break;
        case '7':
          v23 = @"BUILDING";
          break;
        case '9':
          v23 = @"ADDRESS";
          break;
        case '=':
          v23 = @"CONTINENT";
          break;
        case '?':
          v23 = @"REGION";
          break;
        case '@':
          v23 = @"DIVISION";
          break;
        case 'A':
          v23 = @"PHYSICAL_FEATURE";
          break;
        default:
          v23 = @"UNKNOWN_PLACE_TYPE";
          switch(v22)
          {
            case 0:
              goto LABEL_55;
            case 1:
              v23 = @"COUNTRY";
              break;
            case 2:
              v23 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_36;
            case 4:
              v23 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v22 != 16) {
                goto LABEL_36;
              }
              v23 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_55:
      if (a2) {
        v24 = @"placeTypeHint";
      }
      else {
        v24 = @"place_type_hint";
      }
      [v4 setObject:v23 forKey:v24];

      __int16 v21 = *(_WORD *)(a1 + 108);
    }
    if ((v21 & 2) != 0)
    {
      uint64_t v25 = *(int *)(a1 + 92);
      if (v25 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = off_1E53DD210[v25];
      }
      if (a2) {
        v27 = @"addressGeocodeAccuracyHint";
      }
      else {
        v27 = @"address_geocode_accuracy_hint";
      }
      [v4 setObject:v26 forKey:v27];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v28 = *(void **)(a1 + 8);
      if (v28)
      {
        id v29 = v28;
        objc_sync_enter(v29);
        GEOPDPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObjectHint_tags);
        objc_sync_exit(v29);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v30 = *(id *)(a1 + 32);
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 base64EncodedStringWithOptions:0];
        [v4 setObject:v32 forKey:@"addressObjectHint"];
      }
      else
      {
        [v4 setObject:v30 forKey:@"address_object_hint"];
      }
    }

    if ((*(_WORD *)(a1 + 108) & 0x10) != 0)
    {
      v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
      if (a2) {
        v34 = @"supportCoordinatesOnlyRefinement";
      }
      else {
        v34 = @"support_coordinates_only_refinement";
      }
      [v4 setObject:v33 forKey:v34];
    }
    -[GEOPDPlaceRefinementParameters _readMapsId](a1);
    id v35 = *(id *)(a1 + 56);
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"mapsId";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"maps_id";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = *(void **)(a1 + 16);
    if (v39)
    {
      v40 = [v39 dictionaryRepresentation];
      v41 = v40;
      if (a2)
      {
        v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __60__GEOPDPlaceRefinementParameters__dictionaryRepresentation___block_invoke;
        v46[3] = &unk_1E53D8860;
        id v43 = v42;
        id v47 = v43;
        [v41 enumerateKeysAndObjectsUsingBlock:v46];
        id v44 = v43;

        v41 = v44;
      }
      [v4 setObject:v41 forKey:@"Unknown Fields"];
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
  return -[GEOPDPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDPlaceRefinementParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_138;
  }
  a1 = [(id)a1 init];
  if (!a1) {
    goto LABEL_138;
  }
  if (a3) {
    unint64_t v6 = @"resultProviderId";
  }
  else {
    unint64_t v6 = @"result_provider_id";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v7 intValue];
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 8u;
    *(_DWORD *)(a1 + 100) = v8;
  }

  __int16 v9 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 unsignedLongLongValue];
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 1u;
    *(void *)(a1 + 64) = v10;
  }

  if (a3) {
    uint64_t v11 = @"locationHint";
  }
  else {
    uint64_t v11 = @"location_hint";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [GEOLatLng alloc];
    if (a3) {
      long long v14 = [(GEOLatLng *)v13 initWithJSON:v12];
    }
    else {
      long long v14 = [(GEOLatLng *)v13 initWithDictionary:v12];
    }
    uint64_t v15 = v14;
    -[GEOPDPlaceRefinementParameters setLocationHint:](a1, v14);
  }
  if (a3) {
    long long v16 = @"addressHint";
  }
  else {
    long long v16 = @"address_hint";
  }
  long long v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v18 = [GEOStructuredAddress alloc];
    if (a3) {
      uint64_t v19 = [(GEOStructuredAddress *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOStructuredAddress *)v18 initWithDictionary:v17];
    }
    v20 = v19;
    -[GEOPDPlaceRefinementParameters setAddressHint:](a1, v19);
  }
  if (a3) {
    __int16 v21 = @"placeNameHint";
  }
  else {
    __int16 v21 = @"place_name_hint";
  }
  int v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[v22 copy];
    -[GEOPDPlaceRefinementParameters setPlaceNameHint:](a1, v23);
  }
  if (a3) {
    v24 = @"formattedAddressLineHint";
  }
  else {
    v24 = @"formatted_address_line_hint";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = objc_msgSend(v31, "copy", (void)v53);
            -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](a1, v32);
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v28);
    }
  }
  if (a3) {
    v33 = @"placeTypeHint";
  }
  else {
    v33 = @"place_type_hint";
  }
  v34 = objc_msgSend(v5, "objectForKeyedSubscript:", v33, (void)v53);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v34;
    if ([v35 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
    {
      int v36 = 0;
    }
    else if ([v35 isEqualToString:@"COUNTRY"])
    {
      int v36 = 1;
    }
    else if ([v35 isEqualToString:@"ADMINISTRATIVE_AREA"])
    {
      int v36 = 2;
    }
    else if ([v35 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
    {
      int v36 = 4;
    }
    else if ([v35 isEqualToString:@"LOCALITY"])
    {
      int v36 = 16;
    }
    else if ([v35 isEqualToString:@"TIME_ZONE"])
    {
      int v36 = 35;
    }
    else if ([v35 isEqualToString:@"SUB_LOCALITY"])
    {
      int v36 = 43;
    }
    else if ([v35 isEqualToString:@"OCEAN"])
    {
      int v36 = 44;
    }
    else if ([v35 isEqualToString:@"AOI"])
    {
      int v36 = 45;
    }
    else if ([v35 isEqualToString:@"INLAND_WATER"])
    {
      int v36 = 46;
    }
    else if ([v35 isEqualToString:@"BUSINESS"])
    {
      int v36 = 47;
    }
    else if ([v35 isEqualToString:@"ISLAND"])
    {
      int v36 = 48;
    }
    else if ([v35 isEqualToString:@"STREET"])
    {
      int v36 = 49;
    }
    else if ([v35 isEqualToString:@"ADMIN"])
    {
      int v36 = 50;
    }
    else if ([v35 isEqualToString:@"POSTAL"])
    {
      int v36 = 51;
    }
    else if ([v35 isEqualToString:@"INTERSECTION"])
    {
      int v36 = 54;
    }
    else if ([v35 isEqualToString:@"BUILDING"])
    {
      int v36 = 55;
    }
    else if ([v35 isEqualToString:@"ADDRESS"])
    {
      int v36 = 57;
    }
    else if ([v35 isEqualToString:@"CONTINENT"])
    {
      int v36 = 61;
    }
    else if ([v35 isEqualToString:@"REGION"])
    {
      int v36 = 63;
    }
    else if ([v35 isEqualToString:@"DIVISION"])
    {
      int v36 = 64;
    }
    else if ([v35 isEqualToString:@"PHYSICAL_FEATURE"])
    {
      int v36 = 65;
    }
    else
    {
      int v36 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_98;
    }
    int v36 = [v34 intValue];
  }
  *(_WORD *)(a1 + 108) |= 0x1000u;
  *(_WORD *)(a1 + 108) |= 4u;
  *(_DWORD *)(a1 + 96) = v36;
LABEL_98:

  if (a3) {
    v37 = @"addressGeocodeAccuracyHint";
  }
  else {
    v37 = @"address_geocode_accuracy_hint";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v38;
    if ([v39 isEqualToString:@"POINT"])
    {
      int v40 = 0;
    }
    else if ([v39 isEqualToString:@"INTERPOLATION"])
    {
      int v40 = 1;
    }
    else if ([v39 isEqualToString:@"APPROXIMATE"])
    {
      int v40 = 2;
    }
    else if ([v39 isEqualToString:@"POSTAL_ZIP"])
    {
      int v40 = 3;
    }
    else if ([v39 isEqualToString:@"PARCEL"])
    {
      int v40 = 4;
    }
    else if ([v39 isEqualToString:@"SUBPREMISE"])
    {
      int v40 = 5;
    }
    else
    {
      int v40 = 0;
    }

    goto LABEL_118;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v40 = [v38 intValue];
LABEL_118:
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 2u;
    *(_DWORD *)(a1 + 92) = v40;
  }

  if (a3) {
    v41 = @"addressObjectHint";
  }
  else {
    v41 = @"address_object_hint";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v42 options:0];
    -[GEOPDPlaceRefinementParameters setAddressObjectHint:](a1, v43);
  }
  if (a3) {
    id v44 = @"supportCoordinatesOnlyRefinement";
  }
  else {
    id v44 = @"support_coordinates_only_refinement";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v46 = [v45 BOOLValue];
    *(_WORD *)(a1 + 108) |= 0x1000u;
    *(_WORD *)(a1 + 108) |= 0x10u;
    *(unsigned char *)(a1 + 104) = v46;
  }

  if (a3) {
    id v47 = @"mapsId";
  }
  else {
    id v47 = @"maps_id";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      v50 = [(GEOPDMapsIdentifier *)v49 initWithJSON:v48];
    }
    else {
      v50 = [(GEOPDMapsIdentifier *)v49 initWithDictionary:v48];
    }
    v51 = v50;
    -[GEOPDPlaceRefinementParameters setMapsId:](a1, v50);
  }
LABEL_138:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceRefinementParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDPlaceRefinementParameters _readLocationHint](result);
    if ([*(id *)(v3 + 48) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceRefinementParameters _readMapsId](v3);
      unint64_t v4 = *(void **)(v3 + 56);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceRefinementParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_resultProviderId;
    *(_WORD *)(v5 + 108) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  id v10 = [(GEOLatLng *)self->_locationHint copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(GEOStructuredAddress *)self->_addressHint copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_placeNameHint copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v16 = self->_formattedAddressLineHints;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](v5, v20);
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  __int16 v21 = (__int16)self->_flags;
  if ((v21 & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_placeTypeHint;
    *(_WORD *)(v5 + 108) |= 4u;
    __int16 v21 = (__int16)self->_flags;
  }
  if ((v21 & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  uint64_t v22 = -[NSData copyWithZone:](self->_addressObjectHint, "copyWithZone:", a3, (void)v28);
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_supportCoordinatesOnlyRefinement;
    *(_WORD *)(v5 + 108) |= 0x10u;
  }
  id v24 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  id v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 25)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 8)) {
      goto LABEL_37;
    }
  }
  else if (v6)
  {
    goto LABEL_37;
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((void *)v4 + 6) && !-[GEOLatLng isEqual:](locationHint, "isEqual:")) {
    goto LABEL_37;
  }
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((void *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:")) {
      goto LABEL_37;
    }
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:")) {
      goto LABEL_37;
    }
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:")) {
      goto LABEL_37;
    }
  }
  __int16 v11 = (__int16)self->_flags;
  __int16 v12 = *((_WORD *)v4 + 54);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 24)) {
      goto LABEL_37;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 23)) {
      goto LABEL_37;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_37;
  }
  addressObjectHint = self->_addressObjectHint;
  if ((unint64_t)addressObjectHint | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](addressObjectHint, "isEqual:")) {
      goto LABEL_37;
    }
    __int16 v11 = (__int16)self->_flags;
    __int16 v12 = *((_WORD *)v4 + 54);
  }
  if ((v11 & 0x10) == 0)
  {
    if ((v12 & 0x10) == 0) {
      goto LABEL_43;
    }
LABEL_37:
    char v14 = 0;
    goto LABEL_38;
  }
  if ((v12 & 0x10) == 0) {
    goto LABEL_37;
  }
  if (!self->_supportCoordinatesOnlyRefinement)
  {
    if (!*((unsigned char *)v4 + 104)) {
      goto LABEL_43;
    }
    goto LABEL_37;
  }
  if (!*((unsigned char *)v4 + 104)) {
    goto LABEL_37;
  }
LABEL_43:
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 7)) {
    char v14 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_38:

  return v14;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    -[GEOPDPlaceRefinementParameters readAll:]((uint64_t)v3, 0);
    __int16 v5 = *((_WORD *)v4 + 54);
    if ((v5 & 8) != 0)
    {
      *(_DWORD *)(a1 + 100) = *((_DWORD *)v4 + 25);
      *(_WORD *)(a1 + 108) |= 8u;
      __int16 v5 = *((_WORD *)v4 + 54);
    }
    if (v5)
    {
      *(void *)(a1 + 64) = *((void *)v4 + 8);
      *(_WORD *)(a1 + 108) |= 1u;
    }
    __int16 v6 = *(void **)(a1 + 48);
    uint64_t v7 = *((void *)v4 + 6);
    if (v6)
    {
      if (v7) {
        objc_msgSend(v6, "mergeFrom:");
      }
    }
    else if (v7)
    {
      -[GEOPDPlaceRefinementParameters setLocationHint:](a1, *((void **)v4 + 6));
    }
    id v8 = *(void **)(a1 + 24);
    uint64_t v9 = *((void *)v4 + 3);
    if (v8)
    {
      if (v9) {
        objc_msgSend(v8, "mergeFrom:");
      }
    }
    else if (v9)
    {
      -[GEOPDPlaceRefinementParameters setAddressHint:](a1, *((void **)v4 + 3));
    }
    id v10 = (void *)*((void *)v4 + 9);
    if (v10) {
      -[GEOPDPlaceRefinementParameters setPlaceNameHint:](a1, v10);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *((id *)v4 + 5);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          -[GEOPDPlaceRefinementParameters addFormattedAddressLineHint:](a1, *(void **)(*((void *)&v20 + 1) + 8 * i));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    __int16 v16 = *((_WORD *)v4 + 54);
    if ((v16 & 4) != 0)
    {
      *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
      *(_WORD *)(a1 + 108) |= 4u;
      __int16 v16 = *((_WORD *)v4 + 54);
    }
    if ((v16 & 2) != 0)
    {
      *(_DWORD *)(a1 + 92) = *((_DWORD *)v4 + 23);
      *(_WORD *)(a1 + 108) |= 2u;
    }
    uint64_t v17 = (void *)*((void *)v4 + 4);
    if (v17) {
      -[GEOPDPlaceRefinementParameters setAddressObjectHint:](a1, v17);
    }
    if ((*((_WORD *)v4 + 54) & 0x10) != 0)
    {
      *(unsigned char *)(a1 + 104) = *((unsigned char *)v4 + 104);
      *(_WORD *)(a1 + 108) |= 0x10u;
    }
    uint64_t v18 = *(void **)(a1 + 56);
    uint64_t v19 = *((void *)v4 + 7);
    if (v18)
    {
      if (v19) {
        [v18 mergeFrom:(void)v20];
      }
    }
    else if (v19)
    {
      -[GEOPDPlaceRefinementParameters setMapsId:](a1, *((void **)v4 + 7));
    }
  }
}

- (BOOL)_hasRequiredFields
{
  if (self)
  {
    v2 = self;
    -[GEOPDPlaceRefinementParameters _readLocationHint]((uint64_t)self);
    LOBYTE(self) = v2->_locationHint != 0;
  }
  return (char)self;
}

- (unint64_t)_routeHypothesisPlaceRefinementParametersHash
{
  if (![(GEOPDPlaceRefinementParameters *)self _hasRequiredFields]) {
    return 1;
  }
  id v3 = -[GEOPDPlaceRefinementParameters locationHint]((id *)&self->super.super.isa);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)_routeHypothesisPlaceRefinementParametersIsEqual:(id)a3
{
  unint64_t v4 = (id *)a3;
  if ([(GEOPDPlaceRefinementParameters *)self _hasRequiredFields]
    && ([v4 _hasRequiredFields] & 1) != 0)
  {
    __int16 v5 = -[GEOPDPlaceRefinementParameters locationHint]((id *)&self->super.super.isa);
    __int16 v6 = -[GEOPDPlaceRefinementParameters locationHint](v4);
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (GEOPDPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 coordinate];
  }
  else {
    double v9 = -180.0;
  }
  id v10 = [(GEOPDPlaceRefinementParameters *)self initWithIdentifier:v8 placeNameHint:v6 locationHint:v9];

  return v10;
}

@end