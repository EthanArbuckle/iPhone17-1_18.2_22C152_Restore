@interface GEOCellConnectionQuality
+ (BOOL)isValid:(id)a3;
- (BOOL)cellIsLimitedService;
- (BOOL)cellIsNoService;
- (BOOL)cellIsRoaming;
- (BOOL)cellNpnStatus;
- (BOOL)hasBytesDlTotal;
- (BOOL)hasBytesUlTotal;
- (BOOL)hasCallID;
- (BOOL)hasCellArfcn;
- (BOOL)hasCellBand;
- (BOOL)hasCellBssLoad;
- (BOOL)hasCellDataLQM;
- (BOOL)hasCellEstimatedBW;
- (BOOL)hasCellGCI;
- (BOOL)hasCellHomePLMN;
- (BOOL)hasCellHomePLMN2;
- (BOOL)hasCellIsLimitedService;
- (BOOL)hasCellIsNoService;
- (BOOL)hasCellIsRoaming;
- (BOOL)hasCellLteRSRP;
- (BOOL)hasCellLteRSRQ;
- (BOOL)hasCellLteSNR;
- (BOOL)hasCellMaxDlCaNumConf;
- (BOOL)hasCellMaxUlCaNumConf;
- (BOOL)hasCellNpn;
- (BOOL)hasCellNpnStatus;
- (BOOL)hasCellNrRSRP;
- (BOOL)hasCellNrRSRQ;
- (BOOL)hasCellNrSNR;
- (BOOL)hasCellNsaFR1;
- (BOOL)hasCellNsaFR2;
- (BOOL)hasCellPMax;
- (BOOL)hasCellRatType;
- (BOOL)hasCellRrcState;
- (BOOL)hasCellServiceProvider;
- (BOOL)hasCellServiceProvider2;
- (BOOL)hasCellTotalDlBW;
- (BOOL)hasCellTotalUlBW;
- (BOOL)hasCellVoiceLQM;
- (BOOL)hasConnectionDuration;
- (BOOL)hasConnectionType;
- (BOOL)hasDlMedThroughput;
- (BOOL)hasDlPeakThroughput;
- (BOOL)hasEnvironment;
- (BOOL)hasFtCounter;
- (BOOL)hasFtFacetimeAction;
- (BOOL)hasFtFacetimePacketLoss;
- (BOOL)hasFtFacetimeTimeDelay;
- (BOOL)hasFtIRATRecommendation;
- (BOOL)hasFtIRATRecommendationReason;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCallFailed;
- (BOOL)hasIsEmergency;
- (BOOL)hasLatency;
- (BOOL)hasLocation;
- (BOOL)hasLowInternetDL;
- (BOOL)hasLowInternetUL;
- (BOOL)hasMessageTrigger;
- (BOOL)hasMessageType;
- (BOOL)hasMotionState;
- (BOOL)hasTimeOfDay;
- (BOOL)hasUlMedThroughput;
- (BOOL)hasUlPeakThroughput;
- (BOOL)hasWifiBand;
- (BOOL)hasWifiCaptiveNetworks;
- (BOOL)hasWifiCca;
- (BOOL)hasWifiChannel;
- (BOOL)hasWifiChannelWidth;
- (BOOL)hasWifiEstimatedBW;
- (BOOL)hasWifiPhyMode;
- (BOOL)hasWifiQbssLoad;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiRxPhyRate;
- (BOOL)hasWifiRxRetry;
- (BOOL)hasWifiSNR;
- (BOOL)hasWifiStationCount;
- (BOOL)hasWifiTxPER;
- (BOOL)hasWifiTxPhyRate;
- (BOOL)hasWrmAlertedMode;
- (BOOL)hasWrmAudioErasure;
- (BOOL)hasWrmIsPCDetected;
- (BOOL)hasWrmIsStallDetected;
- (BOOL)hasWrmVideoErasure;
- (BOOL)isCallFailed;
- (BOOL)isEmergency;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowInternetDL;
- (BOOL)lowInternetUL;
- (BOOL)readFrom:(id)a3;
- (BOOL)wifiCaptiveNetworks;
- (BOOL)wrmAlertedMode;
- (BOOL)wrmIsPCDetected;
- (BOOL)wrmIsStallDetected;
- (GEOCellConnectionQuality)init;
- (GEOCellConnectionQuality)initWithData:(id)a3;
- (GEOCellConnectionQuality)initWithDictionary:(id)a3;
- (GEOCellConnectionQuality)initWithJSON:(id)a3;
- (GEOLocation)location;
- (NSString)callID;
- (NSString)cellGCI;
- (NSString)cellHomePLMN;
- (NSString)cellHomePLMN2;
- (NSString)cellRatType;
- (NSString)cellServiceProvider;
- (NSString)cellServiceProvider2;
- (NSString)ftIRATRecommendation;
- (NSString)ftIRATRecommendationReason;
- (float)dlMedThroughput;
- (float)dlPeakThroughput;
- (float)ulMedThroughput;
- (float)ulPeakThroughput;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(char)a3 isJSON:;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)environmentAsString:(int)a3;
- (id)jsonRepresentation;
- (id)messageTriggerAsString:(int)a3;
- (id)messageTypeAsString:(int)a3;
- (id)motionStateAsString:(int)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsEnvironment:(id)a3;
- (int)StringAsMessageTrigger:(id)a3;
- (int)StringAsMessageType:(id)a3;
- (int)StringAsMotionState:(id)a3;
- (int)cellLteRSRP;
- (int)cellLteRSRQ;
- (int)cellLteSNR;
- (int)cellNrRSRP;
- (int)cellNrRSRQ;
- (int)cellNrSNR;
- (int)connectionType;
- (int)environment;
- (int)messageTrigger;
- (int)messageType;
- (int)motionState;
- (int64_t)wifiRssi;
- (int64_t)wifiSNR;
- (unint64_t)bytesDlTotal;
- (unint64_t)bytesUlTotal;
- (unint64_t)hash;
- (unint64_t)timeOfDay;
- (unsigned)cellArfcn;
- (unsigned)cellBand;
- (unsigned)cellBssLoad;
- (unsigned)cellDataLQM;
- (unsigned)cellEstimatedBW;
- (unsigned)cellMaxDlCaNumConf;
- (unsigned)cellMaxUlCaNumConf;
- (unsigned)cellNpn;
- (unsigned)cellNsaFR1;
- (unsigned)cellNsaFR2;
- (unsigned)cellPMax;
- (unsigned)cellRrcState;
- (unsigned)cellTotalDlBW;
- (unsigned)cellTotalUlBW;
- (unsigned)cellVoiceLQM;
- (unsigned)connectionDuration;
- (unsigned)ftCounter;
- (unsigned)ftFacetimeAction;
- (unsigned)ftFacetimePacketLoss;
- (unsigned)ftFacetimeTimeDelay;
- (unsigned)latency;
- (unsigned)wifiBand;
- (unsigned)wifiCca;
- (unsigned)wifiChannel;
- (unsigned)wifiChannelWidth;
- (unsigned)wifiEstimatedBW;
- (unsigned)wifiPhyMode;
- (unsigned)wifiQbssLoad;
- (unsigned)wifiRxPhyRate;
- (unsigned)wifiRxRetry;
- (unsigned)wifiStationCount;
- (unsigned)wifiTxPER;
- (unsigned)wifiTxPhyRate;
- (unsigned)wrmAudioErasure;
- (unsigned)wrmVideoErasure;
- (void)_readCallID;
- (void)_readCellGCI;
- (void)_readCellHomePLMN;
- (void)_readCellHomePLMN2;
- (void)_readCellRatType;
- (void)_readCellServiceProvider;
- (void)_readCellServiceProvider2;
- (void)_readFtIRATRecommendation;
- (void)_readFtIRATRecommendationReason;
- (void)_readLocation;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBytesDlTotal:(unint64_t)a3;
- (void)setBytesUlTotal:(unint64_t)a3;
- (void)setCallID:(id)a3;
- (void)setCellArfcn:(unsigned int)a3;
- (void)setCellBand:(unsigned int)a3;
- (void)setCellBssLoad:(unsigned int)a3;
- (void)setCellDataLQM:(unsigned int)a3;
- (void)setCellEstimatedBW:(unsigned int)a3;
- (void)setCellGCI:(id)a3;
- (void)setCellHomePLMN2:(id)a3;
- (void)setCellHomePLMN:(id)a3;
- (void)setCellIsLimitedService:(BOOL)a3;
- (void)setCellIsNoService:(BOOL)a3;
- (void)setCellIsRoaming:(BOOL)a3;
- (void)setCellLteRSRP:(int)a3;
- (void)setCellLteRSRQ:(int)a3;
- (void)setCellLteSNR:(int)a3;
- (void)setCellMaxDlCaNumConf:(unsigned int)a3;
- (void)setCellMaxUlCaNumConf:(unsigned int)a3;
- (void)setCellNpn:(unsigned int)a3;
- (void)setCellNpnStatus:(BOOL)a3;
- (void)setCellNrRSRP:(int)a3;
- (void)setCellNrRSRQ:(int)a3;
- (void)setCellNrSNR:(int)a3;
- (void)setCellNsaFR1:(unsigned int)a3;
- (void)setCellNsaFR2:(unsigned int)a3;
- (void)setCellPMax:(unsigned int)a3;
- (void)setCellRatType:(id)a3;
- (void)setCellRrcState:(unsigned int)a3;
- (void)setCellServiceProvider2:(id)a3;
- (void)setCellServiceProvider:(id)a3;
- (void)setCellTotalDlBW:(unsigned int)a3;
- (void)setCellTotalUlBW:(unsigned int)a3;
- (void)setCellVoiceLQM:(unsigned int)a3;
- (void)setConnectionDuration:(unsigned int)a3;
- (void)setConnectionType:(int)a3;
- (void)setDlMedThroughput:(float)a3;
- (void)setDlPeakThroughput:(float)a3;
- (void)setEnvironment:(int)a3;
- (void)setFtCounter:(unsigned int)a3;
- (void)setFtFacetimeAction:(unsigned int)a3;
- (void)setFtFacetimePacketLoss:(unsigned int)a3;
- (void)setFtFacetimeTimeDelay:(unsigned int)a3;
- (void)setFtIRATRecommendation:(id)a3;
- (void)setFtIRATRecommendationReason:(id)a3;
- (void)setHasBytesDlTotal:(BOOL)a3;
- (void)setHasBytesUlTotal:(BOOL)a3;
- (void)setHasCellArfcn:(BOOL)a3;
- (void)setHasCellBand:(BOOL)a3;
- (void)setHasCellBssLoad:(BOOL)a3;
- (void)setHasCellDataLQM:(BOOL)a3;
- (void)setHasCellEstimatedBW:(BOOL)a3;
- (void)setHasCellIsLimitedService:(BOOL)a3;
- (void)setHasCellIsNoService:(BOOL)a3;
- (void)setHasCellIsRoaming:(BOOL)a3;
- (void)setHasCellLteRSRP:(BOOL)a3;
- (void)setHasCellLteRSRQ:(BOOL)a3;
- (void)setHasCellLteSNR:(BOOL)a3;
- (void)setHasCellMaxDlCaNumConf:(BOOL)a3;
- (void)setHasCellMaxUlCaNumConf:(BOOL)a3;
- (void)setHasCellNpn:(BOOL)a3;
- (void)setHasCellNpnStatus:(BOOL)a3;
- (void)setHasCellNrRSRP:(BOOL)a3;
- (void)setHasCellNrRSRQ:(BOOL)a3;
- (void)setHasCellNrSNR:(BOOL)a3;
- (void)setHasCellNsaFR1:(BOOL)a3;
- (void)setHasCellNsaFR2:(BOOL)a3;
- (void)setHasCellPMax:(BOOL)a3;
- (void)setHasCellRrcState:(BOOL)a3;
- (void)setHasCellTotalDlBW:(BOOL)a3;
- (void)setHasCellTotalUlBW:(BOOL)a3;
- (void)setHasCellVoiceLQM:(BOOL)a3;
- (void)setHasConnectionDuration:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDlMedThroughput:(BOOL)a3;
- (void)setHasDlPeakThroughput:(BOOL)a3;
- (void)setHasEnvironment:(BOOL)a3;
- (void)setHasFtCounter:(BOOL)a3;
- (void)setHasFtFacetimeAction:(BOOL)a3;
- (void)setHasFtFacetimePacketLoss:(BOOL)a3;
- (void)setHasFtFacetimeTimeDelay:(BOOL)a3;
- (void)setHasIsCallFailed:(BOOL)a3;
- (void)setHasIsEmergency:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasLowInternetDL:(BOOL)a3;
- (void)setHasLowInternetUL:(BOOL)a3;
- (void)setHasMessageTrigger:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)setHasUlMedThroughput:(BOOL)a3;
- (void)setHasUlPeakThroughput:(BOOL)a3;
- (void)setHasWifiBand:(BOOL)a3;
- (void)setHasWifiCaptiveNetworks:(BOOL)a3;
- (void)setHasWifiCca:(BOOL)a3;
- (void)setHasWifiChannel:(BOOL)a3;
- (void)setHasWifiChannelWidth:(BOOL)a3;
- (void)setHasWifiEstimatedBW:(BOOL)a3;
- (void)setHasWifiPhyMode:(BOOL)a3;
- (void)setHasWifiQbssLoad:(BOOL)a3;
- (void)setHasWifiRssi:(BOOL)a3;
- (void)setHasWifiRxPhyRate:(BOOL)a3;
- (void)setHasWifiRxRetry:(BOOL)a3;
- (void)setHasWifiSNR:(BOOL)a3;
- (void)setHasWifiStationCount:(BOOL)a3;
- (void)setHasWifiTxPER:(BOOL)a3;
- (void)setHasWifiTxPhyRate:(BOOL)a3;
- (void)setHasWrmAlertedMode:(BOOL)a3;
- (void)setHasWrmAudioErasure:(BOOL)a3;
- (void)setHasWrmIsPCDetected:(BOOL)a3;
- (void)setHasWrmIsStallDetected:(BOOL)a3;
- (void)setHasWrmVideoErasure:(BOOL)a3;
- (void)setIsCallFailed:(BOOL)a3;
- (void)setIsEmergency:(BOOL)a3;
- (void)setLatency:(unsigned int)a3;
- (void)setLocation:(id)a3;
- (void)setLowInternetDL:(BOOL)a3;
- (void)setLowInternetUL:(BOOL)a3;
- (void)setMessageTrigger:(int)a3;
- (void)setMessageType:(int)a3;
- (void)setMotionState:(int)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setUlMedThroughput:(float)a3;
- (void)setUlPeakThroughput:(float)a3;
- (void)setWifiBand:(unsigned int)a3;
- (void)setWifiCaptiveNetworks:(BOOL)a3;
- (void)setWifiCca:(unsigned int)a3;
- (void)setWifiChannel:(unsigned int)a3;
- (void)setWifiChannelWidth:(unsigned int)a3;
- (void)setWifiEstimatedBW:(unsigned int)a3;
- (void)setWifiPhyMode:(unsigned int)a3;
- (void)setWifiQbssLoad:(unsigned int)a3;
- (void)setWifiRssi:(int64_t)a3;
- (void)setWifiRxPhyRate:(unsigned int)a3;
- (void)setWifiRxRetry:(unsigned int)a3;
- (void)setWifiSNR:(int64_t)a3;
- (void)setWifiStationCount:(unsigned int)a3;
- (void)setWifiTxPER:(unsigned int)a3;
- (void)setWifiTxPhyRate:(unsigned int)a3;
- (void)setWrmAlertedMode:(BOOL)a3;
- (void)setWrmAudioErasure:(unsigned int)a3;
- (void)setWrmIsPCDetected:(BOOL)a3;
- (void)setWrmIsStallDetected:(BOOL)a3;
- (void)setWrmVideoErasure:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCellConnectionQuality

- (GEOCellConnectionQuality)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCellConnectionQuality;
  v2 = [(GEOCellConnectionQuality *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCellConnectionQuality)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCellConnectionQuality;
  v3 = [(GEOCellConnectionQuality *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)motionState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000000) != 0) {
    return self->_motionState;
  }
  else {
    return 0;
  }
}

- (void)setMotionState:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMotionState
{
  return (*(void *)&self->_flags >> 38) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE440[a3];
  }

  return v3;
}

- (int)StringAsMotionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MOTION_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATIONARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RUNNING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VEHICULAR"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)messageType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x2000000000) != 0) {
    return self->_messageType;
  }
  else {
    return 0;
  }
}

- (void)setMessageType:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMessageType
{
  return (*(void *)&self->_flags >> 37) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE468[a3];
  }

  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MESSAGE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FT_AUDIO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FT_VIDEO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VOLTE_CALL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WIFI_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RRC_CONN"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)connectionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x8000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasConnectionType
{
  return (*(void *)&self->_flags >> 27) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE498[a3];
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONNECTION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WIFI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CELL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WIFI_AND_CELL"])
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

- (int)messageTrigger
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000000000) != 0) {
    return self->_messageTrigger;
  }
  else {
    return 0;
  }
}

- (void)setMessageTrigger:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_messageTrigger = a3;
}

- (void)setHasMessageTrigger:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasMessageTrigger
{
  return (*(void *)&self->_flags >> 36) & 1;
}

- (id)messageTriggerAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE4C0[a3];
  }

  return v3;
}

- (int)StringAsMessageTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MESSAGE_TRIGGER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FT_CALL_END"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FT_HO_CELL2WIFI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FT_HO_WIFI2CELL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VOLTE_CALL_END"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WIFI_CALL_END"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RRC_CONN_END"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)environment
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40000000) != 0) {
    return self->_environment;
  }
  else {
    return 0;
  }
}

- (void)setEnvironment:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_environment = a3;
}

- (void)setHasEnvironment:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x40000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasEnvironment
{
  return (*(void *)&self->_flags >> 30) & 1;
}

- (id)environmentAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53DE4F8[a3];
  }

  return v3;
}

- (int)StringAsEnvironment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ENVIRONMENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RURAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBURBAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URBAN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"URBAN_CANYON"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 4uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasTimeOfDay
{
  return (*(void *)&self->_flags >> 2) & 1;
}

- (unsigned)connectionDuration
{
  return self->_connectionDuration;
}

- (void)setConnectionDuration:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x4000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasConnectionDuration
{
  return (*(void *)&self->_flags >> 26) & 1;
}

- (BOOL)isEmergency
{
  return self->_isEmergency;
}

- (void)setIsEmergency:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_isEmergency = a3;
}

- (void)setHasIsEmergency:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x1000000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xEFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasIsEmergency
{
  return (*(void *)&self->_flags >> 60) & 1;
}

- (unint64_t)bytesDlTotal
{
  return self->_bytesDlTotal;
}

- (void)setBytesDlTotal:(unint64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 1uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_bytesDlTotal = a3;
}

- (void)setHasBytesDlTotal:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_WORD *)&self->_flags + 4) = v3;
}

- (BOOL)hasBytesDlTotal
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)bytesUlTotal
{
  return self->_bytesUlTotal;
}

- (void)setBytesUlTotal:(unint64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 2uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_bytesUlTotal = a3;
}

- (void)setHasBytesUlTotal:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasBytesUlTotal
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (void)_readCallID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCallID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCallID
{
  return self->_callID != 0;
}

- (NSString)callID
{
  -[GEOCellConnectionQuality _readCallID]((uint64_t)self);
  callID = self->_callID;

  return callID;
}

- (void)setCallID:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2008u;
  objc_storeStrong((id *)&self->_callID, a3);
}

- (BOOL)isCallFailed
{
  return self->_isCallFailed;
}

- (void)setIsCallFailed:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x800000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_isCallFailed = a3;
}

- (void)setHasIsCallFailed:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x800000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xF7FFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasIsCallFailed
{
  return (*(void *)&self->_flags >> 59) & 1;
}

- (float)dlPeakThroughput
{
  return self->_dlPeakThroughput;
}

- (void)setDlPeakThroughput:(float)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_dlPeakThroughput = a3;
}

- (void)setHasDlPeakThroughput:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasDlPeakThroughput
{
  return (*(void *)&self->_flags >> 29) & 1;
}

