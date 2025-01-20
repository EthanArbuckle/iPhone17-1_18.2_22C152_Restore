@interface VCMediaNegotiationBlobV2CameraSettingsU1
+ (Class)payloadsType;
- (BOOL)addVideoRules:(id)a3 encodingType:(unsigned __int8)a4 payload:(int)a5 videoRuleCollections:(id)a6;
- (BOOL)hasCipherSuites;
- (BOOL)hasLandscapeAspectRatioX;
- (BOOL)hasLandscapeAspectRatioY;
- (BOOL)hasMismatchedDisplayAspectRatioX;
- (BOOL)hasMismatchedDisplayAspectRatioY;
- (BOOL)hasPortraitAspectRatioX;
- (BOOL)hasPortraitAspectRatioY;
- (BOOL)hasRtpSSRC;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)setupVideoRuleCollection:(id)a3 featureListStrings:(id)a4;
- (CGSize)orientationMismatchDisplayRatio;
- (NSMutableArray)payloads;
- (VCMediaNegotiationBlobV2CameraSettingsU1)initWithSSRC:(unsigned int)a3 videoRuleCollections:(id)a4 screenSize:(CGSize)a5 aspectRatioPortrait:(CGSize)a6 aspectRatioLandscape:(CGSize)a7 orientationMismatchAspectRatioLandscape:(CGSize)a8 featureListStrings:(id)a9 u1AuthTagEnabled:(BOOL)a10;
- (VCVideoRuleCollections)videoRuleCollections;
- (id)cipherSuitesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadsAtIndex:(unint64_t)a3;
- (id)rulesForEncodeType:(unsigned __int8)a3 paylaod:(int)a4 videoRuleCollection:(id)a5;
- (int)StringAsCipherSuites:(id)a3;
- (int)cipherSuites;
- (unint64_t)hash;
- (unint64_t)payloadsCount;
- (unsigned)landscapeAspectRatioX;
- (unsigned)landscapeAspectRatioY;
- (unsigned)mismatchedDisplayAspectRatioX;
- (unsigned)mismatchedDisplayAspectRatioY;
- (unsigned)portraitAspectRatioX;
- (unsigned)portraitAspectRatioY;
- (unsigned)rtpSSRC;
- (void)addPayloads:(id)a3;
- (void)aspectRatioPortrait:(CGSize *)a3 aspectRatioLandscape:(CGSize *)a4 orientationMismatchAspectRatioLandscape:(CGSize *)a5 orientationMismatchAspectRatioPortrait:(CGSize *)a6 screenSize:(CGSize)a7;
- (void)clearPayloads;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4 screenSize:(CGSize)a5;
- (void)setCipherSuites:(int)a3;
- (void)setHasCipherSuites:(BOOL)a3;
- (void)setHasLandscapeAspectRatioX:(BOOL)a3;
- (void)setHasLandscapeAspectRatioY:(BOOL)a3;
- (void)setHasMismatchedDisplayAspectRatioX:(BOOL)a3;
- (void)setHasMismatchedDisplayAspectRatioY:(BOOL)a3;
- (void)setHasPortraitAspectRatioX:(BOOL)a3;
- (void)setHasPortraitAspectRatioY:(BOOL)a3;
- (void)setHasRtpSSRC:(BOOL)a3;
- (void)setLandscapeAspectRatioX:(unsigned int)a3;
- (void)setLandscapeAspectRatioY:(unsigned int)a3;
- (void)setMismatchedDisplayAspectRatioX:(unsigned int)a3;
- (void)setMismatchedDisplayAspectRatioY:(unsigned int)a3;
- (void)setPayloads:(id)a3;
- (void)setPortraitAspectRatioX:(unsigned int)a3;
- (void)setPortraitAspectRatioY:(unsigned int)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2CameraSettingsU1

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self setPayloads:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CameraSettingsU1;
  [(VCMediaNegotiationBlobV2CameraSettingsU1 *)&v3 dealloc];
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasRtpSSRC
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)clearPayloads
{
}

- (void)addPayloads:(id)a3
{
  payloads = self->_payloads;
  if (!payloads)
  {
    payloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_payloads = payloads;
  }

  [(NSMutableArray *)payloads addObject:a3];
}

- (unint64_t)payloadsCount
{
  return [(NSMutableArray *)self->_payloads count];
}

- (id)payloadsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_payloads objectAtIndex:a3];
}

+ (Class)payloadsType
{
  return (Class)objc_opt_class();
}

- (void)setLandscapeAspectRatioX:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_landscapeAspectRatioX = a3;
}

