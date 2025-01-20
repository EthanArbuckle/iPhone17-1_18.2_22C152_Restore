@interface ASCodableRelationshipContainer
- (ASCodableCloudKitRelationship)relationship;
- (BOOL)hasRelationship;
- (BOOL)hasRelationshipShareID;
- (BOOL)hasRelationshipZoneShareID;
- (BOOL)hasRemoteActivityShareID;
- (BOOL)hasRemoteRelationshipShareID;
- (BOOL)hasRemoteRelationshipZoneShareID;
- (BOOL)hasSystemFieldsOnlyRecord;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)relationshipShareID;
- (NSData)relationshipZoneShareID;
- (NSData)remoteActivityShareID;
- (NSData)remoteRelationshipShareID;
- (NSData)remoteRelationshipZoneShareID;
- (NSData)systemFieldsOnlyRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRelationship:(id)a3;
- (void)setRelationshipShareID:(id)a3;
- (void)setRelationshipZoneShareID:(id)a3;
- (void)setRemoteActivityShareID:(id)a3;
- (void)setRemoteRelationshipShareID:(id)a3;
- (void)setRemoteRelationshipZoneShareID:(id)a3;
- (void)setSystemFieldsOnlyRecord:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableRelationshipContainer

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (BOOL)hasRelationshipShareID
{
  return self->_relationshipShareID != 0;
}

- (BOOL)hasRemoteRelationshipShareID
{
  return self->_remoteRelationshipShareID != 0;
}

- (BOOL)hasRemoteActivityShareID
{
  return self->_remoteActivityShareID != 0;
}

- (BOOL)hasRelationshipZoneShareID
{
  return self->_relationshipZoneShareID != 0;
}

