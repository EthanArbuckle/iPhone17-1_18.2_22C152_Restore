@interface BLTPBHandleSnoozeActionRequest
- (BLTPBActionInformation)actionInfo;
- (BOOL)hasActionInfo;
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
- (void)setActionInfo:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBHandleSnoozeActionRequest

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

- (BOOL)hasActionInfo
{
  return self->_actionInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBHandleSnoozeActionRequest;
  v4 = [(BLTPBHandleSnoozeActionRequest *)&v8 description];
  v5 = [(BLTPBHandleSnoozeActionRequest *)self dictionaryRepresentation];
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
  actionInfo = self->_actionInfo;
  if (actionInfo)
  {
    v9 = [(BLTPBActionInformation *)actionInfo dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"actionInfo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBHandleSnoozeActionRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_actionInfo)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_actionInfo)
  {
    objc_msgSend(v5, "setActionInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_recordID copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_sectionID copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(BLTPBActionInformation *)self->_actionInfo copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[2]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:"))
    && ((recordID = self->_recordID, !((unint64_t)recordID | v4[3]))
     || -[NSString isEqual:](recordID, "isEqual:"))
    && ((sectionID = self->_sectionID, !((unint64_t)sectionID | v4[4]))
     || -[NSString isEqual:](sectionID, "isEqual:")))
  {
    actionInfo = self->_actionInfo;
    if ((unint64_t)actionInfo | v4[1]) {
      char v9 = -[BLTPBActionInformation isEqual:](actionInfo, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_publisherBulletinID hash];
  NSUInteger v4 = [(NSString *)self->_recordID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sectionID hash];
  return v4 ^ v5 ^ [(BLTPBActionInformation *)self->_actionInfo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[BLTPBHandleSnoozeActionRequest setPublisherBulletinID:](self, "setPublisherBulletinID:");
    NSUInteger v4 = v7;
  }
  if (v4[3])
  {
    -[BLTPBHandleSnoozeActionRequest setRecordID:](self, "setRecordID:");
    NSUInteger v4 = v7;
  }
  if (v4[4])
  {
    -[BLTPBHandleSnoozeActionRequest setSectionID:](self, "setSectionID:");
    NSUInteger v4 = v7;
  }
  actionInfo = self->_actionInfo;
  uint64_t v6 = v4[1];
  if (actionInfo)
  {
    if (v6) {
      -[BLTPBActionInformation mergeFrom:](actionInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BLTPBHandleSnoozeActionRequest setActionInfo:](self, "setActionInfo:");
  }
  MEMORY[0x270F9A758]();
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

- (BLTPBActionInformation)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
}

@end