- (void)setHasLandscapeAspectRatioX:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLandscapeAspectRatioX
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLandscapeAspectRatioY:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_landscapeAspectRatioY = a3;
}

- (void)setHasLandscapeAspectRatioY:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLandscapeAspectRatioY
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPortraitAspectRatioX:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_portraitAspectRatioX = a3;
}

- (void)setHasPortraitAspectRatioX:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPortraitAspectRatioX
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPortraitAspectRatioY:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_portraitAspectRatioY = a3;
}

- (void)setHasPortraitAspectRatioY:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPortraitAspectRatioY
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMismatchedDisplayAspectRatioX:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mismatchedDisplayAspectRatioX = a3;
}

- (void)setHasMismatchedDisplayAspectRatioX:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMismatchedDisplayAspectRatioX
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMismatchedDisplayAspectRatioY:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_mismatchedDisplayAspectRatioY = a3;
}

- (void)setHasMismatchedDisplayAspectRatioY:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMismatchedDisplayAspectRatioY
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)cipherSuites
{
  if (*(unsigned char *)&self->_has) {
    return self->_cipherSuites;
  }
  else {
    return 1;
  }
}

- (void)setCipherSuites:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cipherSuites = a3;
}

- (void)setHasCipherSuites:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipherSuites
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cipherSuitesAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 7 && ((0x4Bu >> v3)) {
    return off_1E6DB84F0[v3];
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
}

- (int)StringAsCipherSuites:(id)a3
{
  if ([a3 isEqualToString:@"CipherAES128AuthNoneRCCM3"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CipherAES128AuthSHA280RCCM2Deferred"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"CipherAES128AuthSHA232RCCM2Deferred"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"SupportedMask"]) {
    return 7;
  }
  return 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CameraSettingsU1;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2CameraSettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2CameraSettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  }
  if ([(NSMutableArray *)self->_payloads count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_payloads, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    payloads = self->_payloads;
    uint64_t v6 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(payloads);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"payloads"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_landscapeAspectRatioX), @"landscapeAspectRatioX");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_landscapeAspectRatioY), @"landscapeAspectRatioY");
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_portraitAspectRatioX), @"portraitAspectRatioX");
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_portraitAspectRatioY), @"portraitAspectRatioY");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_mismatchedDisplayAspectRatioY), @"mismatchedDisplayAspectRatioY");
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_26;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_mismatchedDisplayAspectRatioX), @"mismatchedDisplayAspectRatioX");
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_25;
  }
LABEL_18:
  if ((has & 1) == 0) {
    return v3;
  }
