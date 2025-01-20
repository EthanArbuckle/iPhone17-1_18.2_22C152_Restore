@interface AWDCountersStabilityS
- (BOOL)hasIsMtbfQualified;
- (BOOL)hasNcpCrashReason;
- (BOOL)hasNcpResetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMtbfQualified;
- (BOOL)readFrom:(id)a3;
- (NSString)ncpCrashReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ncpResetTypeAsString:(int)a3;
- (int)StringAsNcpResetType:(id)a3;
- (int)ncpResetType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMtbfQualified:(BOOL)a3;
- (void)setHasNcpResetType:(BOOL)a3;
- (void)setIsMtbfQualified:(BOOL)a3;
- (void)setNcpCrashReason:(id)a3;
- (void)setNcpResetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersStabilityS

- (int)ncpResetType
{
  if (*(unsigned char *)&self->_has) {
    return self->_ncpResetType;
  }
  else {
    return 1;
  }
}

- (void)setNcpResetType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ncpResetType = a3;
}

- (void)setHasNcpResetType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNcpResetType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)ncpResetTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100495688[a3 - 1];
  }
  return v3;
}

- (int)StringAsNcpResetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_ASSERT"])
  {

    return 1;
  }
  else if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_HARD_FAULT"])
  {

    return 2;
  }
  else if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_STACK_OVERFLOW"])
  {

    return 3;
  }
  else
  {
    if ([v3 isEqualToString:@"E_NCP_RESET_CAUSE_OTHER"]) {
      int v5 = 4;
    }
    else {
      int v5 = 1;
    }

    return v5;
  }
}

- (BOOL)hasNcpCrashReason
{
  return self->_ncpCrashReason != 0;
}

- (void)setIsMtbfQualified:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isMtbfQualified = a3;
}

- (void)setHasIsMtbfQualified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsMtbfQualified
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersStabilityS;
  char v3 = [(AWDCountersStabilityS *)&v7 description];
  v4 = [(AWDCountersStabilityS *)self dictionaryRepresentation];
  int v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_ncpResetType - 1;
    if (v4 >= 4)
    {
      int v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ncpResetType];
    }
    else
    {
      int v5 = off_100495688[v4];
    }
    [v3 setObject:v5 forKey:@"ncp_reset_type"];
  }
  ncpCrashReason = self->_ncpCrashReason;
  if (ncpCrashReason) {
    [v3 setObject:ncpCrashReason forKey:@"ncp_crash_reason"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_isMtbfQualified];
    [v3 setObject:v7 forKey:@"is_mtbf_qualified"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersStabilitySReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_ncpCrashReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_ncpResetType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_ncpCrashReason)
  {
    id v5 = v4;
    objc_msgSend(v4, "setNcpCrashReason:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_isMtbfQualified;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[4] = self->_ncpResetType;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  id v7 = [(NSString *)self->_ncpCrashReason copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v6 + 20) = self->_isMtbfQualified;
    *((unsigned char *)v6 + 24) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_ncpResetType != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  ncpCrashReason = self->_ncpCrashReason;
  if ((unint64_t)ncpCrashReason | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](ncpCrashReason, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_isMtbfQualified)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v7 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_ncpResetType;
    NSUInteger v4 = [(NSString *)self->_ncpCrashReason hash];
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      return v4 ^ v3 ^ (2654435761 * self->_isMtbfQualified);
    }
  }
  else
  {
    uint64_t v3 = 0;
    NSUInteger v4 = [(NSString *)self->_ncpCrashReason hash];
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      return v4 ^ v3 ^ (2654435761 * self->_isMtbfQualified);
    }
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 24))
  {
    self->_ncpResetType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[AWDCountersStabilityS setNcpCrashReason:](self, "setNcpCrashReason:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_isMtbfQualified = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)ncpCrashReason
{
  return self->_ncpCrashReason;
}

- (void)setNcpCrashReason:(id)a3
{
}

- (BOOL)isMtbfQualified
{
  return self->_isMtbfQualified;
}

- (void).cxx_destruct
{
}

@end