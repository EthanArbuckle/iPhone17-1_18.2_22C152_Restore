@interface SyncedBookmarkRepr
+ (Class)placesType;
- (BOOL)hasBusinessID;
- (BOOL)hasContactIdentifier;
- (BOOL)hasDirectionsMode;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasProviderID;
- (BOOL)hasRegionLatitude;
- (BOOL)hasRegionLatitudeDelta;
- (BOOL)hasRegionLongitude;
- (BOOL)hasRegionLongitudeDelta;
- (BOOL)hasSingleLineAddress;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)places;
- (NSString)contactIdentifier;
- (NSString)singleLineAddress;
- (NSString)title;
- (double)latitude;
- (double)longitude;
- (double)regionLatitude;
- (double)regionLatitudeDelta;
- (double)regionLongitude;
- (double)regionLongitudeDelta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsModeAsString:(int)a3;
- (id)placesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsDirectionsMode:(id)a3;
- (int)StringAsType:(id)a3;
- (int)directionsMode;
- (int)type;
- (unint64_t)businessID;
- (unint64_t)hash;
- (unint64_t)placesCount;
- (unsigned)providerID;
- (void)addPlaces:(id)a3;
- (void)clearPlaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessID:(unint64_t)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDirectionsMode:(int)a3;
- (void)setHasBusinessID:(BOOL)a3;
- (void)setHasDirectionsMode:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasProviderID:(BOOL)a3;
- (void)setHasRegionLatitude:(BOOL)a3;
- (void)setHasRegionLatitudeDelta:(BOOL)a3;
- (void)setHasRegionLongitude:(BOOL)a3;
- (void)setHasRegionLongitudeDelta:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setPlaces:(id)a3;
- (void)setProviderID:(unsigned int)a3;
- (void)setRegionLatitude:(double)a3;
- (void)setRegionLatitudeDelta:(double)a3;
- (void)setRegionLongitude:(double)a3;
- (void)setRegionLongitudeDelta:(double)a3;
- (void)setSingleLineAddress:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SyncedBookmarkRepr

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100039108 + a3);
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRIP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SEARCH"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSingleLineAddress
{
  return self->_singleLineAddress != 0;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRegionLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_regionLatitude = a3;
}

- (void)setHasRegionLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRegionLatitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRegionLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_regionLongitude = a3;
}

- (void)setHasRegionLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRegionLongitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRegionLatitudeDelta:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_regionLatitudeDelta = a3;
}

- (void)setHasRegionLatitudeDelta:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRegionLatitudeDelta
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRegionLongitudeDelta:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_regionLongitudeDelta = a3;
}

- (void)setHasRegionLongitudeDelta:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRegionLongitudeDelta
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setProviderID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_providerID = a3;
}

- (void)setHasProviderID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasProviderID
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBusinessID:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBusinessID
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (int)directionsMode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_directionsMode;
  }
  else {
    return 0;
  }
}

- (void)setDirectionsMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_directionsMode = a3;
}

- (void)setHasDirectionsMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDirectionsMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)directionsModeAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100039138 + a3);
  }

  return v3;
}

- (int)StringAsDirectionsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CYCLING"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearPlaces
{
}

- (void)addPlaces:(id)a3
{
  id v4 = a3;
  places = self->_places;
  id v8 = v4;
  if (!places)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_places;
    self->_places = v6;

    id v4 = v8;
    places = self->_places;
  }
  [(NSMutableArray *)places addObject:v4];
}

- (unint64_t)placesCount
{
  return (unint64_t)[(NSMutableArray *)self->_places count];
}

- (id)placesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_places objectAtIndex:a3];
}