LABEL_26:
  unsigned int v11 = self->_cipherSuites - 1;
  if (v11 < 7 && ((0x4Bu >> v11) & 1) != 0) {
    v12 = off_1E6DB84F0[v11];
  }
  else {
    v12 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cipherSuites);
  }
  [v3 setObject:v12 forKey:@"cipherSuites"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2CameraSettingsU1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  payloads = self->_payloads;
  uint64_t v5 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(payloads);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 1) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_rtpSSRC;
    *((unsigned char *)a3 + 52) |= 0x80u;
  }
  if ([(VCMediaNegotiationBlobV2CameraSettingsU1 *)self payloadsCount])
  {
    [a3 clearPayloads];
    unint64_t v5 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self payloadsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPayloads:", -[VCMediaNegotiationBlobV2CameraSettingsU1 payloadsAtIndex:](self, "payloadsAtIndex:", i));
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_landscapeAspectRatioX;
    *((unsigned char *)a3 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 4) = self->_landscapeAspectRatioY;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_portraitAspectRatioX;
  *((unsigned char *)a3 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_portraitAspectRatioY;
  *((unsigned char *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_mismatchedDisplayAspectRatioX;
  *((unsigned char *)a3 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_21:
  *((_DWORD *)a3 + 6) = self->_mismatchedDisplayAspectRatioY;
  *((unsigned char *)a3 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 2) = self->_cipherSuites;
  *((unsigned char *)a3 + 52) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_rtpSSRC;
    *(unsigned char *)(v5 + 52) |= 0x80u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  payloads = self->_payloads;
  uint64_t v8 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(payloads);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPayloads:v12];
      }
      uint64_t v9 = [(NSMutableArray *)payloads countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v9);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_landscapeAspectRatioX;
    *(unsigned char *)(v6 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 16) = self->_landscapeAspectRatioY;
  *(unsigned char *)(v6 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 40) = self->_portraitAspectRatioX;
  *(unsigned char *)(v6 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 44) = self->_portraitAspectRatioY;
  *(unsigned char *)(v6 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
LABEL_24:
    *(_DWORD *)(v6 + 24) = self->_mismatchedDisplayAspectRatioY;
    *(unsigned char *)(v6 + 52) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_17;
  }
LABEL_23:
  *(_DWORD *)(v6 + 20) = self->_mismatchedDisplayAspectRatioX;
  *(unsigned char *)(v6 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_24;
  }
LABEL_16:
  if (has)
  {
LABEL_17:
    *(_DWORD *)(v6 + 8) = self->_cipherSuites;
    *(unsigned char *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $6C1ACC2E0C1BB4042306AA23F7780358 has = self->_has;
    int v7 = *((char *)a3 + 52);
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 12)) {
        goto LABEL_45;
      }
    }
    else if (v7 < 0)
    {
LABEL_45:
      LOBYTE(v5) = 0;
      return v5;
    }
    payloads = self->_payloads;
    if ((unint64_t)payloads | *((void *)a3 + 4))
    {
      int v5 = -[NSMutableArray isEqual:](payloads, "isEqual:");
      if (!v5) {
        return v5;
      }
      *(unsigned char *)&$6C1ACC2E0C1BB4042306AA23F7780358 has = self->_has;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_landscapeAspectRatioX != *((_DWORD *)a3 + 3)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 2) != 0)
    {
      goto LABEL_45;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_landscapeAspectRatioY != *((_DWORD *)a3 + 4)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
      goto LABEL_45;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_portraitAspectRatioX != *((_DWORD *)a3 + 10)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x20) != 0)
    {
      goto LABEL_45;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_portraitAspectRatioY != *((_DWORD *)a3 + 11)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_45;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_mismatchedDisplayAspectRatioX != *((_DWORD *)a3 + 5)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 8) != 0)
    {
      goto LABEL_45;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_mismatchedDisplayAspectRatioY != *((_DWORD *)a3 + 6)) {
        goto LABEL_45;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_45;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 1) == 0;
    if (*(unsigned char *)&has)
    {
      if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_cipherSuites != *((_DWORD *)a3 + 2)) {
        goto LABEL_45;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v3 = 2654435761 * self->_rtpSSRC;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_payloads hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_landscapeAspectRatioX;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_landscapeAspectRatioY;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_portraitAspectRatioX;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_portraitAspectRatioY;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_mismatchedDisplayAspectRatioX;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v10 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_11;
    }
