@interface HWPDrawing
- (BOOL)hasCompressionAlgorithm;
- (BOOL)hasDecompressedLength;
- (BOOL)hasEncodedCanvasSize;
- (BOOL)hasEncodedStrokesFrame;
- (BOOL)hasStrokeDataFieldCount;
- (BOOL)hasStrokes;
- (BOOL)hasStrokesCount;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedCanvasSize;
- (NSData)encodedStrokesFrame;
- (NSData)strokes;
- (PBUnknownFields)unknownFields;
- (id)compressionAlgorithmAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCompressionAlgorithm:(id)a3;
- (int)compressionAlgorithm;
- (unint64_t)hash;
- (unsigned)decompressedLength;
- (unsigned)strokeDataFieldCount;
- (unsigned)strokesCount;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompressionAlgorithm:(int)a3;
- (void)setDecompressedLength:(unsigned int)a3;
- (void)setEncodedCanvasSize:(id)a3;
- (void)setEncodedStrokesFrame:(id)a3;
- (void)setHasCompressionAlgorithm:(BOOL)a3;
- (void)setHasDecompressedLength:(BOOL)a3;
- (void)setHasStrokeDataFieldCount:(BOOL)a3;
- (void)setHasStrokesCount:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setStrokeDataFieldCount:(unsigned int)a3;
- (void)setStrokes:(id)a3;
- (void)setStrokesCount:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HWPDrawing

- (unsigned)version
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasEncodedCanvasSize
{
  return self->_encodedCanvasSize != 0;
}

- (BOOL)hasEncodedStrokesFrame
{
  return self->_encodedStrokesFrame != 0;
}

- (void)setStrokesCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_strokesCount = a3;
}

- (void)setHasStrokesCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStrokesCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)compressionAlgorithm
{
  if (*(unsigned char *)&self->_has) {
    return self->_compressionAlgorithm;
  }
  else {
    return 1;
  }
}

- (void)setCompressionAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_compressionAlgorithm = a3;
}

- (void)setHasCompressionAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressionAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)compressionAlgorithmAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264885918[a3];
  }
  return v3;
}

- (int)StringAsCompressionAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LZ4"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ZLIB"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LZMA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LZ4_RAW"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LZFSE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDecompressedLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_decompressedLength = a3;
}

- (void)setHasDecompressedLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDecompressedLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unsigned)strokeDataFieldCount
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_strokeDataFieldCount;
  }
  else {
    return 4;
  }
}

- (void)setStrokeDataFieldCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_strokeDataFieldCount = a3;
}

- (void)setHasStrokeDataFieldCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStrokeDataFieldCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasStrokes
{
  return self->_strokes != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HWPDrawing;
  int v4 = [(HWPDrawing *)&v8 description];
  v5 = [(HWPDrawing *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    int v4 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  encodedCanvasSize = self->_encodedCanvasSize;
  if (encodedCanvasSize) {
    [v3 setObject:encodedCanvasSize forKey:@"encodedCanvasSize"];
  }
  encodedStrokesFrame = self->_encodedStrokesFrame;
  if (encodedStrokesFrame) {
    [v3 setObject:encodedStrokesFrame forKey:@"encodedStrokesFrame"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_strokesCount];
    [v3 setObject:v13 forKey:@"strokesCount"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  uint64_t compressionAlgorithm = self->_compressionAlgorithm;
  if (compressionAlgorithm >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_compressionAlgorithm);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_264885918[compressionAlgorithm];
  }
  [v3 setObject:v15 forKey:@"compressionAlgorithm"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_24:
  v16 = [NSNumber numberWithUnsignedInt:self->_decompressedLength];
  [v3 setObject:v16 forKey:@"decompressedLength"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_strokeDataFieldCount];
    [v3 setObject:v8 forKey:@"strokeDataFieldCount"];
  }
LABEL_12:
  strokes = self->_strokes;
  if (strokes) {
    [v3 setObject:strokes forKey:@"strokes"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v11 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"Unknown Fields"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HWPDrawingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_encodedCanvasSize)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_encodedStrokesFrame)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_12:
  if (self->_strokes)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[15] = self->_version;
    *((unsigned char *)v4 + 64) |= 0x10u;
  }
  id v6 = v4;
  if (self->_encodedCanvasSize)
  {
    objc_msgSend(v4, "setEncodedCanvasSize:");
    id v4 = v6;
  }
  if (self->_encodedStrokesFrame)
  {
    objc_msgSend(v6, "setEncodedStrokesFrame:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_strokesCount;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v4[4] = self->_compressionAlgorithm;
  *((unsigned char *)v4 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v4[5] = self->_decompressedLength;
  *((unsigned char *)v4 + 64) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v4[10] = self->_strokeDataFieldCount;
    *((unsigned char *)v4 + 64) |= 4u;
  }
LABEL_12:
  if (self->_strokes)
  {
    objc_msgSend(v6, "setStrokes:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_version;
    *(unsigned char *)(v5 + 64) |= 0x10u;
  }
  uint64_t v7 = [(NSData *)self->_encodedCanvasSize copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSData *)self->_encodedStrokesFrame copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_strokesCount;
    *(unsigned char *)(v6 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 20) = self->_decompressedLength;
      *(unsigned char *)(v6 + 64) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_compressionAlgorithm;
  *(unsigned char *)(v6 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 40) = self->_strokeDataFieldCount;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
LABEL_8:
  uint64_t v12 = [(NSData *)self->_strokes copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 15)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
LABEL_33:
    char v8 = 0;
    goto LABEL_34;
  }
  encodedCanvasSize = self->_encodedCanvasSize;
  if ((unint64_t)encodedCanvasSize | *((void *)v4 + 3)
    && !-[NSData isEqual:](encodedCanvasSize, "isEqual:"))
  {
    goto LABEL_33;
  }
  encodedStrokesFrame = self->_encodedStrokesFrame;
  if ((unint64_t)encodedStrokesFrame | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](encodedStrokesFrame, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_strokesCount != *((_DWORD *)v4 + 14)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_compressionAlgorithm != *((_DWORD *)v4 + 4)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_decompressedLength != *((_DWORD *)v4 + 5)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_strokeDataFieldCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_33;
  }
  strokes = self->_strokes;
  if ((unint64_t)strokes | *((void *)v4 + 6)) {
    char v8 = -[NSData isEqual:](strokes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_34:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_encodedCanvasSize hash];
  uint64_t v5 = [(NSData *)self->_encodedStrokesFrame hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_strokesCount;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_compressionAlgorithm;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSData *)self->_strokes hash];
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_decompressedLength;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_strokeDataFieldCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSData *)self->_strokes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[16] & 0x10) != 0)
  {
    self->_version = v4[15];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[HWPDrawing setEncodedCanvasSize:](self, "setEncodedCanvasSize:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HWPDrawing setEncodedStrokesFrame:](self, "setEncodedStrokesFrame:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_strokesCount = v4[14];
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v4[16] & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_uint64_t compressionAlgorithm = v4[4];
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_decompressedLength = v4[5];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[16] & 4) != 0)
  {
LABEL_11:
    self->_strokeDataFieldCount = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 6))
  {
    -[HWPDrawing setStrokes:](self, "setStrokes:");
    uint64_t v4 = v6;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSData)encodedCanvasSize
{
  return self->_encodedCanvasSize;
}

- (void)setEncodedCanvasSize:(id)a3
{
}

- (NSData)encodedStrokesFrame
{
  return self->_encodedStrokesFrame;
}

- (void)setEncodedStrokesFrame:(id)a3
{
}

- (unsigned)strokesCount
{
  return self->_strokesCount;
}

- (unsigned)decompressedLength
{
  return self->_decompressedLength;
}

- (NSData)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_encodedStrokesFrame, 0);
  objc_storeStrong((id *)&self->_encodedCanvasSize, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end