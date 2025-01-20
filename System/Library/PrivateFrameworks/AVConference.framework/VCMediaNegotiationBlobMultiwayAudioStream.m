@interface VCMediaNegotiationBlobMultiwayAudioStream
- (BOOL)hasMaxMediaBitrate;
- (BOOL)hasMaxNetworkBitrate;
- (BOOL)hasMaxPacketsPerSecond;
- (BOOL)hasRepairedMaxNetworkBitrate;
- (BOOL)hasRepairedStreamID;
- (BOOL)hasSupportedPayloads;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCMediaNegotiationBlobMultiwayAudioStream)initWithStreamConfig:(id)a3;
- (float)maxPacketsPerSecond;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newMultiwayAudioStream;
- (unint64_t)hash;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedStreamID;
- (unsigned)ssrc;
- (unsigned)streamID;
- (unsigned)supportedPayloads;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3;
- (void)setHasMaxMediaBitrate:(BOOL)a3;
- (void)setHasMaxNetworkBitrate:(BOOL)a3;
- (void)setHasMaxPacketsPerSecond:(BOOL)a3;
- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3;
- (void)setHasRepairedStreamID:(BOOL)a3;
- (void)setHasSupportedPayloads:(BOOL)a3;
- (void)setMaxMediaBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxPacketsPerSecond:(float)a3;
- (void)setPayloadFlagsWithPayloads:(id)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedStreamID:(unsigned int)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setStreamID:(unsigned int)a3;
- (void)setSupportedPayloads:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobMultiwayAudioStream

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxNetworkBitrate = a3;
}

- (void)setHasMaxNetworkBitrate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxNetworkBitrate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSupportedPayloads:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_supportedPayloads = a3;
}

- (void)setHasSupportedPayloads:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportedPayloads
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxMediaBitrate = a3;
}

- (void)setHasMaxMediaBitrate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxMediaBitrate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMaxPacketsPerSecond:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxPacketsPerSecond = a3;
}

- (void)setHasMaxPacketsPerSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxPacketsPerSecond
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRepairedStreamID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_repairedStreamID = a3;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRepairedStreamID
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMultiwayAudioStream;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobMultiwayAudioStream description](&v3, sel_description), -[VCMediaNegotiationBlobMultiwayAudioStream dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ssrc), @"ssrc");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxNetworkBitrate), @"maxNetworkBitrate");
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedPayloads), @"supportedPayloads");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_streamID), @"streamID");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_qualityIndex), @"qualityIndex");
  char v6 = (char)self->_has;
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxMediaBitrate), @"maxMediaBitrate");
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedStreamID), @"repairedStreamID");
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&double v5 = self->_maxPacketsPerSecond;
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"maxPacketsPerSecond");
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v6 & 8) != 0) {
LABEL_9:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), @"repairedMaxNetworkBitrate");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMultiwayAudioStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_12:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((v5 & 8) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 8) = self->_ssrc;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_maxNetworkBitrate;
    *((unsigned char *)a3 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_supportedPayloads;
    *((unsigned char *)a3 + 44) |= 0x20u;
  }
  *((_DWORD *)a3 + 9) = self->_streamID;
  *((_DWORD *)a3 + 5) = self->_qualityIndex;
  char v4 = (char)self->_has;
  if (v4)
  {
    *((_DWORD *)a3 + 2) = self->_maxMediaBitrate;
    *((unsigned char *)a3 + 44) |= 1u;
    char v4 = (char)self->_has;
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = LODWORD(self->_maxPacketsPerSecond);
  *((unsigned char *)a3 + 44) |= 4u;
  char v4 = (char)self->_has;
  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 6) = self->_repairedMaxNetworkBitrate;
    *((unsigned char *)a3 + 44) |= 8u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 7) = self->_repairedStreamID;
  *((unsigned char *)a3 + 44) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 8) = self->_ssrc;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_maxNetworkBitrate;
    *((unsigned char *)result + 44) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)result + 10) = self->_supportedPayloads;
    *((unsigned char *)result + 44) |= 0x20u;
  }
  *((_DWORD *)result + 9) = self->_streamID;
  *((_DWORD *)result + 5) = self->_qualityIndex;
  char v6 = (char)self->_has;
  if (v6)
  {
    *((_DWORD *)result + 2) = self->_maxMediaBitrate;
    *((unsigned char *)result + 44) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 4) = LODWORD(self->_maxPacketsPerSecond);
  *((unsigned char *)result + 44) |= 4u;
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_repairedStreamID;
  *((unsigned char *)result + 44) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_repairedMaxNetworkBitrate;
  *((unsigned char *)result + 44) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_ssrc != *((_DWORD *)a3 + 8))
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 3)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x20) == 0 || self->_supportedPayloads != *((_DWORD *)a3 + 10)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x20) != 0)
    {
      goto LABEL_34;
    }
    if (self->_streamID != *((_DWORD *)a3 + 9) || self->_qualityIndex != *((_DWORD *)a3 + 5)) {
      goto LABEL_34;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_maxMediaBitrate != *((_DWORD *)a3 + 2)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_34;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_maxPacketsPerSecond != *((float *)a3 + 4)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_34;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_repairedStreamID != *((_DWORD *)a3 + 7)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 6)) {
        goto LABEL_34;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_maxNetworkBitrate;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v5 = 2654435761 * self->_supportedPayloads;
  }
  else {
    uint64_t v5 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_maxMediaBitrate;
  }
  else {
    uint64_t v6 = 0;
  }
  unsigned int ssrc = self->_ssrc;
  unsigned int streamID = self->_streamID;
  unsigned int qualityIndex = self->_qualityIndex;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    float maxPacketsPerSecond = self->_maxPacketsPerSecond;
    float v12 = -maxPacketsPerSecond;
    if (maxPacketsPerSecond >= 0.0) {
      float v12 = self->_maxPacketsPerSecond;
    }
    float v13 = floorf(v12 + 0.5);
    float v14 = (float)(v12 - v13) * 1.8447e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_repairedStreamID;
    if ((has & 8) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v16 = 0;
    return v4 ^ v5 ^ (2654435761 * ssrc) ^ (2654435761 * streamID) ^ (2654435761 * qualityIndex) ^ v6 ^ v10 ^ v15 ^ v16;
  }
  uint64_t v15 = 0;
  if ((has & 8) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v16 = 2654435761 * self->_repairedMaxNetworkBitrate;
  return v4 ^ v5 ^ (2654435761 * ssrc) ^ (2654435761 * streamID) ^ (2654435761 * qualityIndex) ^ v6 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int ssrc = *((_DWORD *)a3 + 8);
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 2) != 0)
  {
    self->_maxNetworkBitrate = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 44);
  }
  if ((v3 & 0x20) != 0)
  {
    self->_supportedPayloads = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  self->_unsigned int streamID = *((_DWORD *)a3 + 9);
  self->_unsigned int qualityIndex = *((_DWORD *)a3 + 5);
  char v4 = *((unsigned char *)a3 + 44);
  if (v4)
  {
    self->_maxMediaBitrate = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_float maxPacketsPerSecond = *((float *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v4 = *((unsigned char *)a3 + 44);
  if ((v4 & 0x10) == 0)
  {
LABEL_8:
    if ((v4 & 8) == 0) {
      return;
    }
LABEL_13:
    self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_12:
  self->_repairedStreamID = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 44) & 8) != 0) {
    goto LABEL_13;
  }
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_unsigned int ssrc = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)supportedPayloads
{
  return self->_supportedPayloads;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned int)a3
{
  self->_unsigned int streamID = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_unsigned int qualityIndex = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (float)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (VCMediaNegotiationBlobMultiwayAudioStream)initWithStreamConfig:(id)a3
{
  if ([a3 isSubstream])
  {

    return 0;
  }
  else
  {
    uint64_t v5 = [(VCMediaNegotiationBlobMultiwayAudioStream *)self init];
    if (v5)
    {
      v5->_unsigned int ssrc = [a3 ssrc];
      v5->_maxNetworkBitrate = [a3 maxNetworkBitrate];
      *(unsigned char *)&v5->_has |= 2u;
      v5->_maxMediaBitrate = [a3 maxMediaBitrate];
      *(unsigned char *)&v5->_has |= 1u;
      v5->_float maxPacketsPerSecond = (float)[a3 maxPacketsPerSecond];
      *(unsigned char *)&v5->_has |= 4u;
      v5->_unsigned int streamID = [a3 streamID];
      v5->_unsigned int qualityIndex = [a3 qualityIndex];
      if ([a3 hasRepairedStreamID]) {
        char v6 = 16;
      }
      else {
        char v6 = 0;
      }
      *(unsigned char *)&v5->_char has = *(unsigned char *)&v5->_has & 0xEF | v6;
      v5->_repairedStreamID = [a3 repairedStreamID];
      v5->_repairedMaxNetworkBitrate = [a3 repairedMaxNetworkBitrate];
      *(unsigned char *)&v5->_char has = (*(unsigned char *)&v5->_has >> 1) & 8 | *(unsigned char *)&v5->_has & 0xF7;
      -[VCMediaNegotiationBlobMultiwayAudioStream setPayloadFlagsWithPayloads:](v5, "setPayloadFlagsWithPayloads:", [a3 supportedAudioPayloads]);
    }
  }
  return v5;
}

- (void)setPayloadFlagsWithPayloads:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_has |= 0x20u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        int v9 = +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:](VCMediaNegotiationBlobAudioSettings, "negotiationPayloadFromPayload:", [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntValue]);
        if (v9 != -1) {
          self->_supportedPayloads |= v9;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (id)newMultiwayAudioStream
{
  char v3 = objc_alloc_init(VCMediaNegotiatorMultiwayAudioStream);
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setStreamID:LOWORD(self->_streamID)];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setSsrc:self->_ssrc];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxMediaBitrate:self->_maxMediaBitrate];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxNetworkBitrate:self->_maxNetworkBitrate];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxPacketsPerSecond:self->_maxPacketsPerSecond];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setQualityIndex:self->_qualityIndex];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setHasRepairedStreamID:1];
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setRepairedStreamID:LOWORD(self->_repairedStreamID)];
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setRepairedMaxNetworkBitrate:self->_repairedMaxNetworkBitrate];
  }
  unsigned int supportedPayloads = self->_supportedPayloads;
  if (supportedPayloads)
  {
    uint64_t v5 = 1;
    do
    {
      if ((v5 & supportedPayloads) != 0)
      {
        supportedPayloads &= ~v5;
        [(VCMediaNegotiatorMultiwayAudioStream *)v3 addPayload:+[VCMediaNegotiationBlobAudioSettings payloadFromNegotiationPayload:v5]];
      }
      uint64_t v5 = (2 * v5);
    }
    while (supportedPayloads);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Multiway Audio Stream Settings: SSRC=%x maxNetworkBitrate=%d maxMediaBitrate=%d maxPacketsPerSecond=%f supportedPayloads=0x%08x streamID=%d qualityIndex=%d hasRepaired:%u repairedMaxNetworkBitrate=%d repairedStreamID=%d", self->_ssrc, self->_maxNetworkBitrate, self->_maxMediaBitrate, self->_maxPacketsPerSecond, self->_supportedPayloads, self->_streamID, self->_qualityIndex, -[VCMediaNegotiationBlobMultiwayAudioStream hasRepairedStreamID](self, "hasRepairedStreamID"), self->_repairedMaxNetworkBitrate, self->_repairedStreamID);
  char v5 = [v4 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v6, v7, v8, v9, v10, v11, v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[VCMediaNegotiationBlobMultiwayAudioStream(MultiwayAudioStream) printWithLogFile:]";
      __int16 v18 = 1024;
      int v19 = 1313;
      __int16 v20 = 2080;
      uint64_t v21 = [v4 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s\n", buf, 0x26u);
    }
  }
}

@end