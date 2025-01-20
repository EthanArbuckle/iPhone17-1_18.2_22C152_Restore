@interface VCPProtoLivePhotoVariationParams
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasLoopFadeLen;
- (BOOL)hasLoopPeriod;
- (BOOL)hasLoopStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)errorCode;
- (int)loopFadeLen;
- (int)loopPeriod;
- (int)loopStart;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasLoopFadeLen:(BOOL)a3;
- (void)setHasLoopPeriod:(BOOL)a3;
- (void)setHasLoopStart:(BOOL)a3;
- (void)setLoopFadeLen:(int)a3;
- (void)setLoopPeriod:(int)a3;
- (void)setLoopStart:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoVariationParams

- (void)setLoopFadeLen:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_loopFadeLen = a3;
}

- (void)setHasLoopFadeLen:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLoopFadeLen
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLoopPeriod:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_loopPeriod = a3;
}

- (void)setHasLoopPeriod:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLoopPeriod
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLoopStart:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_loopStart = a3;
}

- (void)setHasLoopStart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLoopStart
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoVariationParams;
  v4 = [(VCPProtoLivePhotoVariationParams *)&v8 description];
  v5 = [(VCPProtoLivePhotoVariationParams *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithInt:self->_errorCode];
  [v3 setObject:v4 forKey:@"errorCode"];

  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_loopFadeLen];
    [v3 setObject:v8 forKey:@"loopFadeLen"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithInt:self->_loopPeriod];
  [v3 setObject:v9 forKey:@"loopPeriod"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = [NSNumber numberWithInt:self->_loopStart];
    [v3 setObject:v6 forKey:@"loopStart"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoVariationParamsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[2] = self->_errorCode;
  char has = (char)self->_has;
  if (has)
  {
    v4[3] = self->_loopFadeLen;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_loopPeriod;
  *((unsigned char *)v4 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[5] = self->_loopStart;
    *((unsigned char *)v4 + 24) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_errorCode;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 3) = self->_loopFadeLen;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_loopPeriod;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = self->_loopStart;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_errorCode != *((_DWORD *)v4 + 2)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_loopFadeLen != *((_DWORD *)v4 + 3)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_loopPeriod != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_loopStart != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
    BOOL v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_loopFadeLen;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_loopPeriod;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_loopStart;
  }
  else {
    uint64_t v4 = 0;
  }
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_errorCode);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_errorCode = v4[2];
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_loopFadeLen = v4[3];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[6] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_loopPeriod = v4[4];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[6] & 4) != 0)
  {
LABEL_4:
    self->_loopStart = v4[5];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

- (int)loopFadeLen
{
  return self->_loopFadeLen;
}

- (int)loopPeriod
{
  return self->_loopPeriod;
}

- (int)loopStart
{
  return self->_loopStart;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(VCPProtoLivePhotoVariationParams);
    char v5 = [v3 objectForKeyedSubscript:@"Params"];
    v6 = [v3 objectForKeyedSubscript:@"ErrorCode"];
    -[VCPProtoLivePhotoVariationParams setErrorCode:](v4, "setErrorCode:", [v6 intValue]);

    if (![(VCPProtoLivePhotoVariationParams *)v4 errorCode] && v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"loopFadeLen"];
      -[VCPProtoLivePhotoVariationParams setLoopFadeLen:](v4, "setLoopFadeLen:", [v7 intValue]);

      objc_super v8 = [v5 objectForKeyedSubscript:@"loopPeriod"];
      -[VCPProtoLivePhotoVariationParams setLoopPeriod:](v4, "setLoopPeriod:", [v8 intValue]);

      v9 = [v5 objectForKeyedSubscript:@"loopStart"];
      -[VCPProtoLivePhotoVariationParams setLoopStart:](v4, "setLoopStart:", [v9 intValue]);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoVariationParams errorCode](self, "errorCode"));
  [v3 setObject:v4 forKeyedSubscript:@"ErrorCode"];

  if (![(VCPProtoLivePhotoVariationParams *)self errorCode])
  {
    v10[0] = @"loopFadeLen";
    char v5 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopFadeLen](self, "loopFadeLen"));
    v11[0] = v5;
    v10[1] = @"loopPeriod";
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopPeriod](self, "loopPeriod"));
    v11[1] = v6;
    v10[2] = @"loopStart";
    v7 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopStart](self, "loopStart"));
    v11[2] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

    [v3 setObject:v8 forKeyedSubscript:@"Params"];
  }
  return v3;
}

@end