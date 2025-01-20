@interface AWDBiometricKitEventLog
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)eventAtIndex:(unint64_t)a3;
- (unsigned)events;
- (void)addEvent:(unsigned int)a3;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEvents:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBiometricKitEventLog

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDBiometricKitEventLog;
  [(AWDBiometricKitEventLog *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)eventsCount
{
  return self->_events.count;
}

- (unsigned)events
{
  return self->_events.list;
}

- (void)clearEvents
{
}

- (void)addEvent:(unsigned int)a3
{
}

- (unsigned)eventAtIndex:(unint64_t)a3
{
  p_events = &self->_events;
  unint64_t count = self->_events.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_events->list[a3];
}

- (void)setEvents:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBiometricKitEventLog;
  v4 = [(AWDBiometricKitEventLog *)&v8 description];
  v5 = [(AWDBiometricKitEventLog *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"event"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBiometricKitEventLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
  p_events = &self->_events;
  if (p_events->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_events->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v8 = v4;
  if ([(AWDBiometricKitEventLog *)self eventsCount])
  {
    [v8 clearEvents];
    unint64_t v5 = [(AWDBiometricKitEventLog *)self eventsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addEvent:", -[AWDBiometricKitEventLog eventAtIndex:](self, "eventAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_timestamp = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v8 = v4;
  uint64_t v5 = [v4 eventsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDBiometricKitEventLog addEvent:](self, "addEvent:", [v8 eventAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end