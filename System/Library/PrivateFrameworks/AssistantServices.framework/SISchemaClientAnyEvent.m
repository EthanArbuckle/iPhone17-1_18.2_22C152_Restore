@interface SISchemaClientAnyEvent
- (BOOL)hasEventData;
- (BOOL)hasEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)eventData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)si_dictionaryRepresentation;
- (int)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaClientAnyEvent

- (id)si_dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = (objc_class *)SIReflectionInferClassFromEventType();
    if (v4)
    {
      v5 = NSStringFromClass(v4);
      [v3 setObject:v5 forKey:@"eventType"];
    }
    if (self->_eventData)
    {
      [(SISchemaClientAnyEvent *)self eventType];
      v6 = [(SISchemaClientAnyEvent *)self eventData];
      v7 = SIReflectionHydrateProtoFromEventTypeAndData();

      if (v7)
      {
        v8 = [v7 dictionaryRepresentation];
        [v3 setObject:v8 forKey:@"eventData"];
      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setEventData:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[5])
  {
    self->_eventType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[SISchemaClientAnyEvent setEventData:](self, "setEventData:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_eventData hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  eventData = self->_eventData;
  if ((unint64_t)eventData | *((void *)v4 + 1)) {
    char v6 = -[NSData isEqual:](eventData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_eventData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_eventType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_eventData)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setEventData:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientAnyEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_eventType];
    [v3 setObject:v4 forKey:@"eventType"];
  }
  eventData = self->_eventData;
  if (eventData) {
    [v3 setObject:eventData forKey:@"eventData"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SISchemaClientAnyEvent;
  id v4 = [(SISchemaClientAnyEvent *)&v8 description];
  id v5 = [(SISchemaClientAnyEvent *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventData
{
  return self->_eventData != 0;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventType = a3;
}

@end