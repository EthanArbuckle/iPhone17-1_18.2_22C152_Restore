@interface HDCodableClinicalDeletedAccount
- (BOOL)hasDeletionDate;
- (BOOL)hasDeletionReason;
- (BOOL)hasMessageVersion;
- (BOOL)hasSyncIdentifier;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)syncIdentifier;
- (double)deletionDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)deletionReason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeletionDate:(double)a3;
- (void)setDeletionReason:(int64_t)a3;
- (void)setHasDeletionDate:(BOOL)a3;
- (void)setHasDeletionReason:(BOOL)a3;
- (void)setMessageVersion:(id)a3;
- (void)setSyncIdentifier:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableClinicalDeletedAccount

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setDeletionDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deletionDate = a3;
}

- (void)setHasDeletionDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeletionDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (void)setDeletionReason:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deletionReason = a3;
}

- (void)setHasDeletionReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeletionReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableClinicalDeletedAccount;
  v4 = [(HDCodableClinicalDeletedAccount *)&v8 description];
  v5 = [(HDCodableClinicalDeletedAccount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier) {
    [v3 setObject:syncIdentifier forKey:@"syncIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_deletionDate];
    [v4 setObject:v6 forKey:@"deletionDate"];
  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    objc_super v8 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"messageVersion"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_deletionReason];
    [v4 setObject:v9 forKey:@"deletionReason"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v11 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalDeletedAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncIdentifier)
  {
    objc_msgSend(v4, "setSyncIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_deletionDate;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_deletionReason;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_syncIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_deletionDate;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v8 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_deletionReason;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 48);
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_deletionDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_19;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((void *)v4 + 3))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
    {
LABEL_19:
      char v10 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_deletionReason != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_19;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 5)) {
    char v10 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_syncIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double deletionDate = self->_deletionDate;
    double v6 = -deletionDate;
    if (deletionDate >= 0.0) {
      double v6 = self->_deletionDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = [(HDCodableMessageVersion *)self->_messageVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_deletionReason;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v10 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableClinicalDeletedAccount setSyncIdentifier:](self, "setSyncIdentifier:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_double deletionDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  messageVersion = self->_messageVersion;
  uint64_t v6 = *((void *)v4 + 3);
  if (messageVersion)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableClinicalDeletedAccount setMessageVersion:](self, "setMessageVersion:");
  }
  id v4 = v9;
LABEL_11:
  if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    self->_deletionReason = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v8 = *((void *)v4 + 5);
  if (syncIdentity)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[HDCodableClinicalDeletedAccount setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v9;
LABEL_19:
}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
}

- (double)deletionDate
{
  return self->_deletionDate;
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (int64_t)deletionReason
{
  return self->_deletionReason;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);

  objc_storeStrong((id *)&self->_messageVersion, 0);
}

@end