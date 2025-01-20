@interface BMPBSiriDictationEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasCorrectedText;
- (BOOL)hasRecognizedText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)correctedText;
- (NSString)recognizedText;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setCorrectedText:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setRecognizedText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriDictationEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRecognizedText
{
  return self->_recognizedText != 0;
}

- (BOOL)hasCorrectedText
{
  return self->_correctedText != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriDictationEvent;
  v4 = [(BMPBSiriDictationEvent *)&v8 description];
  v5 = [(BMPBSiriDictationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  recognizedText = self->_recognizedText;
  if (recognizedText) {
    [v3 setObject:recognizedText forKey:@"recognizedText"];
  }
  correctedText = self->_correctedText;
  if (correctedText) {
    [v3 setObject:correctedText forKey:@"correctedText"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriDictationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_recognizedText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_correctedText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_recognizedText)
  {
    objc_msgSend(v4, "setRecognizedText:");
    id v4 = v5;
  }
  if (self->_correctedText)
  {
    objc_msgSend(v5, "setCorrectedText:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_recognizedText copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_correctedText copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  recognizedText = self->_recognizedText;
  if ((unint64_t)recognizedText | *((void *)v4 + 3)
    && !-[NSString isEqual:](recognizedText, "isEqual:"))
  {
    goto LABEL_11;
  }
  correctedText = self->_correctedText;
  if ((unint64_t)correctedText | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](correctedText, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_recognizedText hash] ^ v3;
  return v8 ^ [(NSString *)self->_correctedText hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[4])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  double v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[BMPBSiriDictationEvent setRecognizedText:](self, "setRecognizedText:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBSiriDictationEvent setCorrectedText:](self, "setCorrectedText:");
    id v4 = v5;
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (void)setRecognizedText:(id)a3
{
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedText, 0);

  objc_storeStrong((id *)&self->_correctedText, 0);
}

@end