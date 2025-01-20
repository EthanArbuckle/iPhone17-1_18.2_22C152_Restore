@interface MSPTransitStorageIncident
+ (Class)affectedEntitiesType;
- (BOOL)blockingIncident;
- (BOOL)hasBlockingIncident;
- (BOOL)hasCreationDatetime;
- (BOOL)hasEndDatetime;
- (BOOL)hasFullDescription;
- (BOOL)hasIconType;
- (BOOL)hasLastUpdatedDatetime;
- (BOOL)hasMessageForNonRoutable;
- (BOOL)hasMessageForRoutePlanning;
- (BOOL)hasMessageForRouteStepping;
- (BOOL)hasMuid;
- (BOOL)hasStartDatetime;
- (BOOL)hasSummary;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitIconDataSource)artworkDataSource;
- (MSPTransitStorageIncident)initWithIncident:(id)a3;
- (NSArray)affectedEntities;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)lastUpdated;
- (NSDate)startDate;
- (NSString)description;
- (NSString)fullDescription;
- (NSString)messageForNonRoutable;
- (NSString)messageForRoutePlanning;
- (NSString)messageForRouteStepping;
- (NSString)summary;
- (NSString)title;
- (PBUnknownFields)unknownFields;
- (id)affectedEntitiesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)iconTypeAsString:(int)a3;
- (int)StringAsIconType:(id)a3;
- (int)iconType;
- (unint64_t)affectedEntitiesCount;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)creationDatetime;
- (unsigned)endDatetime;
- (unsigned)lastUpdatedDatetime;
- (unsigned)startDatetime;
- (void)addAffectedEntities:(id)a3;
- (void)clearAffectedEntities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAffectedEntities:(id)a3;
- (void)setBlockingIncident:(BOOL)a3;
- (void)setCreationDatetime:(unsigned int)a3;
- (void)setEndDatetime:(unsigned int)a3;
- (void)setFullDescription:(id)a3;
- (void)setHasBlockingIncident:(BOOL)a3;
- (void)setHasCreationDatetime:(BOOL)a3;
- (void)setHasEndDatetime:(BOOL)a3;
- (void)setHasIconType:(BOOL)a3;
- (void)setHasLastUpdatedDatetime:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasStartDatetime:(BOOL)a3;
- (void)setIconType:(int)a3;
- (void)setLastUpdatedDatetime:(unsigned int)a3;
- (void)setMessageForNonRoutable:(id)a3;
- (void)setMessageForRoutePlanning:(id)a3;
- (void)setMessageForRouteStepping:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setStartDatetime:(unsigned int)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageIncident

