@interface CellularCallEndDetails
+ (Class)capEventType;
+ (Class)rfMeasInfoType;
- (BOOL)accessoryAttached;
- (BOOL)connected;
- (BOOL)established;
- (BOOL)fb;
- (BOOL)hasAccessoryAttached;
- (BOOL)hasAntenna;
- (BOOL)hasBand;
- (BOOL)hasBaseId;
- (BOOL)hasCallDuration;
- (BOOL)hasCallEvent;
- (BOOL)hasCallId;
- (BOOL)hasCallState;
- (BOOL)hasCallType;
- (BOOL)hasCcCause;
- (BOOL)hasCellId;
- (BOOL)hasCoexPolicy;
- (BOOL)hasConnected;
- (BOOL)hasDirection;
- (BOOL)hasEcioDbx2;
- (BOOL)hasEndStatus;
- (BOOL)hasEstablished;
- (BOOL)hasFb;
- (BOOL)hasHoType;
- (BOOL)hasHstState;
- (BOOL)hasIsSrvccSuccess;
- (BOOL)hasLac;
- (BOOL)hasLastMotionState;
- (BOOL)hasLteCellId;
- (BOOL)hasLteLac;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasMrabEnd;
- (BOOL)hasMrabEver;
- (BOOL)hasMsFbToSetup;
- (BOOL)hasMsOrigToConf;
- (BOOL)hasMsOrigToEnd;
- (BOOL)hasMsOrigToFb;
- (BOOL)hasMsPageToSetup;
- (BOOL)hasMsSetupToEnd;
- (BOOL)hasMsSinceLastMotionState;
- (BOOL)hasMsStartToAlert;
- (BOOL)hasNumSubs;
- (BOOL)hasPsPref;
- (BOOL)hasPsc;
- (BOOL)hasQmiReleaseCause;
- (BOOL)hasRfChannel;
- (BOOL)hasRrcRelCause;
- (BOOL)hasRssiDbm;
- (BOOL)hasSensorEndToPresentMs;
- (BOOL)hasSensorUseDuringLastCallMs;
- (BOOL)hasSetupDirection;
- (BOOL)hasSetupSysMode;
- (BOOL)hasSid;
- (BOOL)hasSl;
- (BOOL)hasSl2;
- (BOOL)hasSrvType;
- (BOOL)hasSrvccFailureCause;
- (BOOL)hasSrvccTargetRat;
- (BOOL)hasSubsId;
- (BOOL)hasSysMode;
- (BOOL)hasTimestamp;
- (BOOL)hasTransId;
- (BOOL)hasTsAccuracyHour;
- (BOOL)hasTtyMode;
- (BOOL)hasTxPwrDbm;
- (BOOL)hasVersion;
- (BOOL)hasZoneId;
- (BOOL)isEqual:(id)a3;
- (BOOL)mrabEnd;
- (BOOL)mrabEver;
- (BOOL)readFrom:(id)a3;
- (BOOL)sl;
- (BOOL)sl2;
- (NSMutableArray)capEvents;
- (NSMutableArray)rfMeasInfos;
- (NSString)transId;
- (id)antennaAsString:(int)a3;
- (id)bandAsString:(int)a3;
- (id)callEventAsString:(int)a3;
- (id)callStateAsString:(int)a3;
- (id)callTypeAsString:(int)a3;
- (id)capEventAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionAsString:(int)a3;
- (id)rfMeasInfoAtIndex:(unint64_t)a3;
- (id)setupDirectionAsString:(int)a3;
- (id)setupSysModeAsString:(int)a3;
- (id)srvTypeAsString:(int)a3;
- (id)srvccTargetRatAsString:(int)a3;
- (id)sysModeAsString:(int)a3;
- (int)StringAsAntenna:(id)a3;
- (int)StringAsBand:(id)a3;
- (int)StringAsCallEvent:(id)a3;
- (int)StringAsCallState:(id)a3;
- (int)StringAsCallType:(id)a3;
- (int)StringAsDirection:(id)a3;
- (int)StringAsSetupDirection:(id)a3;
- (int)StringAsSetupSysMode:(id)a3;
- (int)StringAsSrvType:(id)a3;
- (int)StringAsSrvccTargetRat:(id)a3;
- (int)StringAsSysMode:(id)a3;
- (int)antenna;
- (int)band;
- (int)callDuration;
- (int)callEvent;
- (int)callState;
- (int)callType;
- (int)direction;
- (int)ecioDbx2;
- (int)endStatus;
- (int)qmiReleaseCause;
- (int)rssiDbm;
- (int)setupDirection;
- (int)setupSysMode;
- (int)srvType;
- (int)srvccTargetRat;
- (int)sysMode;
- (int)txPwrDbm;
- (unint64_t)capEventsCount;
- (unint64_t)hash;
- (unint64_t)rfMeasInfosCount;
- (unint64_t)timestamp;
- (unsigned)baseId;
- (unsigned)callId;
- (unsigned)ccCause;
- (unsigned)cellId;
- (unsigned)coexPolicy;
- (unsigned)hoType;
- (unsigned)hstState;
- (unsigned)isSrvccSuccess;
- (unsigned)lac;
- (unsigned)lastMotionState;
- (unsigned)lteCellId;
- (unsigned)lteLac;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)msFbToSetup;
- (unsigned)msOrigToConf;
- (unsigned)msOrigToEnd;
- (unsigned)msOrigToFb;
- (unsigned)msPageToSetup;
- (unsigned)msSetupToEnd;
- (unsigned)msSinceLastMotionState;
- (unsigned)msStartToAlert;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)psc;
- (unsigned)rfChannel;
- (unsigned)rrcRelCause;
- (unsigned)sensorEndToPresentMs;
- (unsigned)sensorUseDuringLastCallMs;
- (unsigned)sid;
- (unsigned)srvccFailureCause;
- (unsigned)subsId;
- (unsigned)tsAccuracyHour;
- (unsigned)ttyMode;
- (unsigned)version;
- (unsigned)zoneId;
- (void)addCapEvent:(id)a3;
- (void)addRfMeasInfo:(id)a3;
- (void)clearCapEvents;
- (void)clearRfMeasInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryAttached:(BOOL)a3;
- (void)setAntenna:(int)a3;
- (void)setBand:(int)a3;
- (void)setBaseId:(unsigned int)a3;
- (void)setCallDuration:(int)a3;
- (void)setCallEvent:(int)a3;
- (void)setCallId:(unsigned int)a3;
- (void)setCallState:(int)a3;
- (void)setCallType:(int)a3;
- (void)setCapEvents:(id)a3;
- (void)setCcCause:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCoexPolicy:(unsigned int)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDirection:(int)a3;
- (void)setEcioDbx2:(int)a3;
- (void)setEndStatus:(int)a3;
- (void)setEstablished:(BOOL)a3;
- (void)setFb:(BOOL)a3;
- (void)setHasAccessoryAttached:(BOOL)a3;
- (void)setHasAntenna:(BOOL)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBaseId:(BOOL)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasCallEvent:(BOOL)a3;
- (void)setHasCallId:(BOOL)a3;
- (void)setHasCallState:(BOOL)a3;
- (void)setHasCallType:(BOOL)a3;
- (void)setHasCcCause:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCoexPolicy:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasDirection:(BOOL)a3;
- (void)setHasEcioDbx2:(BOOL)a3;
- (void)setHasEndStatus:(BOOL)a3;
- (void)setHasEstablished:(BOOL)a3;
- (void)setHasFb:(BOOL)a3;
- (void)setHasHoType:(BOOL)a3;
- (void)setHasHstState:(BOOL)a3;
- (void)setHasIsSrvccSuccess:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasLastMotionState:(BOOL)a3;
- (void)setHasLteCellId:(BOOL)a3;
- (void)setHasLteLac:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasMrabEnd:(BOOL)a3;
- (void)setHasMrabEver:(BOOL)a3;
- (void)setHasMsFbToSetup:(BOOL)a3;
- (void)setHasMsOrigToConf:(BOOL)a3;
- (void)setHasMsOrigToEnd:(BOOL)a3;
- (void)setHasMsOrigToFb:(BOOL)a3;
- (void)setHasMsPageToSetup:(BOOL)a3;
- (void)setHasMsSetupToEnd:(BOOL)a3;
- (void)setHasMsSinceLastMotionState:(BOOL)a3;
- (void)setHasMsStartToAlert:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasQmiReleaseCause:(BOOL)a3;
- (void)setHasRfChannel:(BOOL)a3;
- (void)setHasRrcRelCause:(BOOL)a3;
- (void)setHasRssiDbm:(BOOL)a3;
- (void)setHasSensorEndToPresentMs:(BOOL)a3;
- (void)setHasSensorUseDuringLastCallMs:(BOOL)a3;
- (void)setHasSetupDirection:(BOOL)a3;
- (void)setHasSetupSysMode:(BOOL)a3;
- (void)setHasSid:(BOOL)a3;
- (void)setHasSl2:(BOOL)a3;
- (void)setHasSl:(BOOL)a3;
- (void)setHasSrvType:(BOOL)a3;
- (void)setHasSrvccFailureCause:(BOOL)a3;
- (void)setHasSrvccTargetRat:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTsAccuracyHour:(BOOL)a3;
- (void)setHasTtyMode:(BOOL)a3;
- (void)setHasTxPwrDbm:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasZoneId:(BOOL)a3;
- (void)setHoType:(unsigned int)a3;
- (void)setHstState:(unsigned int)a3;
- (void)setIsSrvccSuccess:(unsigned int)a3;
- (void)setLac:(unsigned int)a3;
- (void)setLastMotionState:(unsigned int)a3;
- (void)setLteCellId:(unsigned int)a3;
- (void)setLteLac:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setMrabEnd:(BOOL)a3;
- (void)setMrabEver:(BOOL)a3;
- (void)setMsFbToSetup:(unsigned int)a3;
- (void)setMsOrigToConf:(unsigned int)a3;
- (void)setMsOrigToEnd:(unsigned int)a3;
- (void)setMsOrigToFb:(unsigned int)a3;
- (void)setMsPageToSetup:(unsigned int)a3;
- (void)setMsSetupToEnd:(unsigned int)a3;
- (void)setMsSinceLastMotionState:(unsigned int)a3;
- (void)setMsStartToAlert:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setPsc:(unsigned int)a3;
- (void)setQmiReleaseCause:(int)a3;
- (void)setRfChannel:(unsigned int)a3;
- (void)setRfMeasInfos:(id)a3;
- (void)setRrcRelCause:(unsigned int)a3;
- (void)setRssiDbm:(int)a3;
- (void)setSensorEndToPresentMs:(unsigned int)a3;
- (void)setSensorUseDuringLastCallMs:(unsigned int)a3;
- (void)setSetupDirection:(int)a3;
- (void)setSetupSysMode:(int)a3;
- (void)setSid:(unsigned int)a3;
- (void)setSl2:(BOOL)a3;
- (void)setSl:(BOOL)a3;
- (void)setSrvType:(int)a3;
- (void)setSrvccFailureCause:(unsigned int)a3;
- (void)setSrvccTargetRat:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setSysMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTransId:(id)a3;
- (void)setTsAccuracyHour:(unsigned int)a3;
- (void)setTtyMode:(unsigned int)a3;
- (void)setTxPwrDbm:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setZoneId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularCallEndDetails

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)callEvent
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_callEvent;
  }
  else {
    return 0;
  }
}

