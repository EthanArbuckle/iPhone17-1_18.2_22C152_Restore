@interface _MPCProtoContainerIdentifierSet
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoContainerIdentifierSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePlaylistVersionHash, 0);
  objc_storeStrong((id *)&self->_storePlaylistGlobalID, 0);
  objc_storeStrong((id *)&self->_radioStationID, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);

  objc_storeStrong((id *)&self->_cloudCollectionID, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_delegateInfoID;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_storeAdamID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_storePlaylistGlobalID hash];
  NSUInteger v6 = [(NSString *)self->_storePlaylistVersionHash hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_cloudID;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  NSUInteger v9 = [(NSString *)self->_cloudCollectionID hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_radioStationID hash];
  return v8 ^ v10 ^ [(NSString *)self->_cloudUniversalLibraryID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_delegateInfoID != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_27:
    char v10 = 0;
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_storeAdamID != *((void *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_27;
  }
  storePlaylistGlobalID = self->_storePlaylistGlobalID;
  if ((unint64_t)storePlaylistGlobalID | *((void *)v4 + 7)
    && !-[NSString isEqual:](storePlaylistGlobalID, "isEqual:"))
  {
    goto LABEL_27;
  }
  storePlaylistVersionHash = self->_storePlaylistVersionHash;
  if ((unint64_t)storePlaylistVersionHash | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](storePlaylistVersionHash, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_cloudID != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_27;
  }
  cloudCollectionID = self->_cloudCollectionID;
  if ((unint64_t)cloudCollectionID | *((void *)v4 + 4)
    && !-[NSString isEqual:](cloudCollectionID, "isEqual:"))
  {
    goto LABEL_27;
  }
  radioStationID = self->_radioStationID;
  if ((unint64_t)radioStationID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](radioStationID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if ((unint64_t)cloudUniversalLibraryID | *((void *)v4 + 5)) {
    char v10 = -[NSString isEqual:](cloudUniversalLibraryID, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_28:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_delegateInfoID;
    *(unsigned char *)(v5 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_storeAdamID;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_storePlaylistGlobalID copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_storePlaylistVersionHash copyWithZone:a3];
  v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_cloudID;
    *(unsigned char *)(v6 + 72) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_cloudCollectionID copyWithZone:a3];
  v13 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_radioStationID copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_cloudUniversalLibraryID copyWithZone:a3];
  v17 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v16;

  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_storePlaylistGlobalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_storePlaylistVersionHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_cloudCollectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_radioStationID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_cloudUniversalLibraryID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoContainerIdentifierSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_delegateInfoID];
    [v3 setObject:v5 forKey:@"delegateInfoID"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    id v6 = [NSNumber numberWithLongLong:self->_storeAdamID];
    [v3 setObject:v6 forKey:@"storeAdamID"];
  }
  storePlaylistGlobalID = self->_storePlaylistGlobalID;
  if (storePlaylistGlobalID) {
    [v3 setObject:storePlaylistGlobalID forKey:@"storePlaylistGlobalID"];
  }
  storePlaylistVersionHash = self->_storePlaylistVersionHash;
  if (storePlaylistVersionHash) {
    [v3 setObject:storePlaylistVersionHash forKey:@"storePlaylistVersionHash"];
  }
  if (*(unsigned char *)&self->_has)
  {
    NSUInteger v9 = [NSNumber numberWithLongLong:self->_cloudID];
    [v3 setObject:v9 forKey:@"cloudID"];
  }
  cloudCollectionID = self->_cloudCollectionID;
  if (cloudCollectionID) {
    [v3 setObject:cloudCollectionID forKey:@"cloudCollectionID"];
  }
  radioStationID = self->_radioStationID;
  if (radioStationID) {
    [v3 setObject:radioStationID forKey:@"radioStationID"];
  }
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if (cloudUniversalLibraryID) {
    [v3 setObject:cloudUniversalLibraryID forKey:@"cloudUniversalLibraryID"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoContainerIdentifierSet;
  id v4 = [(_MPCProtoContainerIdentifierSet *)&v8 description];
  uint64_t v5 = [(_MPCProtoContainerIdentifierSet *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end