+ (Class)placesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SyncedBookmarkRepr;
  id v3 = [(SyncedBookmarkRepr *)&v7 description];
  id v4 = [(SyncedBookmarkRepr *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t type = self->_type;
  if (type >= 6)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  else
  {
    v5 = *(&off_100039108 + type);
  }
  [v3 setObject:v5 forKey:@"type"];

  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  singleLineAddress = self->_singleLineAddress;
  if (singleLineAddress) {
    [v3 setObject:singleLineAddress forKey:@"singleLineAddress"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v13 = +[NSNumber numberWithDouble:self->_latitude];
    [v3 setObject:v13 forKey:@"latitude"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_10;
  }
  v14 = +[NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v14 forKey:@"longitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = +[NSNumber numberWithDouble:self->_regionLatitude];
  [v3 setObject:v15 forKey:@"regionLatitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  v16 = +[NSNumber numberWithDouble:self->_regionLongitude];
  [v3 setObject:v16 forKey:@"regionLongitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  v17 = +[NSNumber numberWithDouble:self->_regionLatitudeDelta];
  [v3 setObject:v17 forKey:@"regionLatitudeDelta"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  v18 = +[NSNumber numberWithDouble:self->_regionLongitudeDelta];
  [v3 setObject:v18 forKey:@"regionLongitudeDelta"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_28:
  v19 = +[NSNumber numberWithUnsignedInt:self->_providerID];
  [v3 setObject:v19 forKey:@"providerID"];

  if (*(_WORD *)&self->_has)
  {
LABEL_16:
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_businessID];
    [v3 setObject:v9 forKey:@"businessID"];
  }
LABEL_17:
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v3 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t directionsMode = self->_directionsMode;
    if (directionsMode >= 5)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_directionsMode];
    }
    else
    {
      v12 = *(&off_100039138 + directionsMode);
    }
    [v3 setObject:v12 forKey:@"directionsMode"];
  }
  if ([(NSMutableArray *)self->_places count])
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_places, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = self->_places;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"places"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100014F9C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_singleLineAddress) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_contactIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_places;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[28] = self->_type;
  v10 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v10;
  }
  if (self->_singleLineAddress)
  {
    objc_msgSend(v10, "setSingleLineAddress:");
    id v4 = v10;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_latitude;
    *((_WORD *)v4 + 58) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 3) = *(void *)&self->_longitude;
  *((_WORD *)v4 + 58) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v4 + 4) = *(void *)&self->_regionLatitude;
  *((_WORD *)v4 + 58) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 6) = *(void *)&self->_regionLongitude;
  *((_WORD *)v4 + 58) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 5) = *(void *)&self->_regionLatitudeDelta;
  *((_WORD *)v4 + 58) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 7) = *(void *)&self->_regionLongitudeDelta;
  *((_WORD *)v4 + 58) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_31:
  v4[22] = self->_providerID;
  *((_WORD *)v4 + 58) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_13:
    *((void *)v4 + 1) = self->_businessID;
    *((_WORD *)v4 + 58) |= 1u;
  }
LABEL_14:
  if (self->_contactIdentifier)
  {
    objc_msgSend(v10, "setContactIdentifier:");
    id v4 = v10;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v4[18] = self->_directionsMode;
    *((_WORD *)v4 + 58) |= 0x80u;
  }
  if ([(SyncedBookmarkRepr *)self placesCount])
  {
    [v10 clearPlaces];
    unint64_t v6 = [(SyncedBookmarkRepr *)self placesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SyncedBookmarkRepr *)self placesAtIndex:i];
        [v10 addPlaces:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[28] = self->_type;
  id v6 = [(NSString *)self->_title copyWithZone:a3];
  unint64_t v7 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v6;

  id v8 = [(NSString *)self->_singleLineAddress copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v5 + 2) = *(void *)&self->_latitude;
    *((_WORD *)v5 + 58) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 3) = *(void *)&self->_longitude;
  *((_WORD *)v5 + 58) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)v5 + 4) = *(void *)&self->_regionLatitude;
  *((_WORD *)v5 + 58) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)v5 + 6) = *(void *)&self->_regionLongitude;
  *((_WORD *)v5 + 58) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v5 + 5) = *(void *)&self->_regionLatitudeDelta;
  *((_WORD *)v5 + 58) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v5 + 7) = *(void *)&self->_regionLongitudeDelta;
  *((_WORD *)v5 + 58) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_26:
  v5[22] = self->_providerID;
  *((_WORD *)v5 + 58) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_9:
    *((void *)v5 + 1) = self->_businessID;
    *((_WORD *)v5 + 58) |= 1u;
  }