- (void)setCallEvent:(int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_callEvent = a3;
}

- (void)setHasCallEvent:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCallEvent
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)callEventAsString:(int)a3
{
  if (a3 <= 26)
  {
    v4 = @"CM_CALL_EVENT_ORIG";
    switch(a3)
    {
      case 0:
        goto LABEL_50;
      case 1:
        v4 = @"CM_CALL_EVENT_ANSWER";
        break;
      case 2:
        v4 = @"CM_CALL_EVENT_END_REQ";
        break;
      case 3:
        v4 = @"CM_CALL_EVENT_END";
        break;
      case 4:
        v4 = @"CM_CALL_EVENT_SUPS";
        break;
      case 5:
        v4 = @"CM_CALL_EVENT_INCOM";
        break;
      case 6:
        v4 = @"CM_CALL_EVENT_CONNECT";
        break;
      case 11:
        v4 = @"CM_CALL_EVENT_ABRV_ALERT";
        break;
      default:
        goto LABEL_49;
    }
    return v4;
  }
  if (a3 > 110)
  {
    switch(a3)
    {
      case 'o':
        v4 = @"CM_CALL_EVENT_HO_COMPLETE";
        break;
      case 'p':
        v4 = @"CM_CALL_EVENT_MT_CALL_PAGE_FAIL";
        break;
      case 'u':
        v4 = @"CM_CALL_EVENT_ALERT";
        break;
      default:
        goto LABEL_49;
    }
  }
  else
  {
    switch(a3)
    {
      case 27:
        v4 = @"CM_CALL_EVENT_SETUP_IND";
        break;
      case 29:
        v4 = @"CM_CALL_EVENT_CALL_CONF";
        break;
      case 56:
        v4 = @"CM_CALL_EVENT_ALERTING";
        return v4;
      default:
LABEL_49:
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_50:
        return v4;
    }
  }
  return v4;
}

- (int)StringAsCallEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_CALL_EVENT_ORIG"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_ANSWER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_END_REQ"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_END"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_SUPS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_INCOM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_CONNECT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_ABRV_ALERT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_SETUP_IND"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_CALL_CONF"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_ALERTING"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_HO_COMPLETE"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_MT_CALL_PAGE_FAIL"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"CM_CALL_EVENT_ALERT"])
  {
    int v4 = 117;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCallId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_callId = a3;
}

- (void)setHasCallId:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCallId
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)direction
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_direction;
  }
  else {
    return 0;
  }
}

- (void)setDirection:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDirection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)directionAsString:(int)a3
{
  if (a3 >= 3)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002871B0 + a3);
  }

  return v3;
}

- (int)StringAsDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_CALL_DIRECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_CALL_DIRECTION_MO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_DIRECTION_MT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)srvType
{
  if ((*((unsigned char *)&self->_has + 5) & 0x10) != 0) {
    return self->_srvType;
  }
  else {
    return -1;
  }
}

- (void)setSrvType:(int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_srvType = a3;
}

- (void)setHasSrvType:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvType
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (id)srvTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0x18)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100286F90 + a3 + 1);
  }

  return v3;
}

- (int)StringAsSrvType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_SRV_TYPE_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_LTE_V2"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_HDR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_CDMA_SPECIFIC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_CDMA_AUTOMATIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_AUTOMATIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_CDMA_HDR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_GSM_WCDMA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_WCDMA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_GSM"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_WLAN"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_NON_AUTOMATIC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_LTE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_GSM_WCDMA_LTE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_HDR_MORE_PREF"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS_GSM"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS_GSM_LTE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS_GSM_WCDMA_LTE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS_GSM_WCDMA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_UMTS_LTE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_CS_ONLY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_PS_ONLY"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"CM_SRV_TYPE_MAX"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (int)sysMode
{
  if (*((unsigned char *)&self->_has + 6)) {
    return self->_sysMode;
  }
  else {
    return 0;
  }
}

- (void)setSysMode:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSysMode
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (id)sysModeAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    uint64_t v3 = *(&off_100287130 + a3);
  }
  else
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsSysMode:(id)a3
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

- (int)callState
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_callState;
  }
  else {
    return 0;
  }
}

- (void)setCallState:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_callState = a3;
}

- (void)setHasCallState:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCallState
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)callStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100287050 + a3);
  }

  return v3;
}

- (int)StringAsCallState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_CALL_STATE_IDLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_CALL_STATE_ORIG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_STATE_INCOM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CM_CALL_STATE_CONV"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CM_CALL_STATE_CC_IN_PROGRESS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CM_CALL_STATE_RECALL_RSP_PEND"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEndStatus:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_endStatus = a3;
}

- (void)setHasEndStatus:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasEndStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCcCause:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_ccCause = a3;
}

- (void)setHasCcCause:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCcCause
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setQmiReleaseCause:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_qmiReleaseCause = a3;
}

- (void)setHasQmiReleaseCause:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasQmiReleaseCause
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCallDuration:(int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCallDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)antenna
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_antenna;
  }
  else {
    return 0;
  }
}

- (void)setAntenna:(int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAntenna
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 4)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100287080 + a3);
  }

  return v3;
}

- (int)StringAsAntenna:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ARTD_ANT0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTD_ANT1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ARTD_ANT2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARTD_ANT3"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)callType
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_callType;
  }
  else {
    return -1;
  }
}

- (void)setCallType:(int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_callType = a3;
}

- (void)setHasCallType:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCallType
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)callTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0x12)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002870A0 + a3 + 1);
  }

  return v3;
}

- (int)StringAsCallType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_CALL_TYPE_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_VOICE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_CS_DATA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_PS_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_SMS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_PD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_TEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_OTAPA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_STD_OTASP"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_NON_STD_OTASP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_EMERGENCY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_SUPS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_VT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_VT_LOOPBACK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_VS"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_PS_DATA_IS707B"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_UNKNOWN"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CM_CALL_TYPE_MAX"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setEstablished:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_established = a3;
}

- (void)setHasEstablished:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasEstablished
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setConnected:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasConnected
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setLteCellId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_lteCellId = a3;
}

- (void)setHasLteCellId:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasLteCellId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setZoneId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_zoneId = a3;
}

- (void)setHasZoneId:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasZoneId
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setBaseId:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_baseId = a3;
}

- (void)setHasBaseId:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBaseId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLteLac:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_lteLac = a3;
}

- (void)setHasLteLac:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasLteLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSid:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSid
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMnc
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLac:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMrabEver:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_mrabEver = a3;
}

- (void)setHasMrabEver:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasMrabEver
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setMrabEnd:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_mrabEnd = a3;
}

- (void)setHasMrabEnd:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasMrabEnd
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (int)band
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_band;
  }
  else {
    return 0;
  }
}

- (void)setBand:(int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBand
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)bandAsString:(int)a3
{
  int v4 = @"SYS_BAND_BC0";
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      int v4 = @"SYS_BAND_BC1";
      break;
    case 3:
      int v4 = @"SYS_BAND_BC3";
      break;
    case 4:
      int v4 = @"SYS_BAND_BC4";
      break;
    case 5:
      int v4 = @"SYS_BAND_BC5";
      break;
    case 6:
      int v4 = @"SYS_BAND_BC6";
      break;
    case 7:
      int v4 = @"SYS_BAND_BC7";
      break;
    case 8:
      int v4 = @"SYS_BAND_BC8";
      break;
    case 9:
      int v4 = @"SYS_BAND_BC9";
      break;
    case 10:
      int v4 = @"SYS_BAND_BC10";
      break;
    case 11:
      int v4 = @"SYS_BAND_BC11";
      break;
    case 12:
      int v4 = @"SYS_BAND_BC12";
      break;
    case 13:
      int v4 = @"SYS_BAND_BC13";
      break;
    case 14:
      int v4 = @"SYS_BAND_BC14";
      break;
    case 15:
      int v4 = @"SYS_BAND_BC15";
      break;
    case 16:
      int v4 = @"SYS_BAND_BC16";
      break;
    case 17:
      int v4 = @"SYS_BAND_BC17";
      break;
    case 18:
      int v4 = @"SYS_BAND_BC18";
      break;
    case 19:
      int v4 = @"SYS_BAND_BC19";
      break;
    case 40:
      int v4 = @"SYS_BAND_GSM_450";
      break;
    case 41:
      int v4 = @"SYS_BAND_GSM_480";
      break;
    case 42:
      int v4 = @"SYS_BAND_GSM_750";
      break;
    case 43:
      int v4 = @"SYS_BAND_GSM_850";
      break;
    case 44:
      int v4 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 45:
      int v4 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 46:
      int v4 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 47:
      int v4 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 48:
      int v4 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 80:
      int v4 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 81:
      int v4 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 82:
      int v4 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 83:
      int v4 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 84:
      int v4 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 85:
      int v4 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 86:
      int v4 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 87:
      int v4 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 88:
      int v4 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 90:
      int v4 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 91:
      int v4 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 120:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 121:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 122:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 123:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 124:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 125:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 126:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 127:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 128:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 129:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 130:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 131:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 132:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 133:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 136:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 137:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 138:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 139:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 140:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 143:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 144:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 145:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 152:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 153:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 154:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 155:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 156:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 157:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 158:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 159:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 160:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 161:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 162:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 163:
      int v4 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 164:
      int v4 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 165:
      int v4 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 166:
      int v4 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 167:
      int v4 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 168:
      int v4 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_6:
      break;
  }
  return v4;
}

- (int)StringAsBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_BAND_BC0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC6"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC7"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC8"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC9"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC10"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC11"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC12"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC13"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC14"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC15"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC16"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC17"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC18"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC19"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_450"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_480"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_750"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_850"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_EGSM_900"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PGSM_900"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_RGSM_900"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_DCS_1800"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PCS_1900"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_I_IMT_2000"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_II_PCS_1900"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_III_1700"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IV_1700"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_V_850"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VI_800"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VII_2600"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VIII_900"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IX_1700"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XI_1500"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XIX_850"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND1"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND2"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND3"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND4"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND5"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND6"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND7"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND8"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND9"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND10"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND11"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND12"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND13"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND14"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND17"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND18"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND19"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND20"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND21"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND24"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND25"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND26"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND33"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND34"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND35"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND36"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND37"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND38"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND39"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND40"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND41"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND42"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND43"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND1"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND2"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND3"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND4"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND5"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND6"])
  {
    int v4 = 168;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setRfChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_rfChannel = a3;
}

- (void)setHasRfChannel:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRfChannel
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPsc
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTtyMode:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_ttyMode = a3;
}

- (void)setHasTtyMode:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTtyMode
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setTsAccuracyHour:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_tsAccuracyHour = a3;
}

- (void)setHasTsAccuracyHour:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTsAccuracyHour
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setAccessoryAttached:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_accessoryAttached = a3;
}

- (void)setHasAccessoryAttached:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasAccessoryAttached
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (int)setupSysMode
{
  if ((*((unsigned char *)&self->_has + 5) & 4) != 0) {
    return self->_setupSysMode;
  }
  else {
    return 0;
  }
}

- (void)setSetupSysMode:(int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_setupSysMode = a3;
}

- (void)setHasSetupSysMode:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSetupSysMode
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (id)setupSysModeAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    uint64_t v3 = *(&off_100287130 + a3);
  }
  else
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsSetupSysMode:(id)a3
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

