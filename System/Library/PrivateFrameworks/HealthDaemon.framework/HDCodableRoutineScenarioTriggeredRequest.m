@interface HDCodableRoutineScenarioTriggeredRequest
- (BOOL)hasCurrentLocation;
- (BOOL)hasTriggerTypes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRoutineLocation)currentLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)triggerTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setHasTriggerTypes:(BOOL)a3;
- (void)setTriggerTypes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineScenarioTriggeredRequest

- (void)setTriggerTypes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_triggerTypes = a3;
}

- (void)setHasTriggerTypes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerTypes
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCurrentLocation
{
  return self->_currentLocation != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineScenarioTriggeredRequest;
  v4 = [(HDCodableRoutineScenarioTriggeredRequest *)&v8 description];
  v5 = [(HDCodableRoutineScenarioTriggeredRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_triggerTypes];
    [v3 setObject:v4 forKey:@"triggerTypes"];
  }
  currentLocation = self->_currentLocation;
  if (currentLocation)
  {
    v6 = [(HDCodableRoutineLocation *)currentLocation dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"currentLocation"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineScenarioTriggeredRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_currentLocation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_triggerTypes;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_currentLocation)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCurrentLocation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_triggerTypes;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(HDCodableRoutineLocation *)self->_currentLocation copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_triggerTypes != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  currentLocation = self->_currentLocation;
  if ((unint64_t)currentLocation | *((void *)v4 + 2)) {
    char v6 = -[HDCodableRoutineLocation isEqual:](currentLocation, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_triggerTypes;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(HDCodableRoutineLocation *)self->_currentLocation hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4[3])
  {
    self->_triggerTypes = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  currentLocation = self->_currentLocation;
  uint64_t v7 = v5[2];
  if (currentLocation)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[HDCodableRoutineLocation mergeFrom:](currentLocation, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[HDCodableRoutineScenarioTriggeredRequest setCurrentLocation:](self, "setCurrentLocation:");
  }
  uint64_t v5 = v8;
LABEL_9:
}

- (unint64_t)triggerTypes
{
  return self->_triggerTypes;
}

- (HDCodableRoutineLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end