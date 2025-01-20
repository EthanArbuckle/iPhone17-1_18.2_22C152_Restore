@interface CellularLqmStateChange
+ (Class)lteChanInfoType;
+ (Class)umtsChanInfoType;
- (BOOL)bbInHiPowerState;
- (BOOL)fgAppActiveDuringCongestion;
- (BOOL)hasBbInHiPowerState;
- (BOOL)hasCellId;
- (BOOL)hasCongestionReason;
- (BOOL)hasDurationSec;
- (BOOL)hasFgAppActiveDuringCongestion;
- (BOOL)hasHiPowerEvent;
- (BOOL)hasHiPowerExitReason;
- (BOOL)hasIsScreenOn;
- (BOOL)hasLqmType;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNumMncDigits;
- (BOOL)hasRachConnInfo;
- (BOOL)hasSwimWorkoutActive;
- (BOOL)hasSysMode;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScreenOn;
- (BOOL)readFrom:(id)a3;
- (BOOL)swimWorkoutActive;
- (NSMutableArray)lteChanInfos;
- (NSMutableArray)umtsChanInfos;
- (RachConnInfo)rachConnInfo;
- (id)congestionReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hiPowerEventAsString:(int)a3;
- (id)hiPowerExitReasonAsString:(int)a3;
- (id)lteChanInfoAtIndex:(unint64_t)a3;
- (id)umtsChanInfoAtIndex:(unint64_t)a3;
- (int)StringAsCongestionReason:(id)a3;
- (int)StringAsHiPowerEvent:(id)a3;
- (int)StringAsHiPowerExitReason:(id)a3;
- (int)congestionReason;
- (int)hiPowerEvent;
- (int)hiPowerExitReason;
- (int)lqmType;
- (int)sysMode;
- (unint64_t)hash;
- (unint64_t)lteChanInfosCount;
- (unint64_t)timestamp;
- (unint64_t)umtsChanInfosCount;
- (unsigned)cellId;
- (unsigned)durationSec;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)numMncDigits;
- (void)addLteChanInfo:(id)a3;
- (void)addUmtsChanInfo:(id)a3;
- (void)clearLteChanInfos;
- (void)clearUmtsChanInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBbInHiPowerState:(BOOL)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCongestionReason:(int)a3;
- (void)setDurationSec:(unsigned int)a3;
- (void)setFgAppActiveDuringCongestion:(BOOL)a3;
- (void)setHasBbInHiPowerState:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCongestionReason:(BOOL)a3;
- (void)setHasDurationSec:(BOOL)a3;
- (void)setHasFgAppActiveDuringCongestion:(BOOL)a3;
- (void)setHasHiPowerEvent:(BOOL)a3;
- (void)setHasHiPowerExitReason:(BOOL)a3;
- (void)setHasIsScreenOn:(BOOL)a3;
- (void)setHasLqmType:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasSwimWorkoutActive:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHiPowerEvent:(int)a3;
- (void)setHiPowerExitReason:(int)a3;
- (void)setIsScreenOn:(BOOL)a3;
- (void)setLqmType:(int)a3;
- (void)setLteChanInfos:(id)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setRachConnInfo:(id)a3;
- (void)setSwimWorkoutActive:(BOOL)a3;
- (void)setSysMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUmtsChanInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLqmStateChange

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

- (void)setDurationSec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationSec
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLqmType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lqmType = a3;
}

- (void)setHasLqmType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLqmType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isScreenOn = a3;
}

- (void)setHasIsScreenOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsScreenOn
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasRachConnInfo
{
  return self->_rachConnInfo != 0;
}

- (void)clearLteChanInfos
{
}

- (void)addLteChanInfo:(id)a3
{
  id v4 = a3;
  lteChanInfos = self->_lteChanInfos;
  id v8 = v4;
  if (!lteChanInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lteChanInfos;
    self->_lteChanInfos = v6;

    id v4 = v8;
    lteChanInfos = self->_lteChanInfos;
  }
  [(NSMutableArray *)lteChanInfos addObject:v4];
}

- (unint64_t)lteChanInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_lteChanInfos count];
}

- (id)lteChanInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lteChanInfos objectAtIndex:a3];
}

+ (Class)lteChanInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearUmtsChanInfos
{
}

