@interface CellularNrEndcUsageStats
- (BOOL)hasDeployment;
- (BOOL)hasDrbConfig;
- (BOOL)hasMcgDuration;
- (BOOL)hasMcgTput;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasReleaseTech;
- (BOOL)hasScgDuration;
- (BOOL)hasScgTput;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DrbConfig)drbConfig;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsDeployment:(id)a3;
- (int)deployment;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)mcgDuration;
- (unsigned)mcgTput;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)releaseTech;
- (unsigned)scgDuration;
- (unsigned)scgTput;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeployment:(int)a3;
- (void)setDrbConfig:(id)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasMcgDuration:(BOOL)a3;
- (void)setHasMcgTput:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasReleaseTech:(BOOL)a3;
- (void)setHasScgDuration:(BOOL)a3;
- (void)setHasScgTput:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMcgDuration:(unsigned int)a3;
- (void)setMcgTput:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReleaseTech:(unsigned int)a3;
- (void)setScgDuration:(unsigned int)a3;
- (void)setScgTput:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrEndcUsageStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMcgTput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mcgTput = a3;
}

- (void)setHasMcgTput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMcgTput
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScgTput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scgTput = a3;
}

- (void)setHasScgTput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScgTput
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasDrbConfig
{
  return self->_drbConfig != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setMcgDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mcgDuration = a3;
}

- (void)setHasMcgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMcgDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScgDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scgDuration = a3;
}

- (void)setHasScgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScgDuration
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_deployment;
  }
  else {
    return 0;
  }
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)deploymentAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"DEPLOYMENT_NSA";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"DEPLOYMENT_SA";
  }
  return v4;
}

- (int)StringAsDeployment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEPLOYMENT_SA"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DEPLOYMENT_NSA"];
  }

  return v4;
}

- (void)setReleaseTech:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_releaseTech = a3;
}

- (void)setHasReleaseTech:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasReleaseTech
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrEndcUsageStats;
  __int16 v3 = [(CellularNrEndcUsageStats *)&v7 description];
  int v4 = [(CellularNrEndcUsageStats *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v14 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v14 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v15 = +[NSNumber numberWithUnsignedInt:self->_mcgTput];
  [v3 setObject:v15 forKey:@"mcg_tput"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_scgTput];
    [v3 setObject:v5 forKey:@"scg_tput"];
  }
LABEL_5:
  drbConfig = self->_drbConfig;
  if (drbConfig)
  {
    objc_super v7 = [(DrbConfig *)drbConfig dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"drb_config"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v16 forKey:@"subs_id"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x10) == 0)
    {
LABEL_9:
      if ((v8 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  v17 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v17 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    v9 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v9 forKey:@"ps_pref"];
  }
LABEL_11:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_mcgDuration];
    [v3 setObject:v18 forKey:@"mcg_duration"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_15:
      if ((v11 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  v19 = +[NSNumber numberWithUnsignedInt:self->_scgDuration];
  [v3 setObject:v19 forKey:@"scg_duration"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_16:
    if ((v11 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  int deployment = self->_deployment;
  if (deployment)
  {
    if (deployment == 1)
    {
      v21 = @"DEPLOYMENT_NSA";
    }
    else
    {
      v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deployment];
    }
  }
  else
  {
    v21 = @"DEPLOYMENT_SA";
  }
  [v3 setObject:v21 forKey:@"deployment"];

  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_17:
  v12 = +[NSNumber numberWithUnsignedInt:self->_releaseTech];
  [v3 setObject:v12 forKey:@"release_tech"];

LABEL_18:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100086070((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_drbConfig) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_16:
    if ((v6 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_mcgTput;
  *((_WORD *)v4 + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 17) = self->_scgTput;
    *((_WORD *)v4 + 38) |= 0x100u;
  }
LABEL_5:
  __int16 v8 = v4;
  if (self->_drbConfig)
  {
    [v4 setDrbConfig:];
    int v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_subsId;
    *((_WORD *)v4 + 38) |= 0x200u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 10) = self->_numSubs;
  *((_WORD *)v4 + 38) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_WORD *)v4 + 38) |= 0x20u;
  }
LABEL_11:
  if (self->_plmn)
  {
    [v8 setPlmn:];
    int v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_mcgDuration;
    *((_WORD *)v4 + 38) |= 4u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_15:
      if ((v7 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 16) = self->_scgDuration;
  *((_WORD *)v4 + 38) |= 0x80u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 2) == 0)
  {
LABEL_16:
    if ((v7 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  *((_DWORD *)v4 + 4) = self->_deployment;
  *((_WORD *)v4 + 38) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 15) = self->_releaseTech;
    *((_WORD *)v4 + 38) |= 0x40u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = [[objc_opt_class() allocWithZone:a3] init];
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 9) = self->_mcgTput;
  *((_WORD *)v5 + 38) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 17) = self->_scgTput;
    *((_WORD *)v5 + 38) |= 0x100u;
  }
LABEL_5:
  id v8 = [(DrbConfig *)self->_drbConfig copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_subsId;
    *((_WORD *)v6 + 38) |= 0x200u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x10) == 0)
    {
LABEL_7:
      if ((v10 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 10) = self->_numSubs;
  *((_WORD *)v6 + 38) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 14) = self->_psPref;
    *((_WORD *)v6 + 38) |= 0x20u;
  }
LABEL_9:
  id v11 = [(NSData *)self->_plmn copyWithZone:a3];
  v12 = (void *)v6[6];
  v6[6] = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_mcgDuration;
    *((_WORD *)v6 + 38) |= 4u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_11:
      if ((v13 & 2) == 0) {
        goto LABEL_12;
      }
LABEL_23:
      *((_DWORD *)v6 + 4) = self->_deployment;
      *((_WORD *)v6 + 38) |= 2u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return v6;
      }
      goto LABEL_13;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 16) = self->_scgDuration;
  *((_WORD *)v6 + 38) |= 0x80u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_12:
  if ((v13 & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v6 + 15) = self->_releaseTech;
    *((_WORD *)v6 + 38) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v6)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mcgTput != *((_DWORD *)v4 + 9)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_scgTput != *((_DWORD *)v4 + 17)) {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  drbConfig = self->_drbConfig;
  if ((unint64_t)drbConfig | *((void *)v4 + 3))
  {
    if (!-[DrbConfig isEqual:](drbConfig, "isEqual:")) {
      goto LABEL_58;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 38);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_subsId != *((_DWORD *)v4 + 18)) {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 10)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 14)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 6))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      goto LABEL_38;
    }
