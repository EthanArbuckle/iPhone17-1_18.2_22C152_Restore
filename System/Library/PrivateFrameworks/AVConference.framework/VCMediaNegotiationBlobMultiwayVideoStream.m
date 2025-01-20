@interface VCMediaNegotiationBlobMultiwayVideoStream
+ (BOOL)convertVideoFormat:(int)a3 width:(int *)a4 height:(int *)a5;
+ (int)payloadForVideoPayload:(int)a3;
+ (int)videoFormatForWidth:(int)a3 height:(int)a4;
+ (int)videoPayloadForPayload:(int)a3;
- (BOOL)hasMaxMediaBitrate;
- (BOOL)hasMaxNetworkBitrate;
- (BOOL)hasMaxPacketsPerSecond;
- (BOOL)hasMetadata;
- (BOOL)hasRepairedMaxNetworkBitrate;
- (BOOL)hasRepairedStreamID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubStream;
- (BOOL)readFrom:(id)a3;
- (VCMediaNegotiationBlobMultiwayVideoStream)initWithStreamConfig:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newMultiwayVideoStream;
- (unint64_t)hash;
- (unsigned)frameRate;
- (unsigned)keyFrameInterval;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)maxPacketsPerSecond;
- (unsigned)metadata;
- (unsigned)payload;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedStreamID;
- (unsigned)ssrc;
- (unsigned)streamID;
- (unsigned)supportedVideoFormats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3;
- (void)setFrameRate:(unsigned int)a3;
- (void)setHasMaxMediaBitrate:(BOOL)a3;
- (void)setHasMaxNetworkBitrate:(BOOL)a3;
- (void)setHasMaxPacketsPerSecond:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3;
- (void)setHasRepairedStreamID:(BOOL)a3;
- (void)setKeyFrameInterval:(unsigned int)a3;
- (void)setMaxMediaBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxPacketsPerSecond:(unsigned int)a3;
- (void)setMetadata:(unsigned int)a3;
- (void)setPayload:(unsigned int)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedStreamID:(unsigned int)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setStreamID:(unsigned int)a3;
- (void)setSupportedVideoFormats:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobMultiwayVideoStream

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

- (void)setMetadata:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_metadata = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetadata
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (void)setMaxPacketsPerSecond:(unsigned int)a3
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
  *(unsigned char *)&self->_has |= 0x20u;
  self->_repairedStreamID = a3;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRepairedStreamID
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMultiwayVideoStream;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobMultiwayVideoStream description](&v3, sel_description), -[VCMediaNegotiationBlobMultiwayVideoStream dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ssrc), @"ssrc");
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxNetworkBitrate), @"maxNetworkBitrate");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payload), @"payload");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_streamID), @"streamID");
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_metadata), @"metadata");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_qualityIndex), @"qualityIndex");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedVideoFormats), @"supportedVideoFormats");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_frameRate), @"frameRate");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_keyFrameInterval), @"keyFrameInterval");
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxMediaBitrate), @"maxMediaBitrate");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedStreamID), @"repairedStreamID");
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxPacketsPerSecond), @"maxPacketsPerSecond");
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 0x10) != 0) {
LABEL_9:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), @"repairedMaxNetworkBitrate");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMultiwayVideoStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
LABEL_12:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 12) = self->_ssrc;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_maxNetworkBitrate;
    *((unsigned char *)a3 + 60) |= 2u;
  }
  *((_DWORD *)a3 + 8) = self->_payload;
  *((_DWORD *)a3 + 13) = self->_streamID;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_metadata;
    *((unsigned char *)a3 + 60) |= 8u;
  }
  *((_DWORD *)a3 + 9) = self->_qualityIndex;
  *((_DWORD *)a3 + 14) = self->_supportedVideoFormats;
  *((_DWORD *)a3 + 2) = self->_frameRate;
  *((_DWORD *)a3 + 3) = self->_keyFrameInterval;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 4) = self->_maxMediaBitrate;
    *((unsigned char *)a3 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 6) = self->_maxPacketsPerSecond;
  *((unsigned char *)a3 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_repairedMaxNetworkBitrate;
    *((unsigned char *)a3 + 60) |= 0x10u;
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 11) = self->_repairedStreamID;
  *((unsigned char *)a3 + 60) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 12) = self->_ssrc;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_maxNetworkBitrate;
    *((unsigned char *)result + 60) |= 2u;
  }
  *((_DWORD *)result + 8) = self->_payload;
  *((_DWORD *)result + 13) = self->_streamID;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)result + 7) = self->_metadata;
    *((unsigned char *)result + 60) |= 8u;
  }
  *((_DWORD *)result + 9) = self->_qualityIndex;
  *((_DWORD *)result + 14) = self->_supportedVideoFormats;
  *((_DWORD *)result + 2) = self->_frameRate;
  *((_DWORD *)result + 3) = self->_keyFrameInterval;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 4) = self->_maxMediaBitrate;
    *((unsigned char *)result + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 6) = self->_maxPacketsPerSecond;
  *((unsigned char *)result + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)result + 11) = self->_repairedStreamID;
  *((unsigned char *)result + 60) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 10) = self->_repairedMaxNetworkBitrate;
  *((unsigned char *)result + 60) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_ssrc != *((_DWORD *)a3 + 12))
    {
LABEL_38:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 2) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 5)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 2) != 0)
    {
      goto LABEL_38;
    }
    if (self->_payload != *((_DWORD *)a3 + 8) || self->_streamID != *((_DWORD *)a3 + 13)) {
      goto LABEL_38;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 8) == 0 || self->_metadata != *((_DWORD *)a3 + 7)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 8) != 0)
    {
      goto LABEL_38;
    }
    if (self->_qualityIndex != *((_DWORD *)a3 + 9)
      || self->_supportedVideoFormats != *((_DWORD *)a3 + 14)
      || self->_frameRate != *((_DWORD *)a3 + 2)
      || self->_keyFrameInterval != *((_DWORD *)a3 + 3))
    {
      goto LABEL_38;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 60) & 1) == 0 || self->_maxMediaBitrate != *((_DWORD *)a3 + 4)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)a3 + 60))
    {
      goto LABEL_38;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 4) == 0 || self->_maxPacketsPerSecond != *((_DWORD *)a3 + 6)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 4) != 0)
    {
      goto LABEL_38;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x20) == 0 || self->_repairedStreamID != *((_DWORD *)a3 + 11)) {
        goto LABEL_38;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 0x20) != 0)
    {
      goto LABEL_38;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 60) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x10) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 10)) {
        goto LABEL_38;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_maxNetworkBitrate;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_metadata;
      goto LABEL_6;
    }
  }
  uint64_t v3 = 0;