- (MSPTransitStorageIncident)initWithIncident:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MSPTransitStorageIncident;
  v5 = [(MSPTransitStorageIncident *)&v35 init];
  if (v5)
  {
    -[MSPTransitStorageIncident setMuid:](v5, "setMuid:", [v4 muid]);
    v6 = [v4 title];
    [(MSPTransitStorageIncident *)v5 setTitle:v6];

    v7 = [v4 summary];
    [(MSPTransitStorageIncident *)v5 setSummary:v7];

    v8 = [v4 fullDescription];
    [(MSPTransitStorageIncident *)v5 setFullDescription:v8];

    v9 = [v4 messageForRoutePlanning];
    [(MSPTransitStorageIncident *)v5 setMessageForRoutePlanning:v9];

    v10 = [v4 messageForRouteStepping];
    [(MSPTransitStorageIncident *)v5 setMessageForRouteStepping:v10];

    v11 = [v4 messageForNonRoutable];
    [(MSPTransitStorageIncident *)v5 setMessageForNonRoutable:v11];

    v12 = [v4 startDate];

    if (v12)
    {
      v13 = [v4 startDate];
      [v13 timeIntervalSinceReferenceDate];
      [(MSPTransitStorageIncident *)v5 setStartDatetime:v14];
    }
    v15 = [v4 endDate];

    if (v15)
    {
      v16 = [v4 endDate];
      [v16 timeIntervalSinceReferenceDate];
      [(MSPTransitStorageIncident *)v5 setEndDatetime:v17];
    }
    -[MSPTransitStorageIncident setIconType:](v5, "setIconType:", [v4 iconType]);
    v18 = [v4 creationDate];

    if (v18)
    {
      v19 = [v4 creationDate];
      [v19 timeIntervalSinceReferenceDate];
      [(MSPTransitStorageIncident *)v5 setCreationDatetime:v20];
    }
    v21 = [v4 lastUpdated];

    if (v21)
    {
      v22 = [v4 lastUpdated];
      [v22 timeIntervalSinceReferenceDate];
      [(MSPTransitStorageIncident *)v5 setLastUpdatedDatetime:v23];
    }
    -[MSPTransitStorageIncident setBlockingIncident:](v5, "setBlockingIncident:", [v4 isBlockingIncident]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = objc_msgSend(v4, "affectedEntities", 0);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[MSPTransitStorageIncidentEntity alloc] initWithIncidentEntity:*(void *)(*((void *)&v31 + 1) + 8 * v28)];
          [(MSPTransitStorageIncident *)v5 addAffectedEntities:v29];

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }
  }
  return v5;
}

- (GEOTransitIconDataSource)artworkDataSource
{
  return 0;
}

- (NSDate)creationDate
{
  if ([(MSPTransitStorageIncident *)self hasCreationDatetime])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident creationDatetime](self, "creationDatetime"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSDate)lastUpdated
{
  if ([(MSPTransitStorageIncident *)self hasLastUpdatedDatetime])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident lastUpdatedDatetime](self, "lastUpdatedDatetime"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSDate)startDate
{
  if ([(MSPTransitStorageIncident *)self hasStartDatetime])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident startDatetime](self, "startDatetime"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  if ([(MSPTransitStorageIncident *)self hasEndDatetime])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[MSPTransitStorageIncident endDatetime](self, "endDatetime"));
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (BOOL)hasFullDescription
{
  return self->_fullDescription != 0;
}

- (BOOL)hasMessageForRoutePlanning
{
  return self->_messageForRoutePlanning != 0;
}

- (BOOL)hasMessageForRouteStepping
{
  return self->_messageForRouteStepping != 0;
}

- (BOOL)hasMessageForNonRoutable
{
  return self->_messageForNonRoutable != 0;
}

- (void)setStartDatetime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startDatetime = a3;
}

- (void)setHasStartDatetime:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDatetime
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndDatetime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endDatetime = a3;
}

- (void)setHasEndDatetime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDatetime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIconType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_iconType = a3;
}

- (void)setHasIconType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)iconTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E617CCE0[a3];
  }

  return v3;
}

- (int)StringAsIconType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GEOTransitIncidentIconTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GEOTransitIncidentIconTypeWarning"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GEOTransitIncidentIconTypeConstruction"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCreationDatetime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_creationDatetime = a3;
}

- (void)setHasCreationDatetime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDatetime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLastUpdatedDatetime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_lastUpdatedDatetime = a3;
}

- (void)setHasLastUpdatedDatetime:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLastUpdatedDatetime
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBlockingIncident:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_blockingIncident = a3;
}

- (void)setHasBlockingIncident:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasBlockingIncident
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)clearAffectedEntities
{
}

- (void)addAffectedEntities:(id)a3
{
  id v4 = a3;
  affectedEntities = self->_affectedEntities;
  id v8 = v4;
  if (!affectedEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_affectedEntities;
    self->_affectedEntities = v6;

    id v4 = v8;
    affectedEntities = self->_affectedEntities;
  }
  [(NSMutableArray *)affectedEntities addObject:v4];
}

- (unint64_t)affectedEntitiesCount
{
  return [(NSMutableArray *)self->_affectedEntities count];
}

