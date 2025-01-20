@interface TunerState
- (BOOL)hasAccessory;
- (BOOL)hasDeembedVswrMag;
- (BOOL)hasDeembedVswrPhase;
- (BOOL)hasPortBodypositionFs;
- (BOOL)hasRat;
- (BOOL)hasScenarioDecision;
- (BOOL)hasTxBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ratAsString:(int)a3;
- (id)scenarioDecisionAsString:(int)a3;
- (int)StringAsRat:(id)a3;
- (int)StringAsScenarioDecision:(id)a3;
- (int)rat;
- (int)scenarioDecision;
- (unint64_t)hash;
- (unsigned)accessory;
- (unsigned)deembedVswrMag;
- (unsigned)deembedVswrPhase;
- (unsigned)portBodypositionFs;
- (unsigned)txBand;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessory:(unsigned int)a3;
- (void)setDeembedVswrMag:(unsigned int)a3;
- (void)setDeembedVswrPhase:(unsigned int)a3;
- (void)setHasAccessory:(BOOL)a3;
- (void)setHasDeembedVswrMag:(BOOL)a3;
- (void)setHasDeembedVswrPhase:(BOOL)a3;
- (void)setHasPortBodypositionFs:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasScenarioDecision:(BOOL)a3;
- (void)setHasTxBand:(BOOL)a3;
- (void)setPortBodypositionFs:(unsigned int)a3;
- (void)setRat:(int)a3;
- (void)setScenarioDecision:(int)a3;
- (void)setTxBand:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TunerState

- (int)rat
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRat
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)ratAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    char v3 = off_100286C48[a3];
  }
  else
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_MODE_NO_SRV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE_V2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GSM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_HDR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WCDMA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_EHRPD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WLAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GWL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_UMTS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_NR5G"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA_HDR"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTxBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_txBand = a3;
}

- (void)setHasTxBand:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTxBand
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPortBodypositionFs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_portBodypositionFs = a3;
}

- (void)setHasPortBodypositionFs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPortBodypositionFs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)scenarioDecision
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_scenarioDecision;
  }
  else {
    return 0;
  }
}

- (void)setScenarioDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_scenarioDecision = a3;
}

- (void)setHasScenarioDecision:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScenarioDecision
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)scenarioDecisionAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100286CC8[a3];
  }

  return v3;
}

- (int)StringAsScenarioDecision:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FREE_SPACE_SCENARIO"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LATG_UATF_SCENARIO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LATA_UATF_SCENARIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATGA_UATF_SCENARIO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LATF_UATH_SCENARIO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATG_UATH_SCENARIO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LATA_UATH_SCENARIO"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LATGA_UATH_SCENARIO"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RHH_SCENARIO"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LHH_SCENARIO"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"UHH_SCENARIO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"E_SCENARIO"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"B_SCENARIO"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"R_SCENARIO"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDeembedVswrMag:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deembedVswrMag = a3;
}

- (void)setHasDeembedVswrMag:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeembedVswrMag
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeembedVswrPhase:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deembedVswrPhase = a3;
}

- (void)setHasDeembedVswrPhase:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeembedVswrPhase
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAccessory:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accessory = a3;
}

- (void)setHasAccessory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessory
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TunerState;
  char v3 = [(TunerState *)&v7 description];
  int v4 = [(TunerState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t rat = self->_rat;
    if rat < 0x10 && ((0x9FFFu >> rat))
    {
      v6 = off_100286C48[rat];
    }
    else
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rat];
    }
    [v3 setObject:v6 forKey:@"rat"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_txBand];
    [v3 setObject:v9 forKey:@"tx_band"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_portBodypositionFs];
  [v3 setObject:v10 forKey:@"port_bodyposition_fs"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_19:
  uint64_t scenarioDecision = self->_scenarioDecision;
  if (scenarioDecision >= 0xE)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_scenarioDecision];
  }
  else
  {
    v12 = off_100286CC8[scenarioDecision];
  }
  [v3 setObject:v12 forKey:@"scenario_decision"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = +[NSNumber numberWithUnsignedInt:self->_deembedVswrMag];
  [v3 setObject:v13 forKey:@"deembed_vswr_mag"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  v14 = +[NSNumber numberWithUnsignedInt:self->_deembedVswrPhase];
  [v3 setObject:v14 forKey:@"deembed_vswr_phase"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_13:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_accessory];
    [v3 setObject:v7 forKey:@"accessory"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100007770((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_rat;
    *((unsigned char *)v4 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_txBand;
  *((unsigned char *)v4 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[5] = self->_portBodypositionFs;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[7] = self->_scenarioDecision;
  *((unsigned char *)v4 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = self->_deembedVswrMag;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[4] = self->_deembedVswrPhase;
  *((unsigned char *)v4 + 36) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    v4[2] = self->_accessory;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_rat;
    *((unsigned char *)result + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_txBand;
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_portBodypositionFs;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_scenarioDecision;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_deembedVswrMag;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_deembedVswrPhase;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 2) = self->_accessory;
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_rat != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0 || self->_txBand != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_portBodypositionFs != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_scenarioDecision != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_deembedVswrMag != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_deembedVswrPhase != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_accessory != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_rat;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_txBand;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_portBodypositionFs;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_scenarioDecision;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_deembedVswrMag;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_deembedVswrPhase;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_accessory;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t rat = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_txBand = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_portBodypositionFs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_uint64_t scenarioDecision = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_deembedVswrMag = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_deembedVswrPhase = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    self->_accessory = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
}

- (unsigned)txBand
{
  return self->_txBand;
}

- (unsigned)portBodypositionFs
{
  return self->_portBodypositionFs;
}

- (unsigned)deembedVswrMag
{
  return self->_deembedVswrMag;
}

- (unsigned)deembedVswrPhase
{
  return self->_deembedVswrPhase;
}

- (unsigned)accessory
{
  return self->_accessory;
}

@end