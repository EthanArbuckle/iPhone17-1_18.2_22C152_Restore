@interface FCCCoalescingRuleProtobuf
- (BOOL)hasEventIdentifier;
- (BOOL)hasInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventIdentifier;
- (double)interval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setHasInterval:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCCoalescingRuleProtobuf

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (void)setInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_interval = a3;
}

- (void)setHasInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCCoalescingRuleProtobuf;
  v4 = [(FCCCoalescingRuleProtobuf *)&v8 description];
  v5 = [(FCCCoalescingRuleProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  eventIdentifier = self->_eventIdentifier;
  if (eventIdentifier) {
    [v3 setObject:eventIdentifier forKey:@"eventIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_interval];
    [v4 setObject:v6 forKey:@"interval"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCCoalescingRuleProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_eventIdentifier)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEventIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_interval;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_eventIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_interval;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  eventIdentifier = self->_eventIdentifier;
  if ((unint64_t)eventIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](eventIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_interval == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double interval = self->_interval;
    double v6 = -interval;
    if (interval >= 0.0) {
      double v6 = self->_interval;
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
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[FCCCoalescingRuleProtobuf setEventIdentifier:](self, "setEventIdentifier:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[3])
  {
    self->_double interval = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
}

@end