- (float)ulPeakThroughput
{
  return self->_ulPeakThroughput;
}

- (void)setUlPeakThroughput:(float)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ulPeakThroughput = a3;
}

- (void)setHasUlPeakThroughput:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasUlPeakThroughput
{
  return (*(void *)&self->_flags >> 40) & 1;
}

- (float)dlMedThroughput
{
  return self->_dlMedThroughput;
}

- (void)setDlMedThroughput:(float)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x10000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_dlMedThroughput = a3;
}

- (void)setHasDlMedThroughput:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x10000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasDlMedThroughput
{
  return (*(void *)&self->_flags >> 28) & 1;
}

- (float)ulMedThroughput
{
  return self->_ulMedThroughput;
}

- (void)setUlMedThroughput:(float)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ulMedThroughput = a3;
}

- (void)setHasUlMedThroughput:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasUlMedThroughput
{
  return (*(void *)&self->_flags >> 39) & 1;
}

- (BOOL)lowInternetUL
{
  return self->_lowInternetUL;
}

- (void)setLowInternetUL:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_lowInternetUL = a3;
}

- (void)setHasLowInternetUL:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x4000000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xBFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLowInternetUL
{
  return (*(void *)&self->_flags >> 62) & 1;
}

- (BOOL)lowInternetDL
{
  return self->_lowInternetDL;
}

- (void)setLowInternetDL:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_lowInternetDL = a3;
}

- (void)setHasLowInternetDL:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x2000000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xDFFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLowInternetDL
{
  return (*(void *)&self->_flags >> 61) & 1;
}

- (unsigned)latency
{
  return self->_latency;
}

- (void)setLatency:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x800000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasLatency
{
  return (*(void *)&self->_flags >> 35) & 1;
}

- (int64_t)wifiRssi
{
  return self->_wifiRssi;
}

- (void)setWifiRssi:(int64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 8uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRssi
{
  return (*(void *)&self->_flags >> 3) & 1;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x8000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x8000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiTxPER
{
  return (*(void *)&self->_flags >> 51) & 1;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (void)setWifiSNR:(int64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x10uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiSNR
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (BOOL)wifiCaptiveNetworks
{
  return self->_wifiCaptiveNetworks;
}

- (void)setWifiCaptiveNetworks:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x8000000000000000;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiCaptiveNetworks = a3;
}

- (void)setHasWifiCaptiveNetworks:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  unint64_t v4 = 0x8000000000000000;
  if (!a3) {
    unint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = v4 & 0x8000000000000000 | *(void *)&self->_flags & 0x7FFFFFFFFFFFFFFFLL;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiCaptiveNetworks
{
  return *(void *)&self->_flags >> 63;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x2000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRxRetry
{
  return (*(void *)&self->_flags >> 49) & 1;
}

- (unsigned)wifiEstimatedBW
{
  return self->_wifiEstimatedBW;
}

- (void)setWifiEstimatedBW:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiEstimatedBW = a3;
}

- (void)setHasWifiEstimatedBW:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x200000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiEstimatedBW
{
  return (*(void *)&self->_flags >> 45) & 1;
}

- (unsigned)wifiTxPhyRate
{
  return self->_wifiTxPhyRate;
}

- (void)setWifiTxPhyRate:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x10000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiTxPhyRate = a3;
}

- (void)setHasWifiTxPhyRate:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x10000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFEFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiTxPhyRate
{
  return (*(void *)&self->_flags >> 52) & 1;
}

- (unsigned)wifiRxPhyRate
{
  return self->_wifiRxPhyRate;
}

- (void)setWifiRxPhyRate:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x1000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiRxPhyRate = a3;
}

- (void)setHasWifiRxPhyRate:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x1000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiRxPhyRate
{
  return HIWORD(*(void *)&self->_flags) & 1;
}

- (unsigned)wifiQbssLoad
{
  return self->_wifiQbssLoad;
}

- (void)setWifiQbssLoad:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiQbssLoad = a3;
}

- (void)setHasWifiQbssLoad:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x800000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiQbssLoad
{
  return (*(void *)&self->_flags >> 47) & 1;
}

- (unsigned)wifiCca
{
  return self->_wifiCca;
}

- (void)setWifiCca:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiCca = a3;
}

- (void)setHasWifiCca:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x40000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiCca
{
  return (*(void *)&self->_flags >> 42) & 1;
}

- (unsigned)wifiStationCount
{
  return self->_wifiStationCount;
}

- (void)setWifiStationCount:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x4000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiStationCount = a3;
}

- (void)setHasWifiStationCount:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x4000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiStationCount
{
  return (*(void *)&self->_flags >> 50) & 1;
}

- (unsigned)wifiBand
{
  return self->_wifiBand;
}

- (void)setWifiBand:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiBand = a3;
}

- (void)setHasWifiBand:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x20000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiBand
{
  return (*(void *)&self->_flags >> 41) & 1;
}

- (unsigned)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiChannel = a3;
}

- (void)setHasWifiChannel:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiChannel
{
  return (*(void *)&self->_flags >> 44) & 1;
}

- (unsigned)wifiChannelWidth
{
  return self->_wifiChannelWidth;
}

- (void)setWifiChannelWidth:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiChannelWidth = a3;
}

- (void)setHasWifiChannelWidth:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x80000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiChannelWidth
{
  return (*(void *)&self->_flags >> 43) & 1;
}

- (unsigned)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wifiPhyMode = a3;
}

- (void)setHasWifiPhyMode:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x400000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWifiPhyMode
{
  return (*(void *)&self->_flags >> 46) & 1;
}

- (void)_readCellGCI
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellGCI_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellGCI
{
  return self->_cellGCI != 0;
}

- (NSString)cellGCI
{
  -[GEOCellConnectionQuality _readCellGCI]((uint64_t)self);
  cellGCI = self->_cellGCI;

  return cellGCI;
}

- (void)setCellGCI:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2010u;
  objc_storeStrong((id *)&self->_cellGCI, a3);
}

- (void)_readCellHomePLMN
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellHomePLMN_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellHomePLMN
{
  return self->_cellHomePLMN != 0;
}

- (NSString)cellHomePLMN
{
  -[GEOCellConnectionQuality _readCellHomePLMN]((uint64_t)self);
  cellHomePLMN = self->_cellHomePLMN;

  return cellHomePLMN;
}

- (void)setCellHomePLMN:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2040u;
  objc_storeStrong((id *)&self->_cellHomePLMN, a3);
}

- (void)_readCellHomePLMN2
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellHomePLMN2_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellHomePLMN2
{
  return self->_cellHomePLMN2 != 0;
}

- (NSString)cellHomePLMN2
{
  -[GEOCellConnectionQuality _readCellHomePLMN2]((uint64_t)self);
  cellHomePLMN2 = self->_cellHomePLMN2;

  return cellHomePLMN2;
}

- (void)setCellHomePLMN2:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2020u;
  objc_storeStrong((id *)&self->_cellHomePLMN2, a3);
}

- (void)_readCellServiceProvider
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellServiceProvider_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellServiceProvider
{
  return self->_cellServiceProvider != 0;
}

- (NSString)cellServiceProvider
{
  -[GEOCellConnectionQuality _readCellServiceProvider]((uint64_t)self);
  cellServiceProvider = self->_cellServiceProvider;

  return cellServiceProvider;
}

- (void)setCellServiceProvider:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2200u;
  objc_storeStrong((id *)&self->_cellServiceProvider, a3);
}

- (void)_readCellServiceProvider2
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellServiceProvider2_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellServiceProvider2
{
  return self->_cellServiceProvider2 != 0;
}

- (NSString)cellServiceProvider2
{
  -[GEOCellConnectionQuality _readCellServiceProvider2]((uint64_t)self);
  cellServiceProvider2 = self->_cellServiceProvider2;

  return cellServiceProvider2;
}

- (void)setCellServiceProvider2:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2100u;
  objc_storeStrong((id *)&self->_cellServiceProvider2, a3);
}

- (unsigned)cellVoiceLQM
{
  return self->_cellVoiceLQM;
}

- (void)setCellVoiceLQM:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x2000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellVoiceLQM = a3;
}

- (void)setHasCellVoiceLQM:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x2000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellVoiceLQM
{
  return (*(void *)&self->_flags >> 25) & 1;
}

- (BOOL)cellNpnStatus
{
  return self->_cellNpnStatus;
}

- (void)setCellNpnStatus:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x400000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNpnStatus = a3;
}

- (void)setHasCellNpnStatus:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x400000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNpnStatus
{
  return (*(void *)&self->_flags >> 58) & 1;
}

- (unsigned)cellNpn
{
  return self->_cellNpn;
}

- (void)setCellNpn:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x8000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNpn = a3;
}

- (void)setHasCellNpn:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNpn
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (unsigned)cellArfcn
{
  return self->_cellArfcn;
}

- (void)setCellArfcn:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x20uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellArfcn = a3;
}

- (void)setHasCellArfcn:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellArfcn
{
  return (*(void *)&self->_flags >> 5) & 1;
}

- (unsigned)cellBand
{
  return self->_cellBand;
}

- (void)setCellBand:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x40uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellBand = a3;
}

- (void)setHasCellBand:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellBand
{
  return (*(void *)&self->_flags >> 6) & 1;
}

- (void)_readCellRatType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCellRatType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCellRatType
{
  return self->_cellRatType != 0;
}

- (NSString)cellRatType
{
  -[GEOCellConnectionQuality _readCellRatType]((uint64_t)self);
  cellRatType = self->_cellRatType;

  return cellRatType;
}

- (void)setCellRatType:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2080u;
  objc_storeStrong((id *)&self->_cellRatType, a3);
}

- (int)cellLteRSRP
{
  return self->_cellLteRSRP;
}

- (void)setCellLteRSRP:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x400uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteRSRP = a3;
}

- (void)setHasCellLteRSRP:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteRSRP
{
  return (*(void *)&self->_flags >> 10) & 1;
}

- (int)cellLteSNR
{
  return self->_cellLteSNR;
}

- (void)setCellLteSNR:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x1000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteSNR = a3;
}

- (void)setHasCellLteSNR:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteSNR
{
  return (*(void *)&self->_flags >> 12) & 1;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (void)setCellLteRSRQ:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x800uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellLteRSRQ = a3;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellLteRSRQ
{
  return (*(void *)&self->_flags >> 11) & 1;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (void)setCellNrRSRP:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x10000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrRSRP = a3;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrRSRP
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (void)setCellNrRSRQ:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x20000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrRSRQ = a3;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrRSRQ
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (void)setCellNrSNR:(int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x40000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNrSNR = a3;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x40000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNrSNR
{
  return (*(void *)&self->_flags >> 18) & 1;
}

- (unsigned)cellDataLQM
{
  return self->_cellDataLQM;
}

- (void)setCellDataLQM:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x100uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellDataLQM = a3;
}

- (void)setHasCellDataLQM:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellDataLQM
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (unsigned)cellRrcState
{
  return self->_cellRrcState;
}

- (void)setCellRrcState:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x400000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellRrcState = a3;
}

- (void)setHasCellRrcState:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x400000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellRrcState
{
  return (*(void *)&self->_flags >> 22) & 1;
}

- (unsigned)cellNsaFR1
{
  return self->_cellNsaFR1;
}

- (void)setCellNsaFR1:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x80000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNsaFR1 = a3;
}

- (void)setHasCellNsaFR1:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x80000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNsaFR1
{
  return (*(void *)&self->_flags >> 19) & 1;
}

- (unsigned)cellNsaFR2
{
  return self->_cellNsaFR2;
}

- (void)setCellNsaFR2:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x100000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellNsaFR2 = a3;
}

- (void)setHasCellNsaFR2:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x100000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellNsaFR2
{
  return (*(void *)&self->_flags >> 20) & 1;
}

- (unsigned)cellTotalDlBW
{
  return self->_cellTotalDlBW;
}

- (void)setCellTotalDlBW:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x800000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellTotalDlBW = a3;
}

- (void)setHasCellTotalDlBW:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellTotalDlBW
{
  return (*(void *)&self->_flags >> 23) & 1;
}

- (unsigned)cellTotalUlBW
{
  return self->_cellTotalUlBW;
}

- (void)setCellTotalUlBW:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellTotalUlBW = a3;
}

- (void)setHasCellTotalUlBW:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x1000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellTotalUlBW
{
  return (*(void *)&self->_flags >> 24) & 1;
}

- (unsigned)cellBssLoad
{
  return self->_cellBssLoad;
}

- (void)setCellBssLoad:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x80uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellBssLoad = a3;
}

- (void)setHasCellBssLoad:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellBssLoad
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (unsigned)cellMaxDlCaNumConf
{
  return self->_cellMaxDlCaNumConf;
}

- (void)setCellMaxDlCaNumConf:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x2000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellMaxDlCaNumConf = a3;
}

- (void)setHasCellMaxDlCaNumConf:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellMaxDlCaNumConf
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (unsigned)cellMaxUlCaNumConf
{
  return self->_cellMaxUlCaNumConf;
}

- (void)setCellMaxUlCaNumConf:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x4000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellMaxUlCaNumConf = a3;
}

- (void)setHasCellMaxUlCaNumConf:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellMaxUlCaNumConf
{
  return (*(void *)&self->_flags >> 14) & 1;
}

- (unsigned)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (void)setCellEstimatedBW:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x200uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellEstimatedBW = a3;
}

- (void)setHasCellEstimatedBW:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellEstimatedBW
{
  return (*(void *)&self->_flags >> 9) & 1;
}

- (unsigned)cellPMax
{
  return self->_cellPMax;
}

- (void)setCellPMax:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x200000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellPMax = a3;
}

- (void)setHasCellPMax:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x200000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellPMax
{
  return (*(void *)&self->_flags >> 21) & 1;
}

- (BOOL)cellIsRoaming
{
  return self->_cellIsRoaming;
}

- (void)setCellIsRoaming:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x200000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsRoaming = a3;
}

- (void)setHasCellIsRoaming:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x200000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFDFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsRoaming
{
  return (*(void *)&self->_flags >> 57) & 1;
}

- (BOOL)cellIsNoService
{
  return self->_cellIsNoService;
}

- (void)setCellIsNoService:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x100000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsNoService = a3;
}

- (void)setHasCellIsNoService:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x100000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFEFFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsNoService
{
  return HIBYTE(*(void *)&self->_flags) & 1;
}

- (BOOL)cellIsLimitedService
{
  return self->_cellIsLimitedService;
}

- (void)setCellIsLimitedService:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_cellIsLimitedService = a3;
}

- (void)setHasCellIsLimitedService:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x80000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFF7FFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasCellIsLimitedService
{
  return (*(void *)&self->_flags >> 55) & 1;
}

- (void)_readFtIRATRecommendation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFtIRATRecommendation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasFtIRATRecommendation
{
  return self->_ftIRATRecommendation != 0;
}

- (NSString)ftIRATRecommendation
{
  -[GEOCellConnectionQuality _readFtIRATRecommendation]((uint64_t)self);
  ftIRATRecommendation = self->_ftIRATRecommendation;

  return ftIRATRecommendation;
}

- (void)setFtIRATRecommendation:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2800u;
  objc_storeStrong((id *)&self->_ftIRATRecommendation, a3);
}

- (void)_readFtIRATRecommendationReason
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFtIRATRecommendationReason_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasFtIRATRecommendationReason
{
  return self->_ftIRATRecommendationReason != 0;
}

- (NSString)ftIRATRecommendationReason
{
  -[GEOCellConnectionQuality _readFtIRATRecommendationReason]((uint64_t)self);
  ftIRATRecommendationReason = self->_ftIRATRecommendationReason;

  return ftIRATRecommendationReason;
}

- (void)setFtIRATRecommendationReason:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2400u;
  objc_storeStrong((id *)&self->_ftIRATRecommendationReason, a3);
}

- (unsigned)ftFacetimePacketLoss
{
  return self->_ftFacetimePacketLoss;
}

- (void)setFtFacetimePacketLoss:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimePacketLoss = a3;
}

- (void)setHasFtFacetimePacketLoss:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimePacketLoss
{
  return (*(void *)&self->_flags >> 33) & 1;
}

- (unsigned)ftFacetimeAction
{
  return self->_ftFacetimeAction;
}

- (void)setFtFacetimeAction:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimeAction = a3;
}

- (void)setHasFtFacetimeAction:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimeAction
{
  return HIDWORD(*(void *)&self->_flags) & 1;
}

- (unsigned)ftFacetimeTimeDelay
{
  return self->_ftFacetimeTimeDelay;
}

- (void)setFtFacetimeTimeDelay:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftFacetimeTimeDelay = a3;
}

- (void)setHasFtFacetimeTimeDelay:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtFacetimeTimeDelay
{
  return (*(void *)&self->_flags >> 34) & 1;
}

- (unsigned)ftCounter
{
  return self->_ftCounter;
}

- (void)setFtCounter:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_ftCounter = a3;
}

- (void)setHasFtCounter:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x80000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasFtCounter
{
  return (*(void *)&self->_flags >> 31) & 1;
}

- (BOOL)wrmAlertedMode
{
  return self->_wrmAlertedMode;
}

- (void)setWrmAlertedMode:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2001u;
  self->_wrmAlertedMode = a3;
}

- (void)setHasWrmAlertedMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8193;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xDFFE | v3;
}

- (BOOL)hasWrmAlertedMode
{
  return *((_WORD *)&self->_flags + 4) & 1;
}

- (BOOL)wrmIsStallDetected
{
  return self->_wrmIsStallDetected;
}

- (void)setWrmIsStallDetected:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2004u;
  self->_wrmIsStallDetected = a3;
}

- (void)setHasWrmIsStallDetected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xFFFB | v3;
}

- (BOOL)hasWrmIsStallDetected
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)wrmIsPCDetected
{
  return self->_wrmIsPCDetected;
}

- (void)setWrmIsPCDetected:(BOOL)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x2002u;
  self->_wrmIsPCDetected = a3;
}

- (void)setHasWrmIsPCDetected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *((_WORD *)&self->_flags + 4) = *((_WORD *)&self->_flags + 4) & 0xFFFD | v3;
}

- (BOOL)hasWrmIsPCDetected
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 4) >> 1) & 1;
}

- (unsigned)wrmVideoErasure
{
  return self->_wrmVideoErasure;
}

- (void)setWrmVideoErasure:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x40000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wrmVideoErasure = a3;
}

- (void)setHasWrmVideoErasure:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x40000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFBFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWrmVideoErasure
{
  return (*(void *)&self->_flags >> 54) & 1;
}

- (unsigned)wrmAudioErasure
{
  return self->_wrmAudioErasure;
}

- (void)setWrmAudioErasure:(unsigned int)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4) | 0x2000;
  *(void *)&self->_flags |= 0x20000000000000uLL;
  *((_WORD *)&self->_flags + 4) = v3;
  self->_wrmAudioErasure = a3;
}

- (void)setHasWrmAudioErasure:(BOOL)a3
{
  __int16 v3 = *((_WORD *)&self->_flags + 4);
  uint64_t v4 = 0x20000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 4) = v3 | 0x2000;
}

- (BOOL)hasWrmAudioErasure
{
  return (*(void *)&self->_flags >> 53) & 1;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 368) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCellConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOCellConnectionQuality _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *((_WORD *)&self->_flags + 4) |= 0x3000u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCellConnectionQuality;
  uint64_t v4 = [(GEOCellConnectionQuality *)&v8 description];
  v5 = [(GEOCellConnectionQuality *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCellConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v97 = 0;
    goto LABEL_181;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 0x4000000000) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 280);
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 280));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = off_1E53DE440[v6];
    }
    [v4 setObject:v7 forKey:@"motionState"];

    uint64_t v5 = *(void *)(a1 + 360);
    if ((v5 & 0x2000000000) == 0)
    {
LABEL_4:
      if ((v5 & 0x8000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x2000000000) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v8 = *(int *)(a1 + 276);
  if (v8 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 276));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53DE468[v8];
  }
  [v4 setObject:v9 forKey:@"messageType"];

  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v10 = *(int *)(a1 + 236);
  if (v10 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 236));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E53DE498[v10];
  }
  [v4 setObject:v11 forKey:@"connectionType"];

  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v12 = *(int *)(a1 + 272);
  if (v12 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 272));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E53DE4C0[v12];
  }
  [v4 setObject:v13 forKey:@"messageTrigger"];

  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 0x40000000) != 0)
  {
LABEL_24:
    uint64_t v14 = *(int *)(a1 + 248);
    if (v14 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 248));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E53DE4F8[v14];
    }
    [v4 setObject:v15 forKey:@"environment"];

    uint64_t v5 = *(void *)(a1 + 360);
  }