LABEL_6:
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_maxMediaBitrate;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_maxPacketsPerSecond;
  }
  else {
    uint64_t v5 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v6 = 2654435761 * self->_repairedStreamID;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v7 = 0;
    return v2 ^ (2654435761 * self->_ssrc) ^ (2654435761 * self->_payload) ^ (2654435761 * self->_streamID) ^ v3 ^ (2654435761 * self->_qualityIndex) ^ (2654435761 * self->_supportedVideoFormats) ^ (2654435761 * self->_frameRate) ^ (2654435761 * self->_keyFrameInterval) ^ v4 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v7 = 2654435761 * self->_repairedMaxNetworkBitrate;
  return v2 ^ (2654435761 * self->_ssrc) ^ (2654435761 * self->_payload) ^ (2654435761 * self->_streamID) ^ v3 ^ (2654435761 * self->_qualityIndex) ^ (2654435761 * self->_supportedVideoFormats) ^ (2654435761 * self->_frameRate) ^ (2654435761 * self->_keyFrameInterval) ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  self->_ssrc = *((_DWORD *)a3 + 12);
  if ((*((unsigned char *)a3 + 60) & 2) != 0)
  {
    self->_maxNetworkBitrate = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  self->_payload = *((_DWORD *)a3 + 8);
  self->_streamID = *((_DWORD *)a3 + 13);
  if ((*((unsigned char *)a3 + 60) & 8) != 0)
  {
    self->_metadata = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
  self->_qualityIndex = *((_DWORD *)a3 + 9);
  self->_supportedVideoFormats = *((_DWORD *)a3 + 14);
  self->_frameRate = *((_DWORD *)a3 + 2);
  self->_keyFrameInterval = *((_DWORD *)a3 + 3);
  char v3 = *((unsigned char *)a3 + 60);
  if (v3)
  {
    self->_maxMediaBitrate = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 60);
    if ((v3 & 4) == 0)
    {
LABEL_7:
      if ((v3 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_maxPacketsPerSecond = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_13:
    self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_12:
  self->_repairedStreamID = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 60) & 0x10) != 0) {
    goto LABEL_13;
  }
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)payload
{
  return self->_payload;
}

- (void)setPayload:(unsigned int)a3
{
  self->_payload = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned int)a3
{
  self->_streamID = a3;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)supportedVideoFormats
{
  return self->_supportedVideoFormats;
}

- (void)setSupportedVideoFormats:(unsigned int)a3
{
  self->_supportedVideoFormats = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (unsigned)maxPacketsPerSecond
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

- (VCMediaNegotiationBlobMultiwayVideoStream)initWithStreamConfig:(id)a3
{
  uint64_t v4 = [(VCMediaNegotiationBlobMultiwayVideoStream *)self init];
  if (v4)
  {
    v4->_ssrc = [a3 ssrc];
    v4->_maxNetworkBitrate = [a3 maxNetworkBitrate];
    *(unsigned char *)&v4->_char has = *(unsigned char *)&v4->_has & 0xF8 | 2;
    if ([a3 isSubstream]) {
      v4->_metadata |= 1u;
    }
    *(unsigned char *)&v4->_has |= 8u;
    v4->_streamID = [a3 streamID];
    v4->_qualityIndex = [a3 qualityIndex];
    [a3 size];
    uint64_t v6 = (int)v5;
    [a3 size];
    v4->_supportedVideoFormats = +[VCMediaNegotiationBlobMultiwayVideoStream videoFormatForWidth:v6 height:(int)v7];
    v4->_frameRate = [a3 frameRate];
    v4->_keyFrameInterval = [a3 keyFrameInterval];
    if ([a3 hasRepairedStreamID]) {
      char v8 = 32;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&v4->_char has = *(unsigned char *)&v4->_has & 0xDF | v8;
    v4->_repairedStreamID = [a3 repairedStreamID];
    v4->_repairedMaxNetworkBitrate = [a3 repairedMaxNetworkBitrate];
    *(unsigned char *)&v4->_char has = (*(unsigned char *)&v4->_has >> 1) & 0x10 | *(unsigned char *)&v4->_has & 0xEF;
    v4->_payload = +[VCMediaNegotiationBlobMultiwayVideoStream videoPayloadForPayload:](VCMediaNegotiationBlobMultiwayVideoStream, "videoPayloadForPayload:", [a3 payload]);
  }
  return v4;
}

- (id)newMultiwayVideoStream
{
  char v3 = objc_alloc_init(VCMediaNegotiatorMultiwayVideoStream);
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setSsrc:self->_ssrc];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxMediaBitrate:self->_maxMediaBitrate];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxNetworkBitrate:self->_maxNetworkBitrate];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setMaxPacketsPerSecond:self->_maxPacketsPerSecond];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setIsSubstream:self->_metadata & 1];
  }
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setStreamID:LOWORD(self->_streamID)];
  [(VCMediaNegotiatorMultiwayMediaStream *)v3 setQualityIndex:self->_qualityIndex];
  unsigned int supportedVideoFormats = self->_supportedVideoFormats;
  if (supportedVideoFormats)
  {
    int v5 = 1;
    do
    {
      int v6 = v5;
      v5 *= 2;
    }
    while ((supportedVideoFormats & v6) == 0);
    +[VCMediaNegotiationBlobMultiwayVideoStream convertVideoFormat:width:height:](VCMediaNegotiationBlobMultiwayVideoStream, "convertVideoFormat:width:height:");
    -[VCMediaNegotiatorMultiwayVideoStream setSize:](v3, "setSize:", (double)-1431655766, (double)-1431655766);
  }
  [(VCMediaNegotiatorMultiwayVideoStream *)v3 setPayload:+[VCMediaNegotiationBlobMultiwayVideoStream payloadForVideoPayload:self->_payload]];
  [(VCMediaNegotiatorMultiwayVideoStream *)v3 setFrameRate:self->_frameRate];
  [(VCMediaNegotiatorMultiwayVideoStream *)v3 setKeyFrameInterval:self->_keyFrameInterval];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setHasRepairedStreamID:1];
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setRepairedStreamID:LOWORD(self->_repairedStreamID)];
    [(VCMediaNegotiatorMultiwayMediaStream *)v3 setRepairedMaxNetworkBitrate:self->_repairedMaxNetworkBitrate];
  }
  return v3;
}

