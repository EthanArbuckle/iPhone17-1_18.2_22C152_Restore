@interface MSPPinStorage
- (BOOL)hasDroppedPin;
- (BOOL)hasIdentifier;
- (BOOL)hasPosition;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPDroppedPin)droppedPin;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (double)position;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDroppedPin:(id)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPosition:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPinStorage

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
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

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"DROPPED_PIN";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  return 1;
}

- (BOOL)hasDroppedPin
{
  return self->_droppedPin != 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPinStorage;
  v4 = [(MSPPinStorage *)&v8 description];
  v5 = [(MSPPinStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_position];
    [v4 setObject:v7 forKey:@"position"];

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
  objc_super v8 = [NSNumber numberWithDouble:self->_timestamp];
  [v4 setObject:v8 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  if (self->_type == 1)
  {
    v9 = @"DROPPED_PIN";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v9 forKey:@"type"];

LABEL_13:
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    v11 = [(MSPDroppedPin *)droppedPin dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"droppedPin"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v13 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
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
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_droppedPin)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 2) = *(void *)&self->_position;
    *((unsigned char *)v4 + 52) |= 1u;
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
  *((void *)v4 + 3) = *(void *)&self->_timestamp;
  *((unsigned char *)v4 + 52) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 12) = self->_type;
    *((unsigned char *)v4 + 52) |= 4u;
  }
LABEL_7:
  if (self->_droppedPin)
  {
    objc_msgSend(v6, "setDroppedPin:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 16) = self->_position;
  *(unsigned char *)(v5 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
LABEL_5:
  id v9 = [(MSPDroppedPin *)self->_droppedPin copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_position != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_21;
  }
  droppedPin = self->_droppedPin;
  if ((unint64_t)droppedPin | *((void *)v4 + 4)) {
    char v7 = -[MSPDroppedPin isEqual:](droppedPin, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double position = self->_position;
    double v7 = -position;
    if (position >= 0.0) {
      double v7 = self->_position;
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
    double timestamp = self->_timestamp;
    double v12 = -timestamp;
    if (timestamp >= 0.0) {
      double v12 = self->_timestamp;
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
    uint64_t v15 = 2654435761 * self->_type;
  }
  else {
    uint64_t v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ [(MSPDroppedPin *)self->_droppedPin hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[MSPPinStorage setIdentifier:](self, "setIdentifier:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_double position = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double timestamp = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
LABEL_6:
    self->_type = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  droppedPin = self->_droppedPin;
  uint64_t v7 = *((void *)v4 + 4);
  if (droppedPin)
  {
    if (v7) {
      -[MSPDroppedPin mergeFrom:](droppedPin, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MSPPinStorage setDroppedPin:](self, "setDroppedPin:");
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

- (double)position
{
  return self->_position;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (MSPDroppedPin)droppedPin
{
  return self->_droppedPin;
}

- (void)setDroppedPin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_droppedPin, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end