LABEL_28:
  if ((v5 & 4) != 0)
  {
    v40 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
    [v4 setObject:v40 forKey:@"timeOfDay"];

    uint64_t v5 = *(void *)(a1 + 360);
    if ((v5 & 0x4000000) == 0)
    {
LABEL_30:
      if ((v5 & 0x1000000000000000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_119;
    }
  }
  else if ((v5 & 0x4000000) == 0)
  {
    goto LABEL_30;
  }
  v41 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 232)];
  [v4 setObject:v41 forKey:@"connectionDuration"];

  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v5 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_120;
  }
LABEL_119:
  v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 353)];
  [v4 setObject:v42 forKey:@"isEmergency"];

  uint64_t v5 = *(void *)(a1 + 360);
  if ((v5 & 1) == 0)
  {
LABEL_32:
    if ((v5 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_120:
  v43 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  [v4 setObject:v43 forKey:@"bytesDlTotal"];

  if ((*(void *)(a1 + 360) & 2) != 0)
  {
LABEL_33:
    v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    [v4 setObject:v16 forKey:@"bytesUlTotal"];
  }
LABEL_34:
  v17 = [(id)a1 callID];
  if (v17) {
    [v4 setObject:v17 forKey:@"callID"];
  }

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x800000000000000) != 0)
  {
    v44 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 352)];
    [v4 setObject:v44 forKey:@"isCallFailed"];

    uint64_t v19 = *(void *)(a1 + 360);
    if ((v19 & 0x20000000) == 0)
    {
LABEL_38:
      if ((v19 & 0x10000000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_124;
    }
  }
  else if ((v19 & 0x20000000) == 0)
  {
    goto LABEL_38;
  }
  LODWORD(v18) = *(_DWORD *)(a1 + 244);
  v45 = [NSNumber numberWithFloat:v18];
  [v4 setObject:v45 forKey:@"dlPeakThroughput"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x10000000000) == 0)
  {
LABEL_39:
    if ((v19 & 0x10000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_125;
  }
LABEL_124:
  LODWORD(v18) = *(_DWORD *)(a1 + 288);
  v46 = [NSNumber numberWithFloat:v18];
  [v4 setObject:v46 forKey:@"ulPeakThroughput"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x10000000) == 0)
  {
LABEL_40:
    if ((v19 & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_126;
  }
LABEL_125:
  LODWORD(v18) = *(_DWORD *)(a1 + 240);
  v47 = [NSNumber numberWithFloat:v18];
  [v4 setObject:v47 forKey:@"dlMedThroughput"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v19 & 0x4000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_127;
  }
LABEL_126:
  LODWORD(v18) = *(_DWORD *)(a1 + 284);
  v48 = [NSNumber numberWithFloat:v18];
  [v4 setObject:v48 forKey:@"ulMedThroughput"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x4000000000000000) == 0)
  {
LABEL_42:
    if ((v19 & 0x2000000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_128;
  }
LABEL_127:
  v49 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 355)];
  [v4 setObject:v49 forKey:@"lowInternetUL"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x2000000000000000) == 0)
  {
LABEL_43:
    if ((v19 & 0x800000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_129;
  }
LABEL_128:
  v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 354)];
  [v4 setObject:v50 forKey:@"lowInternetDL"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x800000000) == 0)
  {
LABEL_44:
    if ((v19 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_130;
  }
LABEL_129:
  v51 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 268)];
  [v4 setObject:v51 forKey:@"latency"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 8) == 0)
  {
LABEL_45:
    if ((v19 & 0x8000000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_131;
  }
LABEL_130:
  v52 = [NSNumber numberWithLongLong:*(void *)(a1 + 120)];
  [v4 setObject:v52 forKey:@"wifiRssi"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x8000000000000) == 0)
  {
LABEL_46:
    if ((v19 & 0x10) == 0) {
      goto LABEL_47;
    }
    goto LABEL_132;
  }
LABEL_131:
  v53 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 332)];
  [v4 setObject:v53 forKey:@"wifiTxPER"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x10) == 0)
  {
LABEL_47:
    if ((v19 & 0x8000000000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_133;
  }
LABEL_132:
  v54 = [NSNumber numberWithLongLong:*(void *)(a1 + 128)];
  [v4 setObject:v54 forKey:@"wifiSNR"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x8000000000000000) == 0)
  {
LABEL_48:
    if ((v19 & 0x2000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_134;
  }
LABEL_133:
  v55 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 356)];
  [v4 setObject:v55 forKey:@"wifiCaptiveNetworks"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x2000000000000) == 0)
  {
LABEL_49:
    if ((v19 & 0x200000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_135;
  }
LABEL_134:
  v56 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 324)];
  [v4 setObject:v56 forKey:@"wifiRxRetry"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x200000000000) == 0)
  {
LABEL_50:
    if ((v19 & 0x10000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_136;
  }
LABEL_135:
  v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 308)];
  [v4 setObject:v57 forKey:@"wifiEstimatedBW"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x10000000000000) == 0)
  {
LABEL_51:
    if ((v19 & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_137;
  }
LABEL_136:
  v58 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 336)];
  [v4 setObject:v58 forKey:@"wifiTxPhyRate"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v19 & 0x800000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_138;
  }
LABEL_137:
  v59 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 320)];
  [v4 setObject:v59 forKey:@"wifiRxPhyRate"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x800000000000) == 0)
  {
LABEL_53:
    if ((v19 & 0x40000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_139;
  }
LABEL_138:
  v60 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 316)];
  [v4 setObject:v60 forKey:@"wifiQbssLoad"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x40000000000) == 0)
  {
LABEL_54:
    if ((v19 & 0x4000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_140;
  }
LABEL_139:
  v61 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 296)];
  [v4 setObject:v61 forKey:@"wifiCca"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x4000000000000) == 0)
  {
LABEL_55:
    if ((v19 & 0x20000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_141;
  }
LABEL_140:
  v62 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 328)];
  [v4 setObject:v62 forKey:@"wifiStationCount"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x20000000000) == 0)
  {
LABEL_56:
    if ((v19 & 0x100000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_142;
  }
LABEL_141:
  v63 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 292)];
  [v4 setObject:v63 forKey:@"wifiBand"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x100000000000) == 0)
  {
LABEL_57:
    if ((v19 & 0x80000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_143;
  }
LABEL_142:
  v64 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 304)];
  [v4 setObject:v64 forKey:@"wifiChannel"];

  uint64_t v19 = *(void *)(a1 + 360);
  if ((v19 & 0x80000000000) == 0)
  {
LABEL_58:
    if ((v19 & 0x400000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_143:
  v65 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 300)];
  [v4 setObject:v65 forKey:@"wifiChannelWidth"];

  if ((*(void *)(a1 + 360) & 0x400000000000) != 0)
  {
LABEL_59:
    v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 312)];
    [v4 setObject:v20 forKey:@"wifiPhyMode"];
  }
LABEL_60:
  v21 = [(id)a1 cellGCI];
  if (v21) {
    [v4 setObject:v21 forKey:@"cellGCI"];
  }

  v22 = [(id)a1 cellHomePLMN];
  if (v22) {
    [v4 setObject:v22 forKey:@"cellHomePLMN"];
  }

  v23 = [(id)a1 cellHomePLMN2];
  if (v23) {
    [v4 setObject:v23 forKey:@"cellHomePLMN2"];
  }

  v24 = [(id)a1 cellServiceProvider];
  if (v24) {
    [v4 setObject:v24 forKey:@"cellServiceProvider"];
  }

  v25 = [(id)a1 cellServiceProvider2];
  if (v25) {
    [v4 setObject:v25 forKey:@"cellServiceProvider2"];
  }

  uint64_t v26 = *(void *)(a1 + 360);
  if ((v26 & 0x2000000) != 0)
  {
    v66 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 228)];
    [v4 setObject:v66 forKey:@"cellVoiceLQM"];

    uint64_t v26 = *(void *)(a1 + 360);
    if ((v26 & 0x400000000000000) == 0)
    {
LABEL_72:
      if ((v26 & 0x8000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_147;
    }
  }
  else if ((v26 & 0x400000000000000) == 0)
  {
    goto LABEL_72;
  }
  v67 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 351)];
  [v4 setObject:v67 forKey:@"cellNpnStatus"];

  uint64_t v26 = *(void *)(a1 + 360);
  if ((v26 & 0x8000) == 0)
  {
LABEL_73:
    if ((v26 & 0x20) == 0) {
      goto LABEL_74;
    }
    goto LABEL_148;
  }
LABEL_147:
  v68 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 188)];
  [v4 setObject:v68 forKey:@"cellNpn"];

  uint64_t v26 = *(void *)(a1 + 360);
  if ((v26 & 0x20) == 0)
  {
LABEL_74:
    if ((v26 & 0x40) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_148:
  v69 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
  [v4 setObject:v69 forKey:@"cellArfcn"];

  if ((*(void *)(a1 + 360) & 0x40) != 0)
  {
LABEL_75:
    v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 152)];
    [v4 setObject:v27 forKey:@"cellBand"];
  }
LABEL_76:
  v28 = [(id)a1 cellRatType];
  if (v28) {
    [v4 setObject:v28 forKey:@"cellRatType"];
  }

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x400) != 0)
  {
    v70 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 168)];
    [v4 setObject:v70 forKey:@"cellLteRSRP"];

    uint64_t v29 = *(void *)(a1 + 360);
    if ((v29 & 0x1000) == 0)
    {
LABEL_80:
      if ((v29 & 0x800) == 0) {
        goto LABEL_81;
      }
      goto LABEL_152;
    }
  }
  else if ((v29 & 0x1000) == 0)
  {
    goto LABEL_80;
  }
  v71 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 176)];
  [v4 setObject:v71 forKey:@"cellLteSNR"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x800) == 0)
  {
LABEL_81:
    if ((v29 & 0x10000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_153;
  }
LABEL_152:
  v72 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 172)];
  [v4 setObject:v72 forKey:@"cellLteRSRQ"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x10000) == 0)
  {
LABEL_82:
    if ((v29 & 0x20000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_154;
  }
LABEL_153:
  v73 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 192)];
  [v4 setObject:v73 forKey:@"cellNrRSRP"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x20000) == 0)
  {
LABEL_83:
    if ((v29 & 0x40000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_155;
  }
LABEL_154:
  v74 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 196)];
  [v4 setObject:v74 forKey:@"cellNrRSRQ"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x40000) == 0)
  {
LABEL_84:
    if ((v29 & 0x100) == 0) {
      goto LABEL_85;
    }
    goto LABEL_156;
  }
LABEL_155:
  v75 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 200)];
  [v4 setObject:v75 forKey:@"cellNrSNR"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x100) == 0)
  {
LABEL_85:
    if ((v29 & 0x400000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_157;
  }
LABEL_156:
  v76 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 160)];
  [v4 setObject:v76 forKey:@"cellDataLQM"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x400000) == 0)
  {
LABEL_86:
    if ((v29 & 0x80000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_158;
  }
LABEL_157:
  v77 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 216)];
  [v4 setObject:v77 forKey:@"cellRrcState"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x80000) == 0)
  {
LABEL_87:
    if ((v29 & 0x100000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_159;
  }
LABEL_158:
  v78 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 204)];
  [v4 setObject:v78 forKey:@"cellNsaFR1"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x100000) == 0)
  {
LABEL_88:
    if ((v29 & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_160;
  }
LABEL_159:
  v79 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 208)];
  [v4 setObject:v79 forKey:@"cellNsaFR2"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x800000) == 0)
  {
LABEL_89:
    if ((v29 & 0x1000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_161;
  }
LABEL_160:
  v80 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 220)];
  [v4 setObject:v80 forKey:@"cellTotalDlBW"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x1000000) == 0)
  {
LABEL_90:
    if ((v29 & 0x80) == 0) {
      goto LABEL_91;
    }
    goto LABEL_162;
  }
LABEL_161:
  v81 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 224)];
  [v4 setObject:v81 forKey:@"cellTotalUlBW"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x80) == 0)
  {
LABEL_91:
    if ((v29 & 0x2000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_163;
  }
LABEL_162:
  v82 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 156)];
  [v4 setObject:v82 forKey:@"cellBssLoad"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x2000) == 0)
  {
LABEL_92:
    if ((v29 & 0x4000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_164;
  }
LABEL_163:
  v83 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 180)];
  [v4 setObject:v83 forKey:@"cellMaxDlCaNumConf"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x4000) == 0)
  {
LABEL_93:
    if ((v29 & 0x200) == 0) {
      goto LABEL_94;
    }
    goto LABEL_165;
  }
LABEL_164:
  v84 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
  [v4 setObject:v84 forKey:@"cellMaxUlCaNumConf"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x200) == 0)
  {
LABEL_94:
    if ((v29 & 0x200000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_166;
  }
LABEL_165:
  v85 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 164)];
  [v4 setObject:v85 forKey:@"cellEstimatedBW"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x200000) == 0)
  {
LABEL_95:
    if ((v29 & 0x200000000000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_167;
  }
LABEL_166:
  v86 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 212)];
  [v4 setObject:v86 forKey:@"cellPMax"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x200000000000000) == 0)
  {
LABEL_96:
    if ((v29 & 0x100000000000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_168;
  }
LABEL_167:
  v87 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 350)];
  [v4 setObject:v87 forKey:@"cellIsRoaming"];

  uint64_t v29 = *(void *)(a1 + 360);
  if ((v29 & 0x100000000000000) == 0)
  {
LABEL_97:
    if ((v29 & 0x80000000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
LABEL_168:
  v88 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 349)];
  [v4 setObject:v88 forKey:@"cellIsNoService"];

  if ((*(void *)(a1 + 360) & 0x80000000000000) != 0)
  {
LABEL_98:
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 348)];
    [v4 setObject:v30 forKey:@"cellIsLimitedService"];
  }
LABEL_99:
  v31 = [(id)a1 ftIRATRecommendation];
  if (v31) {
    [v4 setObject:v31 forKey:@"ftIRATRecommendation"];
  }

  v32 = [(id)a1 ftIRATRecommendationReason];
  if (v32) {
    [v4 setObject:v32 forKey:@"ftIRATRecommendationReason"];
  }

  uint64_t v33 = a1 + 360;
  uint64_t v34 = *(void *)(a1 + 360);
  if ((v34 & 0x200000000) != 0)
  {
    v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 260)];
    [v4 setObject:v35 forKey:@"ftFacetimePacketLoss"];

    uint64_t v33 = a1 + 360;
    uint64_t v34 = *(void *)(a1 + 360);
  }
  __int16 v36 = *(_WORD *)(v33 + 8);
  if ((v34 & 0x100000000) != 0)
  {
    v89 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 256)];
    [v4 setObject:v89 forKey:@"ftFacetimeAction"];

    uint64_t v34 = *(void *)(a1 + 360);
    __int16 v36 = *(_WORD *)(a1 + 368);
    if ((v34 & 0x400000000) == 0)
    {
LABEL_107:
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_108;
      }
      goto LABEL_172;
    }
  }
  else if ((v34 & 0x400000000) == 0)
  {
    goto LABEL_107;
  }
  v90 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 264)];
  [v4 setObject:v90 forKey:@"ftFacetimeTimeDelay"];

  uint64_t v34 = *(void *)(a1 + 360);
  __int16 v36 = *(_WORD *)(a1 + 368);
  if ((v34 & 0x80000000) == 0)
  {
LABEL_108:
    if ((v36 & 1) == 0) {
      goto LABEL_109;
    }
    goto LABEL_173;
  }
LABEL_172:
  v91 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 252)];
  [v4 setObject:v91 forKey:@"ftCounter"];

  uint64_t v34 = *(void *)(a1 + 360);
  __int16 v36 = *(_WORD *)(a1 + 368);
  if ((v36 & 1) == 0)
  {
LABEL_109:
    if ((v36 & 4) == 0) {
      goto LABEL_110;
    }
    goto LABEL_174;
  }
LABEL_173:
  v92 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 357)];
  [v4 setObject:v92 forKey:@"wrmAlertedMode"];

  uint64_t v34 = *(void *)(a1 + 360);
  __int16 v36 = *(_WORD *)(a1 + 368);
  if ((v36 & 4) == 0)
  {
LABEL_110:
    if ((v36 & 2) == 0) {
      goto LABEL_111;
    }
    goto LABEL_175;
  }
LABEL_174:
  v93 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 359)];
  [v4 setObject:v93 forKey:@"wrmIsStallDetected"];

  uint64_t v34 = *(void *)(a1 + 360);
  if ((*(_WORD *)(a1 + 368) & 2) == 0)
  {
LABEL_111:
    if ((v34 & 0x40000000000000) == 0) {
      goto LABEL_112;
    }
LABEL_176:
    v95 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 344)];
    [v4 setObject:v95 forKey:@"wrmVideoErasure"];

    if ((*(void *)(a1 + 360) & 0x20000000000000) == 0) {
      goto LABEL_114;
    }
    goto LABEL_113;
  }
LABEL_175:
  v94 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 358)];
  [v4 setObject:v94 forKey:@"wrmIsPCDetected"];

  uint64_t v34 = *(void *)(a1 + 360);
  if ((v34 & 0x40000000000000) != 0) {
    goto LABEL_176;
  }
LABEL_112:
  if ((v34 & 0x20000000000000) != 0)
  {
LABEL_113:
    v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 340)];
    [v4 setObject:v37 forKey:@"wrmAudioErasure"];
  }
LABEL_114:
  v38 = [(id)a1 location];
  v39 = v38;
  if (v38)
  {
    if (a2) {
      [v38 jsonRepresentation];
    }
    else {
    id v96 = [v38 dictionaryRepresentation];
    }

    [v4 setObject:v96 forKey:@"location"];
  }

  id v97 = v4;
LABEL_181:

  return v97;
}