- (BOOL)isSubStream
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_metadata & 1;
  }
  else {
    return 0;
  }
}

- (void)printWithLogFile:(void *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v3 = objc_msgSend(NSString, "stringWithFormat:", @"Multiway Video Stream Settings: SSRC=%x maxNetworkBitrate=%d maxMediaBitrate=%d maxPacketsPerSecond=%d payload=%d streamID=%d qualityIndex=%d supportedvideoFormats=%d frameRate=%d keyFrameInterval=%u metadata=%u hasRepaired:%u repairedMaxNetworkBitrate=%d repairedStreamID=%d", self->_ssrc, self->_maxNetworkBitrate, self->_maxMediaBitrate, self->_maxPacketsPerSecond, self->_payload, self->_streamID, self->_qualityIndex, self->_supportedVideoFormats, self->_frameRate, self->_keyFrameInterval, self->_metadata, -[VCMediaNegotiationBlobMultiwayVideoStream hasRepairedStreamID](self, "hasRepairedStreamID"), self->_repairedMaxNetworkBitrate, self->_repairedStreamID);
  char v4 = [v3 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v5, v6, v7, v8, v9, v10, v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[VCMediaNegotiationBlobMultiwayVideoStream(MultiwayVideoStream) printWithLogFile:]";
      __int16 v18 = 1024;
      int v19 = 1399;
      __int16 v20 = 2080;
      uint64_t v21 = [v3 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s\n", buf, 0x26u);
    }
  }
}

