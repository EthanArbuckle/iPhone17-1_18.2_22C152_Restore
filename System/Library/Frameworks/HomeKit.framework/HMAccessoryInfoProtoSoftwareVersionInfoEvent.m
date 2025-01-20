@interface HMAccessoryInfoProtoSoftwareVersionInfoEvent
- (BOOL)hasBuildVersion;
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasUpdateVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)buildVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)updateVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasUpdateVersion:(BOOL)a3;
- (void)setMajorVersion:(int64_t)a3;
- (void)setMinorVersion:(int64_t)a3;
- (void)setUpdateVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoSoftwareVersionInfoEvent

- (void).cxx_destruct
{
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)updateVersion
{
  return self->_updateVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_majorVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_minorVersion = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_updateVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[HMAccessoryInfoProtoSoftwareVersionInfoEvent setBuildVersion:](self, "setBuildVersion:");
    id v4 = v6;
  }
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
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_buildVersion hash];
  }
  uint64_t v2 = 2654435761 * self->_majorVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_minorVersion;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_updateVersion;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_buildVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_majorVersion != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minorVersion != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_updateVersion != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 4)) {
    char v6 = -[NSString isEqual:](buildVersion, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_minorVersion;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_majorVersion;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_updateVersion;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_majorVersion;
    *((unsigned char *)v4 + 40) |= 1u;
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
  v4[2] = self->_minorVersion;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_updateVersion;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_5:
  if (self->_buildVersion)
  {
    char v6 = v4;
    objc_msgSend(v4, "setBuildVersion:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
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
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoSoftwareVersionInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithLongLong:self->_majorVersion];
    [v3 setObject:v8 forKey:@"majorVersion"];

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
  v9 = [NSNumber numberWithLongLong:self->_minorVersion];
  [v3 setObject:v9 forKey:@"minorVersion"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = [NSNumber numberWithLongLong:self->_updateVersion];
    [v3 setObject:v5 forKey:@"updateVersion"];
  }
LABEL_5:
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoSoftwareVersionInfoEvent;
  id v4 = [(HMAccessoryInfoProtoSoftwareVersionInfoEvent *)&v8 description];
  uint64_t v5 = [(HMAccessoryInfoProtoSoftwareVersionInfoEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasUpdateVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setUpdateVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_updateVersion = a3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMinorVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minorVersion = a3;
}

- (BOOL)hasMajorVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMajorVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_majorVersion = a3;
}

@end