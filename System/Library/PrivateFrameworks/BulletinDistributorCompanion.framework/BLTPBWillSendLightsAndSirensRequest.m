@interface BLTPBWillSendLightsAndSirensRequest
- (BOOL)hasPublisherBulletinID;
- (BOOL)hasRecordID;
- (BOOL)hasSectionID;
- (BOOL)hasSystemApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)systemApp;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSystemApp:(BOOL)a3;
- (void)setPublisherBulletinID:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSystemApp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBWillSendLightsAndSirensRequest

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

- (void)setSystemApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_systemApp = a3;
}

- (void)setHasSystemApp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSystemApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBWillSendLightsAndSirensRequest;
  v4 = [(BLTPBWillSendLightsAndSirensRequest *)&v8 description];
  v5 = [(BLTPBWillSendLightsAndSirensRequest *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_systemApp];
    [v4 setObject:v8 forKey:@"systemApp"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBWillSendLightsAndSirensRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
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
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_systemApp;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_publisherBulletinID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_recordID copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_sectionID copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_systemApp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  publisherBulletinID = self->_publisherBulletinID;
  if ((unint64_t)publisherBulletinID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](publisherBulletinID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  recordID = self->_recordID;
  if ((unint64_t)recordID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](recordID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_systemApp)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_publisherBulletinID hash];
  NSUInteger v4 = [(NSString *)self->_recordID hash];
  NSUInteger v5 = [(NSString *)self->_sectionID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_systemApp;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[BLTPBWillSendLightsAndSirensRequest setPublisherBulletinID:](self, "setPublisherBulletinID:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BLTPBWillSendLightsAndSirensRequest setRecordID:](self, "setRecordID:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BLTPBWillSendLightsAndSirensRequest setSectionID:](self, "setSectionID:");
    NSUInteger v4 = v5;
  }
  if (v4[36])
  {
    self->_systemApp = v4[32];
    *(unsigned char *)&self->_has |= 1u;
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

- (BOOL)systemApp
{
  return self->_systemApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end