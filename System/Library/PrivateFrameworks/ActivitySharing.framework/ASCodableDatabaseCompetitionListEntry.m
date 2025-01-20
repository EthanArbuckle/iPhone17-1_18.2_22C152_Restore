@interface ASCodableDatabaseCompetitionListEntry
- (BOOL)hasFriendUUID;
- (BOOL)hasOwner;
- (BOOL)hasSystemFieldsOnlyRecord;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)friendUUID;
- (NSData)systemFieldsOnlyRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)owner;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasOwner:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOwner:(int64_t)a3;
- (void)setSystemFieldsOnlyRecord:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableDatabaseCompetitionListEntry

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (void)setOwner:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_owner = a3;
}

- (void)setHasOwner:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOwner
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetitionListEntry;
  v4 = [(ASCodableDatabaseCompetitionListEntry *)&v8 description];
  v5 = [(ASCodableDatabaseCompetitionListEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  friendUUID = self->_friendUUID;
  if (friendUUID) {
    [v3 setObject:friendUUID forKey:@"friendUUID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v6 forKey:@"type"];
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord) {
    [v4 setObject:systemFieldsOnlyRecord forKey:@"systemFieldsOnlyRecord"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_owner];
    [v4 setObject:v8 forKey:@"owner"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionListEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_friendUUID)
  {
    objc_msgSend(v4, "setFriendUUID:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_type;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_owner;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_friendUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_systemFieldsOnlyRecord copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_owner;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if ((unint64_t)systemFieldsOnlyRecord | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:"))
    {
LABEL_16:
      BOOL v8 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_owner != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_friendUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_systemFieldsOnlyRecord hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_owner;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  uint64_t v5 = v4;
  if (v4[3])
  {
    -[ASCodableDatabaseCompetitionListEntry setFriendUUID:](self, "setFriendUUID:");
    uint64_t v4 = v5;
  }
  if ((v4[5] & 2) != 0)
  {
    self->_type = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v4[4])
  {
    -[ASCodableDatabaseCompetitionListEntry setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_owner = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
}

- (int64_t)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

@end