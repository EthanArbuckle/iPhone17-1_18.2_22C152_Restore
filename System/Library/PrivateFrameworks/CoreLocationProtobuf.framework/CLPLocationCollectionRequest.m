@interface CLPLocationCollectionRequest
+ (Class)accessoryLocationType;
+ (Class)appBundleIdsType;
+ (Class)locationType;
- (BOOL)hasAccessoryMeta;
- (BOOL)hasAppBundleId;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasPipelineMetadata;
- (BOOL)hasRat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPAccessoryMeta)accessoryMeta;
- (CLPLocationProcessingPipelineMetadata)pipelineMetadata;
- (CLPMeta)meta;
- (Class)responseClass;
- (NSMutableArray)accessoryLocations;
- (NSMutableArray)appBundleIds;
- (NSMutableArray)locations;
- (NSString)appBundleId;
- (NSString)tripId;
- (id)accessoryLocationAtIndex:(unint64_t)a3;
- (id)appBundleIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationAtIndex:(unint64_t)a3;
- (int)mcc;
- (int)mnc;
- (int)rat;
- (unint64_t)accessoryLocationsCount;
- (unint64_t)appBundleIdsCount;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (unsigned)requestTypeCode;
- (void)addAccessoryLocation:(id)a3;
- (void)addAppBundleIds:(id)a3;
- (void)addLocation:(id)a3;
- (void)clearAccessoryLocations;
- (void)clearAppBundleIds;
- (void)clearLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryLocations:(id)a3;
- (void)setAccessoryMeta:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setAppBundleIds:(id)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setMcc:(int)a3;
- (void)setMeta:(id)a3;
- (void)setMnc:(int)a3;
- (void)setPipelineMetadata:(id)a3;
- (void)setRat:(int)a3;
- (void)setTripId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLocationCollectionRequest

- (void)clearLocations
{
}

- (void)addLocation:(id)a3
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

- (id)locationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locations objectAtIndex:a3];
}

+ (Class)locationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setRat:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRat
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMcc:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMcc
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMnc:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMnc
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearAppBundleIds
{
}

- (void)addAppBundleIds:(id)a3
{
  id v4 = a3;
  appBundleIds = self->_appBundleIds;
  id v8 = v4;
  if (!appBundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_appBundleIds;
    self->_appBundleIds = v6;

    id v4 = v8;
    appBundleIds = self->_appBundleIds;
  }
  [(NSMutableArray *)appBundleIds addObject:v4];
}

- (unint64_t)appBundleIdsCount
{
  return [(NSMutableArray *)self->_appBundleIds count];
}

- (id)appBundleIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appBundleIds objectAtIndex:a3];
}

+ (Class)appBundleIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccessoryMeta
{
  return self->_accessoryMeta != 0;
}

- (void)clearAccessoryLocations
{
}

- (void)addAccessoryLocation:(id)a3
{
  id v4 = a3;
  accessoryLocations = self->_accessoryLocations;
  id v8 = v4;
  if (!accessoryLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_accessoryLocations;
    self->_accessoryLocations = v6;

    id v4 = v8;
    accessoryLocations = self->_accessoryLocations;
  }
  [(NSMutableArray *)accessoryLocations addObject:v4];
}

- (unint64_t)accessoryLocationsCount
{
  return [(NSMutableArray *)self->_accessoryLocations count];
}

- (id)accessoryLocationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accessoryLocations objectAtIndex:a3];
}

