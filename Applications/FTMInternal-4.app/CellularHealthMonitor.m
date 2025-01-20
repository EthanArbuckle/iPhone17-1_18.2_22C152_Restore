@interface CellularHealthMonitor
- (BOOL)dcActive;
- (BOOL)hasCellId;
- (BOOL)hasDataStallType;
- (BOOL)hasDcActive;
- (BOOL)hasFbrxRsrpRat;
- (BOOL)hasFreqRange;
- (BOOL)hasHmType;
- (BOOL)hasImei;
- (BOOL)hasLacTac;
- (BOOL)hasLastSearchRat;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRat;
- (BOOL)hasRepeatedBeamFailures;
- (BOOL)hasRepeatedLteRachFailures;
- (BOOL)hasRepeatedLteRlfFailures;
- (BOOL)hasRepeatedNrCellInvalidationArfcn;
- (BOOL)hasRepeatedNrCellInvalidationBand;
- (BOOL)hasRepeatedNrCellInvalidationOccurences;
- (BOOL)hasRepeatedNrCellInvalidationPci;
- (BOOL)hasRepeatedNrRachFailures;
- (BOOL)hasRepeatedNrRlfFailures;
- (BOOL)hasRepeatedScgFailures;
- (BOOL)hasRxChain;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imei;
- (NSData)plmn;
- (NSData)simHplmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataStallTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fbrxRsrpRatAsString:(int)a3;
- (id)hmTypeAsString:(int)a3;
- (id)lastSearchRatAsString:(int)a3;
- (id)ratAsString:(int)a3;
- (int)StringAsDataStallType:(id)a3;
- (int)StringAsFbrxRsrpRat:(id)a3;
- (int)StringAsHmType:(id)a3;
- (int)StringAsLastSearchRat:(id)a3;
- (int)StringAsRat:(id)a3;
- (int)dataStallType;
- (int)fbrxRsrpRat;
- (int)hmType;
- (int)lastSearchRat;
- (int)rat;
- (unint64_t)cellId;
- (unint64_t)countOfInvalidationReasonsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)countOfInvalidationReasonAtIndex:(unint64_t)a3;
- (unsigned)countOfInvalidationReasons;
- (unsigned)freqRange;
- (unsigned)lacTac;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)repeatedBeamFailures;
- (unsigned)repeatedLteRachFailures;
- (unsigned)repeatedLteRlfFailures;
- (unsigned)repeatedNrCellInvalidationArfcn;
- (unsigned)repeatedNrCellInvalidationBand;
- (unsigned)repeatedNrCellInvalidationOccurences;
- (unsigned)repeatedNrCellInvalidationPci;
- (unsigned)repeatedNrRachFailures;
- (unsigned)repeatedNrRlfFailures;
- (unsigned)repeatedScgFailures;
- (unsigned)rxChain;
- (unsigned)subsId;
- (void)addCountOfInvalidationReason:(unsigned int)a3;
- (void)clearCountOfInvalidationReasons;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCellId:(unint64_t)a3;
- (void)setCountOfInvalidationReasons:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDataStallType:(int)a3;
- (void)setDcActive:(BOOL)a3;
- (void)setFbrxRsrpRat:(int)a3;
- (void)setFreqRange:(unsigned int)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasDataStallType:(BOOL)a3;
- (void)setHasDcActive:(BOOL)a3;
- (void)setHasFbrxRsrpRat:(BOOL)a3;
- (void)setHasFreqRange:(BOOL)a3;
- (void)setHasHmType:(BOOL)a3;
- (void)setHasLacTac:(BOOL)a3;
- (void)setHasLastSearchRat:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasRepeatedBeamFailures:(BOOL)a3;
- (void)setHasRepeatedLteRachFailures:(BOOL)a3;
- (void)setHasRepeatedLteRlfFailures:(BOOL)a3;
- (void)setHasRepeatedNrCellInvalidationArfcn:(BOOL)a3;
- (void)setHasRepeatedNrCellInvalidationBand:(BOOL)a3;
- (void)setHasRepeatedNrCellInvalidationOccurences:(BOOL)a3;
- (void)setHasRepeatedNrCellInvalidationPci:(BOOL)a3;
- (void)setHasRepeatedNrRachFailures:(BOOL)a3;
- (void)setHasRepeatedNrRlfFailures:(BOOL)a3;
- (void)setHasRepeatedScgFailures:(BOOL)a3;
- (void)setHasRxChain:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHmType:(int)a3;
- (void)setImei:(id)a3;
- (void)setLacTac:(unsigned int)a3;
- (void)setLastSearchRat:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRat:(int)a3;
- (void)setRepeatedBeamFailures:(unsigned int)a3;
- (void)setRepeatedLteRachFailures:(unsigned int)a3;
- (void)setRepeatedLteRlfFailures:(unsigned int)a3;
- (void)setRepeatedNrCellInvalidationArfcn:(unsigned int)a3;
- (void)setRepeatedNrCellInvalidationBand:(unsigned int)a3;
- (void)setRepeatedNrCellInvalidationOccurences:(unsigned int)a3;
- (void)setRepeatedNrCellInvalidationPci:(unsigned int)a3;
- (void)setRepeatedNrRachFailures:(unsigned int)a3;
- (void)setRepeatedNrRlfFailures:(unsigned int)a3;
- (void)setRepeatedScgFailures:(unsigned int)a3;
- (void)setRxChain:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularHealthMonitor

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularHealthMonitor;
  [(CellularHealthMonitor *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasImei
{
  return self->_imei != 0;
}

- (int)rat
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)ratAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    int v3 = *(&off_100287E30 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
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

- (int)dataStallType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_dataStallType;
  }
  else {
    return 0;
  }
}

