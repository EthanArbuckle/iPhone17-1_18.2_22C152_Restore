@interface NCUpdateThumbnailRequest
- (BOOL)hasCaptureDuration;
- (BOOL)hasIsVideo;
- (BOOL)hasJpegData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVideo;
- (BOOL)readFrom:(id)a3;
- (NSData)jpegData;
- (double)captureDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaptureDuration:(double)a3;
- (void)setHasCaptureDuration:(BOOL)a3;
- (void)setHasIsVideo:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setJpegData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCUpdateThumbnailRequest

- (BOOL)hasJpegData
{
  return self->_jpegData != 0;
}

- (void)setCaptureDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_captureDuration = a3;
}

- (void)setHasCaptureDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsVideo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVideo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCUpdateThumbnailRequest;
  char v3 = [(NCUpdateThumbnailRequest *)&v7 description];
  v4 = [(NCUpdateThumbnailRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  jpegData = self->_jpegData;
  if (jpegData) {
    [v3 setObject:jpegData forKey:@"jpegData"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_captureDuration];
    [v4 setObject:v7 forKey:@"captureDuration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isVideo];
    [v4 setObject:v8 forKey:@"isVideo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100009FF0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_jpegData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_jpegData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setJpegData:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_captureDuration;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_isVideo;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_jpegData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = *(void *)&self->_captureDuration;
    *((unsigned char *)v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 24) = self->_isVideo;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  jpegData = self->_jpegData;
  if ((unint64_t)jpegData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](jpegData, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_captureDuration != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_11;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0)
    {
LABEL_11:
      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (self->_isVideo)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_jpegData hash];
  char has = (char)self->_has;
  if (has)
  {
    double captureDuration = self->_captureDuration;
    double v7 = -captureDuration;
    if (captureDuration >= 0.0) {
      double v7 = self->_captureDuration;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_isVideo;
  }
  else {
    uint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NCUpdateThumbnailRequest setJpegData:](self, "setJpegData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_double captureDuration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_isVideo = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)jpegData
{
  return self->_jpegData;
}

- (void)setJpegData:(id)a3
{
}

- (double)captureDuration
{
  return self->_captureDuration;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void).cxx_destruct
{
}

@end