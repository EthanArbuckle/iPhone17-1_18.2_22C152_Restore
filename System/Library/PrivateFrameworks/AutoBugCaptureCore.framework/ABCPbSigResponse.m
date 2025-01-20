@interface ABCPbSigResponse
- (BOOL)decision;
- (BOOL)hasCaseCount;
- (BOOL)hasCaseCountTarget;
- (BOOL)hasCaseIdentifier;
- (BOOL)hasCaseStatus;
- (BOOL)hasDecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)caseIdentifier;
- (NSString)caseStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)caseCount;
- (unsigned)caseCountTarget;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaseCount:(unsigned int)a3;
- (void)setCaseCountTarget:(unsigned int)a3;
- (void)setCaseIdentifier:(id)a3;
- (void)setCaseStatus:(id)a3;
- (void)setDecision:(BOOL)a3;
- (void)setHasCaseCount:(BOOL)a3;
- (void)setHasCaseCountTarget:(BOOL)a3;
- (void)setHasDecision:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigResponse

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (void)setCaseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_caseCount = a3;
}

- (void)setHasCaseCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaseCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCaseCountTarget:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_caseCountTarget = a3;
}

- (void)setHasCaseCountTarget:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaseCountTarget
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCaseStatus
{
  return self->_caseStatus != 0;
}

- (void)setDecision:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_decision = a3;
}

- (void)setHasDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDecision
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigResponse;
  v4 = [(ABCPbSigResponse *)&v8 description];
  v5 = [(ABCPbSigResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier) {
    [v3 setObject:caseIdentifier forKey:@"case_identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_caseCount];
    [v4 setObject:v7 forKey:@"case_count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_caseCountTarget];
    [v4 setObject:v8 forKey:@"case_count_target"];
  }
  caseStatus = self->_caseStatus;
  if (caseStatus) {
    [v4 setObject:caseStatus forKey:@"case_status"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_decision];
    [v4 setObject:v10 forKey:@"decision"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_caseIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_caseStatus)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_caseIdentifier)
  {
    objc_msgSend(v4, "setCaseIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_caseCount;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_caseCountTarget;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_caseStatus)
  {
    objc_msgSend(v6, "setCaseStatus:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_decision;
    *((unsigned char *)v4 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_caseIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_caseCount;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_caseCountTarget;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_caseStatus copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_decision;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_caseCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_caseCountTarget != *((_DWORD *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  caseStatus = self->_caseStatus;
  if ((unint64_t)caseStatus | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](caseStatus, "isEqual:")) {
      goto LABEL_19;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) != 0)
    {
      if (self->_decision)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_19;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_19;
      }
      BOOL v8 = 1;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v8 = 0;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_caseIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_caseCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_caseCountTarget;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_caseStatus hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_decision;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[ABCPbSigResponse setCaseIdentifier:](self, "setCaseIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_caseCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_caseCountTarget = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[ABCPbSigResponse setCaseStatus:](self, "setCaseStatus:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_decision = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
}

- (unsigned)caseCount
{
  return self->_caseCount;
}

- (unsigned)caseCountTarget
{
  return self->_caseCountTarget;
}

- (NSString)caseStatus
{
  return self->_caseStatus;
}

- (void)setCaseStatus:(id)a3
{
}

- (BOOL)decision
{
  return self->_decision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseStatus, 0);

  objc_storeStrong((id *)&self->_caseIdentifier, 0);
}

@end