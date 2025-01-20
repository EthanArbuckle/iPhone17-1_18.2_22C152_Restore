@interface BMPBSiriIntentEvent
- (BOOL)hasEventData;
- (BOOL)hasEventType;
- (BOOL)hasIntentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)eventData;
- (NSString)eventType;
- (NSString)intentId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventType:(id)a3;
- (void)setIntentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriIntentEvent

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (BOOL)hasEventData
{
  return self->_eventData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriIntentEvent;
  v4 = [(BMPBSiriIntentEvent *)&v8 description];
  v5 = [(BMPBSiriIntentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  intentId = self->_intentId;
  if (intentId) {
    [v3 setObject:intentId forKey:@"intentId"];
  }
  eventType = self->_eventType;
  if (eventType) {
    [v4 setObject:eventType forKey:@"eventType"];
  }
  eventData = self->_eventData;
  if (eventData) {
    [v4 setObject:eventData forKey:@"eventData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriIntentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_intentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_intentId)
  {
    objc_msgSend(v4, "setIntentId:");
    id v4 = v5;
  }
  if (self->_eventType)
  {
    objc_msgSend(v5, "setEventType:");
    id v4 = v5;
  }
  if (self->_eventData)
  {
    objc_msgSend(v5, "setEventData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_intentId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_eventType copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_eventData copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((intentId = self->_intentId, !((unint64_t)intentId | v4[3]))
     || -[NSString isEqual:](intentId, "isEqual:"))
    && ((eventType = self->_eventType, !((unint64_t)eventType | v4[2]))
     || -[NSString isEqual:](eventType, "isEqual:")))
  {
    eventData = self->_eventData;
    if ((unint64_t)eventData | v4[1]) {
      char v8 = -[NSData isEqual:](eventData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_intentId hash];
  NSUInteger v4 = [(NSString *)self->_eventType hash] ^ v3;
  return v4 ^ [(NSData *)self->_eventData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[BMPBSiriIntentEvent setIntentId:](self, "setIntentId:");
  }
  if (v4[2]) {
    -[BMPBSiriIntentEvent setEventType:](self, "setEventType:");
  }
  if (v4[1]) {
    -[BMPBSiriIntentEvent setEventData:](self, "setEventData:");
  }
}

- (NSString)intentId
{
  return self->_intentId;
}

- (void)setIntentId:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_eventData, 0);
}

@end