@interface BMPBHomeKitClientBase
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasClientName;
- (BOOL)hasDuration;
- (BOOL)hasEventCorrelationIdentifier;
- (BOOL)hasHomeOccupancy;
- (BOOL)hasHomeUniqueIdentifier;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientName;
- (NSString)eventCorrelationIdentifier;
- (NSString)homeUniqueIdentifier;
- (NSString)source;
- (double)absoluteTimestamp;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)homeOccupancy;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setClientName:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEventCorrelationIdentifier:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHomeOccupancy:(BOOL)a3;
- (void)setHomeOccupancy:(int)a3;
- (void)setHomeUniqueIdentifier:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBHomeKitClientBase

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasHomeUniqueIdentifier
{
  return self->_homeUniqueIdentifier != 0;
}

- (void)setHomeOccupancy:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_homeOccupancy = a3;
}

- (void)setHasHomeOccupancy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeOccupancy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasClientName
{
  return self->_clientName != 0;
}

- (BOOL)hasEventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBHomeKitClientBase;
  v4 = [(BMPBHomeKitClientBase *)&v8 description];
  v5 = [(BMPBHomeKitClientBase *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v5 forKey:@"absoluteTimestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v6 forKey:@"duration"];
  }
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  if (homeUniqueIdentifier) {
    [v3 setObject:homeUniqueIdentifier forKey:@"homeUniqueIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_homeOccupancy];
    [v3 setObject:v8 forKey:@"homeOccupancy"];
  }
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  clientName = self->_clientName;
  if (clientName) {
    [v3 setObject:clientName forKey:@"clientName"];
  }
  eventCorrelationIdentifier = self->_eventCorrelationIdentifier;
  if (eventCorrelationIdentifier) {
    [v3 setObject:eventCorrelationIdentifier forKey:@"eventCorrelationIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientBaseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_homeUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_eventCorrelationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_duration;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  id v6 = v4;
  if (self->_homeUniqueIdentifier)
  {
    objc_msgSend(v4, "setHomeUniqueIdentifier:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_homeOccupancy;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
    id v4 = v6;
  }
  if (self->_clientName)
  {
    objc_msgSend(v6, "setClientName:");
    id v4 = v6;
  }
  if (self->_eventCorrelationIdentifier)
  {
    objc_msgSend(v6, "setEventCorrelationIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_duration;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_homeUniqueIdentifier copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_homeOccupancy;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_source copyWithZone:a3];
  v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_clientName copyWithZone:a3];
  v13 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_eventCorrelationIdentifier copyWithZone:a3];
  v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  if ((unint64_t)homeUniqueIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeUniqueIdentifier, "isEqual:"))
    {
LABEL_26:
      char v10 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_homeOccupancy != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_26;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 7) && !-[NSString isEqual:](source, "isEqual:")) {
    goto LABEL_26;
  }
  clientName = self->_clientName;
  if ((unint64_t)clientName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientName, "isEqual:")) {
      goto LABEL_26;
    }
  }
  eventCorrelationIdentifier = self->_eventCorrelationIdentifier;
  if ((unint64_t)eventCorrelationIdentifier | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](eventCorrelationIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v6 = self->_absoluteTimestamp;
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
  if ((has & 2) != 0)
  {
    double duration = self->_duration;
    double v11 = -duration;
    if (duration >= 0.0) {
      double v11 = self->_duration;
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
  NSUInteger v14 = [(NSString *)self->_homeUniqueIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_homeOccupancy;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = v9 ^ v4 ^ v15 ^ v14;
  NSUInteger v17 = [(NSString *)self->_source hash];
  NSUInteger v18 = v16 ^ v17 ^ [(NSString *)self->_clientName hash];
  return v18 ^ [(NSString *)self->_eventCorrelationIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_double duration = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[BMPBHomeKitClientBase setHomeUniqueIdentifier:](self, "setHomeUniqueIdentifier:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    self->_homeOccupancy = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBHomeKitClientBase setSource:](self, "setSource:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBHomeKitClientBase setClientName:](self, "setClientName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBHomeKitClientBase setEventCorrelationIdentifier:](self, "setEventCorrelationIdentifier:");
    id v4 = v6;
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (void)setHomeUniqueIdentifier:(id)a3
{
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (void)setEventCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

@end