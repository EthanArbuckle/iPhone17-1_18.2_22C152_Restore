@interface CellularVoiceCallEvent
+ (Class)capEventType;
+ (Class)hcStatType;
+ (Class)rbDataType;
+ (Class)rfMeasInfoType;
- (AudioQuality)lastAudioQualityCnt;
- (BOOL)accessoryAttached;
- (BOOL)badAudioQuality;
- (BOOL)barredFromSib1;
- (BOOL)barredFromSib2;
- (BOOL)connectionRejected;
- (BOOL)dueToHandover;
- (BOOL)hasAccessoryAttached;
- (BOOL)hasAccessoryAttachedBitmap;
- (BOOL)hasAntenna;
- (BOOL)hasAppCallId;
- (BOOL)hasAudioQosDetectWinLenSec;
- (BOOL)hasAudioQualityThresholdPpt;
- (BOOL)hasBadAudioQuality;
- (BOOL)hasBand;
- (BOOL)hasBarredFromSib1;
- (BOOL)hasBarredFromSib2;
- (BOOL)hasCallConnectDur;
- (BOOL)hasCallDuration;
- (BOOL)hasCallEvent;
- (BOOL)hasCallId;
- (BOOL)hasCallSetupTimeMs;
- (BOOL)hasCellId;
- (BOOL)hasConnectionRejected;
- (BOOL)hasDedicatedBrInactiveToEndMs;
- (BOOL)hasDirection;
- (BOOL)hasDrxOn;
- (BOOL)hasDueToHandover;
- (BOOL)hasEndStatus;
- (BOOL)hasEventId;
- (BOOL)hasFrErasurePpt;
- (BOOL)hasHoAltSeqNum;
- (BOOL)hasHstState;
- (BOOL)hasIsAltStart;
- (BOOL)hasLac;
- (BOOL)hasLastAudioQualityCnt;
- (BOOL)hasLastMotionState;
- (BOOL)hasLastRsrp;
- (BOOL)hasLastRssi;
- (BOOL)hasLastXSec;
- (BOOL)hasLastXSecDlMrab;
- (BOOL)hasLastXSecUlMrab;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasMsSinceLastMotionState;
- (BOOL)hasMsgId;
- (BOOL)hasMtplInPoint1Db;
- (BOOL)hasNidO;
- (BOOL)hasNr5gCellId;
- (BOOL)hasNumCps;
- (BOOL)hasNumEnqdSilencePkt;
- (BOOL)hasNumEnqdSpeechPkt;
- (BOOL)hasNumLostPkt;
- (BOOL)hasNumMissedSpeechPkt;
- (BOOL)hasNumMncDigits;
- (BOOL)hasNumPlayedSpeechPkt;
- (BOOL)hasNumRecvdSilencePkt;
- (BOOL)hasNumRecvdSpeechPkt;
- (BOOL)hasNumSpeechQempty;
- (BOOL)hasNumSubs;
- (BOOL)hasNumUflwSilencePkt;
- (BOOL)hasNumUflwSpeechPkt;
- (BOOL)hasPlmnO;
- (BOOL)hasPsPref;
- (BOOL)hasResponseCode;
- (BOOL)hasRfChannel;
- (BOOL)hasRrcRelCause;
- (BOOL)hasRtpPktLossPpt;
- (BOOL)hasSetupDirection;
- (BOOL)hasSetupSysMode;
- (BOOL)hasSidO;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasSysModeO;
- (BOOL)hasTbMs;
- (BOOL)hasTimestamp;
- (BOOL)hasTsAccuracyHour;
- (BOOL)hasTypeOfCall;
- (BOOL)hasUflwPktPpt;
- (BOOL)hasVersion;
- (BOOL)isAltStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastXSecDlMrab;
- (BOOL)lastXSecUlMrab;
- (BOOL)readFrom:(id)a3;
- (NSData)plmnO;
- (NSData)simHplmn;
- (NSMutableArray)capEvents;
- (NSMutableArray)hcStats;
- (NSMutableArray)rbDatas;
- (NSMutableArray)rfMeasInfos;
- (NSString)callId;
- (id)antennaAsString:(int)a3;
- (id)callEventAsString:(int)a3;
- (id)capEventAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionAsString:(int)a3;
- (id)endStatusAsString:(int)a3;
- (id)hcStatAtIndex:(unint64_t)a3;
- (id)rbDataAtIndex:(unint64_t)a3;
- (id)rfMeasInfoAtIndex:(unint64_t)a3;
- (id)setupDirectionAsString:(int)a3;
- (id)setupSysModeAsString:(int)a3;
- (id)sysModeOAsString:(int)a3;
- (id)typeOfCallAsString:(int)a3;
- (int)StringAsAntenna:(id)a3;
- (int)StringAsCallEvent:(id)a3;
- (int)StringAsDirection:(id)a3;
- (int)StringAsEndStatus:(id)a3;
- (int)StringAsSetupDirection:(id)a3;
- (int)StringAsSetupSysMode:(id)a3;
- (int)StringAsSysModeO:(id)a3;
- (int)StringAsTypeOfCall:(id)a3;
- (int)antenna;
- (int)callDuration;
- (int)callEvent;
- (int)direction;
- (int)endStatus;
- (int)lastRsrp;
- (int)lastRssi;
- (int)mtplInPoint1Db;
- (int)setupDirection;
- (int)setupSysMode;
- (int)sysModeO;
- (int)typeOfCall;
- (unint64_t)capEventsCount;
- (unint64_t)delayCntsCount;
- (unint64_t)hash;
- (unint64_t)hcStatsCount;
- (unint64_t)nr5gCellId;
- (unint64_t)rbDatasCount;
- (unint64_t)rfMeasInfosCount;
- (unint64_t)timestamp;
- (unsigned)accessoryAttachedBitmap;
- (unsigned)appCallId;
- (unsigned)audioQosDetectWinLenSec;
- (unsigned)audioQualityThresholdPpt;
- (unsigned)band;
- (unsigned)callConnectDur;
- (unsigned)callSetupTimeMs;
- (unsigned)cellId;
- (unsigned)dedicatedBrInactiveToEndMs;
- (unsigned)delayCntAtIndex:(unint64_t)a3;
- (unsigned)delayCnts;
- (unsigned)drxOn;
- (unsigned)eventId;
- (unsigned)frErasurePpt;
- (unsigned)hoAltSeqNum;
- (unsigned)hstState;
- (unsigned)lac;
- (unsigned)lastMotionState;
- (unsigned)lastXSec;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)msSinceLastMotionState;
- (unsigned)msgId;
- (unsigned)nidO;
- (unsigned)numCps;
- (unsigned)numEnqdSilencePkt;
- (unsigned)numEnqdSpeechPkt;
- (unsigned)numLostPkt;
- (unsigned)numMissedSpeechPkt;
- (unsigned)numMncDigits;
- (unsigned)numPlayedSpeechPkt;
- (unsigned)numRecvdSilencePkt;
- (unsigned)numRecvdSpeechPkt;
- (unsigned)numSpeechQempty;
- (unsigned)numSubs;
- (unsigned)numUflwSilencePkt;
- (unsigned)numUflwSpeechPkt;
- (unsigned)psPref;
- (unsigned)responseCode;
- (unsigned)rfChannel;
- (unsigned)rrcRelCause;
- (unsigned)rtpPktLossPpt;
- (unsigned)sidO;
- (unsigned)subsId;
- (unsigned)tbMs;
- (unsigned)tsAccuracyHour;
- (unsigned)uflwPktPpt;
- (unsigned)version;
- (void)addCapEvent:(id)a3;
- (void)addDelayCnt:(unsigned int)a3;
- (void)addHcStat:(id)a3;
- (void)addRbData:(id)a3;
- (void)addRfMeasInfo:(id)a3;
- (void)clearCapEvents;
- (void)clearDelayCnts;
- (void)clearHcStats;
- (void)clearRbDatas;
- (void)clearRfMeasInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryAttached:(BOOL)a3;
- (void)setAccessoryAttachedBitmap:(unsigned int)a3;
- (void)setAntenna:(int)a3;
- (void)setAppCallId:(unsigned int)a3;
- (void)setAudioQosDetectWinLenSec:(unsigned int)a3;
- (void)setAudioQualityThresholdPpt:(unsigned int)a3;
- (void)setBadAudioQuality:(BOOL)a3;
- (void)setBand:(unsigned int)a3;
- (void)setBarredFromSib1:(BOOL)a3;
- (void)setBarredFromSib2:(BOOL)a3;
- (void)setCallConnectDur:(unsigned int)a3;
- (void)setCallDuration:(int)a3;
- (void)setCallEvent:(int)a3;
- (void)setCallId:(id)a3;
- (void)setCallSetupTimeMs:(unsigned int)a3;
- (void)setCapEvents:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setConnectionRejected:(BOOL)a3;
- (void)setDedicatedBrInactiveToEndMs:(unsigned int)a3;
- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDirection:(int)a3;
- (void)setDrxOn:(unsigned int)a3;
- (void)setDueToHandover:(BOOL)a3;
- (void)setEndStatus:(int)a3;
- (void)setEventId:(unsigned int)a3;
- (void)setFrErasurePpt:(unsigned int)a3;
- (void)setHasAccessoryAttached:(BOOL)a3;
- (void)setHasAccessoryAttachedBitmap:(BOOL)a3;
- (void)setHasAntenna:(BOOL)a3;
- (void)setHasAppCallId:(BOOL)a3;
- (void)setHasAudioQosDetectWinLenSec:(BOOL)a3;
- (void)setHasAudioQualityThresholdPpt:(BOOL)a3;
- (void)setHasBadAudioQuality:(BOOL)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBarredFromSib1:(BOOL)a3;
- (void)setHasBarredFromSib2:(BOOL)a3;
- (void)setHasCallConnectDur:(BOOL)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasCallEvent:(BOOL)a3;
- (void)setHasCallSetupTimeMs:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasConnectionRejected:(BOOL)a3;
- (void)setHasDedicatedBrInactiveToEndMs:(BOOL)a3;
- (void)setHasDirection:(BOOL)a3;
- (void)setHasDrxOn:(BOOL)a3;
- (void)setHasDueToHandover:(BOOL)a3;
- (void)setHasEndStatus:(BOOL)a3;
- (void)setHasEventId:(BOOL)a3;
- (void)setHasFrErasurePpt:(BOOL)a3;
- (void)setHasHoAltSeqNum:(BOOL)a3;
- (void)setHasHstState:(BOOL)a3;
- (void)setHasIsAltStart:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasLastMotionState:(BOOL)a3;
- (void)setHasLastRsrp:(BOOL)a3;
- (void)setHasLastRssi:(BOOL)a3;
- (void)setHasLastXSec:(BOOL)a3;
- (void)setHasLastXSecDlMrab:(BOOL)a3;
- (void)setHasLastXSecUlMrab:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasMsSinceLastMotionState:(BOOL)a3;
- (void)setHasMsgId:(BOOL)a3;
- (void)setHasMtplInPoint1Db:(BOOL)a3;
- (void)setHasNidO:(BOOL)a3;
- (void)setHasNr5gCellId:(BOOL)a3;
- (void)setHasNumCps:(BOOL)a3;
- (void)setHasNumEnqdSilencePkt:(BOOL)a3;
- (void)setHasNumEnqdSpeechPkt:(BOOL)a3;
- (void)setHasNumLostPkt:(BOOL)a3;
- (void)setHasNumMissedSpeechPkt:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasNumPlayedSpeechPkt:(BOOL)a3;
- (void)setHasNumRecvdSilencePkt:(BOOL)a3;
- (void)setHasNumRecvdSpeechPkt:(BOOL)a3;
- (void)setHasNumSpeechQempty:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasNumUflwSilencePkt:(BOOL)a3;
- (void)setHasNumUflwSpeechPkt:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasResponseCode:(BOOL)a3;
- (void)setHasRfChannel:(BOOL)a3;
- (void)setHasRrcRelCause:(BOOL)a3;
- (void)setHasRtpPktLossPpt:(BOOL)a3;
- (void)setHasSetupDirection:(BOOL)a3;
- (void)setHasSetupSysMode:(BOOL)a3;
- (void)setHasSidO:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasSysModeO:(BOOL)a3;
- (void)setHasTbMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTsAccuracyHour:(BOOL)a3;
- (void)setHasTypeOfCall:(BOOL)a3;
- (void)setHasUflwPktPpt:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHcStats:(id)a3;
- (void)setHoAltSeqNum:(unsigned int)a3;
- (void)setHstState:(unsigned int)a3;
- (void)setIsAltStart:(BOOL)a3;
- (void)setLac:(unsigned int)a3;
- (void)setLastAudioQualityCnt:(id)a3;
- (void)setLastMotionState:(unsigned int)a3;
- (void)setLastRsrp:(int)a3;
- (void)setLastRssi:(int)a3;
- (void)setLastXSec:(unsigned int)a3;
- (void)setLastXSecDlMrab:(BOOL)a3;
- (void)setLastXSecUlMrab:(BOOL)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setMsSinceLastMotionState:(unsigned int)a3;
- (void)setMsgId:(unsigned int)a3;
- (void)setMtplInPoint1Db:(int)a3;
- (void)setNidO:(unsigned int)a3;
- (void)setNr5gCellId:(unint64_t)a3;
- (void)setNumCps:(unsigned int)a3;
- (void)setNumEnqdSilencePkt:(unsigned int)a3;
- (void)setNumEnqdSpeechPkt:(unsigned int)a3;
- (void)setNumLostPkt:(unsigned int)a3;
- (void)setNumMissedSpeechPkt:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setNumPlayedSpeechPkt:(unsigned int)a3;
- (void)setNumRecvdSilencePkt:(unsigned int)a3;
- (void)setNumRecvdSpeechPkt:(unsigned int)a3;
- (void)setNumSpeechQempty:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setNumUflwSilencePkt:(unsigned int)a3;
- (void)setNumUflwSpeechPkt:(unsigned int)a3;
- (void)setPlmnO:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRbDatas:(id)a3;
- (void)setResponseCode:(unsigned int)a3;
- (void)setRfChannel:(unsigned int)a3;
- (void)setRfMeasInfos:(id)a3;
- (void)setRrcRelCause:(unsigned int)a3;
- (void)setRtpPktLossPpt:(unsigned int)a3;
- (void)setSetupDirection:(int)a3;
- (void)setSetupSysMode:(int)a3;
- (void)setSidO:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setSysModeO:(int)a3;
- (void)setTbMs:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTsAccuracyHour:(unsigned int)a3;
- (void)setTypeOfCall:(int)a3;
- (void)setUflwPktPpt:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularVoiceCallEvent

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularVoiceCallEvent;
  [(CellularVoiceCallEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasTimestamp
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (int)callEvent
{
  if ((*(void *)&self->_has & 0x400) != 0) {
    return self->_callEvent;
  }
  else {
    return 430;
  }
}

- (void)setCallEvent:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_callEvent = a3;
}

- (void)setHasCallEvent:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCallEvent
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (id)callEventAsString:(int)a3
{
  if ((a3 - 430) >= 5)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100288048 + a3 - 430);
  }

  return v3;
}

- (int)StringAsCallEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VOICE_CALL_START"])
  {
    int v4 = 430;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_RING"])
  {
    int v4 = 431;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_CONNECT"])
  {
    int v4 = 432;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_CANCEL"])
  {
    int v4 = 433;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_END"])
  {
    int v4 = 434;
  }
  else
  {
    int v4 = 430;
  }

  return v4;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (int)direction
{
  if ((*(void *)&self->_has & 0x4000) != 0) {
    return self->_direction;
  }
  else {
    return 0;
  }
}

- (void)setDirection:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasDirection
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (id)directionAsString:(int)a3
{
  if (a3 >= 3)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002880B8 + a3);
  }

  return v3;
}

- (int)StringAsDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_MT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_MO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_UNKNOWN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsAltStart:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 4u;
  self->_isAltStart = a3;
}

- (void)setHasIsAltStart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFB | v3;
}

- (BOOL)hasIsAltStart
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setHoAltSeqNum:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_hoAltSeqNum = a3;
}

- (void)setHasHoAltSeqNum:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasHoAltSeqNum
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setDrxOn:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_drxOn = a3;
}

- (void)setHasDrxOn:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasDrxOn
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (int)endStatus
{
  if ((*(void *)&self->_has & 0x10000) != 0) {
    return self->_endStatus;
  }
  else {
    return 0;
  }
}

- (void)setEndStatus:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_endStatus = a3;
}

- (void)setHasEndStatus:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasEndStatus
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (id)endStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100288070 + a3);
  }

  return v3;
}

- (int)StringAsEndStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VOICE_CALL_END_NORMAL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_END_BY_CANCEL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_END_BY_TIMEOUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_END_ABNORMAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_END_TO_ALT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setRrcRelCause:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_rrcRelCause = a3;
}

- (void)setHasRrcRelCause:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRrcRelCause
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setCallDuration:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCallDuration
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (int)antenna
{
  if ((*(void *)&self->_has & 8) != 0) {
    return self->_antenna;
  }
  else {
    return 0;
  }
}

- (void)setAntenna:(int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAntenna
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 4)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100288098 + a3);
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

- (void)setDueToHandover:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 2u;
  self->_dueToHandover = a3;
}

- (void)setHasDueToHandover:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFD | v3;
}

- (BOOL)hasDueToHandover
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasCellId
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMcc
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasMnc
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasLac
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setBand:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasBand
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setRfChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_rfChannel = a3;
}

- (void)setHasRfChannel:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasRfChannel
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setTsAccuracyHour:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_tsAccuracyHour = a3;
}

- (void)setHasTsAccuracyHour:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTsAccuracyHour
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setAccessoryAttached:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_accessoryAttached = a3;
}

- (void)setHasAccessoryAttached:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAccessoryAttached
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setAccessoryAttachedBitmap:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_accessoryAttachedBitmap = a3;
}

- (void)setHasAccessoryAttachedBitmap:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAccessoryAttachedBitmap
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (int)setupSysMode
{
  if ((*(void *)&self->_has & 0x8000000000000) != 0) {
    return self->_setupSysMode;
  }
  else {
    return 0;
  }
}

- (void)setSetupSysMode:(int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_setupSysMode = a3;
}

- (void)setHasSetupSysMode:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSetupSysMode
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (id)setupSysModeAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    uint64_t v3 = *(&off_1002880D0 + a3);
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
  if ((*(void *)&self->_has & 0x4000000000000) != 0) {
    return self->_setupDirection;
  }
  else {
    return 0;
  }
}

- (void)setSetupDirection:(int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_setupDirection = a3;
}

- (void)setHasSetupDirection:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSetupDirection
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (id)setupDirectionAsString:(int)a3
{
  if (a3 >= 3)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_1002880B8 + a3);
  }

  return v3;
}

