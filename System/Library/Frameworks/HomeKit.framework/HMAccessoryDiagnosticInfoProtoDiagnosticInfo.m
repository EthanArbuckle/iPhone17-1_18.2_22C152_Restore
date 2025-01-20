@interface HMAccessoryDiagnosticInfoProtoDiagnosticInfo
- (BOOL)hasAppleMediaAccessoryDiagnosticInfo;
- (BOOL)hasGenerationTime;
- (BOOL)hasHomeHubVersion;
- (BOOL)hasLastSetupInfo;
- (BOOL)hasNumHomes;
- (BOOL)hasPrimaryResidentDiagnosticInfo;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo)appleMediaAccessoryDiagnosticInfo;
- (HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo)primaryResidentDiagnosticInfo;
- (HMAccessoryDiagnosticInfoProtoSetupInfo)lastSetupInfo;
- (double)generationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)homeHubVersion;
- (int)numHomes;
- (unint64_t)hash;
- (unint64_t)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppleMediaAccessoryDiagnosticInfo:(id)a3;
- (void)setGenerationTime:(double)a3;
- (void)setHasGenerationTime:(BOOL)a3;
- (void)setHasHomeHubVersion:(BOOL)a3;
- (void)setHasNumHomes:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHomeHubVersion:(int)a3;
- (void)setLastSetupInfo:(id)a3;
- (void)setNumHomes:(int)a3;
- (void)setPrimaryResidentDiagnosticInfo:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoDiagnosticInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfo, 0);
  objc_storeStrong((id *)&self->_lastSetupInfo, 0);

  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfo, 0);
}

- (double)generationTime
{
  return self->_generationTime;
}

- (void)setLastSetupInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoSetupInfo)lastSetupInfo
{
  return self->_lastSetupInfo;
}

- (int)numHomes
{
  return self->_numHomes;
}

- (int)homeHubVersion
{
  return self->_homeHubVersion;
}

- (void)setPrimaryResidentDiagnosticInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo)primaryResidentDiagnosticInfo
{
  return self->_primaryResidentDiagnosticInfo;
}

- (void)setAppleMediaAccessoryDiagnosticInfo:(id)a3
{
}

- (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo)appleMediaAccessoryDiagnosticInfo
{
  return self->_appleMediaAccessoryDiagnosticInfo;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if ((v4[8] & 2) != 0)
  {
    self->_version = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  uint64_t v7 = v5[3];
  v13 = v5;
  if (appleMediaAccessoryDiagnosticInfo)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo mergeFrom:](appleMediaAccessoryDiagnosticInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setAppleMediaAccessoryDiagnosticInfo:](self, "setAppleMediaAccessoryDiagnosticInfo:");
  }
  v5 = v13;
LABEL_9:
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  uint64_t v9 = v5[7];
  if (primaryResidentDiagnosticInfo)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo mergeFrom:](primaryResidentDiagnosticInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setPrimaryResidentDiagnosticInfo:](self, "setPrimaryResidentDiagnosticInfo:");
  }
  v5 = v13;
