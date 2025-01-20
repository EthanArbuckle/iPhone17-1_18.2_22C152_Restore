@interface CKDPLocationCoordinate
- (BOOL)hasAltitude;
- (BOOL)hasCourse;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasSpeed;
- (BOOL)hasTimestamp;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)timestamp;
- (double)altitude;
- (double)course;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasCourse:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPLocationCoordinate

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAltitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCourse:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCourse
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpeed:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpeed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPLocationCoordinate;
  v4 = [(CKDPLocationCoordinate *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v16 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_latitude);
    objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, @"latitude");

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v18 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_longitude);
  objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v18, @"longitude");

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v20 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_horizontalAccuracy);
  objc_msgSend_setObject_forKey_(v8, v21, (uint64_t)v20, @"horizontalAccuracy");

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v22 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_altitude);
  objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v22, @"altitude");

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v24 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_verticalAccuracy);
  objc_msgSend_setObject_forKey_(v8, v25, (uint64_t)v24, @"verticalAccuracy");

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v26 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_course);
  objc_msgSend_setObject_forKey_(v8, v27, (uint64_t)v26, @"course");

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v10 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_speed);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"speed");
  }
LABEL_9:
  timestamp = self->_timestamp;
  if (timestamp)
  {
    objc_super v13 = objc_msgSend_dictionaryRepresentation(timestamp, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, @"timestamp");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPLocationCoordinateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_latitude;
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_longitude;
  *((unsigned char *)v4 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = *(void *)&self->_horizontalAccuracy;
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[1] = *(void *)&self->_altitude;
  *((unsigned char *)v4 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[7] = *(void *)&self->_verticalAccuracy;
  *((unsigned char *)v4 + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v4[2] = *(void *)&self->_course;
  *((unsigned char *)v4 + 72) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v4[6] = *(void *)&self->_speed;
    *((unsigned char *)v4 + 72) |= 0x20u;
  }
LABEL_9:
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v9 = v4;
    objc_msgSend_setTimestamp_(v4, v5, (uint64_t)timestamp, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v12 + 32) = self->_latitude;
    *(unsigned char *)(v12 + 72) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v12 + 40) = self->_longitude;
  *(unsigned char *)(v12 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v12 + 24) = self->_horizontalAccuracy;
  *(unsigned char *)(v12 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(double *)(v12 + 8) = self->_altitude;
  *(unsigned char *)(v12 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(double *)(v12 + 16) = self->_course;
    *(unsigned char *)(v12 + 72) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(double *)(v12 + 56) = self->_verticalAccuracy;
  *(unsigned char *)(v12 + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(double *)(v12 + 48) = self->_speed;
    *(unsigned char *)(v12 + 72) |= 0x20u;
  }
LABEL_9:
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_timestamp, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[8];
  v15[8] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[9] & 8) == 0 || self->_latitude != *((double *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 8) != 0)
  {
LABEL_39:
    char isEqual = 0;
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[9] & 0x10) == 0 || self->_longitude != *((double *)v4 + 5)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[9] & 4) == 0 || self->_horizontalAccuracy != *((double *)v4 + 3)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 4) != 0)
  {
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[9] & 1) == 0 || self->_altitude != *((double *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (v4[9])
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[9] & 0x40) == 0 || self->_verticalAccuracy != *((double *)v4 + 7)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 0x40) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_course != *((double *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[9] & 0x20) == 0 || self->_speed != *((double *)v4 + 6)) {
      goto LABEL_39;
    }
  }
  else if ((v4[9] & 0x20) != 0)
  {
    goto LABEL_39;
  }
  timestamp = self->_timestamp;
  uint64_t v11 = v4[8];
  if ((unint64_t)timestamp | v11) {
    char isEqual = objc_msgSend_isEqual_(timestamp, v8, v11, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_40:

  return isEqual;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double latitude = self->_latitude;
    double v8 = -latitude;
    if (latitude >= 0.0) {
      double v8 = self->_latitude;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double longitude = self->_longitude;
    double v13 = -longitude;
    if (longitude >= 0.0) {
      double v13 = self->_longitude;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 4) != 0)
  {
    double horizontalAccuracy = self->_horizontalAccuracy;
    double v18 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      double v18 = self->_horizontalAccuracy;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if (has)
  {
    double altitude = self->_altitude;
    double v23 = -altitude;
    if (altitude >= 0.0) {
      double v23 = self->_altitude;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double verticalAccuracy = self->_verticalAccuracy;
    double v28 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      double v28 = self->_verticalAccuracy;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((has & 2) != 0)
  {
    double course = self->_course;
    double v33 = -course;
    if (course >= 0.0) {
      double v33 = self->_course;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double speed = self->_speed;
    double v38 = -speed;
    if (speed >= 0.0) {
      double v38 = self->_speed;
    }
    long double v39 = floor(v38 + 0.5);
    double v40 = (v38 - v39) * 1.84467441e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    unint64_t v36 = 0;
  }
  return v11 ^ v6 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36 ^ objc_msgSend_hash(self->_timestamp, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  unint64_t v6 = v4;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 8) != 0)
  {
    self->_double latitude = v4[4];
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 72);
    if ((v7 & 0x10) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if (((_BYTE)v4[9] & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitude = v4[5];
  *(unsigned char *)&self->_has |= 0x10u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 4) == 0)
  {
LABEL_4:
    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double horizontalAccuracy = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 1) == 0)
  {
LABEL_5:
    if ((v7 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_double altitude = v4[1];
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double verticalAccuracy = v4[7];
  *(unsigned char *)&self->_has |= 0x40u;
  char v7 = *((unsigned char *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_double course = v4[2];
  *(unsigned char *)&self->_has |= 2u;
  if (((_BYTE)v4[9] & 0x20) != 0)
  {
LABEL_8:
    self->_double speed = v4[6];
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
  timestamp = self->_timestamp;
  uint64_t v9 = *((void *)v6 + 8);
  if (timestamp)
  {
    if (!v9) {
      goto LABEL_22;
    }
    double v10 = v6;
    timestamp = objc_msgSend_mergeFrom_(timestamp, (const char *)v6, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_22;
    }
    double v10 = v6;
    timestamp = objc_msgSend_setTimestamp_(self, (const char *)v6, v9, v5);
  }
  unint64_t v6 = v10;
LABEL_22:

  MEMORY[0x1F41817F8](timestamp, v6);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)speed
{
  return self->_speed;
}

- (CKDPDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end