- (int)setupDirection
{
  if ((*((unsigned char *)&self->_has + 5) & 2) != 0) {
    return self->_setupDirection;
  }
  else {
    return 0;
  }
}

- (void)setSetupDirection:(int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_setupDirection = a3;
}

- (void)setHasSetupDirection:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSetupDirection
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (id)setupDirectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002871B0 + a3);
  }

  return v3;
}

- (int)StringAsSetupDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CM_CALL_DIRECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CM_CALL_DIRECTION_MO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CM_CALL_DIRECTION_MT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSl2:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_sl2 = a3;
}

- (void)setHasSl2:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSl2
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setCoexPolicy:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_coexPolicy = a3;
}

- (void)setHasCoexPolicy:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCoexPolicy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSl:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_sl = a3;
}

- (void)setHasSl:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSl
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setFb:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_fb = a3;
}

- (void)setHasFb:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFb
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setMsOrigToFb:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_msOrigToFb = a3;
}

- (void)setHasMsOrigToFb:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMsOrigToFb
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMsOrigToConf:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_msOrigToConf = a3;
}

- (void)setHasMsOrigToConf:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasMsOrigToConf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMsOrigToEnd:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_msOrigToEnd = a3;
}

- (void)setHasMsOrigToEnd:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMsOrigToEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMsStartToAlert:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_msStartToAlert = a3;
}

- (void)setHasMsStartToAlert:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMsStartToAlert
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMsFbToSetup:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_msFbToSetup = a3;
}

- (void)setHasMsFbToSetup:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMsFbToSetup
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setMsPageToSetup:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_msPageToSetup = a3;
}

- (void)setHasMsPageToSetup:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMsPageToSetup
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMsSetupToEnd:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_msSetupToEnd = a3;
}

- (void)setHasMsSetupToEnd:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMsSetupToEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setEcioDbx2:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_ecioDbx2 = a3;
}

- (void)setHasEcioDbx2:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasEcioDbx2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRssiDbm:(int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_rssiDbm = a3;
}

- (void)setHasRssiDbm:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasRssiDbm
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTxPwrDbm:(int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_txPwrDbm = a3;
}

- (void)setHasTxPwrDbm:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxPwrDbm
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setSensorUseDuringLastCallMs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_sensorUseDuringLastCallMs = a3;
}

- (void)setHasSensorUseDuringLastCallMs:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasSensorUseDuringLastCallMs
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setSensorEndToPresentMs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_sensorEndToPresentMs = a3;
}

- (void)setHasSensorEndToPresentMs:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasSensorEndToPresentMs
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)clearCapEvents
{
}

- (void)addCapEvent:(id)a3
{
  id v4 = a3;
  capEvents = self->_capEvents;
  id v8 = v4;
  if (!capEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_capEvents;
    self->_capEvents = v6;

    id v4 = v8;
    capEvents = self->_capEvents;
  }
  [(NSMutableArray *)capEvents addObject:v4];
}

- (unint64_t)capEventsCount
{
  return (unint64_t)[(NSMutableArray *)self->_capEvents count];
}

- (id)capEventAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_capEvents objectAtIndex:a3];
}

+ (Class)capEventType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  uint64_t v3 = &_mh_execute_header;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasNumSubs
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHoType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_hoType = a3;
}

- (void)setHasHoType:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasHoType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHstState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_hstState = a3;
}

- (void)setHasHstState:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHstState
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRrcRelCause:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_rrcRelCause = a3;
}

- (void)setHasRrcRelCause:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasRrcRelCause
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)clearRfMeasInfos
{
}

- (void)addRfMeasInfo:(id)a3
{
  id v4 = a3;
  rfMeasInfos = self->_rfMeasInfos;
  id v8 = v4;
  if (!rfMeasInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rfMeasInfos;
    self->_rfMeasInfos = v6;

    id v4 = v8;
    rfMeasInfos = self->_rfMeasInfos;
  }
  [(NSMutableArray *)rfMeasInfos addObject:v4];
}

- (unint64_t)rfMeasInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_rfMeasInfos count];
}

- (id)rfMeasInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_rfMeasInfos objectAtIndex:a3];
}

+ (Class)rfMeasInfoType
{
  return (Class)objc_opt_class();
}

- (void)setIsSrvccSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_isSrvccSuccess = a3;
}

- (void)setHasIsSrvccSuccess:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasIsSrvccSuccess
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)srvccTargetRat
{
  if ((*((unsigned char *)&self->_has + 5) & 0x40) != 0) {
    return self->_srvccTargetRat;
  }
  else {
    return 0;
  }
}

- (void)setSrvccTargetRat:(int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_srvccTargetRat = a3;
}

- (void)setHasSrvccTargetRat:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvccTargetRat
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (id)srvccTargetRatAsString:(int)a3
{
  if (a3 >= 5)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002871C8 + a3);
  }

  return v3;
}

- (int)StringAsSrvccTargetRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_RAT_GSM"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_UMTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_TDS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_NR5G"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSrvccFailureCause:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_srvccFailureCause = a3;
}

- (void)setHasSrvccFailureCause:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvccFailureCause
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setLastMotionState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_lastMotionState = a3;
}

- (void)setHasLastMotionState:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasLastMotionState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMsSinceLastMotionState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_msSinceLastMotionState = a3;
}

- (void)setHasMsSinceLastMotionState:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMsSinceLastMotionState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasTransId
{
  return self->_transId != 0;
}

- (void)setVersion:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCallEndDetails;
  uint64_t v3 = [(CellularCallEndDetails *)&v7 description];
  int v4 = [(CellularCallEndDetails *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if (*(unsigned char *)&has)
  {
    v28 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v28 forKey:@"timestamp"];

    $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_127;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  int callEvent = self->_callEvent;
  if (callEvent > 26)
  {
    if (callEvent > 110)
    {
      switch(callEvent)
      {
        case 'o':
          v30 = @"CM_CALL_EVENT_HO_COMPLETE";
          goto LABEL_126;
        case 'p':
          v30 = @"CM_CALL_EVENT_MT_CALL_PAGE_FAIL";
          goto LABEL_126;
        case 'u':
          v30 = @"CM_CALL_EVENT_ALERT";
          goto LABEL_126;
      }
    }
    else
    {
      switch(callEvent)
      {
        case 27:
          v30 = @"CM_CALL_EVENT_SETUP_IND";
          goto LABEL_126;
        case 29:
          v30 = @"CM_CALL_EVENT_CALL_CONF";
          goto LABEL_126;
        case 56:
          v30 = @"CM_CALL_EVENT_ALERTING";
          goto LABEL_126;
      }
    }
LABEL_125:
    v30 = +[NSString stringWithFormat:@"(unknown: %i)", self->_callEvent];
  }
  else
  {
    v30 = @"CM_CALL_EVENT_ORIG";
    switch(callEvent)
    {
      case 0:
        break;
      case 1:
        v30 = @"CM_CALL_EVENT_ANSWER";
        break;
      case 2:
        v30 = @"CM_CALL_EVENT_END_REQ";
        break;
      case 3:
        v30 = @"CM_CALL_EVENT_END";
        break;
      case 4:
        v30 = @"CM_CALL_EVENT_SUPS";
        break;
      case 5:
        v30 = @"CM_CALL_EVENT_INCOM";
        break;
      case 6:
        v30 = @"CM_CALL_EVENT_CONNECT";
        break;
      case 11:
        v30 = @"CM_CALL_EVENT_ABRV_ALERT";
        break;
      default:
        goto LABEL_125;
    }
  }
LABEL_126:
  [v3 setObject:v30 forKey:@"call_event"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_128;
  }
LABEL_127:
  v41 = +[NSNumber numberWithUnsignedInt:self->_callId];
  [v3 setObject:v41 forKey:@"call_id"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_132;
  }
LABEL_128:
  uint64_t direction = self->_direction;
  if (direction >= 3)
  {
    v43 = +[NSString stringWithFormat:@"(unknown: %i)", self->_direction];
  }
  else
  {
    v43 = *(&off_1002871B0 + direction);
  }
  [v3 setObject:v43 forKey:@"direction"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_136;
  }
LABEL_132:
  int v44 = self->_srvType + 1;
  if (v44 >= 0x18)
  {
    v45 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvType];
  }
  else
  {
    v45 = *(&off_100286F90 + v44);
  }
  [v3 setObject:v45 forKey:@"srv_type"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_141;
  }
LABEL_136:
  uint64_t sysMode = self->_sysMode;
  if sysMode < 0x10 && ((0x9FFFu >> sysMode))
  {
    v47 = *(&off_100287130 + sysMode);
  }
  else
  {
    v47 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sysMode];
  }
  [v3 setObject:v47 forKey:@"sys_mode"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_145;
  }
LABEL_141:
  uint64_t callState = self->_callState;
  if (callState >= 6)
  {
    v49 = +[NSString stringWithFormat:@"(unknown: %i)", self->_callState];
  }
  else
  {
    v49 = *(&off_100287050 + callState);
  }
  [v3 setObject:v49 forKey:@"call_state"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_146;
  }
LABEL_145:
  v50 = +[NSNumber numberWithInt:self->_endStatus];
  [v3 setObject:v50 forKey:@"end_status"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_147;
  }
LABEL_146:
  v51 = +[NSNumber numberWithUnsignedInt:self->_ccCause];
  [v3 setObject:v51 forKey:@"cc_cause"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_148;
  }
LABEL_147:
  v52 = +[NSNumber numberWithInt:self->_qmiReleaseCause];
  [v3 setObject:v52 forKey:@"qmi_release_cause"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_149;
  }
LABEL_148:
  v53 = +[NSNumber numberWithInt:self->_callDuration];
  [v3 setObject:v53 forKey:@"call_duration"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_153;
  }
LABEL_149:
  uint64_t antenna = self->_antenna;
  if (antenna >= 4)
  {
    v55 = +[NSString stringWithFormat:@"(unknown: %i)", self->_antenna];
  }
  else
  {
    v55 = *(&off_100287080 + antenna);
  }
  [v3 setObject:v55 forKey:@"antenna"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x100000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_157;
  }
LABEL_153:
  int v56 = self->_callType + 1;
  if (v56 >= 0x12)
  {
    v57 = +[NSString stringWithFormat:@"(unknown: %i)", self->_callType];
  }
  else
  {
    v57 = *(&off_1002870A0 + v56);
  }
  [v3 setObject:v57 forKey:@"call_type"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_158;
  }
LABEL_157:
  v58 = +[NSNumber numberWithBool:self->_established];
  [v3 setObject:v58 forKey:@"established"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_159;
  }
LABEL_158:
  v59 = +[NSNumber numberWithBool:self->_connected];
  [v3 setObject:v59 forKey:@"connected"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_160;
  }
LABEL_159:
  v60 = +[NSNumber numberWithUnsignedInt:self->_lteCellId];
  [v3 setObject:v60 forKey:@"lte_cell_id"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x20000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_161;
  }
LABEL_160:
  v61 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v61 forKey:@"cell_id"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_162;
  }
LABEL_161:
  v62 = +[NSNumber numberWithUnsignedInt:self->_zoneId];
  [v3 setObject:v62 forKey:@"zone_id"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_163;
  }
LABEL_162:
  v63 = +[NSNumber numberWithUnsignedInt:self->_baseId];
  [v3 setObject:v63 forKey:@"base_id"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_164;
  }
LABEL_163:
  v64 = +[NSNumber numberWithUnsignedInt:self->_lteLac];
  [v3 setObject:v64 forKey:@"lte_lac"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_165;
  }
