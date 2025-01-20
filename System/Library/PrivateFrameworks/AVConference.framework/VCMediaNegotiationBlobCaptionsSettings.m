@interface VCMediaNegotiationBlobCaptionsSettings
- (BOOL)canDisplayCaptions;
- (BOOL)hasCanDisplayCaptions;
- (BOOL)hasSenderLanguages;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)senderLanguages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanDisplayCaptions:(BOOL)a3;
- (void)setHasCanDisplayCaptions:(BOOL)a3;
- (void)setHasSenderLanguages:(BOOL)a3;
- (void)setSenderLanguages:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobCaptionsSettings

- (void)setCanDisplayCaptions:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_canDisplayCaptions = a3;
}

- (void)setHasCanDisplayCaptions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCanDisplayCaptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSenderLanguages:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_senderLanguages = a3;
}

- (void)setHasSenderLanguages:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSenderLanguages
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobCaptionsSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobCaptionsSettings description](&v3, sel_description), -[VCMediaNegotiationBlobCaptionsSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_canDisplayCaptions), @"canDisplayCaptions");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_senderLanguages), @"senderLanguages");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobCaptionsSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 2) = self->_senderLanguages;
    *((unsigned char *)a3 + 16) |= 1u;
    return;
  }
  *((unsigned char *)a3 + 12) = self->_canDisplayCaptions;
  *((unsigned char *)a3 + 16) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_canDisplayCaptions;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_senderLanguages;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if ((*((unsigned char *)a3 + 16) & 2) == 0) {
    goto LABEL_14;
  }
  if (self->_canDisplayCaptions)
  {
    if (!*((unsigned char *)a3 + 12)) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (*((unsigned char *)a3 + 12))
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_10:
  LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_senderLanguages != *((_DWORD *)a3 + 2)) {
      goto LABEL_14;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_canDisplayCaptions;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_senderLanguages;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 16) & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 1) == 0) {
      return;
    }
LABEL_5:
    self->_senderLanguages = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
  self->_canDisplayCaptions = *((unsigned char *)a3 + 12);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 16)) {
    goto LABEL_5;
  }
}

- (BOOL)canDisplayCaptions
{
  return self->_canDisplayCaptions;
}

- (unsigned)senderLanguages
{
  return self->_senderLanguages;
}

@end