- (void)setDataStallType:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dataStallType = a3;
}

- (void)setHasDataStallType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataStallType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)dataStallTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287E00 + a3);
  }

  return v3;
}

- (int)StringAsDataStallType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AP_DL_DATA_STALL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AP_UL_DATA_STALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AP_WRITE_ERROR_STALL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BB_DL_AS_DATA_STALL_VIA_QSH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BB_UL_AS_DATA_STALL_VIA_QSH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MAX_STALL_TYPE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)lastSearchRat
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_lastSearchRat;
  }
  else {
    return 0;
  }
}

- (void)setLastSearchRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lastSearchRat = a3;
}

- (void)setHasLastSearchRat:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLastSearchRat
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)lastSearchRatAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    int v3 = *(&off_100287E30 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsLastSearchRat:(id)a3
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

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setRepeatedScgFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_repeatedScgFailures = a3;
}

- (void)setHasRepeatedScgFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRepeatedScgFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRepeatedBeamFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_repeatedBeamFailures = a3;
}

- (void)setHasRepeatedBeamFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRepeatedBeamFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)hmType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_hmType;
  }
  else {
    return 0;
  }
}

- (void)setHmType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hmType = a3;
}

- (void)setHasHmType:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHmType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)hmTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287EB0 + a3);
  }

  return v3;
}

- (int)StringAsHmType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_NO_SEARCH"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_DATA_STALLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_DATA_IN_SLEEP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_STUCK_IN_DCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_NO_TCXO_SHUTDOWN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_SIM_ERROR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_5G_ACCESS_WHEN_RESTRICTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_5G_REPEATED_SCG_FAILURES"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_TYPE_5G_REPEATED_BEAM_FAILURES"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_FREQUENT_LTE_RLF"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITO_FREQUENT_LTE_RACH_FAILURES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_FREQUENT_NR_RLF"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_FREQUENT_NR_RACH_FAILURES"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_FREQUENT_NR_CELL_INVALIDATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_BAD_FBRX_MEASUREMENT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_BAD_PDET_MEASUREMENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_LTE_RSRP_FLOOR"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HEALTH_MONITOR_NR5G_RSRP_FLOOR"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumSubs
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setDcActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_dcActive = a3;
}

- (void)setHasDcActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasDcActive
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLacTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lacTac = a3;
}

- (void)setHasLacTac:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLacTac
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCellId:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCellId
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRepeatedLteRlfFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_repeatedLteRlfFailures = a3;
}

- (void)setHasRepeatedLteRlfFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRepeatedLteRlfFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRepeatedLteRachFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_repeatedLteRachFailures = a3;
}

- (void)setHasRepeatedLteRachFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRepeatedLteRachFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRepeatedNrRlfFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_repeatedNrRlfFailures = a3;
}

- (void)setHasRepeatedNrRlfFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRepeatedNrRlfFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRepeatedNrRachFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_repeatedNrRachFailures = a3;
}

- (void)setHasRepeatedNrRachFailures:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRepeatedNrRachFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRepeatedNrCellInvalidationOccurences:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_repeatedNrCellInvalidationOccurences = a3;
}

