@interface VCCaptionsTranscriptionBlob
+ (Class)segmentsType;
- (BOOL)hasIsFinal;
- (BOOL)hasIsLocal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinal;
- (BOOL)isLocal;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)segments;
- (VCCaptionsTranscriptionBlob)initWithSFTranscription:(id)a3 final:(BOOL)a4 isLocal:(BOOL)a5 utteranceNumber:(unsigned int)a6 updateNumber:(unsigned int)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)segmentsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)segmentsCount;
- (unsigned)updateNumber;
- (unsigned)utteranceNumber;
- (void)addSegments:(id)a3;
- (void)clearSegments;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIsFinal:(BOOL)a3;
- (void)setHasIsLocal:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setSegments:(id)a3;
- (void)setUpdateNumber:(unsigned int)a3;
- (void)setUtteranceNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCaptionsTranscriptionBlob

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCaptionsTranscriptionBlob *)self setSegments:0];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscriptionBlob;
  [(VCCaptionsTranscriptionBlob *)&v3 dealloc];
}

- (void)setIsLocal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isLocal = a3;
}

- (void)setHasIsLocal:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsLocal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsFinal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isFinal = a3;
}

- (void)setHasIsFinal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFinal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSegments
{
}

- (void)addSegments:(id)a3
{
  segments = self->_segments;
  if (!segments)
  {
    segments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_segments = segments;
  }

  [(NSMutableArray *)segments addObject:a3];
}

- (unint64_t)segmentsCount
{
  return [(NSMutableArray *)self->_segments count];
}

- (id)segmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_segments objectAtIndex:a3];
}

+ (Class)segmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscriptionBlob;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCaptionsTranscriptionBlob description](&v3, sel_description), -[VCCaptionsTranscriptionBlob dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_utteranceNumber), @"utteranceNumber");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_updateNumber), @"updateNumber");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isLocal), @"isLocal");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_isFinal), @"isFinal");
  }
  if ([(NSMutableArray *)self->_segments count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_segments, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    segments = self->_segments;
    uint64_t v7 = [(NSMutableArray *)segments countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(segments);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v8 = [(NSMutableArray *)segments countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"segments"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCaptionsTranscriptionBlobReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  segments = self->_segments;
  uint64_t v6 = [(NSMutableArray *)segments countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(segments);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)segments countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 5) = self->_utteranceNumber;
  *((_DWORD *)a3 + 4) = self->_updateNumber;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)a3 + 25) = self->_isLocal;
    *((unsigned char *)a3 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((unsigned char *)a3 + 24) = self->_isFinal;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if ([(VCCaptionsTranscriptionBlob *)self segmentsCount])
  {
    [a3 clearSegments];
    unint64_t v6 = [(VCCaptionsTranscriptionBlob *)self segmentsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(a3, "addSegments:", -[VCCaptionsTranscriptionBlob segmentsAtIndex:](self, "segmentsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  *(_DWORD *)(v5 + 20) = self->_utteranceNumber;
  *(_DWORD *)(v5 + 16) = self->_updateNumber;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_isLocal;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 24) = self->_isFinal;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  segments = self->_segments;
  uint64_t v9 = [(NSMutableArray *)segments countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(segments);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [v6 addSegments:v13];
      }
      uint64_t v10 = [(NSMutableArray *)segments countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (self->_utteranceNumber != *((_DWORD *)a3 + 5) || self->_updateNumber != *((_DWORD *)a3 + 4)) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0) {
      goto LABEL_16;
    }
    if (self->_isLocal)
    {
      if (!*((unsigned char *)a3 + 25)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 25))
    {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0) {
      goto LABEL_22;
    }
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 28) & 1) == 0) {
    goto LABEL_16;
  }
  if (self->_isFinal)
  {
    if (!*((unsigned char *)a3 + 24)) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  if (*((unsigned char *)a3 + 24)) {
    goto LABEL_16;
  }
LABEL_22:
  segments = self->_segments;
  if ((unint64_t)segments | *((void *)a3 + 1))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](segments, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isLocal;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isFinal;
LABEL_6:
  unsigned int utteranceNumber = self->_utteranceNumber;
  unsigned int updateNumber = self->_updateNumber;
  return (2654435761 * updateNumber) ^ (2654435761 * utteranceNumber) ^ v4 ^ v5 ^ [(NSMutableArray *)self->_segments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_unsigned int utteranceNumber = *((_DWORD *)a3 + 5);
  self->_unsigned int updateNumber = *((_DWORD *)a3 + 4);
  char v4 = *((unsigned char *)a3 + 28);
  if ((v4 & 2) != 0)
  {
    self->_isLocal = *((unsigned char *)a3 + 25);
    *(unsigned char *)&self->_has |= 2u;
    char v4 = *((unsigned char *)a3 + 28);
  }
  if (v4)
  {
    self->_isFinal = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VCCaptionsTranscriptionBlob *)self addSegments:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (void)setUtteranceNumber:(unsigned int)a3
{
  self->_unsigned int utteranceNumber = a3;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_unsigned int updateNumber = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (VCCaptionsTranscriptionBlob)initWithSFTranscription:(id)a3 final:(BOOL)a4 isLocal:(BOOL)a5 utteranceNumber:(unsigned int)a6 updateNumber:(unsigned int)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)VCCaptionsTranscriptionBlob;
  uint64_t v10 = [(VCCaptionsTranscriptionBlob *)&v22 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "segments"), "count"));
    v10->_segments = (NSMutableArray *)v11;
    if (!v11)
    {
LABEL_12:

      return 0;
    }
    BOOL v21 = a5;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "segments"), "lastObject");
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v13 = (void *)[a3 segments];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
LABEL_5:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [[VCCaptionsSegmentBlob alloc] initWithSFTranscriptionSegment:*(void *)(*((void *)&v24 + 1) + 8 * v17) isLast:*(void *)(*((void *)&v24 + 1) + 8 * v17) == v12];
        if (!v18) {
          goto LABEL_12;
        }
        long long v19 = v18;
        [(NSMutableArray *)v10->_segments addObject:v18];

        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v23 count:16];
          if (v15) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    v10->_isFinal = a4;
    *(unsigned char *)&v10->_has |= 1u;
    v10->_isLocal = v21;
    *(unsigned char *)&v10->_has |= 2u;
  }
  return v10;
}

@end