- (id)jsonRepresentation
{
  return -[GEOCellConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCellConnectionQuality)initWithDictionary:(id)a3
{
  return (GEOCellConnectionQuality *)-[GEOCellConnectionQuality _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_237;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_237;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"motionState"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN_MOTION_STATE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATIONARY"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"WALKING"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"RUNNING"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"VEHICULAR"])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setMotionState:v8];
LABEL_19:

  v9 = [v5 objectForKeyedSubscript:@"messageType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"UNKNOWN_MESSAGE_TYPE"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"FT_AUDIO"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"FT_VIDEO"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"VOLTE_CALL"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"WIFI_CALL"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"RRC_CONN"])
    {
      uint64_t v11 = 5;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v11 = [v9 intValue];
  }
  [a1 setMessageType:v11];
LABEL_37:

  uint64_t v12 = [v5 objectForKeyedSubscript:@"connectionType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"UNKNOWN_CONNECTION_TYPE"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"WIFI"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"CELL"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"WIFI_AND_CELL"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"OTHER"])
    {
      uint64_t v14 = 4;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
    uint64_t v14 = [v12 intValue];
  }
  [a1 setConnectionType:v14];
LABEL_53:

  v15 = [v5 objectForKeyedSubscript:@"messageTrigger"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    if ([v16 isEqualToString:@"UNKNOWN_MESSAGE_TRIGGER"])
    {
      uint64_t v17 = 0;
    }
    else if ([v16 isEqualToString:@"FT_CALL_END"])
    {
      uint64_t v17 = 1;
    }
    else if ([v16 isEqualToString:@"FT_HO_CELL2WIFI"])
    {
      uint64_t v17 = 2;
    }
    else if ([v16 isEqualToString:@"FT_HO_WIFI2CELL"])
    {
      uint64_t v17 = 3;
    }
    else if ([v16 isEqualToString:@"VOLTE_CALL_END"])
    {
      uint64_t v17 = 4;
    }
    else if ([v16 isEqualToString:@"WIFI_CALL_END"])
    {
      uint64_t v17 = 5;
    }
    else if ([v16 isEqualToString:@"RRC_CONN_END"])
    {
      uint64_t v17 = 6;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_73;
    }
    uint64_t v17 = [v15 intValue];
  }
  [a1 setMessageTrigger:v17];
LABEL_73:

  double v18 = [v5 objectForKeyedSubscript:@"environment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"UNKNOWN_ENVIRONMENT"])
    {
      uint64_t v20 = 0;
    }
    else if ([v19 isEqualToString:@"RURAL"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"SUBURBAN"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"URBAN"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"URBAN_CANYON"])
    {
      uint64_t v20 = 4;
    }
    else
    {
      uint64_t v20 = 0;
    }

    goto LABEL_88;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v18 intValue];
LABEL_88:
    [a1 setEnvironment:v20];
  }

  v21 = [v5 objectForKeyedSubscript:@"timeOfDay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeOfDay:", objc_msgSend(v21, "unsignedLongLongValue"));
  }

  v22 = [v5 objectForKeyedSubscript:@"connectionDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setConnectionDuration:", objc_msgSend(v22, "unsignedIntValue"));
  }

  v23 = [v5 objectForKeyedSubscript:@"isEmergency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsEmergency:", objc_msgSend(v23, "BOOLValue"));
  }

  v24 = [v5 objectForKeyedSubscript:@"bytesDlTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBytesDlTotal:", objc_msgSend(v24, "unsignedLongLongValue"));
  }

  v25 = [v5 objectForKeyedSubscript:@"bytesUlTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBytesUlTotal:", objc_msgSend(v25, "unsignedLongLongValue"));
  }

  uint64_t v26 = [v5 objectForKeyedSubscript:@"callID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[v26 copy];
    [a1 setCallID:v27];
  }
  v28 = [v5 objectForKeyedSubscript:@"isCallFailed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCallFailed:", objc_msgSend(v28, "BOOLValue"));
  }

  uint64_t v29 = [v5 objectForKeyedSubscript:@"dlPeakThroughput"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v29 floatValue];
    objc_msgSend(a1, "setDlPeakThroughput:");
  }

  v30 = [v5 objectForKeyedSubscript:@"ulPeakThroughput"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 floatValue];
    objc_msgSend(a1, "setUlPeakThroughput:");
  }

  v31 = [v5 objectForKeyedSubscript:@"dlMedThroughput"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v31 floatValue];
    objc_msgSend(a1, "setDlMedThroughput:");
  }

  v32 = [v5 objectForKeyedSubscript:@"ulMedThroughput"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v32 floatValue];
    objc_msgSend(a1, "setUlMedThroughput:");
  }

  uint64_t v33 = [v5 objectForKeyedSubscript:@"lowInternetUL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLowInternetUL:", objc_msgSend(v33, "BOOLValue"));
  }

  uint64_t v34 = [v5 objectForKeyedSubscript:@"lowInternetDL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLowInternetDL:", objc_msgSend(v34, "BOOLValue"));
  }

  v35 = [v5 objectForKeyedSubscript:@"latency"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLatency:", objc_msgSend(v35, "unsignedIntValue"));
  }

  __int16 v36 = [v5 objectForKeyedSubscript:@"wifiRssi"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiRssi:", objc_msgSend(v36, "longLongValue"));
  }

  v37 = [v5 objectForKeyedSubscript:@"wifiTxPER"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiTxPER:", objc_msgSend(v37, "unsignedIntValue"));
  }

  v38 = [v5 objectForKeyedSubscript:@"wifiSNR"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiSNR:", objc_msgSend(v38, "longLongValue"));
  }

  v39 = [v5 objectForKeyedSubscript:@"wifiCaptiveNetworks"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiCaptiveNetworks:", objc_msgSend(v39, "BOOLValue"));
  }

  v40 = [v5 objectForKeyedSubscript:@"wifiRxRetry"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiRxRetry:", objc_msgSend(v40, "unsignedIntValue"));
  }

  v41 = [v5 objectForKeyedSubscript:@"wifiEstimatedBW"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiEstimatedBW:", objc_msgSend(v41, "unsignedIntValue"));
  }

  v42 = [v5 objectForKeyedSubscript:@"wifiTxPhyRate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiTxPhyRate:", objc_msgSend(v42, "unsignedIntValue"));
  }

  v43 = [v5 objectForKeyedSubscript:@"wifiRxPhyRate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiRxPhyRate:", objc_msgSend(v43, "unsignedIntValue"));
  }

  v44 = [v5 objectForKeyedSubscript:@"wifiQbssLoad"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiQbssLoad:", objc_msgSend(v44, "unsignedIntValue"));
  }

  v45 = [v5 objectForKeyedSubscript:@"wifiCca"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiCca:", objc_msgSend(v45, "unsignedIntValue"));
  }

  v46 = [v5 objectForKeyedSubscript:@"wifiStationCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiStationCount:", objc_msgSend(v46, "unsignedIntValue"));
  }

  v47 = [v5 objectForKeyedSubscript:@"wifiBand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiBand:", objc_msgSend(v47, "unsignedIntValue"));
  }

  v48 = [v5 objectForKeyedSubscript:@"wifiChannel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiChannel:", objc_msgSend(v48, "unsignedIntValue"));
  }

  v49 = [v5 objectForKeyedSubscript:@"wifiChannelWidth"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiChannelWidth:", objc_msgSend(v49, "unsignedIntValue"));
  }

  v50 = [v5 objectForKeyedSubscript:@"wifiPhyMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWifiPhyMode:", objc_msgSend(v50, "unsignedIntValue"));
  }

  v51 = [v5 objectForKeyedSubscript:@"cellGCI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = (void *)[v51 copy];
    [a1 setCellGCI:v52];
  }
  v53 = [v5 objectForKeyedSubscript:@"cellHomePLMN"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = (void *)[v53 copy];
    [a1 setCellHomePLMN:v54];
  }
  v55 = [v5 objectForKeyedSubscript:@"cellHomePLMN2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = (void *)[v55 copy];
    [a1 setCellHomePLMN2:v56];
  }
  v57 = [v5 objectForKeyedSubscript:@"cellServiceProvider"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58 = (void *)[v57 copy];
    [a1 setCellServiceProvider:v58];
  }
  v59 = [v5 objectForKeyedSubscript:@"cellServiceProvider2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v60 = (void *)[v59 copy];
    [a1 setCellServiceProvider2:v60];
  }
  v61 = [v5 objectForKeyedSubscript:@"cellVoiceLQM"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellVoiceLQM:", objc_msgSend(v61, "unsignedIntValue"));
  }

  v62 = [v5 objectForKeyedSubscript:@"cellNpnStatus"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNpnStatus:", objc_msgSend(v62, "BOOLValue"));
  }

  v63 = [v5 objectForKeyedSubscript:@"cellNpn"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNpn:", objc_msgSend(v63, "unsignedIntValue"));
  }

  v64 = [v5 objectForKeyedSubscript:@"cellArfcn"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellArfcn:", objc_msgSend(v64, "unsignedIntValue"));
  }

  v65 = [v5 objectForKeyedSubscript:@"cellBand"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellBand:", objc_msgSend(v65, "unsignedIntValue"));
  }

  v66 = [v5 objectForKeyedSubscript:@"cellRatType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = (void *)[v66 copy];
    [a1 setCellRatType:v67];
  }
  v68 = [v5 objectForKeyedSubscript:@"cellLteRSRP"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellLteRSRP:", objc_msgSend(v68, "intValue"));
  }

  v69 = [v5 objectForKeyedSubscript:@"cellLteSNR"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellLteSNR:", objc_msgSend(v69, "intValue"));
  }

  v70 = [v5 objectForKeyedSubscript:@"cellLteRSRQ"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellLteRSRQ:", objc_msgSend(v70, "intValue"));
  }

  v71 = [v5 objectForKeyedSubscript:@"cellNrRSRP"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNrRSRP:", objc_msgSend(v71, "intValue"));
  }

  v72 = [v5 objectForKeyedSubscript:@"cellNrRSRQ"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNrRSRQ:", objc_msgSend(v72, "intValue"));
  }

  v73 = [v5 objectForKeyedSubscript:@"cellNrSNR"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNrSNR:", objc_msgSend(v73, "intValue"));
  }

  v74 = [v5 objectForKeyedSubscript:@"cellDataLQM"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellDataLQM:", objc_msgSend(v74, "unsignedIntValue"));
  }

  v75 = [v5 objectForKeyedSubscript:@"cellRrcState"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellRrcState:", objc_msgSend(v75, "unsignedIntValue"));
  }

  v76 = [v5 objectForKeyedSubscript:@"cellNsaFR1"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNsaFR1:", objc_msgSend(v76, "unsignedIntValue"));
  }

  v77 = [v5 objectForKeyedSubscript:@"cellNsaFR2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellNsaFR2:", objc_msgSend(v77, "unsignedIntValue"));
  }

  v78 = [v5 objectForKeyedSubscript:@"cellTotalDlBW"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellTotalDlBW:", objc_msgSend(v78, "unsignedIntValue"));
  }

  v79 = [v5 objectForKeyedSubscript:@"cellTotalUlBW"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellTotalUlBW:", objc_msgSend(v79, "unsignedIntValue"));
  }

  v80 = [v5 objectForKeyedSubscript:@"cellBssLoad"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellBssLoad:", objc_msgSend(v80, "unsignedIntValue"));
  }

  v81 = [v5 objectForKeyedSubscript:@"cellMaxDlCaNumConf"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellMaxDlCaNumConf:", objc_msgSend(v81, "unsignedIntValue"));
  }

  v82 = [v5 objectForKeyedSubscript:@"cellMaxUlCaNumConf"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellMaxUlCaNumConf:", objc_msgSend(v82, "unsignedIntValue"));
  }

  v83 = [v5 objectForKeyedSubscript:@"cellEstimatedBW"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellEstimatedBW:", objc_msgSend(v83, "unsignedIntValue"));
  }

  v84 = [v5 objectForKeyedSubscript:@"cellPMax"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellPMax:", objc_msgSend(v84, "unsignedIntValue"));
  }

  v85 = [v5 objectForKeyedSubscript:@"cellIsRoaming"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellIsRoaming:", objc_msgSend(v85, "BOOLValue"));
  }

  v86 = [v5 objectForKeyedSubscript:@"cellIsNoService"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellIsNoService:", objc_msgSend(v86, "BOOLValue"));
  }

  v87 = [v5 objectForKeyedSubscript:@"cellIsLimitedService"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCellIsLimitedService:", objc_msgSend(v87, "BOOLValue"));
  }

  v88 = [v5 objectForKeyedSubscript:@"ftIRATRecommendation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v89 = (void *)[v88 copy];
    [a1 setFtIRATRecommendation:v89];
  }
  v90 = [v5 objectForKeyedSubscript:@"ftIRATRecommendationReason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v91 = (void *)[v90 copy];
    [a1 setFtIRATRecommendationReason:v91];
  }
  v92 = [v5 objectForKeyedSubscript:@"ftFacetimePacketLoss"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFtFacetimePacketLoss:", objc_msgSend(v92, "unsignedIntValue"));
  }

  v93 = [v5 objectForKeyedSubscript:@"ftFacetimeAction"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFtFacetimeAction:", objc_msgSend(v93, "unsignedIntValue"));
  }

  v94 = [v5 objectForKeyedSubscript:@"ftFacetimeTimeDelay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFtFacetimeTimeDelay:", objc_msgSend(v94, "unsignedIntValue"));
  }

  v95 = [v5 objectForKeyedSubscript:@"ftCounter"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFtCounter:", objc_msgSend(v95, "unsignedIntValue"));
  }

  id v96 = [v5 objectForKeyedSubscript:@"wrmAlertedMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWrmAlertedMode:", objc_msgSend(v96, "BOOLValue"));
  }

  id v97 = [v5 objectForKeyedSubscript:@"wrmIsStallDetected"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWrmIsStallDetected:", objc_msgSend(v97, "BOOLValue"));
  }

  v98 = [v5 objectForKeyedSubscript:@"wrmIsPCDetected"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWrmIsPCDetected:", objc_msgSend(v98, "BOOLValue"));
  }

  v99 = [v5 objectForKeyedSubscript:@"wrmVideoErasure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWrmVideoErasure:", objc_msgSend(v99, "unsignedIntValue"));
  }

  v100 = [v5 objectForKeyedSubscript:@"wrmAudioErasure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWrmAudioErasure:", objc_msgSend(v100, "unsignedIntValue"));
  }

  v101 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v102 = [GEOLocation alloc];
    if (a3) {
      uint64_t v103 = [(GEOLocation *)v102 initWithJSON:v101];
    }
    else {
      uint64_t v103 = [(GEOLocation *)v102 initWithDictionary:v101];
    }
    v104 = (void *)v103;
    [a1 setLocation:v103];
  }
  a1 = a1;

LABEL_237:
  return a1;
}

