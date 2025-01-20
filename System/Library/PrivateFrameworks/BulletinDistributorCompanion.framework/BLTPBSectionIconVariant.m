@interface BLTPBSectionIconVariant
+ (id)sectionIconVariantWithImageData:(id)a3 systemImageName:(id)a4 precomposed:(BOOL)a5 format:(unsigned int)a6;
- (BOOL)hasImageData;
- (BOOL)hasPrecomposed;
- (BOOL)hasSystemImageName;
- (BOOL)isEqual:(id)a3;
- (BOOL)precomposed;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (NSString)systemImageName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)format;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFormat:(unsigned int)a3;
- (void)setHasPrecomposed:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setPrecomposed:(BOOL)a3;
- (void)setSystemImageName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSectionIconVariant

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (void)setPrecomposed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_precomposed = a3;
}

- (void)setHasPrecomposed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrecomposed
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSystemImageName
{
  return self->_systemImageName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionIconVariant;
  v4 = [(BLTPBSectionIconVariant *)&v8 description];
  v5 = [(BLTPBSectionIconVariant *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_format];
  [v3 setObject:v4 forKey:@"format"];

  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_precomposed];
    [v3 setObject:v6 forKey:@"precomposed"];
  }
  systemImageName = self->_systemImageName;
  if (systemImageName) {
    [v3 setObject:systemImageName forKey:@"systemImageName"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionIconVariantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v4 = v5;
  if (self->_systemImageName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[2] = self->_format;
  id v5 = v4;
  if (self->_imageData)
  {
    objc_msgSend(v4, "setImageData:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v4 + 32) = self->_precomposed;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_systemImageName)
  {
    objc_msgSend(v5, "setSystemImageName:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_format;
  uint64_t v6 = [(NSData *)self->_imageData copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_precomposed;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_systemImageName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (self->_format != *((_DWORD *)v4 + 2)) {
    goto LABEL_9;
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:")) {
      goto LABEL_9;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_precomposed)
      {
        if (*((unsigned char *)v4 + 32)) {
          goto LABEL_15;
        }
      }
      else if (!*((unsigned char *)v4 + 32))
      {
        goto LABEL_15;
      }
    }
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_9;
  }
LABEL_15:
  systemImageName = self->_systemImageName;
  if ((unint64_t)systemImageName | *((void *)v4 + 3)) {
    char v6 = -[NSString isEqual:](systemImageName, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unsigned int format = self->_format;
  uint64_t v4 = [(NSData *)self->_imageData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_precomposed;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v5 ^ [(NSString *)self->_systemImageName hash] ^ (2654435761 * format);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int format = *((_DWORD *)v4 + 2);
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[BLTPBSectionIconVariant setImageData:](self, "setImageData:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_precomposed = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[BLTPBSectionIconVariant setSystemImageName:](self, "setSystemImageName:");
    id v4 = v5;
  }
}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned int)a3
{
  self->_unsigned int format = a3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (BOOL)precomposed
{
  return self->_precomposed;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (id)sectionIconVariantWithImageData:(id)a3 systemImageName:(id)a4 precomposed:(BOOL)a5 format:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)a1);
  [v12 setPrecomposed:v7];
  [v12 setFormat:v6];
  if (v10)
  {
    [v12 setImageData:v10];
  }
  else if (v11)
  {
    [v12 setSystemImageName:v11];
  }

  return v12;
}

@end