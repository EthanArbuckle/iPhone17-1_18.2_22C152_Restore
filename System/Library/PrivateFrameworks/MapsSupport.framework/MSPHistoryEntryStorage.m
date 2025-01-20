@interface MSPHistoryEntryStorage
- (BOOL)hasDirectionsSearch;
- (BOOL)hasIdentifier;
- (BOOL)hasPlaceDisplay;
- (BOOL)hasPosition;
- (BOOL)hasQuerySearch;
- (BOOL)hasRidesharingTrip;
- (BOOL)hasSearchType;
- (BOOL)hasTimestamp;
- (BOOL)hasTracksRAPRecordingOnly;
- (BOOL)hasTransitLineItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)tracksRAPRecordingOnly;
- (MSPDirectionsSearch)directionsSearch;
- (MSPPlaceDisplay)placeDisplay;
- (MSPQuerySearch)querySearch;
- (MSPRidesharingTrip)ridesharingTrip;
- (MSPTransitStorageLineItem)transitLineItem;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (double)position;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)searchTypeAsString:(int)a3;
- (int)StringAsSearchType:(id)a3;
- (int)searchType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDirectionsSearch:(id)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasSearchType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTracksRAPRecordingOnly:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlaceDisplay:(id)a3;
- (void)setPosition:(double)a3;
- (void)setQuerySearch:(id)a3;
- (void)setRidesharingTrip:(id)a3;
- (void)setSearchType:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setTracksRAPRecordingOnly:(BOOL)a3;
- (void)setTransitLineItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPHistoryEntryStorage

- (int)searchType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_searchType;
  }
  else {
    return 1;
  }
}

- (void)setSearchType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_searchType = a3;
}

- (void)setHasSearchType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSearchType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)searchTypeAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E617DFE0[a3 - 1];
  }

  return v3;
}

- (int)StringAsSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"QUERY_SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_SEARCH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLACE_DISPLAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_ITEM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RIDESHARING_TRIP"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasQuerySearch
{
  return self->_querySearch != 0;
}

- (BOOL)hasDirectionsSearch
{
  return self->_directionsSearch != 0;
}

- (BOOL)hasPlaceDisplay
{
  return self->_placeDisplay != 0;
}

- (BOOL)hasTransitLineItem
{
  return self->_transitLineItem != 0;
}

- (BOOL)hasRidesharingTrip
{
  return self->_ridesharingTrip != 0;
}

- (void)setTracksRAPRecordingOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tracksRAPRecordingOnly = a3;
}

- (void)setHasTracksRAPRecordingOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTracksRAPRecordingOnly
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPHistoryEntryStorage;
  int v4 = [(MSPHistoryEntryStorage *)&v8 description];
  v5 = [(MSPHistoryEntryStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v4 = self->_searchType - 1;
    if (v4 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_searchType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E617DFE0[v4];
    }
    [v3 setObject:v5 forKey:@"searchType"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_position];
    [v3 setObject:v9 forKey:@"position"];
  }
  querySearch = self->_querySearch;
  if (querySearch)
  {
    v11 = [(MSPQuerySearch *)querySearch dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"querySearch"];
  }
  directionsSearch = self->_directionsSearch;
  if (directionsSearch)
  {
    v13 = [(MSPDirectionsSearch *)directionsSearch dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"directionsSearch"];
  }
  placeDisplay = self->_placeDisplay;
  if (placeDisplay)
  {
    v15 = [(MSPPlaceDisplay *)placeDisplay dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"placeDisplay"];
  }
  transitLineItem = self->_transitLineItem;
  if (transitLineItem)
  {
    v17 = [(MSPTransitStorageLineItem *)transitLineItem dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"transitLineItem"];
  }
  ridesharingTrip = self->_ridesharingTrip;
  if (ridesharingTrip)
  {
    v19 = [(MSPRidesharingTrip *)ridesharingTrip dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"ridesharingTrip"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_tracksRAPRecordingOnly];
    [v3 setObject:v20 forKey:@"tracksRAPRecordingOnly"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v22 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPHistoryEntryStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_querySearch) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_directionsSearch) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_placeDisplay) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_transitLineItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_ridesharingTrip) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  unsigned int v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[18] = self->_searchType;
    *((unsigned char *)v4 + 92) |= 4u;
  }
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    unsigned int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 92) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 2) = *(void *)&self->_position;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  if (self->_querySearch)
  {
    objc_msgSend(v6, "setQuerySearch:");
    unsigned int v4 = v6;
  }
  if (self->_directionsSearch)
  {
    objc_msgSend(v6, "setDirectionsSearch:");
    unsigned int v4 = v6;
  }
  if (self->_placeDisplay)
  {
    objc_msgSend(v6, "setPlaceDisplay:");
    unsigned int v4 = v6;
  }
  if (self->_transitLineItem)
  {
    objc_msgSend(v6, "setTransitLineItem:");
    unsigned int v4 = v6;
  }
  if (self->_ridesharingTrip)
  {
    objc_msgSend(v6, "setRidesharingTrip:");
    unsigned int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_tracksRAPRecordingOnly;
    *((unsigned char *)v4 + 92) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchType;
    *(unsigned char *)(v5 + 92) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_timestamp;
    *(unsigned char *)(v6 + 92) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v6 + 16) = self->_position;
    *(unsigned char *)(v6 + 92) |= 1u;
  }
  id v10 = [(MSPQuerySearch *)self->_querySearch copyWithZone:a3];
  v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  id v12 = [(MSPDirectionsSearch *)self->_directionsSearch copyWithZone:a3];
  v13 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v12;

  id v14 = [(MSPPlaceDisplay *)self->_placeDisplay copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  id v16 = [(MSPTransitStorageLineItem *)self->_transitLineItem copyWithZone:a3];
  v17 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v16;

  id v18 = [(MSPRidesharingTrip *)self->_ridesharingTrip copyWithZone:a3];
  v19 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v18;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_tracksRAPRecordingOnly;
    *(unsigned char *)(v6 + 92) |= 8u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 92);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_searchType != *((_DWORD *)v4 + 18)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_32;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 92);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if (v6)
  {
    goto LABEL_32;
  }
  querySearch = self->_querySearch;
  if ((unint64_t)querySearch | *((void *)v4 + 7) && !-[MSPQuerySearch isEqual:](querySearch, "isEqual:")) {
    goto LABEL_32;
  }
  directionsSearch = self->_directionsSearch;
  if ((unint64_t)directionsSearch | *((void *)v4 + 4))
  {
    if (!-[MSPDirectionsSearch isEqual:](directionsSearch, "isEqual:")) {
      goto LABEL_32;
    }
  }
  placeDisplay = self->_placeDisplay;
  if ((unint64_t)placeDisplay | *((void *)v4 + 6))
  {
    if (!-[MSPPlaceDisplay isEqual:](placeDisplay, "isEqual:")) {
      goto LABEL_32;
    }
  }
  transitLineItem = self->_transitLineItem;
  if ((unint64_t)transitLineItem | *((void *)v4 + 10))
  {
    if (!-[MSPTransitStorageLineItem isEqual:](transitLineItem, "isEqual:")) {
      goto LABEL_32;
    }
  }
  ridesharingTrip = self->_ridesharingTrip;
  if ((unint64_t)ridesharingTrip | *((void *)v4 + 8))
  {
    if (!-[MSPRidesharingTrip isEqual:](ridesharingTrip, "isEqual:")) {
      goto LABEL_32;
    }
  }
  BOOL v13 = (*((unsigned char *)v4 + 92) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) != 0)
    {
      if (self->_tracksRAPRecordingOnly)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 88))
      {
        goto LABEL_32;
      }
      BOOL v13 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v13 = 0;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v23 = 2654435761 * self->_searchType;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double position = self->_position;
    double v11 = -position;
    if (position >= 0.0) {
      double v11 = self->_position;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v14 = [(MSPQuerySearch *)self->_querySearch hash];
  unint64_t v15 = [(MSPDirectionsSearch *)self->_directionsSearch hash];
  unint64_t v16 = [(MSPPlaceDisplay *)self->_placeDisplay hash];
  unint64_t v17 = [(MSPTransitStorageLineItem *)self->_transitLineItem hash];
  unint64_t v18 = [(MSPRidesharingTrip *)self->_ridesharingTrip hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v19 = 2654435761 * self->_tracksRAPRecordingOnly;
  }
  else {
    uint64_t v19 = 0;
  }
  return v22 ^ v23 ^ v4 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[23] & 4) != 0)
  {
    self->_searchType = v4[18];
    *(unsigned char *)&self->_has |= 4u;
  }
  unint64_t v17 = v4;
  if (*((void *)v4 + 5))
  {
    -[MSPHistoryEntryStorage setIdentifier:](self, "setIdentifier:");
    uint64_t v5 = v17;
  }
  char v6 = *((unsigned char *)v5 + 92);
  if ((v6 & 2) != 0)
  {
    self->_double timestamp = *((double *)v5 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 92);
  }
  if (v6)
  {
    self->_double position = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  querySearch = self->_querySearch;
  uint64_t v8 = *((void *)v5 + 7);
  if (querySearch)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPQuerySearch mergeFrom:](querySearch, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPHistoryEntryStorage setQuerySearch:](self, "setQuerySearch:");
  }
  uint64_t v5 = v17;