LABEL_164:
  v65 = +[NSNumber numberWithUnsignedInt:self->_sid];
  [v3 setObject:v65 forKey:@"sid"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_166;
  }
LABEL_165:
  v66 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v66 forKey:@"mcc"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_167;
  }
LABEL_166:
  v67 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v67 forKey:@"mnc"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_168;
  }
LABEL_167:
  v68 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v68 forKey:@"lac"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x400000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_169;
  }
LABEL_168:
  v69 = +[NSNumber numberWithBool:self->_mrabEver];
  [v3 setObject:v69 forKey:@"mrab_ever"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_170;
  }
LABEL_169:
  v70 = +[NSNumber numberWithBool:self->_mrabEnd];
  [v3 setObject:v70 forKey:@"mrab_end"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_250;
  }
LABEL_170:
  v71 = @"SYS_BAND_BC0";
  switch(self->_band)
  {
    case 0:
      break;
    case 1:
      v71 = @"SYS_BAND_BC1";
      break;
    case 3:
      v71 = @"SYS_BAND_BC3";
      break;
    case 4:
      v71 = @"SYS_BAND_BC4";
      break;
    case 5:
      v71 = @"SYS_BAND_BC5";
      break;
    case 6:
      v71 = @"SYS_BAND_BC6";
      break;
    case 7:
      v71 = @"SYS_BAND_BC7";
      break;
    case 8:
      v71 = @"SYS_BAND_BC8";
      break;
    case 9:
      v71 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v71 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v71 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v71 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v71 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v71 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v71 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v71 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v71 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v71 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v71 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v71 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v71 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v71 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v71 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v71 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v71 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v71 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v71 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v71 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v71 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v71 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v71 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v71 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v71 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v71 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v71 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v71 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v71 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v71 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v71 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v71 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v71 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v71 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v71 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v71 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v71 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v71 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v71 = +[NSString stringWithFormat:@"(unknown: %i)", self->_band];
      break;
  }
  [v3 setObject:v71 forKey:@"band"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_251;
  }
LABEL_250:
  v72 = +[NSNumber numberWithUnsignedInt:self->_rfChannel];
  [v3 setObject:v72 forKey:@"rf_channel"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_252;
  }
LABEL_251:
  v73 = +[NSNumber numberWithUnsignedInt:self->_psc];
  [v3 setObject:v73 forKey:@"psc"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_253;
  }
LABEL_252:
  v74 = +[NSNumber numberWithUnsignedInt:self->_ttyMode];
  [v3 setObject:v74 forKey:@"tty_mode"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_254;
  }
LABEL_253:
  v75 = +[NSNumber numberWithUnsignedInt:self->_tsAccuracyHour];
  [v3 setObject:v75 forKey:@"ts_accuracy_hour"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_255;
  }
LABEL_254:
  v76 = +[NSNumber numberWithBool:self->_accessoryAttached];
  [v3 setObject:v76 forKey:@"accessory_attached"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_260;
  }
LABEL_255:
  uint64_t setupSysMode = self->_setupSysMode;
  if setupSysMode < 0x10 && ((0x9FFFu >> setupSysMode))
  {
    v78 = *(&off_100287130 + setupSysMode);
  }
  else
  {
    v78 = +[NSString stringWithFormat:@"(unknown: %i)", self->_setupSysMode];
  }
  [v3 setObject:v78 forKey:@"setup_sys_mode"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x2000000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_264;
  }
LABEL_260:
  uint64_t setupDirection = self->_setupDirection;
  if (setupDirection >= 3)
  {
    v80 = +[NSString stringWithFormat:@"(unknown: %i)", self->_setupDirection];
  }
  else
  {
    v80 = *(&off_1002871B0 + setupDirection);
  }
  [v3 setObject:v80 forKey:@"setup_direction"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_265;
  }
LABEL_264:
  v81 = +[NSNumber numberWithBool:self->_sl2];
  [v3 setObject:v81 forKey:@"sl2"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_266;
  }
LABEL_265:
  v82 = +[NSNumber numberWithUnsignedInt:self->_coexPolicy];
  [v3 setObject:v82 forKey:@"coex_policy"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x200000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_267;
  }
LABEL_266:
  v83 = +[NSNumber numberWithBool:self->_sl];
  [v3 setObject:v83 forKey:@"sl"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_268;
  }
LABEL_267:
  v84 = +[NSNumber numberWithBool:self->_fb];
  [v3 setObject:v84 forKey:@"fb"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_269;
  }
LABEL_268:
  v85 = +[NSNumber numberWithUnsignedInt:self->_msOrigToFb];
  [v3 setObject:v85 forKey:@"ms_orig_to_fb"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_270;
  }
LABEL_269:
  v86 = +[NSNumber numberWithUnsignedInt:self->_msOrigToConf];
  [v3 setObject:v86 forKey:@"ms_orig_to_conf"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_271;
  }
LABEL_270:
  v87 = +[NSNumber numberWithUnsignedInt:self->_msOrigToEnd];
  [v3 setObject:v87 forKey:@"ms_orig_to_end"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_272;
  }
LABEL_271:
  v88 = +[NSNumber numberWithUnsignedInt:self->_msStartToAlert];
  [v3 setObject:v88 forKey:@"ms_start_to_alert"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_273;
  }
LABEL_272:
  v89 = +[NSNumber numberWithUnsignedInt:self->_msFbToSetup];
  [v3 setObject:v89 forKey:@"ms_fb_to_setup"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_274;
  }
LABEL_273:
  v90 = +[NSNumber numberWithUnsignedInt:self->_msPageToSetup];
  [v3 setObject:v90 forKey:@"ms_page_to_setup"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_275;
  }
LABEL_274:
  v91 = +[NSNumber numberWithUnsignedInt:self->_msSetupToEnd];
  [v3 setObject:v91 forKey:@"ms_setup_to_end"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_276;
  }
LABEL_275:
  v92 = +[NSNumber numberWithInt:self->_ecioDbx2];
  [v3 setObject:v92 forKey:@"ecio_dbx2"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_277;
  }
LABEL_276:
  v93 = +[NSNumber numberWithInt:self->_rssiDbm];
  [v3 setObject:v93 forKey:@"rssi_dbm"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_278;
  }
LABEL_277:
  v94 = +[NSNumber numberWithInt:self->_txPwrDbm];
  [v3 setObject:v94 forKey:@"tx_pwr_dbm"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_278:
  v95 = +[NSNumber numberWithUnsignedInt:self->_sensorUseDuringLastCallMs];
  [v3 setObject:v95 forKey:@"sensor_use_during_last_call_ms"];

  if ((*(void *)&self->_has & 0x8000000000) != 0)
  {
LABEL_51:
    v5 = +[NSNumber numberWithUnsignedInt:self->_sensorEndToPresentMs];
    [v3 setObject:v5 forKey:@"sensor_end_to_present_ms"];
  }
LABEL_52:
  if ([(NSMutableArray *)self->_capEvents count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_capEvents, "count")];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    objc_super v7 = self->_capEvents;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v100 objects:v105 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v101;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v101 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v100 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v100 objects:v105 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"cap_event"];
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = self->_has;
  if ((*(void *)&v13 & 0x800000000000) != 0)
  {
    v31 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v31 forKey:@"subs_id"];

    $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = self->_has;
    if ((*(void *)&v13 & 0x100000000) == 0)
    {
LABEL_63:
      if ((*(void *)&v13 & 0x200000000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_94;
    }
  }
  else if ((*(void *)&v13 & 0x100000000) == 0)
  {
    goto LABEL_63;
  }
  v32 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v32 forKey:@"num_subs"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = self->_has;
  if ((*(void *)&v13 & 0x200000000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_95;
  }
LABEL_94:
  v33 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v33 forKey:@"ps_pref"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_96;
  }
LABEL_95:
  v34 = +[NSNumber numberWithUnsignedInt:self->_hoType];
  [v3 setObject:v34 forKey:@"ho_type"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_66:
    if ((*(void *)&v13 & 0x2000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_96:
  v35 = +[NSNumber numberWithUnsignedInt:self->_hstState];
  [v3 setObject:v35 forKey:@"hst_state"];

  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_67:
    v14 = +[NSNumber numberWithUnsignedInt:self->_rrcRelCause];
    [v3 setObject:v14 forKey:@"rrc_rel_cause"];
  }
LABEL_68:
  if ([(NSMutableArray *)self->_rfMeasInfos count])
  {
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_rfMeasInfos, "count")];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v16 = self->_rfMeasInfos;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v96 objects:v104 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v97;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v97 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v96 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v96 objects:v104 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"rf_meas_info"];
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    v36 = +[NSNumber numberWithUnsignedInt:self->_isSrvccSuccess];
    [v3 setObject:v36 forKey:@"is_srvcc_success"];

    $5C7AF59FAF9AD3B0058052679E7AB9DE v22 = self->_has;
    if ((*(void *)&v22 & 0x400000000000) == 0)
    {
LABEL_79:
      if ((*(void *)&v22 & 0x200000000000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_103;
    }
  }
  else if ((*(void *)&v22 & 0x400000000000) == 0)
  {
    goto LABEL_79;
  }
  uint64_t srvccTargetRat = self->_srvccTargetRat;
  if (srvccTargetRat >= 5)
  {
    v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvccTargetRat];
  }
  else
  {
    v38 = *(&off_1002871C8 + srvccTargetRat);
  }
  [v3 setObject:v38 forKey:@"srvcc_target_rat"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE v22 = self->_has;
  if ((*(void *)&v22 & 0x200000000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v22 & 0x80000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_104;
  }
LABEL_103:
  v39 = +[NSNumber numberWithUnsignedInt:self->_srvccFailureCause];
  [v3 setObject:v39 forKey:@"srvcc_failure_cause"];

  $5C7AF59FAF9AD3B0058052679E7AB9DE v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v22 & 0x40000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
LABEL_104:
  v40 = +[NSNumber numberWithUnsignedInt:self->_lastMotionState];
  [v3 setObject:v40 forKey:@"last_motion_state"];

  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_82:
    v23 = +[NSNumber numberWithUnsignedInt:self->_msSinceLastMotionState];
    [v3 setObject:v23 forKey:@"ms_since_last_motion_state"];
  }
LABEL_83:
  transId = self->_transId;
  if (transId) {
    [v3 setObject:transId forKey:@"trans_id"];
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    v25 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v25 forKey:@"version"];
  }
  id v26 = v3;

  return v26;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002AB58(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_86;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteSint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x100000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x20000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x400000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x2000000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x200000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteSint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteSint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteSint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_132:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x8000000000) != 0) {
LABEL_51:
  }
    PBDataWriterWriteUint32Field();
