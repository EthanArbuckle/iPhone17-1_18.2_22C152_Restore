@interface VCCaptionsSegmentBlob
- (BOOL)hasConfidence;
- (BOOL)hasHasSpaceAfter;
- (BOOL)hasSpaceAfter;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)text;
- (VCCaptionsSegmentBlob)initWithSFTranscriptionSegment:(id)a3 isLast:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)confidence;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(unsigned int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasHasSpaceAfter:(BOOL)a3;
- (void)setHasSpaceAfter:(BOOL)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCaptionsSegmentBlob

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCaptionsSegmentBlob *)self setText:0];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsSegmentBlob;
  [(VCCaptionsSegmentBlob *)&v3 dealloc];
}

- (void)setConfidence:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSpaceAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasSpaceAfter = a3;
}

- (void)setHasHasSpaceAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasSpaceAfter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsSegmentBlob;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCaptionsSegmentBlob description](&v3, sel_description), -[VCCaptionsSegmentBlob dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_confidence), @"confidence");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasSpaceAfter), @"hasSpaceAfter");
  }
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCaptionsSegmentBlobReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_text)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_confidence;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)a3 + 24) = self->_hasSpaceAfter;
    *((unsigned char *)a3 + 28) |= 2u;
  }
  text = self->_text;
  if (text) {
    [a3 setText:text];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_hasSpaceAfter;
    *(unsigned char *)(v5 + 28) |= 2u;
  }

  v6[2] = [(NSString *)self->_text copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 28) & 2) == 0) {
    goto LABEL_11;
  }
  if (self->_hasSpaceAfter)
  {
    if (!*((unsigned char *)a3 + 24)) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (*((unsigned char *)a3 + 24)) {
    goto LABEL_11;
  }
LABEL_17:
  text = self->_text;
  if ((unint64_t)text | *((void *)a3 + 2))
  {
    LOBYTE(v5) = -[NSString isEqual:](text, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_confidence;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_text hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_hasSpaceAfter;
  return v3 ^ v2 ^ [(NSString *)self->_text hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_confidence = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
  }
  if ((v3 & 2) != 0)
  {
    self->_hasSpaceAfter = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 2)) {
    -[VCCaptionsSegmentBlob setText:](self, "setText:");
  }
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (VCCaptionsSegmentBlob)initWithSFTranscriptionSegment:(id)a3 isLast:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCCaptionsSegmentBlob;
  v6 = [(VCCaptionsSegmentBlob *)&v9 init];
  if (v6)
  {
    v6->_text = (NSString *)objc_msgSend((id)objc_msgSend(a3, "substring"), "copy");
    [a3 confidence];
    v6->_confidence = (float)(v7 * 100.0);
    *(unsigned char *)&v6->_has |= 1u;
    v6->_hasSpaceAfter = !a4;
    *(unsigned char *)&v6->_has |= 2u;
  }
  return v6;
}

@end