- (void)setHasRepeatedNrCellInvalidationOccurences:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationOccurences
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRepeatedNrCellInvalidationPci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_repeatedNrCellInvalidationPci = a3;
}

- (void)setHasRepeatedNrCellInvalidationPci:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationPci
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRepeatedNrCellInvalidationArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_repeatedNrCellInvalidationArfcn = a3;
}

- (void)setHasRepeatedNrCellInvalidationArfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationArfcn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRepeatedNrCellInvalidationBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_repeatedNrCellInvalidationBand = a3;
}

- (void)setHasRepeatedNrCellInvalidationBand:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationBand
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (unint64_t)countOfInvalidationReasonsCount
{
  return self->_countOfInvalidationReasons.count;
}

- (unsigned)countOfInvalidationReasons
{
  return self->_countOfInvalidationReasons.list;
}

- (void)clearCountOfInvalidationReasons
{
}

- (void)addCountOfInvalidationReason:(unsigned int)a3
{
}

- (unsigned)countOfInvalidationReasonAtIndex:(unint64_t)a3
{
  p_countOfInvalidationReasons = &self->_countOfInvalidationReasons;
  unint64_t count = self->_countOfInvalidationReasons.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_countOfInvalidationReasons->list[a3];
}

- (void)setCountOfInvalidationReasons:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRxChain:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rxChain = a3;
}

- (void)setHasRxChain:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRxChain
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFreqRange
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)fbrxRsrpRat
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_fbrxRsrpRat;
  }
  else {
    return 0;
  }
}

- (void)setFbrxRsrpRat:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_fbrxRsrpRat = a3;
}

- (void)setHasFbrxRsrpRat:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFbrxRsrpRat
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)fbrxRsrpRatAsString:(int)a3
{
  if (a3 >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287F40 + a3);
  }

  return v3;
}

- (int)StringAsFbrxRsrpRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RF_TECH_ID_LTE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_1x"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_HDR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_GSM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_WCDMA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_TDSCDMA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RF_TECH_ID_NR5G"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularHealthMonitor;
  id v3 = [(CellularHealthMonitor *)&v7 description];
  int v4 = [(CellularHealthMonitor *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  imei = self->_imei;
  if (imei) {
    [v3 setObject:imei forKey:@"imei"];
  }
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    uint64_t rat = self->_rat;
    if rat < 0x10 && ((0x9FFFu >> rat))
    {
      v16 = *(&off_100287E30 + rat);
    }
    else
    {
      v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rat];
    }
    [v3 setObject:v16 forKey:@"rat"];

    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  uint64_t dataStallType = self->_dataStallType;
  if (dataStallType >= 6)
  {
    v34 = +[NSString stringWithFormat:@"(unknown: %i)", self->_dataStallType];
  }
  else
  {
    v34 = *(&off_100287E00 + dataStallType);
  }
  [v3 setObject:v34 forKey:@"data_stall_type"];

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_68;
  }
LABEL_63:
  uint64_t lastSearchRat = self->_lastSearchRat;
  if lastSearchRat < 0x10 && ((0x9FFFu >> lastSearchRat))
  {
    v36 = *(&off_100287E30 + lastSearchRat);
  }
  else
  {
    v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_lastSearchRat];
  }
  [v3 setObject:v36 forKey:@"last_search_rat"];

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_69;
  }
LABEL_68:
  v37 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v37 forKey:@"subs_id"];

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_70;
  }
LABEL_69:
  v38 = +[NSNumber numberWithUnsignedInt:self->_repeatedScgFailures];
  [v3 setObject:v38 forKey:@"repeated_scg_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_71;
  }
LABEL_70:
  v39 = +[NSNumber numberWithUnsignedInt:self->_repeatedBeamFailures];
  [v3 setObject:v39 forKey:@"repeated_beam_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_71:
  uint64_t hmType = self->_hmType;
  if (hmType >= 0x12)
  {
    v41 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hmType];
  }
  else
  {
    v41 = *(&off_100287EB0 + hmType);
  }
  [v3 setObject:v41 forKey:@"hm_type"];

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v7 forKey:@"num_subs"];
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v9 forKey:@"ps_pref"];
  }
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    v17 = +[NSNumber numberWithBool:self->_dcActive];
    [v3 setObject:v17 forKey:@"dc_active"];

    $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x40) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v11 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_lacTac];
  [v3 setObject:v18 forKey:@"lac_tac"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v11 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_42;
  }