- (void)addUmtsChanInfo:(id)a3
{
  id v4 = a3;
  umtsChanInfos = self->_umtsChanInfos;
  id v8 = v4;
  if (!umtsChanInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_umtsChanInfos;
    self->_umtsChanInfos = v6;

    id v4 = v8;
    umtsChanInfos = self->_umtsChanInfos;
  }
  [(NSMutableArray *)umtsChanInfos addObject:v4];
}

- (unint64_t)umtsChanInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_umtsChanInfos count];
}

- (id)umtsChanInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_umtsChanInfos objectAtIndex:a3];
}

+ (Class)umtsChanInfoType
{
  return (Class)objc_opt_class();
}

- (void)setBbInHiPowerState:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_bbInHiPowerState = a3;
}

- (void)setHasBbInHiPowerState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasBbInHiPowerState
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)hiPowerEvent
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_hiPowerEvent;
  }
  else {
    return 0;
  }
}

- (void)setHiPowerEvent:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hiPowerEvent = a3;
}

- (void)setHasHiPowerEvent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHiPowerEvent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)hiPowerEventAsString:(int)a3
{
  id v4 = @"LQM_EVENT_RLC_MAX_RETX";
  switch(a3)
  {
    case 0:
      goto LABEL_31;
    case 1:
      id v4 = @"LQM_EVENT_RACH_FAILURE";
      break;
    case 2:
      id v4 = @"LQM_EVENT_LTE_PHY_ABORT";
      break;
    case 3:
      id v4 = @"LQM_EVENT_LTE_HI_POWER";
      break;
    case 4:
      id v4 = @"LQM_EVENT_WCDMA_HI_POWER";
      break;
    case 5:
      id v4 = @"LQM_EVENT_LTE_POOR_SIGNAL_CONDITION";
      break;
    case 6:
      id v4 = @"LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION";
      break;
    case 7:
      id v4 = @"LQM_EVENT_WCDMA_RACH_FAILURE";
      break;
    case 8:
      id v4 = @"LQM_EVENT_EXCESSIVE_IRAT";
      break;
    default:
      if (a3 == 255)
      {
        id v4 = @"LQM_EVENT_MAX";
      }
      else
      {
        id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_31:
      }
      break;
  }
  return v4;
}

- (int)StringAsHiPowerEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LQM_EVENT_RLC_MAX_RETX"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_RACH_FAILURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_LTE_PHY_ABORT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_LTE_HI_POWER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_WCDMA_HI_POWER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_LTE_POOR_SIGNAL_CONDITION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_WCDMA_RACH_FAILURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_EXCESSIVE_IRAT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LQM_EVENT_MAX"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSwimWorkoutActive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_swimWorkoutActive = a3;
}

- (void)setHasSwimWorkoutActive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSwimWorkoutActive
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (int)hiPowerExitReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_hiPowerExitReason;
  }
  else {
    return 0;
  }
}

- (void)setHiPowerExitReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hiPowerExitReason = a3;
}

- (void)setHasHiPowerExitReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHiPowerExitReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)hiPowerExitReasonAsString:(int)a3
{
  if (a3 > 1)
  {
    if (a3 == 2)
    {
      int v4 = @"LQM_HPM_EXIT_REASON_USER_ACTIVITY";
    }
    else
    {
      if (a3 != 255)
      {
LABEL_12:
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
        return v4;
      }
      int v4 = @"LQM_HPM_EXIT_REASON_MAX";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 1)
      {
        int v4 = @"LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY";
  }
  return v4;
}

- (int)StringAsHiPowerExitReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LQM_HPM_EXIT_REASON_USER_ACTIVITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LQM_HPM_EXIT_REASON_MAX"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)congestionReason
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_congestionReason;
  }
  else {
    return 0;
  }
}

- (void)setCongestionReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_congestionReason = a3;
}