- (GEOCellConnectionQuality)initWithJSON:(id)a3
{
  return (GEOCellConnectionQuality *)-[GEOCellConnectionQuality _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_17;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_17;
    }
    GEOCellConnectionQualityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocation *)self->_location readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCellConnectionQualityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCellConnectionQualityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOCellConnectionQualityIsDirty((uint64_t)self))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v17 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
    goto LABEL_163;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCellConnectionQuality *)self readAll:0];
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x2000000000) == 0)
    {
LABEL_5:
      if ((flags & 0x8000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_98;
    }
  }
  else if ((flags & 0x2000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_6:
    if ((flags & 0x1000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_7:
    if ((flags & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40000000) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 0x4000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_10:
    if ((flags & 0x1000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000000000) == 0)
  {
LABEL_11:
    if ((flags & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_12:
    if ((flags & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_104:
  PBDataWriterWriteUint64Field();
  if ((*(void *)&self->_flags & 2) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_callID) {
    PBDataWriterWriteStringField();
  }
  id v7 = &self->_flags;
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v8 = *(void *)v7;
    if ((*(void *)v7 & 0x20000000) == 0)
    {
LABEL_18:
      if ((v8 & 0x10000000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_108;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteFloatField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteFloatField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x8000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteFloatField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x4000000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteFloatField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_22:
    if ((v8 & 0x2000000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_23:
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v8 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 8) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteSint64Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10) == 0)
  {
LABEL_27:
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteSint64Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x2000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x200000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x10000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x1000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x800000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x40000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x4000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x20000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x100000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x80000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_38:
    if ((v8 & 0x400000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_127:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_flags & 0x400000000000) != 0) {
LABEL_39:
  }
    PBDataWriterWriteUint32Field();
LABEL_40:
  if (self->_cellGCI) {
    PBDataWriterWriteStringField();
  }
  if (self->_cellHomePLMN) {
    PBDataWriterWriteStringField();
  }
  if (self->_cellHomePLMN2) {
    PBDataWriterWriteStringField();
  }
  if (self->_cellServiceProvider) {
    PBDataWriterWriteStringField();
  }
  if (self->_cellServiceProvider2) {
    PBDataWriterWriteStringField();
  }
  v9 = &self->_flags;
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x2000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v10 = *(void *)v9;
    if ((*(void *)v9 & 0x400000000000000) == 0)
    {
LABEL_52:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x8000) == 0)
  {
LABEL_53:
    if ((v10 & 0x20) == 0) {
      goto LABEL_54;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint32Field();
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_54:
    if ((v10 & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_132:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_flags & 0x40) != 0) {
LABEL_55:
  }
    PBDataWriterWriteUint32Field();
LABEL_56:
  if (self->_cellRatType) {
    PBDataWriterWriteStringField();
  }
  uint64_t v11 = &self->_flags;
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400) != 0)
  {
    PBDataWriterWriteSint32Field();
    uint64_t v12 = *(void *)v11;
    if ((*(void *)v11 & 0x1000) == 0)
    {
LABEL_60:
      if ((v12 & 0x800) == 0) {
        goto LABEL_61;
      }
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteSint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800) == 0)
  {
LABEL_61:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteSint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x10000) == 0)
  {
LABEL_62:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteSint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x20000) == 0)
  {
LABEL_63:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteSint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x40000) == 0)
  {
LABEL_64:
    if ((v12 & 0x100) == 0) {
      goto LABEL_65;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteSint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100) == 0)
  {
LABEL_65:
    if ((v12 & 0x400000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400000) == 0)
  {
LABEL_66:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80000) == 0)
  {
LABEL_67:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000) == 0)
  {
LABEL_68:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800000) == 0)
  {
LABEL_69:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x1000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x80) == 0) {
      goto LABEL_71;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80) == 0)
  {
LABEL_71:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x2000) == 0)
  {
LABEL_72:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x4000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200) == 0) {
      goto LABEL_74;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200) == 0)
  {
LABEL_74:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000) == 0)
  {
LABEL_75:
    if ((v12 & 0x200000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_76:
    if ((v12 & 0x100000000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_77:
    if ((v12 & 0x80000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_152:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_flags & 0x80000000000000) != 0) {
LABEL_78:
  }
    PBDataWriterWriteBOOLField();
LABEL_79:
  if (self->_ftIRATRecommendation) {
    PBDataWriterWriteStringField();
  }
  if (self->_ftIRATRecommendationReason) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x200000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v13 = (uint64_t)self->_flags;
  }
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x100000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v13 = (uint64_t)self->_flags;
    __int16 v14 = *((_WORD *)&self->_flags + 4);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_87:
      if ((v13 & 0x80000000) == 0) {
        goto LABEL_88;
      }
      goto LABEL_156;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_87;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_88:
    if ((v14 & 1) == 0) {
      goto LABEL_89;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 1) == 0)
  {
LABEL_89:
    if ((v14 & 4) == 0) {
      goto LABEL_90;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 4) == 0)
  {
LABEL_90:
    if ((v14 & 2) == 0) {
      goto LABEL_91;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
  {
LABEL_91:
    if ((v13 & 0x40000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_92:
    if ((v13 & 0x20000000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_160:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_flags & 0x20000000000000) != 0) {
LABEL_93:
  }
    PBDataWriterWriteUint32Field();
LABEL_94:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
LABEL_163:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCellConnectionQuality _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLocation *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v15 = (id *)a3;
  [(GEOCellConnectionQuality *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 34) = self->_readerMarkPos;
  *((_DWORD *)v15 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  uint64_t v4 = v15;
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    *((_DWORD *)v15 + 70) = self->_motionState;
    v15[45] = (id)((unint64_t)v15[45] | 0x4000000000);
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x2000000000) == 0)
    {
LABEL_3:
      if ((flags & 0x8000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_99;
    }
  }
  else if ((flags & 0x2000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v15 + 69) = self->_messageType;
  v15[45] = (id)((unint64_t)v15[45] | 0x2000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_4:
    if ((flags & 0x1000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v15 + 59) = self->_connectionType;
  v15[45] = (id)((unint64_t)v15[45] | 0x8000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_5:
    if ((flags & 0x40000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v15 + 68) = self->_messageTrigger;
  v15[45] = (id)((unint64_t)v15[45] | 0x1000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x40000000) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v15 + 62) = self->_environment;
  v15[45] = (id)((unint64_t)v15[45] | 0x40000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_103;
  }
LABEL_102:
  v15[14] = self->_timeOfDay;
  v15[45] = (id)((unint64_t)v15[45] | 4);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_8:
    if ((flags & 0x1000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v15 + 58) = self->_connectionDuration;
  v15[45] = (id)((unint64_t)v15[45] | 0x4000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000000000) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((unsigned char *)v15 + 353) = self->_isEmergency;
  v15[45] = (id)((unint64_t)v15[45] | 0x1000000000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_105:
  v15[2] = self->_bytesDlTotal;
  v15[45] = (id)((unint64_t)v15[45] | 1);
  if ((*(void *)&self->_flags & 2) != 0)
  {
LABEL_11:
    v15[3] = self->_bytesUlTotal;
    v15[45] = (id)((unint64_t)v15[45] | 2);
  }
LABEL_12:
  if (self->_callID)
  {
    objc_msgSend(v15, "setCallID:");
    uint64_t v4 = v15;
  }
  id v7 = &self->_flags;
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000000) != 0)
  {
    *((unsigned char *)v4 + 352) = self->_isCallFailed;
    v4[45] = (id)((unint64_t)v4[45] | 0x800000000000000);
    uint64_t v8 = *(void *)v7;
    if ((*(void *)v7 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x10000000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 61) = LODWORD(self->_dlPeakThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x20000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v4 + 72) = LODWORD(self->_ulPeakThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v4 + 60) = LODWORD(self->_dlMedThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x4000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v4 + 71) = LODWORD(self->_ulMedThroughput);
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((unsigned char *)v4 + 355) = self->_lowInternetUL;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((unsigned char *)v4 + 354) = self->_lowInternetDL;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v8 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v4 + 67) = self->_latency;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 8) == 0)
  {
LABEL_23:
    if ((v8 & 0x8000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[15] = self->_wifiRssi;
  v4[45] = (id)((unint64_t)v4[45] | 8);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v4 + 83) = self->_wifiTxPER;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[16] = self->_wifiSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x10);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((unsigned char *)v4 + 356) = self->_wifiCaptiveNetworks;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 0x200000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 81) = self->_wifiRxRetry;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x10000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v4 + 77) = self->_wifiEstimatedBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x1000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 84) = self->_wifiTxPhyRate;
  v4[45] = (id)((unint64_t)v4[45] | 0x10000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x800000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v4 + 80) = self->_wifiRxPhyRate;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x40000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v4 + 79) = self->_wifiQbssLoad;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x4000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v4 + 74) = self->_wifiCca;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v4 + 82) = self->_wifiStationCount;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x100000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v4 + 73) = self->_wifiBand;
  v4[45] = (id)((unint64_t)v4[45] | 0x20000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x80000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v4 + 76) = self->_wifiChannel;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000000000);
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x400000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_128:
  *((_DWORD *)v4 + 75) = self->_wifiChannelWidth;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000000000);
  if ((*(void *)&self->_flags & 0x400000000000) != 0)
  {
LABEL_37:
    *((_DWORD *)v4 + 78) = self->_wifiPhyMode;
    v4[45] = (id)((unint64_t)v4[45] | 0x400000000000);
  }
LABEL_38:
  if (self->_cellGCI)
  {
    objc_msgSend(v15, "setCellGCI:");
    uint64_t v4 = v15;
  }
  if (self->_cellHomePLMN)
  {
    objc_msgSend(v15, "setCellHomePLMN:");
    uint64_t v4 = v15;
  }
  if (self->_cellHomePLMN2)
  {
    objc_msgSend(v15, "setCellHomePLMN2:");
    uint64_t v4 = v15;
  }
  if (self->_cellServiceProvider)
  {
    objc_msgSend(v15, "setCellServiceProvider:");
    uint64_t v4 = v15;
  }
  if (self->_cellServiceProvider2)
  {
    objc_msgSend(v15, "setCellServiceProvider2:");
    uint64_t v4 = v15;
  }
  v9 = &self->_flags;
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x2000000) != 0)
  {
    *((_DWORD *)v4 + 57) = self->_cellVoiceLQM;
    v4[45] = (id)((unint64_t)v4[45] | 0x2000000);
    uint64_t v10 = *(void *)v9;
    if ((*(void *)v9 & 0x400000000000000) == 0)
    {
LABEL_50:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_132;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_50;
  }
  *((unsigned char *)v4 + 351) = self->_cellNpnStatus;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000000000000);
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x8000) == 0)
  {
LABEL_51:
    if ((v10 & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v4 + 47) = self->_cellNpn;
  v4[45] = (id)((unint64_t)v4[45] | 0x8000);
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x20) == 0)
  {
LABEL_52:
    if ((v10 & 0x40) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_133:
  *((_DWORD *)v4 + 37) = self->_cellArfcn;
  v4[45] = (id)((unint64_t)v4[45] | 0x20);
  if ((*(void *)&self->_flags & 0x40) != 0)
  {
LABEL_53:
    *((_DWORD *)v4 + 38) = self->_cellBand;
    v4[45] = (id)((unint64_t)v4[45] | 0x40);
  }
LABEL_54:
  if (self->_cellRatType)
  {
    objc_msgSend(v15, "setCellRatType:");
    uint64_t v4 = v15;
  }
  uint64_t v11 = &self->_flags;
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_cellLteRSRP;
    v4[45] = (id)((unint64_t)v4[45] | 0x400);
    uint64_t v12 = *(void *)v11;
    if ((*(void *)v11 & 0x1000) == 0)
    {
LABEL_58:
      if ((v12 & 0x800) == 0) {
        goto LABEL_59;
      }
      goto LABEL_137;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v4 + 44) = self->_cellLteSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800) == 0)
  {
LABEL_59:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((_DWORD *)v4 + 43) = self->_cellLteRSRQ;
  v4[45] = (id)((unint64_t)v4[45] | 0x800);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x10000) == 0)
  {
LABEL_60:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v4 + 48) = self->_cellNrRSRP;
  v4[45] = (id)((unint64_t)v4[45] | 0x10000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x20000) == 0)
  {
LABEL_61:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v4 + 49) = self->_cellNrRSRQ;
  v4[45] = (id)((unint64_t)v4[45] | 0x20000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x40000) == 0)
  {
LABEL_62:
    if ((v12 & 0x100) == 0) {
      goto LABEL_63;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v4 + 50) = self->_cellNrSNR;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100) == 0)
  {
LABEL_63:
    if ((v12 & 0x400000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v4 + 40) = self->_cellDataLQM;
  v4[45] = (id)((unint64_t)v4[45] | 0x100);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x400000) == 0)
  {
LABEL_64:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((_DWORD *)v4 + 54) = self->_cellRrcState;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80000) == 0)
  {
LABEL_65:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v4 + 51) = self->_cellNsaFR1;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((_DWORD *)v4 + 52) = self->_cellNsaFR2;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x800000) == 0)
  {
LABEL_67:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((_DWORD *)v4 + 55) = self->_cellTotalDlBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x800000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x1000000) == 0)
  {
LABEL_68:
    if ((v12 & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((_DWORD *)v4 + 56) = self->_cellTotalUlBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x1000000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x80) == 0)
  {
LABEL_69:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v4 + 39) = self->_cellBssLoad;
  v4[45] = (id)((unint64_t)v4[45] | 0x80);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x2000) == 0)
  {
LABEL_70:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v4 + 45) = self->_cellMaxDlCaNumConf;
  v4[45] = (id)((unint64_t)v4[45] | 0x2000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x4000) == 0)
  {
LABEL_71:
    if ((v12 & 0x200) == 0) {
      goto LABEL_72;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((_DWORD *)v4 + 46) = self->_cellMaxUlCaNumConf;
  v4[45] = (id)((unint64_t)v4[45] | 0x4000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200) == 0)
  {
LABEL_72:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((_DWORD *)v4 + 41) = self->_cellEstimatedBW;
  v4[45] = (id)((unint64_t)v4[45] | 0x200);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200000000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((_DWORD *)v4 + 53) = self->_cellPMax;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_74:
    if ((v12 & 0x100000000000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((unsigned char *)v4 + 350) = self->_cellIsRoaming;
  v4[45] = (id)((unint64_t)v4[45] | 0x200000000000000);
  uint64_t v12 = (uint64_t)self->_flags;
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_75:
    if ((v12 & 0x80000000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_153:
  *((unsigned char *)v4 + 349) = self->_cellIsNoService;
  v4[45] = (id)((unint64_t)v4[45] | 0x100000000000000);
  if ((*(void *)&self->_flags & 0x80000000000000) != 0)
  {
LABEL_76:
    *((unsigned char *)v4 + 348) = self->_cellIsLimitedService;
    v4[45] = (id)((unint64_t)v4[45] | 0x80000000000000);
  }
LABEL_77:
  if (self->_ftIRATRecommendation)
  {
    objc_msgSend(v15, "setFtIRATRecommendation:");
    uint64_t v4 = v15;
  }
  if (self->_ftIRATRecommendationReason)
  {
    objc_msgSend(v15, "setFtIRATRecommendationReason:");
    uint64_t v4 = v15;
  }
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x200000000) != 0)
  {
    *((_DWORD *)v4 + 65) = self->_ftFacetimePacketLoss;
    v4[45] = (id)((unint64_t)v4[45] | 0x200000000);
    uint64_t v13 = (uint64_t)self->_flags;
  }
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x100000000) != 0)
  {
    *((_DWORD *)v4 + 64) = self->_ftFacetimeAction;
    v4[45] = (id)((unint64_t)v4[45] | 0x100000000);
    uint64_t v13 = (uint64_t)self->_flags;
    __int16 v14 = *((_WORD *)&self->_flags + 4);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x80000000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_157;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_85;
  }
  *((_DWORD *)v4 + 66) = self->_ftFacetimeTimeDelay;
  v4[45] = (id)((unint64_t)v4[45] | 0x400000000);
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_86:
    if ((v14 & 1) == 0) {
      goto LABEL_87;
    }
    goto LABEL_158;
  }
LABEL_157:
  *((_DWORD *)v4 + 63) = self->_ftCounter;
  v4[45] = (id)((unint64_t)v4[45] | 0x80000000);
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 1) == 0)
  {
LABEL_87:
    if ((v14 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_159;
  }
LABEL_158:
  *((unsigned char *)v4 + 357) = self->_wrmAlertedMode;
  *((_WORD *)v4 + 184) |= 1u;
  uint64_t v13 = (uint64_t)self->_flags;
  __int16 v14 = *((_WORD *)&self->_flags + 4);
  if ((v14 & 4) == 0)
  {
LABEL_88:
    if ((v14 & 2) == 0) {
      goto LABEL_89;
    }
    goto LABEL_160;
  }
LABEL_159:
  *((unsigned char *)v4 + 359) = self->_wrmIsStallDetected;
  *((_WORD *)v4 + 184) |= 4u;
  uint64_t v13 = (uint64_t)self->_flags;
  if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
  {
LABEL_89:
    if ((v13 & 0x40000000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((unsigned char *)v4 + 358) = self->_wrmIsPCDetected;
  *((_WORD *)v4 + 184) |= 2u;
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_90:
    if ((v13 & 0x20000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_161:
  *((_DWORD *)v4 + 86) = self->_wrmVideoErasure;
  v4[45] = (id)((unint64_t)v4[45] | 0x40000000000000);
  if ((*(void *)&self->_flags & 0x20000000000000) != 0)
  {
LABEL_91:
    *((_DWORD *)v4 + 85) = self->_wrmAudioErasure;
    v4[45] = (id)((unint64_t)v4[45] | 0x20000000000000);
  }
LABEL_92:
  if (self->_location)
  {
    objc_msgSend(v15, "setLocation:");
    uint64_t v4 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCellConnectionQuality *)self readAll:0];
    p_uint64_t flags = &self->_flags;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x4000000000) != 0)
    {
      *(_DWORD *)(v5 + 280) = self->_motionState;
      *(void *)(v5 + 360) |= 0x4000000000uLL;
      uint64_t flags = *(void *)p_flags;
      if ((*(void *)p_flags & 0x2000000000) == 0)
      {
LABEL_7:
        if ((flags & 0x8000000) == 0) {
          goto LABEL_8;
        }
        goto LABEL_82;
      }
    }
    else if ((flags & 0x2000000000) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 276) = self->_messageType;
    *(void *)(v5 + 360) |= 0x2000000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x8000000) == 0)
    {
LABEL_8:
      if ((flags & 0x1000000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_83;
    }
LABEL_82:
    *(_DWORD *)(v5 + 236) = self->_connectionType;
    *(void *)(v5 + 360) |= 0x8000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x1000000000) == 0)
    {
LABEL_9:
      if ((flags & 0x40000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_84;
    }
LABEL_83:
    *(_DWORD *)(v5 + 272) = self->_messageTrigger;
    *(void *)(v5 + 360) |= 0x1000000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x40000000) == 0)
    {
LABEL_10:
      if ((flags & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_85;
    }
LABEL_84:
    *(_DWORD *)(v5 + 248) = self->_environment;
    *(void *)(v5 + 360) |= 0x40000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_11:
      if ((flags & 0x4000000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_86;
    }
LABEL_85:
    *(void *)(v5 + 112) = self->_timeOfDay;
    *(void *)(v5 + 360) |= 4uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x4000000) == 0)
    {
LABEL_12:
      if ((flags & 0x1000000000000000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_87;
    }
LABEL_86:
    *(_DWORD *)(v5 + 232) = self->_connectionDuration;
    *(void *)(v5 + 360) |= 0x4000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 0x1000000000000000) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_88;
    }
LABEL_87:
    *(unsigned char *)(v5 + 353) = self->_isEmergency;
    *(void *)(v5 + 360) |= 0x1000000000000000uLL;
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_14:
      if ((flags & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_88:
    *(void *)(v5 + 16) = self->_bytesDlTotal;
    *(void *)(v5 + 360) |= 1uLL;
    if ((*(void *)&self->_flags & 2) == 0)
    {
LABEL_16:
      uint64_t v11 = [(NSString *)self->_callID copyWithZone:a3];
      uint64_t v12 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = v11;

      uint64_t v13 = &self->_flags;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000000000) != 0)
      {
        *(unsigned char *)(v5 + 352) = self->_isCallFailed;
        *(void *)(v5 + 360) |= 0x800000000000000uLL;
        uint64_t v14 = *(void *)v13;
        if ((*(void *)v13 & 0x20000000) == 0)
        {
LABEL_18:
          if ((v14 & 0x10000000000) == 0) {
            goto LABEL_19;
          }
          goto LABEL_92;
        }
      }
      else if ((v14 & 0x20000000) == 0)
      {
        goto LABEL_18;
      }
      *(float *)(v5 + 244) = self->_dlPeakThroughput;
      *(void *)(v5 + 360) |= 0x20000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000000) == 0)
      {
LABEL_19:
        if ((v14 & 0x10000000) == 0) {
          goto LABEL_20;
        }
        goto LABEL_93;
      }
LABEL_92:
      *(float *)(v5 + 288) = self->_ulPeakThroughput;
      *(void *)(v5 + 360) |= 0x10000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000) == 0)
      {
LABEL_20:
        if ((v14 & 0x8000000000) == 0) {
          goto LABEL_21;
        }
        goto LABEL_94;
      }
LABEL_93:
      *(float *)(v5 + 240) = self->_dlMedThroughput;
      *(void *)(v5 + 360) |= 0x10000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000) == 0)
      {
LABEL_21:
        if ((v14 & 0x4000000000000000) == 0) {
          goto LABEL_22;
        }
        goto LABEL_95;
      }
LABEL_94:
      *(float *)(v5 + 284) = self->_ulMedThroughput;
      *(void *)(v5 + 360) |= 0x8000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x4000000000000000) == 0)
      {
LABEL_22:
        if ((v14 & 0x2000000000000000) == 0) {
          goto LABEL_23;
        }
        goto LABEL_96;
      }
LABEL_95:
      *(unsigned char *)(v5 + 355) = self->_lowInternetUL;
      *(void *)(v5 + 360) |= 0x4000000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x2000000000000000) == 0)
      {
LABEL_23:
        if ((v14 & 0x800000000) == 0) {
          goto LABEL_24;
        }
        goto LABEL_97;
      }
LABEL_96:
      *(unsigned char *)(v5 + 354) = self->_lowInternetDL;
      *(void *)(v5 + 360) |= 0x2000000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000) == 0)
      {
LABEL_24:
        if ((v14 & 8) == 0) {
          goto LABEL_25;
        }
        goto LABEL_98;
      }
LABEL_97:
      *(_DWORD *)(v5 + 268) = self->_latency;
      *(void *)(v5 + 360) |= 0x800000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 8) == 0)
      {
LABEL_25:
        if ((v14 & 0x8000000000000) == 0) {
          goto LABEL_26;
        }
        goto LABEL_99;
      }
LABEL_98:
      *(void *)(v5 + 120) = self->_wifiRssi;
      *(void *)(v5 + 360) |= 8uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000000) == 0)
      {
LABEL_26:
        if ((v14 & 0x10) == 0) {
          goto LABEL_27;
        }
        goto LABEL_100;
      }
LABEL_99:
      *(_DWORD *)(v5 + 332) = self->_wifiTxPER;
      *(void *)(v5 + 360) |= 0x8000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10) == 0)
      {
LABEL_27:
        if ((v14 & 0x8000000000000000) == 0) {
          goto LABEL_28;
        }
        goto LABEL_101;
      }
LABEL_100:
      *(void *)(v5 + 128) = self->_wifiSNR;
      *(void *)(v5 + 360) |= 0x10uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x8000000000000000) == 0)
      {
LABEL_28:
        if ((v14 & 0x2000000000000) == 0) {
          goto LABEL_29;
        }
        goto LABEL_102;
      }
LABEL_101:
      *(unsigned char *)(v5 + 356) = self->_wifiCaptiveNetworks;
      *(void *)(v5 + 360) |= 0x8000000000000000;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x2000000000000) == 0)
      {
LABEL_29:
        if ((v14 & 0x200000000000) == 0) {
          goto LABEL_30;
        }
        goto LABEL_103;
      }
LABEL_102:
      *(_DWORD *)(v5 + 324) = self->_wifiRxRetry;
      *(void *)(v5 + 360) |= 0x2000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x200000000000) == 0)
      {
LABEL_30:
        if ((v14 & 0x10000000000000) == 0) {
          goto LABEL_31;
        }
        goto LABEL_104;
      }
LABEL_103:
      *(_DWORD *)(v5 + 308) = self->_wifiEstimatedBW;
      *(void *)(v5 + 360) |= 0x200000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x10000000000000) == 0)
      {
LABEL_31:
        if ((v14 & 0x1000000000000) == 0) {
          goto LABEL_32;
        }
        goto LABEL_105;
      }
LABEL_104:
      *(_DWORD *)(v5 + 336) = self->_wifiTxPhyRate;
      *(void *)(v5 + 360) |= 0x10000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x1000000000000) == 0)
      {
LABEL_32:
        if ((v14 & 0x800000000000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_106;
      }
LABEL_105:
      *(_DWORD *)(v5 + 320) = self->_wifiRxPhyRate;
      *(void *)(v5 + 360) |= 0x1000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x800000000000) == 0)
      {
LABEL_33:
        if ((v14 & 0x40000000000) == 0) {
          goto LABEL_34;
        }
        goto LABEL_107;
      }
LABEL_106:
      *(_DWORD *)(v5 + 316) = self->_wifiQbssLoad;
      *(void *)(v5 + 360) |= 0x800000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x40000000000) == 0)
      {
LABEL_34:
        if ((v14 & 0x4000000000000) == 0) {
          goto LABEL_35;
        }
        goto LABEL_108;
      }
LABEL_107:
      *(_DWORD *)(v5 + 296) = self->_wifiCca;
      *(void *)(v5 + 360) |= 0x40000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x4000000000000) == 0)
      {
LABEL_35:
        if ((v14 & 0x20000000000) == 0) {
          goto LABEL_36;
        }
        goto LABEL_109;
      }
LABEL_108:
      *(_DWORD *)(v5 + 328) = self->_wifiStationCount;
      *(void *)(v5 + 360) |= 0x4000000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x20000000000) == 0)
      {
LABEL_36:
        if ((v14 & 0x100000000000) == 0) {
          goto LABEL_37;
        }
        goto LABEL_110;
      }
LABEL_109:
      *(_DWORD *)(v5 + 292) = self->_wifiBand;
      *(void *)(v5 + 360) |= 0x20000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x100000000000) == 0)
      {
LABEL_37:
        if ((v14 & 0x80000000000) == 0) {
          goto LABEL_38;
        }
        goto LABEL_111;
      }
