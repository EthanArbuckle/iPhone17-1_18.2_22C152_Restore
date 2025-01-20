@interface HMAccessoryDiagnosticInfoProtoCloudInfo
- (BOOL)firstCloudImportComplete;
- (BOOL)hasCloudState;
- (BOOL)hasFirstCloudImportComplete;
- (BOOL)hasOctagonState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)cloudStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)octagonStateAsString:(int)a3;
- (int)StringAsCloudState:(id)a3;
- (int)StringAsOctagonState:(id)a3;
- (int)cloudState;
- (int)octagonState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudState:(int)a3;
- (void)setFirstCloudImportComplete:(BOOL)a3;
- (void)setHasCloudState:(BOOL)a3;
- (void)setHasFirstCloudImportComplete:(BOOL)a3;
- (void)setHasOctagonState:(BOOL)a3;
- (void)setOctagonState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoCloudInfo

- (BOOL)firstCloudImportComplete
{
  return self->_firstCloudImportComplete;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_cloudState = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_octagonState = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_4:
    self->_firstCloudImportComplete = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_cloudState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_octagonState;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_firstCloudImportComplete;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_cloudState != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_octagonState != *((_DWORD *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0)
    {
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (self->_firstCloudImportComplete)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_cloudState;
    *((unsigned char *)result + 20) |= 1u;
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
  *((_DWORD *)result + 3) = self->_octagonState;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 16) = self->_firstCloudImportComplete;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_cloudState;
    *((unsigned char *)v4 + 20) |= 1u;
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
  v4[3] = self->_octagonState;
  *((unsigned char *)v4 + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 16) = self->_firstCloudImportComplete;
    *((unsigned char *)v4 + 20) |= 4u;
  }
LABEL_5:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
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
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    int cloudState = self->_cloudState;
    if (cloudState)
    {
      if (cloudState == 1)
      {
        v8 = @"Good";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cloudState);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = @"Unknown";
    }
    [v3 setObject:v8 forKey:@"cloudState"];

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
  int octagonState = self->_octagonState;
  if (octagonState)
  {
    if (octagonState == 1)
    {
      v10 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_octagonState);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = @"Unknown";
  }
  [v3 setObject:v10 forKey:@"octagonState"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  BOOL v5 = [NSNumber numberWithBool:self->_firstCloudImportComplete];
  [v3 setObject:v5 forKey:@"firstCloudImportComplete"];

LABEL_5:

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoCloudInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoCloudInfo *)&v8 description];
  BOOL v5 = [(HMAccessoryDiagnosticInfoProtoCloudInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFirstCloudImportComplete
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFirstCloudImportComplete:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFirstCloudImportComplete:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_firstCloudImportComplete = a3;
}

- (int)StringAsOctagonState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)octagonStateAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasOctagonState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOctagonState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setOctagonState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int octagonState = a3;
}

- (int)octagonState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_octagonState;
  }
  else {
    return 0;
  }
}

- (int)StringAsCloudState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)cloudStateAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasCloudState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCloudState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCloudState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int cloudState = a3;
}

- (int)cloudState
{
  if (*(unsigned char *)&self->_has) {
    return self->_cloudState;
  }
  else {
    return 0;
  }
}

@end