- (id)affectedEntitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_affectedEntities objectAtIndex:a3];
}

+ (Class)affectedEntitiesType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIncident;
  id v4 = [(MSPTransitStorageIncident *)&v8 description];
  v5 = [(MSPTransitStorageIncident *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_muid];
    [v3 setObject:v4 forKey:@"muid"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  summary = self->_summary;
  if (summary) {
    [v3 setObject:summary forKey:@"summary"];
  }
  fullDescription = self->_fullDescription;
  if (fullDescription) {
    [v3 setObject:fullDescription forKey:@"full_description"];
  }
  messageForRoutePlanning = self->_messageForRoutePlanning;
  if (messageForRoutePlanning) {
    [v3 setObject:messageForRoutePlanning forKey:@"message_for_route_planning"];
  }
  messageForRouteStepping = self->_messageForRouteStepping;
  if (messageForRouteStepping) {
    [v3 setObject:messageForRouteStepping forKey:@"message_for_route_stepping"];
  }
  messageForNonRoutable = self->_messageForNonRoutable;
  if (messageForNonRoutable) {
    [v3 setObject:messageForNonRoutable forKey:@"message_for_non_routable"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    double v23 = [NSNumber numberWithUnsignedInt:self->_startDatetime];
    [v3 setObject:v23 forKey:@"start_datetime"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  v24 = [NSNumber numberWithUnsignedInt:self->_endDatetime];
  [v3 setObject:v24 forKey:@"end_datetime"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_38:
  uint64_t iconType = self->_iconType;
  if (iconType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_iconType);
    uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v26 = off_1E617CCE0[iconType];
  }
  [v3 setObject:v26 forKey:@"icon_type"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v27 = [NSNumber numberWithUnsignedInt:self->_creationDatetime];
  [v3 setObject:v27 forKey:@"creation_datetime"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_43:
  uint64_t v28 = [NSNumber numberWithUnsignedInt:self->_lastUpdatedDatetime];
  [v3 setObject:v28 forKey:@"last_updated_datetime"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_21:
    v12 = [NSNumber numberWithBool:self->_blockingIncident];
    [v3 setObject:v12 forKey:@"blocking_incident"];
  }
LABEL_22:
  if ([(NSMutableArray *)self->_affectedEntities count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_affectedEntities, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v14 = self->_affectedEntities;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"affected_entities"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v21 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIncidentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_summary) {
    PBDataWriterWriteStringField();
  }
  if (self->_fullDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForRoutePlanning) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForRouteStepping) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForNonRoutable) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_21:
  }
    PBDataWriterWriteBOOLField();
LABEL_22:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_affectedEntities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_muid;
    *((unsigned char *)v4 + 108) |= 1u;
  }
  v10 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v10;
  }
  if (self->_summary)
  {
    objc_msgSend(v10, "setSummary:");
    id v4 = v10;
  }
  if (self->_fullDescription)
  {
    objc_msgSend(v10, "setFullDescription:");
    id v4 = v10;
  }
  if (self->_messageForRoutePlanning)
  {
    objc_msgSend(v10, "setMessageForRoutePlanning:");
    id v4 = v10;
  }
  if (self->_messageForRouteStepping)
  {
    objc_msgSend(v10, "setMessageForRouteStepping:");
    id v4 = v10;
  }
  if (self->_messageForNonRoutable)
  {
    objc_msgSend(v10, "setMessageForNonRoutable:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_startDatetime;
    *((unsigned char *)v4 + 108) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 9) = self->_endDatetime;
  *((unsigned char *)v4 + 108) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 12) = self->_iconType;
  *((unsigned char *)v4 + 108) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
LABEL_33:
    *((_DWORD *)v4 + 13) = self->_lastUpdatedDatetime;
    *((unsigned char *)v4 + 108) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_32:
  *((_DWORD *)v4 + 8) = self->_creationDatetime;
  *((unsigned char *)v4 + 108) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_33;
  }
LABEL_20:
  if ((has & 0x40) != 0)
  {
LABEL_21:
    *((unsigned char *)v4 + 104) = self->_blockingIncident;
    *((unsigned char *)v4 + 108) |= 0x40u;
  }
LABEL_22:
  if ([(MSPTransitStorageIncident *)self affectedEntitiesCount])
  {
    [v10 clearAffectedEntities];
    unint64_t v6 = [(MSPTransitStorageIncident *)self affectedEntitiesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(MSPTransitStorageIncident *)self affectedEntitiesAtIndex:i];
        [v10 addAffectedEntities:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 16) = self->_muid;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v7;

  uint64_t v9 = [(NSString *)self->_summary copyWithZone:a3];
  v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_fullDescription copyWithZone:a3];
  long long v12 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_messageForRoutePlanning copyWithZone:a3];
  long long v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_messageForRouteStepping copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v15;

  uint64_t v17 = [(NSString *)self->_messageForNonRoutable copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_startDatetime;
    *(unsigned char *)(v6 + 108) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 36) = self->_endDatetime;
  *(unsigned char *)(v6 + 108) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 48) = self->_iconType;
  *(unsigned char *)(v6 + 108) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 32) = self->_creationDatetime;
  *(unsigned char *)(v6 + 108) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_22:
  *(_DWORD *)(v6 + 52) = self->_lastUpdatedDatetime;
  *(unsigned char *)(v6 + 108) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(unsigned char *)(v6 + 104) = self->_blockingIncident;
    *(unsigned char *)(v6 + 108) |= 0x40u;
  }
