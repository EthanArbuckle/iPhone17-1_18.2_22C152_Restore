@interface ADSponsoredSearchRequest
+ (id)options;
- (ADUserTargetingProperties)properties;
- (BOOL)clientExclusive;
- (BOOL)enableImagesForDupes;
- (BOOL)hasClientExclusive;
- (BOOL)hasDeploymentID;
- (BOOL)hasEnableImagesForDupes;
- (BOOL)hasExperimentID;
- (BOOL)hasInAllocation;
- (BOOL)hasIsBaseline;
- (BOOL)hasIsTest;
- (BOOL)hasProperties;
- (BOOL)hasSupportedODMLVersion;
- (BOOL)hasTreatmentID;
- (BOOL)inAllocation;
- (BOOL)isBaseline;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTest;
- (BOOL)readFrom:(id)a3;
- (NSString)deploymentID;
- (NSString)experimentID;
- (NSString)treatmentID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)supportedODMLVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientExclusive:(BOOL)a3;
- (void)setDeploymentID:(id)a3;
- (void)setEnableImagesForDupes:(BOOL)a3;
- (void)setExperimentID:(id)a3;
- (void)setHasClientExclusive:(BOOL)a3;
- (void)setHasEnableImagesForDupes:(BOOL)a3;
- (void)setHasInAllocation:(BOOL)a3;
- (void)setHasIsBaseline:(BOOL)a3;
- (void)setHasIsTest:(BOOL)a3;
- (void)setHasSupportedODMLVersion:(BOOL)a3;
- (void)setInAllocation:(BOOL)a3;
- (void)setIsBaseline:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setSupportedODMLVersion:(int)a3;
- (void)setTreatmentID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADSponsoredSearchRequest

+ (id)options
{
  if (options_once_10 != -1) {
    dispatch_once(&options_once_10, &__block_literal_global_17);
  }
  v2 = (void *)options_sOptions_10;
  return v2;
}

void __35__ADSponsoredSearchRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_10;
  options_sOptions_10 = (uint64_t)&unk_1F27155C8;
}

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (void)setIsTest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isTest = a3;
}

- (void)setHasIsTest:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsTest
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsBaseline:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isBaseline = a3;
}

- (void)setHasIsBaseline:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsBaseline
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEnableImagesForDupes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_enableImagesForDupes = a3;
}

- (void)setHasEnableImagesForDupes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableImagesForDupes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportedODMLVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportedODMLVersion = a3;
}

- (void)setHasSupportedODMLVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportedODMLVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExperimentID
{
  return self->_experimentID != 0;
}

- (BOOL)hasTreatmentID
{
  return self->_treatmentID != 0;
}

- (BOOL)hasDeploymentID
{
  return self->_deploymentID != 0;
}

- (void)setInAllocation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_inAllocation = a3;
}

- (void)setHasInAllocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInAllocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setClientExclusive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_clientExclusive = a3;
}

