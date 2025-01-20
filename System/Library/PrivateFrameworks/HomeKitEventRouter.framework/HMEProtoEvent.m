@interface HMEProtoEvent
- (BOOL)hasEventData;
- (BOOL)hasEventMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMEProtoEventMetadata)eventMetadata;
- (NSData)eventData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMEProtoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
}

- (void)setEventMetadata:(id)a3
{
}

- (HMEProtoEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventData:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HMEProtoEvent setEventData:](self, "setEventData:");
    v4 = v7;
  }
  eventMetadata = self->_eventMetadata;
  uint64_t v6 = v4[2];
  if (eventMetadata)
  {
    if (v6) {
      -[HMEProtoEventMetadata mergeFrom:](eventMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HMEProtoEvent setEventMetadata:](self, "setEventMetadata:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_eventData hash];
  return [(HMEProtoEventMetadata *)self->_eventMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((eventData = self->_eventData, !((unint64_t)eventData | v4[1]))
     || -[NSData isEqual:](eventData, "isEqual:")))
  {
    eventMetadata = self->_eventMetadata;
    if ((unint64_t)eventMetadata | v4[2]) {
      char v7 = -[HMEProtoEventMetadata isEqual:](eventMetadata, "isEqual:");
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
  uint64_t v6 = [(NSData *)self->_eventData copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(HMEProtoEventMetadata *)self->_eventMetadata copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventData)
  {
    objc_msgSend(v4, "setEventData:");
    id v4 = v5;
  }
  if (self->_eventMetadata)
  {
    objc_msgSend(v5, "setEventMetadata:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_eventMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMEProtoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  eventData = self->_eventData;
  if (eventData) {
    [v3 setObject:eventData forKey:@"eventData"];
  }
  eventMetadata = self->_eventMetadata;
  if (eventMetadata)
  {
    char v7 = [(HMEProtoEventMetadata *)eventMetadata dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"eventMetadata"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMEProtoEvent;
  id v4 = [(HMEProtoEvent *)&v8 description];
  id v5 = [(HMEProtoEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (BOOL)hasEventData
{
  return self->_eventData != 0;
}

@end