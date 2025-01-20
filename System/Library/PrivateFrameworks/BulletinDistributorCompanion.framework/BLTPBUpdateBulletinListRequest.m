@interface BLTPBUpdateBulletinListRequest
- (BLTPBFullBulletinList)bulletinList;
- (BOOL)hasBulletinList;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBulletinList:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBUpdateBulletinListRequest

- (BOOL)hasBulletinList
{
  return self->_bulletinList != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBUpdateBulletinListRequest;
  v4 = [(BLTPBUpdateBulletinListRequest *)&v8 description];
  v5 = [(BLTPBUpdateBulletinListRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  bulletinList = self->_bulletinList;
  if (bulletinList)
  {
    v5 = [(BLTPBFullBulletinList *)bulletinList dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bulletinList"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBUpdateBulletinListRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bulletinList) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  bulletinList = self->_bulletinList;
  if (bulletinList) {
    [a3 setBulletinList:bulletinList];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BLTPBFullBulletinList *)self->_bulletinList copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    bulletinList = self->_bulletinList;
    if ((unint64_t)bulletinList | v4[1]) {
      char v6 = -[BLTPBFullBulletinList isEqual:](bulletinList, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BLTPBFullBulletinList *)self->_bulletinList hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  bulletinList = self->_bulletinList;
  uint64_t v6 = v4[1];
  if (bulletinList)
  {
    if (v6) {
      -[BLTPBFullBulletinList mergeFrom:](bulletinList, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BLTPBUpdateBulletinListRequest setBulletinList:](self, "setBulletinList:");
  }
  MEMORY[0x270F9A758]();
}

- (BLTPBFullBulletinList)bulletinList
{
  return self->_bulletinList;
}

- (void)setBulletinList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end