@interface HMDRemoteEventRouterProtoTopic
- (BOOL)hasEventUUID;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventUUID;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventUUID:(id)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_eventUUID, 0);
}

- (void)setEventUUID:(id)a3
{
}

- (NSString)eventUUID
{
  return self->_eventUUID;
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
  v5 = v4;
  if (v4[2])
  {
    -[HMDRemoteEventRouterProtoTopic setTopic:](self, "setTopic:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[HMDRemoteEventRouterProtoTopic setEventUUID:](self, "setEventUUID:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_topic hash];
  return [(NSString *)self->_eventUUID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((topic = self->_topic, !((unint64_t)topic | v4[2]))
     || -[NSString isEqual:](topic, "isEqual:")))
  {
    eventUUID = self->_eventUUID;
    if ((unint64_t)eventUUID | v4[1]) {
      char v7 = -[NSString isEqual:](eventUUID, "isEqual:");
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

  uint64_t v8 = [(NSString *)self->_eventUUID copyWithZone:a3];
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
  if (self->_eventUUID)
  {
    objc_msgSend(v5, "setEventUUID:");
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
  if (self->_eventUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoTopicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  eventUUID = self->_eventUUID;
  if (eventUUID) {
    [v4 setObject:eventUUID forKey:@"eventUUID"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoTopic;
  id v4 = [(HMDRemoteEventRouterProtoTopic *)&v8 description];
  id v5 = [(HMDRemoteEventRouterProtoTopic *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventUUID
{
  return self->_eventUUID != 0;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

@end