LABEL_10:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v20 = self->_affectedEntities;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v6 addAffectedEntities:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_48;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 12) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_48;
  }
  summary = self->_summary;
  if ((unint64_t)summary | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](summary, "isEqual:")) {
      goto LABEL_48;
    }
  }
  fullDescription = self->_fullDescription;
  if ((unint64_t)fullDescription | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](fullDescription, "isEqual:")) {
      goto LABEL_48;
    }
  }
  messageForRoutePlanning = self->_messageForRoutePlanning;
  if ((unint64_t)messageForRoutePlanning | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](messageForRoutePlanning, "isEqual:")) {
      goto LABEL_48;
    }
  }
  messageForRouteStepping = self->_messageForRouteStepping;
  if ((unint64_t)messageForRouteStepping | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](messageForRouteStepping, "isEqual:")) {
      goto LABEL_48;
    }
  }
  messageForNonRoutable = self->_messageForNonRoutable;
  if ((unint64_t)messageForNonRoutable | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](messageForNonRoutable, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x20) == 0 || self->_startDatetime != *((_DWORD *)v4 + 20)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_endDatetime != *((_DWORD *)v4 + 9)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0 || self->_iconType != *((_DWORD *)v4 + 12)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_creationDatetime != *((_DWORD *)v4 + 8)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x10) == 0 || self->_lastUpdatedDatetime != *((_DWORD *)v4 + 13)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    if ((*((unsigned char *)v4 + 108) & 0x40) == 0) {
      goto LABEL_54;
    }
LABEL_48:
    char v11 = 0;
    goto LABEL_49;
  }
  if ((*((unsigned char *)v4 + 108) & 0x40) == 0) {
    goto LABEL_48;
  }
  if (!self->_blockingIncident)
  {
    if (!*((unsigned char *)v4 + 104)) {
      goto LABEL_54;
    }
    goto LABEL_48;
  }
  if (!*((unsigned char *)v4 + 104)) {
    goto LABEL_48;
  }