- (void)setHasCongestionReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCongestionReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)congestionReasonAsString:(int)a3
{
  int v4 = @"LQM_CONGESTION_REASON_RRC_REJECT";
  switch(a3)
  {
    case 0:
      goto LABEL_25;
    case 1:
      int v4 = @"LQM_CONGESTION_REASON_NAS_REJECT";
      break;
    case 2:
      int v4 = @"LQM_CONGESTION_REASON_ACCESS_BARRED";
      break;
    case 3:
      int v4 = @"LQM_CONGESTION_REASON_RACH_FAILURES";
      break;
    case 4:
      int v4 = @"LQM_CONGESTION_REASON_TRICKLING_GRANT";
      break;
    case 5:
      int v4 = @"LQM_CONGESTION_REASON_RLC_MAX_RETX";
      break;
    case 6:
      int v4 = @"LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS";
      break;
    default:
      if (a3 == 255)
      {
        int v4 = @"LQM_CONGESTION_REASON_MAX";
      }
      else
      {
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_25:
      }
      break;
  }
  return v4;
}

- (int)StringAsCongestionReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_RRC_REJECT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_NAS_REJECT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_ACCESS_BARRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_RACH_FAILURES"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_TRICKLING_GRANT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_RLC_MAX_RETX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LQM_CONGESTION_REASON_MAX"])
  {
    int v4 = 255;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMnc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFgAppActiveDuringCongestion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_fgAppActiveDuringCongestion = a3;
}