LABEL_10:
  id v11 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  long long v12 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v11;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v5[18] = self->_directionsMode;
    *((_WORD *)v5 + 58) |= 0x80u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_places;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [v5 addPlaces:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  if (self->_type != *((_DWORD *)v4 + 28)) {
    goto LABEL_57;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_57;
    }
  }
  singleLineAddress = self->_singleLineAddress;
  if ((unint64_t)singleLineAddress | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](singleLineAddress, "isEqual:")) {
      goto LABEL_57;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 58);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_latitude != *((double *)v4 + 2)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_longitude != *((double *)v4 + 3)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_regionLatitude != *((double *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_regionLongitude != *((double *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_regionLatitudeDelta != *((double *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_regionLongitudeDelta != *((double *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_providerID != *((_DWORD *)v4 + 22)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_businessID != *((void *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v8)
  {
    goto LABEL_57;
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](contactIdentifier, "isEqual:"))
    {
LABEL_57:
      unsigned __int8 v11 = 0;
      goto LABEL_58;
    }
    __int16 has = (__int16)self->_has;
    __int16 v8 = *((_WORD *)v4 + 58);
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_directionsMode != *((_DWORD *)v4 + 18)) {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  places = self->_places;
  if ((unint64_t)places | *((void *)v4 + 10)) {
    unsigned __int8 v11 = -[NSMutableArray isEqual:](places, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_58:

  return v11;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  NSUInteger v40 = [(NSString *)self->_title hash];
  NSUInteger v39 = [(NSString *)self->_singleLineAddress hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    double latitude = self->_latitude;
    double v6 = -latitude;
    if (latitude >= 0.0) {
      double v6 = self->_latitude;
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
  if ((has & 4) != 0)
  {
    double longitude = self->_longitude;
    double v11 = -longitude;
    if (longitude >= 0.0) {
      double v11 = self->_longitude;
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
  if ((has & 8) != 0)
  {
    double regionLatitude = self->_regionLatitude;
    double v16 = -regionLatitude;
    if (regionLatitude >= 0.0) {
      double v16 = self->_regionLatitude;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double regionLongitude = self->_regionLongitude;
    double v21 = -regionLongitude;
    if (regionLongitude >= 0.0) {
      double v21 = self->_regionLongitude;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double regionLatitudeDelta = self->_regionLatitudeDelta;
    double v26 = -regionLatitudeDelta;
    if (regionLatitudeDelta >= 0.0) {
      double v26 = self->_regionLatitudeDelta;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double regionLongitudeDelta = self->_regionLongitudeDelta;
    double v31 = -regionLongitudeDelta;
    if (regionLongitudeDelta >= 0.0) {
      double v31 = self->_regionLongitudeDelta;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v34 = 2654435761 * self->_providerID;
    if (has) {
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if (has)
    {
LABEL_51:
      unint64_t v35 = 2654435761u * self->_businessID;
      goto LABEL_54;
    }
  }
  unint64_t v35 = 0;
LABEL_54:
  NSUInteger v36 = [(NSString *)self->_contactIdentifier hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v37 = 2654435761 * self->_directionsMode;
  }
  else {
    uint64_t v37 = 0;
  }
  return v40 ^ v39 ^ v4 ^ v9 ^ v14 ^ (2654435761 * type) ^ v19 ^ v24 ^ v29 ^ v34 ^ v35 ^ v36 ^ v37 ^ (unint64_t)[(NSMutableArray *)self->_places hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t type = *((_DWORD *)v4 + 28);
  if (*((void *)v4 + 13)) {
    -[SyncedBookmarkRepr setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 12)) {
    -[SyncedBookmarkRepr setSingleLineAddress:](self, "setSingleLineAddress:");
  }
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) != 0)
  {
    self->_double latitude = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 58);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_double longitude = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double regionLatitude = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double regionLongitude = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double regionLatitudeDelta = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double regionLongitudeDelta = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_32:
  self->_providerID = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x100u;
  if (*((_WORD *)v4 + 58))
  {
LABEL_13:
    self->_businessID = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  if (*((void *)v4 + 8)) {
    -[SyncedBookmarkRepr setContactIdentifier:](self, "setContactIdentifier:");
  }
  if ((*((_WORD *)v4 + 58) & 0x80) != 0)
  {
    self->_uint64_t directionsMode = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x80u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 10);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SyncedBookmarkRepr addPlaces:](self, "addPlaces:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)singleLineAddress
{
  return self->_singleLineAddress;
}

- (void)setSingleLineAddress:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)regionLatitude
{
  return self->_regionLatitude;
}

- (double)regionLongitude
{
  return self->_regionLongitude;
}

- (double)regionLatitudeDelta
{
  return self->_regionLatitudeDelta;
}

- (double)regionLongitudeDelta
{
  return self->_regionLongitudeDelta;
}

- (unsigned)providerID
{
  return self->_providerID;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSMutableArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_singleLineAddress, 0);
  objc_storeStrong((id *)&self->_places, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end