LABEL_41:
  v19 = +[NSNumber numberWithUnsignedLongLong:self->_cellId];
  [v3 setObject:v19 forKey:@"cell_id"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_43;
  }
LABEL_42:
  v20 = +[NSNumber numberWithUnsignedInt:self->_repeatedLteRlfFailures];
  [v3 setObject:v20 forKey:@"repeated_lte_rlf_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v11 & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }
LABEL_43:
  v21 = +[NSNumber numberWithUnsignedInt:self->_repeatedLteRachFailures];
  [v3 setObject:v21 forKey:@"repeated_lte_rach_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v11 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_45;
  }
LABEL_44:
  v22 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrRlfFailures];
  [v3 setObject:v22 forKey:@"repeated_nr_rlf_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v11 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_46;
  }
LABEL_45:
  v23 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrRachFailures];
  [v3 setObject:v23 forKey:@"repeated_nr_rach_failures"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v11 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_47;
  }
LABEL_46:
  v24 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrCellInvalidationOccurences];
  [v3 setObject:v24 forKey:@"repeated_nr_cell_invalidation_occurences"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v11 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_48;
  }
LABEL_47:
  v25 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrCellInvalidationPci];
  [v3 setObject:v25 forKey:@"repeated_nr_cell_invalidation_pci"];

  $2B764557029E21ADF691D3FFD146E5E8 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v11 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_48:
  v26 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrCellInvalidationArfcn];
  [v3 setObject:v26 forKey:@"repeated_nr_cell_invalidation_arfcn"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    v12 = +[NSNumber numberWithUnsignedInt:self->_repeatedNrCellInvalidationBand];
    [v3 setObject:v12 forKey:@"repeated_nr_cell_invalidation_band"];
  }
LABEL_32:
  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"count_of_invalidation_reason"];

  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) == 0)
  {
    if ((*(unsigned char *)&v14 & 0x10) == 0) {
      goto LABEL_34;
    }
LABEL_51:
    v28 = +[NSNumber numberWithUnsignedInt:self->_freqRange];
    [v3 setObject:v28 forKey:@"freq_range"];

    if ((*(_DWORD *)&self->_has & 8) == 0) {
      goto LABEL_56;
    }
    goto LABEL_52;
  }
  v27 = +[NSNumber numberWithUnsignedInt:self->_rxChain];
  [v3 setObject:v27 forKey:@"rx_chain"];

  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) != 0) {
    goto LABEL_51;
  }
LABEL_34:
  if ((*(unsigned char *)&v14 & 8) == 0) {
    goto LABEL_56;
  }
LABEL_52:
  uint64_t fbrxRsrpRat = self->_fbrxRsrpRat;
  if (fbrxRsrpRat >= 7)
  {
    v30 = +[NSString stringWithFormat:@"(unknown: %i)", self->_fbrxRsrpRat];
  }
  else
  {
    v30 = *(&off_100287F40 + fbrxRsrpRat);
  }
  [v3 setObject:v30 forKey:@"fbrx_rsrp_rat"];

LABEL_56:
  id v31 = v3;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E785C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_imei)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_14:
  if (self->_plmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
  if (self->_simHplmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x40) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v6 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_52;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_32:
  if (self->_countOfInvalidationReasons.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v7;
    }
    while (v7 < self->_countOfInvalidationReasons.count);
  }
  $2B764557029E21ADF691D3FFD146E5E8 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    $2B764557029E21ADF691D3FFD146E5E8 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 0x10) == 0)
    {
LABEL_37:
      if ((*(unsigned char *)&v8 & 8) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
    goto LABEL_37;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_38:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_39:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    *((_DWORD *)v4 + 42) |= 2u;
  }
  $2B764557029E21ADF691D3FFD146E5E8 v11 = v4;
  if (self->_imei)
  {
    [v4 setImei:];
    id v4 = v11;
  }
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_rat;
    *((_DWORD *)v4 + 42) |= 0x400u;
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_dataStallType;
  *((_DWORD *)v4 + 42) |= 4u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 19) = self->_lastSearchRat;
  *((_DWORD *)v4 + 42) |= 0x80u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 40) = self->_subsId;
  *((_DWORD *)v4 + 42) |= 0x400000u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 35) = self->_repeatedScgFailures;
  *((_DWORD *)v4 + 42) |= 0x100000u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 26) = self->_repeatedBeamFailures;
  *((_DWORD *)v4 + 42) |= 0x800u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_49:
  *((_DWORD *)v4 + 15) = self->_hmType;
  *((_DWORD *)v4 + 42) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 20) = self->_numSubs;
    *((_DWORD *)v4 + 42) |= 0x100u;
  }
