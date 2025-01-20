@interface HDCodableSyncVersionRange
+ (HDCodableSyncVersionRange)versionRangeWithSyncVersionRange:(id)a3;
- ($2825F4736939C4A6D3AD43837233062D)syncVersionRange;
- (BOOL)hasCurrent;
- (BOOL)hasMinimum;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)current;
- (int)minimum;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrent:(int)a3;
- (void)setHasCurrent:(BOOL)a3;
- (void)setHasMinimum:(BOOL)a3;
- (void)setMinimum:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncVersionRange

+ (HDCodableSyncVersionRange)versionRangeWithSyncVersionRange:(id)a3
{
  uint64_t var1 = a3.var1;
  v5 = objc_alloc_init(HDCodableSyncVersionRange);
  [(HDCodableSyncVersionRange *)v5 setMinimum:a3];
  [(HDCodableSyncVersionRange *)v5 setCurrent:var1];

  return v5;
}

- ($2825F4736939C4A6D3AD43837233062D)syncVersionRange
{
  unsigned int v3 = [(HDCodableSyncVersionRange *)self minimum];
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)([(HDCodableSyncVersionRange *)self current] << 32));
}

- (void)setMinimum:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimum = a3;
}

- (void)setHasMinimum:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimum
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCurrent:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_current = a3;
}

- (void)setHasCurrent:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrent
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncVersionRange;
  v4 = [(HDCodableSyncVersionRange *)&v8 description];
  v5 = [(HDCodableSyncVersionRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_minimum];
    [v3 setObject:v5 forKey:@"minimum"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_current];
    [v3 setObject:v6 forKey:@"current"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncVersionRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_minimum;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_current;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_minimum;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_current;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_minimum != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_current != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_minimum;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_current;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_minimum = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_current = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)minimum
{
  return self->_minimum;
}

- (int)current
{
  return self->_current;
}

@end