- (int)StringAsSetupDirection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_MT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_MO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VOICE_CALL_DIRECTION_UNKNOWN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCallSetupTimeMs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_callSetupTimeMs = a3;
}

- (void)setHasCallSetupTimeMs:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasCallSetupTimeMs
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setMtplInPoint1Db:(int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_mtplInPoint1Db = a3;
}

- (void)setHasMtplInPoint1Db:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasMtplInPoint1Db
{
  return (*(void *)&self->_has >> 30) & 1;
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

- (void)setLastXSec:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_lastXSec = a3;
}

- (void)setHasLastXSec:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasLastXSec
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setLastXSecUlMrab:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 0x10u;
  self->_lastXSecUlMrab = a3;
}

- (void)setHasLastXSecUlMrab:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xEF | v3;
}

- (BOOL)hasLastXSecUlMrab
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setLastXSecDlMrab:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 8u;
  self->_lastXSecDlMrab = a3;
}

- (void)setHasLastXSecDlMrab:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xF7 | v3;
}

- (BOOL)hasLastXSecDlMrab
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)clearRbDatas
{
}

- (void)addRbData:(id)a3
{
  id v4 = a3;
  rbDatas = self->_rbDatas;
  id v8 = v4;
  if (!rbDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rbDatas;
    self->_rbDatas = v6;

    id v4 = v8;
    rbDatas = self->_rbDatas;
  }
  [(NSMutableArray *)rbDatas addObject:v4];
}

- (unint64_t)rbDatasCount
{
  return (unint64_t)[(NSMutableArray *)self->_rbDatas count];
}

- (id)rbDataAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_rbDatas objectAtIndex:a3];
}

+ (Class)rbDataType
{
  return (Class)objc_opt_class();
}

- (void)setMsgId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_msgId = a3;
}

- (void)setHasMsgId:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasMsgId
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setEventId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_eventId = a3;
}

- (void)setHasEventId:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasEventId
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setResponseCode:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasResponseCode
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setCallConnectDur:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_callConnectDur = a3;
}

- (void)setHasCallConnectDur:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCallConnectDur
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setTbMs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_tbMs = a3;
}

- (void)setHasTbMs:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTbMs
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)clearHcStats
{
}

- (void)addHcStat:(id)a3
{
  id v4 = a3;
  hcStats = self->_hcStats;
  id v8 = v4;
  if (!hcStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_hcStats;
    self->_hcStats = v6;

    id v4 = v8;
    hcStats = self->_hcStats;
  }
  [(NSMutableArray *)hcStats addObject:v4];
}

- (unint64_t)hcStatsCount
{
  return (unint64_t)[(NSMutableArray *)self->_hcStats count];
}

- (id)hcStatAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_hcStats objectAtIndex:a3];
}

+ (Class)hcStatType
{
  return (Class)objc_opt_class();
}

- (void)setNumRecvdSpeechPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_numRecvdSpeechPkt = a3;
}

- (void)setHasNumRecvdSpeechPkt:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumRecvdSpeechPkt
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setNumRecvdSilencePkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_numRecvdSilencePkt = a3;
}

- (void)setHasNumRecvdSilencePkt:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasNumRecvdSilencePkt
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setNumLostPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_numLostPkt = a3;
}

- (void)setHasNumLostPkt:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasNumLostPkt
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (void)setNumUflwSpeechPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_numUflwSpeechPkt = a3;
}

- (void)setHasNumUflwSpeechPkt:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumUflwSpeechPkt
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setNumUflwSilencePkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_numUflwSilencePkt = a3;
}

- (void)setHasNumUflwSilencePkt:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasNumUflwSilencePkt
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (void)setNumEnqdSpeechPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_numEnqdSpeechPkt = a3;
}

- (void)setHasNumEnqdSpeechPkt:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasNumEnqdSpeechPkt
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setNumEnqdSilencePkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_numEnqdSilencePkt = a3;
}

- (void)setHasNumEnqdSilencePkt:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasNumEnqdSilencePkt
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setNumPlayedSpeechPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_numPlayedSpeechPkt = a3;
}

- (void)setHasNumPlayedSpeechPkt:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasNumPlayedSpeechPkt
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setNumMissedSpeechPkt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_numMissedSpeechPkt = a3;
}

- (void)setHasNumMissedSpeechPkt:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasNumMissedSpeechPkt
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setNumSpeechQempty:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_numSpeechQempty = a3;
}

- (void)setHasNumSpeechQempty:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumSpeechQempty
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setAppCallId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_appCallId = a3;
}

- (void)setHasAppCallId:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAppCallId
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (unint64_t)delayCntsCount
{
  return self->_delayCnts.count;
}

- (unsigned)delayCnts
{
  return self->_delayCnts.list;
}

- (void)clearDelayCnts
{
}

- (void)addDelayCnt:(unsigned int)a3
{
}

- (unsigned)delayCntAtIndex:(unint64_t)a3
{
  p_delayCnts = &self->_delayCnts;
  unint64_t count = self->_delayCnts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_delayCnts->list[a3];
}

- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setDedicatedBrInactiveToEndMs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_dedicatedBrInactiveToEndMs = a3;
}

- (void)setHasDedicatedBrInactiveToEndMs:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasDedicatedBrInactiveToEndMs
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (BOOL)hasLastAudioQualityCnt
{
  return self->_lastAudioQualityCnt != 0;
}

- (void)setRtpPktLossPpt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_rtpPktLossPpt = a3;
}

- (void)setHasRtpPktLossPpt:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRtpPktLossPpt
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setUflwPktPpt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_uflwPktPpt = a3;
}

- (void)setHasUflwPktPpt:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUflwPktPpt
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setFrErasurePpt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_frErasurePpt = a3;
}

- (void)setHasFrErasurePpt:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasFrErasurePpt
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setBadAudioQuality:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_badAudioQuality = a3;
}

- (void)setHasBadAudioQuality:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBadAudioQuality
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setAudioQualityThresholdPpt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_audioQualityThresholdPpt = a3;
}

- (void)setHasAudioQualityThresholdPpt:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAudioQualityThresholdPpt
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setAudioQosDetectWinLenSec:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_audioQosDetectWinLenSec = a3;
}

- (void)setHasAudioQosDetectWinLenSec:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAudioQosDetectWinLenSec
{
  return (*(void *)&self->_has >> 5) & 1;
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

- (void)setHstState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_hstState = a3;
}

- (void)setHasHstState:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasHstState
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPsPref
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasNumSubs
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setNumCps:(unsigned int)a3
{
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_numCps = a3;
}

- (void)setHasNumCps:(BOOL)a3
{
  uint64_t v3 = &_mh_execute_header;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3;
}

- (BOOL)hasNumCps
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (int)sysModeO
{
  if ((*(void *)&self->_has & 0x40000000000000) != 0) {
    return self->_sysModeO;
  }
  else {
    return 0;
  }
}

- (void)setSysModeO:(int)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_sysModeO = a3;
}

- (void)setHasSysModeO:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSysModeO
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (id)sysModeOAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    uint64_t v3 = *(&off_1002880D0 + a3);
  }
  else
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsSysModeO:(id)a3
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

- (void)setSidO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_sidO = a3;
}

- (void)setHasSidO:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSidO
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setNidO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_nidO = a3;
}

- (void)setHasNidO:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasNidO
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (BOOL)hasPlmnO
{
  return self->_plmnO != 0;
}

- (void)setLastRssi:(int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_lastRssi = a3;
}

- (void)setHasLastRssi:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasLastRssi
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setLastRsrp:(int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_lastRsrp = a3;
}

- (void)setHasLastRsrp:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasLastRsrp
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setBarredFromSib1:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_barredFromSib1 = a3;
}

- (void)setHasBarredFromSib1:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBarredFromSib1
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setBarredFromSib2:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_barredFromSib2 = a3;
}

- (void)setHasBarredFromSib2:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasBarredFromSib2
{
  return *(void *)&self->_has >> 63;
}

- (void)setConnectionRejected:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 1u;
  self->_connectionRejected = a3;
}

- (void)setHasConnectionRejected:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFE | a3;
}

- (BOOL)hasConnectionRejected
{
  return *((unsigned char *)&self->_has + 8) & 1;
}

- (void)setLastMotionState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_lastMotionState = a3;
}

- (void)setHasLastMotionState:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasLastMotionState
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setMsSinceLastMotionState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_msSinceLastMotionState = a3;
}

- (void)setHasMsSinceLastMotionState:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasMsSinceLastMotionState
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasVersion
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubsId
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (int)typeOfCall
{
  if ((*(void *)&self->_has & 0x200000000000000) != 0) {
    return self->_typeOfCall;
  }
  else {
    return 0;
  }
}

- (void)setTypeOfCall:(int)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_typeOfCall = a3;
}

- (void)setHasTypeOfCall:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTypeOfCall
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (id)typeOfCallAsString:(int)a3
{
  if (a3 >= 5)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    uint64_t v3 = *(&off_100288150 + a3);
  }

  return v3;
}

- (int)StringAsTypeOfCall:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VoNR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VoLTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EPSFB"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VoNR_VoLTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNr5gCellId:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_nr5gCellId = a3;
}

- (void)setHasNr5gCellId:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasNr5gCellId
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularVoiceCallEvent;
  id v3 = [(CellularVoiceCallEvent *)&v7 description];
  int v4 = [(CellularVoiceCallEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    int v6 = self->_callEvent - 430;
    if (v6 >= 5)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_callEvent];
    }
    else
    {
      objc_super v7 = *(&off_100288048 + v6);
    }
    [v3 setObject:v7 forKey:@"call_event"];
  }
  callId = self->_callId;
  if (callId) {
    [v3 setObject:callId forKey:@"call_id"];
  }
  p_uint64_t has = &self->_has;
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    uint64_t direction = self->_direction;
    if (direction >= 3)
    {
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_direction];
    }
    else
    {
      v12 = *(&off_1002880B8 + direction);
    }
    [v3 setObject:v12 forKey:@"direction"];

    p_uint64_t has = &self->_has;
    uint64_t v10 = (uint64_t)self->_has;
  }
  char v13 = *((unsigned char *)p_has + 8);
  if ((v13 & 4) != 0)
  {
    v74 = +[NSNumber numberWithBool:self->_isAltStart];
    [v3 setObject:v74 forKey:@"is_alt_start"];

    uint64_t v10 = (uint64_t)self->_has;
    char v13 = *((unsigned char *)&self->_has + 8);
    if ((v10 & 0x80000) == 0)
    {
LABEL_17:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_138;
    }
  }
  else if ((v10 & 0x80000) == 0)
  {
    goto LABEL_17;
  }
  v75 = +[NSNumber numberWithUnsignedInt:self->_hoAltSeqNum];
  [v3 setObject:v75 forKey:@"ho_alt_seq_num"];

  uint64_t v10 = (uint64_t)self->_has;
  char v13 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x8000) == 0)
  {
LABEL_18:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_139;
  }
LABEL_138:
  v76 = +[NSNumber numberWithUnsignedInt:self->_drxOn];
  [v3 setObject:v76 forKey:@"drx_on"];

  uint64_t v10 = (uint64_t)self->_has;
  char v13 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x10000) == 0)
  {
LABEL_19:
    if ((v10 & 0x1000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_194;
  }
LABEL_139:
  uint64_t endStatus = self->_endStatus;
  if (endStatus >= 5)
  {
    v78 = +[NSString stringWithFormat:@"(unknown: %i)", self->_endStatus];
  }
  else
  {
    v78 = *(&off_100288070 + endStatus);
  }
  [v3 setObject:v78 forKey:@"end_status"];

  uint64_t v10 = (uint64_t)self->_has;
  char v13 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x1000000000000) == 0)
  {
LABEL_20:
    if ((v10 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_195;
  }
LABEL_194:
  v125 = +[NSNumber numberWithUnsignedInt:self->_rrcRelCause];
  [v3 setObject:v125 forKey:@"rrc_rel_cause"];

  uint64_t v10 = (uint64_t)self->_has;
  char v13 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_196;
  }
LABEL_195:
  v126 = +[NSNumber numberWithInt:self->_callDuration];
  [v3 setObject:v126 forKey:@"call_duration"];

  uint64_t v10 = (uint64_t)self->_has;
  char v13 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 8) == 0)
  {
LABEL_22:
    if ((v13 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_203;
  }
LABEL_196:
  uint64_t antenna = self->_antenna;
  if (antenna >= 4)
  {
    v128 = +[NSString stringWithFormat:@"(unknown: %i)", self->_antenna];
  }
  else
  {
    v128 = *(&off_100288098 + antenna);
  }
  [v3 setObject:v128 forKey:@"antenna"];

  uint64_t v10 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 2) == 0)
  {
LABEL_23:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_203:
  v129 = +[NSNumber numberWithBool:self->_dueToHandover];
  [v3 setObject:v129 forKey:@"due_to_handover"];

  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_24:
    v14 = +[NSNumber numberWithUnsignedInt:self->_cellId];
    [v3 setObject:v14 forKey:@"cell_id"];
  }