LABEL_52:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = self->_capEvents;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  $5C7AF59FAF9AD3B0058052679E7AB9DE v11 = self->_has;
  if ((*(void *)&v11 & 0x800000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5C7AF59FAF9AD3B0058052679E7AB9DE v11 = self->_has;
    if ((*(void *)&v11 & 0x100000000) == 0)
    {
LABEL_61:
      if ((*(void *)&v11 & 0x200000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_136;
    }
  }
  else if ((*(void *)&v11 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE v11 = self->_has;
  if ((*(void *)&v11 & 0x200000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v11 & 0x8000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v11 & 0x10000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_64:
    if ((*(void *)&v11 & 0x2000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_138:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x2000000000) != 0) {
LABEL_65:
  }
    PBDataWriterWriteUint32Field();
LABEL_66:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = self->_rfMeasInfos;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v13 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  $5C7AF59FAF9AD3B0058052679E7AB9DE v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $5C7AF59FAF9AD3B0058052679E7AB9DE v17 = self->_has;
    if ((*(void *)&v17 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((*(void *)&v17 & 0x200000000000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_142;
    }
  }
  else if ((*(void *)&v17 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE v17 = self->_has;
  if ((*(void *)&v17 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v17 & 0x80000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field();
  $5C7AF59FAF9AD3B0058052679E7AB9DE v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v17 & 0x40000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_143:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x40000000) != 0) {
LABEL_78:
  }
    PBDataWriterWriteUint32Field();
LABEL_79:
  if (self->_transId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *(void *)((char *)v4 + 260) |= 1uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_82;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_callEvent;
  *(void *)((char *)v4 + 260) |= 0x20uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 9) = self->_callId;
  *(void *)((char *)v4 + 260) |= 0x40uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 17) = self->_direction;
  *(void *)((char *)v4 + 260) |= 0x1000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 51) = self->_srvType;
  *(void *)((char *)v4 + 260) |= 0x100000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v4 + 55) = self->_sysMode;
  *(void *)((char *)v4 + 260) |= 0x1000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v4 + 10) = self->_callState;
  *(void *)((char *)v4 + 260) |= 0x80uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v4 + 19) = self->_endStatus;
  *(void *)((char *)v4 + 260) |= 0x4000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 40) = self->_qmiReleaseCause;
  *(void *)((char *)v4 + 260) |= 0x800000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 7) = self->_callDuration;
  *(void *)((char *)v4 + 260) |= 0x10uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 14) = self->_ccCause;
  *(void *)((char *)v4 + 260) |= 0x200uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 4) = self->_antenna;
  *(void *)((char *)v4 + 260) |= 2uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x100000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 11) = self->_callType;
  *(void *)((char *)v4 + 260) |= 0x100uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((unsigned char *)v4 + 254) = self->_established;
  *(void *)((char *)v4 + 260) |= 0x100000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((unsigned char *)v4 + 253) = self->_connected;
  *(void *)((char *)v4 + 260) |= 0x80000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 25) = self->_lteCellId;
  *(void *)((char *)v4 + 260) |= 0x100000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x20000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 15) = self->_cellId;
  *(void *)((char *)v4 + 260) |= 0x400uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v4 + 62) = self->_zoneId;
  *(void *)((char *)v4 + 260) |= 0x20000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 6) = self->_baseId;
  *(void *)((char *)v4 + 260) |= 8uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 26) = self->_lteLac;
  *(void *)((char *)v4 + 260) |= 0x200000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 50) = self->_sid;
  *(void *)((char *)v4 + 260) |= 0x80000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v4 + 27) = self->_mcc;
  *(void *)((char *)v4 + 260) |= 0x400000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 28) = self->_mnc;
  *(void *)((char *)v4 + 260) |= 0x800000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v4 + 23) = self->_lac;
  *(void *)((char *)v4 + 260) |= 0x40000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x400000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((unsigned char *)v4 + 257) = self->_mrabEver;
  *(void *)((char *)v4 + 260) |= 0x800000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((unsigned char *)v4 + 256) = self->_mrabEnd;
  *(void *)((char *)v4 + 260) |= 0x400000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v4 + 5) = self->_band;
  *(void *)((char *)v4 + 260) |= 4uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 41) = self->_rfChannel;
  *(void *)((char *)v4 + 260) |= 0x1000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v4 + 39) = self->_psc;
  *(void *)((char *)v4 + 260) |= 0x400000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v4 + 59) = self->_ttyMode;
  *(void *)((char *)v4 + 260) |= 0x4000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v4 + 58) = self->_tsAccuracyHour;
  *(void *)((char *)v4 + 260) |= 0x2000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((unsigned char *)v4 + 252) = self->_accessoryAttached;
  *(void *)((char *)v4 + 260) |= 0x40000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v4 + 49) = self->_setupSysMode;
  *(void *)((char *)v4 + 260) |= 0x40000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x2000000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v4 + 48) = self->_setupDirection;
  *(void *)((char *)v4 + 260) |= 0x20000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((unsigned char *)v4 + 259) = self->_sl2;
  *(void *)((char *)v4 + 260) |= 0x2000000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)v4 + 16) = self->_coexPolicy;
  *(void *)((char *)v4 + 260) |= 0x800uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x200000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((unsigned char *)v4 + 258) = self->_sl;
  *(void *)((char *)v4 + 260) |= 0x1000000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((unsigned char *)v4 + 255) = self->_fb;
  *(void *)((char *)v4 + 260) |= 0x200000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v4 + 32) = self->_msOrigToFb;
  *(void *)((char *)v4 + 260) |= 0x8000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 30) = self->_msOrigToConf;
  *(void *)((char *)v4 + 260) |= 0x2000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v4 + 31) = self->_msOrigToEnd;
  *(void *)((char *)v4 + 260) |= 0x4000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 36) = self->_msStartToAlert;
  *(void *)((char *)v4 + 260) |= 0x80000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v4 + 29) = self->_msFbToSetup;
  *(void *)((char *)v4 + 260) |= 0x1000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v4 + 33) = self->_msPageToSetup;
  *(void *)((char *)v4 + 260) |= 0x10000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v4 + 34) = self->_msSetupToEnd;
  *(void *)((char *)v4 + 260) |= 0x20000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v4 + 18) = self->_ecioDbx2;
  *(void *)((char *)v4 + 260) |= 0x2000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v4 + 45) = self->_rssiDbm;
  *(void *)((char *)v4 + 260) |= 0x4000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_50;
    }
LABEL_128:
    *((_DWORD *)v4 + 47) = self->_sensorUseDuringLastCallMs;
    *(void *)((char *)v4 + 260) |= 0x10000000000uLL;
    if ((*(void *)&self->_has & 0x8000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_127:
  *((_DWORD *)v4 + 60) = self->_txPwrDbm;
  *(void *)((char *)v4 + 260) |= 0x8000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0) {
    goto LABEL_128;
  }
LABEL_50:
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_51:
    *((_DWORD *)v4 + 46) = self->_sensorEndToPresentMs;
    *(void *)((char *)v4 + 260) |= 0x8000000000uLL;
  }
LABEL_52:
  $5C7AF59FAF9AD3B0058052679E7AB9DE v17 = (char *)v4;
  if ([(CellularCallEndDetails *)self capEventsCount])
  {
    [v17 clearCapEvents];
    unint64_t v6 = [(CellularCallEndDetails *)self capEventsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularCallEndDetails *)self capEventAtIndex:i];
        [v17 addCapEvent:v9];
      }
    }
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10 = self->_has;
  if ((*(void *)&v10 & 0x800000000000) != 0)
  {
    *((_DWORD *)v17 + 54) = self->_subsId;
    *(void *)(v17 + 260) |= 0x800000000000uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE v10 = self->_has;
    if ((*(void *)&v10 & 0x100000000) == 0)
    {
LABEL_58:
      if ((*(void *)&v10 & 0x200000000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_132;
    }
  }
  else if ((*(void *)&v10 & 0x100000000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v17 + 37) = self->_numSubs;
  *(void *)(v17 + 260) |= (unint64_t)&_mh_execute_header;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v10 & 0x8000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v17 + 38) = self->_psPref;
  *(void *)(v17 + 260) |= 0x200000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x10000) == 0) {
      goto LABEL_61;
    }
LABEL_134:
    *((_DWORD *)v17 + 21) = self->_hstState;
    *(void *)(v17 + 260) |= 0x10000uLL;
    if ((*(void *)&self->_has & 0x2000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_133:
  *((_DWORD *)v17 + 20) = self->_hoType;
  *(void *)(v17 + 260) |= 0x8000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) != 0) {
    goto LABEL_134;
  }
LABEL_61:
  if ((*(void *)&v10 & 0x2000000000) != 0)
  {
LABEL_62:
    *((_DWORD *)v17 + 44) = self->_rrcRelCause;
    *(void *)(v17 + 260) |= 0x2000000000uLL;
  }
