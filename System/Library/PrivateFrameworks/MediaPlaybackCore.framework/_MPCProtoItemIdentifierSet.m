@interface _MPCProtoItemIdentifierSet
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoItemIdentifierSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemID, 0);

  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_delegateInfoID;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_contentItemID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_storeAdamID;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_storeSubscriptionAdamID;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_cloudUniversalLibraryID hash];
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_cloudID;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_purchaseHistoryID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_cloudUniversalLibraryID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 64);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_delegateInfoID != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_32;
  }
  contentItemID = self->_contentItemID;
  if ((unint64_t)contentItemID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](contentItemID, "isEqual:"))
    {
LABEL_32:
      char v9 = 0;
      goto LABEL_33;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_storeAdamID != *((void *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_storeSubscriptionAdamID != *((void *)v4 + 5)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_cloudID != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (v6)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_purchaseHistoryID != *((void *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if ((unint64_t)cloudUniversalLibraryID | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](cloudUniversalLibraryID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_33:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_delegateInfoID;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_contentItemID copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v7;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_storeAdamID;
    *(unsigned char *)(v6 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(void *)(v6 + 8) = self->_cloudID;
      *(unsigned char *)(v6 + 64) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 40) = self->_storeSubscriptionAdamID;
  *(unsigned char *)(v6 + 64) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(void *)(v6 + 24) = self->_purchaseHistoryID;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
LABEL_8:
  uint64_t v10 = [(NSString *)self->_cloudUniversalLibraryID copyWithZone:a3];
  v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_contentItemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_10:
  if (self->_cloudUniversalLibraryID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoItemIdentifierSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_delegateInfoID];
    [v3 setObject:v4 forKey:@"delegateInfoID"];
  }
  contentItemID = self->_contentItemID;
  if (contentItemID) {
    [v3 setObject:contentItemID forKey:@"contentItemID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v10 = [NSNumber numberWithLongLong:self->_storeAdamID];
    [v3 setObject:v10 forKey:@"storeAdamID"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithLongLong:self->_storeSubscriptionAdamID];
  [v3 setObject:v11 forKey:@"storeSubscriptionAdamID"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  v12 = [NSNumber numberWithLongLong:self->_cloudID];
  [v3 setObject:v12 forKey:@"cloudID"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    uint64_t v7 = [NSNumber numberWithLongLong:self->_purchaseHistoryID];
    [v3 setObject:v7 forKey:@"purchaseHistoryID"];
  }
LABEL_10:
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
  v8.super_class = (Class)_MPCProtoItemIdentifierSet;
  id v4 = [(_MPCProtoItemIdentifierSet *)&v8 description];
  uint64_t v5 = [(_MPCProtoItemIdentifierSet *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end