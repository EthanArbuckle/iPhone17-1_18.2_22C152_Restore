@interface AWDCXCallDirectoryChanged
- (BOOL)hasIsEnabled;
- (BOOL)hasProviderBundleId;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalBlockedHandles;
- (BOOL)hasTotalIdentifiedHandles;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)providerBundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)totalBlockedHandles;
- (unsigned)totalIdentifiedHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalBlockedHandles:(BOOL)a3;
- (void)setHasTotalIdentifiedHandles:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setProviderBundleId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalBlockedHandles:(unsigned int)a3;
- (void)setTotalIdentifiedHandles:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCXCallDirectoryChanged

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalBlockedHandles:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalBlockedHandles = a3;
}

- (void)setHasTotalBlockedHandles:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalBlockedHandles
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalIdentifiedHandles:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalIdentifiedHandles = a3;
}

- (void)setHasTotalIdentifiedHandles:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalIdentifiedHandles
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasProviderBundleId
{
  return self->_providerBundleId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCXCallDirectoryChanged;
  char v3 = [(AWDCXCallDirectoryChanged *)&v7 description];
  v4 = [(AWDCXCallDirectoryChanged *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithUnsignedInt:self->_totalBlockedHandles];
  [v3 setObject:v9 forKey:@"totalBlockedHandles"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v10 = +[NSNumber numberWithUnsignedInt:self->_totalIdentifiedHandles];
  [v3 setObject:v10 forKey:@"totalIdentifiedHandles"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithBool:self->_isEnabled];
    [v3 setObject:v5 forKey:@"isEnabled"];
  }
LABEL_6:
  providerBundleId = self->_providerBundleId;
  if (providerBundleId) {
    [v3 setObject:providerBundleId forKey:@"providerBundleId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000A498((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_providerBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_totalBlockedHandles;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v4 + 7) = self->_totalIdentifiedHandles;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v4 + 32) = self->_isEnabled;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_6:
  if (self->_providerBundleId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setProviderBundleId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v5 + 7) = self->_totalIdentifiedHandles;
      *((unsigned char *)v5 + 36) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_totalBlockedHandles;
  *((unsigned char *)v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v5 + 32) = self->_isEnabled;
    *((unsigned char *)v5 + 36) |= 8u;
  }
LABEL_6:
  id v8 = [(NSString *)self->_providerBundleId copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_totalBlockedHandles != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_totalIdentifiedHandles != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    unsigned __int8 v5 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 36) & 8) == 0) {
    goto LABEL_21;
  }
  if (!self->_isEnabled)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_21;
  }
LABEL_27:
  providerBundleId = self->_providerBundleId;
  if ((unint64_t)providerBundleId | *((void *)v4 + 2)) {
    unsigned __int8 v5 = -[NSString isEqual:](providerBundleId, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_totalBlockedHandles;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_providerBundleId hash];
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_totalIdentifiedHandles;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isEnabled;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_providerBundleId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_totalBlockedHandles = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_totalIdentifiedHandles = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_5:
    self->_isEnabled = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[AWDCXCallDirectoryChanged setProviderBundleId:](self, "setProviderBundleId:");
    id v4 = v6;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalBlockedHandles
{
  return self->_totalBlockedHandles;
}

- (unsigned)totalIdentifiedHandles
{
  return self->_totalIdentifiedHandles;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSString)providerBundleId
{
  return self->_providerBundleId;
}

- (void)setProviderBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end