LABEL_25:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  v16 = &self->_has;
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000000000) != 0)
  {
    v79 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
    [v3 setObject:v79 forKey:@"num_mnc_digits"];

    uint64_t v17 = *(void *)v16;
    if ((*(void *)v16 & 0x4000000) == 0)
    {
LABEL_29:
      if ((v17 & 0x8000000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_143;
    }
  }
  else if ((v17 & 0x4000000) == 0)
  {
    goto LABEL_29;
  }
  v80 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v80 forKey:@"mcc"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000) == 0)
  {
LABEL_30:
    if ((v17 & 0x200000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_144;
  }
LABEL_143:
  v81 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v81 forKey:@"mnc"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x200000) == 0)
  {
LABEL_31:
    if ((v17 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_145;
  }
LABEL_144:
  v82 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v82 forKey:@"lac"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_32:
    if ((v17 & 0x800000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_146;
  }
LABEL_145:
  v83 = +[NSNumber numberWithUnsignedInt:self->_band];
  [v3 setObject:v83 forKey:@"band"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000000) == 0)
  {
LABEL_33:
    if ((v17 & 0x100000000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_147;
  }
LABEL_146:
  v84 = +[NSNumber numberWithUnsignedInt:self->_rfChannel];
  [v3 setObject:v84 forKey:@"rf_channel"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x100000000000000) == 0)
  {
LABEL_34:
    if ((v17 & 0x1000000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_148;
  }
LABEL_147:
  v85 = +[NSNumber numberWithUnsignedInt:self->_tsAccuracyHour];
  [v3 setObject:v85 forKey:@"ts_accuracy_hour"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000000000000) == 0)
  {
LABEL_35:
    if ((v17 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_149;
  }
LABEL_148:
  v86 = +[NSNumber numberWithBool:self->_accessoryAttached];
  [v3 setObject:v86 forKey:@"accessory_attached"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 4) == 0)
  {
LABEL_36:
    if ((v17 & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_150;
  }
LABEL_149:
  v87 = +[NSNumber numberWithUnsignedInt:self->_accessoryAttachedBitmap];
  [v3 setObject:v87 forKey:@"accessory_attached_bitmap"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((v17 & 0x4000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_207;
  }
LABEL_150:
  uint64_t setupSysMode = self->_setupSysMode;
  if setupSysMode < 0x10 && ((0x9FFFu >> setupSysMode))
  {
    v89 = *(&off_1002880D0 + setupSysMode);
  }
  else
  {
    v89 = +[NSString stringWithFormat:@"(unknown: %i)", self->_setupSysMode];
  }
  [v3 setObject:v89 forKey:@"setup_sys_mode"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((v17 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_211;
  }
LABEL_207:
  uint64_t setupDirection = self->_setupDirection;
  if (setupDirection >= 3)
  {
    v131 = +[NSString stringWithFormat:@"(unknown: %i)", self->_setupDirection];
  }
  else
  {
    v131 = *(&off_1002880B8 + setupDirection);
  }
  [v3 setObject:v131 forKey:@"setup_direction"];

  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_39:
    if ((v17 & 0x40000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_211:
  v132 = +[NSNumber numberWithUnsignedInt:self->_callSetupTimeMs];
  [v3 setObject:v132 forKey:@"call_setup_time_ms"];

  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_40:
    v18 = +[NSNumber numberWithInt:self->_mtplInPoint1Db];
    [v3 setObject:v18 forKey:@"mtpl_in_point_1_db"];
  }
LABEL_41:
  if ([(NSMutableArray *)self->_capEvents count])
  {
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_capEvents, "count")];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    v20 = self->_capEvents;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v146 objects:v153 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v147;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v147 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v146 + 1) + 8 * i) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v146 objects:v153 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"cap_event"];
  }
  if ((*(void *)&self->_has & 0x2000000) != 0)
  {
    v26 = +[NSNumber numberWithUnsignedInt:self->_lastXSec];
    [v3 setObject:v26 forKey:@"last_x_sec"];
  }
  char v27 = *((unsigned char *)&self->_has + 8);
  if ((v27 & 0x10) != 0)
  {
    v28 = +[NSNumber numberWithBool:self->_lastXSecUlMrab];
    [v3 setObject:v28 forKey:@"last_x_sec_ul_mrab"];

    char v27 = *((unsigned char *)&self->_has + 8);
  }
  if ((v27 & 8) != 0)
  {
    v29 = +[NSNumber numberWithBool:self->_lastXSecDlMrab];
    [v3 setObject:v29 forKey:@"last_x_sec_dl_mrab"];
  }
  if ([(NSMutableArray *)self->_rbDatas count])
  {
    id v30 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_rbDatas, "count")];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v31 = self->_rbDatas;
    id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v142 objects:v152 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v143;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v143 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [*(id *)(*((void *)&v142 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v30 addObject:v36];
        }
        id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v142 objects:v152 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKey:@"rb_data"];
  }
  v37 = &self->_has;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x20000000) != 0)
  {
    v90 = +[NSNumber numberWithUnsignedInt:self->_msgId];
    [v3 setObject:v90 forKey:@"msg_id"];

    uint64_t v38 = *(void *)v37;
    if ((*(void *)v37 & 0x20000) == 0)
    {
LABEL_67:
      if ((v38 & 0x400000000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_155;
    }
  }
  else if ((v38 & 0x20000) == 0)
  {
    goto LABEL_67;
  }
  v91 = +[NSNumber numberWithUnsignedInt:self->_eventId];
  [v3 setObject:v91 forKey:@"event_id"];

  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x400000000000) == 0)
  {
LABEL_68:
    if ((v38 & 0x100) == 0) {
      goto LABEL_69;
    }
    goto LABEL_156;
  }
LABEL_155:
  v92 = +[NSNumber numberWithUnsignedInt:self->_responseCode];
  [v3 setObject:v92 forKey:@"response_code"];

  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x100) == 0)
  {
LABEL_69:
    if ((v38 & 0x80000000000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
LABEL_156:
  v93 = +[NSNumber numberWithUnsignedInt:self->_callConnectDur];
  [v3 setObject:v93 forKey:@"call_connect_dur"];

  if ((*(void *)&self->_has & 0x80000000000000) != 0)
  {
LABEL_70:
    v39 = +[NSNumber numberWithUnsignedInt:self->_tbMs];
    [v3 setObject:v39 forKey:@"tb_ms"];
  }
LABEL_71:
  if ([(NSMutableArray *)self->_hcStats count])
  {
    id v40 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_hcStats, "count")];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v41 = self->_hcStats;
    id v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v138 objects:v151 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v139;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v139 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = [*(id *)(*((void *)&v138 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v40 addObject:v46];
        }
        id v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v138 objects:v151 count:16];
      }
      while (v43);
    }

    [v3 setObject:v40 forKey:@"hc_stat"];
  }
  v47 = &self->_has;
  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x10000000000) != 0)
  {
    v94 = +[NSNumber numberWithUnsignedInt:self->_numRecvdSpeechPkt];
    [v3 setObject:v94 forKey:@"num_recvd_speech_pkt"];

    uint64_t v48 = *(void *)v47;
    if ((*(void *)v47 & 0x8000000000) == 0)
    {
LABEL_82:
      if ((v48 & 0x800000000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_160;
    }
  }
  else if ((v48 & 0x8000000000) == 0)
  {
    goto LABEL_82;
  }
  v95 = +[NSNumber numberWithUnsignedInt:self->_numRecvdSilencePkt];
  [v3 setObject:v95 forKey:@"num_recvd_silence_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x800000000) == 0)
  {
LABEL_83:
    if ((v48 & 0x100000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_161;
  }
LABEL_160:
  v96 = +[NSNumber numberWithUnsignedInt:self->_numLostPkt];
  [v3 setObject:v96 forKey:@"num_lost_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x100000000000) == 0)
  {
LABEL_84:
    if ((v48 & 0x80000000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_162;
  }
LABEL_161:
  v97 = +[NSNumber numberWithUnsignedInt:self->_numUflwSpeechPkt];
  [v3 setObject:v97 forKey:@"num_uflw_speech_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x80000000000) == 0)
  {
LABEL_85:
    if ((v48 & 0x400000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_163;
  }
LABEL_162:
  v98 = +[NSNumber numberWithUnsignedInt:self->_numUflwSilencePkt];
  [v3 setObject:v98 forKey:@"num_uflw_silence_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x400000000) == 0)
  {
LABEL_86:
    if ((v48 & 0x200000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_164;
  }
LABEL_163:
  v99 = +[NSNumber numberWithUnsignedInt:self->_numEnqdSpeechPkt];
  [v3 setObject:v99 forKey:@"num_enqd_speech_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x200000000) == 0)
  {
LABEL_87:
    if ((v48 & 0x4000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_165;
  }
LABEL_164:
  v100 = +[NSNumber numberWithUnsignedInt:self->_numEnqdSilencePkt];
  [v3 setObject:v100 forKey:@"num_enqd_silence_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x4000000000) == 0)
  {
LABEL_88:
    if ((v48 & 0x1000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_166;
  }
LABEL_165:
  v101 = +[NSNumber numberWithUnsignedInt:self->_numPlayedSpeechPkt];
  [v3 setObject:v101 forKey:@"num_played_speech_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x1000000000) == 0)
  {
LABEL_89:
    if ((v48 & 0x20000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_167;
  }
LABEL_166:
  v102 = +[NSNumber numberWithUnsignedInt:self->_numMissedSpeechPkt];
  [v3 setObject:v102 forKey:@"num_missed_speech_pkt"];

  uint64_t v48 = (uint64_t)self->_has;
  if ((v48 & 0x20000000000) == 0)
  {
LABEL_90:
    if ((v48 & 0x10) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_167:
  v103 = +[NSNumber numberWithUnsignedInt:self->_numSpeechQempty];
  [v3 setObject:v103 forKey:@"num_speech_qempty"];

  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_91:
    v49 = +[NSNumber numberWithUnsignedInt:self->_appCallId];
    [v3 setObject:v49 forKey:@"app_call_id"];
  }
LABEL_92:
  v50 = PBRepeatedUInt32NSArray();
  [v3 setObject:v50 forKey:@"delay_cnt"];

  if ((*(void *)&self->_has & 0x2000) != 0)
  {
    v51 = +[NSNumber numberWithUnsignedInt:self->_dedicatedBrInactiveToEndMs];
    [v3 setObject:v51 forKey:@"dedicated_br_inactive_to_end_ms"];
  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  if (lastAudioQualityCnt)
  {
    v53 = [lastAudioQualityCnt dictionaryRepresentation];
    [v3 setObject:v53 forKey:@"last_audio_quality_cnt"];
  }
  v54 = &self->_has;
  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x2000000000000) != 0)
  {
    v104 = +[NSNumber numberWithUnsignedInt:self->_rtpPktLossPpt];
    [v3 setObject:v104 forKey:@"rtp_pkt_loss_ppt"];

    uint64_t v55 = *(void *)v54;
    if ((*(void *)v54 & 0x400000000000000) == 0)
    {
LABEL_98:
      if ((v55 & 0x40000) == 0) {
        goto LABEL_99;
      }
      goto LABEL_171;
    }
  }
  else if ((v55 & 0x400000000000000) == 0)
  {
    goto LABEL_98;
  }
  v105 = +[NSNumber numberWithUnsignedInt:self->_uflwPktPpt];
  [v3 setObject:v105 forKey:@"uflw_pkt_ppt"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x40000) == 0)
  {
LABEL_99:
    if ((v55 & 0x2000000000000000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_172;
  }
LABEL_171:
  v106 = +[NSNumber numberWithUnsignedInt:self->_frErasurePpt];
  [v3 setObject:v106 forKey:@"fr_erasure_ppt"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x2000000000000000) == 0)
  {
LABEL_100:
    if ((v55 & 0x40) == 0) {
      goto LABEL_101;
    }
    goto LABEL_173;
  }
LABEL_172:
  v107 = +[NSNumber numberWithBool:self->_badAudioQuality];
  [v3 setObject:v107 forKey:@"bad_audio_quality"];

  uint64_t v55 = (uint64_t)self->_has;
  if ((v55 & 0x40) == 0)
  {
LABEL_101:
    if ((v55 & 0x20) == 0) {
      goto LABEL_103;
    }
    goto LABEL_102;
  }
LABEL_173:
  v108 = +[NSNumber numberWithUnsignedInt:self->_audioQualityThresholdPpt];
  [v3 setObject:v108 forKey:@"audio_quality_threshold_ppt"];

  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_102:
    v56 = +[NSNumber numberWithUnsignedInt:self->_audioQosDetectWinLenSec];
    [v3 setObject:v56 forKey:@"audio_qos_detect_win_len_sec"];
  }
LABEL_103:
  if ([(NSMutableArray *)self->_rfMeasInfos count])
  {
    id v57 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_rfMeasInfos, "count")];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    v58 = self->_rfMeasInfos;
    id v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v134 objects:v150 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v135;
      do
      {
        for (m = 0; m != v60; m = (char *)m + 1)
        {
          if (*(void *)v135 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [*(id *)(*((void *)&v134 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        id v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v134 objects:v150 count:16];
      }
      while (v60);
    }

    [v3 setObject:v57 forKey:@"rf_meas_info"];
  }
  v64 = &self->_has;
  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x100000) != 0)
  {
    v109 = +[NSNumber numberWithUnsignedInt:self->_hstState];
    [v3 setObject:v109 forKey:@"hst_state"];

    uint64_t v65 = *(void *)v64;
    if ((*(void *)v64 & 0x200000000000) == 0)
    {
LABEL_114:
      if ((v65 & 0x40000000000) == 0) {
        goto LABEL_115;
      }
      goto LABEL_177;
    }
  }
  else if ((v65 & 0x200000000000) == 0)
  {
    goto LABEL_114;
  }
  v110 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v110 forKey:@"ps_pref"];

  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x40000000000) == 0)
  {
LABEL_115:
    if ((v65 & 0x100000000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_178;
  }
LABEL_177:
  v111 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v111 forKey:@"num_subs"];

  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x100000000) == 0)
  {
LABEL_116:
    if ((v65 & 0x40000000000000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_179;
  }
LABEL_178:
  v112 = +[NSNumber numberWithUnsignedInt:self->_numCps];
  [v3 setObject:v112 forKey:@"num_cps"];

  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x40000000000000) == 0)
  {
LABEL_117:
    if ((v65 & 0x10000000000000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_215;
  }
LABEL_179:
  uint64_t sysModeO = self->_sysModeO;
  if sysModeO < 0x10 && ((0x9FFFu >> sysModeO))
  {
    v114 = *(&off_1002880D0 + sysModeO);
  }
  else
  {
    v114 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sysModeO];
  }
  [v3 setObject:v114 forKey:@"sys_mode_o"];

  uint64_t v65 = (uint64_t)self->_has;
  if ((v65 & 0x10000000000000) == 0)
  {
LABEL_118:
    if ((v65 & 0x80000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_119;
  }
LABEL_215:
  v133 = +[NSNumber numberWithUnsignedInt:self->_sidO];
  [v3 setObject:v133 forKey:@"sid_o"];

  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_119:
    v66 = +[NSNumber numberWithUnsignedInt:self->_nidO];
    [v3 setObject:v66 forKey:@"nid_o"];
  }
LABEL_120:
  plmnO = self->_plmnO;
  if (plmnO) {
    [v3 setObject:plmnO forKey:@"plmn_o"];
  }
  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x1000000) != 0)
  {
    v69 = +[NSNumber numberWithInt:self->_lastRssi];
    [v3 setObject:v69 forKey:@"last_rssi"];

    uint64_t v68 = (uint64_t)self->_has;
  }
  char v70 = *((unsigned char *)&self->_has + 8);
  if ((v68 & 0x800000) != 0)
  {
    v115 = +[NSNumber numberWithInt:self->_lastRsrp];
    [v3 setObject:v115 forKey:@"last_rsrp"];

    uint64_t v68 = (uint64_t)self->_has;
    char v70 = *((unsigned char *)&self->_has + 8);
    if ((v68 & 0x4000000000000000) == 0)
    {
LABEL_126:
      if ((v68 & 0x8000000000000000) == 0) {
        goto LABEL_127;
      }
      goto LABEL_184;
    }
  }
  else if ((v68 & 0x4000000000000000) == 0)
  {
    goto LABEL_126;
  }
  v116 = +[NSNumber numberWithBool:self->_barredFromSib1];
  [v3 setObject:v116 forKey:@"barred_from_sib1"];

  uint64_t v68 = (uint64_t)self->_has;
  char v70 = *((unsigned char *)&self->_has + 8);
  if ((v68 & 0x8000000000000000) == 0)
  {
LABEL_127:
    if ((v70 & 1) == 0) {
      goto LABEL_128;
    }
    goto LABEL_185;
  }
LABEL_184:
  v117 = +[NSNumber numberWithBool:self->_barredFromSib2];
  [v3 setObject:v117 forKey:@"barred_from_sib2"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_128:
    if ((v68 & 0x400000) == 0) {
      goto LABEL_129;
    }
    goto LABEL_186;
  }
LABEL_185:
  v118 = +[NSNumber numberWithBool:self->_connectionRejected];
  [v3 setObject:v118 forKey:@"connection_rejected"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x400000) == 0)
  {
LABEL_129:
    if ((v68 & 0x10000000) == 0) {
      goto LABEL_130;
    }
    goto LABEL_187;
  }
LABEL_186:
  v119 = +[NSNumber numberWithUnsignedInt:self->_lastMotionState];
  [v3 setObject:v119 forKey:@"last_motion_state"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x10000000) == 0)
  {
LABEL_130:
    if ((v68 & 0x800000000000000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_188;
  }
LABEL_187:
  v120 = +[NSNumber numberWithUnsignedInt:self->_msSinceLastMotionState];
  [v3 setObject:v120 forKey:@"ms_since_last_motion_state"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x800000000000000) == 0)
  {
LABEL_131:
    if ((v68 & 0x20000000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_189;
  }
LABEL_188:
  v121 = +[NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v121 forKey:@"version"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x20000000000000) == 0)
  {
LABEL_132:
    if ((v68 & 0x200000000000000) == 0) {
      goto LABEL_133;
    }
LABEL_190:
    uint64_t typeOfCall = self->_typeOfCall;
    if (typeOfCall >= 5)
    {
      v124 = +[NSString stringWithFormat:@"(unknown: %i)", self->_typeOfCall];
    }
    else
    {
      v124 = *(&off_100288150 + typeOfCall);
    }
    [v3 setObject:v124 forKey:@"type_of_call"];

    if (*(void *)&self->_has) {
      goto LABEL_134;
    }
    goto LABEL_135;
  }
LABEL_189:
  v122 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v122 forKey:@"subs_id"];

  uint64_t v68 = (uint64_t)self->_has;
  if ((v68 & 0x200000000000000) != 0) {
    goto LABEL_190;
  }
LABEL_133:
  if (v68)
  {
LABEL_134:
    v71 = +[NSNumber numberWithUnsignedLongLong:self->_nr5gCellId];
    [v3 setObject:v71 forKey:@"nr5g_cell_id"];
  }
LABEL_135:
  id v72 = v3;

  return v72;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000FFDE4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_callId) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = (uint64_t)self->_has;
  }
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = (uint64_t)self->_has;
    char v7 = *((unsigned char *)&self->_has + 8);
    if ((v6 & 0x80000) == 0)
    {
LABEL_11:
      if ((v6 & 0x8000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x8000) == 0)
  {
LABEL_12:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x10000) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteSint32Field();
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt32Field();
  uint64_t v6 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 2) == 0)
  {
LABEL_17:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_132:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x1000) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_simHplmn) {
    PBDataWriterWriteDataField();
  }
  p_uint64_t has = &self->_has;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x2000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v9 = *(void *)p_has;
    if ((*(void *)p_has & 0x4000000) == 0)
    {
LABEL_23:
      if ((v9 & 0x8000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_136;
    }
  }
  else if ((v9 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x200000) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_26:
    if ((v9 & 0x800000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x1000000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v9 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_30:
    if ((v9 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v9 & 0x4000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteInt32Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x800) == 0)
  {
LABEL_33:
    if ((v9 & 0x40000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_145:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x40000000) != 0) {
LABEL_34:
  }
    PBDataWriterWriteInt32Field();
LABEL_35:
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v10 = self->_capEvents;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v12);
  }

  if ((*(void *)&self->_has & 0x2000000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  char v15 = *((unsigned char *)&self->_has + 8);
  if ((v15 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v15 = *((unsigned char *)&self->_has + 8);
  }
  if ((v15 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v16 = self->_rbDatas;
  uint64_t v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v17)
  {
    v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v18);
  }

  id v21 = &self->_has;
  uint64_t v22 = (uint64_t)self->_has;
  if ((v22 & 0x20000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v22 = *(void *)v21;
    if ((*(void *)v21 & 0x20000) == 0)
    {
LABEL_57:
      if ((v22 & 0x400000000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_149;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v22 = (uint64_t)self->_has;
  if ((v22 & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v22 & 0x100) == 0) {
      goto LABEL_59;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  uint64_t v22 = (uint64_t)self->_has;
  if ((v22 & 0x100) == 0)
  {
LABEL_59:
    if ((v22 & 0x80000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x80000000000000) != 0) {
LABEL_60:
  }
    PBDataWriterWriteUint32Field();
LABEL_61:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v23 = self->_hcStats;
  v24 = (char *)[(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v24)
  {
    v25 = v24;
    uint64_t v26 = *(void *)v47;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
      }
      v25 = (char *)[(NSMutableArray *)v23 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v25);
  }

  v28 = &self->_has;
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x10000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v29 = *(void *)v28;
    if ((*(void *)v28 & 0x8000000000) == 0)
    {
LABEL_70:
      if ((v29 & 0x800000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_154;
    }
  }
  else if ((v29 & 0x8000000000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v29 & 0x100000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x100000000000) == 0)
  {
LABEL_72:
    if ((v29 & 0x80000000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x80000000000) == 0)
  {
LABEL_73:
    if ((v29 & 0x400000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x400000000) == 0)
  {
LABEL_74:
    if ((v29 & 0x200000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x200000000) == 0)
  {
LABEL_75:
    if ((v29 & 0x4000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x4000000000) == 0)
  {
LABEL_76:
    if ((v29 & 0x1000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((v29 & 0x20000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint32Field();
  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((v29 & 0x10) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_161:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x10) != 0) {
LABEL_79:
  }
    PBDataWriterWriteUint32Field();
LABEL_80:
  if (self->_delayCnts.count)
  {
    unint64_t v30 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v30;
    }
    while (v30 < self->_delayCnts.count);
  }
  if ((*(void *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_lastAudioQualityCnt) {
    PBDataWriterWriteSubmessage();
  }
  v31 = &self->_has;
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v32 = *(void *)v31;
    if ((*(void *)v31 & 0x400000000000000) == 0)
    {
LABEL_89:
      if ((v32 & 0x40000) == 0) {
        goto LABEL_90;
      }
      goto LABEL_165;
    }
  }
  else if ((v32 & 0x400000000000000) == 0)
  {
    goto LABEL_89;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x40000) == 0)
  {
LABEL_90:
    if ((v32 & 0x2000000000000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint32Field();
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x2000000000000000) == 0)
  {
LABEL_91:
    if ((v32 & 0x40) == 0) {
      goto LABEL_92;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteBOOLField();
  uint64_t v32 = (uint64_t)self->_has;
  if ((v32 & 0x40) == 0)
  {
LABEL_92:
    if ((v32 & 0x20) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_167:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x20) != 0) {
LABEL_93:
  }
    PBDataWriterWriteUint32Field();
LABEL_94:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v33 = self->_rfMeasInfos;
  uint64_t v34 = (char *)[(NSMutableArray *)v33 countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v34)
  {
    v35 = v34;
    uint64_t v36 = *(void *)v43;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(v33);
        }
        PBDataWriterWriteSubmessage();
      }
      v35 = (char *)[(NSMutableArray *)v33 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v35);
  }

  uint64_t v38 = &self->_has;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v39 = *(void *)v38;
    if ((*(void *)v38 & 0x200000000000) == 0)
    {
LABEL_103:
      if ((v39 & 0x40000000000) == 0) {
        goto LABEL_104;
      }
      goto LABEL_171;
    }
  }
  else if ((v39 & 0x200000000000) == 0)
  {
    goto LABEL_103;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000) == 0)
  {
LABEL_104:
    if ((v39 & 0x100000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteUint32Field();
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v39 & 0x40000000000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteUint32Field();
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000000) == 0)
  {
LABEL_106:
    if ((v39 & 0x10000000000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteInt32Field();
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x10000000000000) == 0)
  {
LABEL_107:
    if ((v39 & 0x80000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_174:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x80000000) != 0) {
LABEL_108:
  }
    PBDataWriterWriteUint32Field();
LABEL_109:
  if (self->_plmnO) {
    PBDataWriterWriteDataField();
  }
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v40 = (uint64_t)self->_has;
  }
  char v41 = *((unsigned char *)&self->_has + 8);
  if ((v40 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v40 = (uint64_t)self->_has;
    char v41 = *((unsigned char *)&self->_has + 8);
    if ((v40 & 0x4000000000000000) == 0)
    {
LABEL_115:
      if ((v40 & 0x8000000000000000) == 0) {
        goto LABEL_116;
      }
      goto LABEL_178;
    }
  }
  else if ((v40 & 0x4000000000000000) == 0)
  {
    goto LABEL_115;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v40 = (uint64_t)self->_has;
  char v41 = *((unsigned char *)&self->_has + 8);
  if ((v40 & 0x8000000000000000) == 0)
  {
LABEL_116:
    if ((v41 & 1) == 0) {
      goto LABEL_117;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteBOOLField();
  uint64_t v40 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_117:
    if ((v40 & 0x400000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteBOOLField();
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x400000) == 0)
  {
LABEL_118:
    if ((v40 & 0x10000000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint32Field();
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x10000000) == 0)
  {
LABEL_119:
    if ((v40 & 0x800000000000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint32Field();
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x800000000000000) == 0)
  {
LABEL_120:
    if ((v40 & 0x20000000000000) == 0) {
      goto LABEL_121;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint32Field();
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x20000000000000) == 0)
  {
LABEL_121:
    if ((v40 & 0x200000000000000) == 0) {
      goto LABEL_122;
    }
LABEL_184:
    PBDataWriterWriteInt32Field();
    if ((*(void *)&self->_has & 1) == 0) {
      goto LABEL_124;
    }
    goto LABEL_123;
  }
LABEL_183:
  PBDataWriterWriteUint32Field();
  uint64_t v40 = (uint64_t)self->_has;
  if ((v40 & 0x200000000000000) != 0) {
    goto LABEL_184;
  }
LABEL_122:
  if (v40) {
LABEL_123:
  }
    PBDataWriterWriteUint64Field();
LABEL_124:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    v4[48] |= 2uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_callEvent;
    v4[48] |= 0x400uLL;
  }
  long long v43 = v4;
  if (self->_callId)
  {
    [v4 setCallId:];
    id v4 = v43;
  }
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_direction;
    v4[48] |= 0x4000uLL;
    uint64_t v6 = (uint64_t)self->_has;
  }
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v7 & 4) != 0)
  {
    *((unsigned char *)v4 + 378) = self->_isAltStart;
    *((unsigned char *)v4 + 392) |= 4u;
    uint64_t v6 = (uint64_t)self->_has;
    char v7 = *((unsigned char *)&self->_has + 8);
    if ((v6 & 0x80000) == 0)
    {
LABEL_11:
      if ((v6 & 0x8000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 38) = self->_hoAltSeqNum;
  v4[48] |= 0x80000uLL;
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x8000) == 0)
  {
LABEL_12:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 31) = self->_drxOn;
  v4[48] |= 0x8000uLL;
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x10000) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 32) = self->_endStatus;
  v4[48] |= 0x10000uLL;
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 78) = self->_rrcRelCause;
  v4[48] |= 0x1000000000000uLL;
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 19) = self->_callDuration;
  v4[48] |= 0x200uLL;
  uint64_t v6 = (uint64_t)self->_has;
  char v7 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 13) = self->_antenna;
  v4[48] |= 8uLL;
  uint64_t v6 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 2) == 0)
  {
LABEL_17:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_49:
  *((unsigned char *)v4 + 377) = self->_dueToHandover;
  *((unsigned char *)v4 + 392) |= 2u;
  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 28) = self->_cellId;
    v4[48] |= 0x1000uLL;
  }
LABEL_19:
  if (self->_simHplmn)
  {
    [v43 setSimHplmn];
    id v4 = v43;
  }
  p_uint64_t has = &self->_has;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x2000000000) != 0)
  {
    *((_DWORD *)v4 + 59) = self->_numMncDigits;
    v4[48] |= 0x2000000000uLL;
    uint64_t v9 = *(void *)p_has;
    if ((*(void *)p_has & 0x4000000) == 0)
    {
LABEL_23:
      if ((v9 & 0x8000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_53;
    }
  }
  else if ((v9 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v4 + 48) = self->_mcc;
  v4[48] |= 0x4000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 49) = self->_mnc;
  v4[48] |= 0x8000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x200000) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 40) = self->_lac;
  v4[48] |= 0x200000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x80) == 0)
  {
LABEL_26:
    if ((v9 & 0x800000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 17) = self->_band;
  v4[48] |= 0x80uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 75) = self->_rfChannel;
  v4[48] |= 0x800000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x1000000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 89) = self->_tsAccuracyHour;
  v4[48] |= 0x100000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v9 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v4 + 372) = self->_accessoryAttached;
  v4[48] |= 0x1000000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_30:
    if ((v9 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 12) = self->_accessoryAttachedBitmap;
  v4[48] |= 4uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v9 & 0x4000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 81) = self->_setupSysMode;
  v4[48] |= 0x8000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800) == 0) {
      goto LABEL_33;
    }
LABEL_62:
    *((_DWORD *)v4 + 24) = self->_callSetupTimeMs;
    v4[48] |= 0x800uLL;
    if ((*(void *)&self->_has & 0x40000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_61:
  *((_DWORD *)v4 + 80) = self->_setupDirection;
  v4[48] |= 0x4000000000000uLL;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x800) != 0) {
    goto LABEL_62;
  }
LABEL_33:
  if ((v9 & 0x40000000) != 0)
  {
LABEL_34:
    *((_DWORD *)v4 + 52) = self->_mtplInPoint1Db;
    v4[48] |= 0x40000000uLL;
  }
LABEL_35:
  if ([(CellularVoiceCallEvent *)self capEventsCount])
  {
    [v43 clearCapEvents];
    unint64_t v10 = [(CellularVoiceCallEvent *)self capEventsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v13 = [(CellularVoiceCallEvent *)self capEventAtIndex:i];
        [v43 addCapEvent:v13];
      }
    }
  }
  if ((*(void *)&self->_has & 0x2000000) != 0)
  {
    char v15 = v43;
    *((_DWORD *)v43 + 47) = self->_lastXSec;
    v43[48] |= 0x2000000uLL;
    char v14 = *((unsigned char *)&self->_has + 8);
    if ((v14 & 0x10) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  char v14 = *((unsigned char *)&self->_has + 8);
  char v15 = v43;
  if ((v14 & 0x10) != 0)
  {
LABEL_65:
    v15[380] = self->_lastXSecUlMrab;
    v15[392] |= 0x10u;
    char v14 = *((unsigned char *)&self->_has + 8);
  }
LABEL_66:
  if ((v14 & 8) != 0)
  {
    v15[379] = self->_lastXSecDlMrab;
    v15[392] |= 8u;
  }
  if ([(CellularVoiceCallEvent *)self rbDatasCount])
  {
    [v43 clearRbDatas];
    unint64_t v16 = [(CellularVoiceCallEvent *)self rbDatasCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t j = 0; j != v17; ++j)
      {
        uint64_t v19 = [(CellularVoiceCallEvent *)self rbDataAtIndex:j];
        [v43 addRbData:v19];
      }
    }
  }
  v20 = &self->_has;
  uint64_t v21 = (uint64_t)self->_has;
  if ((v21 & 0x20000000) != 0)
  {
    *((_DWORD *)v43 + 51) = self->_msgId;
    v43[48] |= 0x20000000uLL;
    uint64_t v21 = *(void *)v20;
    if ((*(void *)v20 & 0x20000) == 0)
    {
LABEL_74:
      if ((v21 & 0x400000000000) == 0) {
        goto LABEL_75;
      }
      goto LABEL_141;
    }
  }
  else if ((v21 & 0x20000) == 0)
  {
    goto LABEL_74;
  }
  *((_DWORD *)v43 + 33) = self->_eventId;
  v43[48] |= 0x20000uLL;
  uint64_t v21 = (uint64_t)self->_has;
  if ((v21 & 0x400000000000) == 0)
  {
LABEL_75:
    if ((v21 & 0x100) == 0) {
      goto LABEL_76;
    }
LABEL_142:
    *((_DWORD *)v43 + 18) = self->_callConnectDur;
    v43[48] |= 0x100uLL;
    if ((*(void *)&self->_has & 0x80000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_141:
  *((_DWORD *)v43 + 74) = self->_responseCode;
  v43[48] |= 0x400000000000uLL;
  uint64_t v21 = (uint64_t)self->_has;
  if ((v21 & 0x100) != 0) {
    goto LABEL_142;
  }
LABEL_76:
  if ((v21 & 0x80000000000000) != 0)
  {
LABEL_77:
    *((_DWORD *)v43 + 88) = self->_tbMs;
    v43[48] |= 0x80000000000000uLL;
  }
LABEL_78:
  if ([(CellularVoiceCallEvent *)self hcStatsCount])
  {
    [v43 clearHcStats];
    unint64_t v22 = [(CellularVoiceCallEvent *)self hcStatsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t k = 0; k != v23; ++k)
      {
        v25 = [(CellularVoiceCallEvent *)self hcStatAtIndex:k];
        [v43 addHcStat:v25];
      }
    }
  }
  uint64_t v26 = &self->_has;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x10000000000) != 0)
  {
    *((_DWORD *)v43 + 62) = self->_numRecvdSpeechPkt;
    v43[48] |= 0x10000000000uLL;
    uint64_t v27 = *(void *)v26;
    if ((*(void *)v26 & 0x8000000000) == 0)
    {
LABEL_84:
      if ((v27 & 0x800000000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_146;
    }
  }
  else if ((v27 & 0x8000000000) == 0)
  {
    goto LABEL_84;
  }
  *((_DWORD *)v43 + 61) = self->_numRecvdSilencePkt;
  v43[48] |= 0x8000000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x800000000) == 0)
  {
LABEL_85:
    if ((v27 & 0x100000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v43 + 57) = self->_numLostPkt;
  v43[48] |= 0x800000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x100000000000) == 0)
  {
LABEL_86:
    if ((v27 & 0x80000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v43 + 66) = self->_numUflwSpeechPkt;
  v43[48] |= 0x100000000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x80000000000) == 0)
  {
LABEL_87:
    if ((v27 & 0x400000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v43 + 65) = self->_numUflwSilencePkt;
  v43[48] |= 0x80000000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x400000000) == 0)
  {
LABEL_88:
    if ((v27 & 0x200000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v43 + 56) = self->_numEnqdSpeechPkt;
  v43[48] |= 0x400000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x200000000) == 0)
  {
LABEL_89:
    if ((v27 & 0x4000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((_DWORD *)v43 + 55) = self->_numEnqdSilencePkt;
  v43[48] |= 0x200000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x4000000000) == 0)
  {
LABEL_90:
    if ((v27 & 0x1000000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((_DWORD *)v43 + 60) = self->_numPlayedSpeechPkt;
  v43[48] |= 0x4000000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x1000000000) == 0)
  {
LABEL_91:
    if ((v27 & 0x20000000000) == 0) {
      goto LABEL_92;
    }
LABEL_153:
    *((_DWORD *)v43 + 63) = self->_numSpeechQempty;
    v43[48] |= 0x20000000000uLL;
    if ((*(void *)&self->_has & 0x10) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_152:
  *((_DWORD *)v43 + 58) = self->_numMissedSpeechPkt;
  v43[48] |= 0x1000000000uLL;
  uint64_t v27 = (uint64_t)self->_has;
  if ((v27 & 0x20000000000) != 0) {
    goto LABEL_153;
  }
LABEL_92:
  if ((v27 & 0x10) != 0)
  {
LABEL_93:
    *((_DWORD *)v43 + 14) = self->_appCallId;
    v43[48] |= 0x10uLL;
  }
LABEL_94:
  if ([(CellularVoiceCallEvent *)self delayCntsCount])
  {
    [v43 clearDelayCnts];
    unint64_t v28 = [(CellularVoiceCallEvent *)self delayCntsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (uint64_t m = 0; m != v29; ++m)
        [v43 addDelayCnt:[self delayCntAtIndex:m]];
    }
  }
  v31 = v43;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v43 + 29) = self->_dedicatedBrInactiveToEndMs;
    v43[48] |= 0x2000uLL;
  }
  if (self->_lastAudioQualityCnt)
  {
    [v43 setLastAudioQualityCnt:];
    v31 = v43;
  }
  uint64_t v32 = &self->_has;
  uint64_t v33 = (uint64_t)self->_has;
  if ((v33 & 0x2000000000000) != 0)
  {
    v31[79] = self->_rtpPktLossPpt;
    *((void *)v31 + 48) |= 0x2000000000000uLL;
    uint64_t v33 = *(void *)v32;
    if ((*(void *)v32 & 0x400000000000000) == 0)
    {
LABEL_104:
      if ((v33 & 0x40000) == 0) {
        goto LABEL_105;
      }
      goto LABEL_157;
    }
  }
  else if ((v33 & 0x400000000000000) == 0)
  {
    goto LABEL_104;
  }
  v31[91] = self->_uflwPktPpt;
  *((void *)v31 + 48) |= 0x400000000000000uLL;
  uint64_t v33 = (uint64_t)self->_has;
  if ((v33 & 0x40000) == 0)
  {
LABEL_105:
    if ((v33 & 0x2000000000000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_158;
  }
LABEL_157:
  v31[34] = self->_frErasurePpt;
  *((void *)v31 + 48) |= 0x40000uLL;
  uint64_t v33 = (uint64_t)self->_has;
  if ((v33 & 0x2000000000000000) == 0)
  {
LABEL_106:
    if ((v33 & 0x40) == 0) {
      goto LABEL_107;
    }
LABEL_159:
    v31[16] = self->_audioQualityThresholdPpt;
    *((void *)v31 + 48) |= 0x40uLL;
    if ((*(void *)&self->_has & 0x20) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_158:
  *((unsigned char *)v31 + 373) = self->_badAudioQuality;
  *((void *)v31 + 48) |= 0x2000000000000000uLL;
  uint64_t v33 = (uint64_t)self->_has;
  if ((v33 & 0x40) != 0) {
    goto LABEL_159;
  }
LABEL_107:
  if ((v33 & 0x20) != 0)
  {
LABEL_108:
    v31[15] = self->_audioQosDetectWinLenSec;
    *((void *)v31 + 48) |= 0x20uLL;
  }
LABEL_109:
  if ([(CellularVoiceCallEvent *)self rfMeasInfosCount])
  {
    [v43 clearRfMeasInfos];
    unint64_t v34 = [(CellularVoiceCallEvent *)self rfMeasInfosCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (uint64_t n = 0; n != v35; ++n)
      {
        v37 = [(CellularVoiceCallEvent *)self rfMeasInfoAtIndex:n];
        [v43 addRfMeasInfo:v37];
      }
    }
  }
  uint64_t v38 = &self->_has;
  uint64_t v39 = (uint64_t)self->_has;
  uint64_t v40 = v43;
  if ((v39 & 0x100000) != 0)
  {
    *((_DWORD *)v43 + 39) = self->_hstState;
    v43[48] |= 0x100000uLL;
    uint64_t v39 = *(void *)v38;
    if ((*(void *)v38 & 0x200000000000) == 0)
    {
LABEL_115:
      if ((v39 & 0x40000000000) == 0) {
        goto LABEL_116;
      }
      goto LABEL_163;
    }
  }
  else if ((v39 & 0x200000000000) == 0)
  {
    goto LABEL_115;
  }
  *((_DWORD *)v43 + 70) = self->_psPref;
  v43[48] |= 0x200000000000uLL;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000) == 0)
  {
LABEL_116:
    if ((v39 & 0x100000000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_164;
  }
LABEL_163:
  *((_DWORD *)v43 + 64) = self->_numSubs;
  v43[48] |= 0x40000000000uLL;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x100000000) == 0)
  {
LABEL_117:
    if ((v39 & 0x40000000000000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_165;
  }
LABEL_164:
  *((_DWORD *)v43 + 54) = self->_numCps;
  v43[48] |= (unint64_t)&_mh_execute_header;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x40000000000000) == 0)
  {
LABEL_118:
    if ((v39 & 0x10000000000000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_166;
  }
LABEL_165:
  *((_DWORD *)v43 + 87) = self->_sysModeO;
  v43[48] |= 0x40000000000000uLL;
  uint64_t v39 = (uint64_t)self->_has;
  if ((v39 & 0x10000000000000) == 0)
  {
LABEL_119:
    if ((v39 & 0x80000000) == 0) {
      goto LABEL_121;
    }
    goto LABEL_120;
  }
LABEL_166:
  *((_DWORD *)v43 + 82) = self->_sidO;
  v43[48] |= 0x10000000000000uLL;
  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_120:
    *((_DWORD *)v43 + 53) = self->_nidO;
    v43[48] |= 0x80000000uLL;
  }
LABEL_121:
  if (self->_plmnO)
  {
    [v43 setPlmnO:];
    uint64_t v40 = v43;
  }
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x1000000) != 0)
  {
    v40[46] = self->_lastRssi;
    *((void *)v40 + 48) |= 0x1000000uLL;
    uint64_t v41 = (uint64_t)self->_has;
  }
  char v42 = *((unsigned char *)&self->_has + 8);
  if ((v41 & 0x800000) != 0)
  {
    v40[45] = self->_lastRsrp;
    *((void *)v40 + 48) |= 0x800000uLL;
    uint64_t v41 = (uint64_t)self->_has;
    char v42 = *((unsigned char *)&self->_has + 8);
    if ((v41 & 0x4000000000000000) == 0)
    {
LABEL_127:
      if ((v41 & 0x8000000000000000) == 0) {
        goto LABEL_128;
      }
      goto LABEL_170;
    }
  }
  else if ((v41 & 0x4000000000000000) == 0)
  {
    goto LABEL_127;
  }
  *((unsigned char *)v40 + 374) = self->_barredFromSib1;
  *((void *)v40 + 48) |= 0x4000000000000000uLL;
  uint64_t v41 = (uint64_t)self->_has;
  char v42 = *((unsigned char *)&self->_has + 8);
  if ((v41 & 0x8000000000000000) == 0)
  {
LABEL_128:
    if ((v42 & 1) == 0) {
      goto LABEL_129;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((unsigned char *)v40 + 375) = self->_barredFromSib2;
  *((void *)v40 + 48) |= 0x8000000000000000;
  uint64_t v41 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_129:
    if ((v41 & 0x400000) == 0) {
      goto LABEL_130;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((unsigned char *)v40 + 376) = self->_connectionRejected;
  *((unsigned char *)v40 + 392) |= 1u;
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x400000) == 0)
  {
LABEL_130:
    if ((v41 & 0x10000000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_173;
  }
LABEL_172:
  v40[44] = self->_lastMotionState;
  *((void *)v40 + 48) |= 0x400000uLL;
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x10000000) == 0)
  {
LABEL_131:
    if ((v41 & 0x800000000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_174;
  }
LABEL_173:
  v40[50] = self->_msSinceLastMotionState;
  *((void *)v40 + 48) |= 0x10000000uLL;
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x800000000000000) == 0)
  {
LABEL_132:
    if ((v41 & 0x20000000000000) == 0) {
      goto LABEL_133;
    }
    goto LABEL_175;
  }
LABEL_174:
  v40[92] = self->_version;
  *((void *)v40 + 48) |= 0x800000000000000uLL;
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x20000000000000) == 0)
  {
LABEL_133:
    if ((v41 & 0x200000000000000) == 0) {
      goto LABEL_134;
    }
    goto LABEL_176;
  }
LABEL_175:
  v40[86] = self->_subsId;
  *((void *)v40 + 48) |= 0x20000000000000uLL;
  uint64_t v41 = (uint64_t)self->_has;
  if ((v41 & 0x200000000000000) == 0)
  {
LABEL_134:
    if ((v41 & 1) == 0) {
      goto LABEL_136;
    }
    goto LABEL_135;
  }
LABEL_176:
  v40[90] = self->_typeOfCall;
  *((void *)v40 + 48) |= 0x200000000000000uLL;
  if (*(void *)&self->_has)
  {
LABEL_135:
    *((void *)v40 + 4) = self->_nr5gCellId;
    *((void *)v40 + 48) |= 1uLL;
  }
LABEL_136:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    v5[5] = self->_timestamp;
    v5[48] |= 2uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_callEvent;
    v5[48] |= 0x400uLL;
  }
  id v8 = [(NSString *)self->_callId copyWithZone:a3];
  uint64_t v9 = (void *)v6[11];
  v6[11] = v8;

  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 30) = self->_direction;
    v6[48] |= 0x4000uLL;
    uint64_t v10 = (uint64_t)self->_has;
  }
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v11 & 4) != 0)
  {
    *((unsigned char *)v6 + 378) = self->_isAltStart;
    *((unsigned char *)v6 + 392) |= 4u;
    uint64_t v10 = (uint64_t)self->_has;
    char v11 = *((unsigned char *)&self->_has + 8);
    if ((v10 & 0x80000) == 0)
    {
LABEL_9:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_116;
    }
  }
  else if ((v10 & 0x80000) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v6 + 38) = self->_hoAltSeqNum;
  v6[48] |= 0x80000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x8000) == 0)
  {
LABEL_10:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v6 + 31) = self->_drxOn;
  v6[48] |= 0x8000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x10000) == 0)
  {
LABEL_11:
    if ((v10 & 0x1000000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v6 + 32) = self->_endStatus;
  v6[48] |= 0x10000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x1000000000000) == 0)
  {
LABEL_12:
    if ((v10 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v6 + 78) = self->_rrcRelCause;
  v6[48] |= 0x1000000000000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v6 + 19) = self->_callDuration;
  v6[48] |= 0x200uLL;
  uint64_t v10 = (uint64_t)self->_has;
  char v11 = *((unsigned char *)&self->_has + 8);
  if ((v10 & 8) == 0)
  {
LABEL_14:
    if ((v11 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v6 + 13) = self->_antenna;
  v6[48] |= 8uLL;
  uint64_t v10 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 2) == 0)
  {
LABEL_15:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_121:
  *((unsigned char *)v6 + 377) = self->_dueToHandover;
  *((unsigned char *)v6 + 392) |= 2u;
  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 28) = self->_cellId;
    v6[48] |= 0x1000uLL;
  }
LABEL_17:
  id v12 = [(NSData *)self->_simHplmn copyWithZone:a3];
  uint64_t v13 = (void *)v6[42];
  v6[42] = v12;

  p_uint64_t has = &self->_has;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x2000000000) != 0)
  {
    *((_DWORD *)v6 + 59) = self->_numMncDigits;
    v6[48] |= 0x2000000000uLL;
    uint64_t v15 = *(void *)p_has;
    if ((*(void *)p_has & 0x4000000) == 0)
    {
LABEL_19:
      if ((v15 & 0x8000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_125;
    }
  }
  else if ((v15 & 0x4000000) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v6 + 48) = self->_mcc;
  v6[48] |= 0x4000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x8000000) == 0)
  {
LABEL_20:
    if ((v15 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v6 + 49) = self->_mnc;
  v6[48] |= 0x8000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x200000) == 0)
  {
LABEL_21:
    if ((v15 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v6 + 40) = self->_lac;
  v6[48] |= 0x200000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x80) == 0)
  {
LABEL_22:
    if ((v15 & 0x800000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v6 + 17) = self->_band;
  v6[48] |= 0x80uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x800000000000) == 0)
  {
LABEL_23:
    if ((v15 & 0x100000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((_DWORD *)v6 + 75) = self->_rfChannel;
  v6[48] |= 0x800000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x100000000000000) == 0)
  {
LABEL_24:
    if ((v15 & 0x1000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v6 + 89) = self->_tsAccuracyHour;
  v6[48] |= 0x100000000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x1000000000000000) == 0)
  {
LABEL_25:
    if ((v15 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((unsigned char *)v6 + 372) = self->_accessoryAttached;
  v6[48] |= 0x1000000000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_26:
    if ((v15 & 0x8000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v6 + 12) = self->_accessoryAttachedBitmap;
  v6[48] |= 4uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x8000000000000) == 0)
  {
LABEL_27:
    if ((v15 & 0x4000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v6 + 81) = self->_setupSysMode;
  v6[48] |= 0x8000000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x4000000000000) == 0)
  {
LABEL_28:
    if ((v15 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((_DWORD *)v6 + 80) = self->_setupDirection;
  v6[48] |= 0x4000000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x800) == 0)
  {
LABEL_29:
    if ((v15 & 0x40000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_134:
  *((_DWORD *)v6 + 24) = self->_callSetupTimeMs;
  v6[48] |= 0x800uLL;
  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_30:
    *((_DWORD *)v6 + 52) = self->_mtplInPoint1Db;
    v6[48] |= 0x40000000uLL;
  }
LABEL_31:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v16 = self->_capEvents;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v70 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v69 + 1) + 8 * i) copyWithZone:a3];
        [v6 addCapEvent:v21];
      }
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v18);
  }

  if ((*(void *)&self->_has & 0x2000000) != 0)
  {
    *((_DWORD *)v6 + 47) = self->_lastXSec;
    v6[48] |= 0x2000000uLL;
  }
  char v22 = *((unsigned char *)&self->_has + 8);
  if ((v22 & 0x10) != 0)
  {
    *((unsigned char *)v6 + 380) = self->_lastXSecUlMrab;
    *((unsigned char *)v6 + 392) |= 0x10u;
    char v22 = *((unsigned char *)&self->_has + 8);
  }
  if ((v22 & 8) != 0)
  {
    *((unsigned char *)v6 + 379) = self->_lastXSecDlMrab;
    *((unsigned char *)v6 + 392) |= 8u;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v23 = self->_rbDatas;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v25; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v66 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v65 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addRbData:v28];
      }
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v25);
  }

  unint64_t v29 = &self->_has;
  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x20000000) != 0)
  {
    *((_DWORD *)v6 + 51) = self->_msgId;
    v6[48] |= 0x20000000uLL;
    uint64_t v30 = *(void *)v29;
    if ((*(void *)v29 & 0x20000) == 0)
    {
LABEL_53:
      if ((v30 & 0x400000000000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_138;
    }
  }
  else if ((v30 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  *((_DWORD *)v6 + 33) = self->_eventId;
  v6[48] |= 0x20000uLL;
  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x400000000000) == 0)
  {
LABEL_54:
    if ((v30 & 0x100) == 0) {
      goto LABEL_55;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v6 + 74) = self->_responseCode;
  v6[48] |= 0x400000000000uLL;
  uint64_t v30 = (uint64_t)self->_has;
  if ((v30 & 0x100) == 0)
  {
LABEL_55:
    if ((v30 & 0x80000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_139:
  *((_DWORD *)v6 + 18) = self->_callConnectDur;
  v6[48] |= 0x100uLL;
  if ((*(void *)&self->_has & 0x80000000000000) != 0)
  {
LABEL_56:
    *((_DWORD *)v6 + 88) = self->_tbMs;
    v6[48] |= 0x80000000000000uLL;
  }
LABEL_57:
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v31 = self->_hcStats;
  id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v33; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v62 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)k) copyWithZone:a3];
        [v6 addHcStat:v36];
      }
      id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v33);
  }

  v37 = &self->_has;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x10000000000) != 0)
  {
    *((_DWORD *)v6 + 62) = self->_numRecvdSpeechPkt;
    v6[48] |= 0x10000000000uLL;
    uint64_t v38 = *(void *)v37;
    if ((*(void *)v37 & 0x8000000000) == 0)
    {
LABEL_66:
      if ((v38 & 0x800000000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_143;
    }
  }
  else if ((v38 & 0x8000000000) == 0)
  {
    goto LABEL_66;
  }
  *((_DWORD *)v6 + 61) = self->_numRecvdSilencePkt;
  v6[48] |= 0x8000000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x800000000) == 0)
  {
LABEL_67:
    if ((v38 & 0x100000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v6 + 57) = self->_numLostPkt;
  v6[48] |= 0x800000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x100000000000) == 0)
  {
LABEL_68:
    if ((v38 & 0x80000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v6 + 66) = self->_numUflwSpeechPkt;
  v6[48] |= 0x100000000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x80000000000) == 0)
  {
LABEL_69:
    if ((v38 & 0x400000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v6 + 65) = self->_numUflwSilencePkt;
  v6[48] |= 0x80000000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x400000000) == 0)
  {
LABEL_70:
    if ((v38 & 0x200000000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v6 + 56) = self->_numEnqdSpeechPkt;
  v6[48] |= 0x400000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x200000000) == 0)
  {
LABEL_71:
    if ((v38 & 0x4000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v6 + 55) = self->_numEnqdSilencePkt;
  v6[48] |= 0x200000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x4000000000) == 0)
  {
LABEL_72:
    if ((v38 & 0x1000000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v6 + 60) = self->_numPlayedSpeechPkt;
  v6[48] |= 0x4000000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x1000000000) == 0)
  {
LABEL_73:
    if ((v38 & 0x20000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v6 + 58) = self->_numMissedSpeechPkt;
  v6[48] |= 0x1000000000uLL;
  uint64_t v38 = (uint64_t)self->_has;
  if ((v38 & 0x20000000000) == 0)
  {
LABEL_74:
    if ((v38 & 0x10) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_150:
  *((_DWORD *)v6 + 63) = self->_numSpeechQempty;
  v6[48] |= 0x20000000000uLL;
  if ((*(void *)&self->_has & 0x10) != 0)
  {
LABEL_75:
    *((_DWORD *)v6 + 14) = self->_appCallId;
    v6[48] |= 0x10uLL;
  }
LABEL_76:
  PBRepeatedUInt32Copy();
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v6 + 29) = self->_dedicatedBrInactiveToEndMs;
    v6[48] |= 0x2000uLL;
  }
  id v39 = [self->_lastAudioQualityCnt copyWithZone:a3];
  uint64_t v40 = (void *)v6[21];
  v6[21] = v39;

  uint64_t v41 = &self->_has;
  uint64_t v42 = (uint64_t)self->_has;
  if ((v42 & 0x2000000000000) != 0)
  {
    *((_DWORD *)v6 + 79) = self->_rtpPktLossPpt;
    v6[48] |= 0x2000000000000uLL;
    uint64_t v42 = *(void *)v41;
    if ((*(void *)v41 & 0x400000000000000) == 0)
    {
LABEL_80:
      if ((v42 & 0x40000) == 0) {
        goto LABEL_81;
      }
      goto LABEL_154;
    }
  }
  else if ((v42 & 0x400000000000000) == 0)
  {
    goto LABEL_80;
  }
  *((_DWORD *)v6 + 91) = self->_uflwPktPpt;
  v6[48] |= 0x400000000000000uLL;
  uint64_t v42 = (uint64_t)self->_has;
  if ((v42 & 0x40000) == 0)
  {
LABEL_81:
    if ((v42 & 0x2000000000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((_DWORD *)v6 + 34) = self->_frErasurePpt;
  v6[48] |= 0x40000uLL;
  uint64_t v42 = (uint64_t)self->_has;
  if ((v42 & 0x2000000000000000) == 0)
  {
LABEL_82:
    if ((v42 & 0x40) == 0) {
      goto LABEL_83;
    }
    goto LABEL_156;
  }
LABEL_155:
  *((unsigned char *)v6 + 373) = self->_badAudioQuality;
  v6[48] |= 0x2000000000000000uLL;
  uint64_t v42 = (uint64_t)self->_has;
  if ((v42 & 0x40) == 0)
  {
LABEL_83:
    if ((v42 & 0x20) == 0) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
LABEL_156:
  *((_DWORD *)v6 + 16) = self->_audioQualityThresholdPpt;
  v6[48] |= 0x40uLL;
  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_84:
    *((_DWORD *)v6 + 15) = self->_audioQosDetectWinLenSec;
    v6[48] |= 0x20uLL;
  }
LABEL_85:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v43 = self->_rfMeasInfos;
  id v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v45; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v58 != v46) {
          objc_enumerationMutation(v43);
        }
        id v48 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)m) copyWithZone:a3];
        [v6 addRfMeasInfo:v48];
      }
      id v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v45);
  }

  long long v49 = &self->_has;
  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x100000) != 0)
  {
    *((_DWORD *)v6 + 39) = self->_hstState;
    v6[48] |= 0x100000uLL;
    uint64_t v50 = *(void *)v49;
    if ((*(void *)v49 & 0x200000000000) == 0)
    {
LABEL_94:
      if ((v50 & 0x40000000000) == 0) {
        goto LABEL_95;
      }
      goto LABEL_160;
    }
  }
  else if ((v50 & 0x200000000000) == 0)
  {
    goto LABEL_94;
  }
  *((_DWORD *)v6 + 70) = self->_psPref;
  v6[48] |= 0x200000000000uLL;
  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x40000000000) == 0)
  {
LABEL_95:
    if ((v50 & 0x100000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((_DWORD *)v6 + 64) = self->_numSubs;
  v6[48] |= 0x40000000000uLL;
  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x100000000) == 0)
  {
LABEL_96:
    if ((v50 & 0x40000000000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_162;
  }
LABEL_161:
  *((_DWORD *)v6 + 54) = self->_numCps;
  v6[48] |= (unint64_t)&_mh_execute_header;
  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x40000000000000) == 0)
  {
LABEL_97:
    if ((v50 & 0x10000000000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_163;
  }
LABEL_162:
  *((_DWORD *)v6 + 87) = self->_sysModeO;
  v6[48] |= 0x40000000000000uLL;
  uint64_t v50 = (uint64_t)self->_has;
  if ((v50 & 0x10000000000000) == 0)
  {
LABEL_98:
    if ((v50 & 0x80000000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_99;
  }
LABEL_163:
  *((_DWORD *)v6 + 82) = self->_sidO;
  v6[48] |= 0x10000000000000uLL;
  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_99:
    *((_DWORD *)v6 + 53) = self->_nidO;
    v6[48] |= 0x80000000uLL;
  }
LABEL_100:
  id v51 = -[NSData copyWithZone:](self->_plmnO, "copyWithZone:", a3, (void)v57);
  long long v52 = (void *)v6[34];
  v6[34] = v51;

  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x1000000) != 0)
  {
    *((_DWORD *)v6 + 46) = self->_lastRssi;
    v6[48] |= 0x1000000uLL;
    uint64_t v53 = (uint64_t)self->_has;
  }
  char v54 = *((unsigned char *)&self->_has + 8);
  if ((v53 & 0x800000) != 0)
  {
    *((_DWORD *)v6 + 45) = self->_lastRsrp;
    v6[48] |= 0x800000uLL;
    uint64_t v53 = (uint64_t)self->_has;
    char v54 = *((unsigned char *)&self->_has + 8);
    if ((v53 & 0x4000000000000000) == 0)
    {
LABEL_104:
      if ((v53 & 0x8000000000000000) == 0) {
        goto LABEL_105;
      }
      goto LABEL_167;
    }
  }
  else if ((v53 & 0x4000000000000000) == 0)
  {
    goto LABEL_104;
  }
  *((unsigned char *)v6 + 374) = self->_barredFromSib1;
  v6[48] |= 0x4000000000000000uLL;
  uint64_t v53 = (uint64_t)self->_has;
  char v54 = *((unsigned char *)&self->_has + 8);
  if ((v53 & 0x8000000000000000) == 0)
  {
LABEL_105:
    if ((v54 & 1) == 0) {
      goto LABEL_106;
    }
    goto LABEL_168;
  }
LABEL_167:
  *((unsigned char *)v6 + 375) = self->_barredFromSib2;
  v6[48] |= 0x8000000000000000;
  uint64_t v53 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_106:
    if ((v53 & 0x400000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_169;
  }
LABEL_168:
  *((unsigned char *)v6 + 376) = self->_connectionRejected;
  *((unsigned char *)v6 + 392) |= 1u;
  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x400000) == 0)
  {
LABEL_107:
    if ((v53 & 0x10000000) == 0) {
      goto LABEL_108;
    }
    goto LABEL_170;
  }
LABEL_169:
  *((_DWORD *)v6 + 44) = self->_lastMotionState;
  v6[48] |= 0x400000uLL;
  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x10000000) == 0)
  {
LABEL_108:
    if ((v53 & 0x800000000000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((_DWORD *)v6 + 50) = self->_msSinceLastMotionState;
  v6[48] |= 0x10000000uLL;
  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x800000000000000) == 0)
  {
LABEL_109:
    if ((v53 & 0x20000000000000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((_DWORD *)v6 + 92) = self->_version;
  v6[48] |= 0x800000000000000uLL;
  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x20000000000000) == 0)
  {
LABEL_110:
    if ((v53 & 0x200000000000000) == 0) {
      goto LABEL_111;
    }
LABEL_173:
    *((_DWORD *)v6 + 90) = self->_typeOfCall;
    v6[48] |= 0x200000000000000uLL;
    if ((*(void *)&self->_has & 1) == 0) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
LABEL_172:
  *((_DWORD *)v6 + 86) = self->_subsId;
  v6[48] |= 0x20000000000000uLL;
  uint64_t v53 = (uint64_t)self->_has;
  if ((v53 & 0x200000000000000) != 0) {
    goto LABEL_173;
  }
LABEL_111:
  if (v53)
  {
LABEL_112:
    v6[4] = self->_nr5gCellId;
    v6[48] |= 1uLL;
  }
LABEL_113:
  long long v55 = v6;

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_399;
  }
  char v5 = *((unsigned char *)&self->_has + 8);
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_timestamp != *((void *)v4 + 5)) {
      goto LABEL_399;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_callEvent != *((_DWORD *)v4 + 20)) {
      goto LABEL_399;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_399;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](callId, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t has = (uint64_t)self->_has;
    char v5 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v9 = *((void *)v4 + 48);
  if ((has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_direction != *((_DWORD *)v4 + 30)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_399;
  }
  if ((v5 & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 392) & 4) == 0) {
      goto LABEL_399;
    }
    if (self->_isAltStart)
    {
      if (!*((unsigned char *)v4 + 378)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 378))
    {
      goto LABEL_399;
    }
  }
  else if ((*((unsigned char *)v4 + 392) & 4) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_hoAltSeqNum != *((_DWORD *)v4 + 38)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_drxOn != *((_DWORD *)v4 + 31)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_endStatus != *((_DWORD *)v4 + 32)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v9 & 0x1000000000000) == 0 || self->_rrcRelCause != *((_DWORD *)v4 + 78)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x1000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_callDuration != *((_DWORD *)v4 + 19)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_antenna != *((_DWORD *)v4 + 13)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_399;
  }
  if ((v5 & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 392) & 2) == 0) {
      goto LABEL_399;
    }
    if (self->_dueToHandover)
    {
      if (!*((unsigned char *)v4 + 377)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 377))
    {
      goto LABEL_399;
    }
  }
  else if ((*((unsigned char *)v4 + 392) & 2) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_cellId != *((_DWORD *)v4 + 28)) {
      goto LABEL_399;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_399;
  }
  simHplmuint64_t n = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 42))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t has = (uint64_t)self->_has;
    char v5 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v11 = *((void *)v4 + 48);
  if ((has & 0x2000000000) != 0)
  {
    if ((v11 & 0x2000000000) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 59)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x2000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0 || self->_mcc != *((_DWORD *)v4 + 48)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v11 & 0x8000000) == 0 || self->_mnc != *((_DWORD *)v4 + 49)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x8000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0 || self->_lac != *((_DWORD *)v4 + 40)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_band != *((_DWORD *)v4 + 17)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v11 & 0x800000000000) == 0 || self->_rfChannel != *((_DWORD *)v4 + 75)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x800000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v11 & 0x100000000000000) == 0 || self->_tsAccuracyHour != *((_DWORD *)v4 + 89)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x100000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v11 & 0x1000000000000000) == 0) {
      goto LABEL_399;
    }
    if (self->_accessoryAttached)
    {
      if (!*((unsigned char *)v4 + 372)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 372))
    {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x1000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_accessoryAttachedBitmap != *((_DWORD *)v4 + 12)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v11 & 0x8000000000000) == 0 || self->_setupSysMode != *((_DWORD *)v4 + 81)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x8000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v11 & 0x4000000000000) == 0 || self->_setupDirection != *((_DWORD *)v4 + 80)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x4000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_callSetupTimeMs != *((_DWORD *)v4 + 24)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v11 & 0x40000000) == 0 || self->_mtplInPoint1Db != *((_DWORD *)v4 + 52)) {
      goto LABEL_399;
    }
  }
  else if ((v11 & 0x40000000) != 0)
  {
    goto LABEL_399;
  }
  capEvents = self->_capEvents;
  if ((unint64_t)capEvents | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](capEvents, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t has = (uint64_t)self->_has;
    char v5 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v13 = *((void *)v4 + 48);
  if ((has & 0x2000000) != 0)
  {
    if ((v13 & 0x2000000) == 0 || self->_lastXSec != *((_DWORD *)v4 + 47)) {
      goto LABEL_399;
    }
  }
  else if ((v13 & 0x2000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v5 & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 392) & 0x10) == 0) {
      goto LABEL_399;
    }
    if (self->_lastXSecUlMrab)
    {
      if (!*((unsigned char *)v4 + 380)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 380))
    {
      goto LABEL_399;
    }
  }
  else if ((*((unsigned char *)v4 + 392) & 0x10) != 0)
  {
    goto LABEL_399;
  }
  if ((v5 & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 392) & 8) == 0) {
      goto LABEL_399;
    }
    if (self->_lastXSecDlMrab)
    {
      if (!*((unsigned char *)v4 + 379)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 379))
    {
      goto LABEL_399;
    }
  }
  else if ((*((unsigned char *)v4 + 392) & 8) != 0)
  {
    goto LABEL_399;
  }
  rbDatas = self->_rbDatas;
  if ((unint64_t)rbDatas | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](rbDatas, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t has = (uint64_t)self->_has;
  }
  uint64_t v15 = *((void *)v4 + 48);
  if ((has & 0x20000000) != 0)
  {
    if ((v15 & 0x20000000) == 0 || self->_msgId != *((_DWORD *)v4 + 51)) {
      goto LABEL_399;
    }
  }
  else if ((v15 & 0x20000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0 || self->_eventId != *((_DWORD *)v4 + 33)) {
      goto LABEL_399;
    }
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v15 & 0x400000000000) == 0 || self->_responseCode != *((_DWORD *)v4 + 74)) {
      goto LABEL_399;
    }
  }
  else if ((v15 & 0x400000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_callConnectDur != *((_DWORD *)v4 + 18)) {
      goto LABEL_399;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v15 & 0x80000000000000) == 0 || self->_tbMs != *((_DWORD *)v4 + 88)) {
      goto LABEL_399;
    }
  }
  else if ((v15 & 0x80000000000000) != 0)
  {
    goto LABEL_399;
  }
  hcStats = self->_hcStats;
  if ((unint64_t)hcStats | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](hcStats, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t has = (uint64_t)self->_has;
  }
  uint64_t v17 = *((void *)v4 + 48);
  if ((has & 0x10000000000) != 0)
  {
    if ((v17 & 0x10000000000) == 0 || self->_numRecvdSpeechPkt != *((_DWORD *)v4 + 62)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x10000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v17 & 0x8000000000) == 0 || self->_numRecvdSilencePkt != *((_DWORD *)v4 + 61)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x8000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v17 & 0x800000000) == 0 || self->_numLostPkt != *((_DWORD *)v4 + 57)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x800000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v17 & 0x100000000000) == 0 || self->_numUflwSpeechPkt != *((_DWORD *)v4 + 66)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x100000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v17 & 0x80000000000) == 0 || self->_numUflwSilencePkt != *((_DWORD *)v4 + 65)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x80000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v17 & 0x400000000) == 0 || self->_numEnqdSpeechPkt != *((_DWORD *)v4 + 56)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x400000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v17 & 0x200000000) == 0 || self->_numEnqdSilencePkt != *((_DWORD *)v4 + 55)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x200000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v17 & 0x4000000000) == 0 || self->_numPlayedSpeechPkt != *((_DWORD *)v4 + 60)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x4000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v17 & 0x1000000000) == 0 || self->_numMissedSpeechPkt != *((_DWORD *)v4 + 58)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x1000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v17 & 0x20000000000) == 0 || self->_numSpeechQempty != *((_DWORD *)v4 + 63)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x20000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((has & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_appCallId != *((_DWORD *)v4 + 14)) {
      goto LABEL_399;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_399;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_399:
    BOOL v27 = 0;
    goto LABEL_400;
  }
  char v18 = *((unsigned char *)&self->_has + 8);
  uint64_t v19 = (uint64_t)self->_has;
  uint64_t v20 = *((void *)v4 + 48);
  if ((v19 & 0x2000) != 0)
  {
    if ((v20 & 0x2000) == 0 || self->_dedicatedBrInactiveToEndMs != *((_DWORD *)v4 + 29)) {
      goto LABEL_399;
    }
  }
  else if ((v20 & 0x2000) != 0)
  {
    goto LABEL_399;
  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  if ((unint64_t)lastAudioQualityCnt | *((void *)v4 + 21))
  {
    if (!-[AudioQuality isEqual:](lastAudioQualityCnt, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t v19 = (uint64_t)self->_has;
    char v18 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v22 = *((void *)v4 + 48);
  if ((v19 & 0x2000000000000) != 0)
  {
    if ((v22 & 0x2000000000000) == 0 || self->_rtpPktLossPpt != *((_DWORD *)v4 + 79)) {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x2000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x400000000000000) != 0)
  {
    if ((v22 & 0x400000000000000) == 0 || self->_uflwPktPpt != *((_DWORD *)v4 + 91)) {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x400000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x40000) != 0)
  {
    if ((v22 & 0x40000) == 0 || self->_frErasurePpt != *((_DWORD *)v4 + 34)) {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x40000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x2000000000000000) != 0)
  {
    if ((v22 & 0x2000000000000000) == 0) {
      goto LABEL_399;
    }
    if (self->_badAudioQuality)
    {
      if (!*((unsigned char *)v4 + 373)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 373))
    {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x2000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x40) != 0)
  {
    if ((v22 & 0x40) == 0 || self->_audioQualityThresholdPpt != *((_DWORD *)v4 + 16)) {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x40) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_audioQosDetectWinLenSec != *((_DWORD *)v4 + 15)) {
      goto LABEL_399;
    }
  }
  else if ((v22 & 0x20) != 0)
  {
    goto LABEL_399;
  }
  rfMeasInfos = self->_rfMeasInfos;
  if ((unint64_t)rfMeasInfos | *((void *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](rfMeasInfos, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t v19 = (uint64_t)self->_has;
    char v18 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v24 = *((void *)v4 + 48);
  if ((v19 & 0x100000) != 0)
  {
    if ((v24 & 0x100000) == 0 || self->_hstState != *((_DWORD *)v4 + 39)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x100000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x200000000000) != 0)
  {
    if ((v24 & 0x200000000000) == 0 || self->_psPref != *((_DWORD *)v4 + 70)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x200000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x40000000000) != 0)
  {
    if ((v24 & 0x40000000000) == 0 || self->_numSubs != *((_DWORD *)v4 + 64)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x40000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x100000000) != 0)
  {
    if ((v24 & 0x100000000) == 0 || self->_numCps != *((_DWORD *)v4 + 54)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x100000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x40000000000000) != 0)
  {
    if ((v24 & 0x40000000000000) == 0 || self->_sysModeO != *((_DWORD *)v4 + 87)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x40000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x10000000000000) != 0)
  {
    if ((v24 & 0x10000000000000) == 0 || self->_sidO != *((_DWORD *)v4 + 82)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x10000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x80000000) != 0)
  {
    if ((v24 & 0x80000000) == 0 || self->_nidO != *((_DWORD *)v4 + 53)) {
      goto LABEL_399;
    }
  }
  else if ((v24 & 0x80000000) != 0)
  {
    goto LABEL_399;
  }
  plmnO = self->_plmnO;
  if ((unint64_t)plmnO | *((void *)v4 + 34))
  {
    if (!-[NSData isEqual:](plmnO, "isEqual:")) {
      goto LABEL_399;
    }
    uint64_t v19 = (uint64_t)self->_has;
    char v18 = *((unsigned char *)&self->_has + 8);
  }
  uint64_t v26 = *((void *)v4 + 48);
  if ((v19 & 0x1000000) != 0)
  {
    if ((v26 & 0x1000000) == 0 || self->_lastRssi != *((_DWORD *)v4 + 46)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x1000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x800000) != 0)
  {
    if ((v26 & 0x800000) == 0 || self->_lastRsrp != *((_DWORD *)v4 + 45)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x800000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x4000000000000000) != 0)
  {
    if ((v26 & 0x4000000000000000) == 0) {
      goto LABEL_399;
    }
    if (self->_barredFromSib1)
    {
      if (!*((unsigned char *)v4 + 374)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 374))
    {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x4000000000000000) != 0)
  {
    goto LABEL_399;
  }
  if (v19 < 0)
  {
    if ((v26 & 0x8000000000000000) == 0) {
      goto LABEL_399;
    }
    if (self->_barredFromSib2)
    {
      if (!*((unsigned char *)v4 + 375)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 375))
    {
      goto LABEL_399;
    }
  }
  else if (v26 < 0)
  {
    goto LABEL_399;
  }
  if (v18)
  {
    if ((*((unsigned char *)v4 + 392) & 1) == 0) {
      goto LABEL_399;
    }
    if (self->_connectionRejected)
    {
      if (!*((unsigned char *)v4 + 376)) {
        goto LABEL_399;
      }
    }
    else if (*((unsigned char *)v4 + 376))
    {
      goto LABEL_399;
    }
  }
  else if (*((unsigned char *)v4 + 392))
  {
    goto LABEL_399;
  }
  if ((v19 & 0x400000) != 0)
  {
    if ((v26 & 0x400000) == 0 || self->_lastMotionState != *((_DWORD *)v4 + 44)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x400000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x10000000) != 0)
  {
    if ((v26 & 0x10000000) == 0 || self->_msSinceLastMotionState != *((_DWORD *)v4 + 50)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x10000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x800000000000000) != 0)
  {
    if ((v26 & 0x800000000000000) == 0 || self->_version != *((_DWORD *)v4 + 92)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x800000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x20000000000000) != 0)
  {
    if ((v26 & 0x20000000000000) == 0 || self->_subsId != *((_DWORD *)v4 + 86)) {
      goto LABEL_399;
    }
  }
  else if ((v26 & 0x20000000000000) != 0)
  {
    goto LABEL_399;
  }
  if ((v19 & 0x200000000000000) == 0)
  {
    if ((v26 & 0x200000000000000) == 0) {
      goto LABEL_394;
    }
    goto LABEL_399;
  }
  if ((v26 & 0x200000000000000) == 0 || self->_typeOfCall != *((_DWORD *)v4 + 90)) {
    goto LABEL_399;
  }
LABEL_394:
  if (v19)
  {
    if ((v26 & 1) == 0 || self->_nr5gCellId != *((void *)v4 + 4)) {
      goto LABEL_399;
    }
    BOOL v27 = 1;
  }
  else
  {
    BOOL v27 = (*((void *)v4 + 48) & 1) == 0;
  }
LABEL_400:

  return v27;
}

- (unint64_t)hash
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v90 = 2654435761u * self->_timestamp;
    if ((has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v90 = 0;
    if ((has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v89 = 2654435761 * self->_callEvent;
      goto LABEL_6;
    }
  }
  uint64_t v89 = 0;
LABEL_6:
  NSUInteger v88 = [(NSString *)self->_callId hash];
  uint64_t v4 = (uint64_t)self->_has;
  if ((v4 & 0x4000) != 0)
  {
    uint64_t v87 = 2654435761 * self->_direction;
    if ((*((unsigned char *)&self->_has + 8) & 4) != 0)
    {
LABEL_8:
      uint64_t v86 = 2654435761 * self->_isAltStart;
      if ((v4 & 0x80000) != 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v87 = 0;
    if ((*((unsigned char *)&self->_has + 8) & 4) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v86 = 0;
  if ((v4 & 0x80000) != 0)
  {
LABEL_9:
    uint64_t v85 = 2654435761 * self->_hoAltSeqNum;
    if ((v4 & 0x8000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v85 = 0;
  if ((v4 & 0x8000) != 0)
  {
LABEL_10:
    uint64_t v84 = 2654435761 * self->_drxOn;
    if ((v4 & 0x10000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v84 = 0;
  if ((v4 & 0x10000) != 0)
  {
LABEL_11:
    uint64_t v83 = 2654435761 * self->_endStatus;
    if ((v4 & 0x1000000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v83 = 0;
  if ((v4 & 0x1000000000000) != 0)
  {
LABEL_12:
    uint64_t v82 = 2654435761 * self->_rrcRelCause;
    if ((v4 & 0x200) != 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v82 = 0;
  if ((v4 & 0x200) != 0)
  {
LABEL_13:
    uint64_t v81 = 2654435761 * self->_callDuration;
    if ((v4 & 8) != 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v81 = 0;
  if ((v4 & 8) != 0)
  {
LABEL_14:
    uint64_t v80 = 2654435761 * self->_antenna;
    if ((*((unsigned char *)&self->_has + 8) & 2) != 0) {
      goto LABEL_15;
    }
LABEL_25:
    uint64_t v79 = 0;
    if ((v4 & 0x1000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v80 = 0;
  if ((*((unsigned char *)&self->_has + 8) & 2) == 0) {
    goto LABEL_25;
  }
LABEL_15:
  uint64_t v79 = 2654435761 * self->_dueToHandover;
  if ((v4 & 0x1000) != 0)
  {
LABEL_16:
    uint64_t v78 = 2654435761 * self->_cellId;
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v78 = 0;
LABEL_27:
  unint64_t v77 = (unint64_t)[(NSData *)self->_simHplmn hash];
  uint64_t v5 = (uint64_t)self->_has;
  if ((v5 & 0x2000000000) != 0)
  {
    uint64_t v76 = 2654435761 * self->_numMncDigits;
    if ((v5 & 0x4000000) != 0)
    {
LABEL_29:
      uint64_t v75 = 2654435761 * self->_mcc;
      if ((v5 & 0x8000000) != 0) {
        goto LABEL_30;
      }
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v76 = 0;
    if ((v5 & 0x4000000) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v75 = 0;
  if ((v5 & 0x8000000) != 0)
  {
LABEL_30:
    uint64_t v74 = 2654435761 * self->_mnc;
    if ((v5 & 0x200000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v74 = 0;
  if ((v5 & 0x200000) != 0)
  {
LABEL_31:
    uint64_t v73 = 2654435761 * self->_lac;
    if ((v5 & 0x80) != 0) {
      goto LABEL_32;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v73 = 0;
  if ((v5 & 0x80) != 0)
  {
LABEL_32:
    uint64_t v72 = 2654435761 * self->_band;
    if ((v5 & 0x800000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v72 = 0;
  if ((v5 & 0x800000000000) != 0)
  {
LABEL_33:
    uint64_t v71 = 2654435761 * self->_rfChannel;
    if ((v5 & 0x100000000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v71 = 0;
  if ((v5 & 0x100000000000000) != 0)
  {
LABEL_34:
    uint64_t v70 = 2654435761 * self->_tsAccuracyHour;
    if ((v5 & 0x1000000000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v70 = 0;
  if ((v5 & 0x1000000000000000) != 0)
  {
LABEL_35:
    uint64_t v69 = 2654435761 * self->_accessoryAttached;
    if ((v5 & 4) != 0) {
      goto LABEL_36;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v69 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_36:
    uint64_t v68 = 2654435761 * self->_accessoryAttachedBitmap;
    if ((v5 & 0x8000000000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v68 = 0;
  if ((v5 & 0x8000000000000) != 0)
  {
LABEL_37:
    uint64_t v67 = 2654435761 * self->_setupSysMode;
    if ((v5 & 0x4000000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v67 = 0;
  if ((v5 & 0x4000000000000) != 0)
  {
LABEL_38:
    uint64_t v66 = 2654435761 * self->_setupDirection;
    if ((v5 & 0x800) != 0) {
      goto LABEL_39;
    }
LABEL_52:
    uint64_t v65 = 0;
    if ((v5 & 0x40000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_53;
  }
LABEL_51:
  uint64_t v66 = 0;
  if ((v5 & 0x800) == 0) {
    goto LABEL_52;
  }
LABEL_39:
  uint64_t v65 = 2654435761 * self->_callSetupTimeMs;
  if ((v5 & 0x40000000) != 0)
  {
LABEL_40:
    uint64_t v64 = 2654435761 * self->_mtplInPoint1Db;
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v64 = 0;
LABEL_54:
  unint64_t v63 = (unint64_t)[(NSMutableArray *)self->_capEvents hash];
  if ((*(void *)&self->_has & 0x2000000) == 0)
  {
    uint64_t v62 = 0;
    if ((*((unsigned char *)&self->_has + 8) & 0x10) != 0) {
      goto LABEL_56;
    }
LABEL_59:
    uint64_t v61 = 0;
    if ((*((unsigned char *)&self->_has + 8) & 8) != 0) {
      goto LABEL_57;
    }
    goto LABEL_60;
  }
  uint64_t v62 = 2654435761 * self->_lastXSec;
  if ((*((unsigned char *)&self->_has + 8) & 0x10) == 0) {
    goto LABEL_59;
  }
LABEL_56:
  uint64_t v61 = 2654435761 * self->_lastXSecUlMrab;
  if ((*((unsigned char *)&self->_has + 8) & 8) != 0)
  {
LABEL_57:
    uint64_t v60 = 2654435761 * self->_lastXSecDlMrab;
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v60 = 0;
LABEL_61:
  unint64_t v59 = (unint64_t)[(NSMutableArray *)self->_rbDatas hash];
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x20000000) != 0)
  {
    uint64_t v58 = 2654435761 * self->_msgId;
    if ((v6 & 0x20000) != 0)
    {
LABEL_63:
      uint64_t v57 = 2654435761 * self->_eventId;
      if ((v6 & 0x400000000000) != 0) {
        goto LABEL_64;
      }
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v58 = 0;
    if ((v6 & 0x20000) != 0) {
      goto LABEL_63;
    }
  }
  uint64_t v57 = 0;
  if ((v6 & 0x400000000000) != 0)
  {
LABEL_64:
    uint64_t v56 = 2654435761 * self->_responseCode;
    if ((v6 & 0x100) != 0) {
      goto LABEL_65;
    }
LABEL_70:
    uint64_t v55 = 0;
    if ((v6 & 0x80000000000000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_71;
  }
LABEL_69:
  uint64_t v56 = 0;
  if ((v6 & 0x100) == 0) {
    goto LABEL_70;
  }
LABEL_65:
  uint64_t v55 = 2654435761 * self->_callConnectDur;
  if ((v6 & 0x80000000000000) != 0)
  {
LABEL_66:
    uint64_t v54 = 2654435761 * self->_tbMs;
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v54 = 0;
LABEL_72:
  unint64_t v53 = (unint64_t)[(NSMutableArray *)self->_hcStats hash];
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x10000000000) != 0)
  {
    uint64_t v52 = 2654435761 * self->_numRecvdSpeechPkt;
    if ((v7 & 0x8000000000) != 0)
    {
LABEL_74:
      uint64_t v51 = 2654435761 * self->_numRecvdSilencePkt;
      if ((v7 & 0x800000000) != 0) {
        goto LABEL_75;
      }
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((v7 & 0x8000000000) != 0) {
      goto LABEL_74;
    }
  }
  uint64_t v51 = 0;
  if ((v7 & 0x800000000) != 0)
  {
LABEL_75:
    uint64_t v50 = 2654435761 * self->_numLostPkt;
    if ((v7 & 0x100000000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v50 = 0;
  if ((v7 & 0x100000000000) != 0)
  {
LABEL_76:
    uint64_t v49 = 2654435761 * self->_numUflwSpeechPkt;
    if ((v7 & 0x80000000000) != 0) {
      goto LABEL_77;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v49 = 0;
  if ((v7 & 0x80000000000) != 0)
  {
LABEL_77:
    uint64_t v48 = 2654435761 * self->_numUflwSilencePkt;
    if ((v7 & 0x400000000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v48 = 0;
  if ((v7 & 0x400000000) != 0)
  {
LABEL_78:
    uint64_t v47 = 2654435761 * self->_numEnqdSpeechPkt;
    if ((v7 & 0x200000000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v47 = 0;
  if ((v7 & 0x200000000) != 0)
  {
LABEL_79:
    uint64_t v46 = 2654435761 * self->_numEnqdSilencePkt;
    if ((v7 & 0x4000000000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v46 = 0;
  if ((v7 & 0x4000000000) != 0)
  {
LABEL_80:
    uint64_t v45 = 2654435761 * self->_numPlayedSpeechPkt;
    if ((v7 & 0x1000000000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v45 = 0;
  if ((v7 & 0x1000000000) != 0)
  {
LABEL_81:
    uint64_t v44 = 2654435761 * self->_numMissedSpeechPkt;
    if ((v7 & 0x20000000000) != 0) {
      goto LABEL_82;
    }
LABEL_93:
    uint64_t v43 = 0;
    if ((v7 & 0x10) != 0) {
      goto LABEL_83;
    }
    goto LABEL_94;
  }
LABEL_92:
  uint64_t v44 = 0;
  if ((v7 & 0x20000000000) == 0) {
    goto LABEL_93;
  }
LABEL_82:
  uint64_t v43 = 2654435761 * self->_numSpeechQempty;
  if ((v7 & 0x10) != 0)
  {
LABEL_83:
    uint64_t v42 = 2654435761 * self->_appCallId;
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v42 = 0;
LABEL_95:
  uint64_t v41 = PBRepeatedUInt32Hash();
  if ((*(void *)&self->_has & 0x2000) != 0) {
    uint64_t v40 = 2654435761 * self->_dedicatedBrInactiveToEndMs;
  }
  else {
    uint64_t v40 = 0;
  }
  unint64_t v39 = [self->_lastAudioQualityCnt hash];
  uint64_t v8 = (uint64_t)self->_has;
  if ((v8 & 0x2000000000000) != 0)
  {
    uint64_t v38 = 2654435761 * self->_rtpPktLossPpt;
    if ((v8 & 0x400000000000000) != 0)
    {
LABEL_100:
      uint64_t v37 = 2654435761 * self->_uflwPktPpt;
      if ((v8 & 0x40000) != 0) {
        goto LABEL_101;
      }
      goto LABEL_107;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((v8 & 0x400000000000000) != 0) {
      goto LABEL_100;
    }
  }
  uint64_t v37 = 0;
  if ((v8 & 0x40000) != 0)
  {
LABEL_101:
    uint64_t v36 = 2654435761 * self->_frErasurePpt;
    if ((v8 & 0x2000000000000000) != 0) {
      goto LABEL_102;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v36 = 0;
  if ((v8 & 0x2000000000000000) != 0)
  {
LABEL_102:
    uint64_t v35 = 2654435761 * self->_badAudioQuality;
    if ((v8 & 0x40) != 0) {
      goto LABEL_103;
    }
LABEL_109:
    uint64_t v34 = 0;
    if ((v8 & 0x20) != 0) {
      goto LABEL_104;
    }
    goto LABEL_110;
  }
LABEL_108:
  uint64_t v35 = 0;
  if ((v8 & 0x40) == 0) {
    goto LABEL_109;
  }
LABEL_103:
  uint64_t v34 = 2654435761 * self->_audioQualityThresholdPpt;
  if ((v8 & 0x20) != 0)
  {
LABEL_104:
    uint64_t v33 = 2654435761 * self->_audioQosDetectWinLenSec;
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v33 = 0;
LABEL_111:
  id v31 = [(NSMutableArray *)self->_rfMeasInfos hash];
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000) != 0)
  {
    uint64_t v10 = 2654435761 * self->_hstState;
    if ((v9 & 0x200000000000) != 0)
    {
LABEL_113:
      uint64_t v11 = 2654435761 * self->_psPref;
      if ((v9 & 0x40000000000) != 0) {
        goto LABEL_114;
      }
      goto LABEL_121;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 0x200000000000) != 0) {
      goto LABEL_113;
    }
  }
  uint64_t v11 = 0;
  if ((v9 & 0x40000000000) != 0)
  {
LABEL_114:
    uint64_t v12 = 2654435761 * self->_numSubs;
    if ((v9 & 0x100000000) != 0) {
      goto LABEL_115;
    }
    goto LABEL_122;
  }
LABEL_121:
  uint64_t v12 = 0;
  if ((v9 & 0x100000000) != 0)
  {
LABEL_115:
    uint64_t v13 = 2654435761 * self->_numCps;
    if ((v9 & 0x40000000000000) != 0) {
      goto LABEL_116;
    }
    goto LABEL_123;
  }
LABEL_122:
  uint64_t v13 = 0;
  if ((v9 & 0x40000000000000) != 0)
  {
LABEL_116:
    uint64_t v14 = 2654435761 * self->_sysModeO;
    if ((v9 & 0x10000000000000) != 0) {
      goto LABEL_117;
    }
LABEL_124:
    uint64_t v15 = 0;
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_118;
    }
    goto LABEL_125;
  }
LABEL_123:
  uint64_t v14 = 0;
  if ((v9 & 0x10000000000000) == 0) {
    goto LABEL_124;
  }
LABEL_117:
  uint64_t v15 = 2654435761 * self->_sidO;
  if ((v9 & 0x80000000) != 0)
  {
LABEL_118:
    uint64_t v16 = 2654435761 * self->_nidO;
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v16 = 0;
LABEL_126:
  unint64_t v17 = (unint64_t)[(NSData *)self->_plmnO hash];
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 0x1000000) != 0)
  {
    uint64_t v19 = 2654435761 * self->_lastRssi;
    if ((v18 & 0x800000) != 0) {
      goto LABEL_128;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((v18 & 0x800000) != 0)
    {
LABEL_128:
      uint64_t v20 = 2654435761 * self->_lastRsrp;
      goto LABEL_131;
    }
  }
  uint64_t v20 = 0;
LABEL_131:
  if ((v18 & 0x4000000000000000) != 0)
  {
    uint64_t v21 = 2654435761 * self->_barredFromSib1;
    if (v18 < 0)
    {
LABEL_133:
      uint64_t v22 = 2654435761 * self->_barredFromSib2;
      if (*((unsigned char *)&self->_has + 8)) {
        goto LABEL_134;
      }
      goto LABEL_143;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if (v18 < 0) {
      goto LABEL_133;
    }
  }
  uint64_t v22 = 0;
  if (*((unsigned char *)&self->_has + 8))
  {
LABEL_134:
    uint64_t v23 = 2654435761 * self->_connectionRejected;
    if ((v18 & 0x400000) != 0) {
      goto LABEL_135;
    }
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v23 = 0;
  if ((v18 & 0x400000) != 0)
  {
LABEL_135:
    uint64_t v24 = 2654435761 * self->_lastMotionState;
    if ((v18 & 0x10000000) != 0) {
      goto LABEL_136;
    }
    goto LABEL_145;
  }
LABEL_144:
  uint64_t v24 = 0;
  if ((v18 & 0x10000000) != 0)
  {
LABEL_136:
    uint64_t v25 = 2654435761 * self->_msSinceLastMotionState;
    if ((v18 & 0x800000000000000) != 0) {
      goto LABEL_137;
    }
    goto LABEL_146;
  }
LABEL_145:
  uint64_t v25 = 0;
  if ((v18 & 0x800000000000000) != 0)
  {
LABEL_137:
    uint64_t v26 = 2654435761 * self->_version;
    if ((v18 & 0x20000000000000) != 0) {
      goto LABEL_138;
    }
    goto LABEL_147;
  }
LABEL_146:
  uint64_t v26 = 0;
  if ((v18 & 0x20000000000000) != 0)
  {
LABEL_138:
    uint64_t v27 = 2654435761 * self->_subsId;
    if ((v18 & 0x200000000000000) != 0) {
      goto LABEL_139;
    }
LABEL_148:
    uint64_t v28 = 0;
    if (v18) {
      goto LABEL_140;
    }
LABEL_149:
    unint64_t v29 = 0;
    return v89 ^ v90 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v88 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_147:
  uint64_t v27 = 0;
  if ((v18 & 0x200000000000000) == 0) {
    goto LABEL_148;
  }
LABEL_139:
  uint64_t v28 = 2654435761 * self->_typeOfCall;
  if ((v18 & 1) == 0) {
    goto LABEL_149;
  }
LABEL_140:
  unint64_t v29 = 2654435761u * self->_nr5gCellId;
  return v89 ^ v90 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v88 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  uint64_t v5 = v4;
  uint64_t v6 = *((void *)v4 + 48);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 5);
    *(void *)&self->_has |= 2uLL;
    uint64_t v6 = *((void *)v4 + 48);
  }
  if ((v6 & 0x400) != 0)
  {
    self->_callEvent = *((_DWORD *)v4 + 20);
    *(void *)&self->_has |= 0x400uLL;
  }
  if (*((void *)v4 + 11)) {
    -[CellularVoiceCallEvent setCallId:](self, "setCallId:");
  }
  uint64_t v7 = *((void *)v5 + 48);
  if ((v7 & 0x4000) != 0)
  {
    self->_uint64_t direction = *((_DWORD *)v5 + 30);
    *(void *)&self->_has |= 0x4000uLL;
    uint64_t v7 = *((void *)v5 + 48);
  }
  char v8 = v5[392];
  if ((v8 & 4) != 0)
  {
    self->_isAltStart = v5[378];
    *((unsigned char *)&self->_has + 8) |= 4u;
    uint64_t v7 = *((void *)v5 + 48);
    char v8 = v5[392];
    if ((v7 & 0x80000) == 0)
    {
LABEL_11:
      if ((v7 & 0x8000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x80000) == 0)
  {
    goto LABEL_11;
  }
  self->_hoAltSeqNuuint64_t m = *((_DWORD *)v5 + 38);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v7 = *((void *)v5 + 48);
  char v8 = v5[392];
  if ((v7 & 0x8000) == 0)
  {
LABEL_12:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_drxOuint64_t n = *((_DWORD *)v5 + 31);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v7 = *((void *)v5 + 48);
  char v8 = v5[392];
  if ((v7 & 0x10000) == 0)
  {
LABEL_13:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_uint64_t endStatus = *((_DWORD *)v5 + 32);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v7 = *((void *)v5 + 48);
  char v8 = v5[392];
  if ((v7 & 0x1000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_rrcRelCause = *((_DWORD *)v5 + 78);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v7 = *((void *)v5 + 48);
  char v8 = v5[392];
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_callDuratiouint64_t n = *((_DWORD *)v5 + 19);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v7 = *((void *)v5 + 48);
  char v8 = v5[392];
  if ((v7 & 8) == 0)
  {
LABEL_16:
    if ((v8 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_uint64_t antenna = *((_DWORD *)v5 + 13);
  *(void *)&self->_has |= 8uLL;
  uint64_t v7 = *((void *)v5 + 48);
  if ((v5[392] & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_95:
  self->_dueToHandover = v5[377];
  *((unsigned char *)&self->_has + 8) |= 2u;
  if ((*((void *)v5 + 48) & 0x1000) != 0)
  {
LABEL_18:
    self->_cellId = *((_DWORD *)v5 + 28);
    *(void *)&self->_has |= 0x1000uLL;
  }
LABEL_19:
  if (*((void *)v5 + 42)) {
    -[CellularVoiceCallEvent setSimHplmn:](self, "setSimHplmn:");
  }
  uint64_t v9 = (uint64_t *)(v5 + 384);
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x2000000000) != 0)
  {
    self->_numMncDigits = *((_DWORD *)v5 + 59);
    *(void *)&self->_has |= 0x2000000000uLL;
    uint64_t v10 = *v9;
    if ((*v9 & 0x4000000) == 0)
    {
LABEL_23:
      if ((v10 & 0x8000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x4000000) == 0)
  {
    goto LABEL_23;
  }
  self->_mcc = *((_DWORD *)v5 + 48);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v10 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_mnc = *((_DWORD *)v5 + 49);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x200000) == 0)
  {
LABEL_25:
    if ((v10 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_lac = *((_DWORD *)v5 + 40);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x80) == 0)
  {
LABEL_26:
    if ((v10 & 0x800000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_band = *((_DWORD *)v5 + 17);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x800000000000) == 0)
  {
LABEL_27:
    if ((v10 & 0x100000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_rfChannel = *((_DWORD *)v5 + 75);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x100000000000000) == 0)
  {
LABEL_28:
    if ((v10 & 0x1000000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_tsAccuracyHour = *((_DWORD *)v5 + 89);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x1000000000000000) == 0)
  {
LABEL_29:
    if ((v10 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_accessoryAttached = v5[372];
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 4) == 0)
  {
LABEL_30:
    if ((v10 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_accessoryAttachedBitmap = *((_DWORD *)v5 + 12);
  *(void *)&self->_has |= 4uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((v10 & 0x4000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_uint64_t setupSysMode = *((_DWORD *)v5 + 81);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x4000000000000) == 0)
  {
LABEL_32:
    if ((v10 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_uint64_t setupDirection = *((_DWORD *)v5 + 80);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v10 = *((void *)v5 + 48);
  if ((v10 & 0x800) == 0)
  {
LABEL_33:
    if ((v10 & 0x40000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_108:
  self->_callSetupTimeMs = *((_DWORD *)v5 + 24);
  *(void *)&self->_has |= 0x800uLL;
  if ((*((void *)v5 + 48) & 0x40000000) != 0)
  {
LABEL_34:
    self->_mtplInPoint1Db = *((_DWORD *)v5 + 52);
    *(void *)&self->_has |= 0x40000000uLL;
  }
LABEL_35:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v11 = *((id *)v5 + 13);
  id v12 = [v11 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        [(CellularVoiceCallEvent *)self addCapEvent:*(void *)(*((void *)&v59 + 1) + 8 * i)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v13);
  }

  if ((*((void *)v5 + 48) & 0x2000000) != 0)
  {
    self->_lastXSec = *((_DWORD *)v5 + 47);
    *(void *)&self->_has |= 0x2000000uLL;
  }
  char v16 = v5[392];
  if ((v16 & 0x10) != 0)
  {
    self->_lastXSecUlMrab = v5[380];
    *((unsigned char *)&self->_has + 8) |= 0x10u;
    char v16 = v5[392];
  }
  if ((v16 & 8) != 0)
  {
    self->_lastXSecDlMrab = v5[379];
    *((unsigned char *)&self->_has + 8) |= 8u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v17 = *((id *)v5 + 36);
  id v18 = [v17 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v19; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v17);
        }
        [(CellularVoiceCallEvent *)self addRbData:*(void *)(*((void *)&v55 + 1) + 8 * (void)j)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v19);
  }

  uint64_t v22 = (uint64_t *)(v5 + 384);
  uint64_t v23 = *((void *)v5 + 48);
  if ((v23 & 0x20000000) != 0)
  {
    self->_msgId = *((_DWORD *)v5 + 51);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v23 = *v22;
    if ((*v22 & 0x20000) == 0)
    {
LABEL_57:
      if ((v23 & 0x400000000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_112;
    }
  }
  else if ((v23 & 0x20000) == 0)
  {
    goto LABEL_57;
  }
  self->_eventId = *((_DWORD *)v5 + 33);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v23 = *((void *)v5 + 48);
  if ((v23 & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v23 & 0x100) == 0) {
      goto LABEL_59;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_responseCode = *((_DWORD *)v5 + 74);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v23 = *((void *)v5 + 48);
  if ((v23 & 0x100) == 0)
  {
LABEL_59:
    if ((v23 & 0x80000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_113:
  self->_callConnectDur = *((_DWORD *)v5 + 18);
  *(void *)&self->_has |= 0x100uLL;
  if ((*((void *)v5 + 48) & 0x80000000000000) != 0)
  {
LABEL_60:
    self->_tbMs = *((_DWORD *)v5 + 88);
    *(void *)&self->_has |= 0x80000000000000uLL;
  }
LABEL_61:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v24 = *((id *)v5 + 18);
  id v25 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v26; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v52 != v27) {
          objc_enumerationMutation(v24);
        }
        [(CellularVoiceCallEvent *)self addHcStat:*(void *)(*((void *)&v51 + 1) + 8 * (void)k)];
      }
      id v26 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v26);
  }

  unint64_t v29 = (uint64_t *)(v5 + 384);
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x10000000000) != 0)
  {
    self->_numRecvdSpeechPkt = *((_DWORD *)v5 + 62);
    *(void *)&self->_has |= 0x10000000000uLL;
    uint64_t v30 = *v29;
    if ((*v29 & 0x8000000000) == 0)
    {
LABEL_70:
      if ((v30 & 0x800000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_117;
    }
  }
  else if ((v30 & 0x8000000000) == 0)
  {
    goto LABEL_70;
  }
  self->_numRecvdSilencePkt = *((_DWORD *)v5 + 61);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x800000000) == 0)
  {
LABEL_71:
    if ((v30 & 0x100000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_numLostPkt = *((_DWORD *)v5 + 57);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x100000000000) == 0)
  {
LABEL_72:
    if ((v30 & 0x80000000000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_numUflwSpeechPkt = *((_DWORD *)v5 + 66);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x80000000000) == 0)
  {
LABEL_73:
    if ((v30 & 0x400000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_numUflwSilencePkt = *((_DWORD *)v5 + 65);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x400000000) == 0)
  {
LABEL_74:
    if ((v30 & 0x200000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_numEnqdSpeechPkt = *((_DWORD *)v5 + 56);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x200000000) == 0)
  {
LABEL_75:
    if ((v30 & 0x4000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_numEnqdSilencePkt = *((_DWORD *)v5 + 55);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x4000000000) == 0)
  {
LABEL_76:
    if ((v30 & 0x1000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_numPlayedSpeechPkt = *((_DWORD *)v5 + 60);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x1000000000) == 0)
  {
LABEL_77:
    if ((v30 & 0x20000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_numMissedSpeechPkt = *((_DWORD *)v5 + 58);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v30 = *((void *)v5 + 48);
  if ((v30 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((v30 & 0x10) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_124:
  self->_numSpeechQempty = *((_DWORD *)v5 + 63);
  *(void *)&self->_has |= 0x20000000000uLL;
  if ((*((void *)v5 + 48) & 0x10) != 0)
  {
LABEL_79:
    self->_appCallId = *((_DWORD *)v5 + 14);
    *(void *)&self->_has |= 0x10uLL;
  }
LABEL_80:
  id v31 = (char *)[v5 delayCntsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (uint64_t m = 0; m != v32; ++m)
      -[CellularVoiceCallEvent addDelayCnt:](self, "addDelayCnt:", [v5 delayCntAtIndex:m]);
  }
  if ((*((void *)v5 + 48) & 0x2000) != 0)
  {
    self->_dedicatedBrInactiveToEndMs = *((_DWORD *)v5 + 29);
    *(void *)&self->_has |= 0x2000uLL;
  }
  lastAudioQualityCnt = self->_lastAudioQualityCnt;
  uint64_t v35 = *((void *)v5 + 21);
  if (lastAudioQualityCnt)
  {
    if (v35) {
      -[AudioQuality mergeFrom:](lastAudioQualityCnt, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[CellularVoiceCallEvent setLastAudioQualityCnt:](self, "setLastAudioQualityCnt:");
  }
  uint64_t v36 = (uint64_t *)(v5 + 384);
  uint64_t v37 = *((void *)v5 + 48);
  if ((v37 & 0x2000000000000) != 0)
  {
    self->_rtpPktLossPpt = *((_DWORD *)v5 + 79);
    *(void *)&self->_has |= 0x2000000000000uLL;
    uint64_t v37 = *v36;
    if ((*v36 & 0x400000000000000) == 0)
    {
LABEL_130:
      if ((v37 & 0x40000) == 0) {
        goto LABEL_131;
      }
      goto LABEL_168;
    }
  }
  else if ((v37 & 0x400000000000000) == 0)
  {
    goto LABEL_130;
  }
  self->_uflwPktPpt = *((_DWORD *)v5 + 91);
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v37 = *((void *)v5 + 48);
  if ((v37 & 0x40000) == 0)
  {
LABEL_131:
    if ((v37 & 0x2000000000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_frErasurePpt = *((_DWORD *)v5 + 34);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v37 = *((void *)v5 + 48);
  if ((v37 & 0x2000000000000000) == 0)
  {
LABEL_132:
    if ((v37 & 0x40) == 0) {
      goto LABEL_133;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_badAudioQuality = v5[373];
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v37 = *((void *)v5 + 48);
  if ((v37 & 0x40) == 0)
  {
LABEL_133:
    if ((v37 & 0x20) == 0) {
      goto LABEL_135;
    }
    goto LABEL_134;
  }
LABEL_170:
  self->_audioQualityThresholdPpt = *((_DWORD *)v5 + 16);
  *(void *)&self->_has |= 0x40uLL;
  if ((*((void *)v5 + 48) & 0x20) != 0)
  {
LABEL_134:
    self->_audioQosDetectWinLenSec = *((_DWORD *)v5 + 15);
    *(void *)&self->_has |= 0x20uLL;
  }
LABEL_135:
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v38 = *((id *)v5 + 38);
  id v39 = [v38 countByEnumeratingWithState:&v47 objects:v63 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v48;
    do
    {
      for (uint64_t n = 0; n != v40; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v48 != v41) {
          objc_enumerationMutation(v38);
        }
        -[CellularVoiceCallEvent addRfMeasInfo:](self, "addRfMeasInfo:", *(void *)(*((void *)&v47 + 1) + 8 * (void)n), (void)v47);
      }
      id v40 = [v38 countByEnumeratingWithState:&v47 objects:v63 count:16];
    }
    while (v40);
  }

  uint64_t v43 = (uint64_t *)(v5 + 384);
  uint64_t v44 = *((void *)v5 + 48);
  if ((v44 & 0x100000) != 0)
  {
    self->_hstState = *((_DWORD *)v5 + 39);
    *(void *)&self->_has |= 0x100000uLL;
    uint64_t v44 = *v43;
    if ((*v43 & 0x200000000000) == 0)
    {
LABEL_144:
      if ((v44 & 0x40000000000) == 0) {
        goto LABEL_145;
      }
      goto LABEL_174;
    }
  }
  else if ((v44 & 0x200000000000) == 0)
  {
    goto LABEL_144;
  }
  self->_psPref = *((_DWORD *)v5 + 70);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v44 = *((void *)v5 + 48);
  if ((v44 & 0x40000000000) == 0)
  {
LABEL_145:
    if ((v44 & 0x100000000) == 0) {
      goto LABEL_146;
    }
    goto LABEL_175;
  }
LABEL_174:
  self->_numSubs = *((_DWORD *)v5 + 64);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v44 = *((void *)v5 + 48);
  if ((v44 & 0x100000000) == 0)
  {
LABEL_146:
    if ((v44 & 0x40000000000000) == 0) {
      goto LABEL_147;
    }
    goto LABEL_176;
  }
LABEL_175:
  self->_numCps = *((_DWORD *)v5 + 54);
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  uint64_t v44 = *((void *)v5 + 48);
  if ((v44 & 0x40000000000000) == 0)
  {
LABEL_147:
    if ((v44 & 0x10000000000000) == 0) {
      goto LABEL_148;
    }
    goto LABEL_177;
  }
LABEL_176:
  self->_uint64_t sysModeO = *((_DWORD *)v5 + 87);
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v44 = *((void *)v5 + 48);
  if ((v44 & 0x10000000000000) == 0)
  {
LABEL_148:
    if ((v44 & 0x80000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_149;
  }
LABEL_177:
  self->_sidO = *((_DWORD *)v5 + 82);
  *(void *)&self->_has |= 0x10000000000000uLL;
  if ((*((void *)v5 + 48) & 0x80000000) != 0)
  {
LABEL_149:
    self->_nidO = *((_DWORD *)v5 + 53);
    *(void *)&self->_has |= 0x80000000uLL;
  }
LABEL_150:
  if (*((void *)v5 + 34)) {
    -[CellularVoiceCallEvent setPlmnO:](self, "setPlmnO:");
  }
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x1000000) != 0)
  {
    self->_lastRssuint64_t i = *((_DWORD *)v5 + 46);
    *(void *)&self->_has |= 0x1000000uLL;
    uint64_t v45 = *((void *)v5 + 48);
  }
  char v46 = v5[392];
  if ((v45 & 0x800000) != 0)
  {
    self->_lastRsrp = *((_DWORD *)v5 + 45);
    *(void *)&self->_has |= 0x800000uLL;
    uint64_t v45 = *((void *)v5 + 48);
    char v46 = v5[392];
    if ((v45 & 0x4000000000000000) == 0)
    {
LABEL_156:
      if ((v45 & 0x8000000000000000) == 0) {
        goto LABEL_157;
      }
      goto LABEL_181;
    }
  }
  else if ((v45 & 0x4000000000000000) == 0)
  {
    goto LABEL_156;
  }
  self->_barredFromSib1 = v5[374];
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v45 = *((void *)v5 + 48);
  char v46 = v5[392];
  if ((v45 & 0x8000000000000000) == 0)
  {
LABEL_157:
    if ((v46 & 1) == 0) {
      goto LABEL_158;
    }
    goto LABEL_182;
  }
LABEL_181:
  self->_barredFromSib2 = v5[375];
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v5[392] & 1) == 0)
  {
LABEL_158:
    if ((v45 & 0x400000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_183;
  }
LABEL_182:
  self->_connectionRejected = v5[376];
  *((unsigned char *)&self->_has + 8) |= 1u;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x400000) == 0)
  {
LABEL_159:
    if ((v45 & 0x10000000) == 0) {
      goto LABEL_160;
    }
    goto LABEL_184;
  }
LABEL_183:
  self->_lastMotionState = *((_DWORD *)v5 + 44);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x10000000) == 0)
  {
LABEL_160:
    if ((v45 & 0x800000000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_185;
  }
LABEL_184:
  self->_msSinceLastMotionState = *((_DWORD *)v5 + 50);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x800000000000000) == 0)
  {
LABEL_161:
    if ((v45 & 0x20000000000000) == 0) {
      goto LABEL_162;
    }
    goto LABEL_186;
  }
LABEL_185:
  self->_versiouint64_t n = *((_DWORD *)v5 + 92);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x20000000000000) == 0)
  {
LABEL_162:
    if ((v45 & 0x200000000000000) == 0) {
      goto LABEL_163;
    }
LABEL_187:
    self->_uint64_t typeOfCall = *((_DWORD *)v5 + 90);
    *(void *)&self->_has |= 0x200000000000000uLL;
    if ((*((void *)v5 + 48) & 1) == 0) {
      goto LABEL_165;
    }
    goto LABEL_164;
  }
LABEL_186:
  self->_subsId = *((_DWORD *)v5 + 86);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v45 = *((void *)v5 + 48);
  if ((v45 & 0x200000000000000) != 0) {
    goto LABEL_187;
  }
LABEL_163:
  if (v45)
  {
LABEL_164:
    self->_nr5gCellId = *((void *)v5 + 4);
    *(void *)&self->_has |= 1uLL;
  }
LABEL_165:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
}

- (BOOL)isAltStart
{
  return self->_isAltStart;
}

- (unsigned)hoAltSeqNum
{
  return self->_hoAltSeqNum;
}

- (unsigned)drxOn
{
  return self->_drxOn;
}

- (unsigned)rrcRelCause
{
  return self->_rrcRelCause;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (BOOL)dueToHandover
{
  return self->_dueToHandover;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
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

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)rfChannel
{
  return self->_rfChannel;
}

- (unsigned)tsAccuracyHour
{
  return self->_tsAccuracyHour;
}

- (BOOL)accessoryAttached
{
  return self->_accessoryAttached;
}

- (unsigned)accessoryAttachedBitmap
{
  return self->_accessoryAttachedBitmap;
}

- (unsigned)callSetupTimeMs
{
  return self->_callSetupTimeMs;
}

- (int)mtplInPoint1Db
{
  return self->_mtplInPoint1Db;
}

- (NSMutableArray)capEvents
{
  return self->_capEvents;
}

- (void)setCapEvents:(id)a3
{
}

- (unsigned)lastXSec
{
  return self->_lastXSec;
}

- (BOOL)lastXSecUlMrab
{
  return self->_lastXSecUlMrab;
}

- (BOOL)lastXSecDlMrab
{
  return self->_lastXSecDlMrab;
}

- (NSMutableArray)rbDatas
{
  return self->_rbDatas;
}

- (void)setRbDatas:(id)a3
{
}

- (unsigned)msgId
{
  return self->_msgId;
}

- (unsigned)eventId
{
  return self->_eventId;
}

- (unsigned)responseCode
{
  return self->_responseCode;
}

- (unsigned)callConnectDur
{
  return self->_callConnectDur;
}

- (unsigned)tbMs
{
  return self->_tbMs;
}

- (NSMutableArray)hcStats
{
  return self->_hcStats;
}

- (void)setHcStats:(id)a3
{
}

- (unsigned)numRecvdSpeechPkt
{
  return self->_numRecvdSpeechPkt;
}

- (unsigned)numRecvdSilencePkt
{
  return self->_numRecvdSilencePkt;
}

- (unsigned)numLostPkt
{
  return self->_numLostPkt;
}

- (unsigned)numUflwSpeechPkt
{
  return self->_numUflwSpeechPkt;
}

- (unsigned)numUflwSilencePkt
{
  return self->_numUflwSilencePkt;
}

- (unsigned)numEnqdSpeechPkt
{
  return self->_numEnqdSpeechPkt;
}

- (unsigned)numEnqdSilencePkt
{
  return self->_numEnqdSilencePkt;
}

- (unsigned)numPlayedSpeechPkt
{
  return self->_numPlayedSpeechPkt;
}

- (unsigned)numMissedSpeechPkt
{
  return self->_numMissedSpeechPkt;
}

- (unsigned)numSpeechQempty
{
  return self->_numSpeechQempty;
}

- (unsigned)appCallId
{
  return self->_appCallId;
}

- (unsigned)dedicatedBrInactiveToEndMs
{
  return self->_dedicatedBrInactiveToEndMs;
}

- (AudioQuality)lastAudioQualityCnt
{
  return self->_lastAudioQualityCnt;
}

- (void)setLastAudioQualityCnt:(id)a3
{
}

- (unsigned)rtpPktLossPpt
{
  return self->_rtpPktLossPpt;
}

- (unsigned)uflwPktPpt
{
  return self->_uflwPktPpt;
}

- (unsigned)frErasurePpt
{
  return self->_frErasurePpt;
}

- (BOOL)badAudioQuality
{
  return self->_badAudioQuality;
}

- (unsigned)audioQualityThresholdPpt
{
  return self->_audioQualityThresholdPpt;
}

- (unsigned)audioQosDetectWinLenSec
{
  return self->_audioQosDetectWinLenSec;
}

- (NSMutableArray)rfMeasInfos
{
  return self->_rfMeasInfos;
}

- (void)setRfMeasInfos:(id)a3
{
}

- (unsigned)hstState
{
  return self->_hstState;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)numCps
{
  return self->_numCps;
}

- (unsigned)sidO
{
  return self->_sidO;
}

- (unsigned)nidO
{
  return self->_nidO;
}

- (NSData)plmnO
{
  return self->_plmnO;
}

- (void)setPlmnO:(id)a3
{
}

- (int)lastRssi
{
  return self->_lastRssi;
}

- (int)lastRsrp
{
  return self->_lastRsrp;
}

- (BOOL)barredFromSib1
{
  return self->_barredFromSib1;
}

- (BOOL)barredFromSib2
{
  return self->_barredFromSib2;
}

- (BOOL)connectionRejected
{
  return self->_connectionRejected;
}

- (unsigned)lastMotionState
{
  return self->_lastMotionState;
}

- (unsigned)msSinceLastMotionState
{
  return self->_msSinceLastMotionState;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unint64_t)nr5gCellId
{
  return self->_nr5gCellId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_rfMeasInfos, 0);
  objc_storeStrong((id *)&self->_rbDatas, 0);
  objc_storeStrong((id *)&self->_plmnO, 0);
  objc_storeStrong((id *)&self->_lastAudioQualityCnt, 0);
  objc_storeStrong((id *)&self->_hcStats, 0);
  objc_storeStrong((id *)&self->_capEvents, 0);

  objc_storeStrong((id *)&self->_callId, 0);
}

@end