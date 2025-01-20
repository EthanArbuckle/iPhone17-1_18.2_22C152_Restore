@interface HMAccessoryDiagnosticInfoProtoIdsInfo
- (BOOL)hasIdsIdentifierString;
- (BOOL)hasIdsState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)idsIdentifierString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)idsStateAsString:(int)a3;
- (int)StringAsIdsState:(id)a3;
- (int)idsState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIdsState:(BOOL)a3;
- (void)setIdsIdentifierString:(id)a3;
- (void)setIdsState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoIdsInfo

- (void).cxx_destruct
{
}

- (void)setIdsIdentifierString:(id)a3
{
}

- (NSString)idsIdentifierString
{
  return self->_idsIdentifierString;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[5])
  {
    self->_idsState = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    v5 = v4;
    -[HMAccessoryDiagnosticInfoProtoIdsInfo setIdsIdentifierString:](self, "setIdsIdentifierString:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_idsState;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_idsIdentifierString hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_idsState != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  idsIdentifierString = self->_idsIdentifierString;
  if ((unint64_t)idsIdentifierString | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](idsIdentifierString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_idsState;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_idsIdentifierString copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_idsState;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_idsIdentifierString)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setIdsIdentifierString:");
    id v4 = v5;
  }
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
  if (self->_idsIdentifierString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoIdsInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int idsState = self->_idsState;
    if (idsState)
    {
      if (idsState == 1)
      {
        id v5 = @"Good";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_idsState);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v5 = @"Unknown";
    }
    [v3 setObject:v5 forKey:@"idsState"];
  }
  idsIdentifierString = self->_idsIdentifierString;
  if (idsIdentifierString) {
    [v3 setObject:idsIdentifierString forKey:@"idsIdentifierString"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoIdsInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoIdsInfo *)&v8 description];
  id v5 = [(HMAccessoryDiagnosticInfoProtoIdsInfo *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIdsIdentifierString
{
  return self->_idsIdentifierString != 0;
}

- (int)StringAsIdsState:(id)a3
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

- (id)idsStateAsString:(int)a3
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

- (BOOL)hasIdsState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIdsState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIdsState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int idsState = a3;
}

- (int)idsState
{
  if (*(unsigned char *)&self->_has) {
    return self->_idsState;
  }
  else {
    return 0;
  }
}

@end