LABEL_110:
      *(_DWORD *)(v5 + 304) = self->_wifiChannel;
      *(void *)(v5 + 360) |= 0x100000000000uLL;
      uint64_t v14 = (uint64_t)self->_flags;
      if ((v14 & 0x80000000000) == 0)
      {
LABEL_38:
        if ((v14 & 0x400000000000) == 0) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
LABEL_111:
      *(_DWORD *)(v5 + 300) = self->_wifiChannelWidth;
      *(void *)(v5 + 360) |= 0x80000000000uLL;
      if ((*(void *)&self->_flags & 0x400000000000) == 0)
      {
LABEL_40:
        uint64_t v15 = [(NSString *)self->_cellGCI copyWithZone:a3];
        id v16 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v15;

        uint64_t v17 = [(NSString *)self->_cellHomePLMN copyWithZone:a3];
        double v18 = *(void **)(v5 + 56);
        *(void *)(v5 + 56) = v17;

        uint64_t v19 = [(NSString *)self->_cellHomePLMN2 copyWithZone:a3];
        uint64_t v20 = *(void **)(v5 + 48);
        *(void *)(v5 + 48) = v19;

        uint64_t v21 = [(NSString *)self->_cellServiceProvider copyWithZone:a3];
        v22 = *(void **)(v5 + 80);
        *(void *)(v5 + 80) = v21;

        uint64_t v23 = [(NSString *)self->_cellServiceProvider2 copyWithZone:a3];
        v24 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = v23;

        v25 = &self->_flags;
        uint64_t v26 = (uint64_t)self->_flags;
        if ((v26 & 0x2000000) != 0)
        {
          *(_DWORD *)(v5 + 228) = self->_cellVoiceLQM;
          *(void *)(v5 + 360) |= 0x2000000uLL;
          uint64_t v26 = *(void *)v25;
          if ((*(void *)v25 & 0x400000000000000) == 0)
          {
LABEL_42:
            if ((v26 & 0x8000) == 0) {
              goto LABEL_43;
            }
            goto LABEL_115;
          }
        }
        else if ((v26 & 0x400000000000000) == 0)
        {
          goto LABEL_42;
        }
        *(unsigned char *)(v5 + 351) = self->_cellNpnStatus;
        *(void *)(v5 + 360) |= 0x400000000000000uLL;
        uint64_t v26 = (uint64_t)self->_flags;
        if ((v26 & 0x8000) == 0)
        {
LABEL_43:
          if ((v26 & 0x20) == 0) {
            goto LABEL_44;
          }
          goto LABEL_116;
        }
LABEL_115:
        *(_DWORD *)(v5 + 188) = self->_cellNpn;
        *(void *)(v5 + 360) |= 0x8000uLL;
        uint64_t v26 = (uint64_t)self->_flags;
        if ((v26 & 0x20) == 0)
        {
LABEL_44:
          if ((v26 & 0x40) == 0) {
            goto LABEL_46;
          }
          goto LABEL_45;
        }
LABEL_116:
        *(_DWORD *)(v5 + 148) = self->_cellArfcn;
        *(void *)(v5 + 360) |= 0x20uLL;
        if ((*(void *)&self->_flags & 0x40) == 0)
        {
LABEL_46:
          uint64_t v27 = [(NSString *)self->_cellRatType copyWithZone:a3];
          v28 = *(void **)(v5 + 64);
          *(void *)(v5 + 64) = v27;

          uint64_t v29 = &self->_flags;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x400) != 0)
          {
            *(_DWORD *)(v5 + 168) = self->_cellLteRSRP;
            *(void *)(v5 + 360) |= 0x400uLL;
            uint64_t v30 = *(void *)v29;
            if ((*(void *)v29 & 0x1000) == 0)
            {
LABEL_48:
              if ((v30 & 0x800) == 0) {
                goto LABEL_49;
              }
              goto LABEL_120;
            }
          }
          else if ((v30 & 0x1000) == 0)
          {
            goto LABEL_48;
          }
          *(_DWORD *)(v5 + 176) = self->_cellLteSNR;
          *(void *)(v5 + 360) |= 0x1000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x800) == 0)
          {
LABEL_49:
            if ((v30 & 0x10000) == 0) {
              goto LABEL_50;
            }
            goto LABEL_121;
          }
LABEL_120:
          *(_DWORD *)(v5 + 172) = self->_cellLteRSRQ;
          *(void *)(v5 + 360) |= 0x800uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x10000) == 0)
          {
LABEL_50:
            if ((v30 & 0x20000) == 0) {
              goto LABEL_51;
            }
            goto LABEL_122;
          }
LABEL_121:
          *(_DWORD *)(v5 + 192) = self->_cellNrRSRP;
          *(void *)(v5 + 360) |= 0x10000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x20000) == 0)
          {
LABEL_51:
            if ((v30 & 0x40000) == 0) {
              goto LABEL_52;
            }
            goto LABEL_123;
          }
LABEL_122:
          *(_DWORD *)(v5 + 196) = self->_cellNrRSRQ;
          *(void *)(v5 + 360) |= 0x20000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x40000) == 0)
          {
LABEL_52:
            if ((v30 & 0x100) == 0) {
              goto LABEL_53;
            }
            goto LABEL_124;
          }
LABEL_123:
          *(_DWORD *)(v5 + 200) = self->_cellNrSNR;
          *(void *)(v5 + 360) |= 0x40000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100) == 0)
          {
LABEL_53:
            if ((v30 & 0x400000) == 0) {
              goto LABEL_54;
            }
            goto LABEL_125;
          }
LABEL_124:
          *(_DWORD *)(v5 + 160) = self->_cellDataLQM;
          *(void *)(v5 + 360) |= 0x100uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x400000) == 0)
          {
LABEL_54:
            if ((v30 & 0x80000) == 0) {
              goto LABEL_55;
            }
            goto LABEL_126;
          }
LABEL_125:
          *(_DWORD *)(v5 + 216) = self->_cellRrcState;
          *(void *)(v5 + 360) |= 0x400000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x80000) == 0)
          {
LABEL_55:
            if ((v30 & 0x100000) == 0) {
              goto LABEL_56;
            }
            goto LABEL_127;
          }
LABEL_126:
          *(_DWORD *)(v5 + 204) = self->_cellNsaFR1;
          *(void *)(v5 + 360) |= 0x80000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100000) == 0)
          {
LABEL_56:
            if ((v30 & 0x800000) == 0) {
              goto LABEL_57;
            }
            goto LABEL_128;
          }
LABEL_127:
          *(_DWORD *)(v5 + 208) = self->_cellNsaFR2;
          *(void *)(v5 + 360) |= 0x100000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x800000) == 0)
          {
LABEL_57:
            if ((v30 & 0x1000000) == 0) {
              goto LABEL_58;
            }
            goto LABEL_129;
          }
LABEL_128:
          *(_DWORD *)(v5 + 220) = self->_cellTotalDlBW;
          *(void *)(v5 + 360) |= 0x800000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x1000000) == 0)
          {
LABEL_58:
            if ((v30 & 0x80) == 0) {
              goto LABEL_59;
            }
            goto LABEL_130;
          }
LABEL_129:
          *(_DWORD *)(v5 + 224) = self->_cellTotalUlBW;
          *(void *)(v5 + 360) |= 0x1000000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x80) == 0)
          {
LABEL_59:
            if ((v30 & 0x2000) == 0) {
              goto LABEL_60;
            }
            goto LABEL_131;
          }
LABEL_130:
          *(_DWORD *)(v5 + 156) = self->_cellBssLoad;
          *(void *)(v5 + 360) |= 0x80uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x2000) == 0)
          {
LABEL_60:
            if ((v30 & 0x4000) == 0) {
              goto LABEL_61;
            }
            goto LABEL_132;
          }
LABEL_131:
          *(_DWORD *)(v5 + 180) = self->_cellMaxDlCaNumConf;
          *(void *)(v5 + 360) |= 0x2000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x4000) == 0)
          {
LABEL_61:
            if ((v30 & 0x200) == 0) {
              goto LABEL_62;
            }
            goto LABEL_133;
          }
LABEL_132:
          *(_DWORD *)(v5 + 184) = self->_cellMaxUlCaNumConf;
          *(void *)(v5 + 360) |= 0x4000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200) == 0)
          {
LABEL_62:
            if ((v30 & 0x200000) == 0) {
              goto LABEL_63;
            }
            goto LABEL_134;
          }
LABEL_133:
          *(_DWORD *)(v5 + 164) = self->_cellEstimatedBW;
          *(void *)(v5 + 360) |= 0x200uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200000) == 0)
          {
LABEL_63:
            if ((v30 & 0x200000000000000) == 0) {
              goto LABEL_64;
            }
            goto LABEL_135;
          }
LABEL_134:
          *(_DWORD *)(v5 + 212) = self->_cellPMax;
          *(void *)(v5 + 360) |= 0x200000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x200000000000000) == 0)
          {
LABEL_64:
            if ((v30 & 0x100000000000000) == 0) {
              goto LABEL_65;
            }
            goto LABEL_136;
          }
LABEL_135:
          *(unsigned char *)(v5 + 350) = self->_cellIsRoaming;
          *(void *)(v5 + 360) |= 0x200000000000000uLL;
          uint64_t v30 = (uint64_t)self->_flags;
          if ((v30 & 0x100000000000000) == 0)
          {
LABEL_65:
            if ((v30 & 0x80000000000000) == 0) {
              goto LABEL_67;
            }
            goto LABEL_66;
          }
LABEL_136:
          *(unsigned char *)(v5 + 349) = self->_cellIsNoService;
          *(void *)(v5 + 360) |= 0x100000000000000uLL;
          if ((*(void *)&self->_flags & 0x80000000000000) == 0)
          {
LABEL_67:
            uint64_t v31 = [(NSString *)self->_ftIRATRecommendation copyWithZone:a3];
            v32 = *(void **)(v5 + 96);
            *(void *)(v5 + 96) = v31;

            uint64_t v33 = [(NSString *)self->_ftIRATRecommendationReason copyWithZone:a3];
            uint64_t v34 = *(void **)(v5 + 88);
            *(void *)(v5 + 88) = v33;

            uint64_t v35 = (uint64_t)self->_flags;
            if ((v35 & 0x200000000) != 0)
            {
              *(_DWORD *)(v5 + 260) = self->_ftFacetimePacketLoss;
              *(void *)(v5 + 360) |= 0x200000000uLL;
              uint64_t v35 = (uint64_t)self->_flags;
            }
            __int16 v36 = *((_WORD *)&self->_flags + 4);
            if ((v35 & 0x100000000) != 0)
            {
              *(_DWORD *)(v5 + 256) = self->_ftFacetimeAction;
              *(void *)(v5 + 360) |= 0x100000000uLL;
              uint64_t v35 = (uint64_t)self->_flags;
              __int16 v36 = *((_WORD *)&self->_flags + 4);
              if ((v35 & 0x400000000) == 0)
              {
LABEL_71:
                if ((v35 & 0x80000000) == 0) {
                  goto LABEL_72;
                }
                goto LABEL_140;
              }
            }
            else if ((v35 & 0x400000000) == 0)
            {
              goto LABEL_71;
            }
            *(_DWORD *)(v5 + 264) = self->_ftFacetimeTimeDelay;
            *(void *)(v5 + 360) |= 0x400000000uLL;
            uint64_t v35 = (uint64_t)self->_flags;
            __int16 v36 = *((_WORD *)&self->_flags + 4);
            if ((v35 & 0x80000000) == 0)
            {
LABEL_72:
              if ((v36 & 1) == 0) {
                goto LABEL_73;
              }
              goto LABEL_141;
            }
LABEL_140:
            *(_DWORD *)(v5 + 252) = self->_ftCounter;
            *(void *)(v5 + 360) |= 0x80000000uLL;
            uint64_t v35 = (uint64_t)self->_flags;
            __int16 v36 = *((_WORD *)&self->_flags + 4);
            if ((v36 & 1) == 0)
            {
LABEL_73:
              if ((v36 & 4) == 0) {
                goto LABEL_74;
              }
              goto LABEL_142;
            }
LABEL_141:
            *(unsigned char *)(v5 + 357) = self->_wrmAlertedMode;
            *(_WORD *)(v5 + 368) |= 1u;
            uint64_t v35 = (uint64_t)self->_flags;
            __int16 v36 = *((_WORD *)&self->_flags + 4);
            if ((v36 & 4) == 0)
            {
LABEL_74:
              if ((v36 & 2) == 0) {
                goto LABEL_75;
              }
              goto LABEL_143;
            }
LABEL_142:
            *(unsigned char *)(v5 + 359) = self->_wrmIsStallDetected;
            *(_WORD *)(v5 + 368) |= 4u;
            uint64_t v35 = (uint64_t)self->_flags;
            if ((*((_WORD *)&self->_flags + 4) & 2) == 0)
            {
LABEL_75:
              if ((v35 & 0x40000000000000) == 0) {
                goto LABEL_76;
              }
              goto LABEL_144;
            }
LABEL_143:
            *(unsigned char *)(v5 + 358) = self->_wrmIsPCDetected;
            *(_WORD *)(v5 + 368) |= 2u;
            uint64_t v35 = (uint64_t)self->_flags;
            if ((v35 & 0x40000000000000) == 0)
            {
LABEL_76:
              if ((v35 & 0x20000000000000) == 0)
              {
LABEL_78:
                id v37 = [(GEOLocation *)self->_location copyWithZone:a3];
                v38 = *(void **)(v5 + 104);
                *(void *)(v5 + 104) = v37;

                id v39 = (id)v5;
                goto LABEL_79;
              }
LABEL_77:
              *(_DWORD *)(v5 + 340) = self->_wrmAudioErasure;
              *(void *)(v5 + 360) |= 0x20000000000000uLL;
              goto LABEL_78;
            }
LABEL_144:
            *(_DWORD *)(v5 + 344) = self->_wrmVideoErasure;
            *(void *)(v5 + 360) |= 0x40000000000000uLL;
            if ((*(void *)&self->_flags & 0x20000000000000) == 0) {
              goto LABEL_78;
            }
            goto LABEL_77;
          }
LABEL_66:
          *(unsigned char *)(v5 + 348) = self->_cellIsLimitedService;
          *(void *)(v5 + 360) |= 0x80000000000000uLL;
          goto LABEL_67;
        }
LABEL_45:
        *(_DWORD *)(v5 + 152) = self->_cellBand;
        *(void *)(v5 + 360) |= 0x40uLL;
        goto LABEL_46;
      }
LABEL_39:
      *(_DWORD *)(v5 + 312) = self->_wifiPhyMode;
      *(void *)(v5 + 360) |= 0x400000000000uLL;
      goto LABEL_40;
    }
