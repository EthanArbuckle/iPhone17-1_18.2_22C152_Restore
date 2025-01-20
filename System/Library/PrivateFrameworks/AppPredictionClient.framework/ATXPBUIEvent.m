@interface ATXPBUIEvent
- (BOOL)hasConsumerSubType;
- (BOOL)hasEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)consumerSubType;
- (uint64_t)event;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setConsumerSubType:(uint64_t)a1;
- (void)setEvent:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUIEvent

- (void)setEvent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setConsumerSubType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_consumerSubType, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)hasConsumerSubType
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (BOOL)hasEvent
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUIEvent;
  id v4 = [(ATXPBUIEvent *)&v8 description];
  id v5 = [(ATXPBUIEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  event = self->_event;
  if (event) {
    [v4 setObject:event forKey:@"event"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    id v6 = v3;
    if (v4)
    {
      -[ATXPBUIEvent setConsumerSubType:]((uint64_t)v3, v4);
      id v3 = v6;
    }
    id v5 = *(void **)(a1 + 16);
    if (v5)
    {
      -[ATXPBUIEvent setEvent:]((uint64_t)v6, v5);
      id v3 = v6;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_event copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[1]))
     || -[NSString isEqual:](consumerSubType, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[2]) {
      char v7 = -[NSData isEqual:](event, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_consumerSubType hash];
  return [(NSData *)self->_event hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    id v4 = (void *)v3[1];
    uint64_t v6 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      NSUInteger v3 = v6;
    }
    id v5 = (void *)v3[2];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      NSUInteger v3 = v6;
    }
  }
}

- (uint64_t)consumerSubType
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)event
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

@end