LABEL_18:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_mismatchedDisplayAspectRatioY;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_cipherSuites;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*((char *)a3 + 52) < 0)
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self addPayloads:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 2) != 0)
  {
    self->_landscapeAspectRatioX = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)a3 + 52);
    if ((v10 & 4) == 0)
    {
LABEL_12:
      if ((v10 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_landscapeAspectRatioY = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 0x20) == 0)
  {
LABEL_13:
    if ((v10 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_portraitAspectRatioX = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 0x40) == 0)
  {
LABEL_14:
    if ((v10 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_portraitAspectRatioY = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 8) == 0)
  {
LABEL_15:
    if ((v10 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_mismatchedDisplayAspectRatioX = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v10 = *((unsigned char *)a3 + 52);
  if ((v10 & 0x10) == 0)
  {
LABEL_16:
    if ((v10 & 1) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_24:
  self->_mismatchedDisplayAspectRatioY = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 52) & 1) == 0) {
    return;
  }
LABEL_17:
  self->_cipherSuites = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (void)setPayloads:(id)a3
{
}

- (unsigned)landscapeAspectRatioX
{
  return self->_landscapeAspectRatioX;
}

- (unsigned)landscapeAspectRatioY
{
  return self->_landscapeAspectRatioY;
}

- (unsigned)portraitAspectRatioX
{
  return self->_portraitAspectRatioX;
}

- (unsigned)portraitAspectRatioY
{
  return self->_portraitAspectRatioY;
}

- (unsigned)mismatchedDisplayAspectRatioX
{
  return self->_mismatchedDisplayAspectRatioX;
}

- (unsigned)mismatchedDisplayAspectRatioY
{
  return self->_mismatchedDisplayAspectRatioY;
}

- (VCMediaNegotiationBlobV2CameraSettingsU1)initWithSSRC:(unsigned int)a3 videoRuleCollections:(id)a4 screenSize:(CGSize)a5 aspectRatioPortrait:(CGSize)a6 aspectRatioLandscape:(CGSize)a7 orientationMismatchAspectRatioLandscape:(CGSize)a8 featureListStrings:(id)a9 u1AuthTagEnabled:(BOOL)a10
{
  BOOL v10 = a10;
  double height = a8.height;
  double width = a8.width;
  double v15 = a7.height;
  double v16 = a7.width;
  double v17 = a6.height;
  double v18 = a6.width;
  uint64_t v19 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  CGSize v29 = a5;
  uint64_t v20 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self init];
  v21 = v20;
  if (v20)
  {
    [(VCMediaNegotiationBlobV2CameraSettingsU1 *)v20 setRtpSSRC:v19];
    if ([(VCMediaNegotiationBlobV2CameraSettingsU1 *)v21 setupVideoRuleCollection:a4 featureListStrings:a9])
    {
      SimplifyFixedPointRatio(&v29.width);
      if (v29.height != v18) {
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setPortraitAspectRatioX:](v21, "setPortraitAspectRatioX:", v18, v29.height);
      }
      double v22 = v29.width;
      if (v29.width != v17)
      {
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setPortraitAspectRatioY:](v21, "setPortraitAspectRatioY:", v17, v29.width);
        double v22 = v29.width;
      }
      if (v22 != v16) {
        [(VCMediaNegotiationBlobV2CameraSettingsU1 *)v21 setLandscapeAspectRatioX:v16];
      }
      double v23 = v29.height;
      if (v29.height != v15) {
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setLandscapeAspectRatioY:](v21, "setLandscapeAspectRatioY:", v15, v29.height);
      }
      if (v16 != width) {
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setMismatchedDisplayAspectRatioX:](v21, "setMismatchedDisplayAspectRatioX:", width, v23);
      }
      if (v15 != height) {
        [(VCMediaNegotiationBlobV2CameraSettingsU1 *)v21 setMismatchedDisplayAspectRatioY:height];
      }
      uint64_t v24 = +[VCMediaNegotiationBlobV2SettingsU1 negotiationCipherSuitesFromMediaStreamCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "negotiationCipherSuitesFromMediaStreamCipherSuites:", +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:1667329381 isOneToOne:1]);
      if (v10 && VCFeatureFlagManager_U1AuthTagEnabled())
      {
        if (v24 != [(VCMediaNegotiationBlobV2CameraSettingsU1 *)v21 cipherSuites]) {
          [(VCMediaNegotiationBlobV2CameraSettingsU1 *)v21 setCipherSuites:v24];
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          id v27 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v24, [MEMORY[0x1E4F28E78] string]);
          *(_DWORD *)buf = 136316162;
          uint64_t v31 = v25;
          __int16 v32 = 2080;
          v33 = "-[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) initWithSSRC:videoRuleCollections:screenSize:aspectRat"
                "ioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:]";
          __int16 v34 = 1024;
          int v35 = 64;
          __int16 v36 = 2112;
          id v37 = v27;
          __int16 v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning cipherSuites=%@ for blob=%@ because U1AuthTag is NOT enabled", buf, 0x30u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:]();
        }
      }

      return 0;
    }
  }
  return v21;
}

- (void)aspectRatioPortrait:(CGSize *)a3 aspectRatioLandscape:(CGSize *)a4 orientationMismatchAspectRatioLandscape:(CGSize *)a5 orientationMismatchAspectRatioPortrait:(CGSize *)a6 screenSize:(CGSize)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CGSize v17 = a7;
  double v12 = SimplifyFixedPointRatio(&v17.width);
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    double width = v17.width;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    double height = v17.height;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double width = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self landscapeAspectRatioX];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  double height = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self landscapeAspectRatioY];
  if (a4)
  {
LABEL_7:
    a4->double width = width;
    a4->double height = height;
  }
LABEL_8:
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    double v15 = v17.height;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    double v16 = v17.width;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  double v15 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self portraitAspectRatioX];
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  double v16 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self portraitAspectRatioY];
  if (a3)
  {
LABEL_14:
    a3->double width = v15;
    a3->double height = v16;
  }
LABEL_15:
  if (a5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      double width = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioX];
    }
    a5->double width = width;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      double height = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioY];
    }
    a5->double height = height;
  }
  if (a6)
  {
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      double v15 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioY];
    }
    a6->double width = v15;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      double v16 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioX];
    }
    a6->double height = v16;
  }
}

