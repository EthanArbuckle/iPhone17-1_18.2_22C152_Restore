@interface BLTPBRemoveBulletinRequest
- (BOOL)hasPublisherBulletinID;
- (BOOL)hasRecordID;
- (BOOL)hasSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBRemoveBulletinRequest

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBRemoveBulletinRequest;
  v4 = [(BLTPBRemoveBulletinRequest *)&v8 description];
  v5 = [(BLTPBRemoveBulletinRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID) {
    [v3 setObject:publisherBulletinID forKey:@"publisherBulletinID"];
  }
  recordID = self->_recordID;
  if (recordID) {
    [v4 setObject:recordID forKey:@"recordID"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v4 setObject:sectionID forKey:@"sectionID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBRemoveBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publisherBulletinID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recordID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v4, "setPublisherBulletinID:");
    id v4 = v5;
  }
  if (self->_recordID)
  {
    objc_msgSend(v5, "setRecordID:");
    id v4 = v5;
  }
  if (self->_sectionID)
  {
    objc_msgSend(v5, "setSectionID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_recordID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_sectionID copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[1]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:"))
    && ((recordID = self->_recordID, !((unint64_t)recordID | v4[2]))
     || -[NSString isEqual:](recordID, "isEqual:")))
  {
    sectionID = self->_sectionID;
    if ((unint64_t)sectionID | v4[3]) {
      char v8 = -[NSString isEqual:](sectionID, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_publisherBulletinID hash];
  NSUInteger v4 = [(NSString *)self->_recordID hash] ^ v3;
  return v4 ^ [(NSString *)self->_sectionID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[BLTPBRemoveBulletinRequest setPublisherBulletinID:](self, "setPublisherBulletinID:");
  }
  if (v4[2]) {
    -[BLTPBRemoveBulletinRequest setRecordID:](self, "setRecordID:");
  }
  if (v4[3]) {
    -[BLTPBRemoveBulletinRequest setSectionID:](self, "setSectionID:");
  }
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end