- (void)setHasFgAppActiveDuringCongestion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasFgAppActiveDuringCongestion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLqmStateChange;
  __int16 v3 = [(CellularLqmStateChange *)&v7 description];
  int v4 = [(CellularLqmStateChange *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v25 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v25 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_43;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v26 = +[NSNumber numberWithUnsignedInt:self->_durationSec];
  [v3 setObject:v26 forKey:@"duration_sec"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_44;
  }
LABEL_43:
  v27 = +[NSNumber numberWithInt:self->_lqmType];
  [v3 setObject:v27 forKey:@"lqm_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_44:
  v28 = +[NSNumber numberWithInt:self->_sysMode];
  [v3 setObject:v28 forKey:@"sys_mode"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithBool:self->_isScreenOn];
    [v3 setObject:v5 forKey:@"is_screen_on"];
  }
LABEL_7:
  rachConnInfo = self->_rachConnInfo;
  if (rachConnInfo)
  {
    objc_super v7 = [(RachConnInfo *)rachConnInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"rach_conn_info"];
  }
  if ([(NSMutableArray *)self->_lteChanInfos count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_lteChanInfos, "count")];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v9 = self->_lteChanInfos;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v46;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"lte_chan_info"];
  }
  if ([(NSMutableArray *)self->_umtsChanInfos count])
  {
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_umtsChanInfos, "count")];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v16 = self->_umtsChanInfos;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v42;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"umts_chan_info"];
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    v29 = +[NSNumber numberWithBool:self->_bbInHiPowerState];
    [v3 setObject:v29 forKey:@"bb_in_hi_power_state"];

    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_29:
      if ((v22 & 0x4000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_60;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_29;
  }
  int hiPowerEvent = self->_hiPowerEvent;
  v31 = @"LQM_EVENT_RLC_MAX_RETX";
  switch(hiPowerEvent)
  {
    case 0:
      break;
    case 1:
      v31 = @"LQM_EVENT_RACH_FAILURE";
      break;
    case 2:
      v31 = @"LQM_EVENT_LTE_PHY_ABORT";
      break;
    case 3:
      v31 = @"LQM_EVENT_LTE_HI_POWER";
      break;
    case 4:
      v31 = @"LQM_EVENT_WCDMA_HI_POWER";
      break;
    case 5:
      v31 = @"LQM_EVENT_LTE_POOR_SIGNAL_CONDITION";
      break;
    case 6:
      v31 = @"LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION";
      break;
    case 7:
      v31 = @"LQM_EVENT_WCDMA_RACH_FAILURE";
      break;
    case 8:
      v31 = @"LQM_EVENT_EXCESSIVE_IRAT";
      break;
    default:
      if (hiPowerEvent == 255)
      {
        v31 = @"LQM_EVENT_MAX";
      }
      else
      {
        v31 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hiPowerEvent];
      }
      break;
  }
  [v3 setObject:v31 forKey:@"hi_power_event"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x4000) == 0)
  {
LABEL_30:
    if ((v22 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  v32 = +[NSNumber numberWithBool:self->_swimWorkoutActive];
  [v3 setObject:v32 forKey:@"swim_workout_active"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_31:
    if ((v22 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_72;
  }
LABEL_61:
  int hiPowerExitReason = self->_hiPowerExitReason;
  if (hiPowerExitReason > 1)
  {
    if (hiPowerExitReason == 2)
    {
      v34 = @"LQM_HPM_EXIT_REASON_USER_ACTIVITY";
      goto LABEL_71;
    }
    if (hiPowerExitReason == 255)
    {
      v34 = @"LQM_HPM_EXIT_REASON_MAX";
      goto LABEL_71;
    }
  }
  else
  {
    if (!hiPowerExitReason)
    {
      v34 = @"LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY";
      goto LABEL_71;
    }
    if (hiPowerExitReason == 1)
    {
      v34 = @"LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT";
      goto LABEL_71;
    }
  }
  v34 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hiPowerExitReason];
LABEL_71:
  [v3 setObject:v34 forKey:@"hi_power_exit_reason"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_32:
    if ((v22 & 2) == 0) {
      goto LABEL_33;
    }
    goto LABEL_83;
  }
LABEL_72:
  int congestionReason = self->_congestionReason;
  v36 = @"LQM_CONGESTION_REASON_RRC_REJECT";
  switch(congestionReason)
  {
    case 0:
      break;
    case 1:
      v36 = @"LQM_CONGESTION_REASON_NAS_REJECT";
      break;
    case 2:
      v36 = @"LQM_CONGESTION_REASON_ACCESS_BARRED";
      break;
    case 3:
      v36 = @"LQM_CONGESTION_REASON_RACH_FAILURES";
      break;
    case 4:
      v36 = @"LQM_CONGESTION_REASON_TRICKLING_GRANT";
      break;
    case 5:
      v36 = @"LQM_CONGESTION_REASON_RLC_MAX_RETX";
      break;
    case 6:
      v36 = @"LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS";
      break;
    default:
      if (congestionReason == 255)
      {
        v36 = @"LQM_CONGESTION_REASON_MAX";
      }
      else
      {
        v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_congestionReason];
      }
      break;
  }
  [v3 setObject:v36 forKey:@"congestion_reason"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 2) == 0)
  {
LABEL_33:
    if ((v22 & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_83:
  v37 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v37 forKey:@"cell_id"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_34:
    if ((v22 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_85;
  }
LABEL_84:
  v38 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v38 forKey:@"num_mnc_digits"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_35:
    if ((v22 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_86;
  }
LABEL_85:
  v39 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v39 forKey:@"mcc"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x100) == 0)
  {
LABEL_36:
    if ((v22 & 0x1000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_86:
  v40 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v40 forKey:@"mnc"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_37:
    v23 = +[NSNumber numberWithBool:self->_fgAppActiveDuringCongestion];
    [v3 setObject:v23 forKey:@"fg_app_active_during_congestion"];
  }
LABEL_38:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100094874((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_rachConnInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_lteChanInfos;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_umtsChanInfos;
  uint64_t v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x10) == 0)
    {
LABEL_25:
      if ((v16 & 0x4000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_42;
    }
  }
  else if ((v16 & 0x10) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x4000) == 0)
  {
LABEL_26:
    if ((v16 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_27:
    if ((v16 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 4) == 0)
  {
LABEL_28:
    if ((v16 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 2) == 0)
  {
LABEL_29:
    if ((v16 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_30:
    if ((v16 & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x80) == 0)
  {
LABEL_31:
    if ((v16 & 0x100) == 0) {
      goto LABEL_32;
    }
LABEL_48:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0) {
    goto LABEL_48;
  }
LABEL_32:
  if ((v16 & 0x1000) != 0) {
LABEL_33:
  }
    PBDataWriterWriteBOOLField();
LABEL_34:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 46) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_durationSec;
  *((_WORD *)v4 + 46) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 9) = self->_lqmType;
  *((_WORD *)v4 + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = self->_sysMode;
  *((_WORD *)v4 + 46) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 90) = self->_isScreenOn;
    *((_WORD *)v4 + 46) |= 0x2000u;
  }
LABEL_7:
  id v15 = v4;
  if (self->_rachConnInfo) {
    [v4 setRachConnInfo:];
  }
  if ([(CellularLqmStateChange *)self lteChanInfosCount])
  {
    [v15 clearLteChanInfos];
    unint64_t v6 = [(CellularLqmStateChange *)self lteChanInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLqmStateChange *)self lteChanInfoAtIndex:i];
        [v15 addLteChanInfo:v9];
      }
    }
  }
  if ([(CellularLqmStateChange *)self umtsChanInfosCount])
  {
    [v15 clearUmtsChanInfos];
    unint64_t v10 = [(CellularLqmStateChange *)self umtsChanInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(CellularLqmStateChange *)self umtsChanInfoAtIndex:j];
        [v15 addUmtsChanInfo:v13];
      }
    }
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x800) != 0)
  {
    *((unsigned char *)v15 + 88) = self->_bbInHiPowerState;
    *((_WORD *)v15 + 46) |= 0x800u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_19:
      if ((v14 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_38;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v15 + 7) = self->_hiPowerEvent;
  *((_WORD *)v15 + 46) |= 0x10u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_20:
    if ((v14 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v15 + 91) = self->_swimWorkoutActive;
  *((_WORD *)v15 + 46) |= 0x4000u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_21:
    if ((v14 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v15 + 8) = self->_hiPowerExitReason;
  *((_WORD *)v15 + 46) |= 0x20u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) == 0)
  {
LABEL_22:
    if ((v14 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v15 + 5) = self->_congestionReason;
  *((_WORD *)v15 + 46) |= 4u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_23:
    if ((v14 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v15 + 4) = self->_cellId;
  *((_WORD *)v15 + 46) |= 2u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x200) == 0)
  {
LABEL_24:
    if ((v14 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v15 + 14) = self->_numMncDigits;
  *((_WORD *)v15 + 46) |= 0x200u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_25:
    if ((v14 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v15 + 12) = self->_mcc;
  *((_WORD *)v15 + 46) |= 0x80u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x100) == 0)
  {
LABEL_26:
    if ((v14 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_44:
  *((_DWORD *)v15 + 13) = self->_mnc;
  *((_WORD *)v15 + 46) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_27:
    *((unsigned char *)v15 + 89) = self->_fgAppActiveDuringCongestion;
    *((_WORD *)v15 + 46) |= 0x1000u;
  }
LABEL_28:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 46) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_durationSec;
  *((_WORD *)v5 + 46) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 9) = self->_lqmType;
  *((_WORD *)v5 + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_36:
  *((_DWORD *)v5 + 18) = self->_sysMode;
  *((_WORD *)v5 + 46) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 90) = self->_isScreenOn;
    *((_WORD *)v5 + 46) |= 0x2000u;
  }
LABEL_7:
  id v8 = [(RachConnInfo *)self->_rachConnInfo copyWithZone:a3];
  uint64_t v9 = (void *)v6[8];
  v6[8] = v8;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v10 = self->_lteChanInfos;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
        [v6 addLteChanInfo:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v12);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  __int16 v16 = self->_umtsChanInfos;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addUmtsChanInfo:v21];
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    *((unsigned char *)v6 + 88) = self->_bbInHiPowerState;
    *((_WORD *)v6 + 46) |= 0x800u;
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_23:
      if ((v22 & 0x4000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_40;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v6 + 7) = self->_hiPowerEvent;
  *((_WORD *)v6 + 46) |= 0x10u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x4000) == 0)
  {
LABEL_24:
    if ((v22 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v6 + 91) = self->_swimWorkoutActive;
  *((_WORD *)v6 + 46) |= 0x4000u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_25:
    if ((v22 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 8) = self->_hiPowerExitReason;
  *((_WORD *)v6 + 46) |= 0x20u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_26:
    if ((v22 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 5) = self->_congestionReason;
  *((_WORD *)v6 + 46) |= 4u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 2) == 0)
  {
LABEL_27:
    if ((v22 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 4) = self->_cellId;
  *((_WORD *)v6 + 46) |= 2u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_28:
    if ((v22 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 14) = self->_numMncDigits;
  *((_WORD *)v6 + 46) |= 0x200u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_29:
    if ((v22 & 0x100) == 0) {
      goto LABEL_30;
    }
LABEL_46:
    *((_DWORD *)v6 + 13) = self->_mnc;
    *((_WORD *)v6 + 46) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      return v6;
    }
    goto LABEL_31;
  }
LABEL_45:
  *((_DWORD *)v6 + 12) = self->_mcc;
  *((_WORD *)v6 + 46) |= 0x80u;
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0) {
    goto LABEL_46;
  }
LABEL_30:
  if ((v22 & 0x1000) != 0)
  {
LABEL_31:
    *((unsigned char *)v6 + 89) = self->_fgAppActiveDuringCongestion;
    *((_WORD *)v6 + 46) |= 0x1000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_90;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_90;
    }
  }
  else if (v6)
  {
    goto LABEL_90;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durationSec != *((_DWORD *)v4 + 6)) {
      goto LABEL_90;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lqmType != *((_DWORD *)v4 + 9)) {
      goto LABEL_90;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_sysMode != *((_DWORD *)v4 + 18)) {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x2000) == 0) {
      goto LABEL_90;
    }
    if (self->_isScreenOn)
    {
      if (!*((unsigned char *)v4 + 90)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 90))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x2000) != 0)
  {
    goto LABEL_90;
  }
  rachConnInfo = self->_rachConnInfo;
  if ((unint64_t)rachConnInfo | *((void *)v4 + 8) && !-[RachConnInfo isEqual:](rachConnInfo, "isEqual:")) {
    goto LABEL_90;
  }
  lteChanInfos = self->_lteChanInfos;
  if ((unint64_t)lteChanInfos | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lteChanInfos, "isEqual:")) {
      goto LABEL_90;
    }
  }
  umtsChanInfos = self->_umtsChanInfos;
  if ((unint64_t)umtsChanInfos | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](umtsChanInfos, "isEqual:")) {
      goto LABEL_90;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 46);
  if ((v10 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x800) == 0) {
      goto LABEL_90;
    }
    if (self->_bbInHiPowerState)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x800) != 0)
  {
    goto LABEL_90;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_hiPowerEvent != *((_DWORD *)v4 + 7)) {
      goto LABEL_90;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x4000) == 0) {
      goto LABEL_90;
    }
    if (self->_swimWorkoutActive)
    {
      if (!*((unsigned char *)v4 + 91)) {
        goto LABEL_90;
      }
    }
    else if (*((unsigned char *)v4 + 91))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x4000) != 0)
  {
    goto LABEL_90;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_hiPowerExitReason != *((_DWORD *)v4 + 8)) {
      goto LABEL_90;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_congestionReason != *((_DWORD *)v4 + 5)) {
      goto LABEL_90;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_90;
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4)) {
      goto LABEL_90;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 14)) {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_mcc != *((_DWORD *)v4 + 12)) {
      goto LABEL_90;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_mnc != *((_DWORD *)v4 + 13)) {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x1000) != 0)
    {
      if (self->_fgAppActiveDuringCongestion)
      {
        if (!*((unsigned char *)v4 + 89)) {
          goto LABEL_90;
        }
      }
      else if (*((unsigned char *)v4 + 89))
      {
        goto LABEL_90;
      }
      BOOL v12 = 1;
      goto LABEL_91;
    }
