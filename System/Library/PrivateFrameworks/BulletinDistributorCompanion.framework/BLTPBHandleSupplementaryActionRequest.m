@interface BLTPBHandleSupplementaryActionRequest
- (BLTPBActionInformation)actionInfo;
- (BOOL)hasActionInfo;
- (BOOL)hasIdentifier;
- (BOOL)hasPublisherBulletinID;
- (BOOL)hasRecordID;
- (BOOL)hasSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
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
- (void)setIdentifier:(id)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBHandleSupplementaryActionRequest

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

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
  v8.super_class = (Class)BLTPBHandleSupplementaryActionRequest;
  v4 = [(BLTPBHandleSupplementaryActionRequest *)&v8 description];
  v5 = [(BLTPBHandleSupplementaryActionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID) {
    [v4 setObject:publisherBulletinID forKey:@"publisherBulletinID"];
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
    v10 = [(BLTPBActionInformation *)actionInfo dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"actionInfo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBHandleSupplementaryActionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
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
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v5, "setPublisherBulletinID:");
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
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_recordID copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_sectionID copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = [(BLTPBActionInformation *)self->_actionInfo copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[3]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:"))
    && ((recordID = self->_recordID, !((unint64_t)recordID | v4[4]))
     || -[NSString isEqual:](recordID, "isEqual:"))
    && ((sectionID = self->_sectionID, !((unint64_t)sectionID | v4[5]))
     || -[NSString isEqual:](sectionID, "isEqual:")))
  {
    actionInfo = self->_actionInfo;
    if ((unint64_t)actionInfo | v4[1]) {
      char v10 = -[BLTPBActionInformation isEqual:](actionInfo, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_publisherBulletinID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_recordID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sectionID hash];
  return v6 ^ [(BLTPBActionInformation *)self->_actionInfo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v6 = a3;
  if (v6[2]) {
    -[BLTPBHandleSupplementaryActionRequest setIdentifier:](self, "setIdentifier:");
  }
  if (v6[3]) {
    -[BLTPBHandleSupplementaryActionRequest setPublisherBulletinID:](self, "setPublisherBulletinID:");
  }
  if (v6[4]) {
    -[BLTPBHandleSupplementaryActionRequest setRecordID:](self, "setRecordID:");
  }
  if (v6[5]) {
    -[BLTPBHandleSupplementaryActionRequest setSectionID:](self, "setSectionID:");
  }
  actionInfo = self->_actionInfo;
  uint64_t v5 = v6[1];
  if (actionInfo)
  {
    if (v5) {
      -[BLTPBActionInformation mergeFrom:](actionInfo, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[BLTPBHandleSupplementaryActionRequest setActionInfo:](self, "setActionInfo:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
}

@end