LABEL_15:
  char v10 = *((unsigned char *)v5 + 64);
  if ((v10 & 4) != 0)
  {
    self->_homeHubVersion = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v5 + 64);
    if ((v10 & 8) == 0)
    {
LABEL_17:
      if ((v10 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v5[8] & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_numHomes = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_has |= 8u;
  if (v5[8])
  {
LABEL_18:
    self->_generationTime = (double)v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_19:
  lastSetupInfo = self->_lastSetupInfo;
  uint64_t v12 = v5[5];
  if (lastSetupInfo)
  {
    if (!v12) {
      goto LABEL_28;
    }
    lastSetupInfo = (HMAccessoryDiagnosticInfoProtoSetupInfo *)-[HMAccessoryDiagnosticInfoProtoSetupInfo mergeFrom:](lastSetupInfo, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_28;
    }
    lastSetupInfo = (HMAccessoryDiagnosticInfoProtoSetupInfo *)-[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setLastSetupInfo:](self, "setLastSetupInfo:");
  }
  v5 = v13;
LABEL_28:

  MEMORY[0x1F41817F8](lastSetupInfo, v5);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_version;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self->_appleMediaAccessoryDiagnosticInfo hash];
  unint64_t v5 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self->_primaryResidentDiagnosticInfo hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ [(HMAccessoryDiagnosticInfoProtoSetupInfo *)self->_lastSetupInfo hash];
  }
  uint64_t v6 = 2654435761 * self->_homeHubVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_numHomes;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double generationTime = self->_generationTime;
  double v9 = -generationTime;
  if (generationTime >= 0.0) {
    double v9 = self->_generationTime;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ [(HMAccessoryDiagnosticInfoProtoSetupInfo *)self->_lastSetupInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  if ((unint64_t)appleMediaAccessoryDiagnosticInfo | *((void *)v4 + 3)
    && !-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo isEqual:](appleMediaAccessoryDiagnosticInfo, "isEqual:"))
  {
    goto LABEL_28;
  }
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  if ((unint64_t)primaryResidentDiagnosticInfo | *((void *)v4 + 7))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo isEqual:](primaryResidentDiagnosticInfo, "isEqual:"))goto LABEL_28; {
  }
    }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_homeHubVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_numHomes != *((_DWORD *)v4 + 12)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_generationTime != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_28;
  }
  lastSetupInfo = self->_lastSetupInfo;
  if ((unint64_t)lastSetupInfo | *((void *)v4 + 5)) {
    char v8 = -[HMAccessoryDiagnosticInfoProtoSetupInfo isEqual:](lastSetupInfo, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_version;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v7 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)self->_appleMediaAccessoryDiagnosticInfo copyWithZone:a3];
  char v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  id v9 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)self->_primaryResidentDiagnosticInfo copyWithZone:a3];
  long double v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 48) = self->_numHomes;
    *(unsigned char *)(v6 + 64) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 32) = self->_homeHubVersion;
  *(unsigned char *)(v6 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(double *)(v6 + 8) = self->_generationTime;
    *(unsigned char *)(v6 + 64) |= 1u;
  }
LABEL_7:
  id v12 = [(HMAccessoryDiagnosticInfoProtoSetupInfo *)self->_lastSetupInfo copyWithZone:a3];
  v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_version;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  uint64_t v6 = v4;
  if (self->_appleMediaAccessoryDiagnosticInfo)
  {
    objc_msgSend(v4, "setAppleMediaAccessoryDiagnosticInfo:");
    id v4 = v6;
  }
  if (self->_primaryResidentDiagnosticInfo)
  {
    objc_msgSend(v6, "setPrimaryResidentDiagnosticInfo:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_homeHubVersion;
    *((unsigned char *)v4 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 12) = self->_numHomes;
  *((unsigned char *)v4 + 64) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    v4[1] = *(void *)&self->_generationTime;
    *((unsigned char *)v4 + 64) |= 1u;
  }
LABEL_11:
  if (self->_lastSetupInfo)
  {
    objc_msgSend(v6, "setLastSetupInfo:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_appleMediaAccessoryDiagnosticInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_primaryResidentDiagnosticInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_11:
  if (self->_lastSetupInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  if (appleMediaAccessoryDiagnosticInfo)
  {
    id v6 = [(HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *)appleMediaAccessoryDiagnosticInfo dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"appleMediaAccessoryDiagnosticInfo"];
  }
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  if (primaryResidentDiagnosticInfo)
  {
    char v8 = [(HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *)primaryResidentDiagnosticInfo dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"primaryResidentDiagnosticInfo"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    long double v10 = [NSNumber numberWithInt:self->_homeHubVersion];
    [v3 setObject:v10 forKey:@"homeHubVersion"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    double v11 = [NSNumber numberWithInt:self->_numHomes];
    [v3 setObject:v11 forKey:@"numHomes"];
  }
  lastSetupInfo = self->_lastSetupInfo;
  if (lastSetupInfo)
  {
    v13 = [(HMAccessoryDiagnosticInfoProtoSetupInfo *)lastSetupInfo dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"lastSetupInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithDouble:self->_generationTime];
    [v3 setObject:v14 forKey:@"generationTime"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoDiagnosticInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)&v8 description];
  uint64_t v5 = [(HMAccessoryDiagnosticInfoProtoDiagnosticInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGenerationTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasGenerationTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setGenerationTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double generationTime = a3;
}

- (BOOL)hasLastSetupInfo
{
  return self->_lastSetupInfo != 0;
}

- (BOOL)hasNumHomes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumHomes:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNumHomes:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numHomes = a3;
}

- (BOOL)hasHomeHubVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasHomeHubVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHomeHubVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_homeHubVersion = a3;
}

- (BOOL)hasPrimaryResidentDiagnosticInfo
{
  return self->_primaryResidentDiagnosticInfo != 0;
}

- (BOOL)hasAppleMediaAccessoryDiagnosticInfo
{
  return self->_appleMediaAccessoryDiagnosticInfo != 0;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

@end