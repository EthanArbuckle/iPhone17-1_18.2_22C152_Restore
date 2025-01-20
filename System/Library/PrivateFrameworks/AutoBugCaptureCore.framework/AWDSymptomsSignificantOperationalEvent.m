@interface AWDSymptomsSignificantOperationalEvent
- (BOOL)hasAlternateName;
- (BOOL)hasError;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasName;
- (BOOL)hasStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)alternateName;
- (NSString)errorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAsString:(int)a3;
- (id)nameAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsError:(id)a3;
- (int)StringAsName:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)error;
- (int)name;
- (int)status;
- (int64_t)errorCode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternateName:(id)a3;
- (void)setError:(int)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setName:(int)a3;
- (void)setStatus:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSymptomsSignificantOperationalEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)name
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_name;
  }
  else {
    return 1;
  }
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasName
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)nameAsString:(int)a3
{
  if ((a3 - 1) >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC3038[a3 - 1];
  }

  return v3;
}

- (int)StringAsName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DatabaseIntegrityCheckFailed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DestroyPersistentStoreFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DatabaseFileDeletionFailed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"InvalidMetadataForPersistentStore"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"InsufficientDiskStorageAvailable"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"QueryReturnedInconsistentContent"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NotificationTokenUnavailable"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLIPSRulesSuspectInDatabase"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CLIPSRulesFailedToLoad"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CLIPSRulesFailedDuringRun"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CLIPSRulesLoopDetected"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasAlternateName
{
  return self->_alternateName != 0;
}

- (int)error
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_error;
  }
  else {
    return 1;
  }
}

- (void)setError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC3090[a3 - 1];
  }

  return v3;
}

- (int)StringAsError:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Uninitialized"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ExpectedFailure"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UnexpectedFailure"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MissingValue"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EmptyValue"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TimedOut"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"InsufficientPermission"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_status;
  }
  else {
    return 1;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_263FC30C8[a3 - 1];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Success"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Fail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Undetermined"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsSignificantOperationalEvent;
  int v4 = [(AWDSymptomsSignificantOperationalEvent *)&v8 description];
  v5 = [(AWDSymptomsSignificantOperationalEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int v6 = self->_name - 1;
    if (v6 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_name);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_263FC3038[v6];
    }
    [v3 setObject:v7 forKey:@"name"];
  }
  alternateName = self->_alternateName;
  if (alternateName) {
    [v3 setObject:alternateName forKey:@"alternateName"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v9 = self->_error - 1;
    if (v9 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_error);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_263FC3090[v9];
    }
    [v3 setObject:v10 forKey:@"error"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  char v12 = (char)self->_has;
  if (v12)
  {
    v13 = [NSNumber numberWithLongLong:self->_errorCode];
    [v3 setObject:v13 forKey:@"errorCode"];

    char v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    unsigned int v14 = self->_status - 1;
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_263FC30C8[v14];
    }
    [v3 setObject:v15 forKey:@"status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsSignificantOperationalEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_alternateName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteInt64Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_name;
    *((unsigned char *)v4 + 56) |= 8u;
  }
  v7 = v4;
  if (self->_alternateName)
  {
    objc_msgSend(v4, "setAlternateName:");
    int v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_error;
    *((unsigned char *)v4 + 56) |= 4u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v7, "setErrorDomain:");
    int v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[1] = self->_errorCode;
    *((unsigned char *)v4 + 56) |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_status;
    *((unsigned char *)v4 + 56) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_name;
    *(unsigned char *)(v5 + 56) |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_alternateName copyWithZone:a3];
  unsigned int v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_error;
    *(unsigned char *)(v6 + 56) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v11 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v10;

  char v12 = (char)self->_has;
  if (v12)
  {
    *(void *)(v6 + 8) = self->_errorCode;
    *(unsigned char *)(v6 + 56) |= 1u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_status;
    *(unsigned char *)(v6 + 56) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_name != *((_DWORD *)v4 + 12)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_32;
  }
  alternateName = self->_alternateName;
  if ((unint64_t)alternateName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](alternateName, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_error != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_32;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](errorDomain, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_32:
    BOOL v8 = 0;
    goto LABEL_33;
  }
LABEL_23:
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_32;
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_status != *((_DWORD *)v4 + 13)) {
      goto LABEL_32;
    }
    BOOL v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_name;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_alternateName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_error;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 8) != 0)
  {
    self->_name = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
  }
  id v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[AWDSymptomsSignificantOperationalEvent setAlternateName:](self, "setAlternateName:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    self->_error = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[AWDSymptomsSignificantOperationalEvent setErrorDomain:](self, "setErrorDomain:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 56);
  if (v6)
  {
    self->_errorCode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_status = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);

  objc_storeStrong((id *)&self->_alternateName, 0);
}

@end