LABEL_90:
    BOOL v12 = 0;
    goto LABEL_91;
  }
  BOOL v12 = (v11 & 0x1000) == 0;
LABEL_91:

  return v12;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_durationSec;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_lqmType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_sysMode;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isScreenOn;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  unint64_t v9 = [(RachConnInfo *)self->_rachConnInfo hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_lteChanInfos hash];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_umtsChanInfos hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    uint64_t v13 = 2654435761 * self->_bbInHiPowerState;
    if ((v12 & 0x10) != 0)
    {
LABEL_14:
      uint64_t v14 = 2654435761 * self->_hiPowerEvent;
      if ((*(_WORD *)&self->_has & 0x4000) != 0) {
        goto LABEL_15;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 0x10) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_15:
    uint64_t v15 = 2654435761 * self->_swimWorkoutActive;
    if ((v12 & 0x20) != 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v15 = 0;
  if ((v12 & 0x20) != 0)
  {
LABEL_16:
    uint64_t v16 = 2654435761 * self->_hiPowerExitReason;
    if ((v12 & 4) != 0) {
      goto LABEL_17;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v16 = 0;
  if ((v12 & 4) != 0)
  {
LABEL_17:
    uint64_t v17 = 2654435761 * self->_congestionReason;
    if ((v12 & 2) != 0) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v17 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_18:
    uint64_t v18 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_19;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    uint64_t v19 = 2654435761 * self->_numMncDigits;
    if ((v12 & 0x80) != 0) {
      goto LABEL_20;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v19 = 0;
  if ((v12 & 0x80) != 0)
  {
LABEL_20:
    uint64_t v20 = 2654435761 * self->_mcc;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_21;
    }
LABEL_31:
    uint64_t v21 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_22;
    }
LABEL_32:
    uint64_t v22 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_30:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_31;
  }
LABEL_21:
  uint64_t v21 = 2654435761 * self->_mnc;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_32;
  }
LABEL_22:
  uint64_t v22 = 2654435761 * self->_fgAppActiveDuringCongestion;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 46);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_durationSec = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_lqmType = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x400) == 0)
  {
LABEL_5:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_sysMode = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 46) & 0x2000) != 0)
  {
LABEL_6:
    self->_isScreenOn = *((unsigned char *)v4 + 90);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_7:
  rachConnInfo = self->_rachConnInfo;
  uint64_t v8 = *((void *)v5 + 8);
  if (rachConnInfo)
  {
    if (v8) {
      -[RachConnInfo mergeFrom:](rachConnInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularLqmStateChange setRachConnInfo:](self, "setRachConnInfo:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = *((id *)v5 + 5);
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CellularLqmStateChange *)self addLteChanInfo:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = *((id *)v5 + 10);
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        -[CellularLqmStateChange addUmtsChanInfo:](self, "addUmtsChanInfo:", *(void *)(*((void *)&v20 + 1) + 8 * (void)j), (void)v20);
      }
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x800) != 0)
  {
    self->_bbInHiPowerState = *((unsigned char *)v5 + 88);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v19 = *((_WORD *)v5 + 46);
    if ((v19 & 0x10) == 0)
    {
LABEL_33:
      if ((v19 & 0x4000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_45;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_33;
  }
  self->_int hiPowerEvent = *((_DWORD *)v5 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x4000) == 0)
  {
LABEL_34:
    if ((v19 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_swimWorkoutActive = *((unsigned char *)v5 + 91);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x20) == 0)
  {
LABEL_35:
    if ((v19 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_int hiPowerExitReason = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 4) == 0)
  {
LABEL_36:
    if ((v19 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_int congestionReason = *((_DWORD *)v5 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 2) == 0)
  {
LABEL_37:
    if ((v19 & 0x200) == 0) {
      goto LABEL_38;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_cellId = *((_DWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x200) == 0)
  {
LABEL_38:
    if ((v19 & 0x80) == 0) {
      goto LABEL_39;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_numMncDigits = *((_DWORD *)v5 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x80) == 0)
  {
LABEL_39:
    if ((v19 & 0x100) == 0) {
      goto LABEL_40;
    }
LABEL_51:
    self->_mnc = *((_DWORD *)v5 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v5 + 46) & 0x1000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_50:
  self->_mcc = *((_DWORD *)v5 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x100) != 0) {
    goto LABEL_51;
  }
LABEL_40:
  if ((v19 & 0x1000) != 0)
  {
LABEL_41:
    self->_fgAppActiveDuringCongestion = *((unsigned char *)v5 + 89);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_42:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSec
{
  return self->_durationSec;
}

- (int)lqmType
{
  return self->_lqmType;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (RachConnInfo)rachConnInfo
{
  return self->_rachConnInfo;
}

- (void)setRachConnInfo:(id)a3
{
}

- (NSMutableArray)lteChanInfos
{
  return self->_lteChanInfos;
}

- (void)setLteChanInfos:(id)a3
{
}

- (NSMutableArray)umtsChanInfos
{
  return self->_umtsChanInfos;
}

- (void)setUmtsChanInfos:(id)a3
{
}

- (BOOL)bbInHiPowerState
{
  return self->_bbInHiPowerState;
}

- (BOOL)swimWorkoutActive
{
  return self->_swimWorkoutActive;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (BOOL)fgAppActiveDuringCongestion
{
  return self->_fgAppActiveDuringCongestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_umtsChanInfos, 0);
  objc_storeStrong((id *)&self->_rachConnInfo, 0);

  objc_storeStrong((id *)&self->_lteChanInfos, 0);
}

@end