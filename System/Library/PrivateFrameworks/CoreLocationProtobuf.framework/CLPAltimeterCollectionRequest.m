@interface CLPAltimeterCollectionRequest
+ (Class)locationsType;
+ (Class)pressureType;
+ (Class)wifiScanType;
- (BOOL)hasCollectionType;
- (BOOL)hasContext;
- (BOOL)hasLocation;
- (BOOL)hasMeta;
- (BOOL)hasStartTimestamp;
- (BOOL)hasStopTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPContext)context;
- (CLPLocation)location;
- (CLPMeta)meta;
- (NSMutableArray)locations;
- (NSMutableArray)pressures;
- (NSMutableArray)wifiScans;
- (double)startTimestamp;
- (double)stopTimestamp;
- (id)collectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationsAtIndex:(unint64_t)a3;
- (id)pressureAtIndex:(unint64_t)a3;
- (id)wifiScanAtIndex:(unint64_t)a3;
- (int)StringAsCollectionType:(id)a3;
- (int)collectionType;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (unint64_t)pressuresCount;
- (unint64_t)wifiScansCount;
- (void)addLocations:(id)a3;
- (void)addPressure:(id)a3;
- (void)addWifiScan:(id)a3;
- (void)clearLocations;
- (void)clearPressures;
- (void)clearWifiScans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionType:(int)a3;
- (void)setContext:(id)a3;
- (void)setHasCollectionType:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setHasStopTimestamp:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocations:(id)a3;
- (void)setMeta:(id)a3;
- (void)setPressures:(id)a3;
- (void)setStartTimestamp:(double)a3;
- (void)setStopTimestamp:(double)a3;
- (void)setWifiScans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPAltimeterCollectionRequest

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (void)setStartTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStopTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_stopTimestamp = a3;
}

- (void)setHasStopTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStopTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)collectionType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_collectionType;
  }
  else {
    return 1;
  }
}

- (void)setCollectionType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_collectionType = a3;
}

- (void)setHasCollectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCollectionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)collectionTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C35D70[a3 - 1];
  }

  return v3;
}

- (int)StringAsCollectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CollectionHVAC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CollectionBiasEstimation"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CollectionSensorCharacterization"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)clearPressures
{
}

- (void)addPressure:(id)a3
{
  id v4 = a3;
  pressures = self->_pressures;
  id v8 = v4;
  if (!pressures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pressures;
    self->_pressures = v6;

    id v4 = v8;
    pressures = self->_pressures;
  }
  [(NSMutableArray *)pressures addObject:v4];
}

- (unint64_t)pressuresCount
{
  return [(NSMutableArray *)self->_pressures count];
}

- (id)pressureAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pressures objectAtIndex:a3];
}

+ (Class)pressureType
{
  return (Class)objc_opt_class();
}

- (void)clearWifiScans
{
}

- (void)addWifiScan:(id)a3
{
  id v4 = a3;
  wifiScans = self->_wifiScans;
  id v8 = v4;
  if (!wifiScans)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_wifiScans;
    self->_wifiScans = v6;

    id v4 = v8;
    wifiScans = self->_wifiScans;
  }
  [(NSMutableArray *)wifiScans addObject:v4];
}

- (unint64_t)wifiScansCount
{
  return [(NSMutableArray *)self->_wifiScans count];
}

- (id)wifiScanAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_wifiScans objectAtIndex:a3];
}

+ (Class)wifiScanType
{
  return (Class)objc_opt_class();
}

- (void)clearLocations
{
}

- (void)addLocations:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableArray *)locations addObject:v4];
}