LABEL_14:
  if (self->_plmn)
  {
    [v11 setPlmn:];
    id v4 = v11;
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_psPref;
    *((_DWORD *)v4 + 42) |= 0x200u;
  }
  if (self->_simHplmn)
  {
    [v11 setSimHplmn];
    id v4 = v11;
  }
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    *((unsigned char *)v4 + 164) = self->_dcActive;
    *((_DWORD *)v4 + 42) |= 0x800000u;
    $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x40) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&v6 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  *((_DWORD *)v4 + 18) = self->_lacTac;
  *((_DWORD *)v4 + 42) |= 0x40u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  v4[4] = self->_cellId;
  *((_DWORD *)v4 + 42) |= 1u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 28) = self->_repeatedLteRlfFailures;
  *((_DWORD *)v4 + 42) |= 0x2000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 27) = self->_repeatedLteRachFailures;
  *((_DWORD *)v4 + 42) |= 0x1000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 34) = self->_repeatedNrRlfFailures;
  *((_DWORD *)v4 + 42) |= 0x80000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 33) = self->_repeatedNrRachFailures;
  *((_DWORD *)v4 + 42) |= 0x40000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 31) = self->_repeatedNrCellInvalidationOccurences;
  *((_DWORD *)v4 + 42) |= 0x10000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
LABEL_60:
    *((_DWORD *)v4 + 29) = self->_repeatedNrCellInvalidationArfcn;
    *((_DWORD *)v4 + 42) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_59:
  *((_DWORD *)v4 + 32) = self->_repeatedNrCellInvalidationPci;
  *((_DWORD *)v4 + 42) |= 0x20000u;
  $2B764557029E21ADF691D3FFD146E5E8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0) {
    goto LABEL_60;
  }
LABEL_30:
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_31:
    *((_DWORD *)v4 + 30) = self->_repeatedNrCellInvalidationBand;
    *((_DWORD *)v4 + 42) |= 0x8000u;
  }
LABEL_32:
  if ([(CellularHealthMonitor *)self countOfInvalidationReasonsCount])
  {
    [v11 clearCountOfInvalidationReasons];
    unint64_t v7 = [(CellularHealthMonitor *)self countOfInvalidationReasonsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [v11 addCountOfInvalidationReason:[self countOfInvalidationReasonAtIndex:i]];
    }
  }
  $2B764557029E21ADF691D3FFD146E5E8 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) != 0)
  {
    v11[36] = self->_rxChain;
    v11[42] |= 0x200000u;
    $2B764557029E21ADF691D3FFD146E5E8 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 0x10) == 0)
    {
LABEL_38:
      if ((*(unsigned char *)&v10 & 8) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
    goto LABEL_38;
  }
  v11[14] = self->_freqRange;
  v11[42] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_39:
    v11[13] = self->_fbrxRsrpRat;
    v11[42] |= 8u;
  }
LABEL_40:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $2B764557029E21ADF691D3FFD146E5E8 v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[5] = self->_timestamp;
    *((_DWORD *)v5 + 42) |= 2u;
  }
  id v7 = [(NSData *)self->_imei copyWithZone:a3];
  unint64_t v8 = (void *)v6[8];
  v6[8] = v7;

  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_DWORD *)v6 + 25) = self->_rat;
    *((_DWORD *)v6 + 42) |= 0x400u;
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 12) = self->_dataStallType;
  *((_DWORD *)v6 + 42) |= 4u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 19) = self->_lastSearchRat;
  *((_DWORD *)v6 + 42) |= 0x80u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 40) = self->_subsId;
  *((_DWORD *)v6 + 42) |= 0x400000u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 35) = self->_repeatedScgFailures;
  *((_DWORD *)v6 + 42) |= 0x100000u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 26) = self->_repeatedBeamFailures;
  *((_DWORD *)v6 + 42) |= 0x800u;
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_37:
  *((_DWORD *)v6 + 15) = self->_hmType;
  *((_DWORD *)v6 + 42) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 42) |= 0x100u;
  }
