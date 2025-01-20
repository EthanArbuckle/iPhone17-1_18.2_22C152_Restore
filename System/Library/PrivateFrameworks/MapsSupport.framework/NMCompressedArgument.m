@interface NMCompressedArgument
- (BOOL)hasCompressionType;
- (BOOL)hasDataValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (id)_nm_uncompressedArgument;
- (id)compressionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCompressionType:(id)a3;
- (int)compressionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompressionType:(int)a3;
- (void)setDataValue:(id)a3;
- (void)setHasCompressionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMCompressedArgument

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (int)compressionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_compressionType;
  }
  else {
    return 1;
  }
}

- (void)setCompressionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_compressionType = a3;
}

- (void)setHasCompressionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)compressionTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"ZLIB";
  }
  else if (a3 == 2)
  {
    v4 = @"BZIP2";
  }
  else
  {
    v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsCompressionType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ZLIB"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"BZIP2"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMCompressedArgument;
  id v3 = [(NMCompressedArgument *)&v7 description];
  int v4 = [(NMCompressedArgument *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  dataValue = self->_dataValue;
  if (dataValue) {
    [v3 setObject:dataValue forKey:@"dataValue"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int compressionType = self->_compressionType;
    if (compressionType == 1)
    {
      objc_super v7 = @"ZLIB";
    }
    else if (compressionType == 2)
    {
      objc_super v7 = @"BZIP2";
    }
    else
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_compressionType];
    }
    [v4 setObject:v7 forKey:@"compressionType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NMCompressedArgumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_dataValue)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDataValue:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_compressionType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_dataValue copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_compressionType;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_compressionType == *((_DWORD *)v4 + 2))
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_dataValue hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_compressionType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[NMCompressedArgument setDataValue:](self, "setDataValue:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_int compressionType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)_nm_uncompressedArgument
{
  unsigned int v3 = [(NMCompressedArgument *)self compressionType];
  if (v3 == 2)
  {
    id v4 = [(NMCompressedArgument *)self dataValue];
    [v4 bytes];
    id v5 = [(NMCompressedArgument *)self dataValue];
    [v5 length];
    GEOBZ2Uncompress();
  }
  else
  {
    if (v3 != 1) {
      goto LABEL_6;
    }
    id v4 = [(NMCompressedArgument *)self dataValue];
    [v4 bytes];
    id v5 = [(NMCompressedArgument *)self dataValue];
    [v5 length];
    GEOZlibUncompress();
  }

LABEL_6:

  return 0;
}

@end