LABEL_54:
  affectedEntities = self->_affectedEntities;
  if ((unint64_t)affectedEntities | *((void *)v4 + 3)) {
    char v11 = -[NSMutableArray isEqual:](affectedEntities, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_summary hash];
  NSUInteger v6 = [(NSString *)self->_fullDescription hash];
  NSUInteger v7 = [(NSString *)self->_messageForRoutePlanning hash];
  NSUInteger v8 = [(NSString *)self->_messageForRouteStepping hash];
  NSUInteger v9 = [(NSString *)self->_messageForNonRoutable hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_startDatetime;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v11 = 2654435761 * self->_endDatetime;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v12 = 2654435761 * self->_iconType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    uint64_t v13 = 2654435761 * self->_creationDatetime;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSMutableArray *)self->_affectedEntities hash];
  }
LABEL_14:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v14 = 2654435761 * self->_lastUpdatedDatetime;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v15 = 2654435761 * self->_blockingIncident;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSMutableArray *)self->_affectedEntities hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 108))
  {
    self->_muid = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[12]) {
    -[MSPTransitStorageIncident setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 11)) {
    -[MSPTransitStorageIncident setSummary:](self, "setSummary:");
  }
  if (*((void *)v5 + 5)) {
    -[MSPTransitStorageIncident setFullDescription:](self, "setFullDescription:");
  }
  if (*((void *)v5 + 8)) {
    [(MSPTransitStorageIncident *)self setMessageForRoutePlanning:"setMessageForRoutePlanning:"];
  }
  if (*((void *)v5 + 9)) {
    [(MSPTransitStorageIncident *)self setMessageForRouteStepping:"setMessageForRouteStepping:"];
  }
  if (*((void *)v5 + 7)) {
    [(MSPTransitStorageIncident *)self setMessageForNonRoutable:"setMessageForNonRoutable:"];
  }
  char v6 = *((unsigned char *)v5 + 108);
  if ((v6 & 0x20) != 0)
  {
    self->_startDatetime = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v5 + 108);
    if ((v6 & 4) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v5 + 108) & 4) == 0)
  {
    goto LABEL_17;
  }
  self->_endDatetime = *((_DWORD *)v5 + 9);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v5 + 108);
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_uint64_t iconType = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v5 + 108);
  if ((v6 & 2) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_creationDatetime = *((_DWORD *)v5 + 8);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v5 + 108);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_34:
  self->_lastUpdatedDatetime = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v5 + 108) & 0x40) != 0)
  {
LABEL_21:
    self->_blockingIncident = *((unsigned char *)v5 + 104);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_22:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MSPTransitStorageIncident addAffectedEntities:](self, "addAffectedEntities:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)fullDescription
{
  return self->_fullDescription;
}

- (void)setFullDescription:(id)a3
{
}

- (NSString)messageForRoutePlanning
{
  return self->_messageForRoutePlanning;
}

- (void)setMessageForRoutePlanning:(id)a3
{
}

- (NSString)messageForRouteStepping
{
  return self->_messageForRouteStepping;
}

- (void)setMessageForRouteStepping:(id)a3
{
}

- (NSString)messageForNonRoutable
{
  return self->_messageForNonRoutable;
}

- (void)setMessageForNonRoutable:(id)a3
{
}

- (unsigned)startDatetime
{
  return self->_startDatetime;
}

- (unsigned)endDatetime
{
  return self->_endDatetime;
}

- (int)iconType
{
  return self->_iconType;
}

- (unsigned)creationDatetime
{
  return self->_creationDatetime;
}

- (unsigned)lastUpdatedDatetime
{
  return self->_lastUpdatedDatetime;
}

- (BOOL)blockingIncident
{
  return self->_blockingIncident;
}

- (NSArray)affectedEntities
{
  return &self->_affectedEntities->super;
}

- (void)setAffectedEntities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_messageForRouteStepping, 0);
  objc_storeStrong((id *)&self->_messageForRoutePlanning, 0);
  objc_storeStrong((id *)&self->_messageForNonRoutable, 0);
  objc_storeStrong((id *)&self->_fullDescription, 0);
  objc_storeStrong((id *)&self->_affectedEntities, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end