LABEL_12:
  id v10 = [(NSData *)self->_plmn copyWithZone:a3];
  $2B764557029E21ADF691D3FFD146E5E8 v11 = (void *)v6[11];
  v6[11] = v10;

  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_psPref;
    *((_DWORD *)v6 + 42) |= 0x200u;
  }
  id v12 = [(NSData *)self->_simHplmn copyWithZone:a3];
  v13 = (void *)v6[19];
  v6[19] = v12;

  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    *((unsigned char *)v6 + 164) = self->_dcActive;
    *((_DWORD *)v6 + 42) |= 0x800000u;
    $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 0x40) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&v14 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&v14 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 18) = self->_lacTac;
  *((_DWORD *)v6 + 42) |= 0x40u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  v6[4] = self->_cellId;
  *((_DWORD *)v6 + 42) |= 1u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 28) = self->_repeatedLteRlfFailures;
  *((_DWORD *)v6 + 42) |= 0x2000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v14 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 27) = self->_repeatedLteRachFailures;
  *((_DWORD *)v6 + 42) |= 0x1000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 34) = self->_repeatedNrRlfFailures;
  *((_DWORD *)v6 + 42) |= 0x80000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 33) = self->_repeatedNrRachFailures;
  *((_DWORD *)v6 + 42) |= 0x40000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x20000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 31) = self->_repeatedNrCellInvalidationOccurences;
  *((_DWORD *)v6 + 42) |= 0x10000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v6 + 32) = self->_repeatedNrCellInvalidationPci;
  *((_DWORD *)v6 + 42) |= 0x20000u;
  $2B764557029E21ADF691D3FFD146E5E8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_48:
  *((_DWORD *)v6 + 29) = self->_repeatedNrCellInvalidationArfcn;
  *((_DWORD *)v6 + 42) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    *((_DWORD *)v6 + 30) = self->_repeatedNrCellInvalidationBand;
    *((_DWORD *)v6 + 42) |= 0x8000u;
  }
LABEL_26:
  PBRepeatedUInt32Copy();
  $2B764557029E21ADF691D3FFD146E5E8 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    if ((*(unsigned char *)&v15 & 0x10) == 0) {
      goto LABEL_28;
    }
LABEL_51:
    *((_DWORD *)v6 + 14) = self->_freqRange;
    *((_DWORD *)v6 + 42) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 8) == 0) {
      return v6;
    }
    goto LABEL_29;
  }
  *((_DWORD *)v6 + 36) = self->_rxChain;
  *((_DWORD *)v6 + 42) |= 0x200000u;
  $2B764557029E21ADF691D3FFD146E5E8 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) != 0) {
    goto LABEL_51;
  }
LABEL_28:
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
LABEL_29:
    *((_DWORD *)v6 + 13) = self->_fbrxRsrpRat;
    *((_DWORD *)v6 + 42) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_135;
  }
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  int v6 = *((_DWORD *)v4 + 42);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((void *)v4 + 5)) {
      goto LABEL_135;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_135;
  }
  imeuint64_t i = self->_imei;
  if ((unint64_t)imei | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](imei, "isEqual:")) {
      goto LABEL_135;
    }
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_rat != *((_DWORD *)v4 + 25)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_dataStallType != *((_DWORD *)v4 + 12)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_lastSearchRat != *((_DWORD *)v4 + 19)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_subsId != *((_DWORD *)v4 + 40)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_repeatedScgFailures != *((_DWORD *)v4 + 35)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_repeatedBeamFailures != *((_DWORD *)v4 + 26)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_hmType != *((_DWORD *)v4 + 15)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 20)) {
      goto LABEL_135;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_135;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:")) {
      goto LABEL_135;
    }
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_psPref != *((_DWORD *)v4 + 24)) {
      goto LABEL_135;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_135;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:")) {
      goto LABEL_135;
    }
    $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  }
  int v12 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0) {
      goto LABEL_135;
    }
    if (self->_dcActive)
    {
      if (!*((unsigned char *)v4 + 164)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 164))
    {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_lacTac != *((_DWORD *)v4 + 18)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_135;
  }
  if (*(unsigned char *)&has)
  {
    if ((v12 & 1) == 0 || self->_cellId != *((void *)v4 + 4)) {
      goto LABEL_135;
    }
  }
  else if (v12)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_repeatedLteRlfFailures != *((_DWORD *)v4 + 28)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_repeatedLteRachFailures != *((_DWORD *)v4 + 27)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_repeatedNrRlfFailures != *((_DWORD *)v4 + 34)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x80000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v12 & 0x40000) == 0 || self->_repeatedNrRachFailures != *((_DWORD *)v4 + 33)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x40000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_repeatedNrCellInvalidationOccurences != *((_DWORD *)v4 + 31)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_repeatedNrCellInvalidationPci != *((_DWORD *)v4 + 32)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_repeatedNrCellInvalidationArfcn != *((_DWORD *)v4 + 29)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_repeatedNrCellInvalidationBand != *((_DWORD *)v4 + 30)) {
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_135;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_135:
    BOOL v15 = 0;
    goto LABEL_136;
  }
  $2B764557029E21ADF691D3FFD146E5E8 v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&v13 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0 || self->_rxChain != *((_DWORD *)v4 + 36)) {
      goto LABEL_135;
    }
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_freqRange != *((_DWORD *)v4 + 14)) {
      goto LABEL_135;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_fbrxRsrpRat != *((_DWORD *)v4 + 13)) {
      goto LABEL_135;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((_DWORD *)v4 + 42) & 8) == 0;
  }