LABEL_63:
  if ([(CellularCallEndDetails *)self rfMeasInfosCount])
  {
    [v17 clearRfMeasInfos];
    unint64_t v11 = [(CellularCallEndDetails *)self rfMeasInfosCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        v14 = [(CellularCallEndDetails *)self rfMeasInfoAtIndex:j];
        [v17 addRfMeasInfo:v14];
      }
    }
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v15 = self->_has;
  v16 = v17;
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *((_DWORD *)v17 + 22) = self->_isSrvccSuccess;
    *(void *)(v17 + 260) |= 0x20000uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE v15 = self->_has;
    if ((*(void *)&v15 & 0x400000000000) == 0)
    {
LABEL_69:
      if ((*(void *)&v15 & 0x200000000000) == 0) {
        goto LABEL_70;
      }
      goto LABEL_138;
    }
  }
  else if ((*(void *)&v15 & 0x400000000000) == 0)
  {
    goto LABEL_69;
  }
  *((_DWORD *)v17 + 53) = self->_srvccTargetRat;
  *(void *)(v17 + 260) |= 0x400000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v15 = self->_has;
  if ((*(void *)&v15 & 0x200000000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v15 & 0x80000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v17 + 52) = self->_srvccFailureCause;
  *(void *)(v17 + 260) |= 0x200000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000) == 0)
  {
LABEL_71:
    if ((*(_DWORD *)&v15 & 0x40000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
LABEL_139:
  *((_DWORD *)v17 + 24) = self->_lastMotionState;
  *(void *)(v17 + 260) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_72:
    *((_DWORD *)v17 + 35) = self->_msSinceLastMotionState;
    *(void *)(v17 + 260) |= 0x40000000uLL;
  }
LABEL_73:
  if (self->_transId)
  {
    [v17 setTransId:];
    v16 = v17;
  }
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    *((_DWORD *)v16 + 61) = self->_version;
    *(void *)(v16 + 260) |= 0x10000000000000uLL;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (char *)v5;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *(void *)((char *)v5 + 260) |= 1uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_84;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_callEvent;
  *(void *)((char *)v5 + 260) |= 0x20uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v5 + 9) = self->_callId;
  *(void *)((char *)v5 + 260) |= 0x40uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v5 + 17) = self->_direction;
  *(void *)((char *)v5 + 260) |= 0x1000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v5 + 51) = self->_srvType;
  *(void *)((char *)v5 + 260) |= 0x100000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v5 + 55) = self->_sysMode;
  *(void *)((char *)v5 + 260) |= 0x1000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v5 + 10) = self->_callState;
  *(void *)((char *)v5 + 260) |= 0x80uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v5 + 19) = self->_endStatus;
  *(void *)((char *)v5 + 260) |= 0x4000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v5 + 40) = self->_qmiReleaseCause;
  *(void *)((char *)v5 + 260) |= 0x800000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v5 + 7) = self->_callDuration;
  *(void *)((char *)v5 + 260) |= 0x10uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v5 + 14) = self->_ccCause;
  *(void *)((char *)v5 + 260) |= 0x200uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v5 + 4) = self->_antenna;
  *(void *)((char *)v5 + 260) |= 2uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x100000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v5 + 11) = self->_callType;
  *(void *)((char *)v5 + 260) |= 0x100uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((unsigned char *)v5 + 254) = self->_established;
  *(void *)((char *)v5 + 260) |= 0x100000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((unsigned char *)v5 + 253) = self->_connected;
  *(void *)((char *)v5 + 260) |= 0x80000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v5 + 25) = self->_lteCellId;
  *(void *)((char *)v5 + 260) |= 0x100000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x20000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v5 + 15) = self->_cellId;
  *(void *)((char *)v5 + 260) |= 0x400uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v5 + 62) = self->_zoneId;
  *(void *)((char *)v5 + 260) |= 0x20000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v5 + 6) = self->_baseId;
  *(void *)((char *)v5 + 260) |= 8uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v5 + 26) = self->_lteLac;
  *(void *)((char *)v5 + 260) |= 0x200000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v5 + 50) = self->_sid;
  *(void *)((char *)v5 + 260) |= 0x80000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v5 + 27) = self->_mcc;
  *(void *)((char *)v5 + 260) |= 0x400000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v5 + 28) = self->_mnc;
  *(void *)((char *)v5 + 260) |= 0x800000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v5 + 23) = self->_lac;
  *(void *)((char *)v5 + 260) |= 0x40000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x400000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((unsigned char *)v5 + 257) = self->_mrabEver;
  *(void *)((char *)v5 + 260) |= 0x800000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((unsigned char *)v5 + 256) = self->_mrabEnd;
  *(void *)((char *)v5 + 260) |= 0x400000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v5 + 5) = self->_band;
  *(void *)((char *)v5 + 260) |= 4uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v5 + 41) = self->_rfChannel;
  *(void *)((char *)v5 + 260) |= 0x1000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v5 + 39) = self->_psc;
  *(void *)((char *)v5 + 260) |= 0x400000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v5 + 59) = self->_ttyMode;
  *(void *)((char *)v5 + 260) |= 0x4000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v5 + 58) = self->_tsAccuracyHour;
  *(void *)((char *)v5 + 260) |= 0x2000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((unsigned char *)v5 + 252) = self->_accessoryAttached;
  *(void *)((char *)v5 + 260) |= 0x40000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v5 + 49) = self->_setupSysMode;
  *(void *)((char *)v5 + 260) |= 0x40000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x2000000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)v5 + 48) = self->_setupDirection;
  *(void *)((char *)v5 + 260) |= 0x20000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((unsigned char *)v5 + 259) = self->_sl2;
  *(void *)((char *)v5 + 260) |= 0x2000000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v5 + 16) = self->_coexPolicy;
  *(void *)((char *)v5 + 260) |= 0x800uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x200000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((unsigned char *)v5 + 258) = self->_sl;
  *(void *)((char *)v5 + 260) |= 0x1000000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((unsigned char *)v5 + 255) = self->_fb;
  *(void *)((char *)v5 + 260) |= 0x200000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v5 + 32) = self->_msOrigToFb;
  *(void *)((char *)v5 + 260) |= 0x8000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v5 + 30) = self->_msOrigToConf;
  *(void *)((char *)v5 + 260) |= 0x2000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v5 + 31) = self->_msOrigToEnd;
  *(void *)((char *)v5 + 260) |= 0x4000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v5 + 36) = self->_msStartToAlert;
  *(void *)((char *)v5 + 260) |= 0x80000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v5 + 29) = self->_msFbToSetup;
  *(void *)((char *)v5 + 260) |= 0x1000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v5 + 33) = self->_msPageToSetup;
  *(void *)((char *)v5 + 260) |= 0x10000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v5 + 34) = self->_msSetupToEnd;
  *(void *)((char *)v5 + 260) |= 0x20000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v5 + 18) = self->_ecioDbx2;
  *(void *)((char *)v5 + 260) |= 0x2000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((_DWORD *)v5 + 45) = self->_rssiDbm;
  *(void *)((char *)v5 + 260) |= 0x4000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v5 + 60) = self->_txPwrDbm;
  *(void *)((char *)v5 + 260) |= 0x8000000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_130:
  *((_DWORD *)v5 + 47) = self->_sensorUseDuringLastCallMs;
  *(void *)((char *)v5 + 260) |= 0x10000000000uLL;
  if ((*(void *)&self->_has & 0x8000000000) != 0)
  {
LABEL_51:
    *((_DWORD *)v5 + 46) = self->_sensorEndToPresentMs;
    *(void *)((char *)v5 + 260) |= 0x8000000000uLL;
  }
