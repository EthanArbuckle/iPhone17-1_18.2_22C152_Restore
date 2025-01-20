@interface AWDMultitouchHardwareStatus
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)openRowsCount;
- (unint64_t)timestamp;
- (unsigned)openRows;
- (unsigned)openRowsAtIndex:(unint64_t)a3;
- (void)addOpenRows:(unsigned int)a3;
- (void)clearOpenRows;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOpenRows:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMultitouchHardwareStatus

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMultitouchHardwareStatus;
  [(AWDMultitouchHardwareStatus *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)openRowsCount
{
  return self->_openRows.count;
}

- (unsigned)openRows
{
  return self->_openRows.list;
}

- (void)clearOpenRows
{
}

- (void)addOpenRows:(unsigned int)a3
{
}

- (unsigned)openRowsAtIndex:(unint64_t)a3
{
  p_openRows = &self->_openRows;
  unint64_t count = self->_openRows.count;
  if (count <= a3) {
    [(id)objc_msgSend(MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578], objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_openRows->list[a3];
}

- (void)setOpenRows:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMultitouchHardwareStatus;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMultitouchHardwareStatus description](&v3, sel_description), -[AWDMultitouchHardwareStatus dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestamp), @"timestamp");
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"openRows"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMultitouchHardwareStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  p_openRows = &self->_openRows;
  if (p_openRows->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_openRows->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if ([(AWDMultitouchHardwareStatus *)self openRowsCount])
  {
    [a3 clearOpenRows];
    unint64_t v5 = [(AWDMultitouchHardwareStatus *)self openRowsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addOpenRows:", -[AWDMultitouchHardwareStatus openRowsAtIndex:](self, "openRowsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    return 0;
  }

  return MEMORY[0x270F58738](&self->_openRows, (char *)a3 + 8);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 openRowsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDMultitouchHardwareStatus addOpenRows:](self, "addOpenRows:", [a3 openRowsAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end