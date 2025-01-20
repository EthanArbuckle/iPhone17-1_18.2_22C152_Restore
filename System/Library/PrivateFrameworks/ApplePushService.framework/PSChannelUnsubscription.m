@interface PSChannelUnsubscription
- (BOOL)hasChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSChannelUnsubscription

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PSChannelUnsubscription;
  v3 = [(PSChannelUnsubscription *)&v7 description];
  v4 = [(PSChannelUnsubscription *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  channelId = self->_channelId;
  if (channelId) {
    [v3 setObject:channelId forKey:@"channel_id"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000852B8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_channelId) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  channelId = self->_channelId;
  if (channelId) {
    [a3 setChannelId:channelId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_channelId copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    channelId = self->_channelId;
    if ((unint64_t)channelId | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](channelId, "isEqual:");
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
  return (unint64_t)[(NSData *)self->_channelId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PSChannelUnsubscription setChannelId:](self, "setChannelId:");
  }
}

- (NSData)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end