- (void)setHasClientExclusive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClientExclusive
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADSponsoredSearchRequest;
  v4 = [(ADSponsoredSearchRequest *)&v8 description];
  v5 = [(ADSponsoredSearchRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  properties = self->_properties;
  if (properties)
  {
    v5 = [(ADUserTargetingProperties *)properties dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"properties"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_isTest];
    [v3 setObject:v15 forKey:@"isTest"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  v16 = [NSNumber numberWithBool:self->_isBaseline];
  [v3 setObject:v16 forKey:@"isBaseline"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  v17 = [NSNumber numberWithBool:self->_enableImagesForDupes];
  [v3 setObject:v17 forKey:@"enableImagesForDupes"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v7 = [NSNumber numberWithInt:self->_supportedODMLVersion];
    [v3 setObject:v7 forKey:@"supportedODMLVersion"];
  }
LABEL_8:
  experimentID = self->_experimentID;
  if (experimentID) {
    [v3 setObject:experimentID forKey:@"experimentID"];
  }
  treatmentID = self->_treatmentID;
  if (treatmentID) {
    [v3 setObject:treatmentID forKey:@"treatmentID"];
  }
  deploymentID = self->_deploymentID;
  if (deploymentID) {
    [v3 setObject:deploymentID forKey:@"deploymentID"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_inAllocation];
    [v3 setObject:v12 forKey:@"inAllocation"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_clientExclusive];
    [v3 setObject:v13 forKey:@"clientExclusive"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADSponsoredSearchRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_properties)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_8:
  if (self->_experimentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_treatmentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deploymentID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_properties)
  {
    objc_msgSend(v4, "setProperties:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 52) = self->_isTest;
    *((unsigned char *)v4 + 56) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 51) = self->_isBaseline;
  *((unsigned char *)v4 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  *((unsigned char *)v4 + 49) = self->_enableImagesForDupes;
  *((unsigned char *)v4 + 56) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_supportedODMLVersion;
    *((unsigned char *)v4 + 56) |= 1u;
  }
LABEL_8:
  if (self->_experimentID)
  {
    objc_msgSend(v7, "setExperimentID:");
    id v4 = v7;
  }
  if (self->_treatmentID)
  {
    objc_msgSend(v7, "setTreatmentID:");
    id v4 = v7;
  }
  if (self->_deploymentID)
  {
    objc_msgSend(v7, "setDeploymentID:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v4 + 50) = self->_inAllocation;
    *((unsigned char *)v4 + 56) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_clientExclusive;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ADUserTargetingProperties *)self->_properties copyWithZone:a3];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 52) = self->_isTest;
    *(unsigned char *)(v5 + 56) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 51) = self->_isBaseline;
  *(unsigned char *)(v5 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *(unsigned char *)(v5 + 49) = self->_enableImagesForDupes;
  *(unsigned char *)(v5 + 56) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_supportedODMLVersion;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_experimentID copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_treatmentID copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_deploymentID copyWithZone:a3];
  v14 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v13;

  char v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    *(unsigned char *)(v5 + 50) = self->_inAllocation;
    *(unsigned char *)(v5 + 56) |= 8u;
    char v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_clientExclusive;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 3))
  {
    if (!-[ADUserTargetingProperties isEqual:](properties, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0) {
      goto LABEL_49;
    }
    if (self->_isTest)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_isBaseline)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_enableImagesForDupes)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_supportedODMLVersion != *((_DWORD *)v4 + 8)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_49;
  }
  experimentID = self->_experimentID;
  if ((unint64_t)experimentID | *((void *)v4 + 2)
    && !-[NSString isEqual:](experimentID, "isEqual:"))
  {
    goto LABEL_49;
  }
  treatmentID = self->_treatmentID;
  if ((unint64_t)treatmentID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](treatmentID, "isEqual:")) {
      goto LABEL_49;
    }
  }
  deploymentID = self->_deploymentID;
  if ((unint64_t)deploymentID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](deploymentID, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0) {
      goto LABEL_49;
    }
    if (self->_inAllocation)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_49;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) != 0)
    {
      if (self->_clientExclusive)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_49;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_49;
      }
      BOOL v9 = 1;
      goto LABEL_50;
    }
LABEL_49:
    BOOL v9 = 0;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ADUserTargetingProperties *)self->_properties hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isTest;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isBaseline;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_enableImagesForDupes;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_supportedODMLVersion;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  NSUInteger v8 = [(NSString *)self->_experimentID hash];
  NSUInteger v9 = [(NSString *)self->_treatmentID hash];
  NSUInteger v10 = [(NSString *)self->_deploymentID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_inAllocation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_clientExclusive;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (properties)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ADUserTargetingProperties mergeFrom:](properties, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ADSponsoredSearchRequest setProperties:](self, "setProperties:");
  }
  id v4 = v9;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 0x20) != 0)
  {
    self->_isTest = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_has |= 0x20u;
    char v7 = *((unsigned char *)v4 + 56);
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) == 0)
  {
    goto LABEL_9;
  }
  self->_isBaseline = *((unsigned char *)v4 + 51);
  *(unsigned char *)&self->_has |= 0x10u;
  char v7 = *((unsigned char *)v4 + 56);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_27:
  self->_enableImagesForDupes = *((unsigned char *)v4 + 49);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    self->_supportedODMLVersion = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_12:
  if (*((void *)v4 + 2))
  {
    -[ADSponsoredSearchRequest setExperimentID:](self, "setExperimentID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 5))
  {
    -[ADSponsoredSearchRequest setTreatmentID:](self, "setTreatmentID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 1))
  {
    -[ADSponsoredSearchRequest setDeploymentID:](self, "setDeploymentID:");
    id v4 = v9;
  }
  char v8 = *((unsigned char *)v4 + 56);
  if ((v8 & 8) != 0)
  {
    self->_inAllocation = *((unsigned char *)v4 + 50);
    *(unsigned char *)&self->_has |= 8u;
    char v8 = *((unsigned char *)v4 + 56);
  }
  if ((v8 & 2) != 0)
  {
    self->_clientExclusive = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (ADUserTargetingProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (BOOL)isBaseline
{
  return self->_isBaseline;
}

- (BOOL)enableImagesForDupes
{
  return self->_enableImagesForDupes;
}

- (int)supportedODMLVersion
{
  return self->_supportedODMLVersion;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(id)a3
{
}

- (BOOL)inAllocation
{
  return self->_inAllocation;
}

- (BOOL)clientExclusive
{
  return self->_clientExclusive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
}

@end