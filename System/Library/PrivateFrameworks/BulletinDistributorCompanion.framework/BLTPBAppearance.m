@interface BLTPBAppearance
- (BLTPBImage)image;
- (BOOL)destructive;
- (BOOL)hasDestructive;
- (BOOL)hasImage;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setHasDestructive:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBAppearance

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setDestructive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_destructive = a3;
}

- (void)setHasDestructive:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestructive
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBAppearance;
  v4 = [(BLTPBAppearance *)&v8 description];
  v5 = [(BLTPBAppearance *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  image = self->_image;
  if (image)
  {
    v7 = [(BLTPBImage *)image dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"image"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_destructive];
    [v4 setObject:v8 forKey:@"destructive"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAppearanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_destructive;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(BLTPBImage *)self->_image copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_destructive;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_8;
    }
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 1))
  {
    if (!-[BLTPBImage isEqual:](image, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_destructive)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(BLTPBImage *)self->_image hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_destructive;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (BOOL *)a3;
  BOOL v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[BLTPBAppearance setTitle:](self, "setTitle:");
    unint64_t v4 = v7;
  }
  image = self->_image;
  uint64_t v6 = *((void *)v4 + 1);
  if (image)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BLTPBImage mergeFrom:](image, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BLTPBAppearance setImage:](self, "setImage:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[28])
  {
    self->_destructive = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BLTPBImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end