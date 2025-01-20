@interface _DKPREventData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)event;
- (uint64_t)setHasUncompressedLength:(uint64_t)result;
- (uint64_t)setUncompressedLength:(uint64_t)result;
- (uint64_t)setVersion:(uint64_t)result;
- (uint64_t)uncompressedLength;
- (uint64_t)version;
- (unint64_t)hash;
- (void)setEvent:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPREventData

- (uint64_t)setUncompressedLength:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasUncompressedLength:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xFE | a2;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPREventData;
  v4 = [(_DKPREventData *)&v8 description];
  v5 = [(_DKPREventData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  event = self->_event;
  if (event) {
    [v3 setObject:event forKey:@"event"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_uncompressedLength];
    [v3 setObject:v6 forKey:@"uncompressedLength"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPREventDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_event) {
    -[_DKPREventData writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)setEvent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_version;
  uint64_t v6 = [(NSData *)self->_event copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_uncompressedLength;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (self->_version != *((_DWORD *)v4 + 6)) {
    goto LABEL_9;
  }
  event = self->_event;
  if ((unint64_t)event | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](event, "isEqual:")) {
      goto LABEL_9;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_uncompressedLength == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t v4 = [(NSData *)self->_event hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_uncompressedLength;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v5 ^ (2654435761 * version);
}

- (uint64_t)version
{
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

- (uint64_t)setVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)event
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)uncompressedLength
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPREventData writeTo:]", "_DKPREventData.m", 107, "nil != self->_event");
}

@end