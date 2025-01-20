@interface AWDDEDExtensionCompleted
- (BOOL)hasDuration;
- (BOOL)hasError;
- (BOOL)hasExtension;
- (BOOL)hasNumbytes;
- (BOOL)hasNumfiles;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)extension;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorAsString:(int)a3;
- (int)StringAsError:(id)a3;
- (int)error;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)numbytes;
- (unint64_t)numfiles;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setError:(int)a3;
- (void)setExtension:(id)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasNumbytes:(BOOL)a3;
- (void)setHasNumfiles:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumbytes:(unint64_t)a3;
- (void)setNumfiles:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDEDExtensionCompleted

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (void)setNumfiles:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numfiles = a3;
}

- (void)setHasNumfiles:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumfiles
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumbytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numbytes = a3;
}

- (void)setHasNumbytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumbytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)error
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_error;
  }
  else {
    return 0;
  }
}

- (void)setError:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)errorAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26453BB98[a3];
  }
  return v3;
}

- (int)StringAsError:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEDCollectErrorNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEDCollectErrorNoSpace"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEDCollectErrorNoExtension"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEDCollectErrorNoFiles"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDDEDExtensionCompleted;
  int v4 = [(AWDDEDExtensionCompleted *)&v8 description];
  v5 = [(AWDDEDExtensionCompleted *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  extension = self->_extension;
  if (extension) {
    [v3 setObject:extension forKey:@"extension"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_numfiles];
    [v3 setObject:v9 forKey:@"numfiles"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v10 = [NSNumber numberWithUnsignedLongLong:self->_numbytes];
  [v3 setObject:v10 forKey:@"numbytes"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  uint64_t error = self->_error;
  if (error >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_error);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_26453BB98[error];
  }
  [v3 setObject:v12 forKey:@"error"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  v7 = [NSNumber numberWithUnsignedLongLong:self->_duration];
  [v3 setObject:v7 forKey:@"duration"];

LABEL_10:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDEDExtensionCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_extension) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_9:
  }
    PBDataWriterWriteUint64Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[4] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 8u;
  }
  if (self->_extension)
  {
    v6 = v4;
    objc_msgSend(v4, "setExtension:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_numfiles;
    *((unsigned char *)v4 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v4[2] = self->_numbytes;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)v4 + 10) = self->_error;
  *((unsigned char *)v4 + 56) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    v4[1] = self->_duration;
    *((unsigned char *)v4 + 56) |= 1u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 8u;
  }
  uint64_t v7 = [(NSString *)self->_extension copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_numfiles;
    *(unsigned char *)(v6 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 40) = self->_error;
      *(unsigned char *)(v6 + 56) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 16) = self->_numbytes;
  *(unsigned char *)(v6 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if (has)
  {
LABEL_7:
    *(void *)(v6 + 8) = self->_duration;
    *(unsigned char *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_29;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](extension, "isEqual:"))
    {
LABEL_29:
      BOOL v7 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_numfiles != *((void *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_numbytes != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_error != *((_DWORD *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_duration != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
    BOOL v7 = 1;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_extension hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v5 = 2654435761u * self->_numfiles;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_numbytes;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_8;
      }
LABEL_12:
      unint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_error;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_duration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    self->_timestamp = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 6))
  {
    id v6 = v4;
    -[AWDDEDExtensionCompleted setExtension:](self, "setExtension:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_numfiles = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_numbytes = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_uint64_t error = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)v4 + 56))
  {
LABEL_9:
    self->_duration = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_10:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (unint64_t)numfiles
{
  return self->_numfiles;
}

- (unint64_t)numbytes
{
  return self->_numbytes;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end