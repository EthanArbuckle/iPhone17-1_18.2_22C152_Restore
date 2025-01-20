@interface BMPBStoreBookmark
- (BOOL)hasIterationStartTime;
- (BOOL)hasOffset;
- (BOOL)hasSegmentName;
- (BOOL)hasStreamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)segmentName;
- (NSString)streamId;
- (double)iterationStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)offset;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIterationStartTime:(BOOL)a3;
- (void)setHasOffset:(BOOL)a3;
- (void)setIterationStartTime:(double)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setSegmentName:(id)a3;
- (void)setStreamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBStoreBookmark

- (BOOL)readFrom:(id)a3
{
  return BMPBStoreBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
}

- (void)setStreamId:(id)a3
{
}

- (void)setSegmentName:(id)a3
{
}

- (void)setOffset:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_offset = a3;
}

- (void)setIterationStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iterationStartTime = a3;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unsigned)offset
{
  return self->_offset;
}

- (double)iterationStartTime
{
  return self->_iterationStartTime;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_streamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_segmentName)
  {
    PBDataWriterWriteStringField();
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
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)hasStreamId
{
  return self->_streamId != 0;
}

- (BOOL)hasSegmentName
{
  return self->_segmentName != 0;
}

- (void)setHasIterationStartTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIterationStartTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBStoreBookmark;
  id v4 = [(BMPBStoreBookmark *)&v8 description];
  v5 = [(BMPBStoreBookmark *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  streamId = self->_streamId;
  if (streamId) {
    [v3 setObject:streamId forKey:@"streamId"];
  }
  segmentName = self->_segmentName;
  if (segmentName) {
    [v4 setObject:segmentName forKey:@"segmentName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_iterationStartTime];
    [v4 setObject:v8 forKey:@"iterationStartTime"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_offset];
    [v4 setObject:v9 forKey:@"offset"];
  }
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_streamId)
  {
    objc_msgSend(v4, "setStreamId:");
    id v4 = v6;
  }
  if (self->_segmentName)
  {
    objc_msgSend(v6, "setSegmentName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_iterationStartTime;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_offset;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_streamId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_segmentName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_iterationStartTime;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_offset;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  streamId = self->_streamId;
  if ((unint64_t)streamId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](streamId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](segmentName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_iterationStartTime != *((double *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_offset != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_streamId hash];
  NSUInteger v4 = [(NSString *)self->_segmentName hash];
  char has = (char)self->_has;
  if (has)
  {
    double iterationStartTime = self->_iterationStartTime;
    double v8 = -iterationStartTime;
    if (iterationStartTime >= 0.0) {
      double v8 = self->_iterationStartTime;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_offset;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[BMPBStoreBookmark setStreamId:](self, "setStreamId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBStoreBookmark setSegmentName:](self, "setSegmentName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_double iterationStartTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_offset = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

@end