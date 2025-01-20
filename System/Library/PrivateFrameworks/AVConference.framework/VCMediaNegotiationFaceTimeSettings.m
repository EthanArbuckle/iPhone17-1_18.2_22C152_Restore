@interface VCMediaNegotiationFaceTimeSettings
- (BOOL)SIPDisabled;
- (BOOL)hasCapabilities;
- (BOOL)hasLinkProbingCapabilityVersion;
- (BOOL)hasMediaControlInfoSubVersion;
- (BOOL)hasOneToOneModeSupported;
- (BOOL)hasSwitches;
- (BOOL)isEqual:(id)a3;
- (BOOL)oneToOneModeSupported;
- (BOOL)readFrom:(id)a3;
- (BOOL)secureMessagingRequired;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)capabilities;
- (unsigned)linkProbingCapabilityVersion;
- (unsigned)mediaControlInfoFECFeedbackVersion;
- (unsigned)mediaControlInfoSubVersion;
- (unsigned)switches;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapabilities:(unsigned int)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasLinkProbingCapabilityVersion:(BOOL)a3;
- (void)setHasMediaControlInfoSubVersion:(BOOL)a3;
- (void)setHasOneToOneModeSupported:(BOOL)a3;
- (void)setHasSwitches:(BOOL)a3;
- (void)setLinkProbingCapabilityVersion:(unsigned int)a3;
- (void)setMediaControlInfoSubVersion:(unsigned int)a3;
- (void)setOneToOneModeSupported:(BOOL)a3;
- (void)setSwitches:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationFaceTimeSettings

- (BOOL)SIPDisabled
{
  BOOL v3 = [(VCMediaNegotiationFaceTimeSettings *)self hasCapabilities];
  if (v3) {
    return (LOBYTE(self->_capabilities) >> 1) & 1;
  }
  return v3;
}

- (BOOL)secureMessagingRequired
{
  BOOL v3 = [(VCMediaNegotiationFaceTimeSettings *)self hasCapabilities];
  if (v3) {
    LOBYTE(v3) = self->_capabilities & 1;
  }
  return v3;
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  if ([(VCMediaNegotiationFaceTimeSettings *)self hasMediaControlInfoSubVersion]) {
    return self->_mediaControlInfoSubVersion;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unsigned)capabilities
{
  if (*(unsigned char *)&self->_has) {
    return self->_capabilities;
  }
  else {
    return 0;
  }
}

- (void)setCapabilities:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSwitches:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_switches = a3;
}

- (void)setHasSwitches:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSwitches
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOneToOneModeSupported:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_oneToOneModeSupported = a3;
}

- (void)setHasOneToOneModeSupported:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOneToOneModeSupported
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (unsigned)mediaControlInfoSubVersion
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_mediaControlInfoSubVersion;
  }
  else {
    return 0;
  }
}

- (void)setMediaControlInfoSubVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mediaControlInfoSubVersion = a3;
}

- (void)setHasMediaControlInfoSubVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMediaControlInfoSubVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLinkProbingCapabilityVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_linkProbingCapabilityVersion = a3;
}

- (void)setHasLinkProbingCapabilityVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkProbingCapabilityVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationFaceTimeSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationFaceTimeSettings description](&v3, sel_description), -[VCMediaNegotiationFaceTimeSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_capabilities), @"capabilities");
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_switches), @"switches");
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_mediaControlInfoSubVersion), @"mediaControlInfoSubVersion");
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_oneToOneModeSupported), @"oneToOneModeSupported");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_linkProbingCapabilityVersion), @"linkProbingCapabilityVersion");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationFaceTimeSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_capabilities;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_switches;
  *((unsigned char *)a3 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((unsigned char *)a3 + 24) = self->_oneToOneModeSupported;
  *((unsigned char *)a3 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 3) = self->_linkProbingCapabilityVersion;
    *((unsigned char *)a3 + 28) |= 2u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_mediaControlInfoSubVersion;
  *((unsigned char *)a3 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_capabilities;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_switches;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 24) = self->_oneToOneModeSupported;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_mediaControlInfoSubVersion;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 3) = self->_linkProbingCapabilityVersion;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_capabilities != *((_DWORD *)a3 + 2)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)a3 + 28))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_switches != *((_DWORD *)a3 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 28) & 0x10) != 0) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  if ((*((unsigned char *)a3 + 28) & 0x10) == 0) {
    goto LABEL_29;
  }
  if (self->_oneToOneModeSupported)
  {
    if (!*((unsigned char *)a3 + 24)) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  if (*((unsigned char *)a3 + 24))
  {
LABEL_29:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_20:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_mediaControlInfoSubVersion != *((_DWORD *)a3 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) != 0)
  {
    goto LABEL_29;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_linkProbingCapabilityVersion != *((_DWORD *)a3 + 3)) {
      goto LABEL_29;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_capabilities;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_switches;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_oneToOneModeSupported;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_mediaControlInfoSubVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_linkProbingCapabilityVersion;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_capabilities = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_switches = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_oneToOneModeSupported = *((unsigned char *)a3 + 24);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_linkProbingCapabilityVersion = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_mediaControlInfoSubVersion = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 28) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unsigned)switches
{
  return self->_switches;
}

- (BOOL)oneToOneModeSupported
{
  return self->_oneToOneModeSupported;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

@end