LABEL_15:
    *(void *)(v5 + 24) = self->_bytesUlTotal;
    *(void *)(v5 + 360) |= 2uLL;
    goto LABEL_16;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*((_WORD *)&self->_flags + 4) & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOCellConnectionQualityReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_79:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_395;
  }
  [(GEOCellConnectionQuality *)self readAll:1];
  [v4 readAll:1];
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v6 = *((void *)v4 + 45);
  if ((flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_motionState != *((_DWORD *)v4 + 70)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_messageType != *((_DWORD *)v4 + 69)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_connectionType != *((_DWORD *)v4 + 59)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_messageTrigger != *((_DWORD *)v4 + 68)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_environment != *((_DWORD *)v4 + 62)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeOfDay != *((void *)v4 + 14)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_connectionDuration != *((_DWORD *)v4 + 58)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000000000) != 0)
  {
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_isEmergency)
    {
      if (!*((unsigned char *)v4 + 353)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 353))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x1000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_bytesDlTotal != *((void *)v4 + 2)) {
      goto LABEL_395;
    }
  }
  else if (v6)
  {
    goto LABEL_395;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bytesUlTotal != *((void *)v4 + 3)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_395;
  }
  callID = self->_callID;
  if ((unint64_t)callID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](callID, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v6 = *((void *)v4 + 45);
  }
  if ((flags & 0x800000000000000) != 0)
  {
    if ((v6 & 0x800000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_isCallFailed)
    {
      if (!*((unsigned char *)v4 + 352)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 352))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x800000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_dlPeakThroughput != *((float *)v4 + 61)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0 || self->_ulPeakThroughput != *((float *)v4 + 72)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_dlMedThroughput != *((float *)v4 + 60)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_ulMedThroughput != *((float *)v4 + 71)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000000000000) != 0)
  {
    if ((v6 & 0x4000000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_lowInternetUL)
    {
      if (!*((unsigned char *)v4 + 355)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 355))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x4000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000000000) != 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_lowInternetDL)
    {
      if (!*((unsigned char *)v4 + 354)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 354))
    {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x2000000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_latency != *((_DWORD *)v4 + 67)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_wifiRssi != *((void *)v4 + 15)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x8000000000000) != 0)
  {
    if ((v6 & 0x8000000000000) == 0 || self->_wifiTxPER != *((_DWORD *)v4 + 83)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x8000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_wifiSNR != *((void *)v4 + 16)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_395;
  }
  if (flags < 0)
  {
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_wifiCaptiveNetworks)
    {
      if (!*((unsigned char *)v4 + 356)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 356))
    {
      goto LABEL_395;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x2000000000000) != 0)
  {
    if ((v6 & 0x2000000000000) == 0 || self->_wifiRxRetry != *((_DWORD *)v4 + 81)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x2000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x200000000000) != 0)
  {
    if ((v6 & 0x200000000000) == 0 || self->_wifiEstimatedBW != *((_DWORD *)v4 + 77)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x200000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x10000000000000) != 0)
  {
    if ((v6 & 0x10000000000000) == 0 || self->_wifiTxPhyRate != *((_DWORD *)v4 + 84)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x10000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_wifiRxPhyRate != *((_DWORD *)v4 + 80)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0 || self->_wifiQbssLoad != *((_DWORD *)v4 + 79)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x40000000000) != 0)
  {
    if ((v6 & 0x40000000000) == 0 || self->_wifiCca != *((_DWORD *)v4 + 74)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x40000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x4000000000000) != 0)
  {
    if ((v6 & 0x4000000000000) == 0 || self->_wifiStationCount != *((_DWORD *)v4 + 82)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x4000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_wifiBand != *((_DWORD *)v4 + 73)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x100000000000) != 0)
  {
    if ((v6 & 0x100000000000) == 0 || self->_wifiChannel != *((_DWORD *)v4 + 76)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x100000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0 || self->_wifiChannelWidth != *((_DWORD *)v4 + 75)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((flags & 0x400000000000) != 0)
  {
    if ((v6 & 0x400000000000) == 0 || self->_wifiPhyMode != *((_DWORD *)v4 + 78)) {
      goto LABEL_395;
    }
  }
  else if ((v6 & 0x400000000000) != 0)
  {
    goto LABEL_395;
  }
  cellGCI = self->_cellGCI;
  if ((unint64_t)cellGCI | *((void *)v4 + 5) && !-[NSString isEqual:](cellGCI, "isEqual:")) {
    goto LABEL_395;
  }
  cellHomePLMN = self->_cellHomePLMN;
  if ((unint64_t)cellHomePLMN | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](cellHomePLMN, "isEqual:")) {
      goto LABEL_395;
    }
  }
  cellHomePLMN2 = self->_cellHomePLMN2;
  if ((unint64_t)cellHomePLMN2 | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](cellHomePLMN2, "isEqual:")) {
      goto LABEL_395;
    }
  }
  cellServiceProvider = self->_cellServiceProvider;
  if ((unint64_t)cellServiceProvider | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](cellServiceProvider, "isEqual:")) {
      goto LABEL_395;
    }
  }
  cellServiceProvider2 = self->_cellServiceProvider2;
  if ((unint64_t)cellServiceProvider2 | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](cellServiceProvider2, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v13 = (uint64_t)self->_flags;
  uint64_t v14 = *((void *)v4 + 45);
  if ((v13 & 0x2000000) != 0)
  {
    if ((v14 & 0x2000000) == 0 || self->_cellVoiceLQM != *((_DWORD *)v4 + 57)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x2000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x400000000000000) != 0)
  {
    if ((v14 & 0x400000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_cellNpnStatus)
    {
      if (!*((unsigned char *)v4 + 351)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 351))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x400000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x8000) != 0)
  {
    if ((v14 & 0x8000) == 0 || self->_cellNpn != *((_DWORD *)v4 + 47)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x8000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_cellArfcn != *((_DWORD *)v4 + 37)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_cellBand != *((_DWORD *)v4 + 38)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_395;
  }
  cellRatType = self->_cellRatType;
  if ((unint64_t)cellRatType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](cellRatType, "isEqual:")) {
      goto LABEL_395;
    }
    uint64_t v13 = (uint64_t)self->_flags;
    uint64_t v14 = *((void *)v4 + 45);
  }
  if ((v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0 || self->_cellLteRSRP != *((_DWORD *)v4 + 42)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_cellLteSNR != *((_DWORD *)v4 + 44)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x800) != 0)
  {
    if ((v14 & 0x800) == 0 || self->_cellLteRSRQ != *((_DWORD *)v4 + 43)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x800) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x10000) != 0)
  {
    if ((v14 & 0x10000) == 0 || self->_cellNrRSRP != *((_DWORD *)v4 + 48)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x10000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0 || self->_cellNrRSRQ != *((_DWORD *)v4 + 49)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0 || self->_cellNrSNR != *((_DWORD *)v4 + 50)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_cellDataLQM != *((_DWORD *)v4 + 40)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x400000) != 0)
  {
    if ((v14 & 0x400000) == 0 || self->_cellRrcState != *((_DWORD *)v4 + 54)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x400000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0 || self->_cellNsaFR1 != *((_DWORD *)v4 + 51)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_cellNsaFR2 != *((_DWORD *)v4 + 52)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0 || self->_cellTotalDlBW != *((_DWORD *)v4 + 55)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x1000000) != 0)
  {
    if ((v14 & 0x1000000) == 0 || self->_cellTotalUlBW != *((_DWORD *)v4 + 56)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x1000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_cellBssLoad != *((_DWORD *)v4 + 39)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0 || self->_cellMaxDlCaNumConf != *((_DWORD *)v4 + 45)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0 || self->_cellMaxUlCaNumConf != *((_DWORD *)v4 + 46)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_cellEstimatedBW != *((_DWORD *)v4 + 41)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0 || self->_cellPMax != *((_DWORD *)v4 + 53)) {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x200000000000000) != 0)
  {
    if ((v14 & 0x200000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_cellIsRoaming)
    {
      if (!*((unsigned char *)v4 + 350)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 350))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x200000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x100000000000000) != 0)
  {
    if ((v14 & 0x100000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_cellIsNoService)
    {
      if (!*((unsigned char *)v4 + 349)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 349))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x100000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v13 & 0x80000000000000) != 0)
  {
    if ((v14 & 0x80000000000000) == 0) {
      goto LABEL_395;
    }
    if (self->_cellIsLimitedService)
    {
      if (!*((unsigned char *)v4 + 348)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 348))
    {
      goto LABEL_395;
    }
  }
  else if ((v14 & 0x80000000000000) != 0)
  {
    goto LABEL_395;
  }
  ftIRATRecommendation = self->_ftIRATRecommendation;
  if ((unint64_t)ftIRATRecommendation | *((void *)v4 + 12)
    && !-[NSString isEqual:](ftIRATRecommendation, "isEqual:"))
  {
    goto LABEL_395;
  }
  ftIRATRecommendationReason = self->_ftIRATRecommendationReason;
  if ((unint64_t)ftIRATRecommendationReason | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](ftIRATRecommendationReason, "isEqual:")) {
      goto LABEL_395;
    }
  }
  uint64_t v18 = (uint64_t)self->_flags;
  __int16 v19 = *((_WORD *)&self->_flags + 4);
  uint64_t v20 = *((void *)v4 + 45);
  __int16 v21 = *((_WORD *)v4 + 184);
  if ((v18 & 0x200000000) != 0)
  {
    if ((v20 & 0x200000000) == 0 || self->_ftFacetimePacketLoss != *((_DWORD *)v4 + 65)) {
      goto LABEL_395;
    }
  }
  else if ((v20 & 0x200000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x100000000) != 0)
  {
    if ((v20 & 0x100000000) == 0 || self->_ftFacetimeAction != *((_DWORD *)v4 + 64)) {
      goto LABEL_395;
    }
  }
  else if ((v20 & 0x100000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x400000000) != 0)
  {
    if ((v20 & 0x400000000) == 0 || self->_ftFacetimeTimeDelay != *((_DWORD *)v4 + 66)) {
      goto LABEL_395;
    }
  }
  else if ((v20 & 0x400000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x80000000) != 0)
  {
    if ((v20 & 0x80000000) == 0 || self->_ftCounter != *((_DWORD *)v4 + 63)) {
      goto LABEL_395;
    }
  }
  else if ((v20 & 0x80000000) != 0)
  {
    goto LABEL_395;
  }
  if (v19)
  {
    if ((v21 & 1) == 0) {
      goto LABEL_395;
    }
    if (self->_wrmAlertedMode)
    {
      if (!*((unsigned char *)v4 + 357)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 357))
    {
      goto LABEL_395;
    }
  }
  else if (v21)
  {
    goto LABEL_395;
  }
  if ((v19 & 4) != 0)
  {
    if ((v21 & 4) == 0) {
      goto LABEL_395;
    }
    if (self->_wrmIsStallDetected)
    {
      if (!*((unsigned char *)v4 + 359)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 359))
    {
      goto LABEL_395;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_395;
  }
  if ((v19 & 2) != 0)
  {
    if ((v21 & 2) == 0) {
      goto LABEL_395;
    }
    if (self->_wrmIsPCDetected)
    {
      if (!*((unsigned char *)v4 + 358)) {
        goto LABEL_395;
      }
    }
    else if (*((unsigned char *)v4 + 358))
    {
      goto LABEL_395;
    }
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x40000000000000) != 0)
  {
    if ((v20 & 0x40000000000000) == 0 || self->_wrmVideoErasure != *((_DWORD *)v4 + 86)) {
      goto LABEL_395;
    }
  }
  else if ((v20 & 0x40000000000000) != 0)
  {
    goto LABEL_395;
  }
  if ((v18 & 0x20000000000000) == 0)
  {
    if ((v20 & 0x20000000000000) == 0) {
      goto LABEL_393;
    }
LABEL_395:
    char v23 = 0;
    goto LABEL_396;
  }
  if ((v20 & 0x20000000000000) == 0 || self->_wrmAudioErasure != *((_DWORD *)v4 + 85)) {
    goto LABEL_395;
  }
LABEL_393:
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 13)) {
    char v23 = -[GEOLocation isEqual:](location, "isEqual:");
  }
  else {
    char v23 = 1;
  }
LABEL_396:

  return v23;
}