LABEL_136:

  return v15;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v34 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v34 = 0;
  }
  unint64_t v33 = (unint64_t)[(NSData *)self->_imei hash];
  $2B764557029E21ADF691D3FFD146E5E8 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    uint64_t v32 = 2654435761 * self->_rat;
    if ((*(unsigned char *)&has & 4) != 0)
    {
LABEL_6:
      uint64_t v31 = 2654435761 * self->_dataStallType;
      if ((*(unsigned char *)&has & 0x80) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v31 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v30 = 2654435761 * self->_lastSearchRat;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    uint64_t v29 = 2654435761 * self->_subsId;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_9:
    uint64_t v28 = 2654435761 * self->_repeatedScgFailures;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_10:
    uint64_t v27 = 2654435761 * self->_repeatedBeamFailures;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v26 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v26 = 2654435761 * self->_hmType;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v25 = 2654435761 * self->_numSubs;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v25 = 0;
LABEL_21:
  unint64_t v24 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    uint64_t v23 = 2654435761 * self->_psPref;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v22 = (unint64_t)[(NSData *)self->_simHplmn hash];
  $2B764557029E21ADF691D3FFD146E5E8 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
    uint64_t v21 = 2654435761 * self->_dcActive;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_26:
      uint64_t v20 = 2654435761 * self->_lacTac;
      if (*(unsigned char *)&v4) {
        goto LABEL_27;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v20 = 0;
  if (*(unsigned char *)&v4)
  {
LABEL_27:
    unint64_t v19 = 2654435761u * self->_cellId;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v19 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_28:
    uint64_t v18 = 2654435761 * self->_repeatedLteRlfFailures;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_29:
    uint64_t v5 = 2654435761 * self->_repeatedLteRachFailures;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_30:
    uint64_t v6 = 2654435761 * self->_repeatedNrRlfFailures;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_31:
    uint64_t v7 = 2654435761 * self->_repeatedNrRachFailures;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_32:
    uint64_t v8 = 2654435761 * self->_repeatedNrCellInvalidationOccurences;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_33:
    uint64_t v9 = 2654435761 * self->_repeatedNrCellInvalidationPci;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_34;
    }
LABEL_45:
    uint64_t v10 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_46;
  }
LABEL_44:
  uint64_t v9 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0) {
    goto LABEL_45;
  }
LABEL_34:
  uint64_t v10 = 2654435761 * self->_repeatedNrCellInvalidationArfcn;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_35:
    uint64_t v11 = 2654435761 * self->_repeatedNrCellInvalidationBand;
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v11 = 0;
LABEL_47:
  uint64_t v12 = PBRepeatedUInt32Hash();
  $2B764557029E21ADF691D3FFD146E5E8 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 0x10) != 0) {
      goto LABEL_49;
    }
LABEL_52:
    uint64_t v15 = 0;
    if ((*(unsigned char *)&v13 & 8) != 0) {
      goto LABEL_50;
    }
LABEL_53:
    uint64_t v16 = 0;
    return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  uint64_t v14 = 2654435761 * self->_rxChain;
  if ((*(unsigned char *)&v13 & 0x10) == 0) {
    goto LABEL_52;
  }