+ (Class)accessoryLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPipelineMetadata
{
  return self->_pipelineMetadata != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLocationCollectionRequest;
  id v4 = [(CLPLocationCollectionRequest *)&v8 description];
  v5 = [(CLPLocationCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  meta = self->_meta;
  if (meta)
  {
    v5 = [(CLPMeta *)meta dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"meta"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v7 = self->_locations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  tripId = self->_tripId;
  if (tripId) {
    [v3 setObject:tripId forKey:@"tripId"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v30 = [NSNumber numberWithInt:self->_rat];
    [v3 setObject:v30 forKey:@"rat"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  v31 = [NSNumber numberWithInt:self->_mcc];
  [v3 setObject:v31 forKey:@"mcc"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_19:
    v16 = [NSNumber numberWithInt:self->_mnc];
    [v3 setObject:v16 forKey:@"mnc"];
  }
LABEL_20:
  appBundleIds = self->_appBundleIds;
  if (appBundleIds) {
    [v3 setObject:appBundleIds forKey:@"appBundleIds"];
  }
  accessoryMeta = self->_accessoryMeta;
  if (accessoryMeta)
  {
    v19 = [(CLPAccessoryMeta *)accessoryMeta dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"accessoryMeta"];
  }
  if ([(NSMutableArray *)self->_accessoryLocations count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_accessoryLocations, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v21 = self->_accessoryLocations;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (void)v32);
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"accessoryLocation"];
  }
  pipelineMetadata = self->_pipelineMetadata;
  if (pipelineMetadata)
  {
    v28 = [(CLPLocationProcessingPipelineMetadata *)pipelineMetadata dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"pipelineMetadata"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_meta) {
    -[CLPLocationCollectionRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = self->_locations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }

  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  if (!self->_tripId) {
    -[CLPLocationCollectionRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_14:
      if ((has & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_15:
  }
    PBDataWriterWriteInt32Field();
LABEL_16:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = self->_appBundleIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  if (self->_accessoryMeta) {
    PBDataWriterWriteSubmessage();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self->_accessoryLocations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }

  if (self->_pipelineMetadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 101;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  [v17 setMeta:self->_meta];
  if ([(CLPLocationCollectionRequest *)self locationsCount])
  {
    [v17 clearLocations];
    unint64_t v4 = [(CLPLocationCollectionRequest *)self locationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CLPLocationCollectionRequest *)self locationAtIndex:i];
        [v17 addLocation:v7];
      }
    }
  }
  if (self->_appBundleId) {
    objc_msgSend(v17, "setAppBundleId:");
  }
  [v17 setTripId:self->_tripId];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_27:
    *((_DWORD *)v17 + 12) = self->_mcc;
    *((unsigned char *)v17 + 96) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *((_DWORD *)v17 + 20) = self->_rat;
  *((unsigned char *)v17 + 96) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_27;
  }
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v17 + 16) = self->_mnc;
    *((unsigned char *)v17 + 96) |= 2u;
  }
LABEL_11:
  if ([(CLPLocationCollectionRequest *)self appBundleIdsCount])
  {
    [v17 clearAppBundleIds];
    unint64_t v9 = [(CLPLocationCollectionRequest *)self appBundleIdsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(CLPLocationCollectionRequest *)self appBundleIdsAtIndex:j];
        [v17 addAppBundleIds:v12];
      }
    }
  }
  if (self->_accessoryMeta) {
    objc_msgSend(v17, "setAccessoryMeta:");
  }
  if ([(CLPLocationCollectionRequest *)self accessoryLocationsCount])
  {
    [v17 clearAccessoryLocations];
    unint64_t v13 = [(CLPLocationCollectionRequest *)self accessoryLocationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = [(CLPLocationCollectionRequest *)self accessoryLocationAtIndex:k];
        [v17 addAccessoryLocation:v16];
      }
    }
  }
  if (self->_pipelineMetadata) {
    objc_msgSend(v17, "setPipelineMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPMeta *)self->_meta copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v8 = self->_locations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLocation:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_appBundleId copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_tripId copyWithZone:a3];
  id v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_rat;
    *(unsigned char *)(v5 + 96) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 48) = self->_mcc;
  *(unsigned char *)(v5 + 96) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 64) = self->_mnc;
    *(unsigned char *)(v5 + 96) |= 2u;
  }
LABEL_12:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v19 = self->_appBundleIds;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAppBundleIds:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v21);
  }

  id v25 = [(CLPAccessoryMeta *)self->_accessoryMeta copyWithZone:a3];
  long long v26 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v25;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v27 = self->_accessoryLocations;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (void)v36);
        [(id)v5 addAccessoryLocation:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v29);
  }

  id v33 = [(CLPLocationProcessingPipelineMetadata *)self->_pipelineMetadata copyWithZone:a3];
  long long v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  meta = self->_meta;
  if ((unint64_t)meta | *((void *)v4 + 7))
  {
    if (!-[CLPMeta isEqual:](meta, "isEqual:")) {
      goto LABEL_33;
    }
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:")) {
      goto LABEL_33;
    }
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_33;
    }
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](tripId, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_rat != *((_DWORD *)v4 + 20)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
LABEL_33:
    char v13 = 0;
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_mcc != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_mnc != *((_DWORD *)v4 + 16)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_33;
  }
  appBundleIds = self->_appBundleIds;
  if ((unint64_t)appBundleIds | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](appBundleIds, "isEqual:"))
  {
    goto LABEL_33;
  }
  accessoryMeta = self->_accessoryMeta;
  if ((unint64_t)accessoryMeta | *((void *)v4 + 2))
  {
    if (!-[CLPAccessoryMeta isEqual:](accessoryMeta, "isEqual:")) {
      goto LABEL_33;
    }
  }
  accessoryLocations = self->_accessoryLocations;
  if ((unint64_t)accessoryLocations | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](accessoryLocations, "isEqual:")) {
      goto LABEL_33;
    }
  }
  pipelineMetadata = self->_pipelineMetadata;
  if ((unint64_t)pipelineMetadata | *((void *)v4 + 9)) {
    char v13 = -[CLPLocationProcessingPipelineMetadata isEqual:](pipelineMetadata, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPMeta *)self->_meta hash];
  uint64_t v4 = [(NSMutableArray *)self->_locations hash];
  NSUInteger v5 = [(NSString *)self->_appBundleId hash];
  NSUInteger v6 = [(NSString *)self->_tripId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = 2654435761 * self->_rat;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_mcc;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_mnc;
LABEL_8:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v11 = v7 ^ v8 ^ v9 ^ [(NSMutableArray *)self->_appBundleIds hash];
  unint64_t v12 = v10 ^ v11 ^ [(CLPAccessoryMeta *)self->_accessoryMeta hash];
  uint64_t v13 = [(NSMutableArray *)self->_accessoryLocations hash];
  return v12 ^ v13 ^ [(CLPLocationProcessingPipelineMetadata *)self->_pipelineMetadata hash];
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
    -[CLPLocationCollectionRequest setMeta:](self, "setMeta:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CLPLocationCollectionRequest *)self addLocation:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 3)) {
    -[CLPLocationCollectionRequest setAppBundleId:](self, "setAppBundleId:");
  }
  if (*((void *)v4 + 11)) {
    -[CLPLocationCollectionRequest setTripId:](self, "setTripId:");
  }
  char v12 = *((unsigned char *)v4 + 96);
  if ((v12 & 4) != 0)
  {
    self->_rat = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 4u;
    char v12 = *((unsigned char *)v4 + 96);
    if ((v12 & 1) == 0)
    {
LABEL_19:
      if ((v12 & 2) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 1) == 0)
  {
    goto LABEL_19;
  }
  self->_mcc = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_20:
    self->_mnc = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_21:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        [(CLPLocationCollectionRequest *)self addAppBundleIds:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);
  }

  accessoryMeta = self->_accessoryMeta;
  uint64_t v19 = *((void *)v4 + 2);
  if (accessoryMeta)
  {
    if (v19) {
      -[CLPAccessoryMeta mergeFrom:](accessoryMeta, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[CLPLocationCollectionRequest setAccessoryMeta:](self, "setAccessoryMeta:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = *((id *)v4 + 1);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        -[CLPLocationCollectionRequest addAccessoryLocation:](self, "addAccessoryLocation:", *(void *)(*((void *)&v27 + 1) + 8 * k), (void)v27);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  pipelineMetadata = self->_pipelineMetadata;
  uint64_t v26 = *((void *)v4 + 9);
  if (pipelineMetadata)
  {
    if (v26) {
      -[CLPLocationProcessingPipelineMetadata mergeFrom:](pipelineMetadata, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[CLPLocationCollectionRequest setPipelineMetadata:](self, "setPipelineMetadata:");
  }
}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
}

- (int)rat
{
  return self->_rat;
}

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (NSMutableArray)appBundleIds
{
  return self->_appBundleIds;
}

- (void)setAppBundleIds:(id)a3
{
}

- (CLPAccessoryMeta)accessoryMeta
{
  return self->_accessoryMeta;
}

- (void)setAccessoryMeta:(id)a3
{
}

- (NSMutableArray)accessoryLocations
{
  return self->_accessoryLocations;
}

- (void)setAccessoryLocations:(id)a3
{
}

- (CLPLocationProcessingPipelineMetadata)pipelineMetadata
{
  return self->_pipelineMetadata;
}

- (void)setPipelineMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_pipelineMetadata, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_appBundleIds, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_accessoryMeta, 0);

  objc_storeStrong((id *)&self->_accessoryLocations, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPLocationCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 22207, "self->_meta != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPLocationCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 22226, "nil != self->_tripId");
}

@end