- (CGSize)orientationMismatchDisplayRatio
{
  double v3 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioX];
  double v4 = (double)[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self mismatchedDisplayAspectRatioY];
  double v5 = v3;
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (BOOL)addVideoRules:(id)a3 encodingType:(unsigned __int8)a4 payload:(int)a5 videoRuleCollections:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  if ([a3 count])
  {
    uint64_t v10 = [a3 mutableCopy];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      double v12 = (void *)[a6 supportedPayloads];
      if ((objc_msgSend(v12, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)) & 1) == 0) {
        [a6 addSupportedPayload:v7];
      }
      BOOL v13 = 1;
      [a6 addVideoRules:v11 transportType:1 payload:v7 encodingType:v8];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) addVideoRules:encodingType:payload:videoRuleCollections:]();
        }
      }
      uint64_t v11 = 0;
      BOOL v13 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    BOOL v13 = 1;
  }

  return v13;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = objc_alloc_init(VCVideoRuleCollections);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections]();
      }
    }
    goto LABEL_19;
  }
  if (![MEMORY[0x1E4F1CA80] set])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections]();
      }
    }
LABEL_19:

    double v3 = 0;
    return v3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self payloads];
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 payload];
        if (!-[VCMediaNegotiationBlobV2CameraSettingsU1 addVideoRules:encodingType:payload:videoRuleCollections:](self, "addVideoRules:encodingType:payload:videoRuleCollections:", [v9 encodeVideoRules], 1, v10, v3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections].cold.4();
            }
          }
          goto LABEL_19;
        }
        if (!-[VCMediaNegotiationBlobV2CameraSettingsU1 addVideoRules:encodingType:payload:videoRuleCollections:](self, "addVideoRules:encodingType:payload:videoRuleCollections:", [v9 decodeVideoRules], 2, v10, v3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections]();
            }
          }
          goto LABEL_19;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4 screenSize:(CGSize)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = -1;
  uint64_t v31 = -1;
  uint64_t v28 = -1;
  uint64_t v29 = -1;
  uint64_t v26 = -1;
  uint64_t v27 = -1;
  uint64_t v24 = -1;
  uint64_t v25 = -1;
  -[VCMediaNegotiationBlobV2CameraSettingsU1 aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:](self, "aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:", &v30, &v28, &v26, &v24, a5.width, a5.height);
  uint64_t v8 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2CameraSettingsU1 data](self, "data"), "length"), a4];
  uint64_t v9 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self rtpSSRC];
  objc_msgSend(v8, "appendFormat:", @"Camera settings (U+1): src=%08x AR=%fx%f,%fx%f XR=%fx%f,%fx%f ", v9, v28, v29, v30, v31, v26, v27, v24, v25);
  +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self cipherSuites] toDescription:v8];
  char v10 = [v8 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v11, v12, v13, v14, v15, v16, v10);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v38 = v17;
      __int16 v39 = 2080;
      uint64_t v40 = "-[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) printWithLogFile:prefix:screenSize:]";
      __int16 v41 = 1024;
      int v42 = 172;
      __int16 v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self payloads];
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v23++) printWithLogFile:a3, objc_msgSend(NSString, "stringWithFormat:", @"%@  ", a4) prefix];
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v21);
  }
}

- (id)rulesForEncodeType:(unsigned __int8)a3 paylaod:(int)a4 videoRuleCollection:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  uint64_t v8 = [a5 getVideoRulesForTransport:1 payload:*(void *)&a4 encodingType:a3];
  uint64_t v9 = [a5 getVideoRulesForTransport:2 payload:v6 encodingType:v7];
  char v10 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v8];
  [v10 addObjectsFromArray:v9];

  return (id)[v10 allObjects];
}

- (BOOL)setupVideoRuleCollection:(id)a3 featureListStrings:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = (void *)[a3 supportedPayloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v7)
  {
LABEL_11:
    LOBYTE(v14) = 1;
    return v14;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v19 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v10) unsignedIntValue];
    if (v11 == 126) {
      goto LABEL_9;
    }
    uint64_t v12 = [[VCMediaNegotiationBlobV2VideoPayload alloc] initWithPayload:v11 encodeVideoRules:[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self rulesForEncodeType:1 paylaod:v11 videoRuleCollection:a3] decodeVideoRules:[(VCMediaNegotiationBlobV2CameraSettingsU1 *)self rulesForEncodeType:2 paylaod:v11 videoRuleCollection:a3] videoParameterSupport:VCVideoParamaterSets_DefaultSupportedSets(v11) featureListStrings:a4];
    if (!v12) {
      break;
    }
    uint64_t v13 = v12;
    [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self addPayloads:v12];

LABEL_9:
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_11;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) setupVideoRuleCollection:featureListStrings:]();
  }
  LOBYTE(v14) = 0;
  return v14;
}

@end