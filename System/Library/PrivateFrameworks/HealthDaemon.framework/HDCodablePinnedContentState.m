@interface HDCodablePinnedContentState
- (BOOL)hasEpoch;
- (BOOL)hasPinnedContentStateData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pinnedContentStateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)epoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setPinnedContentStateData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodablePinnedContentState

- (BOOL)hasPinnedContentStateData
{
  return self->_pinnedContentStateData != 0;
}

- (void)setEpoch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpoch
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodablePinnedContentState;
  v4 = [(HDCodablePinnedContentState *)&v8 description];
  v5 = [(HDCodablePinnedContentState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  pinnedContentStateData = self->_pinnedContentStateData;
  if (pinnedContentStateData) {
    [v3 setObject:pinnedContentStateData forKey:@"pinnedContentStateData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_epoch];
    [v4 setObject:v6 forKey:@"epoch"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodablePinnedContentStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_pinnedContentStateData)
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
  if (self->_pinnedContentStateData)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPinnedContentStateData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_epoch;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_pinnedContentStateData copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_epoch;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  pinnedContentStateData = self->_pinnedContentStateData;
  if ((unint64_t)pinnedContentStateData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](pinnedContentStateData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_epoch == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_pinnedContentStateData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_epoch;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[HDCodablePinnedContentState setPinnedContentStateData:](self, "setPinnedContentStateData:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_epoch = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)pinnedContentStateData
{
  return self->_pinnedContentStateData;
}

- (void)setPinnedContentStateData:(id)a3
{
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void).cxx_destruct
{
}

@end