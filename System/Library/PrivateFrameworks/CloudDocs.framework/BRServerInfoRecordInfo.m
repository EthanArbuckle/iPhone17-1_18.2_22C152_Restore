@interface BRServerInfoRecordInfo
- (BOOL)hasBounceNo;
- (BOOL)hasEncryptedBasename;
- (BOOL)hasEtag;
- (BOOL)hasExtension;
- (BOOL)hasRecordID;
- (BOOL)hasRecordProtectionInfo;
- (BOOL)hasZoneName;
- (BOOL)hasZoneProtectionInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedBasename;
- (NSData)recordProtectionInfo;
- (NSData)zoneProtectionInfo;
- (NSString)etag;
- (NSString)extension;
- (NSString)recordID;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bounceNo;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounceNo:(unint64_t)a3;
- (void)setEncryptedBasename:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExtension:(id)a3;
- (void)setHasBounceNo:(BOOL)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordProtectionInfo:(id)a3;
- (void)setZoneName:(id)a3;
- (void)setZoneProtectionInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRServerInfoRecordInfo

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasEncryptedBasename
{
  return self->_encryptedBasename != 0;
}

- (void)setBounceNo:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bounceNo = a3;
}

- (void)setHasBounceNo:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBounceNo
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (BOOL)hasRecordProtectionInfo
{
  return self->_recordProtectionInfo != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasZoneProtectionInfo
{
  return self->_zoneProtectionInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRServerInfoRecordInfo;
  v4 = [(BRServerInfoRecordInfo *)&v8 description];
  v5 = [(BRServerInfoRecordInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  recordID = self->_recordID;
  if (recordID) {
    [v3 setObject:recordID forKey:@"recordID"];
  }
  etag = self->_etag;
  if (etag) {
    [v4 setObject:etag forKey:@"etag"];
  }
  encryptedBasename = self->_encryptedBasename;
  if (encryptedBasename) {
    [v4 setObject:encryptedBasename forKey:@"encryptedBasename"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_bounceNo];
    [v4 setObject:v8 forKey:@"bounceNo"];
  }
  extension = self->_extension;
  if (extension) {
    [v4 setObject:extension forKey:@"extension"];
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo) {
    [v4 setObject:recordProtectionInfo forKey:@"recordProtectionInfo"];
  }
  zoneName = self->_zoneName;
  if (zoneName) {
    [v4 setObject:zoneName forKey:@"zoneName"];
  }
  zoneProtectionInfo = self->_zoneProtectionInfo;
  if (zoneProtectionInfo) {
    [v4 setObject:zoneProtectionInfo forKey:@"zoneProtectionInfo"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRServerInfoRecordInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recordID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_encryptedBasename)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_extension)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recordProtectionInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_zoneProtectionInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recordID)
  {
    objc_msgSend(v4, "setRecordID:");
    id v4 = v5;
  }
  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    id v4 = v5;
  }
  if (self->_encryptedBasename)
  {
    objc_msgSend(v5, "setEncryptedBasename:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_bounceNo;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_extension)
  {
    objc_msgSend(v5, "setExtension:");
    id v4 = v5;
  }
  if (self->_recordProtectionInfo)
  {
    objc_msgSend(v5, "setRecordProtectionInfo:");
    id v4 = v5;
  }
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    id v4 = v5;
  }
  if (self->_zoneProtectionInfo)
  {
    objc_msgSend(v5, "setZoneProtectionInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_recordID copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_etag copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_encryptedBasename copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_bounceNo;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_extension copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSData *)self->_recordProtectionInfo copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_zoneName copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSData *)self->_zoneProtectionInfo copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  recordID = self->_recordID;
  if ((unint64_t)recordID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](recordID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](etag, "isEqual:")) {
      goto LABEL_21;
    }
  }
  encryptedBasename = self->_encryptedBasename;
  if ((unint64_t)encryptedBasename | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptedBasename, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_bounceNo != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((void *)v4 + 4) && !-[NSString isEqual:](extension, "isEqual:")) {
    goto LABEL_21;
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  if ((unint64_t)recordProtectionInfo | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](recordProtectionInfo, "isEqual:")) {
      goto LABEL_21;
    }
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:")) {
      goto LABEL_21;
    }
  }
  zoneProtectionInfo = self->_zoneProtectionInfo;
  if ((unint64_t)zoneProtectionInfo | *((void *)v4 + 8)) {
    char v12 = -[NSData isEqual:](zoneProtectionInfo, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recordID hash];
  NSUInteger v4 = [(NSString *)self->_etag hash];
  uint64_t v5 = [(NSData *)self->_encryptedBasename hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_bounceNo;
  }
  else {
    unint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v8 = [(NSString *)self->_extension hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_recordProtectionInfo hash];
  NSUInteger v10 = v7 ^ v9 ^ [(NSString *)self->_zoneName hash];
  return v10 ^ [(NSData *)self->_zoneProtectionInfo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  uint64_t v5 = v4;
  if (v4[5])
  {
    -[BRServerInfoRecordInfo setRecordID:](self, "setRecordID:");
    NSUInteger v4 = v5;
  }
  if (v4[3])
  {
    -[BRServerInfoRecordInfo setEtag:](self, "setEtag:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[BRServerInfoRecordInfo setEncryptedBasename:](self, "setEncryptedBasename:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    self->_bounceNo = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[BRServerInfoRecordInfo setExtension:](self, "setExtension:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    -[BRServerInfoRecordInfo setRecordProtectionInfo:](self, "setRecordProtectionInfo:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    -[BRServerInfoRecordInfo setZoneName:](self, "setZoneName:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    -[BRServerInfoRecordInfo setZoneProtectionInfo:](self, "setZoneProtectionInfo:");
    NSUInteger v4 = v5;
  }
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSData)encryptedBasename
{
  return self->_encryptedBasename;
}

- (void)setEncryptedBasename:(id)a3
{
}

- (unint64_t)bounceNo
{
  return self->_bounceNo;
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSData)recordProtectionInfo
{
  return self->_recordProtectionInfo;
}

- (void)setRecordProtectionInfo:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSData)zoneProtectionInfo
{
  return self->_zoneProtectionInfo;
}

- (void)setZoneProtectionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfo, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfo, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_etag, 0);

  objc_storeStrong((id *)&self->_encryptedBasename, 0);
}

@end