LABEL_58:
    BOOL v11 = 0;
    goto LABEL_59;
  }
LABEL_38:
  __int16 v10 = *((_WORD *)v4 + 38);
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_mcgDuration != *((_DWORD *)v4 + 8)) {
      goto LABEL_58;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_scgDuration != *((_DWORD *)v4 + 16)) {
      goto LABEL_58;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4)) {
      goto LABEL_58;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_releaseTech != *((_DWORD *)v4 + 15)) {
      goto LABEL_58;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x40) == 0;
  }
LABEL_59:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    unint64_t v4 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_mcgTput;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_scgTput;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = [(DrbConfig *)self->_drbConfig hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
    uint64_t v9 = 0;
    if ((v8 & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v10 = 0;
    if ((v8 & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v9 = 2654435761 * self->_subsId;
  if ((v8 & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_numSubs;
  if ((v8 & 0x20) != 0)
  {
LABEL_11:
    uint64_t v11 = 2654435761 * self->_psPref;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v11 = 0;
LABEL_15:
  unint64_t v12 = (unint64_t)[(NSData *)self->_plmn hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_mcgDuration;
    if ((v13 & 0x80) != 0)
    {
LABEL_17:
      uint64_t v15 = 2654435761 * self->_scgDuration;
      if ((v13 & 2) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v16 = 0;
      if ((v13 & 0x40) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v17 = 0;
      return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v7 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((v13 & 0x80) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v15 = 0;
  if ((v13 & 2) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_deployment;
  if ((v13 & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v17 = 2654435761 * self->_releaseTech;
  return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v7 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 38);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 38);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mcgTput = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
LABEL_4:
    self->_scgTput = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_5:
  drbConfig = self->_drbConfig;
  uint64_t v8 = *((void *)v5 + 3);
  id v11 = v5;
  if (drbConfig)
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[DrbConfig mergeFrom:](drbConfig, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    -[CellularNrEndcUsageStats setDrbConfig:](self, "setDrbConfig:");
  }
  id v5 = v11;
LABEL_14:
  __int16 v9 = *((_WORD *)v5 + 38);
  if ((v9 & 0x200) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v9 = *((_WORD *)v5 + 38);
    if ((v9 & 0x10) == 0)
    {
LABEL_16:
      if ((v9 & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  self->_numSubs = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v5 + 38) & 0x20) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_18:
  if (*((void *)v5 + 6))
  {
    -[CellularNrEndcUsageStats setPlmn:](self, "setPlmn:");
    id v5 = v11;
  }
  __int16 v10 = *((_WORD *)v5 + 38);
  if ((v10 & 4) != 0)
  {
    self->_mcgDuration = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 4u;
    __int16 v10 = *((_WORD *)v5 + 38);
    if ((v10 & 0x80) == 0)
    {
LABEL_22:
      if ((v10 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_22;
  }
  self->_scgDuration = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v10 = *((_WORD *)v5 + 38);
  if ((v10 & 2) == 0)
  {
LABEL_23:
    if ((v10 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  self->_int deployment = *((_DWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v5 + 38) & 0x40) != 0)
  {
LABEL_24:
    self->_releaseTech = *((_DWORD *)v5 + 15);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_25:

  _objc_release_x1();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)mcgTput
{
  return self->_mcgTput;
}

- (unsigned)scgTput
{
  return self->_scgTput;
}

- (DrbConfig)drbConfig
{
  return self->_drbConfig;
}

- (void)setDrbConfig:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)mcgDuration
{
  return self->_mcgDuration;
}

- (unsigned)scgDuration
{
  return self->_scgDuration;
}

- (unsigned)releaseTech
{
  return self->_releaseTech;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_drbConfig, 0);
}

@end