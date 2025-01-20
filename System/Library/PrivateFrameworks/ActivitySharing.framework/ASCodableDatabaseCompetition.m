@interface ASCodableDatabaseCompetition
- (ASCodableCloudKitCompetition)competition;
- (BOOL)hasCompetition;
- (BOOL)hasFriendUUID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)friendUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompetition:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableDatabaseCompetition

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCompetition
{
  return self->_competition != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetition;
  v4 = [(ASCodableDatabaseCompetition *)&v8 description];
  v5 = [(ASCodableDatabaseCompetition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  friendUUID = self->_friendUUID;
  if (friendUUID) {
    [v3 setObject:friendUUID forKey:@"friendUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v6 forKey:@"type"];
  }
  competition = self->_competition;
  if (competition)
  {
    objc_super v8 = [(ASCodableCloudKitCompetition *)competition dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"competition"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_competition)
  {
    PBDataWriterWriteSubmessage();
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_type;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_competition)
  {
    objc_msgSend(v5, "setCompetition:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_friendUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_type;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(ASCodableCloudKitCompetition *)self->_competition copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_type != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  competition = self->_competition;
  if ((unint64_t)competition | *((void *)v4 + 2)) {
    char v7 = -[ASCodableCloudKitCompetition isEqual:](competition, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_friendUUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(ASCodableCloudKitCompetition *)self->_competition hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v7 = v4;
  if (v4[3])
  {
    -[ASCodableDatabaseCompetition setFriendUUID:](self, "setFriendUUID:");
    uint64_t v4 = v7;
  }
  if (v4[4])
  {
    self->_type = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  competition = self->_competition;
  uint64_t v6 = v4[2];
  if (competition)
  {
    if (v6) {
      -[ASCodableCloudKitCompetition mergeFrom:](competition, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ASCodableDatabaseCompetition setCompetition:](self, "setCompetition:");
  }

  MEMORY[0x270F9A758]();
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

- (ASCodableCloudKitCompetition)competition
{
  return self->_competition;
}

- (void)setCompetition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendUUID, 0);

  objc_storeStrong((id *)&self->_competition, 0);
}

@end