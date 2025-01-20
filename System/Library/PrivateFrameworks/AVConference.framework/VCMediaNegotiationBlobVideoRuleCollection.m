@interface VCMediaNegotiationBlobVideoRuleCollection
- (BOOL)hasFormatsExt1;
- (BOOL)hasPreferredFormat;
- (BOOL)hasPreferredFormatExt1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationAsString:(int)a3;
- (id)transportAsString:(int)a3;
- (int)StringAsOperation:(id)a3;
- (int)StringAsTransport:(id)a3;
- (int)operation;
- (int)transport;
- (unint64_t)hash;
- (unsigned)formats;
- (unsigned)formatsExt1;
- (unsigned)preferredFormat;
- (unsigned)preferredFormatExt1;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFormats:(unsigned int)a3;
- (void)setFormatsExt1:(unsigned int)a3;
- (void)setHasFormatsExt1:(BOOL)a3;
- (void)setHasPreferredFormat:(BOOL)a3;
- (void)setHasPreferredFormatExt1:(BOOL)a3;
- (void)setOperation:(int)a3;
- (void)setPreferredFormat:(unsigned int)a3;
- (void)setPreferredFormatExt1:(unsigned int)a3;
- (void)setTransport:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobVideoRuleCollection

- (id)transportAsString:(int)a3
{
  if (a3 == 1) {
    return @"NEGOTIATION_TRANSPORT_TYPE_WIFI";
  }
  if (a3 == 2) {
    return @"NEGOTIATION_TRANSPORT_TYPE_CELLULAR";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
}

- (int)StringAsTransport:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"NEGOTIATION_TRANSPORT_TYPE_WIFI"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"NEGOTIATION_TRANSPORT_TYPE_CELLULAR"]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (id)operationAsString:(int)a3
{
  if (a3 == 1) {
    return @"NEGOTIATION_OPERATION_TYPE_ENCODE";
  }
  if (a3 == 2) {
    return @"NEGOTIATION_OPERATION_TYPE_DECODE";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
}

- (int)StringAsOperation:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"NEGOTIATION_OPERATION_TYPE_ENCODE"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"NEGOTIATION_OPERATION_TYPE_DECODE"]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (void)setPreferredFormat:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_preferredFormat = a3;
}

- (void)setHasPreferredFormat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredFormat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFormatsExt1:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_formatsExt1 = a3;
}

- (void)setHasFormatsExt1:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFormatsExt1
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPreferredFormatExt1:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_preferredFormatExt1 = a3;
}

- (void)setHasPreferredFormatExt1:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreferredFormatExt1
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoRuleCollection;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobVideoRuleCollection description](&v3, sel_description), -[VCMediaNegotiationBlobVideoRuleCollection dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int transport = self->_transport;
  if (transport == 1)
  {
    v5 = @"NEGOTIATION_TRANSPORT_TYPE_WIFI";
  }
  else if (transport == 2)
  {
    v5 = @"NEGOTIATION_TRANSPORT_TYPE_CELLULAR";
  }
  else
  {
    v5 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_transport);
  }
  [v3 setObject:v5 forKey:@"transport"];
  int operation = self->_operation;
  if (operation == 1)
  {
    v7 = @"NEGOTIATION_OPERATION_TYPE_ENCODE";
  }
  else if (operation == 2)
  {
    v7 = @"NEGOTIATION_OPERATION_TYPE_DECODE";
  }
  else
  {
    v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_operation);
  }
  [v3 setObject:v7 forKey:@"operation"];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_formats), @"formats");
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_13;
    }
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_formatsExt1), @"formatsExt1");
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_preferredFormat), @"preferredFormat");
  char has = (char)self->_has;
  if (has) {
    goto LABEL_17;
  }
LABEL_13:
  if ((has & 4) != 0) {
LABEL_14:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_preferredFormatExt1), @"preferredFormatExt1");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoRuleCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 7) = self->_transport;
  *((_DWORD *)a3 + 4) = self->_operation;
  *((_DWORD *)a3 + 2) = self->_formats;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_preferredFormat;
    *((unsigned char *)a3 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 6) = self->_preferredFormatExt1;
      *((unsigned char *)a3 + 32) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_formatsExt1;
  *((unsigned char *)a3 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 7) = self->_transport;
  *((_DWORD *)result + 4) = self->_operation;
  *((_DWORD *)result + 2) = self->_formats;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_preferredFormat;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_formatsExt1;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 6) = self->_preferredFormatExt1;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_transport != *((_DWORD *)a3 + 7)
      || self->_operation != *((_DWORD *)a3 + 4)
      || self->_formats != *((_DWORD *)a3 + 2))
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_preferredFormat != *((_DWORD *)a3 + 5)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_formatsExt1 != *((_DWORD *)a3 + 3)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_preferredFormatExt1 != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v2 = 2654435761 * self->_preferredFormat;
  }
  else {
    uint64_t v2 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_formatsExt1;
  }
  else {
    uint64_t v3 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_preferredFormatExt1;
  }
  else {
    uint64_t v4 = 0;
  }
  return (2654435761 * self->_operation) ^ (2654435761 * self->_transport) ^ (2654435761 * self->_formats) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  self->_int transport = *((_DWORD *)a3 + 7);
  self->_int operation = *((_DWORD *)a3 + 4);
  self->_formats = *((_DWORD *)a3 + 2);
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_preferredFormat = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_preferredFormatExt1 = *((_DWORD *)a3 + 6);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_formatsExt1 = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 32) & 4) != 0) {
    goto LABEL_7;
  }
}

- (int)transport
{
  return self->_transport;
}

- (void)setTransport:(int)a3
{
  self->_int transport = a3;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_int operation = a3;
}

- (unsigned)formats
{
  return self->_formats;
}

- (void)setFormats:(unsigned int)a3
{
  self->_formats = a3;
}

- (unsigned)preferredFormat
{
  return self->_preferredFormat;
}

- (unsigned)formatsExt1
{
  return self->_formatsExt1;
}

- (unsigned)preferredFormatExt1
{
  return self->_preferredFormatExt1;
}

@end