LABEL_49:
  uint64_t v15 = 2654435761 * self->_freqRange;
  if ((*(unsigned char *)&v13 & 8) == 0) {
    goto LABEL_53;
  }
LABEL_50:
  uint64_t v16 = 2654435761 * self->_fbrxRsrpRat;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 168) & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 5);
    *(_DWORD *)&self->_has |= 2u;
  }
  uint64_t v11 = v4;
  if (*((void *)v4 + 8))
  {
    -[CellularHealthMonitor setImei:](self, "setImei:");
    id v4 = v11;
  }
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x400) != 0)
  {
    self->_uint64_t rat = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_has |= 0x400u;
    int v5 = *((_DWORD *)v4 + 42);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_44;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_uint64_t dataStallType = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_uint64_t lastSearchRat = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x400000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_subsId = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_repeatedScgFailures = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_repeatedBeamFailures = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_48:
  self->_uint64_t hmType = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 42) & 0x100) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_14:
  if (*((void *)v4 + 11))
  {
    -[CellularHealthMonitor setPlmn:](self, "setPlmn:");
    id v4 = v11;
  }
  if ((*((unsigned char *)v4 + 169) & 2) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v4 + 19))
  {
    -[CellularHealthMonitor setSimHplmn:](self, "setSimHplmn:");
    id v4 = v11;
  }
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x800000) != 0)
  {
    self->_dcActive = *((unsigned char *)v4 + 164);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v6 = *((_DWORD *)v4 + 42);
    if ((v6 & 0x40) == 0)
    {
LABEL_22:
      if ((v6 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  self->_lacTac = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 1) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_cellId = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 1u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_repeatedLteRlfFailures = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_repeatedLteRachFailures = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x80000) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_repeatedNrRlfFailures = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_repeatedNrRachFailures = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x10000) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_repeatedNrCellInvalidationOccurences = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x20000) == 0)
  {
LABEL_29:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_repeatedNrCellInvalidationPcuint64_t i = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_59:
  self->_repeatedNrCellInvalidationArfcn = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 42) & 0x8000) != 0)
  {
LABEL_31:
    self->_repeatedNrCellInvalidationBand = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_32:
  uint64_t v7 = (char *)[v4 countOfInvalidationReasonsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[CellularHealthMonitor addCountOfInvalidationReason:](self, "addCountOfInvalidationReason:", [v11 countOfInvalidationReasonAtIndex:i]);
  }
  int v10 = v11[42];
  if ((v10 & 0x200000) != 0)
  {
    self->_rxChain = v11[36];
    *(_DWORD *)&self->_has |= 0x200000u;
    int v10 = v11[42];
    if ((v10 & 0x10) == 0)
    {
LABEL_37:
      if ((v10 & 8) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_37;
  }
  self->_freqRange = v11[14];
  *(_DWORD *)&self->_has |= 0x10u;
  if ((v11[42] & 8) != 0)
  {
LABEL_38:
    self->_uint64_t fbrxRsrpRat = v11[13];
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_39:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)repeatedScgFailures
{
  return self->_repeatedScgFailures;
}

- (unsigned)repeatedBeamFailures
{
  return self->_repeatedBeamFailures;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
}

- (BOOL)dcActive
{
  return self->_dcActive;
}

- (unsigned)lacTac
{
  return self->_lacTac;
}

- (unint64_t)cellId
{
  return self->_cellId;
}

- (unsigned)repeatedLteRlfFailures
{
  return self->_repeatedLteRlfFailures;
}

- (unsigned)repeatedLteRachFailures
{
  return self->_repeatedLteRachFailures;
}

- (unsigned)repeatedNrRlfFailures
{
  return self->_repeatedNrRlfFailures;
}

- (unsigned)repeatedNrRachFailures
{
  return self->_repeatedNrRachFailures;
}

- (unsigned)repeatedNrCellInvalidationOccurences
{
  return self->_repeatedNrCellInvalidationOccurences;
}

- (unsigned)repeatedNrCellInvalidationPci
{
  return self->_repeatedNrCellInvalidationPci;
}

- (unsigned)repeatedNrCellInvalidationArfcn
{
  return self->_repeatedNrCellInvalidationArfcn;
}

- (unsigned)repeatedNrCellInvalidationBand
{
  return self->_repeatedNrCellInvalidationBand;
}

- (unsigned)rxChain
{
  return self->_rxChain;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_imei, 0);
}

@end