@interface GEOTransitVehiclePositionInfo
+ (BOOL)isValid:(id)a3;
+ (Class)departureEntryType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitVehiclePositionInfo)initWithDictionary:(id)a3;
- (GEOTransitVehiclePositionInfo)initWithJSON:(id)a3;
- (NSArray)tripIDs;
- (NSArray)upcomingTripIDs;
- (NSMutableArray)departureEntrys;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)departureEntryAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)departureEntrysCount;
- (unint64_t)firstTripID;
- (unint64_t)hash;
- (unint64_t)tripIDForNextUpcomingDeparture;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addDepartureEntry:(id)a3;
- (void)clearDepartureEntrys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDepartureEntrys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitVehiclePositionInfo

- (NSMutableArray)departureEntrys
{
  return self->_departureEntrys;
}

- (void)setDepartureEntrys:(id)a3
{
}

- (void)clearDepartureEntrys
{
}

- (void)addDepartureEntry:(id)a3
{
  id v4 = a3;
  departureEntrys = self->_departureEntrys;
  id v8 = v4;
  if (!departureEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_departureEntrys;
    self->_departureEntrys = v6;

    id v4 = v8;
    departureEntrys = self->_departureEntrys;
  }
  [(NSMutableArray *)departureEntrys addObject:v4];
}

- (unint64_t)departureEntrysCount
{
  return [(NSMutableArray *)self->_departureEntrys count];
}

- (id)departureEntryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_departureEntrys objectAtIndex:a3];
}

+ (Class)departureEntryType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitVehiclePositionInfo;
  id v4 = [(GEOTransitVehiclePositionInfo *)&v8 description];
  v5 = [(GEOTransitVehiclePositionInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitVehiclePositionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"departureEntry";
      }
      else {
        v13 = @"departure_entry";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __59__GEOTransitVehiclePositionInfo__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOTransitVehiclePositionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitVehiclePositionInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitVehiclePositionInfo)initWithDictionary:(id)a3
{
  return (GEOTransitVehiclePositionInfo *)-[GEOTransitVehiclePositionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"departureEntry";
      }
      else {
        id v6 = @"departure_entry";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v5;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOTransitDepartureEntry alloc];
                if (a3) {
                  uint64_t v15 = [(GEOTransitDepartureEntry *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOTransitDepartureEntry *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addDepartureEntry:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }

        id v5 = v18;
      }
    }
  }

  return a1;
}

- (GEOTransitVehiclePositionInfo)initWithJSON:(id)a3
{
  return (GEOTransitVehiclePositionInfo *)-[GEOTransitVehiclePositionInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitVehiclePositionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitVehiclePositionInfoReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_departureEntrys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOTransitVehiclePositionInfo *)self readAll:0];
  if ([(GEOTransitVehiclePositionInfo *)self departureEntrysCount])
  {
    [v8 clearDepartureEntrys];
    unint64_t v4 = [(GEOTransitVehiclePositionInfo *)self departureEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitVehiclePositionInfo *)self departureEntryAtIndex:i];
        [v8 addDepartureEntry:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_departureEntrys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addDepartureEntry:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOTransitVehiclePositionInfo *)self readAll:1];
    [v4 readAll:1];
    departureEntrys = self->_departureEntrys;
    if ((unint64_t)departureEntrys | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](departureEntrys, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOTransitVehiclePositionInfo *)self readAll:1];
  departureEntrys = self->_departureEntrys;

  return [(NSMutableArray *)departureEntrys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOTransitVehiclePositionInfo addDepartureEntry:](self, "addDepartureEntry:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitVehiclePositionInfo *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_departureEntrys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureEntrys, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (unint64_t)firstTripID
{
  v2 = [(GEOTransitVehiclePositionInfo *)self departureEntrys];
  BOOL v3 = [v2 firstObject];

  if (v3 && [v3 hasTripMuid]) {
    unint64_t v4 = [v3 tripMuid];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (unint64_t)tripIDForNextUpcomingDeparture
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(GEOTransitVehiclePositionInfo *)self departureEntrysCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(GEOTransitVehiclePositionInfo *)self departureEntrys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 hasDepartureTime]
          && [v10 hasTripMuid]
          && v4 <= (double)[v10 departureTime])
        {
          unint64_t v11 = [v10 tripMuid];
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v11;
}

- (NSArray)tripIDs
{
  if ([(GEOTransitVehiclePositionInfo *)self departureEntrysCount])
  {
    double v3 = [(GEOTransitVehiclePositionInfo *)self departureEntrys];
    double v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_552];
    id v5 = [v3 filteredArrayUsingPredicate:v4];

    uint64_t v6 = [v5 valueForKey:@"tripMuid"];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

uint64_t __66__GEOTransitVehiclePositionInfo_GEOTransitExtrasInternal__tripIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasTripMuid];
}

- (NSArray)upcomingTripIDs
{
  if ([(GEOTransitVehiclePositionInfo *)self departureEntrysCount])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3 - GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1E9114298);
    id v5 = [(GEOTransitVehiclePositionInfo *)self departureEntrys];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__GEOTransitVehiclePositionInfo_GEOTransitExtrasInternal__upcomingTripIDs__block_invoke;
    v10[3] = &__block_descriptor_40_e51_B24__0__GEOTransitDepartureEntry_8__NSDictionary_16l;
    *(double *)&v10[4] = v4;
    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
    uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

    uint64_t v8 = [v7 valueForKey:@"tripMuid"];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v8;
}

BOOL __74__GEOTransitVehiclePositionInfo_GEOTransitExtrasInternal__upcomingTripIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 hasDepartureTime]
    && [v3 hasTripMuid]
    && *(double *)(a1 + 32) <= (double)[v3 departureTime];

  return v4;
}

@end