- (unint64_t)locationsCount
{
  return [(NSMutableArray *)self->_locations count];
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locations objectAtIndex:a3];
}

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPAltimeterCollectionRequest;
  id v4 = [(CLPAltimeterCollectionRequest *)&v8 description];
  v5 = [(CLPAltimeterCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_startTimestamp];
    [v3 setObject:v7 forKey:@"startTimestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_stopTimestamp];
  [v3 setObject:v8 forKey:@"stopTimestamp"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  unsigned int v9 = self->_collectionType - 1;
  if (v9 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_collectionType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E6C35D70[v9];
  }
  [v3 setObject:v10 forKey:@"collectionType"];

LABEL_13:
  context = self->_context;
  if (context)
  {
    v12 = [(CLPContext *)context dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"context"];
  }
  location = self->_location;
  if (location)
  {
    v14 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"location"];
  }
  if ([(NSMutableArray *)self->_pressures count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pressures, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v16 = self->_pressures;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"pressure"];
  }
  if ([(NSMutableArray *)self->_wifiScans count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_wifiScans, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v23 = self->_wifiScans;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v41 + 1) + 8 * j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"wifiScan"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = self->_locations;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v37 + 1) + 8 * k) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"locations"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAltimeterCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_meta) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_context) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = self->_pressures;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_wifiScans;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = self->_locations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_meta)
  {
    objc_msgSend(v4, "setMeta:");
    id v4 = v18;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_startTimestamp;
    *((unsigned char *)v4 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_stopTimestamp;
  *((unsigned char *)v4 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 6) = self->_collectionType;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_7:
  if (self->_context) {
    objc_msgSend(v18, "setContext:");
  }
  if (self->_location) {
    objc_msgSend(v18, "setLocation:");
  }
  if ([(CLPAltimeterCollectionRequest *)self pressuresCount])
  {
    [v18 clearPressures];
    unint64_t v6 = [(CLPAltimeterCollectionRequest *)self pressuresCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CLPAltimeterCollectionRequest *)self pressureAtIndex:i];
        [v18 addPressure:v9];
      }
    }
  }
  if ([(CLPAltimeterCollectionRequest *)self wifiScansCount])
  {
    [v18 clearWifiScans];
    unint64_t v10 = [(CLPAltimeterCollectionRequest *)self wifiScansCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(CLPAltimeterCollectionRequest *)self wifiScanAtIndex:j];
        [v18 addWifiScan:v13];
      }
    }
  }
  if ([(CLPAltimeterCollectionRequest *)self locationsCount])
  {
    [v18 clearLocations];
    unint64_t v14 = [(CLPAltimeterCollectionRequest *)self locationsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(CLPAltimeterCollectionRequest *)self locationsAtIndex:k];
        [v18 addLocations:v17];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_startTimestamp;
    *(unsigned char *)(v5 + 80) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_stopTimestamp;
  *(unsigned char *)(v5 + 80) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_collectionType;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
LABEL_5:
  id v9 = [(CLPContext *)self->_context copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(CLPLocation *)self->_location copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = self->_pressures;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPressure:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v15);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v19 = self->_wifiScans;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addWifiScan:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v21);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v25 = self->_locations;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [(id)v5 addLocations:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v27);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  meta = self->_meta;
  if ((unint64_t)meta | *((void *)v4 + 7))
  {
    if (!-[CLPMeta isEqual:](meta, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_startTimestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_29:
    char v11 = 0;
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_stopTimestamp != *((double *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_collectionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_29;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 4) && !-[CLPContext isEqual:](context, "isEqual:")) {
    goto LABEL_29;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 5))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_29;
    }
  }
  pressures = self->_pressures;
  if ((unint64_t)pressures | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](pressures, "isEqual:")) {
      goto LABEL_29;
    }
  }
  wifiScans = self->_wifiScans;
  if ((unint64_t)wifiScans | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](wifiScans, "isEqual:")) {
      goto LABEL_29;
    }
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 6)) {
    char v11 = -[NSMutableArray isEqual:](locations, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  char has = (char)self->_has;
  if (has)
  {
    double startTimestamp = self->_startTimestamp;
    double v7 = -startTimestamp;
    if (startTimestamp >= 0.0) {
      double v7 = self->_startTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double stopTimestamp = self->_stopTimestamp;
    double v12 = -stopTimestamp;
    if (stopTimestamp >= 0.0) {
      double v12 = self->_stopTimestamp;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_collectionType;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = v5 ^ v3 ^ v10 ^ v15 ^ [(CLPContext *)self->_context hash];
  unint64_t v17 = [(CLPLocation *)self->_location hash];
  uint64_t v18 = v17 ^ [(NSMutableArray *)self->_pressures hash];
  uint64_t v19 = v16 ^ v18 ^ [(NSMutableArray *)self->_wifiScans hash];
  return v19 ^ [(NSMutableArray *)self->_locations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  meta = self->_meta;
  uint64_t v6 = *((void *)v4 + 7);
  if (meta)
  {
    if (v6) {
      -[CLPMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLPAltimeterCollectionRequest setMeta:](self, "setMeta:");
  }
  char v7 = *((unsigned char *)v4 + 80);
  if (v7)
  {
    self->_double startTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 80);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_double stopTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
LABEL_9:
    self->_collectionType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
  context = self->_context;
  uint64_t v9 = *((void *)v4 + 4);
  if (context)
  {
    if (v9) {
      -[CLPContext mergeFrom:](context, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[CLPAltimeterCollectionRequest setContext:](self, "setContext:");
  }
  location = self->_location;
  uint64_t v11 = *((void *)v4 + 5);
  if (location)
  {
    if (v11) {
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[CLPAltimeterCollectionRequest setLocation:](self, "setLocation:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = *((id *)v4 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CLPAltimeterCollectionRequest *)self addPressure:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v14);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v4 + 9);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(CLPAltimeterCollectionRequest *)self addWifiScan:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 6);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[CLPAltimeterCollectionRequest addLocations:](self, "addLocations:", *(void *)(*((void *)&v27 + 1) + 8 * k), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v24);
  }
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)stopTimestamp
{
  return self->_stopTimestamp;
}

- (CLPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSMutableArray)pressures
{
  return self->_pressures;
}

- (void)setPressures:(id)a3
{
}

- (NSMutableArray)wifiScans
{
  return self->_wifiScans;
}

- (void)setWifiScans:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScans, 0);
  objc_storeStrong((id *)&self->_pressures, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end