- (unint64_t)hash
{
  [(GEOCellConnectionQuality *)self readAll:1];
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) != 0)
  {
    uint64_t v103 = 2654435761 * self->_motionState;
    if ((flags & 0x2000000000) != 0)
    {
LABEL_3:
      uint64_t v102 = 2654435761 * self->_messageType;
      if ((flags & 0x8000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v103 = 0;
    if ((flags & 0x2000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v102 = 0;
  if ((flags & 0x8000000) != 0)
  {
LABEL_4:
    uint64_t v101 = 2654435761 * self->_connectionType;
    if ((flags & 0x1000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v101 = 0;
  if ((flags & 0x1000000000) != 0)
  {
LABEL_5:
    uint64_t v100 = 2654435761 * self->_messageTrigger;
    if ((flags & 0x40000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v100 = 0;
  if ((flags & 0x40000000) != 0)
  {
LABEL_6:
    uint64_t v99 = 2654435761 * self->_environment;
    if ((flags & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v99 = 0;
  if ((flags & 4) != 0)
  {
LABEL_7:
    unint64_t v98 = 2654435761u * self->_timeOfDay;
    if ((flags & 0x4000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v98 = 0;
  if ((flags & 0x4000000) != 0)
  {
LABEL_8:
    uint64_t v97 = 2654435761 * self->_connectionDuration;
    if ((flags & 0x1000000000000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v97 = 0;
  if ((flags & 0x1000000000000000) != 0)
  {
LABEL_9:
    uint64_t v96 = 2654435761 * self->_isEmergency;
    if (flags) {
      goto LABEL_10;
    }
LABEL_20:
    unint64_t v95 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v96 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  unint64_t v95 = 2654435761u * self->_bytesDlTotal;
  if ((flags & 2) != 0)
  {
LABEL_11:
    unint64_t v94 = 2654435761u * self->_bytesUlTotal;
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v94 = 0;
LABEL_22:
  NSUInteger v93 = [(NSString *)self->_callID hash];
  uint64_t v4 = (uint64_t)self->_flags;
  if ((v4 & 0x800000000000000) != 0)
  {
    uint64_t v92 = 2654435761 * self->_isCallFailed;
    if ((v4 & 0x20000000) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    unint64_t v9 = 0;
    goto LABEL_32;
  }
  uint64_t v92 = 0;
  if ((v4 & 0x20000000) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  float dlPeakThroughput = self->_dlPeakThroughput;
  double v6 = dlPeakThroughput;
  if (dlPeakThroughput < 0.0) {
    double v6 = -dlPeakThroughput;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_32:
  if ((v4 & 0x10000000000) != 0)
  {
    float ulPeakThroughput = self->_ulPeakThroughput;
    double v12 = ulPeakThroughput;
    if (ulPeakThroughput < 0.0) {
      double v12 = -ulPeakThroughput;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((v4 & 0x10000000) != 0)
  {
    float dlMedThroughput = self->_dlMedThroughput;
    double v17 = dlMedThroughput;
    if (dlMedThroughput < 0.0) {
      double v17 = -dlMedThroughput;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((v4 & 0x8000000000) != 0)
  {
    float ulMedThroughput = self->_ulMedThroughput;
    double v22 = ulMedThroughput;
    if (ulMedThroughput < 0.0) {
      double v22 = -ulMedThroughput;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((v4 & 0x4000000000000000) != 0)
  {
    uint64_t v89 = 2654435761 * self->_lowInternetUL;
    if ((v4 & 0x2000000000000000) != 0)
    {
LABEL_58:
      uint64_t v88 = 2654435761 * self->_lowInternetDL;
      if ((v4 & 0x800000000) != 0) {
        goto LABEL_59;
      }
      goto LABEL_76;
    }
  }
  else
  {
    uint64_t v89 = 0;
    if ((v4 & 0x2000000000000000) != 0) {
      goto LABEL_58;
    }
  }
  uint64_t v88 = 0;
  if ((v4 & 0x800000000) != 0)
  {
LABEL_59:
    uint64_t v87 = 2654435761 * self->_latency;
    if ((v4 & 8) != 0) {
      goto LABEL_60;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v87 = 0;
  if ((v4 & 8) != 0)
  {
LABEL_60:
    uint64_t v86 = 2654435761 * self->_wifiRssi;
    if ((v4 & 0x8000000000000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v86 = 0;
  if ((v4 & 0x8000000000000) != 0)
  {
LABEL_61:
    uint64_t v85 = 2654435761 * self->_wifiTxPER;
    if ((v4 & 0x10) != 0) {
      goto LABEL_62;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v85 = 0;
  if ((v4 & 0x10) != 0)
  {
LABEL_62:
    uint64_t v84 = 2654435761 * self->_wifiSNR;
    if (v4 < 0) {
      goto LABEL_63;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v84 = 0;
  if (v4 < 0)
  {
LABEL_63:
    uint64_t v83 = 2654435761 * self->_wifiCaptiveNetworks;
    if ((v4 & 0x2000000000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v83 = 0;
  if ((v4 & 0x2000000000000) != 0)
  {
LABEL_64:
    uint64_t v82 = 2654435761 * self->_wifiRxRetry;
    if ((v4 & 0x200000000000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v82 = 0;
  if ((v4 & 0x200000000000) != 0)
  {
LABEL_65:
    uint64_t v81 = 2654435761 * self->_wifiEstimatedBW;
    if ((v4 & 0x10000000000000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v81 = 0;
  if ((v4 & 0x10000000000000) != 0)
  {
LABEL_66:
    uint64_t v80 = 2654435761 * self->_wifiTxPhyRate;
    if ((v4 & 0x1000000000000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v80 = 0;
  if ((v4 & 0x1000000000000) != 0)
  {
LABEL_67:
    uint64_t v79 = 2654435761 * self->_wifiRxPhyRate;
    if ((v4 & 0x800000000000) != 0) {
      goto LABEL_68;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v79 = 0;
  if ((v4 & 0x800000000000) != 0)
  {
LABEL_68:
    uint64_t v78 = 2654435761 * self->_wifiQbssLoad;
    if ((v4 & 0x40000000000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v78 = 0;
  if ((v4 & 0x40000000000) != 0)
  {
LABEL_69:
    uint64_t v77 = 2654435761 * self->_wifiCca;
    if ((v4 & 0x4000000000000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v77 = 0;
  if ((v4 & 0x4000000000000) != 0)
  {
LABEL_70:
    uint64_t v76 = 2654435761 * self->_wifiStationCount;
    if ((v4 & 0x20000000000) != 0) {
      goto LABEL_71;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v76 = 0;
  if ((v4 & 0x20000000000) != 0)
  {
LABEL_71:
    uint64_t v75 = 2654435761 * self->_wifiBand;
    if ((v4 & 0x100000000000) != 0) {
      goto LABEL_72;
    }
LABEL_89:
    uint64_t v74 = 0;
    if ((v4 & 0x80000000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_90;
  }
LABEL_88:
  uint64_t v75 = 0;
  if ((v4 & 0x100000000000) == 0) {
    goto LABEL_89;
  }
LABEL_72:
  uint64_t v74 = 2654435761 * self->_wifiChannel;
  if ((v4 & 0x80000000000) != 0)
  {
LABEL_73:
    uint64_t v73 = 2654435761 * self->_wifiChannelWidth;
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v73 = 0;
LABEL_91:
  unint64_t v90 = v20;
  unint64_t v91 = v9;
  if ((v4 & 0x400000000000) != 0) {
    uint64_t v72 = 2654435761 * self->_wifiPhyMode;
  }
  else {
    uint64_t v72 = 0;
  }
  NSUInteger v71 = [(NSString *)self->_cellGCI hash];
  NSUInteger v70 = [(NSString *)self->_cellHomePLMN hash];
  NSUInteger v69 = [(NSString *)self->_cellHomePLMN2 hash];
  NSUInteger v68 = [(NSString *)self->_cellServiceProvider hash];
  NSUInteger v67 = [(NSString *)self->_cellServiceProvider2 hash];
  uint64_t v25 = (uint64_t)self->_flags;
  if ((v25 & 0x2000000) != 0)
  {
    uint64_t v66 = 2654435761 * self->_cellVoiceLQM;
    if ((v25 & 0x400000000000000) != 0)
    {
LABEL_96:
      uint64_t v65 = 2654435761 * self->_cellNpnStatus;
      if ((v25 & 0x8000) != 0) {
        goto LABEL_97;
      }
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v66 = 0;
    if ((v25 & 0x400000000000000) != 0) {
      goto LABEL_96;
    }
  }
  uint64_t v65 = 0;
  if ((v25 & 0x8000) != 0)
  {
LABEL_97:
    uint64_t v64 = 2654435761 * self->_cellNpn;
    if ((v25 & 0x20) != 0) {
      goto LABEL_98;
    }
LABEL_103:
    uint64_t v63 = 0;
    if ((v25 & 0x40) != 0) {
      goto LABEL_99;
    }
    goto LABEL_104;
  }
LABEL_102:
  uint64_t v64 = 0;
  if ((v25 & 0x20) == 0) {
    goto LABEL_103;
  }
LABEL_98:
  uint64_t v63 = 2654435761 * self->_cellArfcn;
  if ((v25 & 0x40) != 0)
  {
LABEL_99:
    uint64_t v62 = 2654435761 * self->_cellBand;
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v62 = 0;
LABEL_105:
  NSUInteger v61 = [(NSString *)self->_cellRatType hash];
  uint64_t v26 = (uint64_t)self->_flags;
  if ((v26 & 0x400) != 0)
  {
    uint64_t v60 = 2654435761 * self->_cellLteRSRP;
    if ((v26 & 0x1000) != 0)
    {
LABEL_107:
      uint64_t v59 = 2654435761 * self->_cellLteSNR;
      if ((v26 & 0x800) != 0) {
        goto LABEL_108;
      }
      goto LABEL_127;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if ((v26 & 0x1000) != 0) {
      goto LABEL_107;
    }
  }
  uint64_t v59 = 0;
  if ((v26 & 0x800) != 0)
  {
LABEL_108:
    uint64_t v58 = 2654435761 * self->_cellLteRSRQ;
    if ((v26 & 0x10000) != 0) {
      goto LABEL_109;
    }
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v58 = 0;
  if ((v26 & 0x10000) != 0)
  {
LABEL_109:
    uint64_t v57 = 2654435761 * self->_cellNrRSRP;
    if ((v26 & 0x20000) != 0) {
      goto LABEL_110;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v57 = 0;
  if ((v26 & 0x20000) != 0)
  {
LABEL_110:
    uint64_t v56 = 2654435761 * self->_cellNrRSRQ;
    if ((v26 & 0x40000) != 0) {
      goto LABEL_111;
    }
    goto LABEL_130;
  }
LABEL_129:
  uint64_t v56 = 0;
  if ((v26 & 0x40000) != 0)
  {
LABEL_111:
    uint64_t v55 = 2654435761 * self->_cellNrSNR;
    if ((v26 & 0x100) != 0) {
      goto LABEL_112;
    }
    goto LABEL_131;
  }
LABEL_130:
  uint64_t v55 = 0;
  if ((v26 & 0x100) != 0)
  {
LABEL_112:
    uint64_t v54 = 2654435761 * self->_cellDataLQM;
    if ((v26 & 0x400000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_132;
  }
LABEL_131:
  uint64_t v54 = 0;
  if ((v26 & 0x400000) != 0)
  {
LABEL_113:
    uint64_t v53 = 2654435761 * self->_cellRrcState;
    if ((v26 & 0x80000) != 0) {
      goto LABEL_114;
    }
    goto LABEL_133;
  }
LABEL_132:
  uint64_t v53 = 0;
  if ((v26 & 0x80000) != 0)
  {
LABEL_114:
    uint64_t v52 = 2654435761 * self->_cellNsaFR1;
    if ((v26 & 0x100000) != 0) {
      goto LABEL_115;
    }
    goto LABEL_134;
  }
LABEL_133:
  uint64_t v52 = 0;
  if ((v26 & 0x100000) != 0)
  {
LABEL_115:
    uint64_t v51 = 2654435761 * self->_cellNsaFR2;
    if ((v26 & 0x800000) != 0) {
      goto LABEL_116;
    }
    goto LABEL_135;
  }
LABEL_134:
  uint64_t v51 = 0;
  if ((v26 & 0x800000) != 0)
  {
LABEL_116:
    uint64_t v50 = 2654435761 * self->_cellTotalDlBW;
    if ((v26 & 0x1000000) != 0) {
      goto LABEL_117;
    }
    goto LABEL_136;
  }
LABEL_135:
  uint64_t v50 = 0;
  if ((v26 & 0x1000000) != 0)
  {
LABEL_117:
    uint64_t v49 = 2654435761 * self->_cellTotalUlBW;
    if ((v26 & 0x80) != 0) {
      goto LABEL_118;
    }
    goto LABEL_137;
  }
LABEL_136:
  uint64_t v49 = 0;
  if ((v26 & 0x80) != 0)
  {
LABEL_118:
    uint64_t v48 = 2654435761 * self->_cellBssLoad;
    if ((v26 & 0x2000) != 0) {
      goto LABEL_119;
    }
    goto LABEL_138;
  }
LABEL_137:
  uint64_t v48 = 0;
  if ((v26 & 0x2000) != 0)
  {
LABEL_119:
    uint64_t v47 = 2654435761 * self->_cellMaxDlCaNumConf;
    if ((v26 & 0x4000) != 0) {
      goto LABEL_120;
    }
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v47 = 0;
  if ((v26 & 0x4000) != 0)
  {
LABEL_120:
    uint64_t v46 = 2654435761 * self->_cellMaxUlCaNumConf;
    if ((v26 & 0x200) != 0) {
      goto LABEL_121;
    }
    goto LABEL_140;
  }
LABEL_139:
  uint64_t v46 = 0;
  if ((v26 & 0x200) != 0)
  {
LABEL_121:
    uint64_t v45 = 2654435761 * self->_cellEstimatedBW;
    if ((v26 & 0x200000) != 0) {
      goto LABEL_122;
    }
    goto LABEL_141;
  }
LABEL_140:
  uint64_t v45 = 0;
  if ((v26 & 0x200000) != 0)
  {
LABEL_122:
    uint64_t v44 = 2654435761 * self->_cellPMax;
    if ((v26 & 0x200000000000000) != 0) {
      goto LABEL_123;
    }
LABEL_142:
    uint64_t v27 = 0;
    if ((v26 & 0x100000000000000) != 0) {
      goto LABEL_124;
    }
    goto LABEL_143;
  }
LABEL_141:
  uint64_t v44 = 0;
  if ((v26 & 0x200000000000000) == 0) {
    goto LABEL_142;
  }
LABEL_123:
  uint64_t v27 = 2654435761 * self->_cellIsRoaming;
  if ((v26 & 0x100000000000000) != 0)
  {
LABEL_124:
    uint64_t v28 = 2654435761 * self->_cellIsNoService;
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v28 = 0;
LABEL_144:
  if ((v26 & 0x80000000000000) != 0) {
    uint64_t v29 = 2654435761 * self->_cellIsLimitedService;
  }
  else {
    uint64_t v29 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_ftIRATRecommendation hash];
  NSUInteger v31 = [(NSString *)self->_ftIRATRecommendationReason hash];
  uint64_t v32 = (uint64_t)self->_flags;
  if ((v32 & 0x200000000) != 0)
  {
    uint64_t v33 = 2654435761 * self->_ftFacetimePacketLoss;
    if ((v32 & 0x100000000) != 0) {
      goto LABEL_149;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((v32 & 0x100000000) != 0)
    {
LABEL_149:
      uint64_t v34 = 2654435761 * self->_ftFacetimeAction;
      goto LABEL_152;
    }
  }
  uint64_t v34 = 0;
LABEL_152:
  __int16 v35 = *((_WORD *)&self->_flags + 4);
  if ((v32 & 0x400000000) != 0)
  {
    uint64_t v36 = 2654435761 * self->_ftFacetimeTimeDelay;
    if ((v32 & 0x80000000) != 0)
    {
LABEL_154:
      uint64_t v37 = 2654435761 * self->_ftCounter;
      if (v35) {
        goto LABEL_155;
      }
      goto LABEL_162;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((v32 & 0x80000000) != 0) {
      goto LABEL_154;
    }
  }
  uint64_t v37 = 0;
  if (v35)
  {
LABEL_155:
    uint64_t v38 = 2654435761 * self->_wrmAlertedMode;
    if ((v35 & 4) != 0) {
      goto LABEL_156;
    }
    goto LABEL_163;
  }
LABEL_162:
  uint64_t v38 = 0;
  if ((v35 & 4) != 0)
  {
LABEL_156:
    uint64_t v39 = 2654435761 * self->_wrmIsStallDetected;
    if ((v35 & 2) != 0) {
      goto LABEL_157;
    }
    goto LABEL_164;
  }
LABEL_163:
  uint64_t v39 = 0;
  if ((v35 & 2) != 0)
  {
LABEL_157:
    uint64_t v40 = 2654435761 * self->_wrmIsPCDetected;
    if ((v32 & 0x40000000000000) != 0) {
      goto LABEL_158;
    }
LABEL_165:
    uint64_t v41 = 0;
    if ((v32 & 0x20000000000000) != 0) {
      goto LABEL_159;
    }
LABEL_166:
    uint64_t v42 = 0;
    return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v92 ^ v91 ^ v10 ^ v15 ^ v90 ^ v89 ^ v88 ^ v93 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v33 ^ v34 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ [(GEOLocation *)self->_location hash];
  }
LABEL_164:
  uint64_t v40 = 0;
  if ((v32 & 0x40000000000000) == 0) {
    goto LABEL_165;
  }
LABEL_158:
  uint64_t v41 = 2654435761 * self->_wrmVideoErasure;
  if ((v32 & 0x20000000000000) == 0) {
    goto LABEL_166;
  }
LABEL_159:
  uint64_t v42 = 2654435761 * self->_wrmAudioErasure;
  return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v92 ^ v91 ^ v10 ^ v15 ^ v90 ^ v89 ^ v88 ^ v93 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v33 ^ v34 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ [(GEOLocation *)self->_location hash];
}

- (void)mergeFrom:(id)a3
{
  double v17 = (char *)a3;
  [v17 readAll:0];
  uint64_t v4 = v17;
  uint64_t v5 = (uint64_t *)(v17 + 360);
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x4000000000) != 0)
  {
    self->_motionState = *((_DWORD *)v17 + 70);
    *(void *)&self->_flags |= 0x4000000000uLL;
    uint64_t v6 = *v5;
    if ((*v5 & 0x2000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x8000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x2000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_messageType = *((_DWORD *)v17 + 69);
  *(void *)&self->_flags |= 0x2000000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_connectionType = *((_DWORD *)v17 + 59);
  *(void *)&self->_flags |= 0x8000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_messageTrigger = *((_DWORD *)v17 + 68);
  *(void *)&self->_flags |= 0x1000000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_environment = *((_DWORD *)v17 + 62);
  *(void *)&self->_flags |= 0x40000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 4) == 0)
  {
LABEL_7:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_timeOfDay = *((void *)v17 + 14);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_connectionDuration = *((_DWORD *)v17 + 58);
  *(void *)&self->_flags |= 0x4000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_9:
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_isEmergency = v17[353];
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  uint64_t v6 = *((void *)v17 + 45);
  if ((v6 & 1) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_103:
  self->_bytesDlTotal = *((void *)v17 + 2);
  *(void *)&self->_flags |= 1uLL;
  if ((*((void *)v17 + 45) & 2) != 0)
  {
LABEL_11:
    self->_bytesUlTotal = *((void *)v17 + 3);
    *(void *)&self->_flags |= 2uLL;
  }
LABEL_12:
  if (*((void *)v17 + 4))
  {
    -[GEOCellConnectionQuality setCallID:](self, "setCallID:");
    uint64_t v4 = v17;
  }
  long double v7 = (uint64_t *)(v4 + 360);
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x800000000000000) != 0)
  {
    self->_isCallFailed = v4[352];
    *(void *)&self->_flags |= 0x800000000000000uLL;
    uint64_t v8 = *v7;
    if ((*v7 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x10000000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_107;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  self->_float dlPeakThroughput = *((float *)v4 + 61);
  *(void *)&self->_flags |= 0x20000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_float ulPeakThroughput = *((float *)v4 + 72);
  *(void *)&self->_flags |= 0x10000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x8000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_float dlMedThroughput = *((float *)v4 + 60);
  *(void *)&self->_flags |= 0x10000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v8 & 0x4000000000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_float ulMedThroughput = *((float *)v4 + 71);
  *(void *)&self->_flags |= 0x8000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000000000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_lowInternetUL = v4[355];
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_lowInternetDL = v4[354];
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v8 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_latency = *((_DWORD *)v4 + 67);
  *(void *)&self->_flags |= 0x800000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 8) == 0)
  {
LABEL_23:
    if ((v8 & 0x8000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_wifiRssi = *((void *)v4 + 15);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_wifiTxPER = *((_DWORD *)v4 + 83);
  *(void *)&self->_flags |= 0x8000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x10) == 0)
  {
LABEL_25:
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_wifiSNR = *((void *)v4 + 16);
  *(void *)&self->_flags |= 0x10uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_wifiCaptiveNetworks = v4[356];
  *(void *)&self->_flags |= 0x8000000000000000;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 0x200000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_wifiRxRetry = *((_DWORD *)v4 + 81);
  *(void *)&self->_flags |= 0x2000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x10000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_wifiEstimatedBW = *((_DWORD *)v4 + 77);
  *(void *)&self->_flags |= 0x200000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_29:
    if ((v8 & 0x1000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_wifiTxPhyRate = *((_DWORD *)v4 + 84);
  *(void *)&self->_flags |= 0x10000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_30:
    if ((v8 & 0x800000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_wifiRxPhyRate = *((_DWORD *)v4 + 80);
  *(void *)&self->_flags |= 0x1000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_31:
    if ((v8 & 0x40000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_wifiQbssLoad = *((_DWORD *)v4 + 79);
  *(void *)&self->_flags |= 0x800000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x4000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_wifiCca = *((_DWORD *)v4 + 74);
  *(void *)&self->_flags |= 0x40000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_wifiStationCount = *((_DWORD *)v4 + 82);
  *(void *)&self->_flags |= 0x4000000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v8 & 0x100000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_wifiBand = *((_DWORD *)v4 + 73);
  *(void *)&self->_flags |= 0x20000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x80000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_wifiChannel = *((_DWORD *)v4 + 76);
  *(void *)&self->_flags |= 0x100000000000uLL;
  uint64_t v8 = *((void *)v4 + 45);
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x400000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_126:
  self->_wifiChannelWidth = *((_DWORD *)v4 + 75);
  *(void *)&self->_flags |= 0x80000000000uLL;
  if ((*((void *)v4 + 45) & 0x400000000000) != 0)
  {
LABEL_37:
    self->_wifiPhyMode = *((_DWORD *)v4 + 78);
    *(void *)&self->_flags |= 0x400000000000uLL;
  }
LABEL_38:
  if (*((void *)v4 + 5))
  {
    -[GEOCellConnectionQuality setCellGCI:](self, "setCellGCI:");
    uint64_t v4 = v17;
  }
  if (*((void *)v4 + 7))
  {
    -[GEOCellConnectionQuality setCellHomePLMN:](self, "setCellHomePLMN:");
    uint64_t v4 = v17;
  }
  if (*((void *)v4 + 6))
  {
    -[GEOCellConnectionQuality setCellHomePLMN2:](self, "setCellHomePLMN2:");
    uint64_t v4 = v17;
  }
  if (*((void *)v4 + 10))
  {
    -[GEOCellConnectionQuality setCellServiceProvider:](self, "setCellServiceProvider:");
    uint64_t v4 = v17;
  }
  if (*((void *)v4 + 9))
  {
    -[GEOCellConnectionQuality setCellServiceProvider2:](self, "setCellServiceProvider2:");
    uint64_t v4 = v17;
  }
  unint64_t v9 = (uint64_t *)(v4 + 360);
  uint64_t v10 = *((void *)v4 + 45);
  if ((v10 & 0x2000000) != 0)
  {
    self->_cellVoiceLQM = *((_DWORD *)v4 + 57);
    *(void *)&self->_flags |= 0x2000000uLL;
    uint64_t v10 = *v9;
    if ((*v9 & 0x400000000000000) == 0)
    {
LABEL_50:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_130;
    }
  }
  else if ((v10 & 0x400000000000000) == 0)
  {
    goto LABEL_50;
  }
  self->_cellNpnStatus = v4[351];
  *(void *)&self->_flags |= 0x400000000000000uLL;
  uint64_t v10 = *((void *)v4 + 45);
  if ((v10 & 0x8000) == 0)
  {
LABEL_51:
    if ((v10 & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_cellNpn = *((_DWORD *)v4 + 47);
  *(void *)&self->_flags |= 0x8000uLL;
  uint64_t v10 = *((void *)v4 + 45);
  if ((v10 & 0x20) == 0)
  {
LABEL_52:
    if ((v10 & 0x40) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_131:
  self->_cellArfcn = *((_DWORD *)v4 + 37);
  *(void *)&self->_flags |= 0x20uLL;
  if ((*((void *)v4 + 45) & 0x40) != 0)
  {
LABEL_53:
    self->_cellBand = *((_DWORD *)v4 + 38);
    *(void *)&self->_flags |= 0x40uLL;
  }
LABEL_54:
  if (*((void *)v4 + 8))
  {
    -[GEOCellConnectionQuality setCellRatType:](self, "setCellRatType:");
    uint64_t v4 = v17;
  }
  uint64_t v11 = (uint64_t *)(v4 + 360);
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x400) != 0)
  {
    self->_cellLteRSRP = *((_DWORD *)v4 + 42);
    *(void *)&self->_flags |= 0x400uLL;
    uint64_t v12 = *v11;
    if ((*v11 & 0x1000) == 0)
    {
LABEL_58:
      if ((v12 & 0x800) == 0) {
        goto LABEL_59;
      }
      goto LABEL_135;
    }
  }
  else if ((v12 & 0x1000) == 0)
  {
    goto LABEL_58;
  }
  self->_cellLteSNR = *((_DWORD *)v4 + 44);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x800) == 0)
  {
LABEL_59:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_cellLteRSRQ = *((_DWORD *)v4 + 43);
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x10000) == 0)
  {
LABEL_60:
    if ((v12 & 0x20000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_cellNrRSRP = *((_DWORD *)v4 + 48);
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x20000) == 0)
  {
LABEL_61:
    if ((v12 & 0x40000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_cellNrRSRQ = *((_DWORD *)v4 + 49);
  *(void *)&self->_flags |= 0x20000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x40000) == 0)
  {
LABEL_62:
    if ((v12 & 0x100) == 0) {
      goto LABEL_63;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_cellNrSNR = *((_DWORD *)v4 + 50);
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x100) == 0)
  {
LABEL_63:
    if ((v12 & 0x400000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_cellDataLQM = *((_DWORD *)v4 + 40);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x400000) == 0)
  {
LABEL_64:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_cellRrcState = *((_DWORD *)v4 + 54);
  *(void *)&self->_flags |= 0x400000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x80000) == 0)
  {
LABEL_65:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_cellNsaFR1 = *((_DWORD *)v4 + 51);
  *(void *)&self->_flags |= 0x80000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x100000) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_cellNsaFR2 = *((_DWORD *)v4 + 52);
  *(void *)&self->_flags |= 0x100000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x800000) == 0)
  {
LABEL_67:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_cellTotalDlBW = *((_DWORD *)v4 + 55);
  *(void *)&self->_flags |= 0x800000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x1000000) == 0)
  {
LABEL_68:
    if ((v12 & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_cellTotalUlBW = *((_DWORD *)v4 + 56);
  *(void *)&self->_flags |= 0x1000000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x80) == 0)
  {
LABEL_69:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_cellBssLoad = *((_DWORD *)v4 + 39);
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x2000) == 0)
  {
LABEL_70:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_cellMaxDlCaNumConf = *((_DWORD *)v4 + 45);
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x4000) == 0)
  {
LABEL_71:
    if ((v12 & 0x200) == 0) {
      goto LABEL_72;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_cellMaxUlCaNumConf = *((_DWORD *)v4 + 46);
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x200) == 0)
  {
LABEL_72:
    if ((v12 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_cellEstimatedBW = *((_DWORD *)v4 + 41);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x200000) == 0)
  {
LABEL_73:
    if ((v12 & 0x200000000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_cellPMax = *((_DWORD *)v4 + 53);
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_74:
    if ((v12 & 0x100000000000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_cellIsRoaming = v4[350];
  *(void *)&self->_flags |= 0x200000000000000uLL;
  uint64_t v12 = *((void *)v4 + 45);
  if ((v12 & 0x100000000000000) == 0)
  {
LABEL_75:
    if ((v12 & 0x80000000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_151:
  self->_cellIsNoService = v4[349];
  *(void *)&self->_flags |= 0x100000000000000uLL;
  if ((*((void *)v4 + 45) & 0x80000000000000) != 0)
  {
LABEL_76:
    self->_cellIsLimitedService = v4[348];
    *(void *)&self->_flags |= 0x80000000000000uLL;
  }
LABEL_77:
  if (*((void *)v4 + 12))
  {
    -[GEOCellConnectionQuality setFtIRATRecommendation:](self, "setFtIRATRecommendation:");
    uint64_t v4 = v17;
  }
  if (*((void *)v4 + 11))
  {
    -[GEOCellConnectionQuality setFtIRATRecommendationReason:](self, "setFtIRATRecommendationReason:");
    uint64_t v4 = v17;
  }
  uint64_t v13 = *((void *)v4 + 45);
  if ((v13 & 0x200000000) != 0)
  {
    self->_ftFacetimePacketLoss = *((_DWORD *)v4 + 65);
    *(void *)&self->_flags |= 0x200000000uLL;
    uint64_t v13 = *((void *)v4 + 45);
  }
  __int16 v14 = *((_WORD *)v4 + 184);
  if ((v13 & 0x100000000) != 0)
  {
    self->_ftFacetimeAction = *((_DWORD *)v4 + 64);
    *(void *)&self->_flags |= 0x100000000uLL;
    uint64_t v13 = *((void *)v4 + 45);
    __int16 v14 = *((_WORD *)v4 + 184);
    if ((v13 & 0x400000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x80000000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_155;
    }
  }
  else if ((v13 & 0x400000000) == 0)
  {
    goto LABEL_85;
  }
  self->_ftFacetimeTimeDelay = *((_DWORD *)v4 + 66);
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v13 = *((void *)v4 + 45);
  __int16 v14 = *((_WORD *)v4 + 184);
  if ((v13 & 0x80000000) == 0)
  {
LABEL_86:
    if ((v14 & 1) == 0) {
      goto LABEL_87;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_ftCounter = *((_DWORD *)v4 + 63);
  *(void *)&self->_flags |= 0x80000000uLL;
  uint64_t v13 = *((void *)v4 + 45);
  __int16 v14 = *((_WORD *)v4 + 184);
  if ((v14 & 1) == 0)
  {
LABEL_87:
    if ((v14 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_157;
  }
LABEL_156:
  self->_wrmAlertedMode = v4[357];
  *((_WORD *)&self->_flags + 4) |= 1u;
  uint64_t v13 = *((void *)v4 + 45);
  __int16 v14 = *((_WORD *)v4 + 184);
  if ((v14 & 4) == 0)
  {
LABEL_88:
    if ((v14 & 2) == 0) {
      goto LABEL_89;
    }
    goto LABEL_158;
  }
LABEL_157:
  self->_wrmIsStallDetected = v4[359];
  *((_WORD *)&self->_flags + 4) |= 4u;
  uint64_t v13 = *((void *)v4 + 45);
  if ((*((_WORD *)v4 + 184) & 2) == 0)
  {
LABEL_89:
    if ((v13 & 0x40000000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_159;
  }
LABEL_158:
  self->_wrmIsPCDetected = v4[358];
  *((_WORD *)&self->_flags + 4) |= 2u;
  uint64_t v13 = *((void *)v4 + 45);
  if ((v13 & 0x40000000000000) == 0)
  {
LABEL_90:
    if ((v13 & 0x20000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_159:
  self->_wrmVideoErasure = *((_DWORD *)v4 + 86);
  *(void *)&self->_flags |= 0x40000000000000uLL;
  if ((*((void *)v4 + 45) & 0x20000000000000) != 0)
  {
LABEL_91:
    self->_wrmAudioErasure = *((_DWORD *)v4 + 85);
    *(void *)&self->_flags |= 0x20000000000000uLL;
  }
LABEL_92:
  location = self->_location;
  uint64_t v16 = *((void *)v4 + 13);
  if (location)
  {
    if (!v16) {
      goto LABEL_164;
    }
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_164;
    }
    -[GEOCellConnectionQuality setLocation:](self, "setLocation:");
  }
  uint64_t v4 = v17;
LABEL_164:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ftIRATRecommendation, 0);
  objc_storeStrong((id *)&self->_ftIRATRecommendationReason, 0);
  objc_storeStrong((id *)&self->_cellServiceProvider, 0);
  objc_storeStrong((id *)&self->_cellServiceProvider2, 0);
  objc_storeStrong((id *)&self->_cellRatType, 0);
  objc_storeStrong((id *)&self->_cellHomePLMN, 0);
  objc_storeStrong((id *)&self->_cellHomePLMN2, 0);
  objc_storeStrong((id *)&self->_cellGCI, 0);
  objc_storeStrong((id *)&self->_callID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end