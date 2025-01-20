@interface _DKPRCompressedChangeSet
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)compressedData;
- (uint64_t)setUncompressedLength:(uint64_t)result;
- (uint64_t)uncompressedLength;
- (unint64_t)hash;
- (void)setCompressedData:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRCompressedChangeSet

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRCompressedChangeSet;
  v4 = [(_DKPRCompressedChangeSet *)&v8 description];
  v5 = [(_DKPRCompressedChangeSet *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_uncompressedLength];
  [v3 setObject:v4 forKey:@"uncompressedLength"];

  compressedData = self->_compressedData;
  if (compressedData) {
    [v3 setObject:compressedData forKey:@"compressedData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRCompressedChangeSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  if (!self->_compressedData) {
    -[_DKPRCompressedChangeSet writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)setCompressedData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_uncompressedLength;
  uint64_t v6 = [(NSData *)self->_compressedData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_uncompressedLength == v4[1])
  {
    compressedData = self->_compressedData;
    if ((unint64_t)compressedData | v4[2]) {
      char v6 = -[NSData isEqual:](compressedData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = 2654435761u * self->_uncompressedLength;
  return [(NSData *)self->_compressedData hash] ^ v2;
}

- (uint64_t)uncompressedLength
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)setUncompressedLength:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)compressedData
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRCompressedChangeSet writeTo:]", "_DKPRCompressedChangeSet.m", 83, "nil != self->_compressedData");
}

@end