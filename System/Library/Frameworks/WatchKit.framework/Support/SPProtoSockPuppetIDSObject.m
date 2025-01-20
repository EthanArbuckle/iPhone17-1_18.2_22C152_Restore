@interface SPProtoSockPuppetIDSObject
- (BOOL)hasReceiver;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)objectData;
- (NSString)receiver;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setObjectData:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoSockPuppetIDSObject

- (BOOL)hasReceiver
{
  return self->_receiver != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SPProtoSockPuppetIDSObject;
  v3 = [(SPProtoSockPuppetIDSObject *)&v7 description];
  v4 = [(SPProtoSockPuppetIDSObject *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_type];
  [v3 setObject:v4 forKey:@"type"];

  objectData = self->_objectData;
  if (objectData) {
    [v3 setObject:objectData forKey:@"objectData"];
  }
  receiver = self->_receiver;
  if (receiver) {
    [v3 setObject:receiver forKey:@"receiver"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetIDSObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();
  if (self->_receiver) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[6] = self->_type;
  id v5 = v4;
  [v4 setObjectData:self->_objectData];
  if (self->_receiver) {
    objc_msgSend(v5, "setReceiver:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[6] = self->_type;
  id v6 = [(NSData *)self->_objectData copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  id v8 = [(NSString *)self->_receiver copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_type == *((_DWORD *)v4 + 6)
    && ((objectData = self->_objectData, !((unint64_t)objectData | v4[1]))
     || -[NSData isEqual:](objectData, "isEqual:")))
  {
    receiver = self->_receiver;
    if ((unint64_t)receiver | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](receiver, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_type;
  unint64_t v4 = (unint64_t)[(NSData *)self->_objectData hash];
  return v4 ^ [(NSString *)self->_receiver hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_type = v4[6];
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[SPProtoSockPuppetIDSObject setObjectData:](self, "setObjectData:");
    unint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SPProtoSockPuppetIDSObject setReceiver:](self, "setReceiver:");
    unint64_t v4 = v5;
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)objectData
{
  return self->_objectData;
}

- (void)setObjectData:(id)a3
{
}

- (NSString)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);

  objc_storeStrong((id *)&self->_objectData, 0);
}

@end