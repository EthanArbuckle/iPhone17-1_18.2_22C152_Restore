@interface HMEProtoEventInfo
- (BOOL)hasEvent;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMEProtoEvent)event;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEvent:(id)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMEProtoEventInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)setEvent:(id)a3
{
}

- (HMEProtoEvent)event
{
  return self->_event;
}

- (void)setTopic:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HMEProtoEventInfo setTopic:](self, "setTopic:");
    v4 = v7;
  }
  event = self->_event;
  uint64_t v6 = v4[1];
  if (event)
  {
    if (v6) {
      -[HMEProtoEvent mergeFrom:](event, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HMEProtoEventInfo setEvent:](self, "setEvent:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_topic hash];
  return [(HMEProtoEvent *)self->_event hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topic = self->_topic, !((unint64_t)topic | v4[2]))
     || -[NSString isEqual:](topic, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1]) {
      char v7 = -[HMEProtoEvent isEqual:](event, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_topic copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HMEProtoEvent *)self->_event copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_topic)
  {
    objc_msgSend(v4, "setTopic:");
    id v4 = v5;
  }
  if (self->_event)
  {
    objc_msgSend(v5, "setEvent:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  event = self->_event;
  if (event)
  {
    char v7 = [(HMEProtoEvent *)event dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"event"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMEProtoEventInfo;
  id v4 = [(HMEProtoEventInfo *)&v8 description];
  id v5 = [(HMEProtoEventInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

@end