+ (int)videoFormatForWidth:(int)a3 height:(int)a4
{
  if (a3 == 192 && a4 == 112) {
    return 256;
  }
  if (a3 == 320 && a4 == 176) {
    return 1;
  }
  if (a3 == 320 && a4 == 240) {
    return 2;
  }
  if (a3 == 480 && a4 == 272) {
    return 4;
  }
  if (a3 == 480 && a4 == 368) {
    return 8;
  }
  if (a3 == 640 && a4 == 368) {
    return 16;
  }
  if (a3 == 640 && a4 == 480) {
    return 32;
  }
  if (a3 == 1024 && a4 == 768) {
    return 64;
  }
  if (a3 == 1280 && a4 == 720) {
    return 128;
  }
  if (a3 == 192 && a4 == 192) {
    return 512;
  }
  if (a3 == 240 && a4 == 240) {
    return 1024;
  }
  if (a3 == 320 && a4 == 320) {
    return 2048;
  }
  if (a3 == 480 && a4 == 480) {
    return 4096;
  }
  if (a3 == 640 && a4 == 640) {
    return 0x2000;
  }
  if (a4 == 720 && a3 == 720) {
    return 0x8000;
  }
  else {
    return 0;
  }
}

+ (BOOL)convertVideoFormat:(int)a3 width:(int *)a4 height:(int *)a5
{
  BOOL result = 0;
  if (a3 > 255)
  {
    if (a3 <= 2047)
    {
      switch(a3)
      {
        case 256:
          int v6 = 112;
          int v7 = 192;
          break;
        case 512:
          int v7 = 192;
          int v6 = 192;
          break;
        case 1024:
          int v7 = 240;
          int v6 = 240;
          break;
        default:
          return result;
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000)
      {
        int v7 = 640;
        int v6 = 640;
      }
      else
      {
        if (a3 != 0x8000) {
          return result;
        }
        int v7 = 720;
        int v6 = 720;
      }
    }
    else if (a3 == 2048)
    {
      int v7 = 320;
      int v6 = 320;
    }
    else
    {
      if (a3 != 4096) {
        return result;
      }
      int v7 = 480;
      int v6 = 480;
    }
  }
  else
  {
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 1:
          int v6 = 176;
          goto LABEL_25;
        case 2:
          int v6 = 240;
LABEL_25:
          int v7 = 320;
          goto LABEL_36;
        case 4:
          int v6 = 272;
          goto LABEL_28;
        case 8:
          int v6 = 368;
LABEL_28:
          int v7 = 480;
          goto LABEL_36;
        default:
          return result;
      }
    }
    if (a3 > 63)
    {
      if (a3 == 64)
      {
        int v6 = 768;
        int v7 = 1024;
      }
      else
      {
        if (a3 != 128) {
          return result;
        }
        int v6 = 720;
        int v7 = 1280;
      }
    }
    else
    {
      if (a3 == 16)
      {
        int v6 = 368;
      }
      else
      {
        if (a3 != 32) {
          return result;
        }
        int v6 = 480;
      }
      int v7 = 640;
    }
  }
LABEL_36:
  *a4 = v7;
  *a5 = v6;
  return 1;
}

+ (int)videoPayloadForPayload:(int)a3
{
  if (a3 == 123) {
    int v3 = 1;
  }
  else {
    int v3 = -1;
  }
  if (a3 == 100) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (int)payloadForVideoPayload:(int)a3
{
  if (a3 == 1) {
    int v3 = 123;
  }
  else {
    int v3 = 128;
  }
  if (a3 == 2) {
    return 100;
  }
  else {
    return v3;
  }
}

@end