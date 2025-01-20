@interface SECSFAEventFilter
- (BOOL)hasDropRate;
- (BOOL)hasEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dropRate;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDropRate:(int64_t)a3;
- (void)setEvent:(id)a3;
- (void)setHasDropRate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAEventFilter

- (void).cxx_destruct
{
}

- (int64_t)dropRate
{
  return self->_dropRate;
}

- (void)setEvent:(id)a3
{
}

- (NSString)event
{
  return self->_event;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[SECSFAEventFilter setEvent:](self, "setEvent:");
    v4 = v5;
  }
  if (v4[3])
  {
    self->_dropRate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_event hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_dropRate;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  event = self->_event;
  if ((unint64_t)event | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](event, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_dropRate == *((void *)v4 + 1))
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_event copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dropRate;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_event)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEvent:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_dropRate;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_event)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAEventFilterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  event = self->_event;
  if (event) {
    [v3 setObject:event forKey:@"event"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:self->_dropRate];
    [v4 setObject:v6 forKey:@"dropRate"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAEventFilter;
  id v4 = [(SECSFAEventFilter *)&v8 description];
  id v5 = [(SECSFAEventFilter *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDropRate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDropRate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDropRate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dropRate = a3;
}

- (BOOL)hasEvent
{
  return self->_event != 0;
}

@end