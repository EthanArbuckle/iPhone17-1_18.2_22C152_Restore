@interface HDCodableObjectTypeSourceOrder
- (BOOL)hasObjectType;
- (BOOL)hasSourceUUIDs;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUserOrdered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userOrdered;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)sourceUUIDs;
- (double)modificationDates;
- (double)modificationDatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)decodedDataTypeCode;
- (int64_t)objectType;
- (unint64_t)hash;
- (unint64_t)modificationDatesCount;
- (void)addModificationDates:(double)a3;
- (void)clearModificationDates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setHasUserOrdered:(BOOL)a3;
- (void)setModificationDates:(double *)a3 count:(unint64_t)a4;
- (void)setObjectType:(int64_t)a3;
- (void)setSourceUUIDs:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUserOrdered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableObjectTypeSourceOrder

- (int64_t)decodedDataTypeCode
{
  return self->_objectType;
}

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableObjectTypeSourceOrder;
  [(HDCodableObjectTypeSourceOrder *)&v3 dealloc];
}

- (void)setObjectType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_objectType = a3;
}

- (void)setHasObjectType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasObjectType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserOrdered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userOrdered = a3;
}

- (void)setHasUserOrdered:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserOrdered
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSourceUUIDs
{
  return self->_sourceUUIDs != 0;
}

- (unint64_t)modificationDatesCount
{
  return self->_modificationDates.count;
}

- (double)modificationDates
{
  return self->_modificationDates.list;
}

- (void)clearModificationDates
{
}

- (void)addModificationDates:(double)a3
{
}

- (double)modificationDatesAtIndex:(unint64_t)a3
{
  p_modificationDates = &self->_modificationDates;
  unint64_t count = self->_modificationDates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_modificationDates->list[a3];
}

- (void)setModificationDates:(double *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectTypeSourceOrder;
  v4 = [(HDCodableObjectTypeSourceOrder *)&v8 description];
  v5 = [(HDCodableObjectTypeSourceOrder *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_objectType];
    [v3 setObject:v5 forKey:@"objectType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_userOrdered];
    [v3 setObject:v6 forKey:@"userOrdered"];
  }
  sourceUUIDs = self->_sourceUUIDs;
  if (sourceUUIDs) {
    [v3 setObject:sourceUUIDs forKey:@"sourceUUIDs"];
  }
  objc_super v8 = PBRepeatedDoubleNSArray();
  [v3 setObject:v8 forKey:@"modificationDates"];

  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v10 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"syncIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectTypeSourceOrderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_sourceUUIDs)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_modificationDates.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_modificationDates.count);
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_objectType;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_userOrdered;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  id v9 = v4;
  if (self->_sourceUUIDs) {
    objc_msgSend(v4, "setSourceUUIDs:");
  }
  if ([(HDCodableObjectTypeSourceOrder *)self modificationDatesCount])
  {
    [v9 clearModificationDates];
    unint64_t v6 = [(HDCodableObjectTypeSourceOrder *)self modificationDatesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(HDCodableObjectTypeSourceOrder *)self modificationDatesAtIndex:i];
        objc_msgSend(v9, "addModificationDates:");
      }
    }
  }
  if (self->_syncIdentity) {
    objc_msgSend(v9, "setSyncIdentity:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 32) = self->_objectType;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_userOrdered;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_sourceUUIDs copyWithZone:a3];
  id v9 = (void *)v6[5];
  v6[5] = v8;

  PBRepeatedDoubleCopy();
  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = (void *)v6[6];
  v6[6] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_objectType != *((void *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_userOrdered)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_20;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_15;
      }
    }
LABEL_20:
    char v7 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  sourceUUIDs = self->_sourceUUIDs;
  if ((unint64_t)sourceUUIDs | *((void *)v4 + 5) && !-[NSData isEqual:](sourceUUIDs, "isEqual:")
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_20;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 6)) {
    char v7 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_objectType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_userOrdered;
LABEL_6:
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_sourceUUIDs hash];
  uint64_t v7 = v5 ^ PBRepeatedDoubleHash() ^ v6;
  return v7 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 60);
  if (v6)
  {
    self->_objectType = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_userOrdered = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
  v13 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableObjectTypeSourceOrder setSourceUUIDs:](self, "setSourceUUIDs:");
    uint64_t v5 = v13;
  }
  uint64_t v7 = [v5 modificationDatesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      [v13 modificationDatesAtIndex:i];
      -[HDCodableObjectTypeSourceOrder addModificationDates:](self, "addModificationDates:");
    }
  }
  syncIdentity = self->_syncIdentity;
  v11 = v13;
  uint64_t v12 = v13[6];
  if (syncIdentity)
  {
    if (!v12) {
      goto LABEL_16;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_16;
    }
    -[HDCodableObjectTypeSourceOrder setSyncIdentity:](self, "setSyncIdentity:");
  }
  v11 = v13;
LABEL_16:
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (BOOL)userOrdered
{
  return self->_userOrdered;
}

- (NSData)sourceUUIDs
{
  return self->_sourceUUIDs;
}

- (void)setSourceUUIDs:(id)a3
{
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

  objc_storeStrong((id *)&self->_sourceUUIDs, 0);
}

@end