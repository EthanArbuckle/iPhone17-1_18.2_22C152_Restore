@interface NanoMessagesProtoSyncDeviceSalt
- (BOOL)hasDeviceSalt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)deviceSalt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceSalt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NanoMessagesProtoSyncDeviceSalt

- (BOOL)hasDeviceSalt
{
  return self->_deviceSalt != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NanoMessagesProtoSyncDeviceSalt;
  v3 = [(NanoMessagesProtoSyncDeviceSalt *)&v7 description];
  v4 = [(NanoMessagesProtoSyncDeviceSalt *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  deviceSalt = self->_deviceSalt;
  if (deviceSalt) {
    [v3 setObject:deviceSalt forKey:@"deviceSalt"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NanoMessagesProtoSyncDeviceSaltReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceSalt) {
    _PBDataWriterWriteDataField(a3);
  }
}

- (void)copyTo:(id)a3
{
  deviceSalt = self->_deviceSalt;
  if (deviceSalt) {
    [a3 setDeviceSalt:deviceSalt];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_deviceSalt copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    deviceSalt = self->_deviceSalt;
    if ((unint64_t)deviceSalt | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](deviceSalt, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_deviceSalt hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NanoMessagesProtoSyncDeviceSalt setDeviceSalt:](self, "setDeviceSalt:");
  }
}

- (NSData)deviceSalt
{
  return self->_deviceSalt;
}

- (void)setDeviceSalt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end