LABEL_52:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = self->_capEvents;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v6 addCapEvent:v13];

        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  $5C7AF59FAF9AD3B0058052679E7AB9DE v14 = self->_has;
  if ((*(void *)&v14 & 0x800000000000) != 0)
  {
    *((_DWORD *)v6 + 54) = self->_subsId;
    *(void *)(v6 + 260) |= 0x800000000000uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE v14 = self->_has;
    if ((*(void *)&v14 & 0x100000000) == 0)
    {
LABEL_61:
      if ((*(void *)&v14 & 0x200000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_134;
    }
  }
  else if ((*(void *)&v14 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  *((_DWORD *)v6 + 37) = self->_numSubs;
  *(void *)(v6 + 260) |= (unint64_t)&_mh_execute_header;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v14 = self->_has;
  if ((*(void *)&v14 & 0x200000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v6 + 38) = self->_psPref;
  *(void *)(v6 + 260) |= 0x200000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v6 + 20) = self->_hoType;
  *(void *)(v6 + 260) |= 0x8000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_64:
    if ((*(void *)&v14 & 0x2000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_136:
  *((_DWORD *)v6 + 21) = self->_hstState;
  *(void *)(v6 + 260) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_65:
    *((_DWORD *)v6 + 44) = self->_rrcRelCause;
    *(void *)(v6 + 260) |= 0x2000000000uLL;
  }
LABEL_66:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v15 = self->_rfMeasInfos;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v19) copyWithZone:a3 v26];
        [v6 addRfMeasInfo:v20];

        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  $5C7AF59FAF9AD3B0058052679E7AB9DE v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_isSrvccSuccess;
    *(void *)(v6 + 260) |= 0x20000uLL;
    $5C7AF59FAF9AD3B0058052679E7AB9DE v21 = self->_has;
    if ((*(void *)&v21 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((*(void *)&v21 & 0x200000000000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_140;
    }
  }
  else if ((*(void *)&v21 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  *((_DWORD *)v6 + 53) = self->_srvccTargetRat;
  *(void *)(v6 + 260) |= 0x400000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v21 = self->_has;
  if ((*(void *)&v21 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v21 & 0x80000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v6 + 52) = self->_srvccFailureCause;
  *(void *)(v6 + 260) |= 0x200000000000uLL;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v21 & 0x40000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_141:
  *((_DWORD *)v6 + 24) = self->_lastMotionState;
  *(void *)(v6 + 260) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_78:
    *((_DWORD *)v6 + 35) = self->_msSinceLastMotionState;
    *(void *)(v6 + 260) |= 0x40000000uLL;
  }
LABEL_79:
  id v22 = -[NSString copyWithZone:](self->_transId, "copyWithZone:", a3, (void)v26);
  long long v23 = (void *)*((void *)v6 + 28);
  *((void *)v6 + 28) = v22;

  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0)
  {
    *((_DWORD *)v6 + 61) = self->_version;
    *(void *)(v6 + 260) |= 0x10000000000000uLL;
  }
  long long v24 = v6;

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_344;
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  uint64_t v6 = *(void *)(v4 + 260);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_344;
    }
  }
  else if (v6)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_callEvent != *((_DWORD *)v4 + 8)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_callId != *((_DWORD *)v4 + 9)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_direction != *((_DWORD *)v4 + 17)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v6 & 0x100000000000) == 0 || self->_srvType != *((_DWORD *)v4 + 51)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_sysMode != *((_DWORD *)v4 + 55)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_callState != *((_DWORD *)v4 + 10)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_endStatus != *((_DWORD *)v4 + 19)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_qmiReleaseCause != *((_DWORD *)v4 + 40)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_callDuration != *((_DWORD *)v4 + 7)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_ccCause != *((_DWORD *)v4 + 14)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_antenna != *((_DWORD *)v4 + 4)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_callType != *((_DWORD *)v4 + 11)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x100000000000000) != 0)
  {
    if ((v6 & 0x100000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_established)
    {
      if (!v4[254]) {
        goto LABEL_344;
      }
    }
    else if (v4[254])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    if ((v6 & 0x80000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_connected)
    {
      if (!v4[253]) {
        goto LABEL_344;
      }
    }
    else if (v4[253])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_lteCellId != *((_DWORD *)v4 + 25)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_cellId != *((_DWORD *)v4 + 15)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x20000000000000) != 0)
  {
    if ((v6 & 0x20000000000000) == 0 || self->_zoneId != *((_DWORD *)v4 + 62)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_baseId != *((_DWORD *)v4 + 6)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_lteLac != *((_DWORD *)v4 + 26)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0 || self->_sid != *((_DWORD *)v4 + 50)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_mcc != *((_DWORD *)v4 + 27)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_mnc != *((_DWORD *)v4 + 28)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_lac != *((_DWORD *)v4 + 23)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x800000000000000) != 0)
  {
    if ((v6 & 0x800000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_mrabEver)
    {
      if (!v4[257]) {
        goto LABEL_344;
      }
    }
    else if (v4[257])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x400000000000000) != 0)
  {
    if ((v6 & 0x400000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_mrabEnd)
    {
      if (!v4[256]) {
        goto LABEL_344;
      }
    }
    else if (v4[256])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_band != *((_DWORD *)v4 + 5)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_rfChannel != *((_DWORD *)v4 + 41)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_psc != *((_DWORD *)v4 + 39)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v6 & 0x4000000000000) == 0 || self->_ttyMode != *((_DWORD *)v4 + 59)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v6 & 0x2000000000000) == 0 || self->_tsAccuracyHour != *((_DWORD *)v4 + 58)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x40000000000000) != 0)
  {
    if ((v6 & 0x40000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_accessoryAttached)
    {
      if (!v4[252]) {
        goto LABEL_344;
      }
    }
    else if (v4[252])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v6 & 0x40000000000) == 0 || self->_setupSysMode != *((_DWORD *)v4 + 49)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x40000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_setupDirection != *((_DWORD *)v4 + 48)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x2000000000000000) != 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_sl2)
    {
      if (!v4[259]) {
        goto LABEL_344;
      }
    }
    else if (v4[259])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_coexPolicy != *((_DWORD *)v4 + 16)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x1000000000000000) != 0)
  {
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_sl)
    {
      if (!v4[258]) {
        goto LABEL_344;
      }
    }
    else if (v4[258])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x200000000000000) != 0)
  {
    if ((v6 & 0x200000000000000) == 0) {
      goto LABEL_344;
    }
    if (self->_fb)
    {
      if (!v4[255]) {
        goto LABEL_344;
      }
    }
    else if (v4[255])
    {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x200000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_msOrigToFb != *((_DWORD *)v4 + 32)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_msOrigToConf != *((_DWORD *)v4 + 30)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_msOrigToEnd != *((_DWORD *)v4 + 31)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_msStartToAlert != *((_DWORD *)v4 + 36)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_msFbToSetup != *((_DWORD *)v4 + 29)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_msPageToSetup != *((_DWORD *)v4 + 33)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_msSetupToEnd != *((_DWORD *)v4 + 34)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_ecioDbx2 != *((_DWORD *)v4 + 18)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_rssiDbm != *((_DWORD *)v4 + 45)) {
      goto LABEL_344;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_344;
  }
  uint64_t v7 = *(void *)(v4 + 260);
  if ((*(void *)&has & 0x8000000000000) != 0)
  {
    if ((v7 & 0x8000000000000) == 0 || self->_txPwrDbm != *((_DWORD *)v4 + 60)) {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x8000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_sensorUseDuringLastCallMs != *((_DWORD *)v4 + 47)) {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_sensorEndToPresentMs != *((_DWORD *)v4 + 46)) {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_344;
  }
  capEvents = self->_capEvents;
  if ((unint64_t)capEvents | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](capEvents, "isEqual:"))
  {
    goto LABEL_344;
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v9 = self->_has;
  uint64_t v10 = *(void *)(v4 + 260);
  if ((*(void *)&v9 & 0x800000000000) != 0)
  {
    if ((v10 & 0x800000000000) == 0 || self->_subsId != *((_DWORD *)v4 + 54)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x800000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&v9 & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_numSubs != *((_DWORD *)v4 + 37)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&v9 & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_psPref != *((_DWORD *)v4 + 38)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_hoType != *((_DWORD *)v4 + 20)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_hstState != *((_DWORD *)v4 + 21)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&v9 & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_rrcRelCause != *((_DWORD *)v4 + 44)) {
      goto LABEL_344;
    }
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_344;
  }
  rfMeasInfos = self->_rfMeasInfos;
  if ((unint64_t)rfMeasInfos | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](rfMeasInfos, "isEqual:")) {
      goto LABEL_344;
    }
    $5C7AF59FAF9AD3B0058052679E7AB9DE v9 = self->_has;
  }
  uint64_t v12 = *(void *)(v4 + 260);
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_isSrvccSuccess != *((_DWORD *)v4 + 22)) {
      goto LABEL_344;
    }
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&v9 & 0x400000000000) != 0)
  {
    if ((v12 & 0x400000000000) == 0 || self->_srvccTargetRat != *((_DWORD *)v4 + 53)) {
      goto LABEL_344;
    }
  }
  else if ((v12 & 0x400000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(void *)&v9 & 0x200000000000) != 0)
  {
    if ((v12 & 0x200000000000) == 0 || self->_srvccFailureCause != *((_DWORD *)v4 + 52)) {
      goto LABEL_344;
    }
  }
  else if ((v12 & 0x200000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_lastMotionState != *((_DWORD *)v4 + 24)) {
      goto LABEL_344;
    }
  }
  else if ((v12 & 0x80000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
  {
    if ((v12 & 0x40000000) == 0 || self->_msSinceLastMotionState != *((_DWORD *)v4 + 35)) {
      goto LABEL_344;
    }
  }
  else if ((v12 & 0x40000000) != 0)
  {
    goto LABEL_344;
  }
  transId = self->_transId;
  if (!((unint64_t)transId | *((void *)v4 + 28))) {
    goto LABEL_339;
  }
  if (!-[NSString isEqual:](transId, "isEqual:"))
  {
LABEL_344:
    BOOL v15 = 0;
    goto LABEL_345;
  }
  $5C7AF59FAF9AD3B0058052679E7AB9DE v9 = self->_has;
LABEL_339:
  uint64_t v14 = *(void *)(v4 + 260);
  if ((*(void *)&v9 & 0x10000000000000) != 0)
  {
    if ((v14 & 0x10000000000000) == 0 || self->_version != *((_DWORD *)v4 + 61)) {
      goto LABEL_344;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (v14 & 0x10000000000000) == 0;
  }
LABEL_345:

  return v15;
}

- (unint64_t)hash
{
  $5C7AF59FAF9AD3B0058052679E7AB9DE has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v71 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v70 = 2654435761 * self->_callEvent;
      if ((*(unsigned char *)&has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else
  {
    unint64_t v71 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v70 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v69 = 2654435761 * self->_callId;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v69 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    uint64_t v68 = 2654435761 * self->_direction;
    if ((*(void *)&has & 0x100000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v68 = 0;
  if ((*(void *)&has & 0x100000000000) != 0)
  {
LABEL_6:
    uint64_t v67 = 2654435761 * self->_srvType;
    if ((*(void *)&has & 0x1000000000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v67 = 0;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
LABEL_7:
    uint64_t v66 = 2654435761 * self->_sysMode;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v66 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v65 = 2654435761 * self->_callState;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v65 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v64 = 2654435761 * self->_endStatus;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v64 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_10:
    uint64_t v63 = 2654435761 * self->_qmiReleaseCause;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v63 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v62 = 2654435761 * self->_callDuration;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v62 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v61 = 2654435761 * self->_ccCause;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v61 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_13:
    uint64_t v60 = 2654435761 * self->_antenna;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v60 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    uint64_t v59 = 2654435761 * self->_callType;
    if ((*(void *)&has & 0x100000000000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v59 = 0;
  if ((*(void *)&has & 0x100000000000000) != 0)
  {
LABEL_15:
    uint64_t v58 = 2654435761 * self->_established;
    if ((*(void *)&has & 0x80000000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v58 = 0;
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
LABEL_16:
    uint64_t v57 = 2654435761 * self->_connected;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v57 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    uint64_t v56 = 2654435761 * self->_lteCellId;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v56 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    uint64_t v55 = 2654435761 * self->_cellId;
    if ((*(void *)&has & 0x20000000000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v55 = 0;
  if ((*(void *)&has & 0x20000000000000) != 0)
  {
LABEL_19:
    uint64_t v54 = 2654435761 * self->_zoneId;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v54 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_20:
    uint64_t v53 = 2654435761 * self->_baseId;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v53 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    uint64_t v52 = 2654435761 * self->_lteLac;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v52 = 0;
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_22:
    uint64_t v51 = 2654435761 * self->_sid;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    uint64_t v50 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_24:
    uint64_t v49 = 2654435761 * self->_mnc;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_25:
    uint64_t v48 = 2654435761 * self->_lac;
    if ((*(void *)&has & 0x800000000000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v48 = 0;
  if ((*(void *)&has & 0x800000000000000) != 0)
  {
LABEL_26:
    uint64_t v47 = 2654435761 * self->_mrabEver;
    if ((*(void *)&has & 0x400000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v47 = 0;
  if ((*(void *)&has & 0x400000000000000) != 0)
  {
LABEL_27:
    uint64_t v46 = 2654435761 * self->_mrabEnd;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v46 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_28:
    uint64_t v45 = 2654435761 * self->_band;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v45 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_29:
    uint64_t v44 = 2654435761 * self->_rfChannel;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v44 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_30:
    uint64_t v43 = 2654435761 * self->_psc;
    if ((*(void *)&has & 0x4000000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v43 = 0;
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
LABEL_31:
    uint64_t v42 = 2654435761 * self->_ttyMode;
    if ((*(void *)&has & 0x2000000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v42 = 0;
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
LABEL_32:
    uint64_t v41 = 2654435761 * self->_tsAccuracyHour;
    if ((*(void *)&has & 0x40000000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v41 = 0;
  if ((*(void *)&has & 0x40000000000000) != 0)
  {
LABEL_33:
    uint64_t v40 = 2654435761 * self->_accessoryAttached;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v40 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_34:
    uint64_t v39 = 2654435761 * self->_setupSysMode;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v39 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_35:
    uint64_t v38 = 2654435761 * self->_setupDirection;
    if ((*(void *)&has & 0x2000000000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v38 = 0;
  if ((*(void *)&has & 0x2000000000000000) != 0)
  {
LABEL_36:
    uint64_t v37 = 2654435761 * self->_sl2;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_37;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v37 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_37:
    uint64_t v36 = 2654435761 * self->_coexPolicy;
    if ((*(void *)&has & 0x1000000000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v36 = 0;
  if ((*(void *)&has & 0x1000000000000000) != 0)
  {
LABEL_38:
    uint64_t v35 = 2654435761 * self->_sl;
    if ((*(void *)&has & 0x200000000000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v35 = 0;
  if ((*(void *)&has & 0x200000000000000) != 0)
  {
LABEL_39:
    uint64_t v34 = 2654435761 * self->_fb;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_40:
    uint64_t v33 = 2654435761 * self->_msOrigToFb;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_41:
    uint64_t v32 = 2654435761 * self->_msOrigToConf;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_42:
    uint64_t v31 = 2654435761 * self->_msOrigToEnd;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_43:
    uint64_t v30 = 2654435761 * self->_msStartToAlert;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_44:
    uint64_t v29 = 2654435761 * self->_msFbToSetup;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_45:
    uint64_t v28 = 2654435761 * self->_msPageToSetup;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_46:
    uint64_t v27 = 2654435761 * self->_msSetupToEnd;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_47:
    uint64_t v26 = 2654435761 * self->_ecioDbx2;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v26 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_48:
    uint64_t v25 = 2654435761 * self->_rssiDbm;
    if ((*(void *)&has & 0x8000000000000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v25 = 0;
  if ((*(void *)&has & 0x8000000000000) != 0)
  {
LABEL_49:
    uint64_t v24 = 2654435761 * self->_txPwrDbm;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_50;
    }
LABEL_100:
    uint64_t v23 = 0;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_101;
  }
LABEL_99:
  uint64_t v24 = 0;
  if ((*(void *)&has & 0x10000000000) == 0) {
    goto LABEL_100;
  }
LABEL_50:
  uint64_t v23 = 2654435761 * self->_sensorUseDuringLastCallMs;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_51:
    uint64_t v22 = 2654435761 * self->_sensorEndToPresentMs;
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v22 = 0;
LABEL_102:
  unint64_t v21 = (unint64_t)[(NSMutableArray *)self->_capEvents hash];
  $5C7AF59FAF9AD3B0058052679E7AB9DE v4 = self->_has;
  if ((*(void *)&v4 & 0x800000000000) != 0)
  {
    uint64_t v20 = 2654435761 * self->_subsId;
    if ((*(void *)&v4 & 0x100000000) != 0)
    {
LABEL_104:
      uint64_t v19 = 2654435761 * self->_numSubs;
      if ((*(void *)&v4 & 0x200000000) != 0) {
        goto LABEL_105;
      }
      goto LABEL_111;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_104;
    }
  }
  uint64_t v19 = 0;
  if ((*(void *)&v4 & 0x200000000) != 0)
  {
LABEL_105:
    uint64_t v18 = 2654435761 * self->_psPref;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_106;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_106:
    uint64_t v17 = 2654435761 * self->_hoType;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_107;
    }
LABEL_113:
    uint64_t v16 = 0;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_108;
    }
    goto LABEL_114;
  }
LABEL_112:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) == 0) {
    goto LABEL_113;
  }
LABEL_107:
  uint64_t v16 = 2654435761 * self->_hstState;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_108:
    uint64_t v5 = 2654435761 * self->_rrcRelCause;
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v5 = 0;
LABEL_115:
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_rfMeasInfos hash];
  $5C7AF59FAF9AD3B0058052679E7AB9DE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isSrvccSuccess;
    if ((*(void *)&v7 & 0x400000000000) != 0)
    {
LABEL_117:
      uint64_t v9 = 2654435761 * self->_srvccTargetRat;
      if ((*(void *)&v7 & 0x200000000000) != 0) {
        goto LABEL_118;
      }
      goto LABEL_123;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(void *)&v7 & 0x400000000000) != 0) {
      goto LABEL_117;
    }
  }
  uint64_t v9 = 0;
  if ((*(void *)&v7 & 0x200000000000) != 0)
  {
LABEL_118:
    uint64_t v10 = 2654435761 * self->_srvccFailureCause;
    if ((*(_DWORD *)&v7 & 0x80000) != 0) {
      goto LABEL_119;
    }
LABEL_124:
    uint64_t v11 = 0;
    if ((*(_DWORD *)&v7 & 0x40000000) != 0) {
      goto LABEL_120;
    }
    goto LABEL_125;
  }
LABEL_123:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&v7 & 0x80000) == 0) {
    goto LABEL_124;
  }
LABEL_119:
  uint64_t v11 = 2654435761 * self->_lastMotionState;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
LABEL_120:
    uint64_t v12 = 2654435761 * self->_msSinceLastMotionState;
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v12 = 0;
LABEL_126:
  NSUInteger v13 = [(NSString *)self->_transId hash];
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0) {
    uint64_t v14 = 2654435761 * self->_version;
  }
  else {
    uint64_t v14 = 0;
  }
  return v70 ^ v71 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  $5C7AF59FAF9AD3B0058052679E7AB9DE v4 = (char *)a3;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 + 260);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v6 = *(void *)(v4 + 260);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_86;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_int callEvent = *((_DWORD *)v4 + 8);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_callId = *((_DWORD *)v4 + 9);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x1000) == 0)
  {
LABEL_5:
    if ((v6 & 0x100000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_uint64_t direction = *((_DWORD *)v4 + 17);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x1000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_srvType = *((_DWORD *)v4 + 51);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_uint64_t sysMode = *((_DWORD *)v4 + 55);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_uint64_t callState = *((_DWORD *)v4 + 10);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x4000) == 0)
  {
LABEL_9:
    if ((v6 & 0x800000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_endStatus = *((_DWORD *)v4 + 19);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_qmiReleaseCause = *((_DWORD *)v4 + 40);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_callDuration = *((_DWORD *)v4 + 7);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_ccCause = *((_DWORD *)v4 + 14);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_uint64_t antenna = *((_DWORD *)v4 + 4);
  *(void *)&self->_has |= 2uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x100000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_callType = *((_DWORD *)v4 + 11);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((v6 & 0x80000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_established = v4[254];
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_connected = v4[253];
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((v6 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_lteCellId = *((_DWORD *)v4 + 25);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x400) == 0)
  {
LABEL_18:
    if ((v6 & 0x20000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_cellId = *((_DWORD *)v4 + 15);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((v6 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_zoneId = *((_DWORD *)v4 + 62);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 8) == 0)
  {
LABEL_20:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_baseId = *((_DWORD *)v4 + 6);
  *(void *)&self->_has |= 8uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x200000) == 0)
  {
LABEL_21:
    if ((v6 & 0x80000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_lteLac = *((_DWORD *)v4 + 26);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_22:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_sid = *((_DWORD *)v4 + 50);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x400000) == 0)
  {
LABEL_23:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_mcc = *((_DWORD *)v4 + 27);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x800000) == 0)
  {
LABEL_24:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_mnc = *((_DWORD *)v4 + 28);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x40000) == 0)
  {
LABEL_25:
    if ((v6 & 0x800000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_lac = *((_DWORD *)v4 + 23);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_mrabEver = v4[257];
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((v6 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_mrabEnd = v4[256];
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 4) == 0)
  {
LABEL_28:
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_band = *((_DWORD *)v4 + 5);
  *(void *)&self->_has |= 4uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_rfChannel = *((_DWORD *)v4 + 41);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x4000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_psc = *((_DWORD *)v4 + 39);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x2000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_ttyMode = *((_DWORD *)v4 + 59);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((v6 & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_tsAccuracyHour = *((_DWORD *)v4 + 58);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_accessoryAttached = v4[252];
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_uint64_t setupSysMode = *((_DWORD *)v4 + 49);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_uint64_t setupDirection = *((_DWORD *)v4 + 48);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_sl2 = v4[259];
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x800) == 0)
  {
LABEL_37:
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_coexPolicy = *((_DWORD *)v4 + 16);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x200000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_sl = v4[258];
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_fb = v4[255];
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_40:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_msOrigToFb = *((_DWORD *)v4 + 32);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_msOrigToConf = *((_DWORD *)v4 + 30);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_msOrigToEnd = *((_DWORD *)v4 + 31);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_msStartToAlert = *((_DWORD *)v4 + 36);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_msFbToSetup = *((_DWORD *)v4 + 29);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_msPageToSetup = *((_DWORD *)v4 + 33);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_46:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_msSetupToEnd = *((_DWORD *)v4 + 34);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x2000) == 0)
  {
LABEL_47:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_ecioDbx2 = *((_DWORD *)v4 + 18);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x8000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_rssiDbm = *((_DWORD *)v4 + 45);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((v6 & 0x10000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_txPwrDbm = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 260);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_50:
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_132:
  self->_sensorUseDuringLastCallMs = *((_DWORD *)v4 + 47);
  *(void *)&self->_has |= 0x10000000000uLL;
  if ((*(void *)(v4 + 260) & 0x8000000000) != 0)
  {
LABEL_51:
    self->_sensorEndToPresentMs = *((_DWORD *)v4 + 46);
    *(void *)&self->_has |= 0x8000000000uLL;
  }
LABEL_52:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *((id *)v4 + 6);
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CellularCallEndDetails *)self addCapEvent:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v12 = *(void *)(v5 + 260);
  if ((v12 & 0x800000000000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 54);
    *(void *)&self->_has |= 0x800000000000uLL;
    uint64_t v12 = *(void *)(v5 + 260);
    if ((v12 & 0x100000000) == 0)
    {
LABEL_61:
      if ((v12 & 0x200000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  self->_numSubs = *((_DWORD *)v5 + 37);
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  uint64_t v12 = *(void *)(v5 + 260);
  if ((v12 & 0x200000000) == 0)
  {
LABEL_62:
    if ((v12 & 0x8000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_psPref = *((_DWORD *)v5 + 38);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v12 = *(void *)(v5 + 260);
  if ((v12 & 0x8000) == 0)
  {
LABEL_63:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_hoType = *((_DWORD *)v5 + 20);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v12 = *(void *)(v5 + 260);
  if ((v12 & 0x10000) == 0)
  {
LABEL_64:
    if ((v12 & 0x2000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_138:
  self->_hstState = *((_DWORD *)v5 + 21);
  *(void *)&self->_has |= 0x10000uLL;
  if ((*(void *)(v5 + 260) & 0x2000000000) != 0)
  {
LABEL_65:
    self->_rrcRelCause = *((_DWORD *)v5 + 44);
    *(void *)&self->_has |= 0x2000000000uLL;
  }
LABEL_66:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *((id *)v5 + 21);
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[CellularCallEndDetails addRfMeasInfo:](self, "addRfMeasInfo:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), (void)v19);
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  uint64_t v18 = *(void *)(v5 + 260);
  if ((v18 & 0x20000) != 0)
  {
    self->_isSrvccSuccess = *((_DWORD *)v5 + 22);
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v18 = *(void *)(v5 + 260);
    if ((v18 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((v18 & 0x200000000000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_142;
    }
  }
  else if ((v18 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  self->_uint64_t srvccTargetRat = *((_DWORD *)v5 + 53);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v18 = *(void *)(v5 + 260);
  if ((v18 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((v18 & 0x80000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_srvccFailureCause = *((_DWORD *)v5 + 52);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v18 = *(void *)(v5 + 260);
  if ((v18 & 0x80000) == 0)
  {
LABEL_77:
    if ((v18 & 0x40000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_143:
  self->_lastMotionState = *((_DWORD *)v5 + 24);
  *(void *)&self->_has |= 0x80000uLL;
  if ((*(void *)(v5 + 260) & 0x40000000) != 0)
  {
LABEL_78:
    self->_msSinceLastMotionState = *((_DWORD *)v5 + 35);
    *(void *)&self->_has |= 0x40000000uLL;
  }
LABEL_79:
  if (*((void *)v5 + 28)) {
    -[CellularCallEndDetails setTransId:](self, "setTransId:");
  }
  if ((v5[266] & 0x10) != 0)
  {
    self->_version = *((_DWORD *)v5 + 61);
    *(void *)&self->_has |= 0x10000000000000uLL;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)callId
{
  return self->_callId;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (unsigned)ccCause
{
  return self->_ccCause;
}

- (int)qmiReleaseCause
{
  return self->_qmiReleaseCause;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (BOOL)established
{
  return self->_established;
}

- (BOOL)connected
{
  return self->_connected;
}

- (unsigned)lteCellId
{
  return self->_lteCellId;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)zoneId
{
  return self->_zoneId;
}

- (unsigned)baseId
{
  return self->_baseId;
}

- (unsigned)lteLac
{
  return self->_lteLac;
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (BOOL)mrabEver
{
  return self->_mrabEver;
}

- (BOOL)mrabEnd
{
  return self->_mrabEnd;
}

- (unsigned)rfChannel
{
  return self->_rfChannel;
}

- (unsigned)psc
{
  return self->_psc;
}

- (unsigned)ttyMode
{
  return self->_ttyMode;
}

- (unsigned)tsAccuracyHour
{
  return self->_tsAccuracyHour;
}

- (BOOL)accessoryAttached
{
  return self->_accessoryAttached;
}

- (BOOL)sl2
{
  return self->_sl2;
}

- (unsigned)coexPolicy
{
  return self->_coexPolicy;
}

- (BOOL)sl
{
  return self->_sl;
}

- (BOOL)fb
{
  return self->_fb;
}

- (unsigned)msOrigToFb
{
  return self->_msOrigToFb;
}

- (unsigned)msOrigToConf
{
  return self->_msOrigToConf;
}

- (unsigned)msOrigToEnd
{
  return self->_msOrigToEnd;
}

- (unsigned)msStartToAlert
{
  return self->_msStartToAlert;
}

- (unsigned)msFbToSetup
{
  return self->_msFbToSetup;
}

- (unsigned)msPageToSetup
{
  return self->_msPageToSetup;
}

- (unsigned)msSetupToEnd
{
  return self->_msSetupToEnd;
}

- (int)ecioDbx2
{
  return self->_ecioDbx2;
}

- (int)rssiDbm
{
  return self->_rssiDbm;
}

- (int)txPwrDbm
{
  return self->_txPwrDbm;
}

- (unsigned)sensorUseDuringLastCallMs
{
  return self->_sensorUseDuringLastCallMs;
}

- (unsigned)sensorEndToPresentMs
{
  return self->_sensorEndToPresentMs;
}

- (NSMutableArray)capEvents
{
  return self->_capEvents;
}

- (void)setCapEvents:(id)a3
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

- (unsigned)hoType
{
  return self->_hoType;
}

- (unsigned)hstState
{
  return self->_hstState;
}

- (unsigned)rrcRelCause
{
  return self->_rrcRelCause;
}

- (NSMutableArray)rfMeasInfos
{
  return self->_rfMeasInfos;
}

- (void)setRfMeasInfos:(id)a3
{
}

- (unsigned)isSrvccSuccess
{
  return self->_isSrvccSuccess;
}

- (unsigned)srvccFailureCause
{
  return self->_srvccFailureCause;
}

- (unsigned)lastMotionState
{
  return self->_lastMotionState;
}

- (unsigned)msSinceLastMotionState
{
  return self->_msSinceLastMotionState;
}

- (NSString)transId
{
  return self->_transId;
}

- (void)setTransId:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transId, 0);
  objc_storeStrong((id *)&self->_rfMeasInfos, 0);

  objc_storeStrong((id *)&self->_capEvents, 0);
}

@end