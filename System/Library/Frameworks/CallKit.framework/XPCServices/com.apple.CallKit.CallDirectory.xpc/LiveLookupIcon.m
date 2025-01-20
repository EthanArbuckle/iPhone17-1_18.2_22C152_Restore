@interface LiveLookupIcon
- (BOOL)hasFormat;
- (BOOL)hasImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formatAsString:(int)a3;
- (int)StringAsFormat:(id)a3;
- (int)format;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFormat:(int)a3;
- (void)setHasFormat:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LiveLookupIcon

- (int)format
{
  if (*(unsigned char *)&self->_has) {
    return self->_format;
  }
  else {
    return 0;
  }
}

- (void)setFormat:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_format = a3;
}

- (void)setHasFormat:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFormat
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)formatAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"HEIC";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"UNSPECIFIED";
  }
  return v4;
}

- (int)StringAsFormat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNSPECIFIED"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"HEIC"];
  }

  return v4;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)LiveLookupIcon;
  id v3 = [(LiveLookupIcon *)&v7 description];
  int v4 = [(LiveLookupIcon *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int format = self->_format;
    if (format)
    {
      if (format == 1)
      {
        v5 = @"HEIC";
      }
      else
      {
        v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_format];
      }
    }
    else
    {
      v5 = @"UNSPECIFIED";
    }
    [v3 setObject:v5 forKey:@"format"];
  }
  image = self->_image;
  if (image) {
    [v3 setObject:image forKey:@"image"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000078E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_format;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_image)
  {
    id v5 = v4;
    objc_msgSend(v4, "setImage:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_format;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSData *)self->_image copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_format != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSData isEqual:](image, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_format;
  }
  else {
    uint64_t v2 = 0;
  }
  return (unint64_t)[(NSData *)self->_image hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_int format = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[LiveLookupIcon setImage:](self, "setImage:");
    id v4 = v5;
  }
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end