LABEL_15:
  directionsSearch = self->_directionsSearch;
  uint64_t v10 = *((void *)v5 + 4);
  if (directionsSearch)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[MSPDirectionsSearch mergeFrom:](directionsSearch, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[MSPHistoryEntryStorage setDirectionsSearch:](self, "setDirectionsSearch:");
  }
  uint64_t v5 = v17;
LABEL_21:
  placeDisplay = self->_placeDisplay;
  uint64_t v12 = *((void *)v5 + 6);
  if (placeDisplay)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[MSPPlaceDisplay mergeFrom:](placeDisplay, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[MSPHistoryEntryStorage setPlaceDisplay:](self, "setPlaceDisplay:");
  }
  uint64_t v5 = v17;
LABEL_27:
  transitLineItem = self->_transitLineItem;
  uint64_t v14 = *((void *)v5 + 10);
  if (transitLineItem)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[MSPTransitStorageLineItem mergeFrom:](transitLineItem, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[MSPHistoryEntryStorage setTransitLineItem:](self, "setTransitLineItem:");
  }
  uint64_t v5 = v17;
LABEL_33:
  ridesharingTrip = self->_ridesharingTrip;
  uint64_t v16 = *((void *)v5 + 8);
  if (ridesharingTrip)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[MSPRidesharingTrip mergeFrom:](ridesharingTrip, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[MSPHistoryEntryStorage setRidesharingTrip:](self, "setRidesharingTrip:");
  }
  uint64_t v5 = v17;
LABEL_39:
  if ((v5[23] & 8) != 0)
  {
    self->_tracksRAPRecordingOnly = *((unsigned char *)v5 + 88);
    *(unsigned char *)&self->_has |= 8u;
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)position
{
  return self->_position;
}

- (MSPQuerySearch)querySearch
{
  return self->_querySearch;
}

- (void)setQuerySearch:(id)a3
{
}

- (MSPDirectionsSearch)directionsSearch
{
  return self->_directionsSearch;
}

- (void)setDirectionsSearch:(id)a3
{
}

- (MSPPlaceDisplay)placeDisplay
{
  return self->_placeDisplay;
}

- (void)setPlaceDisplay:(id)a3
{
}

- (MSPTransitStorageLineItem)transitLineItem
{
  return self->_transitLineItem;
}

- (void)setTransitLineItem:(id)a3
{
}

- (MSPRidesharingTrip)ridesharingTrip
{
  return self->_ridesharingTrip;
}

- (void)setRidesharingTrip:(id)a3
{
}

- (BOOL)tracksRAPRecordingOnly
{
  return self->_tracksRAPRecordingOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineItem, 0);
  objc_storeStrong((id *)&self->_ridesharingTrip, 0);
  objc_storeStrong((id *)&self->_querySearch, 0);
  objc_storeStrong((id *)&self->_placeDisplay, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_directionsSearch, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end