- (BOOL)hasRemoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableRelationshipContainer;
  v4 = [(ASCodableRelationshipContainer *)&v8 description];
  v5 = [(ASCodableRelationshipContainer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  relationship = self->_relationship;
  if (relationship)
  {
    v5 = [(ASCodableCloudKitRelationship *)relationship dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"relationship"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v6 forKey:@"version"];
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord) {
    [v3 setObject:systemFieldsOnlyRecord forKey:@"systemFieldsOnlyRecord"];
  }
  relationshipShareID = self->_relationshipShareID;
  if (relationshipShareID) {
    [v3 setObject:relationshipShareID forKey:@"relationshipShareID"];
  }
  remoteRelationshipShareID = self->_remoteRelationshipShareID;
  if (remoteRelationshipShareID) {
    [v3 setObject:remoteRelationshipShareID forKey:@"remoteRelationshipShareID"];
  }
  remoteActivityShareID = self->_remoteActivityShareID;
  if (remoteActivityShareID) {
    [v3 setObject:remoteActivityShareID forKey:@"remoteActivityShareID"];
  }
  relationshipZoneShareID = self->_relationshipZoneShareID;
  if (relationshipZoneShareID) {
    [v3 setObject:relationshipZoneShareID forKey:@"relationshipZoneShareID"];
  }
  remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
  if (remoteRelationshipZoneShareID) {
    [v3 setObject:remoteRelationshipZoneShareID forKey:@"remoteRelationshipZoneShareID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableRelationshipContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_relationship)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_relationshipShareID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_remoteRelationshipShareID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_remoteActivityShareID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_relationshipZoneShareID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_remoteRelationshipZoneShareID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_relationship)
  {
    objc_msgSend(v4, "setRelationship:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_version;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    id v4 = v5;
  }
  if (self->_relationshipShareID)
  {
    objc_msgSend(v5, "setRelationshipShareID:");
    id v4 = v5;
  }
  if (self->_remoteRelationshipShareID)
  {
    objc_msgSend(v5, "setRemoteRelationshipShareID:");
    id v4 = v5;
  }
  if (self->_remoteActivityShareID)
  {
    objc_msgSend(v5, "setRemoteActivityShareID:");
    id v4 = v5;
  }
  if (self->_relationshipZoneShareID)
  {
    objc_msgSend(v5, "setRelationshipZoneShareID:");
    id v4 = v5;
  }
  if (self->_remoteRelationshipZoneShareID)
  {
    objc_msgSend(v5, "setRemoteRelationshipZoneShareID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableCloudKitRelationship *)self->_relationship copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_version;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_systemFieldsOnlyRecord copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSData *)self->_relationshipShareID copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_remoteRelationshipShareID copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSData *)self->_remoteActivityShareID copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  uint64_t v16 = [(NSData *)self->_relationshipZoneShareID copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  uint64_t v18 = [(NSData *)self->_remoteRelationshipZoneShareID copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  relationship = self->_relationship;
  if ((unint64_t)relationship | *((void *)v4 + 2))
  {
    if (!-[ASCodableCloudKitRelationship isEqual:](relationship, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_version != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if ((unint64_t)systemFieldsOnlyRecord | *((void *)v4 + 8)
    && !-[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:"))
  {
    goto LABEL_21;
  }
  relationshipShareID = self->_relationshipShareID;
  if ((unint64_t)relationshipShareID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](relationshipShareID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  remoteRelationshipShareID = self->_remoteRelationshipShareID;
  if ((unint64_t)remoteRelationshipShareID | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](remoteRelationshipShareID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  remoteActivityShareID = self->_remoteActivityShareID;
  if ((unint64_t)remoteActivityShareID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](remoteActivityShareID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  relationshipZoneShareID = self->_relationshipZoneShareID;
  if ((unint64_t)relationshipZoneShareID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](relationshipZoneShareID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
  if ((unint64_t)remoteRelationshipZoneShareID | *((void *)v4 + 7)) {
    char v12 = -[NSData isEqual:](remoteRelationshipZoneShareID, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableCloudKitRelationship *)self->_relationship hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_systemFieldsOnlyRecord hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSData *)self->_relationshipShareID hash];
  uint64_t v8 = [(NSData *)self->_remoteRelationshipShareID hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_remoteActivityShareID hash];
  uint64_t v10 = v7 ^ v9 ^ [(NSData *)self->_relationshipZoneShareID hash];
  return v10 ^ [(NSData *)self->_remoteRelationshipZoneShareID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  relationship = self->_relationship;
  uint64_t v6 = v4[2];
  uint64_t v7 = v4;
  if (relationship)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitRelationship mergeFrom:](relationship, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableRelationshipContainer setRelationship:](self, "setRelationship:");
  }
  uint64_t v4 = v7;
LABEL_7:
  if (v4[9])
  {
    self->_version = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[8])
  {
    -[ASCodableRelationshipContainer setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
    uint64_t v4 = v7;
  }
  if (v4[3])
  {
    -[ASCodableRelationshipContainer setRelationshipShareID:](self, "setRelationshipShareID:");
    uint64_t v4 = v7;
  }
  if (v4[6])
  {
    -[ASCodableRelationshipContainer setRemoteRelationshipShareID:](self, "setRemoteRelationshipShareID:");
    uint64_t v4 = v7;
  }
  if (v4[5])
  {
    -[ASCodableRelationshipContainer setRemoteActivityShareID:](self, "setRemoteActivityShareID:");
    uint64_t v4 = v7;
  }
  if (v4[4])
  {
    -[ASCodableRelationshipContainer setRelationshipZoneShareID:](self, "setRelationshipZoneShareID:");
    uint64_t v4 = v7;
  }
  if (v4[7]) {
    -[ASCodableRelationshipContainer setRemoteRelationshipZoneShareID:](self, "setRemoteRelationshipZoneShareID:");
  }

  MEMORY[0x270F9A758]();
}

- (ASCodableCloudKitRelationship)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
}

- (NSData)relationshipShareID
{
  return self->_relationshipShareID;
}

- (void)setRelationshipShareID:(id)a3
{
}

- (NSData)remoteRelationshipShareID
{
  return self->_remoteRelationshipShareID;
}

- (void)setRemoteRelationshipShareID:(id)a3
{
}

- (NSData)remoteActivityShareID
{
  return self->_remoteActivityShareID;
}

- (void)setRemoteActivityShareID:(id)a3
{
}

- (NSData)relationshipZoneShareID
{
  return self->_relationshipZoneShareID;
}

- (void)setRelationshipZoneShareID:(id)a3
{
}

- (NSData)remoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID;
}

- (void)setRemoteRelationshipZoneShareID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, 0);
  objc_storeStrong((id *)&self->_remoteActivityShareID, 0);
  objc_storeStrong((id *)&self->_relationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipShareID, 0);

  objc_storeStrong((id *)&self->_relationship, 0);
}

@end