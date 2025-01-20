@interface BLTPBAddBulletinSummaryRequest
- (BLTPBBulletinSummary)bulletin;
- (BOOL)hasBulletin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBulletin:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBAddBulletinSummaryRequest

- (BOOL)hasBulletin
{
  return self->_bulletin != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBAddBulletinSummaryRequest;
  v4 = [(BLTPBAddBulletinSummaryRequest *)&v8 description];
  v5 = [(BLTPBAddBulletinSummaryRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  bulletin = self->_bulletin;
  if (bulletin)
  {
    v5 = [(BLTPBBulletinSummary *)bulletin dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"bulletin"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAddBulletinSummaryRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bulletin) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  bulletin = self->_bulletin;
  if (bulletin) {
    [a3 setBulletin:bulletin];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(BLTPBBulletinSummary *)self->_bulletin copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    bulletin = self->_bulletin;
    if ((unint64_t)bulletin | v4[1]) {
      char v6 = -[BLTPBBulletinSummary isEqual:](bulletin, "isEqual:");
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
  return [(BLTPBBulletinSummary *)self->_bulletin hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  bulletin = self->_bulletin;
  uint64_t v6 = v4[1];
  if (bulletin)
  {
    if (v6) {
      -[BLTPBBulletinSummary mergeFrom:](bulletin, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BLTPBAddBulletinSummaryRequest setBulletin:](self, "setBulletin:");
  }
  MEMORY[0x270F9A758]();
}

- (BLTPBBulletinSummary)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end